'use client'

import { useState } from 'react'
import { Button } from '@/components/ui/button'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card'
import { Input } from '@/components/ui/input'
import { Label } from '@/components/ui/label'

export default function TestSignupPage() {
  console.log('TestSignupPage rendering...')
  const [email, setEmail] = useState('')
  const [password, setPassword] = useState('')

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault()
    console.log('Form submitted:', { email, password })
    alert('Form submitted!')
  }

  return (
    <div className="min-h-screen bg-gradient-to-br from-green-50 to-emerald-100 py-8">
      <div className="container mx-auto px-4 max-w-md">
        <Card>
          <CardHeader>
            <CardTitle>Test Signup</CardTitle>
            <CardDescription>Simple signup form test</CardDescription>
          </CardHeader>
          <CardContent>
            <form onSubmit={handleSubmit} className="space-y-4">
              <div>
                <Label htmlFor="email">Email</Label>
                <Input
                  id="email"
                  type="email"
                  value={email}
                  onChange={e => setEmail(e.target.value)}
                  required
                />
              </div>
              <div>
                <Label htmlFor="password">Password</Label>
                <Input
                  id="password"
                  type="password"
                  value={password}
                  onChange={e => setPassword(e.target.value)}
                  required
                />
              </div>
              <Button type="submit" className="w-full">
                Test Signup
              </Button>
            </form>
          </CardContent>
        </Card>
      </div>
    </div>
  )
}
