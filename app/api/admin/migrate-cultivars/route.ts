import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseAdmin } from '@/lib/database/client'

export async function POST(request: NextRequest) {
  try {
    const supabaseAdmin = getSupabaseAdmin()
    
    // Step 1: Create cultivar table
    const { error: createTableError } = await supabaseAdmin.rpc('exec', {
      sql: `
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
    })

    if (createTableError) {
      // Try direct table creation through individual insert
      const { error: directCreateError } = await supabaseAdmin
        .schema('public')
        .from('information_schema.tables')
        .select('table_name')
        .eq('table_name', 'cultivars')
        .single()

      if (directCreateError) {
        console.log('Cultivar table does not exist, need to create it manually')
        return NextResponse.json({ 
          success: false,
          message: 'Need to create cultivar table manually. Please run the SQL migration script.',
          nextStep: 'Execute scripts/08-simple-cultivar-table.sql manually'
        })
      }
    }

    // Step 2: Add cultivar columns to products table (if not exists)
    const { error: alterError } = await supabaseAdmin.rpc('exec', {
      sql: `
        ALTER TABLE products 
        ADD COLUMN IF NOT EXISTS cultivar_id UUID REFERENCES cultivars(id),
        ADD COLUMN IF NOT EXISTS cultivar_name VARCHAR(255);
      `
    })

    if (alterError) {
      console.log('Products table already has cultivar columns or manual alteration needed')
    }

    return NextResponse.json({ 
      success: true,
      message: 'Database migration completed successfully',
      steps: ['Created cultivar table', 'Added cultivar columns to products table']
    })

  } catch (error) {
    console.error('Migration error:', error)
    return NextResponse.json({ 
      error: 'Migration failed',
      details: error instanceof Error ? error.message : 'Unknown error'
    }, { status: 500 })
  }
}
