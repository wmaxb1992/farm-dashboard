const fs = require('fs')
const path = require('path')

// Load environment variables manually
const envPath = path.join(__dirname, '.env.local')
const envFile = fs.readFileSync(envPath, 'utf8')
const envVars = {}

envFile.split('\n').forEach(line => {
  const [key, value] = line.split('=')
  if (key && value) {
    envVars[key.trim()] = value.trim()
  }
})

const supabaseUrl = envVars['NEXT_PUBLIC_SUPABASE_URL']
const serviceRoleKey = envVars['SUPABASE_SERVICE_ROLE_KEY']

if (!supabaseUrl || !serviceRoleKey) {
  console.error('Missing Supabase credentials in .env.local')
  process.exit(1)
}

console.log('🔗 Using Supabase URL:', supabaseUrl)
console.log('✅ Service role key found')

async function executeSQL(sql) {
  const response = await fetch(`${supabaseUrl}/rest/v1/rpc/query`, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      Authorization: `Bearer ${serviceRoleKey}`,
      apikey: serviceRoleKey,
    },
    body: JSON.stringify({ query: sql }),
  })

  if (!response.ok) {
    const text = await response.text()
    throw new Error(`HTTP ${response.status}: ${text}`)
  }

  return response.json()
}

async function applyMigration() {
  try {
    console.log('🚀 Applying batch pricing system migration...')

    // Read the migration file
    const migrationPath = path.join(
      __dirname,
      'supabase/migrations/20250115000000_add_batch_pricing_system.sql'
    )
    const migrationSQL = fs.readFileSync(migrationPath, 'utf8')

    console.log('📝 Migration file loaded successfully')
    console.log("⚠️  Note: Since Supabase doesn't support raw SQL execution via API,")
    console.log("   you'll need to copy and paste the SQL into the Supabase Dashboard")
    console.log('   Go to: https://supabase.com/dashboard/project/nlbxlnpukcjksvwqemet/sql')

    console.log('\n📋 Copy this SQL to your Supabase SQL Editor:')
    console.log('=' * 60)
    console.log(migrationSQL)
    console.log('=' * 60)

    console.log("\n🎉 After running the SQL, you'll have:")
    console.log('📋 New tables:')
    console.log('  - harvest_batches (batch-level tracking)')
    console.log('  - batch_pricing (dynamic pricing per batch)')
    console.log('  - batch_inventory (real-time inventory status)')
    console.log('  - market_pricing (price recommendations)')
    console.log('\n📊 New views:')
    console.log('  - batch_current_pricing (auto-discounting prices)')
    console.log('  - batch_inventory_status (inventory with freshness)')
    console.log('\n🔧 New functions:')
    console.log('  - get_price_recommendations()')
    console.log('  - update_batch_pricing()')
  } catch (error) {
    console.error('❌ Migration preparation failed:', error)
    process.exit(1)
  }
}

applyMigration()
