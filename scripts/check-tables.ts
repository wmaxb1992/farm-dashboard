import { getSupabaseAdmin } from '../src/lib/supabase'

async function checkTables() {
  try {
    const supabase = getSupabaseAdmin()
    
    // Check if batch_pricing table exists
    const { data: batchPricingData, error: batchPricingError } = await supabase
      .from('batch_pricing')
      .select('*')
      .limit(1)
    
    console.log('batch_pricing table:', batchPricingError ? 'Does not exist' : 'Exists')
    if (batchPricingError) {
      console.log('Error:', batchPricingError.message)
    }
    
    // Check if batches table exists
    const { data: batchesData, error: batchesError } = await supabase
      .from('batches')
      .select('*')
      .limit(1)
    
    console.log('batches table:', batchesError ? 'Does not exist' : 'Exists')
    if (batchesError) {
      console.log('Error:', batchesError.message)
    }
    
    // Check if plantings table exists
    const { data: plantingsData, error: plantingsError } = await supabase
      .from('plantings')
      .select('*')
      .limit(1)
    
    console.log('plantings table:', plantingsError ? 'Does not exist' : 'Exists')
    if (plantingsError) {
      console.log('Error:', plantingsError.message)
    }
    
  } catch (error) {
    console.error('Error checking tables:', error)
  }
}

checkTables()
