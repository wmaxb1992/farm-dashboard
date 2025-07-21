'use client'

export default function DebugEnvPage() {
  console.log('Environment debug...')

  const envVars = {
    supabaseUrl: process.env.NEXT_PUBLIC_SUPABASE_URL,
    supabaseAnonKey: process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY ? 'EXISTS' : 'MISSING',
    nodeEnv: process.env.NODE_ENV,
  }

  console.log('Environment variables:', envVars)

  return (
    <div className="p-8">
      <h1>Environment Debug</h1>
      <pre className="bg-gray-100 p-4 rounded">{JSON.stringify(envVars, null, 2)}</pre>
    </div>
  )
}
