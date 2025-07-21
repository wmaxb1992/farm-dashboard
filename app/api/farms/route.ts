import { type NextRequest, NextResponse } from 'next/server'
import { getSupabaseAdmin } from '@/lib/database/client'

export async function GET() {
  try {
    const supabaseAdmin = getSupabaseAdmin()
    const { data: farms, error } = await supabaseAdmin
      .from('farms')
      .select('*')
      .order('created_at', { ascending: false })

    if (error) {
      console.error('Error fetching farms:', error)
      return NextResponse.json({ error: 'Failed to fetch farms' }, { status: 500 })
    }

    return NextResponse.json({ farms })
  } catch (error) {
    console.error('Unexpected error:', error)
    return NextResponse.json({ error: 'Internal server error' }, { status: 500 })
  }
}

export async function POST(request: NextRequest) {
  try {
    const supabaseAdmin = getSupabaseAdmin()
    const body = await request.json()

    const { data: farm, error } = await supabaseAdmin
      .from('farms')
      .insert([
        {
          name: body.name,
          description: body.description,
          owner_name: body.owner_name,
          email: body.email,
          phone: body.phone,
          website: body.website,
          address: body.address,
          owner_id: body.owner_id, // Add owner_id field
          rating: body.rating || 0,
          certifications: body.certifications || [],
          specialties: body.specialties || [],
          delivery_zones: body.delivery_zones || [],
        },
      ])
      .select()
      .single()

    if (error) {
      console.error('Error creating farm:', error)
      return NextResponse.json({ error: 'Failed to create farm' }, { status: 500 })
    }

    return NextResponse.json({ farm }, { status: 201 })
  } catch (error) {
    console.error('Unexpected error:', error)
    return NextResponse.json({ error: 'Internal server error' }, { status: 500 })
  }
}
