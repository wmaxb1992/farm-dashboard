import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseAdmin } from '@/lib/supabase'

export async function PATCH(request: NextRequest, { params }: { params: { id: string } }) {
  try {
    const supabase = getSupabaseAdmin()
    const body = await request.json()
    const { growth_stage, crop_status, remaining_yield, notes } = body

    // Map growth_stage to crop_status for database compatibility
    let statusMapping: { [key: string]: string } = {
      seedling: 'planted',
      growing: 'growing',
      ready_to_harvest: 'producing',
      finished: 'finished',
    }

    const updateData: any = {}

    if (growth_stage) {
      updateData.crop_status = statusMapping[growth_stage] || growth_stage
    }
    if (crop_status) {
      updateData.crop_status = crop_status
    }
    if (remaining_yield !== undefined) {
      updateData.estimated_remaining_yield = remaining_yield
    }
    if (notes !== undefined) {
      updateData.notes = notes
    }

    const { data, error } = await supabase
      .from('farm_plantings')
      .update(updateData)
      .eq('id', params.id)
      .select(
        `
        *,
        varieties(name, emoji, category, organic_available)
      `
      )
      .single()

    if (error) {
      return NextResponse.json({ error: error.message }, { status: 400 })
    }

    return NextResponse.json(data)
  } catch (error) {
    return NextResponse.json({ error: 'Failed to update planting' }, { status: 500 })
  }
}

export async function DELETE(request: NextRequest, { params }: { params: { id: string } }) {
  try {
    const supabase = getSupabaseAdmin()

    const { error } = await supabase.from('farm_plantings').delete().eq('id', params.id)

    if (error) {
      return NextResponse.json({ error: error.message }, { status: 400 })
    }

    return NextResponse.json({ message: 'Planting deleted successfully' })
  } catch (error) {
    return NextResponse.json({ error: 'Failed to delete planting' }, { status: 500 })
  }
}
