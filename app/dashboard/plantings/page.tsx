'use client'

import { useState, useEffect } from 'react'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card'
import { Button } from '@/components/ui/button'
import { Input } from '@/components/ui/input'
import { Label } from '@/components/ui/label'
import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from '@/components/ui/select'
import {
  Dialog,
  DialogContent,
  DialogDescription,
  DialogHeader,
  DialogTitle,
  DialogTrigger,
} from '@/components/ui/dialog'
import { Plus, Sprout } from 'lucide-react'
import AgGridPlantings from '@/components/ag-grid-plantings'

interface Product {
  id: string
  name: string
  variety_name: string
  variety_id: string
}

interface Planting {
  id: string
  farm_variety_name: string
  variety_name: string
  planting_location: string
  planting_date: string
  crop_status: string
  growth_stage: string
  total_estimated_yield: number
  estimated_remaining_yield: number
  remaining_yield: number
  planted_quantity: number
  planted_area: number
  planted_area_unit: string
  notes: string
}

export default function PlantingsPage() {
  const [plantings, setPlantings] = useState<Planting[]>([])
  const [products, setProducts] = useState<Product[]>([])
  const [loading, setLoading] = useState(true)
  const [showAddDialog, setShowAddDialog] = useState(false)

  const [newPlanting, setNewPlanting] = useState({
    product_id: '',
    planted_date: '',
    total_estimated_yield: '',
    harvest_frequency_days: '7',
    growth_stage: 'planted',
    planting_location: '',
    planted_quantity: '',
    planted_area: '',
    planted_area_unit: 'sq_ft',
    notes: '',
  })

  const farmId = '850e8400-e29b-41d4-a716-446655440002'

  useEffect(() => {
    fetchData()
  }, [])

  const fetchData = async () => {
    try {
      setLoading(true)
      console.log('Starting to fetch data...')

      // Fetch existing plantings
      const plantingsResponse = await fetch(`/api/farm-plantings?farm_id=${farmId}`)
      if (plantingsResponse.ok) {
        const plantingsData = await plantingsResponse.json()
        console.log('Fetched plantings data:', plantingsData)
        console.log('Number of plantings:', plantingsData.plantings?.length || 0)

        // Transform and clean up the data for AG Grid
        const transformedPlantings = (plantingsData.plantings || []).map((planting: any) => ({
          id: planting.id,
          farm_variety_name:
            planting.farm_variety_name || planting.variety_name || 'Unknown Variety',
          variety_name: planting.variety_name || 'Unknown Variety',
          planting_location: planting.planting_location || planting.location || '',
          planting_date: planting.planting_date || planting.planted_date || '',
          crop_status: planting.crop_status || 'planted',
          growth_stage: planting.growth_stage || 'seedling',
          total_estimated_yield: planting.total_estimated_yield || 0,
          estimated_remaining_yield:
            planting.estimated_remaining_yield || planting.remaining_yield || 0,
          remaining_yield: planting.remaining_yield || planting.estimated_remaining_yield || 0,
          planted_quantity: planting.planted_quantity || 0,
          planted_area: planting.planted_area || 0,
          planted_area_unit: planting.planted_area_unit || 'sq_ft',
          notes: planting.notes || '',
        }))

        console.log('Transformed plantings:', transformedPlantings)
        setPlantings(transformedPlantings)
      } else {
        console.error('Plantings API error:', plantingsResponse.status)
      }

      // Fetch available products/varieties for planting
      const productsResponse = await fetch('/api/products')
      if (productsResponse.ok) {
        const productsData = await productsResponse.json()
        console.log('Available products:', productsData)
        console.log('Number of products:', productsData.products?.length || 0)
        setProducts(productsData.products || [])
      } else {
        console.error('Products API response:', productsResponse.status)
      }
    } catch (err) {
      console.error('Error fetching data:', err)
    } finally {
      setLoading(false)
      console.log('Finished fetching data, loading set to false')
    }
  }

  const addPlanting = async () => {
    try {
      const selectedProduct = products.find(p => p.id === newPlanting.product_id)
      if (!selectedProduct) {
        alert('Please select a valid product')
        return
      }

      console.log('Adding planting with data:', {
        farm_id: farmId,
        variety_id: selectedProduct.variety_id,
        farm_variety_name: selectedProduct.variety_name,
        ...newPlanting,
      })

      const response = await fetch('/api/farm-plantings', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          farm_id: farmId,
          variety_id: selectedProduct.variety_id,
          farm_variety_name: selectedProduct.variety_name,
          planting_location: newPlanting.planting_location,
          planting_date: newPlanting.planted_date,
          total_estimated_yield: parseFloat(newPlanting.total_estimated_yield),
          harvest_frequency_days: parseInt(newPlanting.harvest_frequency_days),
          crop_status: newPlanting.growth_stage,
          planted_quantity: newPlanting.planted_quantity
            ? parseInt(newPlanting.planted_quantity)
            : null,
          planted_area: newPlanting.planted_area ? parseFloat(newPlanting.planted_area) : null,
          planted_area_unit: newPlanting.planted_area_unit,
          notes: newPlanting.notes,
        }),
      })

      if (response.ok) {
        console.log('Planting added successfully')
        fetchData() // Refresh the data
        setShowAddDialog(false)
        setNewPlanting({
          product_id: '',
          planted_date: '',
          total_estimated_yield: '',
          harvest_frequency_days: '7',
          growth_stage: 'planted',
          planting_location: '',
          planted_quantity: '',
          planted_area: '',
          planted_area_unit: 'sq_ft',
          notes: '',
        })
      } else {
        const errorData = await response.json()
        console.error('Error adding planting:', errorData)
        alert(`Failed to add planting: ${errorData.error}`)
      }
    } catch (err) {
      console.error('Error adding planting:', err)
      alert('Failed to add planting')
    }
  }

  const handlePlantingUpdate = async (id: string, updatedData: Partial<Planting>) => {
    try {
      console.log('Updating planting:', id, updatedData)

      const response = await fetch('/api/farm-plantings', {
        method: 'PUT',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ id, ...updatedData }),
      })

      if (!response.ok) {
        const errorData = await response.json()
        throw new Error(errorData.error || 'Failed to update planting')
      }

      const result = await response.json()
      console.log('Planting updated successfully:', result)

      // Update local state
      setPlantings(prev => prev.map(p => (p.id === id ? { ...p, ...updatedData } : p)))
    } catch (error) {
      console.error('Error updating planting:', error)
      throw error
    }
  }

  if (loading) {
    return (
      <div className="flex items-center justify-center h-96">
        <div className="text-lg">Loading plantings...</div>
      </div>
    )
  }

  return (
    <div className="container mx-auto p-6 space-y-8">
      <div className="flex items-center justify-between">
        <div>
          <h1 className="text-3xl font-bold">Farm Plantings</h1>
          <p className="text-gray-600">Manage your crops and track their growth stages</p>
        </div>

        <Dialog open={showAddDialog} onOpenChange={setShowAddDialog}>
          <DialogTrigger asChild>
            <Button className="flex items-center space-x-2">
              <Plus className="h-4 w-4" />
              <span>Add New Planting</span>
            </Button>
          </DialogTrigger>
          <DialogContent className="sm:max-w-[600px]">
            <DialogHeader>
              <DialogTitle className="flex items-center space-x-2">
                <Sprout className="h-5 w-5" />
                <span>Add New Planting</span>
              </DialogTitle>
              <DialogDescription>Create a new planting record for your farm</DialogDescription>
            </DialogHeader>

            <div className="grid gap-4 py-4">
              <div className="grid grid-cols-2 gap-4">
                <div className="space-y-2">
                  <Label htmlFor="product">Product/Variety</Label>
                  <Select
                    value={newPlanting.product_id}
                    onValueChange={value => setNewPlanting({ ...newPlanting, product_id: value })}
                  >
                    <SelectTrigger>
                      <SelectValue placeholder="Select variety" />
                    </SelectTrigger>
                    <SelectContent>
                      {products.map(product => (
                        <SelectItem key={product.id} value={product.id}>
                          {product.variety_name} ({product.name})
                        </SelectItem>
                      ))}
                    </SelectContent>
                  </Select>
                </div>

                <div className="space-y-2">
                  <Label htmlFor="planted_date">Planted Date</Label>
                  <Input
                    id="planted_date"
                    type="date"
                    value={newPlanting.planted_date}
                    onChange={e => setNewPlanting({ ...newPlanting, planted_date: e.target.value })}
                  />
                </div>
              </div>

              <div className="grid grid-cols-2 gap-4">
                <div className="space-y-2">
                  <Label htmlFor="location">Location</Label>
                  <Input
                    id="location"
                    placeholder="e.g., Greenhouse A, Field 1"
                    value={newPlanting.planting_location}
                    onChange={e =>
                      setNewPlanting({ ...newPlanting, planting_location: e.target.value })
                    }
                  />
                </div>

                <div className="space-y-2">
                  <Label htmlFor="yield">Estimated Total Yield (lbs)</Label>
                  <Input
                    id="yield"
                    type="number"
                    placeholder="100"
                    value={newPlanting.total_estimated_yield}
                    onChange={e =>
                      setNewPlanting({ ...newPlanting, total_estimated_yield: e.target.value })
                    }
                  />
                </div>
              </div>

              <div className="grid grid-cols-3 gap-4">
                <div className="space-y-2">
                  <Label htmlFor="quantity">Planted Quantity</Label>
                  <Input
                    id="quantity"
                    type="number"
                    placeholder="50"
                    value={newPlanting.planted_quantity}
                    onChange={e =>
                      setNewPlanting({ ...newPlanting, planted_quantity: e.target.value })
                    }
                  />
                </div>

                <div className="space-y-2">
                  <Label htmlFor="area">Planted Area</Label>
                  <Input
                    id="area"
                    type="number"
                    placeholder="100"
                    value={newPlanting.planted_area}
                    onChange={e => setNewPlanting({ ...newPlanting, planted_area: e.target.value })}
                  />
                </div>

                <div className="space-y-2">
                  <Label htmlFor="area_unit">Area Unit</Label>
                  <Select
                    value={newPlanting.planted_area_unit}
                    onValueChange={value =>
                      setNewPlanting({ ...newPlanting, planted_area_unit: value })
                    }
                  >
                    <SelectTrigger>
                      <SelectValue />
                    </SelectTrigger>
                    <SelectContent>
                      <SelectItem value="sq_ft">sq ft</SelectItem>
                      <SelectItem value="sq_m">sq m</SelectItem>
                      <SelectItem value="acres">acres</SelectItem>
                      <SelectItem value="hectares">hectares</SelectItem>
                    </SelectContent>
                  </Select>
                </div>
              </div>

              <div className="space-y-2">
                <Label htmlFor="notes">Notes</Label>
                <Input
                  id="notes"
                  placeholder="Additional notes about this planting..."
                  value={newPlanting.notes}
                  onChange={e => setNewPlanting({ ...newPlanting, notes: e.target.value })}
                />
              </div>
            </div>

            <div className="flex justify-end space-x-2">
              <Button variant="outline" onClick={() => setShowAddDialog(false)}>
                Cancel
              </Button>
              <Button onClick={addPlanting}>Add Planting</Button>
            </div>
          </DialogContent>
        </Dialog>
      </div>

      {/* Summary Cards */}
      <div className="grid grid-cols-1 md:grid-cols-4 gap-6">
        <Card>
          <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
            <CardTitle className="text-sm font-medium">Total Plantings</CardTitle>
            <Sprout className="h-4 w-4 text-muted-foreground" />
          </CardHeader>
          <CardContent>
            <div className="text-2xl font-bold">{plantings.length}</div>
          </CardContent>
        </Card>

        <Card>
          <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
            <CardTitle className="text-sm font-medium">Ready to Harvest</CardTitle>
            <Sprout className="h-4 w-4 text-muted-foreground" />
          </CardHeader>
          <CardContent>
            <div className="text-2xl font-bold">
              {plantings.filter(p => p.crop_status === 'producing').length}
            </div>
          </CardContent>
        </Card>

        <Card>
          <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
            <CardTitle className="text-sm font-medium">Growing</CardTitle>
            <Sprout className="h-4 w-4 text-muted-foreground" />
          </CardHeader>
          <CardContent>
            <div className="text-2xl font-bold">
              {plantings.filter(p => p.crop_status === 'growing').length}
            </div>
          </CardContent>
        </Card>

        <Card>
          <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
            <CardTitle className="text-sm font-medium">Estimated Yield</CardTitle>
            <Sprout className="h-4 w-4 text-muted-foreground" />
          </CardHeader>
          <CardContent>
            <div className="text-2xl font-bold">
              {Math.round(
                plantings.reduce((sum, p) => sum + (p.estimated_remaining_yield || 0), 0)
              )}{' '}
              lbs
            </div>
          </CardContent>
        </Card>
      </div>

      {/* AG Grid Table */}
      <Card>
        <CardHeader>
          <CardTitle>Plantings Management</CardTitle>
          <CardDescription>
            Click "Unlock to Edit" to enable inline editing. Double-click any cell to edit values
            directly.
          </CardDescription>
        </CardHeader>
        <CardContent>
          <AgGridPlantings
            plantings={plantings}
            onPlantingUpdate={handlePlantingUpdate}
            onRefresh={fetchData}
          />
        </CardContent>
      </Card>
    </div>
  )
}
