import { NextRequest, NextResponse } from 'next/server'
import { supabase } from '@/lib/supabase'
import type { PriceRecommendation } from '@/types/database'

// GET /api/price-recommendations - Get price recommendations for a variety
export async function GET(request: NextRequest) {
  const { searchParams } = new URL(request.url)
  const varietyId = searchParams.get('variety_id')
  const region = searchParams.get('region') || 'default'
  const qualityGrade = searchParams.get('quality_grade') || 'A'

  if (!varietyId) {
    return NextResponse.json({ error: 'Variety ID is required' }, { status: 400 })
  }

  if (!supabase) {
    return NextResponse.json({ error: 'Database connection not available' }, { status: 500 })
  }

  try {
    // Call the price recommendation function
    const { data: recommendations, error } = await supabase.rpc('get_price_recommendations', {
      p_variety_id: varietyId,
      p_region: region,
      p_quality_grade: qualityGrade,
    })

    if (error) {
      console.error('Error getting price recommendations:', error)
      return NextResponse.json({ error: 'Failed to get price recommendations' }, { status: 500 })
    }

    // If no specific recommendations, get general market data
    if (!recommendations || recommendations.length === 0) {
      const { data: marketData, error: marketError } = await supabase
        .from('market_pricing')
        .select('*')
        .eq('variety_id', varietyId)
        .eq('quality_grade', qualityGrade)
        .order('last_updated', { ascending: false })
        .limit(1)

      if (marketError) {
        console.error('Error getting market data:', marketError)
      }

      if (marketData && marketData.length > 0) {
        const market = marketData[0]
        return NextResponse.json({
          recommendations: [
            {
              recommended_price: market.average_price,
              market_average: market.average_price,
              price_range_low: market.price_range_low,
              price_range_high: market.price_range_high,
              confidence_level: 'low',
            },
          ],
        })
      }

      return NextResponse.json({
        recommendations: [],
        message: 'No market data available for this variety',
      })
    }

    return NextResponse.json({ recommendations })
  } catch (error) {
    console.error('Error in GET /api/price-recommendations:', error)
    return NextResponse.json({ error: 'Internal server error' }, { status: 500 })
  }
}

// POST /api/price-recommendations - Update market pricing data
export async function POST(request: NextRequest) {
  if (!supabase) {
    return NextResponse.json({ error: 'Database connection not available' }, { status: 500 })
  }

  try {
    const body = await request.json()
    const {
      variety_id,
      region,
      average_price,
      price_range_low,
      price_range_high,
      unit = 'lbs',
      quality_grade = 'A',
      sample_size = 1,
      data_source,
    } = body

    if (!variety_id || !region || !average_price) {
      return NextResponse.json(
        {
          error: 'Missing required fields: variety_id, region, average_price',
        },
        { status: 400 }
      )
    }

    // Check if market pricing already exists for this variety/region/grade
    const { data: existing, error: checkError } = await supabase
      .from('market_pricing')
      .select('id')
      .eq('variety_id', variety_id)
      .eq('region', region)
      .eq('quality_grade', quality_grade)
      .single()

    if (checkError && checkError.code !== 'PGRST116') {
      // PGRST116 = no rows returned
      console.error('Error checking existing market pricing:', checkError)
      return NextResponse.json({ error: 'Database error' }, { status: 500 })
    }

    let result
    if (existing) {
      // Update existing record
      const { data, error } = await supabase
        .from('market_pricing')
        .update({
          average_price,
          price_range_low,
          price_range_high,
          unit,
          sample_size,
          data_source,
          last_updated: new Date().toISOString(),
        })
        .eq('id', existing.id)
        .select()
        .single()

      if (error) {
        console.error('Error updating market pricing:', error)
        return NextResponse.json({ error: 'Failed to update market pricing' }, { status: 500 })
      }
      result = data
    } else {
      // Create new record
      const { data, error } = await supabase
        .from('market_pricing')
        .insert({
          variety_id,
          region,
          average_price,
          price_range_low,
          price_range_high,
          unit,
          quality_grade,
          sample_size,
          data_source,
        })
        .select()
        .single()

      if (error) {
        console.error('Error creating market pricing:', error)
        return NextResponse.json({ error: 'Failed to create market pricing' }, { status: 500 })
      }
      result = data
    }

    return NextResponse.json({
      message: 'Market pricing updated successfully',
      data: result,
    })
  } catch (error) {
    console.error('Error in POST /api/price-recommendations:', error)
    return NextResponse.json({ error: 'Internal server error' }, { status: 500 })
  }
}
