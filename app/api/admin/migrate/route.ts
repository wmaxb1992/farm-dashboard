import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseAdmin } from '@/lib/database/client'
import { readFile } from 'fs/promises'
import { join } from 'path'

export async function POST(request: NextRequest) {
  try {
    const body = await request.json()
    const { action } = body
    
    if (action !== 'migrate-cultivars') {
      return NextResponse.json({ error: 'Invalid action' }, { status: 400 })
    }

    const supabaseAdmin = getSupabaseAdmin()
    
    // Read the migration script
    const migrationScript = await readFile(
      join(process.cwd(), 'scripts', '07-complete-cultivar-migration.sql'),
      'utf8'
    )
    
    // Execute the migration
    const { error } = await supabaseAdmin.rpc('exec_sql', {
      sql: migrationScript
    })

    if (error) {
      console.error('Migration error:', error)
      return NextResponse.json({ 
        error: 'Migration failed', 
        details: error.message 
      }, { status: 500 })
    }

    // Test the new structure by querying cultivars
    const { data: cultivars, error: cultivarError } = await supabaseAdmin
      .from('cultivars')
      .select('*')
      .limit(5)

    if (cultivarError) {
      console.error('Error querying cultivars:', cultivarError)
      return NextResponse.json({ 
        error: 'Migration completed but cultivar table query failed',
        details: cultivarError.message 
      }, { status: 500 })
    }

    return NextResponse.json({ 
      success: true,
      message: 'Cultivar migration completed successfully',
      cultivarsCreated: cultivars.length,
      sampleCultivars: cultivars
    })

  } catch (error) {
    console.error('Unexpected error:', error)
    return NextResponse.json({ 
      error: 'Internal server error',
      details: error instanceof Error ? error.message : 'Unknown error'
    }, { status: 500 })
  }
}
