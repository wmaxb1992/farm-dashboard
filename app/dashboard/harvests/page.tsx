'use client'

import { useState, useEffect } from 'react'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card'
import { Button } from '@/components/ui/button'
import { Badge } from '@/components/ui/badge'
import { Tabs, TabsContent, TabsList, TabsTrigger } from '@/components/ui/tabs'
import { Calendar, Leaf, TrendingUp, Package, Clock, AlertCircle } from 'lucide-react'
import Link from 'next/link'

interface Crop {
  id: string
  farm_variety_name: string
  variety_name?: string
  planting_location?: string
  planting_date: string
  total_estimated_yield?: number
  estimated_remaining_yield?: number
  remaining_yield?: number // Alternative field name
  estimated_yield_per_harvest?: number
  harvest_frequency_days?: number
  calculated_next_harvest_date?: string
  days_until_next_harvest?: number
  season_progress_percentage?: number
  harvest_status?: string // Make optional since it might not exist
  growth_stage?: string // Add this field
  completed_harvests?: number
  total_harvested_to_date?: number
  crop_status: string
}

interface HarvestBatch {
  id: string
  batch_number: string
  variety_name: string
  farm_variety_name: string
  harvest_date: string
  estimated_harvest_date: string
  quantity_harvested: number
  quality_grade: string
  batch_status: string
  is_projected: boolean
  quantity_available: number
  quantity_sold: number
  freshness_score: number
  status: string
}

