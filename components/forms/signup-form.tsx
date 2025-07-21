'use client'

import { useState } from 'react'
import { useRouter } from 'next/navigation'
import { Button } from '@/components/ui/button'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card'
import { Input } from '@/components/ui/input'
import { Label } from '@/components/ui/label'
import { Textarea } from '@/components/ui/textarea'
import { Checkbox } from '@/components/ui/checkbox'
import { Upload } from 'lucide-react'
import { useAuth } from '@/lib/auth/context'
import { validateEmail, validatePassword, validateRequired } from '@/lib/validations/schemas'
import type { SignupFormData } from '@/lib/validations/schemas'

interface SignupFormProps {
  onSuccess?: () => void
}

export function SignupForm({ onSuccess }: SignupFormProps) {
  const router = useRouter()
  const { signUp } = useAuth()
  const [formData, setFormData] = useState<SignupFormData>({
    farmName: '',
    ownerName: '',
    email: '',
    password: '',
    phone: '',
    address: '',
    description: '',
    certifications: [],
  })
  const [loading, setLoading] = useState(false)
  const [error, setError] = useState('')

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault()
    setError('')

    // Validation
    if (!validateRequired(formData.farmName)) {
      setError('Farm name is required')
      return
    }

    if (!validateRequired(formData.ownerName)) {
      setError('Owner name is required')
      return
    }

    if (!validateEmail(formData.email)) {
      setError('Please enter a valid email address')
      return
    }

    if (!validatePassword(formData.password)) {
      setError('Password must be at least 6 characters')
      return
    }

    if (!validateRequired(formData.address)) {
      setError('Address is required')
      return
    }

    setLoading(true)

    try {
      // Step 1: Create user account
      await signUp(formData.email, formData.password)

      // Step 2: Create farm (this would need to be handled in the auth context or a separate service)
      // For now, we'll just redirect and let the user create their farm profile later
      onSuccess?.() || router.push('/dashboard')
    } catch (err: any) {
      setError(err.message || 'An unexpected error occurred')
      console.error('Signup error:', err)
    } finally {
      setLoading(false)
    }
  }

  const handleCertificationChange = (certification: string, checked: boolean) => {
    setFormData(prev => ({
      ...prev,
      certifications: checked
        ? [...prev.certifications, certification]
        : prev.certifications.filter(c => c !== certification),
    }))
  }

  const certificationOptions = ['Organic', 'Non-GMO', 'Sustainable', 'Local']

  return (
    <Card>
      <CardHeader>
        <CardTitle>Farm Information</CardTitle>
        <CardDescription>Tell us about your farm and what makes it special</CardDescription>
      </CardHeader>
      <CardContent>
        <form onSubmit={handleSubmit} className="space-y-6">
          {error && (
            <div className="bg-red-50 border border-red-200 text-red-600 px-4 py-3 rounded-md">
              {error}
            </div>
          )}

          <div className="grid md:grid-cols-2 gap-4">
            <div className="space-y-2">
              <Label htmlFor="farmName">Farm Name *</Label>
              <Input
                id="farmName"
                value={formData.farmName}
                onChange={e => setFormData(prev => ({ ...prev, farmName: e.target.value }))}
                placeholder="Green Valley Farm"
                required
              />
            </div>
            <div className="space-y-2">
              <Label htmlFor="ownerName">Owner Name *</Label>
              <Input
                id="ownerName"
                value={formData.ownerName}
                onChange={e => setFormData(prev => ({ ...prev, ownerName: e.target.value }))}
                placeholder="John Smith"
                required
              />
            </div>
          </div>

          <div className="grid md:grid-cols-2 gap-4">
            <div className="space-y-2">
              <Label htmlFor="email">Email *</Label>
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
              <Label htmlFor="phone">Phone Number</Label>
              <Input
                id="phone"
                type="tel"
                value={formData.phone}
                onChange={e => setFormData(prev => ({ ...prev, phone: e.target.value }))}
                placeholder="(555) 123-4567"
                autoComplete="tel"
              />
            </div>
          </div>

          <div className="space-y-2">
            <Label htmlFor="password">Password *</Label>
            <Input
              id="password"
              type="password"
              value={formData.password}
              onChange={e => setFormData(prev => ({ ...prev, password: e.target.value }))}
              autoComplete="new-password"
              required
            />
          </div>

          <div className="space-y-2">
            <Label htmlFor="address">Farm Address *</Label>
            <Textarea
              id="address"
              value={formData.address}
              onChange={e => setFormData(prev => ({ ...prev, address: e.target.value }))}
              placeholder="123 Farm Road, Valley City, CA 12345"
              required
            />
          </div>

          <div className="space-y-2">
            <Label htmlFor="description">Farm Description</Label>
            <Textarea
              id="description"
              value={formData.description}
              onChange={e => setFormData(prev => ({ ...prev, description: e.target.value }))}
              placeholder="Tell customers about your farm, growing practices, and what makes your produce special..."
              rows={4}
            />
          </div>

          <div className="space-y-3">
            <Label>Certifications</Label>
            <div className="grid grid-cols-2 gap-3">
              {certificationOptions.map(cert => (
                <div key={cert} className="flex items-center space-x-2">
                  <Checkbox
                    id={cert}
                    checked={formData.certifications.includes(cert)}
                    onCheckedChange={checked => handleCertificationChange(cert, checked as boolean)}
                  />
                  <Label htmlFor={cert}>{cert}</Label>
                </div>
              ))}
            </div>
          </div>

          <Button
            type="submit"
            className="w-full bg-green-600 hover:bg-green-700"
            disabled={loading}
          >
            {loading ? 'Creating account...' : 'Register Farm'}
          </Button>
        </form>
      </CardContent>
    </Card>
  )
}
