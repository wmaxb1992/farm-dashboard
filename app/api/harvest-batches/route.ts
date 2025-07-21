import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseAdmin } from '@/lib/supabase'

export async function GET(request: NextRequest) {
  try {
    const supabase = getSupabaseAdmin()
    const { searchParams } = new URL(request.url)
    const farmId = searchParams.get('farm_id')
    const status = searchParams.get('status') // 'projected', 'actual', 'all'
    const plantingId = searchParams.get('planting_id')

    // Query harvest_batches with variety and pricing information
    let query = supabase.from('harvest_batches').select(`
        *,
        varieties!inner(name),
        batch_pricing(current_price)
      `)

    if (farmId) {
      query = query.eq('farm_id', farmId)
    }

    if (status && status !== 'all') {
      // Map status to whether harvest_date is null
      if (status === 'projected') {
        query = query.is('harvest_date', null)
      } else if (status === 'actual') {
        query = query.not('harvest_date', 'is', null)
      }
    }

    if (plantingId) {
      query = query.eq('planting_id', plantingId)
    }

    query = query.order('created_at', { ascending: false })

    const { data, error } = await query

    if (error) {
      return NextResponse.json({ error: error.message }, { status: 400 })
    }

    // Transform data to match expected format
    const transformedData = (data || []).map(batch => ({
      id: batch.id,
      batch_number: batch.batch_number,
      variety_name: (batch as any).varieties?.name || 'Unknown',
      harvest_date: batch.harvest_date || batch.expected_harvest_date,
      quantity_harvested: batch.quantity_harvested || 0,
      unit: batch.unit || 'lbs',
      quality_grade: batch.quality_grade || 'A',
      status: batch.harvest_date ? 'actual' : 'projected',
      current_price: (batch as any).batch_pricing?.[0]?.current_price || 0,
      quantity_available: batch.quantity_available || batch.quantity_harvested || 0,
      quantity_reserved: batch.quantity_reserved || 0,
      quantity_sold: batch.quantity_sold || 0,
      quantity_expired: batch.quantity_expired || 0,
      organic: batch.organic || false,
      notes: batch.harvest_notes,
    }))

    return NextResponse.json({
      batches: transformedData,
      total: transformedData.length,
    })
  } catch (error) {
    return NextResponse.json({ error: 'Failed to fetch harvest batches' }, { status: 500 })
  }
}

export async function POST(request: NextRequest) {
  try {
    const body = await request.json()

    // In a real implementation, this would save to database
    const newBatch = {
      id: Date.now().toString(),
      batch_number: `${body.variety_name?.substring(0, 3).toUpperCase()}-${new Date().toISOString().slice(2, 10).replace(/-/g, '')}-${Math.random().toString(36).substring(2, 3).toUpperCase()}`,
      ...body,
      quantity_available: body.quantity_harvested || 0,
      quantity_reserved: 0,
      quantity_sold: 0,
      quantity_expired: 0,
    }

    return NextResponse.json(newBatch, { status: 201 })
  } catch (error) {
    return NextResponse.json({ error: 'Failed to create harvest batch' }, { status: 500 })
  }
}
