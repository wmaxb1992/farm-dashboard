import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseAdmin } from '../../../../lib/supabase'

export async function POST(request: NextRequest) {
  try {
    const supabase = getSupabaseAdmin()
    
    console.log('🚀 Attempting to create cultivars table directly...')
    
    // Since we can't execute raw SQL, let's try to create the table through the API
    // We'll insert some sample data to test if the table exists
    
    const sampleCultivar = {
      variety_id: '00000000-0000-0000-0000-000000000005', // Basil
      name: 'Genovese',
      common_name: 'Genovese Basil',
      description: 'Classic Italian basil with large, aromatic leaves perfect for pesto',
      characteristics: 'Large, bright green leaves; sweet, aromatic flavor',
      growing_notes: 'Excellent for pesto. Pinch flowers to maintain leaf production.',
      botanical_name: 'Ocimum basilicum',
      days_to_maturity: 75,
      plant_spacing: '6-12"',
      seed_depth: '1/4"',
      germination_days: '7-14 days',
      sun_requirements: 'Full Sun',
      frost_hardy: false,
      source_url: 'https://www.rareseeds.com/basil-genovese'
    }
    
    // Try to insert the sample data
    const { data, error } = await supabase
      .from('cultivars')
      .insert([sampleCultivar])
      .select()
    
    if (error) {
      console.error('❌ Error inserting cultivar:', error)
      return NextResponse.json({ 
        error: 'Failed to insert cultivar (table might not exist)', 
        details: error,
        message: 'Please create the cultivars table manually in Supabase SQL editor using the script: scripts/09-manual-cultivar-creation.sql'
      }, { status: 500 })
    }
    
    console.log('✅ Successfully inserted cultivar!')
    
    // If we get here, the table exists and we can add more data
    const additionalCultivars = [
      {
        variety_id: '00000000-0000-0000-0000-000000000005', // Basil
        name: 'Thai',
        common_name: 'Thai Basil',
        description: 'Spicy, licorice-flavored basil used in Asian cuisine',
        characteristics: 'Purple stems; spicy, anise-like flavor; small leaves',
        growing_notes: 'Heat-loving. Excellent for stir-fries and Asian dishes.',
        botanical_name: 'Ocimum basilicum var. thyrsiflora',
        days_to_maturity: 85,
        plant_spacing: '8-12"',
        seed_depth: '1/4"',
        germination_days: '7-14 days',
        sun_requirements: 'Full Sun',
        frost_hardy: false,
        source_url: 'https://www.rareseeds.com/basil-thai'
      },
      {
        variety_id: '4f47b5f4-a23a-4c2e-bc4c-3b2e3fa0be2e', // Cherry Tomatoes
        name: 'Sun Gold',
        common_name: 'Sun Gold Cherry Tomato',
        description: 'Sweet, orange cherry tomato with exceptional flavor',
        characteristics: 'Small, orange fruits; incredibly sweet; heavy production',
        growing_notes: 'Indeterminate variety. Excellent for fresh eating.',
        botanical_name: 'Solanum lycopersicum',
        days_to_maturity: 75,
        plant_spacing: '24-36"',
        seed_depth: '1/4"',
        germination_days: '7-14 days',
        sun_requirements: 'Full Sun',
        frost_hardy: false,
        source_url: 'https://www.rareseeds.com/tomato-sun-gold'
      }
    ]
    
    const { data: additionalData, error: additionalError } = await supabase
      .from('cultivars')
      .insert(additionalCultivars)
      .select()
    
    if (additionalError) {
      console.error('❌ Error inserting additional cultivars:', additionalError)
      // Continue anyway - we got the first one
    }
    
    return NextResponse.json({ 
      success: true, 
      message: 'Cultivars inserted successfully!',
      data: data,
      additionalData: additionalData || null,
      additionalError: additionalError || null
    })
    
  } catch (error) {
    console.error('❌ Operation failed:', error)
    return NextResponse.json({ 
      error: 'Operation failed', 
      details: error,
      message: 'Please create the cultivars table manually in Supabase SQL editor using the script: scripts/09-manual-cultivar-creation.sql'
    }, { status: 500 })
  }
}
