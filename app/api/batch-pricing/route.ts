import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseAdmin } from '@/lib/supabase'

export async function GET(request: NextRequest) {
  try {
    const supabase = getSupabaseAdmin()
    const { searchParams } = new URL(request.url)
    const farmId = searchParams.get('farm_id')
    const batchId = searchParams.get('batch_id')

    // Query harvest_batches with variety information and calculate pricing
    let query = supabase.from('harvest_batches').select(`
        *,
        varieties!inner(name),
        batch_pricing(
          id,
          base_price,
          current_price,
          price_per_unit,
          discount_percentage,
          discount_reason,
          auto_discount_enabled,
          minimum_order_quantity,
          bulk_discount_threshold,
          bulk_discount_percentage,
          age_discount_start_days,
          age_discount_percentage_per_day,
          grade_discount_b,
          grade_discount_c,
          created_at,
          updated_at
        )
      `)

    if (farmId) {
      query = query.eq('farm_id', farmId)
    }

    if (batchId) {
      query = query.eq('id', batchId)
    }

    // Only get actual harvests (not projected ones)
    query = query.not('harvest_date', 'is', null)
    query = query.order('harvest_date', { ascending: false })

    const { data, error } = await query

    if (error) {
      console.error('Error fetching batch pricing:', error)
      return NextResponse.json({ error: error.message }, { status: 400 })
    }

    // Transform data to pricing format with calculated pricing
    const pricingData = (data || []).map((batch: any) => {
      // Safe date parsing
      const harvestDate = batch.harvest_date ? new Date(batch.harvest_date) : new Date()
      const now = new Date()
      const ageDays = Math.floor((now.getTime() - harvestDate.getTime()) / (1000 * 60 * 60 * 24))

      // Get existing pricing if available
      const existingPricing = batch.batch_pricing?.[0]
      
      // Base pricing logic - can be adjusted based on variety, quality, etc.
      const basePrice = existingPricing?.base_price || 
        (batch.quality_grade === 'A' ? 8.5 : batch.quality_grade === 'B' ? 6.5 : 4.5)

      // Calculate discount based on age (freshness decay) if auto-discount is enabled
      let discountPercentage = existingPricing?.discount_percentage || 0
      const autoDiscountEnabled = existingPricing?.auto_discount_enabled ?? true
      
      if (autoDiscountEnabled && !existingPricing?.discount_percentage) {
        const startDays = existingPricing?.age_discount_start_days || 3
        const percentPerDay = existingPricing?.age_discount_percentage_per_day || 2
        
        if (ageDays > 7) {
          discountPercentage = Math.min(30, (ageDays - 7) * 5) // 5% per day after week 1
        } else if (ageDays > startDays) {
          discountPercentage = (ageDays - startDays) * percentPerDay
        }
      }

      const currentPrice = existingPricing?.current_price || basePrice * (1 - discountPercentage / 100)
      const pricePerUnit = existingPricing?.price_per_unit || currentPrice
      const freshnessScore = Math.max(0, 100 - ageDays * 8) // Decline by 8% per day

      return {
        id: batch.id,
        batch_id: batch.id,
        batch_number: batch.batch_number,
        variety_name: batch.varieties?.name || 'Unknown',
        base_price: basePrice,
        current_price: currentPrice,
        price_per_unit: pricePerUnit,
        final_price: pricePerUnit,
        discount_percentage: discountPercentage,
        calculated_discount_percentage: discountPercentage,
        discount_reason: existingPricing?.discount_reason || (autoDiscountEnabled ? 'Auto-freshness discount' : null),
        age_days: ageDays,
        quality_grade: batch.quality_grade || 'A',
        harvest_date: batch.harvest_date,
        auto_discount_enabled: autoDiscountEnabled,
        freshness_score: freshnessScore,
        quantity_available: batch.quantity_harvested || 0,
        pricing_id: existingPricing?.id || null,
        minimum_order_quantity: existingPricing?.minimum_order_quantity || 1,
        bulk_discount_threshold: existingPricing?.bulk_discount_threshold || null,
        bulk_discount_percentage: existingPricing?.bulk_discount_percentage || null,
      }
    })

    return NextResponse.json({
      pricing: pricingData,
      total: pricingData.length,
    })
  } catch (error) {
    console.error('Error fetching batch pricing:', error)
    return NextResponse.json({ error: 'Failed to fetch batch pricing' }, { status: 500 })
  }
}

export async function POST(request: NextRequest) {
  try {
    const supabase = getSupabaseAdmin()
    const body = await request.json()
    const {
      batch_id,
      base_price,
      current_price,
      price_per_unit,
      discount_percentage = 0,
      discount_reason,
      auto_discount_enabled = true,
      minimum_order_quantity = 1,
      bulk_discount_threshold,
      bulk_discount_percentage,
      age_discount_start_days = 3,
      age_discount_percentage_per_day = 2,
      grade_discount_b = 15,
      grade_discount_c = 30,
    } = body

    // Validate required fields
    if (!batch_id || !base_price || !current_price || !price_per_unit) {
      return NextResponse.json({ error: 'batch_id, base_price, current_price, and price_per_unit are required' }, { status: 400 })
    }

    const { data, error } = await supabase
      .from('batch_pricing')
      .insert({
        batch_id,
        base_price,
        current_price,
        price_per_unit,
        discount_percentage,
        discount_reason,
        auto_discount_enabled,
        minimum_order_quantity,
        bulk_discount_threshold,
        bulk_discount_percentage,
        age_discount_start_days,
        age_discount_percentage_per_day,
        grade_discount_b,
        grade_discount_c,
      })
      .select()
      .single()

    if (error) {
      console.error('Error creating batch pricing:', error)
      return NextResponse.json({ error: error.message }, { status: 400 })
    }

    return NextResponse.json(data, { status: 201 })
  } catch (error) {
    console.error('Error creating batch pricing:', error)
    return NextResponse.json({ error: 'Failed to create batch pricing' }, { status: 500 })
  }
}

export async function PUT(request: NextRequest) {
  try {
    const supabase = getSupabaseAdmin()
    const body = await request.json()
    const { id, ...updates } = body

    // Validate required fields
    if (!id) {
      return NextResponse.json({ error: 'id is required' }, { status: 400 })
    }

    const { data, error } = await supabase
      .from('batch_pricing')
      .update(updates)
      .eq('id', id)
      .select()
      .single()

    if (error) {
      console.error('Error updating batch pricing:', error)
      return NextResponse.json({ error: error.message }, { status: 400 })
    }

    return NextResponse.json(data)
  } catch (error) {
    console.error('Error updating batch pricing:', error)
    return NextResponse.json({ error: 'Failed to update batch pricing' }, { status: 500 })
  }
}
