import { createClient } from '@supabase/supabase-js'
import { drizzle } from 'drizzle-orm/postgres-js'
import postgres from 'postgres'
import { schema } from './schema'

// Environment validation
const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL
const supabaseAnonKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY
const databaseUrl = process.env.DATABASE_URL

if (!supabaseUrl || !supabaseAnonKey) {
  console.warn('Missing Supabase environment variables')
}

// Client-side Supabase client
export const supabase =
  supabaseUrl && supabaseAnonKey ? createClient(supabaseUrl, supabaseAnonKey) : null

// Drizzle database client
let _db: ReturnType<typeof drizzle> | null = null

export const getDatabase = () => {
  if (!_db) {
    if (!databaseUrl) {
      throw new Error('DATABASE_URL environment variable is required')
    }
    
    const client = postgres(databaseUrl)
    _db = drizzle(client, { schema })
  }
  return _db
}

// Export db instance for convenience
export const db = getDatabase()

// Server-side admin client
let _supabaseAdmin: ReturnType<typeof createClient> | null = null

export const getSupabaseAdmin = () => {
  if (!_supabaseAdmin) {
    const serviceKey = process.env.SUPABASE_SERVICE_ROLE_KEY

    if (!supabaseUrl || !serviceKey) {
      throw new Error('Missing Supabase admin environment variables')
    }

    _supabaseAdmin = createClient(supabaseUrl, serviceKey, {
      auth: {
        autoRefreshToken: false,
        persistSession: false,
      },
    })
  }
  return _supabaseAdmin
}

// For backward compatibility in server contexts
export const supabaseAdmin =
  typeof window === 'undefined'
    ? (() => {
        try {
          return getSupabaseAdmin()
        } catch {
          return null
        }
      })()
    : null
