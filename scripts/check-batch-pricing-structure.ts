// Check batch_pricing table structure by inserting a test record
import { createClient } from '@supabase/supabase-js'

const supabaseUrl = 'https://nlbxlnpukcjksvwqemet.supabase.co'
const supabaseServiceKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im5sYnhsbnB1a2Nqa3N2d3FlbWV0Iiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc1MjE3NDg2MiwiZXhwIjoyMDY3NzUwODYyfQ.MxPq28_vqVqpBQ8qyKbZxwkhKdH5DVBggP45NZ8CdA8'

async function checkBatchPricingStructure() {
  try {
    const supabase = createClient(supabaseUrl, supabaseServiceKey)
    
    // Try to create a test record to see what columns are expected
    const { data: testInsert, error: insertError } = await supabase
      .from('batch_pricing')
      .insert({
        batch_id: 'c4d180be-1629-48d8-b0aa-aafae12311fd', // Use an existing batch ID
        current_price: 10.50,
        discount_percentage: 0,
      })
      .select()
      .single()
    
    if (insertError) {
      console.log('Insert error (helps us understand the schema):', insertError.message)
      
      // Let's also try a different approach - check the RLS policies or table info
      const { data: policies, error: policyError } = await supabase
        .rpc('get_table_info', { table_name: 'batch_pricing' })
        .single()
        
      if (policyError) {
        console.log('Policy check error:', policyError.message)
      }
    } else {
      console.log('Successfully inserted test record:', testInsert)
      
      // Clean up the test record
      await supabase
        .from('batch_pricing')
        .delete()
        .eq('id', testInsert.id)
    }
    
  } catch (error) {
    console.error('Error checking batch pricing structure:', error)
  }
}

checkBatchPricingStructure()
