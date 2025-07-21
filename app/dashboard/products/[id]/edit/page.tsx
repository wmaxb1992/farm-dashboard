'use client'

import { useState, useEffect } from 'react'
import { useRouter, useParams } from 'next/navigation'
import { Button } from '@/components/ui/button'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card'
import { Input } from '@/components/ui/input'
import { Label } from '@/components/ui/label'
import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from '@/components/ui/select'
import { Switch } from '@/components/ui/switch'
import { toast } from '@/hooks/use-toast'
import { ArrowLeft, Save, Loader2 } from 'lucide-react'

interface Product {
  id: string
  name: string
  variety_id: string
  subcategory_id: string
  category_id: string
  price: number
  stock: number
  unit: string
  description: string
  image: string
  organic: boolean
  in_season: boolean
  freshness_days: number
  farm_id: string
}

interface Variety {
  id: string
  name: string
  emoji: string
}

interface Category {
  id: string
  name: string
  subcategories: Array<{
    id: string
    name: string
    varieties: Variety[]
  }>
}

export default function EditProductPage() {
  const router = useRouter()
  const params = useParams()
  const productId = params.id as string
  
  const [loading, setLoading] = useState(true)
  const [saving, setSaving] = useState(false)
  const [product, setProduct] = useState<Product | null>(null)
  const [categories, setCategories] = useState<Category[]>([])
  const [varieties, setVarieties] = useState<Variety[]>([])
  const [formData, setFormData] = useState({
    name: '',
    variety_id: '',
    farm_id: '',
    price: '',
    stock: '',
    organic: false,
    in_season: false,
  })

  useEffect(() => {
    fetchProduct()
    fetchCategories()
  }, [productId])

  const fetchCategories = async () => {
    try {
      const response = await fetch('/api/categories')
      if (!response.ok) throw new Error('Failed to fetch categories')
      
      const data = await response.json()
      setCategories(data.categories)
      
      // Flatten varieties from all categories
      const allVarieties: Variety[] = []
      data.categories.forEach((category: Category) => {
        category.subcategories.forEach((subcategory) => {
          allVarieties.push(...subcategory.varieties)
        })
      })
      setVarieties(allVarieties)
    } catch (error) {
      console.error('Error fetching categories:', error)
    }
  }

  const fetchProduct = async () => {
    try {
      const response = await fetch(`/api/products/${productId}`)
      if (!response.ok) throw new Error('Failed to fetch product')
      
      const data = await response.json()
      setProduct(data.product)
      setFormData({
        name: data.product.name || '',
        variety_id: data.product.variety_id || '',
        farm_id: data.product.farm_id || '',
        price: data.product.price?.toString() || '',
        stock: data.product.stock?.toString() || '',
        organic: data.product.organic || false,
        in_season: data.product.in_season || false,
      })
    } catch (error) {
      console.error('Error fetching product:', error)
      toast({
        title: 'Error',
        description: 'Failed to load product details',
        variant: 'destructive',
      })
    } finally {
      setLoading(false)
    }
  }

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault()
    setSaving(true)

    try {
      const response = await fetch(`/api/products/${productId}`, {
        method: 'PUT',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({
          name: formData.name,
          variety_id: formData.variety_id,
          farm_id: formData.farm_id,
          price: parseFloat(formData.price),
          stock: parseInt(formData.stock),
          organic: formData.organic,
          in_season: formData.in_season,
        }),
      })

      if (!response.ok) throw new Error('Failed to update product')

      toast({
        title: 'Success',
        description: 'Product updated successfully',
      })

      router.push('/dashboard/products')
    } catch (error) {
      console.error('Error updating product:', error)
      toast({
        title: 'Error',
        description: 'Failed to update product',
        variant: 'destructive',
      })
    } finally {
      setSaving(false)
    }
  }

  if (loading) {
    return (
      <div className="flex items-center justify-center min-h-screen">
        <Loader2 className="h-8 w-8 animate-spin" />
      </div>
    )
  }

  if (!product) {
    return (
      <div className="flex items-center justify-center min-h-screen">
        <Card>
          <CardContent className="pt-6">
            <p>Product not found</p>
            <Button onClick={() => router.push('/dashboard/products')} className="mt-4">
              Back to Products
            </Button>
          </CardContent>
        </Card>
      </div>
    )
  }

  return (
    <div className="space-y-6">
      <div className="flex items-center gap-4">
        <Button
          variant="ghost"
          size="icon"
          onClick={() => router.push('/dashboard/products')}
        >
          <ArrowLeft className="h-4 w-4" />
        </Button>
        <div>
          <h1 className="text-2xl font-bold">Edit Product</h1>
          <p className="text-gray-600">Update product details</p>
        </div>
      </div>

      <Card>
        <CardHeader>
          <CardTitle>Product Information</CardTitle>
          <CardDescription>Edit the details of your product</CardDescription>
        </CardHeader>
        <CardContent>
          <div className="bg-yellow-50 border border-yellow-200 text-yellow-700 px-4 py-3 rounded-md text-sm mb-6">
            <strong>Note:</strong> This edit form currently shows basic fields only. Additional fields like unit, description, and images are not yet available in the edit interface.
          </div>
          
          <form onSubmit={handleSubmit} className="space-y-6">
            <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
              <div className="space-y-2">
                <Label htmlFor="name">Product Name</Label>
                <Input
                  id="name"
                  value={formData.name}
                  onChange={(e) => setFormData(prev => ({ ...prev, name: e.target.value }))}
                  required
                />
              </div>

              <div className="space-y-2">
                <Label htmlFor="variety_id">Variety</Label>
                <Select value={formData.variety_id} onValueChange={(value) => setFormData(prev => ({ ...prev, variety_id: value }))}>
                  <SelectTrigger>
                    <SelectValue placeholder="Select variety" />
                  </SelectTrigger>
                  <SelectContent>
                    {varieties.map((variety) => (
                      <SelectItem key={variety.id} value={variety.id}>
                        {variety.emoji} {variety.name}
                      </SelectItem>
                    ))}
                  </SelectContent>
                </Select>
              </div>

              <div className="space-y-2">
                <Label htmlFor="price">Price</Label>
                <Input
                  id="price"
                  type="number"
                  step="0.01"
                  value={formData.price}
                  onChange={(e) => setFormData(prev => ({ ...prev, price: e.target.value }))}
                  required
                />
              </div>

              <div className="space-y-2">
                <Label htmlFor="stock">Stock Quantity</Label>
                <Input
                  id="stock"
                  type="number"
                  value={formData.stock}
                  onChange={(e) => setFormData(prev => ({ ...prev, stock: e.target.value }))}
                  required
                />
              </div>
            </div>

            <div className="flex items-center justify-between">
              <div className="flex items-center space-x-2">
                <Switch
                  id="organic"
                  checked={formData.organic}
                  onCheckedChange={(checked) => setFormData(prev => ({ ...prev, organic: checked }))}
                />
                <Label htmlFor="organic">Organic</Label>
              </div>

              <div className="flex items-center space-x-2">
                <Switch
                  id="in_season"
                  checked={formData.in_season}
                  onCheckedChange={(checked) => setFormData(prev => ({ ...prev, in_season: checked }))}
                />
                <Label htmlFor="in_season">In Season</Label>
              </div>
            </div>

            <div className="flex gap-4">
              <Button
                type="button"
                variant="outline"
                onClick={() => router.push('/dashboard/products')}
              >
                Cancel
              </Button>
              <Button type="submit" disabled={saving}>
                {saving ? (
                  <>
                    <Loader2 className="h-4 w-4 mr-2 animate-spin" />
                    Saving...
                  </>
                ) : (
                  <>
                    <Save className="h-4 w-4 mr-2" />
                    Save Changes
                  </>
                )}
              </Button>
            </div>
          </form>
        </CardContent>
      </Card>
    </div>
  )
}
