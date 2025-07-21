'use client'

import { useState } from 'react'
import { useRouter } from 'next/navigation'
import { Button } from '@/components/ui/button'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card'
import { Input } from '@/components/ui/input'
import { Label } from '@/components/ui/label'
import { Checkbox } from '@/components/ui/checkbox'
import { Slider } from '@/components/ui/slider'
import { Upload } from 'lucide-react'
import { validateProduct } from '@/lib/validations/schemas'
import type { ProductFormData } from '@/lib/validations/schemas'
import { VarietySearch } from '@/components/ui/variety-search'

interface Variety {
  id: string
  name: string
  emoji: string
  displayName: string
  fullPath: string
  type?: 'variety' | 'cultivar' // New field to distinguish between varieties and cultivars
  variety_id?: string // For cultivars - reference to parent variety
  cultivar_id?: string // For varieties that have cultivars
  characteristics?: string // For cultivars
  botanical_name?: string // For cultivars
}

interface ProductFormProps {
  onSubmit?: (data: ProductFormData) => Promise<void>
  initialData?: Partial<ProductFormData>
  isLoading?: boolean
}

export function ProductForm({ onSubmit, initialData, isLoading }: ProductFormProps) {
  const router = useRouter()
  const [formData, setFormData] = useState<ProductFormData>({
    name: initialData?.name || '',
    farm_id: initialData?.farm_id || '00000000-0000-0000-0000-000000000001', // TODO: Get from user session
    variety_id: initialData?.variety_id || '',
    cultivar_id: initialData?.cultivar_id || '',
    cultivar_name: initialData?.cultivar_name || '',
    price: initialData?.price || 0,
    stock: initialData?.stock || 0,
    freshness: initialData?.freshness || 95,
    harvest_date: initialData?.harvest_date || '',
    pre_harvest: initialData?.pre_harvest || false,
    organic: initialData?.organic || false,
    in_season: initialData?.in_season || true,
    delivery_days: initialData?.delivery_days || [],
    images: initialData?.images || [],
  })
  const [error, setError] = useState('')

  const handleVarietySelect = (variety: Variety) => {
    setFormData(prev => {
      if (variety.type === 'cultivar') {
        // If it's a cultivar, set both variety_id and cultivar_id
        return {
          ...prev,
          variety_id: variety.variety_id || '',
          cultivar_id: variety.id,
          cultivar_name: variety.name,
          name: variety.displayName // Set product name to cultivar display name
        }
      } else {
        // If it's a variety, set only variety_id
        return {
          ...prev,
          variety_id: variety.id,
          cultivar_id: '',
          cultivar_name: '',
          name: variety.name // Set product name to variety name
        }
      }
    })
  }

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault()
    setError('')

    // Validate
    const validation = validateProduct(formData)
    if (!validation.isValid) {
      setError(validation.errors.join(', '))
      return
    }

    try {
      if (onSubmit) {
        await onSubmit(formData)
      } else {
        // Default submit behavior
        const response = await fetch('/api/products', {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify(formData),
        })

        if (!response.ok) {
          throw new Error('Failed to create product')
        }

        router.push('/dashboard/products')
      }
    } catch (err) {
      setError(err instanceof Error ? err.message : 'An unexpected error occurred')
    }
  }

  return (
    <Card className="max-w-4xl mx-auto">
      <CardHeader>
        <CardTitle>Add New Product</CardTitle>
        <CardDescription>Add a new product to your farm's inventory</CardDescription>
      </CardHeader>
      <CardContent>
        <form onSubmit={handleSubmit} className="space-y-6">
          <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
            {/* Basic Information */}
            <div className="space-y-4">
              <VarietySearch
                value={formData.variety_id}
                onVarietySelect={handleVarietySelect}
                placeholder="Search for a variety or product name..."
                required
              />

              <div className="space-y-2">
                <Label htmlFor="price">Price ($)</Label>
                <Input
                  id="price"
                  type="number"
                  step="0.01"
                  value={formData.price || ''}
                  onChange={e =>
                    setFormData(prev => ({ ...prev, price: parseFloat(e.target.value) }))
                  }
                  placeholder="4.99"
                  required
                />
              </div>

              <div className="space-y-2">
                <Label htmlFor="stock">Stock Quantity</Label>
                <Input
                  id="stock"
                  type="number"
                  value={formData.stock || ''}
                  onChange={e =>
                    setFormData(prev => ({ ...prev, stock: parseInt(e.target.value) }))
                  }
                  placeholder="50"
                  required
                />
              </div>

              <div className="space-y-2">
                <Label htmlFor="harvest_date">Harvest Date</Label>
                <Input
                  id="harvest_date"
                  type="date"
                  value={formData.harvest_date}
                  onChange={e => setFormData(prev => ({ ...prev, harvest_date: e.target.value }))}
                  required
                />
              </div>
            </div>

            {/* Additional Details */}
            <div className="space-y-4">
              <div className="space-y-2">
                <Label>Freshness Score: {formData.freshness}%</Label>
                <Slider
                  value={[formData.freshness]}
                  onValueChange={([value]) =>
                    setFormData(prev => ({ ...prev, freshness: value }))
                  }
                  max={100}
                  min={1}
                  step={1}
                  className="py-4"
                />
              </div>

              <div className="flex items-center space-x-2">
                <Checkbox
                  id="pre_harvest"
                  checked={formData.pre_harvest}
                  onCheckedChange={checked =>
                    setFormData(prev => ({ ...prev, pre_harvest: !!checked }))
                  }
                />
                <Label htmlFor="pre_harvest">Pre-harvest (not yet harvested)</Label>
              </div>

              <div className="flex items-center space-x-2">
                <Checkbox
                  id="organic"
                  checked={formData.organic}
                  onCheckedChange={checked =>
                    setFormData(prev => ({ ...prev, organic: !!checked }))
                  }
                />
                <Label htmlFor="organic">Organic</Label>
              </div>

              <div className="flex items-center space-x-2">
                <Checkbox
                  id="in_season"
                  checked={formData.in_season}
                  onCheckedChange={checked =>
                    setFormData(prev => ({ ...prev, in_season: !!checked }))
                  }
                />
                <Label htmlFor="in_season">In Season</Label>
              </div>

              <div className="space-y-2">
                <Label htmlFor="delivery_days">Delivery Days (comma-separated)</Label>
                <Input
                  id="delivery_days"
                  value={formData.delivery_days.join(', ')}
                  onChange={e => setFormData(prev => ({ 
                    ...prev, 
                    delivery_days: e.target.value.split(',').map(day => day.trim()).filter(Boolean)
                  }))}
                  placeholder="Monday, Wednesday, Friday"
                />
              </div>

              <div className="space-y-2">
                <Label htmlFor="images">Images (comma-separated URLs)</Label>
                <Input
                  id="images"
                  value={formData.images.join(', ')}
                  onChange={e => setFormData(prev => ({ 
                    ...prev, 
                    images: e.target.value.split(',').map(url => url.trim()).filter(Boolean)
                  }))}
                  placeholder="https://example.com/image1.jpg, https://example.com/image2.jpg"
                />
              </div>
            </div>
          </div>

          {error && (
            <div className="bg-red-50 border border-red-200 text-red-700 px-4 py-3 rounded-md text-sm">
              {error}
            </div>
          )}

          <div className="flex gap-4 pt-4">
            <Button
              type="button"
              variant="outline"
              onClick={() => router.back()}
              disabled={isLoading}
            >
              Cancel
            </Button>
            <Button type="submit" className="bg-green-600 hover:bg-green-700" disabled={isLoading}>
              {isLoading ? 'Creating...' : 'Create Product'}
            </Button>
          </div>
        </form>
      </CardContent>
    </Card>
  )
}
