'use client'

import { useState } from 'react'
import { Button } from '@/components/ui/button'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card'
import { Input } from '@/components/ui/input'
import { Label } from '@/components/ui/label'

export default function TestSupabasePage() {
  console.log('TestSupabasePage rendering...')
  const [email, setEmail] = useState('')
  const [password, setPassword] = useState('')
  const [status, setStatus] = useState('Ready')

  const testSupabase = async () => {
    try {
      setStatus('Testing Supabase...')
      console.log('About to import Supabase...')

      // Dynamic import to catch any import errors
      const { supabase } = await import('@/lib/supabase')
      console.log('Supabase imported successfully:', !!supabase)

      setStatus('Supabase imported successfully')
    } catch (error) {
      console.error('Supabase import error:', error)
      setStatus(`Error: ${error}`)
    }
  }

  return (
    <div className="min-h-screen bg-gradient-to-br from-green-50 to-emerald-100 py-8">
      <div className="container mx-auto px-4 max-w-md">
        <Card>
          <CardHeader>
            <CardTitle>Test Supabase Import</CardTitle>
            <CardDescription>Test if Supabase import causes issues</CardDescription>
          </CardHeader>
          <CardContent className="space-y-4">
            <div>
              <p>Status: {status}</p>
            </div>
            <Button onClick={testSupabase} className="w-full">
              Test Supabase Import
            </Button>
          </CardContent>
        </Card>
      </div>
    </div>
  )
}
