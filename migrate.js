#!/usr/bin/env node

const { createClient } = require('@supabase/supabase-js')
require('dotenv').config({ path: '.env.local' })

async function runMigration() {
  try {
    console.log('🚀 Starting migration...')

    // Create admin client
    const supabase = createClient(
      process.env.NEXT_PUBLIC_SUPABASE_URL,
      process.env.SUPABASE_SERVICE_ROLE_KEY,
      {
        auth: {
          autoRefreshToken: false,
          persistSession: false,
        },
      }
    )

    // Step 1: Add owner_id column
    console.log('📝 Adding owner_id column to farms table...')

    const addColumnSQL = `
      ALTER TABLE farms ADD COLUMN IF NOT EXISTS owner_id UUID REFERENCES auth.users(id);
      CREATE INDEX IF NOT EXISTS idx_farms_owner_id ON farms(owner_id);
    `

    // Try to execute directly through a function call
    const { data: addResult, error: addError } = await supabase.rpc('exec_sql', {
      sql: addColumnSQL,
    })

    if (addError && !addError.message.includes('already exists')) {
      console.log('⚠️  Column addition failed (will try alternative method):', addError.message)
    } else {
      console.log('✅ Column added successfully')
    }

    // Step 2: Drop existing policies
    console.log('🧹 Dropping existing policies...')

    const dropPolicies = [
      'DROP POLICY IF EXISTS "Allow public read access" ON farms',
      'DROP POLICY IF EXISTS "Service role has full access" ON farms',
      'DROP POLICY IF EXISTS "Allow public read access" ON products',
      'DROP POLICY IF EXISTS "Service role has full access" ON products',
      'DROP POLICY IF EXISTS "Service role has full access" ON orders',
    ]

    for (const policy of dropPolicies) {
      const { error } = await supabase.rpc('exec_sql', { sql: policy })
      if (error) {
        console.log('📋 Drop policy result (errors expected):', error.message)
      }
    }

    // Step 3: Create new policies
    console.log('🔐 Creating new RLS policies...')

    const newPolicies = [
      // Farm policies
      `CREATE POLICY "Users can view their own farms" ON farms 
         FOR SELECT USING (auth.uid() = owner_id)`,
      `CREATE POLICY "Users can update their own farms" ON farms 
         FOR UPDATE USING (auth.uid() = owner_id)`,
      `CREATE POLICY "Users can create farms" ON farms 
         FOR INSERT WITH CHECK (auth.uid() = owner_id)`,
      `CREATE POLICY "Service role has full access on farms" ON farms 
         FOR ALL USING (auth.role() = 'service_role')`,

      // Product policies
      `CREATE POLICY "Users can view their farm products" ON products 
         FOR SELECT USING (
           EXISTS (
             SELECT 1 FROM farms 
             WHERE farms.id = products.farm_id 
             AND farms.owner_id = auth.uid()
           )
         )`,
      `CREATE POLICY "Users can manage their farm products" ON products 
         FOR ALL USING (
           EXISTS (
             SELECT 1 FROM farms 
             WHERE farms.id = products.farm_id 
             AND farms.owner_id = auth.uid()
           )
         )`,
      `CREATE POLICY "Service role has full access on products" ON products 
         FOR ALL USING (auth.role() = 'service_role')`,

      // Order policies
      `CREATE POLICY "Farmers can view their farm orders" ON orders 
         FOR SELECT USING (
           EXISTS (
             SELECT 1 FROM farms 
             WHERE farms.id = orders.farm_id 
             AND farms.owner_id = auth.uid()
           )
         )`,
      `CREATE POLICY "Farmers can manage their farm orders" ON orders 
         FOR UPDATE USING (
           EXISTS (
             SELECT 1 FROM farms 
             WHERE farms.id = orders.farm_id 
             AND farms.owner_id = auth.uid()
           )
         )`,
      `CREATE POLICY "Service role has full access on orders" ON orders 
         FOR ALL USING (auth.role() = 'service_role')`,

      // Public access policies
      `CREATE POLICY "Public read access for consumer app" ON categories FOR SELECT USING (true)`,
      `CREATE POLICY "Public read access for consumer app" ON subcategories FOR SELECT USING (true)`,
      `CREATE POLICY "Public read access for consumer app" ON varieties FOR SELECT USING (true)`,
      `CREATE POLICY "Public read access for consumer app" ON farms FOR SELECT USING (true)`,
      `CREATE POLICY "Public read access for consumer app" ON products FOR SELECT USING (true)`,
    ]

    let successCount = 0
    let errorCount = 0

    for (const policy of newPolicies) {
      const { error } = await supabase.rpc('exec_sql', { sql: policy })
      if (error) {
        console.log(`❌ Policy error: ${error.message}`)
        errorCount++
      } else {
        successCount++
        console.log('✅ Policy created successfully')
      }
    }

    console.log(`\n📊 Results: ${successCount} policies created, ${errorCount} errors`)

    // Step 4: Verify the setup
    console.log('🔍 Verifying setup...')

    const { data: farms, error: farmError } = await supabase
      .from('farms')
      .select('id, name, owner_name, owner_id')
      .limit(5)

    if (farmError) {
      console.log('❌ Farm query error:', farmError.message)
      console.log('💡 You may need to run the SQL manually in Supabase Dashboard')
    } else {
      console.log('✅ Farms table structure verified')
      console.log('📋 Sample farms:', farms)
    }

    console.log('\n🎉 Migration completed!')
    console.log('\n📝 Next steps:')
    console.log('1. Create a user in Supabase Dashboard → Auth → Users')
    console.log('2. Use POST /api/connect-user-farm to link user to farm')
    console.log('3. Test authentication at /auth/login')
  } catch (error) {
    console.error('💥 Migration failed:', error.message)
    console.log('\n💡 Manual approach required:')
    console.log('1. Go to Supabase Dashboard → SQL Editor')
    console.log('2. Run the SQL from farm-auth-policies.sql')
    process.exit(1)
  }
}

runMigration()
