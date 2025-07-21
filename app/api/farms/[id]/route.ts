import { type NextRequest, NextResponse } from 'next/server'
import { getSupabaseAdmin } from '@/lib/database/client'

export async function GET(request: NextRequest, { params }: { params: { id: string } }) {
  try {
    const supabaseAdmin = getSupabaseAdmin()
    const { data: farm, error } = await supabaseAdmin
      .from('farms')
      .select('*')
      .eq('id', params.id)
      .single()

    if (error) {
      console.error('Error fetching farm:', error)
      return NextResponse.json({ error: 'Farm not found' }, { status: 404 })
    }

    return NextResponse.json({ farm })
  } catch (error) {
    console.error('Unexpected error:', error)
    return NextResponse.json({ error: 'Internal server error' }, { status: 500 })
  }
}

export async function PUT(request: NextRequest, { params }: { params: { id: string } }) {
  try {
    const body = await request.json()
    const supabaseAdmin = getSupabaseAdmin()
    const { data: farm, error } = await supabaseAdmin
      .from('farms')
      .update({
        name: body.name,
        description: body.description,
        owner_name: body.owner_name,
        email: body.email,
        phone: body.phone,
        website: body.website,
        address: body.address,
        certifications: body.certifications,
        specialties: body.specialties,
        delivery_zones: body.delivery_zones,
        updated_at: new Date().toISOString(),
      })
      .eq('id', params.id)
      .select()
      .single()

    if (error) {
      console.error('Error updating farm:', error)
      return NextResponse.json({ error: 'Failed to update farm' }, { status: 500 })
    }

    return NextResponse.json({ farm })
  } catch (error) {
    console.error('Unexpected error:', error)
    return NextResponse.json({ error: 'Internal server error' }, { status: 500 })
  }
}
