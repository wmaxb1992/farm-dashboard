import { defineConfig } from 'drizzle-kit'

export default defineConfig({
  schema: './src/lib/db/schema.ts',
  out: './src/lib/db/migrations',
  dialect: 'postgresql',
  dbCredentials: {
    url: process.env.DATABASE_URL || process.env.SUPABASE_DB_URL || '',
  },
  verbose: true,
  strict: true,
})
