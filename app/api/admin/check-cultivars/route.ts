import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseAdmin } from '../../../../lib/supabase'

export async function POST(request: NextRequest) {
  try {
    const supabase = getSupabaseAdmin()
    
    console.log('🚀 Starting simple cultivar table creation...')
    
    // Let's try using the SQL editor approach
    // First, let's create the cultivar table using raw SQL
    const createTableResult = await supabase.from('_sql').select('*').eq('query', `
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
    `).limit(1)
    
    // Actually, let's just manually create the table by inserting into the info schema
    // Since we can't run raw SQL, let's check if we can create it using the service
    
    // Let's test if the table exists first
    const { data: existingTables, error: tableCheckError } = await supabase
      .from('information_schema.tables')
      .select('table_name')
      .eq('table_name', 'cultivars')
    
    if (tableCheckError) {
      console.log('Could not check existing tables:', tableCheckError)
    }
    
    console.log('Existing tables check:', existingTables)
    
    // Try another approach - use the built-in schema functions
    return NextResponse.json({ 
      success: true, 
      message: 'Table check completed',
      tableExists: existingTables && existingTables.length > 0
    })
    
  } catch (error) {
    console.error('❌ Operation failed:', error)
    return NextResponse.json({ error: 'Operation failed', details: error }, { status: 500 })
  }
}

export async function GET(request: NextRequest) {
  try {
    const supabase = getSupabaseAdmin()
    
    // Check if cultivars table exists by trying to select from it
    const { data, error } = await supabase
      .from('cultivars')
      .select('*')
      .limit(1)
    
    if (error) {
      return NextResponse.json({ 
        tableExists: false, 
        error: error.message 
      })
    }
    
    return NextResponse.json({ 
      tableExists: true, 
      sampleData: data 
    })
    
  } catch (error) {
    return NextResponse.json({ error: 'Check failed', details: error }, { status: 500 })
  }
}
