// Try to insert with all required fields
import { createClient } from '@supabase/supabase-js'

const supabaseUrl = 'https://nlbxlnpukcjksvwqemet.supabase.co'
const supabaseServiceKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im5sYnhsbnB1a2Nqa3N2d3FlbWV0Iiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc1MjE3NDg2MiwiZXhwIjoyMDY3NzUwODYyfQ.MxPq28_vqVqpBQ8qyKbZxwkhKdH5DVBggP45NZ8CdA8'

async function testInsert() {
  try {
    const supabase = createClient(supabaseUrl, supabaseServiceKey)
    
    // Try with all required fields
    const { data: testInsert, error: insertError } = await supabase
      .from('batch_pricing')
      .insert({
        batch_id: 'c4d180be-1629-48d8-b0aa-aafae12311fd',
        base_price: 10.00,
        current_price: 8.50,
        price_per_unit: 8.50,
        discount_percentage: 15,
        auto_discount_enabled: true,
      })
      .select()
      .single()
    
    if (insertError) {
      console.log('Insert error:', insertError.message)
    } else {
      console.log('Successfully inserted:', testInsert)
      console.log('Columns in the table:', Object.keys(testInsert))
      
      // Clean up
      await supabase
        .from('batch_pricing')
        .delete()
        .eq('id', testInsert.id)
    }
    
  } catch (error) {
    console.error('Error:', error)
  }
}

testInsert()
