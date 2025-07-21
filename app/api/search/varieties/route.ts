import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseAdmin } from '@/lib/database/client'

export async function GET(request: NextRequest) {
  try {
    const { searchParams } = new URL(request.url)
    const query = searchParams.get('q')
    
    if (!query || query.length < 2) {
      return NextResponse.json({ results: [] })
    }

    const supabaseAdmin = getSupabaseAdmin()
    
    // First, try to search cultivars if the table exists
    let cultivarResults: any[] = []
    try {
      const { data: cultivars, error: cultivarError } = await supabaseAdmin
        .from('cultivars')
        .select(`
          id,
          name,
          common_name,
          description,
          characteristics,
          botanical_name,
          days_to_maturity,
          varieties!inner (
            id,
            name,
            emoji,
            subcategories!inner (
              id,
              name,
              categories!inner (
                id,
                name
              )
            )
          )
        `)
        .or(`name.ilike.%${query}%,common_name.ilike.%${query}%`)
        .limit(10)

      if (!cultivarError && cultivars) {
        cultivarResults = cultivars.map((cultivar: any) => ({
          id: cultivar.id,
          name: cultivar.name,
          common_name: cultivar.common_name,
          emoji: cultivar.varieties?.emoji || '🌱',
          description: cultivar.description,
          characteristics: cultivar.characteristics,
          botanical_name: cultivar.botanical_name,
          days_to_maturity: cultivar.days_to_maturity,
          type: 'cultivar',
          variety_id: cultivar.varieties?.id,
          variety_name: cultivar.varieties?.name,
          category: cultivar.varieties?.subcategories?.categories?.name,
          subcategory: cultivar.varieties?.subcategories?.name,
          displayName: `${cultivar.varieties?.emoji || '🌱'} ${cultivar.varieties?.name} > ${cultivar.name}`,
          fullPath: `${cultivar.varieties?.subcategories?.categories?.name} > ${cultivar.varieties?.subcategories?.name} > ${cultivar.varieties?.name} > ${cultivar.name}`
        }))
      }
    } catch (error) {
      // Cultivar table doesn't exist yet, continue with varieties only
      console.log('Cultivar table not found, searching varieties only')
    }

    // Search varieties
    const { data: varieties, error: varietyError } = await supabaseAdmin
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

    if (varietyError) {
      console.error('Error searching varieties:', varietyError)
      return NextResponse.json({ error: 'Failed to search varieties' }, { status: 500 })
    }

    // Format variety results
    const formattedVarieties = varieties.map((variety: any) => ({
      id: variety.id,
      name: variety.name,
      emoji: variety.emoji,
      description: variety.description,
      type: 'variety',
      category: variety.subcategories?.categories?.name,
      subcategory: variety.subcategories?.name,
      displayName: `${variety.emoji} ${variety.name}`,
      fullPath: `${variety.subcategories?.categories?.name} > ${variety.subcategories?.name} > ${variety.name}`
    }))

    // Combine results (cultivars first, then varieties)
    const allResults = [...cultivarResults, ...formattedVarieties]
      .sort((a, b) => {
        // Prioritize cultivars over varieties
        if (a.type === 'cultivar' && b.type === 'variety') return -1
        if (a.type === 'variety' && b.type === 'cultivar') return 1
        // Then sort by name
        return a.name.localeCompare(b.name)
      })

    return NextResponse.json({ results: allResults })
  } catch (error) {
    console.error('Unexpected error:', error)
    return NextResponse.json({ error: 'Internal server error' }, { status: 500 })
  }
}
