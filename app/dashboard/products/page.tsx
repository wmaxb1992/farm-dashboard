'use client'

import { useState, useEffect } from 'react'
import Link from 'next/link'
import Image from 'next/image'
import { useRouter } from 'next/navigation'
import { Button } from '@/components/ui/button'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card'
import { Badge } from '@/components/ui/badge'
import { Input } from '@/components/ui/input'
import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from '@/components/ui/select'
import {
  Table,
  TableBody,
  TableCell,
  TableHead,
  TableHeader,
  TableRow,
} from '@/components/ui/table'
import {
  DropdownMenu,
  DropdownMenuContent,
  DropdownMenuItem,
  DropdownMenuTrigger,
} from '@/components/ui/dropdown-menu'
import { Plus, Search, Filter, MoreHorizontal, Edit, Trash2, Eye } from 'lucide-react'

interface Product {
  id: string
  name: string
  variety: string
  category: string
  price: number
  stock: number
  freshness: number
  inSeason: boolean
  organic: boolean
  image: string
  farm: any
  farm_id: string
}

export default function ProductsPage() {
  const router = useRouter()
  const [searchTerm, setSearchTerm] = useState('')
  const [categoryFilter, setCategoryFilter] = useState('all')
  const [products, setProducts] = useState<Product[]>([])
  const [loading, setLoading] = useState(true)

  // Fetch products from API
  const fetchProducts = async () => {
    try {
      // TODO: Get the current user's farm ID from auth context
      // For now, we'll show all products, but this needs to be farm-specific
      const response = await fetch('/api/products')
      const data = await response.json()

      if (data.products) {
        // Transform API data to match the expected format
        const transformedProducts = data.products.map((product: any) => ({
          id: product.id,
          name: product.name,
          variety: product.variety?.name || 'Unknown',
          category: product.variety?.subcategory?.category?.name || 'Other',
          price: product.price,
          stock: product.stock,
          freshness: product.freshness,
          inSeason: product.in_season,
          organic: product.organic,
          image: product.images?.[0] || '/placeholder.svg?height=60&width=60',
          farm: product.farm,
          farm_id: product.farm_id, // Add farm_id to track ownership
        }))
        setProducts(transformedProducts)
      }
    } catch (error) {
      console.error('Error fetching products:', error)
    } finally {
      setLoading(false)
    }
  }

  const handleEditProduct = (productId: string) => {
    router.push(`/dashboard/products/${productId}/edit`)
  }

  const handleDeleteProduct = async (productId: string) => {
    if (!confirm('Are you sure you want to delete this product?')) return

    try {
      const response = await fetch(`/api/products/${productId}`, {
        method: 'DELETE',
      })

      if (!response.ok) throw new Error('Failed to delete product')

      // Refresh the products list
      fetchProducts()
    } catch (error) {
      console.error('Error deleting product:', error)
      alert('Failed to delete product')
    }
  }

  // Fetch products from API
  useEffect(() => {
    fetchProducts()
  }, [])

  const filteredProducts = products.filter(product => {
    const matchesSearch = product.name.toLowerCase().includes(searchTerm.toLowerCase())
    const matchesCategory = categoryFilter === 'all' || product.category === categoryFilter
    return matchesSearch && matchesCategory
  })

  return (
    <div className="space-y-6">
      {/* Security Warning - Remove in production */}
      <div className="bg-yellow-50 border border-yellow-200 rounded-lg p-4">
        <div className="flex">
          <div className="flex-shrink-0">
            <svg className="h-5 w-5 text-yellow-400" viewBox="0 0 20 20" fill="currentColor">
              <path fillRule="evenodd" d="M8.257 3.099c.765-1.36 2.722-1.36 3.486 0l5.58 9.92c.75 1.334-.213 2.98-1.742 2.98H4.42c-1.53 0-2.493-1.646-1.743-2.98l5.58-9.92zM11 13a1 1 0 11-2 0 1 1 0 012 0zm-1-8a1 1 0 00-1 1v3a1 1 0 002 0V6a1 1 0 00-1-1z" clipRule="evenodd" />
            </svg>
          </div>
          <div className="ml-3">
            <h3 className="text-sm font-medium text-yellow-800">
              Development Mode
            </h3>
            <div className="mt-2 text-sm text-yellow-700">
              <p>
                Currently showing all products. In production, this will be filtered to show only your farm's products.
                Authentication and farm-specific access control is being implemented.
              </p>
            </div>
          </div>
        </div>
      </div>
      
      <div className="flex items-center justify-between">
        <div>
          <h1 className="text-3xl font-bold text-gray-900">Products</h1>
          <p className="text-gray-600">Manage your farm's produce inventory</p>
        </div>
        <Link href="/dashboard/products/new">
          <Button className="bg-green-600 hover:bg-green-700">
            <Plus className="h-4 w-4 mr-2" />
            Add Product
          </Button>
        </Link>
      </div>

      {/* Filters */}
      <Card>
        <CardContent className="pt-6">
          <div className="flex flex-col sm:flex-row gap-4">
            <div className="flex-1">
              <div className="relative">
                <Search className="absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-400 h-4 w-4" />
                <Input
                  placeholder="Search products..."
                  value={searchTerm}
                  onChange={e => setSearchTerm(e.target.value)}
                  className="pl-10"
                />
              </div>
            </div>
            <Select value={categoryFilter} onValueChange={setCategoryFilter}>
              <SelectTrigger className="w-full sm:w-48">
                <Filter className="h-4 w-4 mr-2" />
                <SelectValue placeholder="Filter by category" />
              </SelectTrigger>
              <SelectContent>
                <SelectItem value="all">All Categories</SelectItem>
                <SelectItem value="Vegetables">Vegetables</SelectItem>
                <SelectItem value="Fruits">Fruits</SelectItem>
                <SelectItem value="Herbs">Herbs</SelectItem>
                <SelectItem value="Leafy Greens">Leafy Greens</SelectItem>
                <SelectItem value="Root Vegetables">Root Vegetables</SelectItem>
              </SelectContent>
            </Select>
          </div>
        </CardContent>
      </Card>

      {/* Products Table */}
      <Card>
        <CardHeader>
          <CardTitle>Your Products ({loading ? '...' : filteredProducts.length})</CardTitle>
          <CardDescription>Manage pricing, stock levels, and product details</CardDescription>
        </CardHeader>
        <CardContent>
          {loading ? (
            <div className="flex items-center justify-center py-8">
              <div className="text-center">
                <div className="animate-spin rounded-full h-8 w-8 border-b-2 border-green-600 mx-auto mb-2"></div>
                <p className="text-gray-600">Loading your products...</p>
              </div>
            </div>
          ) : products.length === 0 ? (
            <div className="text-center py-8">
              <p className="text-gray-600 mb-4">
                No products found. Start by adding your first product!
              </p>
              <Link href="/dashboard/products/new">
                <Button className="bg-green-600 hover:bg-green-700">
                  <Plus className="h-4 w-4 mr-2" />
                  Add Your First Product
                </Button>
              </Link>
            </div>
          ) : (
            <div className="overflow-x-auto">
              <Table>
                <TableHeader>
                  <TableRow>
                    <TableHead>Product</TableHead>
                    <TableHead>Category</TableHead>
                    <TableHead>Price</TableHead>
                    <TableHead>Stock</TableHead>
                    <TableHead>Freshness</TableHead>
                    <TableHead>Status</TableHead>
                    <TableHead className="text-right">Actions</TableHead>
                  </TableRow>
                </TableHeader>
                <TableBody>
                  {filteredProducts.map(product => (
                    <TableRow key={product.id}>
                      <TableCell>
                        <div className="flex items-center gap-3">
                          <Image
                            src={product.image || '/placeholder.svg'}
                            alt={product.name}
                            width={40}
                            height={40}
                            className="rounded-lg object-cover"
                          />
                          <div>
                            <p className="font-medium">{product.name}</p>
                            <p className="text-sm text-gray-500">{product.variety}</p>
                          </div>
                        </div>
                      </TableCell>
                      <TableCell>{product.category}</TableCell>
                      <TableCell>${product.price}</TableCell>
                      <TableCell>
                        <span
                          className={`font-medium ${product.stock < 10 ? 'text-red-600' : 'text-green-600'}`}
                        >
                          {product.stock}
                        </span>
                      </TableCell>
                      <TableCell>
                        <div className="flex items-center gap-2">
                          <div className="w-12 bg-gray-200 rounded-full h-2">
                            <div
                              className="bg-green-600 h-2 rounded-full"
                              style={{ width: `${product.freshness}%` }}
                            />
                          </div>
                          <span className="text-sm">{product.freshness}%</span>
                        </div>
                      </TableCell>
                      <TableCell>
                        <div className="flex gap-1">
                          {product.inSeason && <Badge variant="secondary">In Season</Badge>}
                          {product.organic && <Badge variant="outline">Organic</Badge>}
                        </div>
                      </TableCell>
                      <TableCell className="text-right">
                        <DropdownMenu>
                          <DropdownMenuTrigger asChild>
                            <Button variant="ghost" size="icon">
                              <MoreHorizontal className="h-4 w-4" />
                            </Button>
                          </DropdownMenuTrigger>
                          <DropdownMenuContent align="end">
                            <DropdownMenuItem>
                              <Eye className="h-4 w-4 mr-2" />
                              View Details
                            </DropdownMenuItem>
                            <DropdownMenuItem onClick={() => handleEditProduct(product.id)}>
                              <Edit className="h-4 w-4 mr-2" />
                              Edit Product
                            </DropdownMenuItem>
                            <DropdownMenuItem 
                              className="text-red-600"
                              onClick={() => handleDeleteProduct(product.id)}
                            >
                              <Trash2 className="h-4 w-4 mr-2" />
                              Delete Product
                            </DropdownMenuItem>
                          </DropdownMenuContent>
                        </DropdownMenu>
                      </TableCell>
                    </TableRow>
                  ))}
                </TableBody>
              </Table>
            </div>
          )}
        </CardContent>
      </Card>
    </div>
  )
}
