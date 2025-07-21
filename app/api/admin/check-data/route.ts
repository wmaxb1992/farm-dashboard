import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseAdmin } from '../../../../lib/supabase'

export async function GET(request: NextRequest) {
  try {
    const supabase = getSupabaseAdmin()
    
    // Check varieties
    const { data: varieties, error: varietiesError } = await supabase
      .from('varieties')
      .select('*')
      .limit(10)
    
    if (varietiesError) {
      console.error('Varieties error:', varietiesError)
    }
    
    // Check categories
    const { data: categories, error: categoriesError } = await supabase
      .from('categories')
      .select('*')
      .limit(10)
    
    if (categoriesError) {
      console.error('Categories error:', categoriesError)
    }
    
    // Check subcategories
    const { data: subcategories, error: subcategoriesError } = await supabase
      .from('subcategories')
      .select('*')
      .limit(10)
    
    if (subcategoriesError) {
      console.error('Subcategories error:', subcategoriesError)
    }
    
    return NextResponse.json({ 
      varieties: varieties || [],
      categories: categories || [],
      subcategories: subcategories || [],
      varietiesCount: varieties?.length || 0,
      categoriesCount: categories?.length || 0,
      subcategoriesCount: subcategories?.length || 0,
      errors: {
        varieties: varietiesError,
        categories: categoriesError,
        subcategories: subcategoriesError
      }
    })
    
  } catch (error) {
    console.error('❌ Check failed:', error)
    return NextResponse.json({ error: 'Check failed', details: error }, { status: 500 })
  }
}
