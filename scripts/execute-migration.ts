import { getSupabaseAdmin } from '../lib/supabase'
import { promises as fs } from 'fs'
import { join } from 'path'

async function executeMigration() {
  try {
    const supabase = getSupabaseAdmin()
    
    console.log('🚀 Starting cultivar migration...')
    
    // Step 1: Create cultivar table
    console.log('📝 Creating cultivar table...')
    const cultivarTableSQL = await fs.readFile(
      join(process.cwd(), 'scripts/08-simple-cultivar-table.sql'),
      'utf-8'
    )
    
    const { error: tableError } = await supabase.rpc('exec_sql', {
      query: cultivarTableSQL
    })
    
    if (tableError) {
      console.error('❌ Error creating cultivar table:', tableError)
      return
    }
    
    console.log('✅ Cultivar table created successfully!')
    
    // Step 2: Import Baker Creek data
    console.log('📝 Importing Baker Creek data...')
    const bakerCreekSQL = await fs.readFile(
      join(process.cwd(), 'scripts/06-baker-creek-import.sql'),
      'utf-8'
    )
    
    const { error: importError } = await supabase.rpc('exec_sql', {
      query: bakerCreekSQL
    })
    
    if (importError) {
      console.error('❌ Error importing Baker Creek data:', importError)
      return
    }
    
    console.log('✅ Baker Creek data imported successfully!')
    
    // Step 3: Check results
    console.log('🔍 Checking migration results...')
    const { data: cultivars, error: checkError } = await supabase
      .from('cultivars')
      .select('*')
      .limit(5)
    
    if (checkError) {
      console.error('❌ Error checking results:', checkError)
      return
    }
    
    console.log('✅ Migration completed successfully!')
    console.log(`📊 Found ${cultivars?.length || 0} cultivars (showing first 5):`)
    console.log(cultivars)
    
  } catch (error) {
    console.error('❌ Migration failed:', error)
  }
}

executeMigration()
