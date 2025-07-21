import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseAdmin } from '@/lib/supabase'

export async function POST(request: NextRequest, { params }: { params: { id: string } }) {
  try {
    const supabase = getSupabaseAdmin()
    const batchId = params.id
    const body = await request.json()
    const { actual_quantity, actual_date, quality_grade = 'A' } = body

    // Call the database function to complete the harvest
    const { data, error } = await supabase.rpc('complete_harvest_batch', {
      p_batch_id: batchId,
      p_actual_quantity: actual_quantity,
      p_actual_date: actual_date,
      p_quality_grade: quality_grade,
    })

    if (error) {
      return NextResponse.json({ error: error.message }, { status: 400 })
    }

    if (!data) {
      return NextResponse.json({ error: 'Batch not found or not projected' }, { status: 404 })
    }

    // Get the updated batch info
    const { data: updatedBatch, error: fetchError } = await supabase
      .from('batch_inventory_status')
      .select(
        `
        *,
        varieties(name, emoji),
        farm_plantings(farm_variety_name, planting_location)
      `
      )
      .eq('id', batchId)
      .single()

    if (fetchError) {
      return NextResponse.json({ error: fetchError.message }, { status: 400 })
    }

    return NextResponse.json({
      success: true,
      message: 'Harvest completed successfully',
      batch: updatedBatch,
    })
  } catch (error) {
    return NextResponse.json({ error: 'Failed to complete harvest' }, { status: 500 })
  }
}
