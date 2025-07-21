'use client'

import { useState, useEffect } from 'react'
import { Button } from '@/components/ui/button'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card'
import { Badge } from '@/components/ui/badge'
import { Tabs, TabsContent, TabsList, TabsTrigger } from '@/components/ui/tabs'
import {
  Table,
  TableBody,
  TableCell,
  TableHead,
  TableHeader,
  TableRow,
} from '@/components/ui/table'
import { CalendarDays, Package, TrendingUp, AlertTriangle, DollarSign, Plus } from 'lucide-react'
import Link from 'next/link'

interface BatchData {
  id: string
  batch_number: string
  variety_name: string
  harvest_date: string
  quantity_harvested: number
  unit: string
  quality_grade: string
  status: 'projected' | 'actual'
  current_price?: number
  quantity_available: number
  quantity_reserved: number
  quantity_sold: number
  quantity_expired: number
  organic: boolean
  notes?: string
}

export default function BatchesPage() {
  const [batches, setBatches] = useState<BatchData[]>([])
  const [loading, setLoading] = useState(true)
  const [selectedStatus, setSelectedStatus] = useState<string>('all')
  const [showCreateDialog, setShowCreateDialog] = useState(false)

  // Use the farm ID that actually exists in your database
  const farmId = '850e8400-e29b-41d4-a716-446655440002'

  useEffect(() => {
    fetchBatches()
  }, [selectedStatus])

  const fetchBatches = async () => {
    try {
      setLoading(true)
      const params = new URLSearchParams({ farm_id: farmId })
      if (selectedStatus !== 'all') {
        params.append('status', selectedStatus)
      }

      const response = await fetch(`/api/harvest-batches?${params}`)
      if (response.ok) {
        const data = await response.json()
        setBatches(data.batches || [])
      }
    } catch (error) {
      console.error('Error fetching batches:', error)
    } finally {
      setLoading(false)
    }
  }

  const getStatusBadge = (status: string) => {
    const variants = {
      projected: 'bg-blue-100 text-blue-800',
      actual: 'bg-green-100 text-green-800',
    }
    return variants[status as keyof typeof variants] || variants.actual
  }

  const getStatusIcon = (status: string) => {
    switch (status) {
      case 'projected':
        return <CalendarDays className="h-4 w-4" />
      case 'actual':
        return <Package className="h-4 w-4" />
      default:
        return <Package className="h-4 w-4" />
    }
  }

  const getInventoryStatus = (batch: BatchData) => {
    if (batch.quantity_available === 0) return 'sold_out'
    if (batch.quantity_available < 10) return 'low_stock'
    return 'available'
  }

  const getInventoryBadge = (inventoryStatus: string) => {
    const variants = {
      available: 'bg-green-100 text-green-800',
      low_stock: 'bg-yellow-100 text-yellow-800',
      sold_out: 'bg-gray-100 text-gray-800',
    }
    return variants[inventoryStatus as keyof typeof variants] || variants.available
  }

  const getInventorySummary = () => {
    return batches.reduce(
      (acc, batch) => {
        acc.total += batch.quantity_harvested || 0
        acc.available += batch.quantity_available || 0
        acc.reserved += batch.quantity_reserved || 0
        acc.sold += batch.quantity_sold || 0
        acc.expired += batch.quantity_expired || 0
        return acc
      },
      { total: 0, available: 0, reserved: 0, sold: 0, expired: 0 }
    )
  }

  const summary = getInventorySummary()

  return (
    <div className="space-y-6">
      <div className="flex justify-between items-center">
        <div>
          <h1 className="text-3xl font-bold tracking-tight">Harvest Batches</h1>
          <p className="text-muted-foreground">
            Manage your harvest batches, pricing, and inventory
          </p>
        </div>
        <Button onClick={() => setShowCreateDialog(true)}>Create New Batch</Button>
      </div>

      {/* Summary Cards */}
      <div className="grid gap-4 md:grid-cols-2 lg:grid-cols-4">
        <Card>
          <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
            <CardTitle className="text-sm font-medium">Total Harvested</CardTitle>
            <Package className="h-4 w-4 text-muted-foreground" />
          </CardHeader>
          <CardContent>
            <div className="text-2xl font-bold">{summary.total.toFixed(1)} lbs</div>
          </CardContent>
        </Card>

        <Card>
          <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
            <CardTitle className="text-sm font-medium">Available</CardTitle>
            <Package className="h-4 w-4 text-green-600" />
          </CardHeader>
          <CardContent>
            <div className="text-2xl font-bold">{summary.available.toFixed(1)} lbs</div>
          </CardContent>
        </Card>

        <Card>
          <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
            <CardTitle className="text-sm font-medium">Reserved</CardTitle>
            <CalendarDays className="h-4 w-4 text-blue-600" />
          </CardHeader>
          <CardContent>
            <div className="text-2xl font-bold">{summary.reserved.toFixed(1)} lbs</div>
          </CardContent>
        </Card>

        <Card>
          <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
            <CardTitle className="text-sm font-medium">Revenue Potential</CardTitle>
            <DollarSign className="h-4 w-4 text-muted-foreground" />
          </CardHeader>
          <CardContent>
            <div className="text-2xl font-bold">
              $
              {batches
                .reduce(
                  (acc, batch) =>
                    acc + (batch.quantity_available || 0) * (batch.current_price || 0),
                  0
                )
                .toFixed(2)}
            </div>
          </CardContent>
        </Card>
      </div>

      {/* Batches Table */}
      <Card>
        <CardHeader>
          <div className="flex items-center justify-between">
            <div>
              <CardTitle>Harvest Batches</CardTitle>
              <CardDescription>Manage your harvest batch inventory and pricing</CardDescription>
            </div>
            <Link href="/dashboard/harvests">
              <Button>
                <Plus className="h-4 w-4 mr-2" />
                New Harvest
              </Button>
            </Link>
          </div>
        </CardHeader>
        <CardContent>
          {loading ? (
            <div className="text-center py-8">
              <div className="animate-spin rounded-full h-8 w-8 border-b-2 border-green-600 mx-auto"></div>
              <p className="mt-2 text-gray-500">Loading batches...</p>
            </div>
          ) : (
            <Table>
              <TableHeader>
                <TableRow>
                  <TableHead>Batch #</TableHead>
                  <TableHead>Variety</TableHead>
                  <TableHead>Harvest Date</TableHead>
                  <TableHead>Status</TableHead>
                  <TableHead>Available</TableHead>
                  <TableHead>Reserved</TableHead>
                  <TableHead>Price</TableHead>
                  <TableHead>Inventory Status</TableHead>
                </TableRow>
              </TableHeader>
              <TableBody>
                {batches.map(batch => {
                  const inventoryStatus = getInventoryStatus(batch)
                  return (
                    <TableRow key={batch.id}>
                      <TableCell className="font-medium">{batch.batch_number}</TableCell>
                      <TableCell>
                        <div>
                          <p className="font-medium">{batch.variety_name}</p>
                          {batch.organic && (
                            <Badge variant="outline" className="text-xs mt-1">
                              Organic
                            </Badge>
                          )}
                        </div>
                      </TableCell>
                      <TableCell>
                        {batch.status === 'projected' ? (
                          <div className="text-blue-600">
                            {new Date(batch.harvest_date).toLocaleDateString()}
                            <br />
                            <span className="text-xs">(Projected)</span>
                          </div>
                        ) : (
                          new Date(batch.harvest_date).toLocaleDateString()
                        )}
                      </TableCell>
                      <TableCell>
                        <Badge className={getStatusBadge(batch.status)}>
                          {getStatusIcon(batch.status)}
                          <span className="ml-1 capitalize">{batch.status}</span>
                        </Badge>
                      </TableCell>
                      <TableCell>
                        {batch.quantity_available} {batch.unit}
                      </TableCell>
                      <TableCell>
                        {batch.quantity_reserved} {batch.unit}
                      </TableCell>
                      <TableCell>
                        ${(batch.current_price || 0).toFixed(2)} / {batch.unit}
                      </TableCell>
                      <TableCell>
                        <Badge className={getInventoryBadge(inventoryStatus)}>
                          {inventoryStatus.replace('_', ' ')}
                        </Badge>
                      </TableCell>
                    </TableRow>
                  )
                })}
              </TableBody>
            </Table>
          )}

          {!loading && batches.length === 0 && (
            <div className="text-center py-8">
              <Package className="h-12 w-12 text-gray-400 mx-auto mb-4" />
              <h3 className="text-lg font-semibold text-gray-900 mb-2">No batches found</h3>
              <p className="text-gray-500 mb-4">
                Get started by creating your first harvest batch.
              </p>
              <Link href="/dashboard/harvests">
                <Button>
                  <Plus className="h-4 w-4 mr-2" />
                  Create First Harvest
                </Button>
              </Link>
            </div>
          )}
        </CardContent>
      </Card>
    </div>
  )
}
