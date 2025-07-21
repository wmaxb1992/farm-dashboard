'use client'

import { useState, useEffect } from 'react'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card'
import { Tabs, TabsContent, TabsList, TabsTrigger } from '@/components/ui/tabs'
import {
  BarChart,
  Bar,
  XAxis,
  YAxis,
  CartesianGrid,
  Tooltip,
  ResponsiveContainer,
  PieChart,
  Pie,
  Cell,
} from 'recharts'
import { TrendingUp, Package, AlertTriangle, DollarSign } from 'lucide-react'

interface BatchAnalyticsProps {
  farmId: string
}

interface AnalyticsData {
  inventoryByStatus: Array<{ name: string; value: number; color: string }>
  revenueByVariety: Array<{ variety: string; revenue: number; quantity: number }>
  monthlyHarvest: Array<{ month: string; quantity: number; revenue: number }>
  expirationAlerts: Array<{ batch_number: string; days_until_expiry: number; quantity: number }>
}

export function BatchAnalytics({ farmId }: BatchAnalyticsProps) {
  const [analytics, setAnalytics] = useState<AnalyticsData | null>(null)
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    fetchAnalytics()
  }, [farmId])

  const fetchAnalytics = async () => {
    try {
      setLoading(true)
      // In a real app, this would be a dedicated analytics endpoint
      const response = await fetch(`/api/batches?farm_id=${farmId}`)
      if (response.ok) {
        const data = await response.json()
        processAnalytics(data.batches || [])
      }
    } catch (error) {
      console.error('Error fetching analytics:', error)
    } finally {
      setLoading(false)
    }
  }

  const processAnalytics = (batches: any[]) => {
    // Inventory by status
    const statusCounts = batches.reduce((acc, batch) => {
      acc[batch.status] = (acc[batch.status] || 0) + batch.quantity_available
      return acc
    }, {})

    const inventoryByStatus = [
      { name: 'Available', value: statusCounts.available || 0, color: '#10b981' },
      { name: 'Low Stock', value: statusCounts.low_stock || 0, color: '#f59e0b' },
      { name: 'Sold Out', value: statusCounts.sold_out || 0, color: '#6b7280' },
      { name: 'Expired', value: statusCounts.expired || 0, color: '#ef4444' },
    ]

    // Revenue by variety
    const varietyRevenue = batches.reduce((acc, batch) => {
      const variety = batch.variety.name
      if (!acc[variety]) {
        acc[variety] = { revenue: 0, quantity: 0 }
      }
      acc[variety].revenue += batch.quantity_sold * batch.current_price
      acc[variety].quantity += batch.quantity_sold
      return acc
    }, {})

    const revenueByVariety = Object.entries(varietyRevenue).map(
      ([variety, data]: [string, any]) => ({
        variety,
        revenue: data.revenue,
        quantity: data.quantity,
      })
    )

    // Monthly harvest (mock data for demo)
    const monthlyHarvest = [
      { month: 'Jan', quantity: 150, revenue: 675 },
      { month: 'Feb', quantity: 200, revenue: 900 },
      { month: 'Mar', quantity: 180, revenue: 810 },
      { month: 'Apr', quantity: 220, revenue: 990 },
      { month: 'May', quantity: 250, revenue: 1125 },
      { month: 'Jun', quantity: 280, revenue: 1260 },
    ]

    // Expiration alerts (batches expiring soon)
    const today = new Date()
    const expirationAlerts = batches
      .filter(batch => batch.status === 'available')
      .map(batch => {
        const harvestDate = new Date(batch.harvest_date)
        const daysSinceHarvest = Math.floor(
          (today.getTime() - harvestDate.getTime()) / (1000 * 60 * 60 * 24)
        )
        const daysUntilExpiry = 14 - daysSinceHarvest // Assuming 14-day shelf life
        return {
          batch_number: batch.batch_number,
          days_until_expiry: daysUntilExpiry,
          quantity: batch.quantity_available,
        }
      })
      .filter(batch => batch.days_until_expiry <= 7 && batch.days_until_expiry > 0)
      .sort((a, b) => a.days_until_expiry - b.days_until_expiry)

    setAnalytics({
      inventoryByStatus,
      revenueByVariety,
      monthlyHarvest,
      expirationAlerts,
    })
  }

  if (loading) {
    return <div className="text-center py-8">Loading analytics...</div>
  }

  if (!analytics) {
    return <div className="text-center py-8">No analytics data available</div>
  }

  const totalRevenue = analytics.revenueByVariety.reduce((acc, item) => acc + item.revenue, 0)
  const totalQuantity = analytics.inventoryByStatus.reduce((acc, item) => acc + item.value, 0)

  return (
    <div className="space-y-6">
      <Card>
        <CardHeader>
          <CardTitle className="flex items-center">
            <TrendingUp className="mr-2 h-5 w-5" />
            Batch Analytics
          </CardTitle>
          <CardDescription>
            Insights into your harvest performance and inventory status
          </CardDescription>
        </CardHeader>
      </Card>

      <Tabs defaultValue="inventory" className="space-y-4">
        <TabsList>
          <TabsTrigger value="inventory">Inventory Status</TabsTrigger>
          <TabsTrigger value="revenue">Revenue Analysis</TabsTrigger>
          <TabsTrigger value="trends">Harvest Trends</TabsTrigger>
          <TabsTrigger value="alerts">Expiration Alerts</TabsTrigger>
        </TabsList>

        <TabsContent value="inventory" className="space-y-4">
          <div className="grid gap-4 md:grid-cols-2">
            <Card>
              <CardHeader>
                <CardTitle className="text-lg">Inventory Distribution</CardTitle>
              </CardHeader>
              <CardContent>
                <ResponsiveContainer width="100%" height={300}>
                  <PieChart>
                    <Pie
                      data={analytics.inventoryByStatus}
                      cx="50%"
                      cy="50%"
                      innerRadius={60}
                      outerRadius={100}
                      paddingAngle={5}
                      dataKey="value"
                    >
                      {analytics.inventoryByStatus.map((entry, index) => (
                        <Cell key={`cell-${index}`} fill={entry.color} />
                      ))}
                    </Pie>
                    <Tooltip formatter={value => [`${value} lbs`, 'Quantity']} />
                  </PieChart>
                </ResponsiveContainer>
              </CardContent>
            </Card>

            <Card>
              <CardHeader>
                <CardTitle className="text-lg">Status Summary</CardTitle>
              </CardHeader>
              <CardContent className="space-y-4">
                {analytics.inventoryByStatus.map((status, index) => (
                  <div key={index} className="flex items-center justify-between">
                    <div className="flex items-center space-x-3">
                      <div
                        className="w-3 h-3 rounded-full"
                        style={{ backgroundColor: status.color }}
                      />
                      <span className="font-medium">{status.name}</span>
                    </div>
                    <span className="text-muted-foreground">{status.value.toFixed(1)} lbs</span>
                  </div>
                ))}
                <div className="pt-2 border-t">
                  <div className="flex justify-between font-medium">
                    <span>Total Inventory</span>
                    <span>{totalQuantity.toFixed(1)} lbs</span>
                  </div>
                </div>
              </CardContent>
            </Card>
          </div>
        </TabsContent>

        <TabsContent value="revenue" className="space-y-4">
          <Card>
            <CardHeader>
              <CardTitle className="text-lg">Revenue by Variety</CardTitle>
              <CardDescription>Total revenue: ${totalRevenue.toFixed(2)}</CardDescription>
            </CardHeader>
            <CardContent>
              <ResponsiveContainer width="100%" height={300}>
                <BarChart data={analytics.revenueByVariety}>
                  <CartesianGrid strokeDasharray="3 3" />
                  <XAxis dataKey="variety" />
                  <YAxis />
                  <Tooltip formatter={value => [`$${value}`, 'Revenue']} />
                  <Bar dataKey="revenue" fill="#10b981" />
                </BarChart>
              </ResponsiveContainer>
            </CardContent>
          </Card>
        </TabsContent>

        <TabsContent value="trends" className="space-y-4">
          <Card>
            <CardHeader>
              <CardTitle className="text-lg">Monthly Harvest Trends</CardTitle>
            </CardHeader>
            <CardContent>
              <ResponsiveContainer width="100%" height={300}>
                <BarChart data={analytics.monthlyHarvest}>
                  <CartesianGrid strokeDasharray="3 3" />
                  <XAxis dataKey="month" />
                  <YAxis />
                  <Tooltip />
                  <Bar dataKey="quantity" fill="#3b82f6" name="Quantity (lbs)" />
                  <Bar dataKey="revenue" fill="#10b981" name="Revenue ($)" />
                </BarChart>
              </ResponsiveContainer>
            </CardContent>
          </Card>
        </TabsContent>

        <TabsContent value="alerts" className="space-y-4">
          <Card>
            <CardHeader>
              <CardTitle className="flex items-center text-lg">
                <AlertTriangle className="mr-2 h-5 w-5 text-orange-500" />
                Expiration Alerts
              </CardTitle>
              <CardDescription>Batches expiring within the next 7 days</CardDescription>
            </CardHeader>
            <CardContent>
              {analytics.expirationAlerts.length === 0 ? (
                <p className="text-muted-foreground text-center py-4">No batches expiring soon</p>
              ) : (
                <div className="space-y-3">
                  {analytics.expirationAlerts.map((alert, index) => (
                    <div
                      key={index}
                      className="flex items-center justify-between p-3 border rounded-lg"
                    >
                      <div className="flex items-center space-x-3">
                        <AlertTriangle className="h-4 w-4 text-orange-500" />
                        <div>
                          <p className="font-medium">{alert.batch_number}</p>
                          <p className="text-sm text-muted-foreground">
                            {alert.quantity.toFixed(1)} lbs available
                          </p>
                        </div>
                      </div>
                      <div className="text-right">
                        <p className="font-medium text-orange-600">
                          {alert.days_until_expiry} days left
                        </p>
                      </div>
                    </div>
                  ))}
                </div>
              )}
            </CardContent>
          </Card>
        </TabsContent>
      </Tabs>
    </div>
  )
}