export default function HarvestManagement() {
  const [crops, setCrops] = useState<Crop[]>([])
  const [batches, setBatches] = useState<HarvestBatch[]>([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<string | null>(null)

  useEffect(() => {
    fetchData()
  }, [])

  const fetchData = async () => {
    try {
      setLoading(true)

      // Fetch active crops with the correct farm_id
      const cropsResponse = await fetch(
        '/api/farm-plantings?farm_id=850e8400-e29b-41d4-a716-446655440002&status=active'
      )
      if (!cropsResponse.ok) throw new Error('Failed to fetch crops')
      const cropsData = await cropsResponse.json()
      console.log('Harvests page - received crops data:', cropsData)
      setCrops(cropsData.plantings || []) // Use the correct property name

      // Fetch harvest batches with the correct farm_id
      const batchesResponse = await fetch(
        '/api/harvest-batches?farm_id=850e8400-e29b-41d4-a716-446655440002'
      )
      if (!batchesResponse.ok) throw new Error('Failed to fetch batches')
      const batchesData = await batchesResponse.json()
      setBatches(batchesData.batches || []) // Use the correct property name
    } catch (err) {
      setError(err instanceof Error ? err.message : 'An error occurred')
    } finally {
      setLoading(false)
    }
  }

  const getStatusColor = (status: string) => {
    switch (status) {
      case 'producing':
      case 'ready_to_harvest':
        return 'bg-red-100 text-red-800'
      case 'harvest_tomorrow':
        return 'bg-orange-100 text-orange-800'
      case 'growing':
      case 'planted':
        return 'bg-green-100 text-green-800'
      case 'finished':
        return 'bg-gray-100 text-gray-800'
      default:
        return 'bg-blue-100 text-blue-800'
    }
  }

  const getStatusIcon = (status: string) => {
    switch (status) {
      case 'producing':
      case 'ready_to_harvest':
        return <AlertCircle className="h-4 w-4" />
      case 'harvest_tomorrow':
        return <Clock className="h-4 w-4" />
      case 'growing':
      case 'planted':
        return <Leaf className="h-4 w-4" />
      case 'finished':
        return <Package className="h-4 w-4" />
      default:
        return <Leaf className="h-4 w-4" />
    }
  }

  const formatDate = (dateString: string) => {
    return new Date(dateString).toLocaleDateString()
  }

  const completeProjectedHarvest = async (batchId: string, actualQuantity: number) => {
    try {
      const response = await fetch(`/api/harvest-batches/${batchId}/complete`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          actual_quantity: actualQuantity,
          actual_date: new Date().toISOString().split('T')[0],
          quality_grade: 'A',
        }),
      })

      if (!response.ok) throw new Error('Failed to complete harvest')

      // Refresh data
      fetchData()
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Failed to complete harvest')
    }
  }

  if (loading) {
    return (
      <div className="container mx-auto py-6">
        <div className="text-center">Loading harvest data...</div>
      </div>
    )
  }

  if (error) {
    return (
      <div className="container mx-auto py-6">
        <div className="text-center text-red-600">Error: {error}</div>
      </div>
    )
  }

  const readyToHarvest = crops?.filter(crop => crop.harvest_status === 'ready_to_harvest') || []
  const harvestSoon =
    crops?.filter(
      crop =>
        crop.days_until_next_harvest !== undefined &&
        crop.days_until_next_harvest <= 1 &&
        crop.crop_status === 'growing'
    ) || []
  const projectedBatches = batches?.filter(batch => !batch.harvest_date) || [] // Projected batches have no harvest_date
  const recentBatches = batches?.filter(batch => batch.harvest_date)?.slice(0, 10) || [] // Actual batches have harvest_date

  return (
    <div className="container mx-auto py-6 space-y-6">
      <div className="flex justify-between items-center">
        <div>
          <h1 className="text-3xl font-bold">Harvest Management</h1>
          <p className="text-muted-foreground">Complete harvests from your active plantings</p>
        </div>
        <Link href="/dashboard/plantings">
          <Button>
            <Package className="mr-2 h-4 w-4" />
            View Active Plantings
          </Button>
        </Link>
      </div>

      {/* Quick Stats */}
      <div className="grid grid-cols-1 md:grid-cols-4 gap-4">
        <Card>
          <CardContent className="p-6">
            <div className="flex items-center">
              <AlertCircle className="h-8 w-8 text-red-500" />
              <div className="ml-4">
                <p className="text-sm font-medium text-muted-foreground">Ready to Harvest</p>
                <p className="text-2xl font-bold">{readyToHarvest.length}</p>
              </div>
            </div>
          </CardContent>
        </Card>

        <Card>
          <CardContent className="p-6">
            <div className="flex items-center">
              <Clock className="h-8 w-8 text-orange-500" />
              <div className="ml-4">
                <p className="text-sm font-medium text-muted-foreground">Harvest Tomorrow</p>
                <p className="text-2xl font-bold">{harvestSoon.length}</p>
              </div>
            </div>
          </CardContent>
        </Card>

        <Card>
          <CardContent className="p-6">
            <div className="flex items-center">
              <Leaf className="h-8 w-8 text-green-500" />
              <div className="ml-4">
                <p className="text-sm font-medium text-muted-foreground">Active Crops</p>
                <p className="text-2xl font-bold">{crops?.length || 0}</p>
              </div>
            </div>
          </CardContent>
        </Card>

        <Card>
          <CardContent className="p-6">
            <div className="flex items-center">
              <TrendingUp className="h-8 w-8 text-blue-500" />
              <div className="ml-4">
                <p className="text-sm font-medium text-muted-foreground">Total Yield (Est.)</p>
                <p className="text-2xl font-bold">
                  {Math.round(
                    crops?.reduce(
                      (sum, crop) =>
                        sum + (crop.estimated_remaining_yield || crop.remaining_yield || 0),
                      0
                    ) || 0
                  )}{' '}
                  lbs
                </p>
              </div>
            </div>
          </CardContent>
        </Card>
      </div>

      <Tabs defaultValue="schedule" className="space-y-4">
        <TabsList>
          <TabsTrigger value="schedule">Harvest Schedule</TabsTrigger>
          <TabsTrigger value="projected">Projected Harvests</TabsTrigger>
          <TabsTrigger value="recent">Recent Harvests</TabsTrigger>
          <TabsTrigger value="crops">All Crops</TabsTrigger>
        </TabsList>

        <TabsContent value="schedule" className="space-y-4">
          <Card>
            <CardHeader>
              <CardTitle>Harvest Schedule</CardTitle>
              <CardDescription>Crops ready to harvest today and coming up</CardDescription>
            </CardHeader>
            <CardContent>
              <div className="space-y-4">
                {readyToHarvest.map(crop => (
                  <div
                    key={crop.id}
                    className="flex items-center justify-between p-4 border rounded-lg bg-red-50"
                  >
                    <div className="flex items-center space-x-4">
                      <div className="flex items-center space-x-2">
                        <AlertCircle className="h-5 w-5 text-red-500" />
                        <Badge className="bg-red-100 text-red-800">Ready Now</Badge>
                      </div>
                      <div>
                        <h3 className="font-semibold">{crop.farm_variety_name}</h3>
                        <p className="text-sm text-muted-foreground">{crop.planting_location}</p>
                      </div>
                    </div>
                    <div className="text-right">
                      <p className="font-semibold">
                        {crop.estimated_yield_per_harvest} lbs expected
                      </p>
                      <Button size="sm" className="mt-2">
                        Complete Harvest
                      </Button>
                    </div>
                  </div>
                ))}

                {harvestSoon.map(crop => (
                  <div
                    key={crop.id}
                    className="flex items-center justify-between p-4 border rounded-lg bg-orange-50"
                  >
                    <div className="flex items-center space-x-4">
                      <div className="flex items-center space-x-2">
                        <Clock className="h-5 w-5 text-orange-500" />
                        <Badge className="bg-orange-100 text-orange-800">Tomorrow</Badge>
                      </div>
                      <div>
                        <h3 className="font-semibold">{crop.farm_variety_name}</h3>
                        <p className="text-sm text-muted-foreground">{crop.planting_location}</p>
                      </div>
                    </div>
                    <div className="text-right">
                      <p className="font-semibold">
                        {crop.estimated_yield_per_harvest} lbs expected
                      </p>
                      <p className="text-sm text-muted-foreground">
                        Next:{' '}
                        {crop.calculated_next_harvest_date
                          ? formatDate(crop.calculated_next_harvest_date)
                          : 'TBD'}
                      </p>
                    </div>
                  </div>
                ))}

                {readyToHarvest.length === 0 && harvestSoon.length === 0 && (
                  <div className="text-center py-8 text-muted-foreground">
                    <Leaf className="h-12 w-12 mx-auto mb-4 opacity-50" />
                    <p>No harvests scheduled for today or tomorrow</p>
                  </div>
                )}
              </div>
            </CardContent>
          </Card>
        </TabsContent>

        <TabsContent value="projected" className="space-y-4">
          <Card>
            <CardHeader>
              <CardTitle>Projected Harvests</CardTitle>
              <CardDescription>Expected harvests that haven't happened yet</CardDescription>
            </CardHeader>
            <CardContent>
              <div className="space-y-4">
                {projectedBatches.map(batch => (
                  <div
                    key={batch.id}
                    className="flex items-center justify-between p-4 border rounded-lg"
                  >
                    <div>
                      <h3 className="font-semibold">{batch.farm_variety_name}</h3>
                      <p className="text-sm text-muted-foreground">Batch: {batch.batch_number}</p>
                      <p className="text-sm text-muted-foreground">
                        Expected: {formatDate(batch.estimated_harvest_date)}
                      </p>
                    </div>
                    <div className="text-right">
                      <p className="font-semibold">{batch.quantity_harvested} lbs projected</p>
                      <Button
                        size="sm"
                        variant="outline"
                        className="mt-2"
                        onClick={() => completeProjectedHarvest(batch.id, batch.quantity_harvested)}
                      >
                        Complete Harvest
                      </Button>
                    </div>
                  </div>
                ))}

                {projectedBatches.length === 0 && (
                  <div className="text-center py-8 text-muted-foreground">
                    <Calendar className="h-12 w-12 mx-auto mb-4 opacity-50" />
                    <p>No projected harvests</p>
                  </div>
                )}
              </div>
            </CardContent>
          </Card>
        </TabsContent>

        <TabsContent value="recent" className="space-y-4">
          <Card>
            <CardHeader>
              <CardTitle>Recent Harvests</CardTitle>
              <CardDescription>Your latest completed harvests</CardDescription>
            </CardHeader>
            <CardContent>
              <div className="space-y-4">
                {recentBatches.map(batch => (
                  <div
                    key={batch.id}
                    className="flex items-center justify-between p-4 border rounded-lg"
                  >
                    <div>
                      <h3 className="font-semibold">{batch.farm_variety_name}</h3>
                      <p className="text-sm text-muted-foreground">
                        Batch: {batch.batch_number} • Grade {batch.quality_grade}
                      </p>
                      <p className="text-sm text-muted-foreground">
                        Harvested: {formatDate(batch.harvest_date)}
                      </p>
                    </div>
                    <div className="text-right">
                      <p className="font-semibold">{batch.quantity_harvested} lbs</p>
                      <div className="flex items-center space-x-2 mt-1">
                        <Badge variant="outline">{batch.quantity_available} lbs available</Badge>
                        <div
                          className="w-2 h-2 rounded-full bg-green-500"
                          title={`Freshness: ${batch.freshness_score}%`}
                        ></div>
                      </div>
                    </div>
                  </div>
                ))}
              </div>
            </CardContent>
          </Card>
        </TabsContent>

        <TabsContent value="crops" className="space-y-4">
          <Card>
            <CardHeader>
              <CardTitle>All Active Crops</CardTitle>
              <CardDescription>Complete overview of your plantings</CardDescription>
            </CardHeader>
            <CardContent>
              <div className="space-y-4">
                {crops?.map(crop => (
                  <div key={crop.id} className="p-4 border rounded-lg">
                    <div className="flex items-center justify-between mb-2">
                      <h3 className="font-semibold">{crop.farm_variety_name}</h3>
                      <Badge
                        className={getStatusColor(
                          crop.crop_status || crop.growth_stage || 'growing'
                        )}
                      >
                        {getStatusIcon(crop.crop_status || crop.growth_stage || 'growing')}
                        <span className="ml-1">
                          {(crop.crop_status || crop.growth_stage || 'growing').replace('_', ' ')}
                        </span>
                      </Badge>
                    </div>

                    <div className="grid grid-cols-2 md:grid-cols-4 gap-4 text-sm">
                      <div>
                        <p className="text-muted-foreground">Location</p>
                        <p className="font-medium">{crop.planting_location || 'Unknown'}</p>
                      </div>
                      <div>
                        <p className="text-muted-foreground">Next Harvest</p>
                        <p className="font-medium">
                          {crop.days_until_next_harvest === 0
                            ? 'Today'
                            : crop.days_until_next_harvest === 1
                              ? 'Tomorrow'
                              : crop.days_until_next_harvest
                                ? `${crop.days_until_next_harvest} days`
                                : 'TBD'}
                        </p>
                      </div>
                      <div>
                        <p className="text-muted-foreground">Season Progress</p>
                        <div className="flex items-center space-x-2">
                          <div className="w-full bg-gray-200 rounded-full h-2">
                            <div
                              className="bg-green-500 h-2 rounded-full"
                              style={{
                                width: `${Math.min(crop.season_progress_percentage || 0, 100)}%`,
                              }}
                            ></div>
                          </div>
                          <span className="font-medium">
                            {Math.round(crop.season_progress_percentage || 0)}%
                          </span>
                        </div>
                      </div>
                      <div>
                        <p className="text-muted-foreground">Remaining Yield</p>
                        <p className="font-medium">{crop.estimated_remaining_yield || 0} lbs</p>
                      </div>
                    </div>
                  </div>
                ))}
              </div>
            </CardContent>
          </Card>
        </TabsContent>
      </Tabs>
    </div>
  )
}
