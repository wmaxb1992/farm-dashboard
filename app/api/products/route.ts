import { type NextRequest, NextResponse } from 'next/server'
import { getSupabaseAdmin } from '@/lib/database/client'

export async function GET(request: NextRequest) {
  try {
    const supabaseAdmin = getSupabaseAdmin()
    const { searchParams } = new URL(request.url)
    const farmId = searchParams.get('farm_id')
    const search = searchParams.get('search')

    // Simplified query without complex relations for now
    let query = supabaseAdmin
      .from('products')
      .select('*')
      .order('created_at', { ascending: false })

    if (farmId) {
      query = query.eq('farm_id', farmId)
    }

    if (search) {
      query = query.ilike('name', `%${search}%`)
    }

    const { data: products, error } = await query

    if (error) {
      console.error('Error fetching products:', error)
      return NextResponse.json({ error: 'Failed to fetch products' }, { status: 500 })
    }

    // Handle the case where products might be null
    if (!products) {
      return NextResponse.json({ products: [] })
    }

    return NextResponse.json({ products })
  } catch (error) {
    console.error('Unexpected error:', error)
    return NextResponse.json({ error: 'Internal server error' }, { status: 500 })
  }
}

export async function POST(request: NextRequest) {
  try {
    const supabaseAdmin = getSupabaseAdmin()
    const body = await request.json()

    // Validate required fields
    if (!body.name || !body.farm_id || !body.variety_id || !body.price) {
      return NextResponse.json(
        { error: 'Missing required fields: name, farm_id, variety_id, price' },
        { status: 400 }
      )
    }

    const { data: product, error } = await supabaseAdmin
      .from('products')
      .insert([
        {
          name: body.name,
          farm_id: body.farm_id,
          variety_id: body.variety_id,
          cultivar_id: body.cultivar_id || null, // New field for cultivar ID
          cultivar_name: body.cultivar_name || null, // New field for cultivar name
          price: Number.parseFloat(body.price),
          stock: Number.parseInt(body.stock) || 0,
          freshness: Number.parseInt(body.freshness) || 95,
          harvest_date: body.harvest_date,
          pre_harvest: body.pre_harvest || false,
          organic: body.organic || false,
          in_season: body.in_season !== false,
          delivery_days: body.delivery_days || [],
          images: body.images || [],
        },
      ])
      .select('*')
      .single()

    if (error) {
      console.error('Error creating product:', error)
      return NextResponse.json({ error: 'Failed to create product' }, { status: 500 })
    }

    return NextResponse.json({ product }, { status: 201 })
  } catch (error) {
    console.error('Unexpected error:', error)
    return NextResponse.json({ error: 'Internal server error' }, { status: 500 })
  }
}
