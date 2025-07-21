import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseAdmin } from '@/lib/supabase'

export async function GET(request: NextRequest) {
  try {
    const supabase = getSupabaseAdmin()
    const { searchParams } = new URL(request.url)
    const farmId = searchParams.get('farm_id')
    const status = searchParams.get('status') // 'active', 'finished', 'all'

    let query = supabase.from('farm_plantings').select(`
        *,
        varieties!left(name, emoji)
      `)

    if (farmId) {
      query = query.eq('farm_id', farmId)
    }

    if (status && status !== 'all') {
      if (status === 'active') {
        query = query.in('crop_status', ['planted', 'growing', 'producing'])
      } else {
        query = query.eq('crop_status', status)
      }
    }

    query = query.order('planting_date', { ascending: false })

    const { data, error } = await query

    if (error) {
      return NextResponse.json({ error: error.message }, { status: 400 })
    }

    // Map crop_status to growth_stage for UI compatibility
    const statusMapping: { [key: string]: string } = {
      planted: 'seedling',
      growing: 'growing',
      producing: 'ready_to_harvest',
      finished: 'finished',
    }

    const mappedData = (data || []).map((item: any) => ({
      ...item,
      growth_stage: statusMapping[item.crop_status as keyof typeof statusMapping] || 'seedling',
      variety_name: item.varieties?.name || item.farm_variety_name || 'Unknown Variety',
      planted_date: item.planting_date,
      location: item.planting_location,
      remaining_yield: item.estimated_remaining_yield || item.total_estimated_yield || 0,
    }))

    // Return in expected format
    return NextResponse.json({
      plantings: mappedData,
      total: mappedData.length,
    })
  } catch (error) {
    return NextResponse.json({ error: 'Failed to fetch farm plantings' }, { status: 500 })
  }
}

export async function POST(request: NextRequest) {
  try {
    const supabase = getSupabaseAdmin()
    const body = await request.json()
    const {
      farm_id,
      variety_id,
      farm_variety_name,
      planting_location,
      planted_date,
      planting_date, // alias for planted_date
      first_harvest_date,
      total_estimated_yield,
      estimated_total_yield, // alias for total_estimated_yield
      estimated_yield_per_harvest,
      harvest_frequency_days = 7,
      next_projected_harvest_date,
      next_projected_quantity,
      crop_status = 'planted',
      growth_stage, // New field for UI compatibility
      growing_method,
      planted_quantity,
      planted_area,
      planted_area_unit = 'sq_ft',
      notes,
    } = body

    // Map growth_stage to crop_status if provided
    let finalCropStatus = crop_status
    if (growth_stage) {
      const stageMapping: { [key: string]: string } = {
        seedling: 'planted',
        growing: 'growing',
        ready_to_harvest: 'producing',
        finished: 'finished',
      }
      finalCropStatus = stageMapping[growth_stage] || 'planted'
    }

    const { data, error } = await supabase
      .from('farm_plantings')
      .insert({
        farm_id,
        variety_id,
        farm_variety_name,
        planting_location,
        planting_date: planting_date || planted_date,
        first_harvest_date,
        total_estimated_yield: total_estimated_yield || estimated_total_yield,
        estimated_yield_per_harvest,
        harvest_frequency_days,
        next_projected_harvest_date,
        next_projected_quantity,
        crop_status: finalCropStatus,
        growing_method,
        planted_quantity,
        planted_area,
        planted_area_unit,
        notes,
      })
      .select()
      .single()

    if (error) {
      return NextResponse.json({ error: error.message }, { status: 400 })
    }

    // Add growth_stage to response for UI compatibility
    const statusMapping: { [key: string]: string } = {
      planted: 'seedling',
      growing: 'growing',
      producing: 'ready_to_harvest',
      finished: 'finished',
    }

    const responseData = {
      ...data,
      growth_stage: statusMapping[data.crop_status as keyof typeof statusMapping] || 'seedling',
    }

    return NextResponse.json(responseData, { status: 201 })
  } catch (error) {
    return NextResponse.json({ error: 'Failed to create farm planting' }, { status: 500 })
  }
}

export async function PUT(request: NextRequest) {
  try {
    const supabase = getSupabaseAdmin()
    const body = await request.json()
    const { id, ...updateData } = body

    if (!id) {
      return NextResponse.json({ error: 'Planting ID is required' }, { status: 400 })
    }

    console.log('Updating planting:', id, updateData)

    // Map growth_stage to crop_status if provided
    if (updateData.growth_stage) {
      const stageMapping: { [key: string]: string } = {
        seedling: 'planted',
        growing: 'growing',
        ready_to_harvest: 'producing',
        finished: 'finished',
      }
      updateData.crop_status = stageMapping[updateData.growth_stage] || updateData.crop_status
    }

    // Remove any undefined or null values
    const cleanedData = Object.fromEntries(
      Object.entries(updateData).filter(([_, value]) => value !== undefined && value !== null)
    )

    const { data, error } = await supabase
      .from('farm_plantings')
      .update(cleanedData)
      .eq('id', id)
      .select()
      .single()

    if (error) {
      console.error('Error updating planting:', error)
      return NextResponse.json({ error: error.message }, { status: 400 })
    }

    // Add growth_stage to response for UI compatibility
    const statusMapping: { [key: string]: string } = {
      planted: 'seedling',
      growing: 'growing',
      producing: 'ready_to_harvest',
      finished: 'finished',
    }

    const responseData = {
      ...data,
      growth_stage: statusMapping[data.crop_status as keyof typeof statusMapping] || 'seedling',
    }

    console.log('Successfully updated planting:', responseData)
    return NextResponse.json(responseData, { status: 200 })
  } catch (error) {
    console.error('Error in PUT /api/farm-plantings:', error)
    return NextResponse.json({ error: 'Failed to update farm planting' }, { status: 500 })
  }
}
