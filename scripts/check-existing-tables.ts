// Check existing table structure
import { createClient } from '@supabase/supabase-js'

const supabaseUrl = 'https://nlbxlnpukcjksvwqemet.supabase.co'
const supabaseServiceKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im5sYnhsbnB1a2Nqa3N2d3FlbWV0Iiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc1MjE3NDg2MiwiZXhwIjoyMDY3NzUwODYyfQ.MxPq28_vqVqpBQ8qyKbZxwkhKdH5DVBggP45NZ8CdA8'

async function checkExistingTables() {
  try {
    const supabase = createClient(supabaseUrl, supabaseServiceKey)
    
    // Check harvest_batches structure
    const { data: harvestBatchesData, error: harvestBatchesError } = await supabase
      .from('harvest_batches')
      .select('*')
      .limit(1)
    
    console.log('harvest_batches structure:')
    if (harvestBatchesData && harvestBatchesData.length > 0) {
      console.log('Sample row:', harvestBatchesData[0])
    } else {
      console.log('No data found in harvest_batches')
    }
    
    // Check batch_pricing structure
    const { data: batchPricingData, error: batchPricingError } = await supabase
      .from('batch_pricing')
      .select('*')
      .limit(1)
    
    console.log('\nbatch_pricing structure:')
    if (batchPricingData && batchPricingData.length > 0) {
      console.log('Sample row:', batchPricingData[0])
    } else {
      console.log('No data found in batch_pricing')
    }
    
    // Let's also check what columns are available
    const { data: allFarms, error: farmsError } = await supabase
      .from('farms')
      .select('*')
      .limit(1)
    
    console.log('\nfarms structure:')
    if (allFarms && allFarms.length > 0) {
      console.log('Sample farm:', allFarms[0])
    } else {
      console.log('No farms found')
    }
    
  } catch (error) {
    console.error('Error checking tables:', error)
  }
}

checkExistingTables()
