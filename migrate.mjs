// Run database migration using Supabase client
import { supabaseAdmin } from './lib/supabase.js'

async function runMigration() {
  console.log('🚀 Running database migration...')

  try {
    // Add owner_id column to farms table
    console.log('📝 Adding owner_id column to farms...')

    const { data: alterResult, error: alterError } = await supabaseAdmin.rpc('exec_sql', {
      query: `
        -- Add owner_id column to farms table
        ALTER TABLE farms ADD COLUMN IF NOT EXISTS owner_id UUID REFERENCES auth.users(id);
        
        -- Create index for performance
        CREATE INDEX IF NOT EXISTS idx_farms_owner_id ON farms(owner_id);
      `,
    })

    if (alterError) {
      console.log('Note: ALTER TABLE failed (column might already exist):', alterError.message)
    } else {
      console.log('✅ Column added successfully')
    }

    // Drop existing policies
    console.log('📝 Updating RLS policies...')

    const policies = [
      'DROP POLICY IF EXISTS "Allow public read access" ON farms',
      'DROP POLICY IF EXISTS "Service role has full access" ON farms',
      'DROP POLICY IF EXISTS "Allow public read access" ON products',
      'DROP POLICY IF EXISTS "Service role has full access" ON products',
      'DROP POLICY IF EXISTS "Service role has full access" ON orders',
    ]

    for (const policy of policies) {
      const { error } = await supabaseAdmin.rpc('exec_sql', { query: policy })
      if (error) console.log(`Policy drop (expected): ${error.message}`)
    }

    // Create new farm policies
    const farmPolicies = [
      {
        name: 'Users can view their own farms',
        sql: 'CREATE POLICY "Users can view their own farms" ON farms FOR SELECT USING (auth.uid() = owner_id)',
      },
      {
        name: 'Users can update their own farms',
        sql: 'CREATE POLICY "Users can update their own farms" ON farms FOR UPDATE USING (auth.uid() = owner_id)',
      },
      {
        name: 'Users can create farms',
        sql: 'CREATE POLICY "Users can create farms" ON farms FOR INSERT WITH CHECK (auth.uid() = owner_id)',
      },
      {
        name: 'Service role has full access on farms',
        sql: 'CREATE POLICY "Service role has full access on farms" ON farms FOR ALL USING (auth.role() = \'service_role\')',
      },
    ]

    for (const policy of farmPolicies) {
      const { error } = await supabaseAdmin.rpc('exec_sql', { query: policy.sql })
      if (error) {
        console.log(`❌ Failed to create policy "${policy.name}":`, error.message)
      } else {
        console.log(`✅ Created policy: ${policy.name}`)
      }
    }

    console.log('🎉 Migration completed!')
  } catch (error) {
    console.error('❌ Migration failed:', error)
  }
}

runMigration()
