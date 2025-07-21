import { NextResponse } from 'next/server'
import { getSupabaseAdmin } from '@/lib/database/client'

export async function GET() {
  try {
    const supabaseAdmin = getSupabaseAdmin()

    const { data: categories, error } = await supabaseAdmin
      .from('categories')
      .select(
        `
        *,
        subcategories(
          *,
          varieties(*)
        )
      `
      )
      .order('name')

    if (error) {
      console.error('Error fetching categories:', error)
      return NextResponse.json({ error: 'Failed to fetch categories' }, { status: 500 })
    }

    return NextResponse.json({ categories })
  } catch (error) {
    console.error('Unexpected error:', error)
    return NextResponse.json({ error: 'Internal server error' }, { status: 500 })
  }
}
