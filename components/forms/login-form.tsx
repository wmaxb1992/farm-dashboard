'use client'

import { useState } from 'react'
import { useRouter } from 'next/navigation'
import { Button } from '@/components/ui/button'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card'
import { Input } from '@/components/ui/input'
import { Label } from '@/components/ui/label'
import { useAuth } from '@/lib/auth/context'
import { validateEmail, validatePassword } from '@/lib/validations/schemas'
import type { LoginFormData } from '@/lib/validations/schemas'

interface LoginFormProps {
  onSuccess?: () => void
}

export function LoginForm({ onSuccess }: LoginFormProps) {
  const router = useRouter()
  const { signIn } = useAuth()
  const [formData, setFormData] = useState<LoginFormData>({
    email: '',
    password: '',
  })
  const [loading, setLoading] = useState(false)
  const [error, setError] = useState('')

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault()
    setError('')

    // Validation
    if (!validateEmail(formData.email)) {
      setError('Please enter a valid email address')
      return
    }

    if (!validatePassword(formData.password)) {
      setError('Password must be at least 6 characters')
      return
    }

    setLoading(true)

    try {
      await signIn(formData.email, formData.password)
      onSuccess?.() || router.push('/dashboard')
    } catch (err: any) {
      setError(err.message || 'An unexpected error occurred')
      console.error('Login error:', err)
    } finally {
      setLoading(false)
    }
  }

  return (
    <Card>
      <CardHeader>
        <CardTitle>Sign In</CardTitle>
        <CardDescription>Enter your credentials to access your farm dashboard</CardDescription>
      </CardHeader>
      <CardContent>
        <form onSubmit={handleSubmit} className="space-y-4">
          {error && (
            <div className="bg-red-50 border border-red-200 text-red-600 px-4 py-3 rounded-md">
              {error}
            </div>
          )}

          <div className="space-y-2">
            <Label htmlFor="email">Email</Label>
            <Input
              id="email"
              type="email"
              value={formData.email}
              onChange={e => setFormData(prev => ({ ...prev, email: e.target.value }))}
              placeholder="john@greenvalleyfarm.com"
              autoComplete="email"
              required
            />
          </div>

          <div className="space-y-2">
            <Label htmlFor="password">Password</Label>
            <Input
              id="password"
              type="password"
              value={formData.password}
              onChange={e => setFormData(prev => ({ ...prev, password: e.target.value }))}
              autoComplete="current-password"
              required
            />
          </div>

          <Button
            type="submit"
            className="w-full bg-green-600 hover:bg-green-700"
            disabled={loading}
          >
            {loading ? 'Signing in...' : 'Sign In'}
          </Button>
        </form>
      </CardContent>
    </Card>
  )
}
