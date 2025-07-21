import { NextRequest, NextResponse } from 'next/server'
import { supabase } from '@/lib/supabase'
import type { BatchInventoryStatus, BatchCurrentPricing } from '@/types/database'

// GET /api/batches - Get all batches for a farm with pricing and inventory status
export async function GET(request: NextRequest) {
  const { searchParams } = new URL(request.url)
  const farmId = searchParams.get('farm_id')
  const status = searchParams.get('status') // available, sold_out, etc.
  const variety = searchParams.get('variety_id')

  if (!farmId) {
    return NextResponse.json({ error: 'Farm ID is required' }, { status: 400 })
  }

  if (!supabase) {
    return NextResponse.json({ error: 'Database connection not available' }, { status: 500 })
  }

  try {
    let query = supabase
      .from('batch_inventory_status')
      .select(
        `
        *,
        variety:varieties(
          id,
          name,
          emoji,
          subcategory:subcategories(
            id,
            name,
            category:categories(id, name)
          )
        )
      `
      )
      .eq('farm_id', farmId)
      .order('harvest_date', { ascending: false })

    if (status) {
      query = query.eq('status', status)
    }

    if (variety) {
      query = query.eq('variety_id', variety)
    }

    const { data: batches, error } = await query

    if (error) {
      console.error('Error fetching batches:', error)
      return NextResponse.json({ error: 'Failed to fetch batches' }, { status: 500 })
    }

    // Get pricing information for each batch
    const batchIds = batches?.map((batch: any) => batch.id) || []

    const { data: pricing, error: pricingError } = await supabase
      .from('batch_current_pricing')
      .select('*')
      .in('batch_id', batchIds)

    if (pricingError) {
      console.error('Error fetching batch pricing:', pricingError)
    }

    // Merge pricing data with batch data
    const batchesWithPricing = batches?.map((batch: any) => ({
      ...batch,
      pricing: pricing?.find((p: any) => p.batch_id === batch.id) || null,
    }))

    return NextResponse.json({ batches: batchesWithPricing })
  } catch (error) {
    console.error('Error in GET /api/batches:', error)
    return NextResponse.json({ error: 'Internal server error' }, { status: 500 })
  }
}

// POST /api/batches - Create a new harvest batch
export async function POST(request: NextRequest) {
  try {
    const body = await request.json()
    const {
      farm_id,
      variety_id,
      batch_number,
      harvest_date,
      quantity_harvested,
      unit = 'lbs',
      quality_grade = 'A',
      organic = false,
      location_in_farm,
      harvest_notes,
      base_price,
      auto_discount_enabled = true,
    } = body

    if (
      !farm_id ||
      !variety_id ||
      !batch_number ||
      !harvest_date ||
      !quantity_harvested ||
      !base_price
    ) {
      return NextResponse.json(
        {
          error:
            'Missing required fields: farm_id, variety_id, batch_number, harvest_date, quantity_harvested, base_price',
        },
        { status: 400 }
      )
    }

    if (!supabase) {
      return NextResponse.json({ error: 'Database connection not available' }, { status: 500 })
    }

    // Start transaction
    const { data: batch, error: batchError } = await supabase
      .from('harvest_batches')
      .insert({
        farm_id,
        variety_id,
        batch_number,
        harvest_date,
        quantity_harvested,
        unit,
        quality_grade,
        organic,
        location_in_farm,
        harvest_notes,
      })
      .select()
      .single()

    if (batchError) {
      console.error('Error creating batch:', batchError)
      return NextResponse.json({ error: 'Failed to create batch' }, { status: 500 })
    }

    // Create pricing record
    const { data: pricing, error: pricingError } = await supabase
      .from('batch_pricing')
      .insert({
        batch_id: batch.id,
        base_price,
        current_price: base_price,
        price_per_unit: base_price,
        auto_discount_enabled,
        age_discount_start_days: 3,
        age_discount_percentage_per_day: 2.0,
        grade_discount_b: 15.0,
        grade_discount_c: 30.0,
      })
      .select()
      .single()

    if (pricingError) {
      console.error('Error creating batch pricing:', pricingError)
      return NextResponse.json({ error: 'Failed to create batch pricing' }, { status: 500 })
    }

    // Create inventory record
    const { data: inventory, error: inventoryError } = await supabase
      .from('batch_inventory')
      .insert({
        batch_id: batch.id,
        quantity_available: quantity_harvested,
        quantity_reserved: 0,
        quantity_sold: 0,
        quantity_expired: 0,
        quantity_damaged: 0,
      })
      .select()
      .single()

    if (inventoryError) {
      console.error('Error creating batch inventory:', inventoryError)
      return NextResponse.json({ error: 'Failed to create batch inventory' }, { status: 500 })
    }

    return NextResponse.json(
      {
        batch,
        pricing,
        inventory,
        message: 'Batch created successfully',
      },
      { status: 201 }
    )
  } catch (error) {
    console.error('Error in POST /api/batches:', error)
    return NextResponse.json({ error: 'Internal server error' }, { status: 500 })
  }
}
