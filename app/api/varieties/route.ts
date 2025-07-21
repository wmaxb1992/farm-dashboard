import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseAdmin } from '@/lib/database/client'

export async function POST(request: NextRequest) {
  try {
    const body = await request.json()
    const { name, subcategory_id, emoji, description } = body

    if (!name || !subcategory_id) {
      return NextResponse.json(
        { error: 'Missing required fields: name, subcategory_id' },
        { status: 400 }
      )
    }

    const supabaseAdmin = getSupabaseAdmin()

    // Check if variety already exists
    const { data: existing } = await supabaseAdmin
      .from('varieties')
      .select('id, name')
      .eq('name', name)
      .eq('subcategory_id', subcategory_id)
      .single()

    if (existing) {
      return NextResponse.json(
        { error: 'Variety already exists' },
        { status: 409 }
      )
    }

    // Create new variety
    const { data: variety, error } = await supabaseAdmin
      .from('varieties')
      .insert([
        {
          name: name.trim(),
          subcategory_id,
          emoji: emoji || '🌱',
          description: description || `${name} variety`,
        },
      ])
      .select(`
        id,
        name,
        emoji,
        description,
        subcategories!inner (
          id,
          name,
          categories!inner (
            id,
            name
          )
        )
      `)
      .single()

    if (error) {
      console.error('Error creating variety:', error)
      return NextResponse.json({ error: 'Failed to create variety' }, { status: 500 })
    }

    // Format response
    const formattedVariety = {
      id: variety.id,
      name: variety.name,
      emoji: variety.emoji,
      description: variety.description,
      category: variety.subcategories?.categories?.name,
      subcategory: variety.subcategories?.name,
      displayName: `${variety.emoji} ${variety.name}`,
      fullPath: `${variety.subcategories?.categories?.name} > ${variety.subcategories?.name} > ${variety.name}`
    }

    return NextResponse.json({ variety: formattedVariety }, { status: 201 })
  } catch (error) {
    console.error('Unexpected error:', error)
    return NextResponse.json({ error: 'Internal server error' }, { status: 500 })
  }
}
