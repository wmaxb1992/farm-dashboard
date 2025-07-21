'use client'

import { useState, useEffect } from 'react'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card'
import { Button } from '@/components/ui/button'
import { Badge } from '@/components/ui/badge'
import { Input } from '@/components/ui/input'
import { Label } from '@/components/ui/label'
import { Switch } from '@/components/ui/switch'
import { Tabs, TabsContent, TabsList, TabsTrigger } from '@/components/ui/tabs'
import {
  Dialog,
  DialogContent,
  DialogDescription,
  DialogHeader,
  DialogTitle,
  DialogTrigger,
} from '@/components/ui/dialog'
import { DollarSign, TrendingUp, TrendingDown, Target, Clock, AlertTriangle } from 'lucide-react'

interface BatchPricing {
  id: string
  batch_id: string
  batch_number: string
  variety_name: string
  base_price: number
  current_price: number
  final_price: number
  discount_percentage: number
  calculated_discount_percentage: number
  age_days: number
  quality_grade: string
  harvest_date: string
  auto_discount_enabled: boolean
  freshness_score: number
  quantity_available: number
}

interface MarketRecommendation {
  recommended_price: number
  market_average: number
  price_range_low: number
  price_range_high: number
  confidence_level: string
}

export default function PricingManagement() {
  const [batchPricing, setBatchPricing] = useState<BatchPricing[]>([])
  const [selectedBatch, setSelectedBatch] = useState<BatchPricing | null>(null)
  const [marketRec, setMarketRec] = useState<MarketRecommendation | null>(null)
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<string | null>(null)
  const [editingPrice, setEditingPrice] = useState<number | null>(null)

  useEffect(() => {
    fetchBatchPricing()
  }, [])

  const fetchBatchPricing = async () => {
    try {
      setLoading(true)
      const response = await fetch(
        '/api/batch-pricing?farm_id=850e8400-e29b-41d4-a716-446655440002'
      )
      if (!response.ok) throw new Error('Failed to fetch pricing data')
      const data = await response.json()
      setBatchPricing(data.pricing || [])
    } catch (err) {
      setError(err instanceof Error ? err.message : 'An error occurred')
    } finally {
      setLoading(false)
    }
  }

  const fetchMarketRecommendation = async (varietyId: string, qualityGrade: string) => {
    try {
      const response = await fetch(
        `/api/market-pricing?variety_id=${varietyId}&quality_grade=${qualityGrade}`
      )
      if (!response.ok) throw new Error('Failed to fetch market data')
      const data = await response.json()
      setMarketRec(data)
    } catch (err) {
      console.error('Failed to fetch market recommendation:', err)
      setMarketRec(null)
    }
  }

  const updateBatchPricing = async (batchId: string, updates: any) => {
    try {
      const response = await fetch('/api/batch-pricing', {
        method: 'PUT',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ batch_id: batchId, ...updates }),
      })

      if (!response.ok) throw new Error('Failed to update pricing')

      // Refresh data
      fetchBatchPricing()
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Failed to update pricing')
    }
  }

  const getPriceChangeIndicator = (batch: BatchPricing) => {
    const change = batch.final_price - batch.base_price
    if (change > 0) {
      return <TrendingUp className="h-4 w-4 text-green-500" />
    } else if (change < 0) {
      return <TrendingDown className="h-4 w-4 text-red-500" />
    }
    return <TrendingUp className="h-4 w-4 text-gray-400" />
  }

  const getDiscountColor = (discountPercent: number) => {
    if (discountPercent >= 30) return 'text-red-600'
    if (discountPercent >= 15) return 'text-orange-600'
    if (discountPercent > 0) return 'text-yellow-600'
    return 'text-green-600'
  }

  const formatDate = (dateString: string) => {
    return new Date(dateString).toLocaleDateString()
  }

  const formatPrice = (price: number) => {
    return `$${price.toFixed(2)}`
  }

  if (loading) {
    return (
      <div className="container mx-auto py-6">
        <div className="text-center">Loading pricing data...</div>
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

  const highDiscountBatches = (batchPricing || []).filter(
    b => b.calculated_discount_percentage >= 20
  )
  const recentBatches = (batchPricing || []).filter(b => b.age_days <= 3)
  const avgPrice =
    (batchPricing || []).length > 0
      ? (batchPricing || []).reduce((sum, b) => sum + b.final_price, 0) /
        (batchPricing || []).length
      : 0

  return (
    <div className="container mx-auto py-6 space-y-6">
      <div className="flex justify-between items-center">
        <div>
          <h1 className="text-3xl font-bold">Pricing Management</h1>
          <p className="text-muted-foreground">Manage batch pricing and discounts</p>
        </div>
        <Button>
          <DollarSign className="mr-2 h-4 w-4" />
          Bulk Price Update
        </Button>
      </div>

      {/* Quick Stats */}
      <div className="grid grid-cols-1 md:grid-cols-4 gap-4">
        <Card>
          <CardContent className="p-6">
            <div className="flex items-center">
              <DollarSign className="h-8 w-8 text-green-500" />
              <div className="ml-4">
                <p className="text-sm font-medium text-muted-foreground">Average Price</p>
                <p className="text-2xl font-bold">{formatPrice(avgPrice)}</p>
              </div>
            </div>
          </CardContent>
        </Card>

        <Card>
          <CardContent className="p-6">
            <div className="flex items-center">
              <AlertTriangle className="h-8 w-8 text-red-500" />
              <div className="ml-4">
                <p className="text-sm font-medium text-muted-foreground">High Discounts</p>
                <p className="text-2xl font-bold">{highDiscountBatches.length}</p>
              </div>
            </div>
          </CardContent>
        </Card>

        <Card>
          <CardContent className="p-6">
            <div className="flex items-center">
              <Clock className="h-8 w-8 text-blue-500" />
              <div className="ml-4">
                <p className="text-sm font-medium text-muted-foreground">Fresh Batches</p>
                <p className="text-2xl font-bold">{recentBatches.length}</p>
              </div>
            </div>
          </CardContent>
        </Card>

        <Card>
          <CardContent className="p-6">
            <div className="flex items-center">
              <Target className="h-8 w-8 text-purple-500" />
              <div className="ml-4">
                <p className="text-sm font-medium text-muted-foreground">Total Value</p>
                <p className="text-2xl font-bold">
                  {formatPrice(
                    batchPricing.reduce((sum, b) => sum + b.final_price * b.quantity_available, 0)
                  )}
                </p>
              </div>
            </div>
          </CardContent>
        </Card>
      </div>

      <Tabs defaultValue="all" className="space-y-4">
        <TabsList>
          <TabsTrigger value="all">All Batches</TabsTrigger>
          <TabsTrigger value="discounted">High Discounts</TabsTrigger>
          <TabsTrigger value="fresh">Fresh Batches</TabsTrigger>
        </TabsList>

        <TabsContent value="all" className="space-y-4">
          <Card>
            <CardHeader>
              <CardTitle>All Batch Pricing</CardTitle>
              <CardDescription>Current pricing for all available batches</CardDescription>
            </CardHeader>
            <CardContent>
              <div className="space-y-4">
                {batchPricing.map(batch => (
                  <div key={batch.id} className="p-4 border rounded-lg">
                    <div className="flex items-center justify-between">
                      <div className="flex items-center space-x-4">
                        <div>
                          <h3 className="font-semibold">{batch.variety_name}</h3>
                          <p className="text-sm text-muted-foreground">
                            Batch: {batch.batch_number} • Grade {batch.quality_grade}
                          </p>
                          <p className="text-sm text-muted-foreground">
                            Harvested: {formatDate(batch.harvest_date)} • {batch.age_days} days old
                          </p>
                        </div>
                      </div>

                      <div className="flex items-center space-x-6">
                        <div className="text-center">
                          <p className="text-sm text-muted-foreground">Base Price</p>
                          <p className="font-semibold">{formatPrice(batch.base_price)}</p>
                        </div>

                        <div className="text-center">
                          <p className="text-sm text-muted-foreground">Discount</p>
                          <p
                            className={`font-semibold ${getDiscountColor(batch.calculated_discount_percentage)}`}
                          >
                            {batch.calculated_discount_percentage.toFixed(1)}%
                          </p>
                        </div>

                        <div className="text-center">
                          <p className="text-sm text-muted-foreground">Final Price</p>
                          <div className="flex items-center space-x-2">
                            {getPriceChangeIndicator(batch)}
                            <p className="font-semibold text-lg">
                              {formatPrice(batch.final_price)}
                            </p>
                          </div>
                        </div>

                        <div className="text-center">
                          <p className="text-sm text-muted-foreground">Available</p>
                          <p className="font-semibold">{batch.quantity_available} lbs</p>
                        </div>

                        <Dialog>
                          <DialogTrigger asChild>
                            <Button
                              variant="outline"
                              size="sm"
                              onClick={() => {
                                setSelectedBatch(batch)
                                // Fetch market recommendation if we have variety data
                                // fetchMarketRecommendation(batch.variety_id, batch.quality_grade)
                              }}
                            >
                              Edit Pricing
                            </Button>
                          </DialogTrigger>
                          <DialogContent className="sm:max-w-[500px]">
                            <DialogHeader>
                              <DialogTitle>Edit Batch Pricing</DialogTitle>
                              <DialogDescription>
                                Update pricing for {batch.batch_number}
                              </DialogDescription>
                            </DialogHeader>
                            {selectedBatch && (
                              <div className="space-y-4">
                                <div className="grid grid-cols-2 gap-4">
                                  <div>
                                    <Label htmlFor="base-price">Base Price ($)</Label>
                                    <Input
                                      id="base-price"
                                      type="number"
                                      step="0.01"
                                      defaultValue={selectedBatch.base_price}
                                      onChange={e => setEditingPrice(parseFloat(e.target.value))}
                                    />
                                  </div>
                                  <div>
                                    <Label htmlFor="discount">Manual Discount (%)</Label>
                                    <Input
                                      id="discount"
                                      type="number"
                                      step="0.1"
                                      defaultValue={selectedBatch.discount_percentage}
                                    />
                                  </div>
                                </div>

                                <div className="flex items-center space-x-2">
                                  <Switch defaultChecked={selectedBatch.auto_discount_enabled} />
                                  <Label>Enable automatic age-based discounting</Label>
                                </div>

                                {marketRec && (
                                  <div className="p-4 bg-blue-50 rounded-lg">
                                    <h4 className="font-semibold mb-2">Market Recommendation</h4>
                                    <div className="grid grid-cols-2 gap-4 text-sm">
                                      <div>
                                        <p className="text-muted-foreground">Suggested Price</p>
                                        <p className="font-semibold">
                                          {formatPrice(marketRec.recommended_price)}
                                        </p>
                                      </div>
                                      <div>
                                        <p className="text-muted-foreground">Market Range</p>
                                        <p className="font-semibold">
                                          {formatPrice(marketRec.price_range_low)} -{' '}
                                          {formatPrice(marketRec.price_range_high)}
                                        </p>
                                      </div>
                                    </div>
                                    <Badge className="mt-2">
                                      {marketRec.confidence_level} confidence
                                    </Badge>
                                  </div>
                                )}

                                <div className="flex justify-end space-x-2">
                                  <Button variant="outline">Cancel</Button>
                                  <Button
                                    onClick={() => {
                                      if (editingPrice) {
                                        updateBatchPricing(selectedBatch.batch_id, {
                                          base_price: editingPrice,
                                          current_price: editingPrice,
                                        })
                                      }
                                    }}
                                  >
                                    Update Pricing
                                  </Button>
                                </div>
                              </div>
                            )}
                          </DialogContent>
                        </Dialog>
                      </div>
                    </div>

                    {/* Freshness indicator */}
                    <div className="mt-3 flex items-center space-x-2">
                      <div className="w-full bg-gray-200 rounded-full h-2">
                        <div
                          className={`h-2 rounded-full ${
                            batch.freshness_score >= 80
                              ? 'bg-green-500'
                              : batch.freshness_score >= 60
                                ? 'bg-yellow-500'
                                : 'bg-red-500'
                          }`}
                          style={{ width: `${batch.freshness_score}%` }}
                        ></div>
                      </div>
                      <span className="text-sm font-medium">{batch.freshness_score}% fresh</span>
                    </div>
                  </div>
                ))}

                {batchPricing.length === 0 && (
                  <div className="text-center py-8 text-muted-foreground">
                    <DollarSign className="h-12 w-12 mx-auto mb-4 opacity-50" />
                    <p>No pricing data available</p>
                  </div>
                )}
              </div>
            </CardContent>
          </Card>
        </TabsContent>

        <TabsContent value="discounted" className="space-y-4">
          <Card>
            <CardHeader>
              <CardTitle>High Discount Batches</CardTitle>
              <CardDescription>Batches with significant price reductions</CardDescription>
            </CardHeader>
            <CardContent>
              <div className="space-y-4">
                {highDiscountBatches.map(batch => (
                  <div key={batch.id} className="p-4 border rounded-lg border-red-200 bg-red-50">
                    <div className="flex items-center justify-between">
                      <div>
                        <h3 className="font-semibold">{batch.variety_name}</h3>
                        <p className="text-sm text-muted-foreground">
                          Batch: {batch.batch_number} • {batch.age_days} days old
                        </p>
                      </div>
                      <div className="text-right">
                        <p className="text-lg font-bold text-red-600">
                          {batch.calculated_discount_percentage.toFixed(1)}% OFF
                        </p>
                        <p className="text-sm line-through text-muted-foreground">
                          {formatPrice(batch.base_price)}
                        </p>
                        <p className="font-semibold">{formatPrice(batch.final_price)}</p>
                      </div>
                    </div>
                  </div>
                ))}

                {highDiscountBatches.length === 0 && (
                  <div className="text-center py-8 text-muted-foreground">
                    <Target className="h-12 w-12 mx-auto mb-4 opacity-50" />
                    <p>No high discount batches</p>
                  </div>
                )}
              </div>
            </CardContent>
          </Card>
        </TabsContent>

        <TabsContent value="fresh" className="space-y-4">
          <Card>
            <CardHeader>
              <CardTitle>Fresh Batches</CardTitle>
              <CardDescription>Recently harvested batches at full price</CardDescription>
            </CardHeader>
            <CardContent>
              <div className="space-y-4">
                {recentBatches.map(batch => (
                  <div
                    key={batch.id}
                    className="p-4 border rounded-lg border-green-200 bg-green-50"
                  >
                    <div className="flex items-center justify-between">
                      <div>
                        <h3 className="font-semibold">{batch.variety_name}</h3>
                        <p className="text-sm text-muted-foreground">
                          Batch: {batch.batch_number} • {batch.age_days} days old
                        </p>
                      </div>
                      <div className="text-right">
                        <Badge className="bg-green-100 text-green-800 mb-2">Fresh</Badge>
                        <p className="font-semibold">{formatPrice(batch.final_price)}</p>
                        <p className="text-sm text-muted-foreground">
                          {batch.quantity_available} lbs available
                        </p>
                      </div>
                    </div>
                  </div>
                ))}

                {recentBatches.length === 0 && (
                  <div className="text-center py-8 text-muted-foreground">
                    <Clock className="h-12 w-12 mx-auto mb-4 opacity-50" />
                    <p>No fresh batches</p>
                  </div>
                )}
              </div>
            </CardContent>
          </Card>
        </TabsContent>
      </Tabs>
    </div>
  )
}
