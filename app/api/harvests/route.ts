import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseAdmin } from '@/lib/supabase'

export async function POST(request: NextRequest) {
  try {
    const supabase = getSupabaseAdmin()
    const body = await request.json()
    console.log('Received harvest request:', body)

    const {
      planting_id,
      harvest_date,
      quantity_harvested,
      quality_grade = 'A',
      notes,
      create_batch = true,
    } = body

    // Validate required fields
    if (!planting_id || !harvest_date || !quantity_harvested) {
      console.log('Missing required fields:', { planting_id, harvest_date, quantity_harvested })
      return NextResponse.json(
        {
          error:
            'Missing required fields: planting_id, harvest_date, and quantity_harvested are required',
        },
        { status: 400 }
      )
    }

    // First, get the planting details
    console.log('Fetching planting with ID:', planting_id)
    const { data: planting, error: plantingError } = await supabase
      .from('farm_plantings')
      .select('*')
      .eq('id', planting_id)
      .single()

    if (plantingError) {
      console.error('Error fetching planting:', plantingError)
      return NextResponse.json(
        { error: `Planting fetch error: ${plantingError.message}` },
        { status: 404 }
      )
    }

    if (!planting) {
      console.log('No planting found with ID:', planting_id)
      return NextResponse.json({ error: 'Planting not found' }, { status: 404 })
    }

    console.log('Found planting:', planting)

    // Create the harvest record
    console.log('Creating harvest with data:', {
      planting_id,
      farm_id: planting.farm_id,
      variety_id: planting.variety_id || null, // Allow null variety_id
      harvest_date,
      quantity_harvested,
      quality_grade,
      notes,
    })

    const { data: harvest, error: harvestError } = await supabase
      .from('harvests')
      .insert({
        planting_id,
        farm_id: planting.farm_id,
        variety_id: planting.variety_id || null, // Allow null variety_id
        harvest_date,
        quantity_harvested,
        quality_grade,
        notes,
      })
      .select()
      .single()

    if (harvestError) {
      console.error('Error creating harvest:', harvestError)
      return NextResponse.json(
        { error: `Harvest creation error: ${harvestError.message}` },
        { status: 400 }
      )
    }

    // Update the planting's remaining yield
    const currentRemainingYield =
      planting.estimated_remaining_yield || planting.total_estimated_yield || 0
    const newRemainingYield = Math.max(0, Number(currentRemainingYield) - quantity_harvested)

    // If this was a full harvest or remaining yield is 0, mark as finished
    const newCropStatus = newRemainingYield <= 0 ? 'finished' : planting.crop_status

    console.log('Updating planting:', {
      id: planting_id,
      current_remaining: currentRemainingYield,
      harvested: quantity_harvested,
      new_remaining: newRemainingYield,
      new_status: newCropStatus,
    })

    const { error: updateError } = await supabase
      .from('farm_plantings')
      .update({
        estimated_remaining_yield: newRemainingYield,
        crop_status: newCropStatus,
      })
      .eq('id', planting_id)

    if (updateError) {
      console.error('Error updating planting:', updateError)
      // Don't fail the harvest creation if the planting update fails
    }

    // Create a batch if requested
    let batch = null
    if (create_batch && quantity_harvested > 0) {
      const batchNumber = `${planting.farm_variety_name || 'Crop'}-${new Date(harvest_date).toISOString().split('T')[0]}-${String(harvest.id).slice(-4)}`

      const { data: batchData, error: batchError } = await supabase
        .from('inventory_batches')
        .insert({
          farm_id: planting.farm_id,
          variety_id: planting.variety_id || null, // Allow null variety_id
          harvest_id: harvest.id,
          batch_number: batchNumber,
          harvest_date,
          quantity_harvested,
          quantity_available: quantity_harvested,
          quality_grade,
          status: 'fresh',
          organic: planting.organic || false,
        })
        .select()
        .single()

      if (!batchError) {
        batch = batchData
      }
    }

    return NextResponse.json(
      {
        harvest,
        batch,
        updated_planting: {
          id: planting_id,
          remaining_yield: newRemainingYield,
          crop_status: newCropStatus,
        },
      },
      { status: 201 }
    )
  } catch (error) {
    console.error('Unexpected error in harvest creation:', error)
    return NextResponse.json(
      { error: `Failed to create harvest record: ${error}` },
      { status: 500 }
    )
  }
}
