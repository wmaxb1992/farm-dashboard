import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseAdmin } from '../../../../lib/supabase'

export async function POST(request: NextRequest) {
  try {
    const supabase = getSupabaseAdmin()
    
    console.log('🚀 Starting cultivar migration...')
    
    // Step 1: Create cultivar table
    console.log('📝 Creating cultivar table...')
    
    const { error: tableError } = await supabase.rpc('sql', {
      query: `
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
            
            -- Ensure unique cultivar names per variety
            UNIQUE(variety_id, name)
        );
      `
    })
    
    if (tableError) {
      console.error('❌ Error creating cultivar table:', tableError)
      return NextResponse.json({ error: 'Failed to create cultivar table', details: tableError }, { status: 500 })
    }
    
    console.log('✅ Cultivar table created successfully!')
    
    // Step 2: Add columns to products table
    console.log('📝 Adding cultivar columns to products table...')
    
    const { error: alterError } = await supabase.rpc('sql', {
      query: `
        ALTER TABLE products 
        ADD COLUMN IF NOT EXISTS cultivar_id UUID REFERENCES cultivars(id),
        ADD COLUMN IF NOT EXISTS cultivar_name VARCHAR(255);
      `
    })
    
    if (alterError) {
      console.error('❌ Error altering products table:', alterError)
      return NextResponse.json({ error: 'Failed to alter products table', details: alterError }, { status: 500 })
    }
    
    console.log('✅ Products table altered successfully!')
    
    // Step 3: Create indexes
    console.log('📝 Creating indexes...')
    
    const { error: indexError } = await supabase.rpc('sql', {
      query: `
        CREATE INDEX IF NOT EXISTS idx_cultivars_variety_id ON cultivars(variety_id);
        CREATE INDEX IF NOT EXISTS idx_cultivars_name ON cultivars(name);
        CREATE INDEX IF NOT EXISTS idx_products_cultivar_id ON products(cultivar_id);
      `
    })
    
    if (indexError) {
      console.error('❌ Error creating indexes:', indexError)
      return NextResponse.json({ error: 'Failed to create indexes', details: indexError }, { status: 500 })
    }
    
    console.log('✅ Indexes created successfully!')
    
    return NextResponse.json({ 
      success: true, 
      message: 'Cultivar migration completed successfully!' 
    })
    
  } catch (error) {
    console.error('❌ Migration failed:', error)
    return NextResponse.json({ error: 'Migration failed', details: error }, { status: 500 })
  }
}
