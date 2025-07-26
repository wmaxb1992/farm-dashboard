'use client'

import { useEffect, useState } from 'react'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card'
import { Badge } from '@/components/ui/badge'
import { Button } from '@/components/ui/button'
import {
  ShoppingCart,
  Package,
  Users,
  DollarSign,
  Clock,
  CheckCircle,
  AlertCircle,
  Sprout,
  TrendingUp,
  Calendar,
  Package2,
} from 'lucide-react'
import Link from 'next/link'
import { useFarmStore } from '@/lib/stores/farm-store'
import { useOrders, useHarvestBatches, useFarmPlantings } from '@/lib/hooks/use-farm-queries'

interface DashboardStats {
  totalOrders: number
  activeBatches: number
  totalRevenue: number
  activePlantings: number
  totalHarvested: number
  lowStockBatches: number
}

interface Order {
  id: string
  order_number: string
  user?: { name: string }
  order_items?: Array<{ product: { name: string } }>
  total: number
  status: string
}

interface BatchSummary {
  id: string
  batch_number: string
  variety_name: string
  harvest_date: string
  quantity_available: number
  unit: string
  status: string
  current_price: number
}

interface PlantingSummary {
  id: string
  variety_name: string
  planted_date: string
  projected_harvest_date: string
  projected_quantity: number
  unit: string
  status: string
}

