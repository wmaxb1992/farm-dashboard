import { NextResponse } from 'next/server'
import { supabase, getSupabaseAdmin } from '@/lib/database/client'

export async function GET() {
  try {
    // Check if environment variables are set
    const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL
    const supabaseAnonKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY
    const supabaseServiceKey = process.env.SUPABASE_SERVICE_ROLE_KEY

    if (!supabaseUrl || !supabaseAnonKey) {
      return NextResponse.json(
        {
          success: false,
          error: 'Environment variables not configured',
          message:
            'Missing required Supabase environment variables. Please check your .env.local file.',
          missingVars: {
            url: !supabaseUrl,
            anonKey: !supabaseAnonKey,
            serviceKey: !supabaseServiceKey,
          },
        },
        { status: 500 }
      )
    }

    // Test basic connection by trying to query one of our expected tables
    console.log('Testing connection to:', supabaseUrl)
    let connectionWorking = false
    let connectionError = null

    // Try a simple query first
    try {
      const { data: simpleTest } = await supabase!
        .from('categories')
        .select('count', { count: 'exact', head: true })
      connectionWorking = true
    } catch (err) {
      console.log('Categories table test failed, will check further...')
    }

    // If that didn't work, try the information_schema approach
    if (!connectionWorking) {
      const supabaseAdmin = getSupabaseAdmin()
      const { data: schemaTest, error: schemaError } = await supabaseAdmin.rpc('sql', {
        query: `SELECT table_name FROM information_schema.tables WHERE table_schema = 'public' AND table_type = 'BASE TABLE';`,
      })

      if (schemaError) {
        connectionError = schemaError
      } else {
        connectionWorking = true
      }
    }

    // Check for our specific tables by attempting to query each one
    const expectedTables = [
      'categories',
      'subcategories',
      'varieties',
      'farms',
      'users',
      'products',
      'orders',
      'order_items',
    ]

    if (!connectionWorking && connectionError) {
      return NextResponse.json(
        {
          success: false,
          error: connectionError.message,
          message: 'Failed to connect to Supabase database',
          supabaseUrl: supabaseUrl,
        },
        { status: 500 }
      )
    }

    // Test each table individually to see which ones exist
    const tableTests = await Promise.all(
      expectedTables.map(async tableName => {
        try {
          const client = supabase || getSupabaseAdmin()
          const { data, error } = await client
            .from(tableName)
            .select('*', { count: 'exact', head: true })

          return {
            name: tableName,
            exists: !error,
            error: error?.message || null,
          }
        } catch (err) {
          return {
            name: tableName,
            exists: false,
            error: err instanceof Error ? err.message : 'Unknown error',
          }
        }
      })
    )

    const existingTables = tableTests.filter(test => test.exists).map(test => test.name)
    const missingTables = tableTests.filter(test => !test.exists)

    return NextResponse.json({
      success: true,
      message: 'Successfully connected to Supabase!',
      timestamp: new Date().toISOString(),
      supabaseUrl: supabaseUrl,
      connection: {
        connected: true,
        tablesFound: existingTables.length,
        totalTables: existingTables.length,
      },
      tables: {
        expected: expectedTables,
        existing: existingTables,
        missing: missingTables.map(test => ({ name: test.name, error: test.error })),
        tableTests: tableTests,
      },
      recommendations:
        missingTables.length > 0
          ? [
              'Some expected tables are missing from your database.',
              "Run the SQL scripts in the 'scripts' folder to create the required tables.",
              'You can execute them in the Supabase SQL editor.',
              `Missing tables: ${missingTables.map(t => t.name).join(', ')}`,
            ]
          : ['All expected tables are present in your database!'],
    })
  } catch (error) {
    console.error('Unexpected error:', error)
    return NextResponse.json(
      {
        success: false,
        error: error instanceof Error ? error.message : 'Unknown error',
        message: 'Failed to test connection',
        stack: error instanceof Error ? error.stack : undefined,
      },
      { status: 500 }
    )
  }
}
