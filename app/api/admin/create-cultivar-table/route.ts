import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseAdmin } from '@/lib/database/client'

export async function POST(request: NextRequest) {
  try {
    const supabaseAdmin = getSupabaseAdmin()
    
    // Step 1: Create cultivar table
    const createTableSQL = `
      CREATE TABLE IF NOT EXISTS cultivars (
        id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
        variety_id UUID REFERENCES varieties(id) ON DELETE CASCADE,
        name VARCHAR(255) NOT NULL,
        common_name VARCHAR(255),
        description TEXT,
        characteristics TEXT,
        growing_notes TEXT,
        botanical_name VARCHAR(255),
        days_to_maturity INTEGER,
        plant_spacing VARCHAR(50),
        seed_depth VARCHAR(50),
        germination_days VARCHAR(50),
        sun_requirements VARCHAR(100),
        frost_hardy BOOLEAN DEFAULT FALSE,
        image_url TEXT,
        source_url TEXT,
        created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
        updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
        
        UNIQUE(variety_id, name)
      );
    `
    
    const { error: createError } = await supabaseAdmin.rpc('exec_sql', { sql: createTableSQL })
    
    if (createError) {
      console.error('Error creating cultivar table:', createError)
      return NextResponse.json({ error: 'Failed to create cultivar table', details: createError.message }, { status: 500 })
    }

    // Step 2: Add columns to products table
    const alterTableSQL = `
      ALTER TABLE products 
      ADD COLUMN IF NOT EXISTS cultivar_id UUID REFERENCES cultivars(id),
      ADD COLUMN IF NOT EXISTS cultivar_name VARCHAR(255);
    `
    
    const { error: alterError } = await supabaseAdmin.rpc('exec_sql', { sql: alterTableSQL })
    
    if (alterError) {
      console.error('Error altering products table:', alterError)
      return NextResponse.json({ error: 'Failed to alter products table', details: alterError.message }, { status: 500 })
    }

    // Step 3: Create indexes
    const indexSQL = `
      CREATE INDEX IF NOT EXISTS idx_cultivars_variety_id ON cultivars(variety_id);
      CREATE INDEX IF NOT EXISTS idx_cultivars_name ON cultivars(name);
      CREATE INDEX IF NOT EXISTS idx_products_cultivar_id ON products(cultivar_id);
    `
    
    const { error: indexError } = await supabaseAdmin.rpc('exec_sql', { sql: indexSQL })
    
    if (indexError) {
      console.error('Error creating indexes:', indexError)
      return NextResponse.json({ error: 'Failed to create indexes', details: indexError.message }, { status: 500 })
    }

    // Step 4: Test the new table by adding a sample cultivar
    const { data: basilVariety } = await supabaseAdmin
      .from('varieties')
      .select('id')
      .eq('name', 'Basil')
      .single()

    if (basilVariety) {
      const { error: insertError } = await supabaseAdmin
        .from('cultivars')
        .insert([{
          variety_id: basilVariety.id,
          name: 'Thai Basil',
          common_name: 'Thai Sweet Basil',
          description: 'Spicy, licorice-flavored basil used in Asian cuisine',
          characteristics: 'Purple stems; spicy, anise-like flavor; small leaves',
          botanical_name: 'Ocimum basilicum var. thyrsiflora',
          days_to_maturity: 85,
          plant_spacing: '8-12"',
          seed_depth: '1/4"',
          germination_days: '7-14 days',
          sun_requirements: 'Full Sun',
          frost_hardy: false
        }])
        .select()
        .single()

      if (insertError) {
        console.error('Error inserting sample cultivar:', insertError)
      }
    }

    return NextResponse.json({ 
      success: true,
      message: 'Cultivar table created successfully',
      timestamp: new Date().toISOString()
    })

  } catch (error) {
    console.error('Unexpected error:', error)
    return NextResponse.json({ 
      error: 'Internal server error',
      details: error instanceof Error ? error.message : 'Unknown error'
    }, { status: 500 })
  }
}