export default function DashboardPage() {
  const [stats, setStats] = useState<DashboardStats>({
    totalOrders: 0,
    activeBatches: 0,
    totalRevenue: 0,
    activePlantings: 0,
    totalHarvested: 0,
    lowStockBatches: 0,
  })
  const [recentOrders, setRecentOrders] = useState<Order[]>([])
  const [upcomingHarvests, setUpcomingHarvests] = useState<PlantingSummary[]>([])
  const [lowStockBatches, setLowStockBatches] = useState<BatchSummary[]>([])

  const { farmId } = useFarmStore()
  const { data: orders = [], isLoading: ordersLoading } = useOrders(farmId || '')
  const { data: batches = [], isLoading: batchesLoading } = useHarvestBatches(farmId || '')
  const { data: plantings = [], isLoading: plantingsLoading } = useFarmPlantings(farmId || '')
  
  const loading = ordersLoading || batchesLoading || plantingsLoading

  useEffect(() => {
    if (!loading && orders && batches && plantings) {
      calculateStats()
    }
  }, [orders, batches, plantings, loading])

  const calculateStats = () => {
    const totalRevenue = orders.reduce((sum: number, order: any) => sum + (order.total || order.total_amount || 0), 0)
    const totalHarvested = batches
      .filter((batch: any) => batch.status === 'actual')
      .reduce((sum: number, batch: any) => sum + (batch.quantity_harvested || batch.quantity || 0), 0)

    const activePlantings = plantings.filter(
      (planting: any) => planting.status === 'active' || planting.crop_status === 'active'
    ).length
    const lowStockCount = batches.filter(
      (batch: any) => (batch.quantity_available || batch.quantity || 0) > 0 && (batch.quantity_available || batch.quantity || 0) < 10
    ).length

    setStats({
      totalOrders: orders.length,
      activeBatches: batches.filter((batch: any) => (batch.quantity_available || batch.quantity || 0) > 0).length,
      totalRevenue: totalRevenue,
      activePlantings: activePlantings,
      totalHarvested: totalHarvested,
      lowStockBatches: lowStockCount,
    })

    setRecentOrders(orders.slice(0, 4))

    const upcomingPlantings = plantings
      .filter((planting: any) => (planting.status === 'active' || planting.crop_status === 'active') && (planting.projected_harvest_date || planting.planting_date))
      .sort(
        (a: any, b: any) =>
          new Date(a.projected_harvest_date || a.planting_date).getTime() -
          new Date(b.projected_harvest_date || b.planting_date).getTime()
      )
      .slice(0, 3)
    setUpcomingHarvests(upcomingPlantings)

    const lowStockBatches = batches
      .filter((batch: any) => (batch.quantity_available || batch.quantity || 0) > 0 && (batch.quantity_available || batch.quantity || 0) < 10)
      .slice(0, 3)
    setLowStockBatches(lowStockBatches)
  }

  if (loading) {
    return (
      <div className="space-y-6">
        <div>
          <h1 className="text-3xl font-bold text-gray-900">Dashboard</h1>
          <p className="text-gray-600">Loading your farm data...</p>
        </div>
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
          {[1, 2, 3, 4].map(i => (
            <Card key={i}>
              <CardContent className="pt-6">
                <div className="animate-pulse">
                  <div className="h-4 bg-gray-200 rounded w-1/2 mb-2"></div>
                  <div className="h-8 bg-gray-200 rounded w-1/3"></div>
                </div>
              </CardContent>
            </Card>
          ))}
        </div>
      </div>
    )
  }

  return (
    <div className="space-y-6">
      <div>
        <h1 className="text-3xl font-bold text-gray-900">Dashboard</h1>
        <p className="text-gray-600">Welcome back! Here's what's happening with your farm.</p>
      </div>

      {/* Stats Cards */}
      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
        <Card>
          <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
            <CardTitle className="text-sm font-medium">Total Orders</CardTitle>
            <ShoppingCart className="h-4 w-4 text-muted-foreground" />
          </CardHeader>
          <CardContent>
            <div className="text-2xl font-bold">{stats.totalOrders}</div>
            <p className="text-xs text-muted-foreground">+12% from last month</p>
          </CardContent>
        </Card>

        <Card>
          <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
            <CardTitle className="text-sm font-medium">Active Batches</CardTitle>
            <Package2 className="h-4 w-4 text-muted-foreground" />
          </CardHeader>
          <CardContent>
            <div className="text-2xl font-bold">{stats.activeBatches}</div>
            <p className="text-xs text-muted-foreground">Ready for sale</p>
          </CardContent>
        </Card>

        <Card>
          <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
            <CardTitle className="text-sm font-medium">Total Revenue</CardTitle>
            <DollarSign className="h-4 w-4 text-muted-foreground" />
          </CardHeader>
          <CardContent>
            <div className="text-2xl font-bold">${stats.totalRevenue.toFixed(2)}</div>
            <p className="text-xs text-muted-foreground">+8% from last month</p>
          </CardContent>
        </Card>

        <Card>
          <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
            <CardTitle className="text-sm font-medium">Active Plantings</CardTitle>
            <Sprout className="h-4 w-4 text-muted-foreground" />
          </CardHeader>
          <CardContent>
            <div className="text-2xl font-bold">{stats.activePlantings}</div>
            <p className="text-xs text-muted-foreground">Growing now</p>
          </CardContent>
        </Card>
      </div>

      {/* Additional Stats Row */}
      <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
        <Card>
          <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
            <CardTitle className="text-sm font-medium">Total Harvested</CardTitle>
            <TrendingUp className="h-4 w-4 text-muted-foreground" />
          </CardHeader>
          <CardContent>
            <div className="text-2xl font-bold">{stats.totalHarvested.toLocaleString()}</div>
            <p className="text-xs text-muted-foreground">lbs this season</p>
          </CardContent>
        </Card>

        <Card>
          <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
            <CardTitle className="text-sm font-medium">Low Stock Alert</CardTitle>
            <AlertCircle className="h-4 w-4 text-orange-500" />
          </CardHeader>
          <CardContent>
            <div className="text-2xl font-bold text-orange-600">{stats.lowStockBatches}</div>
            <p className="text-xs text-muted-foreground">batches need attention</p>
          </CardContent>
        </Card>

        <Card>
          <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
            <CardTitle className="text-sm font-medium">Next Harvest</CardTitle>
            <Calendar className="h-4 w-4 text-muted-foreground" />
          </CardHeader>
          <CardContent>
            <div className="text-2xl font-bold">
              {upcomingHarvests.length > 0
                ? new Date(upcomingHarvests[0].projected_harvest_date).getDate()
                : '-'}
            </div>
            <p className="text-xs text-muted-foreground">
              {upcomingHarvests.length > 0
                ? `${upcomingHarvests[0].variety_name} ready`
                : 'No scheduled harvests'}
            </p>
          </CardContent>
        </Card>
      </div>

      <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
        {/* Recent Orders */}
        <Card>
          <CardHeader>
            <div className="flex items-center justify-between">
              <div>
                <CardTitle>Recent Orders</CardTitle>
                <CardDescription>Latest orders from your customers</CardDescription>
              </div>
              <Link href="/dashboard/orders">
                <Button variant="outline" size="sm">
                  View All
                </Button>
              </Link>
            </div>
          </CardHeader>
          <CardContent>
            <div className="space-y-4">
              {recentOrders.map(order => (
                <div
                  key={order.id}
                  className="flex items-center justify-between p-3 border rounded-lg"
                >
                  <div className="flex items-center space-x-3">
                    <div className="flex-shrink-0">
                      {order.status === 'pending' && <Clock className="h-5 w-5 text-yellow-500" />}
                      {order.status === 'confirmed' && (
                        <CheckCircle className="h-5 w-5 text-blue-500" />
                      )}
                      {order.status === 'delivered' && (
                        <CheckCircle className="h-5 w-5 text-green-500" />
                      )}
                    </div>
                    <div>
                      <p className="font-medium">{order.user?.name || 'Customer'}</p>
                      <p className="text-sm text-gray-500">
                        {order.order_items?.length || 0} items • ${order.total.toFixed(2)}
                      </p>
                    </div>
                  </div>
                  <Badge
                    variant={
                      order.status === 'pending'
                        ? 'secondary'
                        : order.status === 'confirmed'
                          ? 'default'
                          : 'outline'
                    }
                  >
                    {order.status}
                  </Badge>
                </div>
              ))}
              {recentOrders.length === 0 && (
                <p className="text-gray-500 text-center py-4">No recent orders</p>
              )}
            </div>
          </CardContent>
        </Card>

        {/* Upcoming Harvests */}
        <Card>
          <CardHeader>
            <div className="flex items-center justify-between">
              <div>
                <CardTitle className="flex items-center gap-2">
                  <Calendar className="h-5 w-5 text-green-500" />
                  Ready to Harvest
                </CardTitle>
                <CardDescription>
                  Crops ready for harvesting from your active plantings
                </CardDescription>
              </div>
              <Link href="/dashboard/plantings">
                <Button variant="outline" size="sm">
                  View Plantings
                </Button>
              </Link>
            </div>
          </CardHeader>
          <CardContent>
            <div className="space-y-4">
              {upcomingHarvests.map(planting => (
                <div
                  key={planting.id}
                  className="flex items-center justify-between p-3 border rounded-lg border-green-200 bg-green-50"
                >
                  <div>
                    <p className="font-medium">{planting.variety_name}</p>
                    <p className="text-sm text-gray-500">
                      Planted: {new Date(planting.planted_date).toLocaleDateString()}
                    </p>
                  </div>
                  <div className="text-right">
                    <p className="font-bold text-green-600">
                      {new Date(planting.projected_harvest_date).toLocaleDateString()}
                    </p>
                    <p className="text-xs text-gray-500">
                      ~{planting.projected_quantity} {planting.unit}
                    </p>
                  </div>
                </div>
              ))}
              {upcomingHarvests.length === 0 && (
                <p className="text-gray-500 text-center py-4">No upcoming harvests scheduled</p>
              )}
            </div>
          </CardContent>
        </Card>
      </div>

      {/* Low Stock Batches Alert */}
      <Card>
        <CardHeader>
          <div className="flex items-center justify-between">
            <div>
              <CardTitle className="flex items-center gap-2">
                <AlertCircle className="h-5 w-5 text-orange-500" />
                Low Stock Batches
              </CardTitle>
              <CardDescription>Harvest batches running low on inventory</CardDescription>
            </div>
            <Link href="/dashboard/batches">
              <Button variant="outline" size="sm">
                Manage Inventory
              </Button>
            </Link>
          </div>
        </CardHeader>
        <CardContent>
          <div className="space-y-4">
            {lowStockBatches.map(batch => (
              <div
                key={batch.id}
                className="flex items-center justify-between p-3 border rounded-lg border-orange-200 bg-orange-50"
              >
                <div>
                  <p className="font-medium">
                    {batch.variety_name} - Batch {batch.batch_number}
                  </p>
                  <p className="text-sm text-gray-500">
                    Harvested: {new Date(batch.harvest_date).toLocaleDateString()}
                  </p>
                </div>
                <div className="text-right">
                  <p className="font-bold text-orange-600">
                    {batch.quantity_available} {batch.unit} left
                  </p>
                  <p className="text-xs text-gray-500">
                    ${batch.current_price?.toFixed(2) || '0.00'} per {batch.unit}
                  </p>
                </div>
              </div>
            ))}
            {lowStockBatches.length === 0 && (
              <p className="text-gray-500 text-center py-4">All batches are well stocked!</p>
            )}
          </div>
        </CardContent>
      </Card>

      {/* Quick Actions */}
      <Card>
        <CardHeader>
          <CardTitle>Quick Actions</CardTitle>
          <CardDescription>Common tasks to manage your farm</CardDescription>
        </CardHeader>
        <CardContent>
          <div className="grid grid-cols-1 md:grid-cols-4 gap-4">
            <Link href="/dashboard/harvests">
              <Button className="w-full h-20 flex flex-col gap-2 bg-transparent" variant="outline">
                <Sprout className="h-6 w-6" />
                Manage Harvests
              </Button>
            </Link>
            <Link href="/dashboard/batches">
              <Button className="w-full h-20 flex flex-col gap-2 bg-transparent" variant="outline">
                <Package2 className="h-6 w-6" />
                View Batches
              </Button>
            </Link>
            <Link href="/dashboard/pricing">
              <Button className="w-full h-20 flex flex-col gap-2 bg-transparent" variant="outline">
                <DollarSign className="h-6 w-6" />
                Update Pricing
              </Button>
            </Link>
            <Link href="/dashboard/orders">
              <Button className="w-full h-20 flex flex-col gap-2 bg-transparent" variant="outline">
                <ShoppingCart className="h-6 w-6" />
                View Orders
              </Button>
            </Link>
          </div>
        </CardContent>
      </Card>
    </div>
  )
}
