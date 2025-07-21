'use client'

import { Leaf } from 'lucide-react'
import { LoginForm } from '@/components/forms/login-form'

export default function LoginPage() {
  return (
    <div className="min-h-screen bg-gradient-to-br from-green-50 to-green-100 flex items-center justify-center p-4">
      <div className="max-w-md w-full space-y-8">
        <div className="text-center">
          <div className="mx-auto h-12 w-12 flex items-center justify-center rounded-full bg-green-600">
            <Leaf className="h-6 w-6 text-white" />
          </div>
          <h2 className="mt-6 text-3xl font-bold tracking-tight text-gray-900">Welcome back</h2>
          <p className="mt-2 text-sm text-gray-600">Sign in to your farm dashboard</p>
        </div>
        <LoginForm />
      </div>
    </div>
  )
}
