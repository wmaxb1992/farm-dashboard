'use client'

import type React from 'react'

import { useState } from 'react'
import Image from 'next/image'
import { Button } from '@/components/ui/button'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card'
import { Input } from '@/components/ui/input'
import { Label } from '@/components/ui/label'
import { Textarea } from '@/components/ui/textarea'
import { Checkbox } from '@/components/ui/checkbox'
import { Badge } from '@/components/ui/badge'
import { Upload, MapPin, Phone, Mail, Globe, Award } from 'lucide-react'

export default function ProfilePage() {
  const [isEditing, setIsEditing] = useState(false)
  const [formData, setFormData] = useState({
    farmName: 'Green Valley Farm',
    ownerName: 'John Doe',
    email: 'john@greenvalleyfarm.com',
    phone: '(555) 123-4567',
    website: 'www.greenvalleyfarm.com',
    address: '123 Farm Road, Valley City, CA 12345',
    description:
      "Family-owned organic farm specializing in fresh vegetables and herbs. We've been serving our community with the highest quality produce for over 20 years.",
    certifications: ['Organic', 'Non-GMO', 'Sustainable'],
    specialties: ['Heirloom Tomatoes', 'Fresh Herbs', 'Leafy Greens'],
    deliveryZones: ['Valley City', 'Riverside', 'Mountain View'],
    logo: '/placeholder.svg?height=100&width=100',
    coverImage: '/placeholder.svg?height=300&width=800',
  })

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault()
    console.log('Updated farm profile:', formData)
    setIsEditing(false)
  }

  const handleFileUpload =
    (field: 'logo' | 'coverImage') => (e: React.ChangeEvent<HTMLInputElement>) => {
      const file = e.target.files?.[0]
      if (file) {
        const url = URL.createObjectURL(file)
        setFormData(prev => ({ ...prev, [field]: url }))
      }
    }

  const handleCertificationChange = (cert: string, checked: boolean) => {
    setFormData(prev => ({
      ...prev,
      certifications: checked
        ? [...prev.certifications, cert]
        : prev.certifications.filter(c => c !== cert),
    }))
  }

  return (
    <div className="space-y-6">
      <div className="flex items-center justify-between">
        <div>
          <h1 className="text-3xl font-bold text-gray-900">Farm Profile</h1>
          <p className="text-gray-600">Manage your farm information and public profile</p>
        </div>
        <Button
          onClick={() => setIsEditing(!isEditing)}
          variant={isEditing ? 'outline' : 'default'}
        >
          {isEditing ? 'Cancel' : 'Edit Profile'}
        </Button>
      </div>

      {/* Cover Image */}
      <Card>
        <CardContent className="p-0">
          <div className="relative h-48 md:h-64 bg-gradient-to-r from-green-400 to-emerald-600 rounded-t-lg overflow-hidden">
            <Image
              src={formData.coverImage || '/placeholder.svg'}
              alt="Farm cover"
              fill
              className="object-cover"
            />
            {isEditing && (
              <div className="absolute inset-0 bg-black bg-opacity-50 flex items-center justify-center">
                <div className="text-center">
                  <Upload className="h-8 w-8 text-white mx-auto mb-2" />
                  <input
                    type="file"
                    accept="image/*"
                    onChange={handleFileUpload('coverImage')}
                    className="hidden"
                    id="cover-upload"
                  />
                  <Label
                    htmlFor="cover-upload"
                    className="cursor-pointer text-white hover:text-gray-200"
                  >
                    Update Cover Image
                  </Label>
                </div>
              </div>
            )}
          </div>
          <div className="p-6">
            <div className="flex flex-col md:flex-row md:items-end gap-4">
              <div className="relative">
                <div className="w-24 h-24 rounded-full border-4 border-white shadow-lg overflow-hidden bg-white">
                  <Image
                    src={formData.logo || '/placeholder.svg'}
                    alt="Farm logo"
                    width={96}
                    height={96}
                    className="object-cover"
                  />
                </div>
                {isEditing && (
                  <div className="absolute inset-0 bg-black bg-opacity-50 rounded-full flex items-center justify-center">
                    <input
                      type="file"
                      accept="image/*"
                      onChange={handleFileUpload('logo')}
                      className="hidden"
                      id="logo-upload"
                    />
                    <Label htmlFor="logo-upload" className="cursor-pointer">
                      <Upload className="h-5 w-5 text-white" />
                    </Label>
                  </div>
                )}
              </div>
              <div className="flex-1">
                <h2 className="text-2xl font-bold text-gray-900">{formData.farmName}</h2>
                <p className="text-gray-600">{formData.ownerName}</p>
                <div className="flex flex-wrap gap-2 mt-2">
                  {formData.certifications.map(cert => (
                    <Badge key={cert} variant="secondary">
                      <Award className="h-3 w-3 mr-1" />
                      {cert}
                    </Badge>
                  ))}
                </div>
              </div>
            </div>
          </div>
        </CardContent>
      </Card>

      <form onSubmit={handleSubmit} className="space-y-6">
        <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
          {/* Basic Information */}
          <Card>
            <CardHeader>
              <CardTitle>Basic Information</CardTitle>
              <CardDescription>Your farm's core details</CardDescription>
            </CardHeader>
            <CardContent className="space-y-4">
              <div className="space-y-2">
                <Label htmlFor="farmName">Farm Name</Label>
                <Input
                  id="farmName"
                  value={formData.farmName}
                  onChange={e => setFormData(prev => ({ ...prev, farmName: e.target.value }))}
                  disabled={!isEditing}
                />
              </div>
              <div className="space-y-2">
                <Label htmlFor="ownerName">Owner Name</Label>
                <Input
                  id="ownerName"
                  value={formData.ownerName}
                  onChange={e => setFormData(prev => ({ ...prev, ownerName: e.target.value }))}
                  disabled={!isEditing}
                />
              </div>
              <div className="space-y-2">
                <Label htmlFor="description">Farm Description</Label>
                <Textarea
                  id="description"
                  value={formData.description}
                  onChange={e => setFormData(prev => ({ ...prev, description: e.target.value }))}
                  disabled={!isEditing}
                  rows={4}
                />
              </div>
            </CardContent>
          </Card>

          {/* Contact Information */}
          <Card>
            <CardHeader>
              <CardTitle>Contact Information</CardTitle>
              <CardDescription>How customers can reach you</CardDescription>
            </CardHeader>
            <CardContent className="space-y-4">
              <div className="space-y-2">
                <Label htmlFor="email">Email</Label>
                <div className="relative">
                  <Mail className="absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-400 h-4 w-4" />
                  <Input
                    id="email"
                    type="email"
                    value={formData.email}
                    onChange={e => setFormData(prev => ({ ...prev, email: e.target.value }))}
                    disabled={!isEditing}
                    className="pl-10"
                  />
                </div>
              </div>
              <div className="space-y-2">
                <Label htmlFor="phone">Phone</Label>
                <div className="relative">
                  <Phone className="absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-400 h-4 w-4" />
                  <Input
                    id="phone"
                    type="tel"
                    value={formData.phone}
                    onChange={e => setFormData(prev => ({ ...prev, phone: e.target.value }))}
                    disabled={!isEditing}
                    className="pl-10"
                  />
                </div>
              </div>
              <div className="space-y-2">
                <Label htmlFor="website">Website</Label>
                <div className="relative">
                  <Globe className="absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-400 h-4 w-4" />
                  <Input
                    id="website"
                    value={formData.website}
                    onChange={e => setFormData(prev => ({ ...prev, website: e.target.value }))}
                    disabled={!isEditing}
                    className="pl-10"
                  />
                </div>
              </div>
              <div className="space-y-2">
                <Label htmlFor="address">Farm Address</Label>
                <div className="relative">
                  <MapPin className="absolute left-3 top-3 text-gray-400 h-4 w-4" />
                  <Textarea
                    id="address"
                    value={formData.address}
                    onChange={e => setFormData(prev => ({ ...prev, address: e.target.value }))}
                    disabled={!isEditing}
                    className="pl-10"
                    rows={2}
                  />
                </div>
              </div>
            </CardContent>
          </Card>
        </div>

        {/* Certifications & Specialties */}
        <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
          <Card>
            <CardHeader>
              <CardTitle>Certifications</CardTitle>
              <CardDescription>Your farm's certifications and credentials</CardDescription>
            </CardHeader>
            <CardContent>
              <div className="space-y-3">
                {['Organic', 'Non-GMO', 'Sustainable', 'Local', 'Fair Trade'].map(cert => (
                  <div key={cert} className="flex items-center space-x-2">
                    <Checkbox
                      id={cert}
                      checked={formData.certifications.includes(cert)}
                      onCheckedChange={checked =>
                        handleCertificationChange(cert, checked as boolean)
                      }
                      disabled={!isEditing}
                    />
                    <Label htmlFor={cert}>{cert}</Label>
                  </div>
                ))}
              </div>
            </CardContent>
          </Card>

          <Card>
            <CardHeader>
              <CardTitle>Farm Specialties</CardTitle>
              <CardDescription>What your farm is known for</CardDescription>
            </CardHeader>
            <CardContent>
              <div className="space-y-4">
                <div className="flex flex-wrap gap-2">
                  {formData.specialties.map((specialty, index) => (
                    <Badge key={index} variant="outline">
                      {specialty}
                    </Badge>
                  ))}
                </div>
                {isEditing && (
                  <div className="space-y-2">
                    <Label>Add Specialty</Label>
                    <Input placeholder="e.g., Heirloom Tomatoes" />
                  </div>
                )}
              </div>
            </CardContent>
          </Card>
        </div>

        {/* Delivery Zones */}
        <Card>
          <CardHeader>
            <CardTitle>Delivery Zones</CardTitle>
            <CardDescription>Areas where you deliver your produce</CardDescription>
          </CardHeader>
          <CardContent>
            <div className="space-y-4">
              <div className="flex flex-wrap gap-2">
                {formData.deliveryZones.map((zone, index) => (
                  <Badge key={index} variant="secondary">
                    <MapPin className="h-3 w-3 mr-1" />
                    {zone}
                  </Badge>
                ))}
              </div>
              {isEditing && (
                <div className="space-y-2">
                  <Label>Add Delivery Zone</Label>
                  <Input placeholder="e.g., Downtown Area" />
                </div>
              )}
            </div>
          </CardContent>
        </Card>

        {isEditing && (
          <div className="flex gap-4">
            <Button type="submit" className="bg-green-600 hover:bg-green-700">
              Save Changes
            </Button>
            <Button type="button" variant="outline" onClick={() => setIsEditing(false)}>
              Cancel
            </Button>
          </div>
        )}
      </form>
    </div>
  )
}
