import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseAdmin } from '@/lib/database/client'

export async function GET(request: NextRequest) {
  try {
    const { searchParams } = new URL(request.url)
    const query = searchParams.get('q')
    
    if (!query || query.length < 2) {
      return NextResponse.json({ varieties: [] })
    }

    const supabaseAdmin = getSupabaseAdmin()
    
    // Search varieties by name (case-insensitive)
    const { data: varieties, error } = await supabaseAdmin
      .from('varieties')
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
      .ilike('name', `%${query}%`)
      .limit(10)

    if (error) {
      console.error('Error searching varieties:', error)
      return NextResponse.json({ error: 'Failed to search varieties' }, { status: 500 })
    }

    // Format results for autocomplete
    const formattedVarieties = varieties.map(variety => ({
      id: variety.id,
      name: variety.name,
      emoji: variety.emoji,
      description: variety.description,
      category: variety.subcategories?.categories?.name,
      subcategory: variety.subcategories?.name,
      displayName: `${variety.emoji} ${variety.name}`,
      fullPath: `${variety.subcategories?.categories?.name} > ${variety.subcategories?.name} > ${variety.name}`
    }))

    return NextResponse.json({ varieties: formattedVarieties })
  } catch (error) {
    console.error('Unexpected error:', error)
    return NextResponse.json({ error: 'Internal server error' }, { status: 500 })
  }
}
