// Test script to check table existence
import { createClient } from '@supabase/supabase-js'

const supabaseUrl = 'https://nlbxlnpukcjksvwqemet.supabase.co'
const supabaseServiceKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im5sYnhsbnB1a2Nqa3N2d3FlbWV0Iiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc1MjE3NDg2MiwiZXhwIjoyMDY3NzUwODYyfQ.MxPq28_vqVqpBQ8qyKbZxwkhKdH5DVBggP45NZ8CdA8'

async function checkTables() {
  try {
    const supabase = createClient(supabaseUrl, supabaseServiceKey)
    
    // Check if batch_pricing table exists
    const { data: batchPricingData, error: batchPricingError } = await supabase
      .from('batch_pricing')
      .select('*')
      .limit(1)
    
    console.log('batch_pricing table:', batchPricingError ? 'Does not exist' : 'Exists')
    if (batchPricingError) {
      console.log('batch_pricing error:', batchPricingError.message)
    }
    
    // Check if batches table exists
    const { data: batchesData, error: batchesError } = await supabase
      .from('batches')
      .select('*')
      .limit(1)
    
    console.log('batches table:', batchesError ? 'Does not exist' : 'Exists')
    if (batchesError) {
      console.log('batches error:', batchesError.message)
    }
    
    // Check if plantings table exists
    const { data: plantingsData, error: plantingsError } = await supabase
      .from('plantings')
      .select('*')
      .limit(1)
    
    console.log('plantings table:', plantingsError ? 'Does not exist' : 'Exists')
    if (plantingsError) {
      console.log('plantings error:', plantingsError.message)
    }
    
    // Check if harvest_batches table exists (the old table name)
    const { data: harvestBatchesData, error: harvestBatchesError } = await supabase
      .from('harvest_batches')
      .select('*')
      .limit(1)
    
    console.log('harvest_batches table:', harvestBatchesError ? 'Does not exist' : 'Exists')
    if (harvestBatchesError) {
      console.log('harvest_batches error:', harvestBatchesError.message)
    }
    
  } catch (error) {
    console.error('Error checking tables:', error)
  }
}

checkTables()
