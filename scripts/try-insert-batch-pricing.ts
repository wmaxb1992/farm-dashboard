// Check batch_pricing table structure by trying different column names
import { createClient } from '@supabase/supabase-js'

const supabaseUrl = 'https://nlbxlnpukcjksvwqemet.supabase.co'
const supabaseServiceKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im5sYnhsbnB1a2Nqa3N2d3FlbWV0Iiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc1MjE3NDg2MiwiZXhwIjoyMDY3NzUwODYyfQ.MxPq28_vqVqpBQ8qyKbZxwkhKdH5DVBggP45NZ8CdA8'

async function tryInsertBatchPricing() {
  try {
    const supabase = createClient(supabaseUrl, supabaseServiceKey)
    
    // Try with base_price included
    const { data: testInsert, error: insertError } = await supabase
      .from('batch_pricing')
      .insert({
        batch_id: 'c4d180be-1629-48d8-b0aa-aafae12311fd', // Use an existing batch ID
        base_price: 10.00,
        current_price: 8.50,
        discount_percentage: 15,
        auto_discount_enabled: true,
      })
      .select()
      .single()
    
    if (insertError) {
      console.log('Insert error:', insertError.message)
      console.log('Error details:', insertError.details)
      console.log('Error hint:', insertError.hint)
      
      // Try with different column names
      const { data: testInsert2, error: insertError2 } = await supabase
        .from('batch_pricing')
        .insert({
          batch_id: 'c4d180be-1629-48d8-b0aa-aafae12311fd',
          base_price_per_unit: 10.00,
          current_price_per_unit: 8.50,
          discount_percentage: 15,
          auto_discount_enabled: true,
        })
        .select()
        .single()
      
      if (insertError2) {
        console.log('Second insert error:', insertError2.message)
        
        // Try with minimal fields
        const { data: testInsert3, error: insertError3 } = await supabase
          .from('batch_pricing')
          .insert({
            batch_id: 'c4d180be-1629-48d8-b0aa-aafae12311fd',
            base_price: 10.00,
          })
          .select()
          .single()
        
        if (insertError3) {
          console.log('Third insert error:', insertError3.message)
        } else {
          console.log('Successfully inserted with minimal fields:', testInsert3)
          
          // Clean up
          await supabase
            .from('batch_pricing')
            .delete()
            .eq('id', testInsert3.id)
        }
      } else {
        console.log('Successfully inserted with per_unit fields:', testInsert2)
        
        // Clean up
        await supabase
          .from('batch_pricing')
          .delete()
          .eq('id', testInsert2.id)
      }
    } else {
      console.log('Successfully inserted:', testInsert)
      
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

tryInsertBatchPricing()
