'use client'

import { useState, useEffect } from 'react'
import {
  Dialog,
  DialogContent,
  DialogDescription,
  DialogFooter,
  DialogHeader,
  DialogTitle,
} from '@/components/ui/dialog'
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
import { Textarea } from '@/components/ui/textarea'
import { Switch } from '@/components/ui/switch'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card'

interface Variety {
  id: string
  name: string
  emoji: string
}

interface CreateBatchDialogProps {
  open: boolean
  onOpenChange: (open: boolean) => void
  farmId: string
  onSuccess: () => void
}

export function CreateBatchDialog({
  open,
  onOpenChange,
  farmId,
  onSuccess,
}: CreateBatchDialogProps) {
  const [loading, setLoading] = useState(false)
  const [varieties, setVarieties] = useState<Variety[]>([])
  const [formData, setFormData] = useState({
    variety_id: '',
    batch_number: '',
    harvest_date: '',
    quantity_harvested: '',
    unit: 'lbs',
    quality_grade: 'A',
    organic: false,
    location_in_farm: '',
    harvest_notes: '',
    base_price: '',
    auto_discount_enabled: true,
  })

  useEffect(() => {
    if (open) {
      fetchVarieties()
      // Reset form
      setFormData({
        variety_id: '',
        batch_number: '',
        harvest_date: new Date().toISOString().split('T')[0],
        quantity_harvested: '',
        unit: 'lbs',
        quality_grade: 'A',
        organic: false,
        location_in_farm: '',
        harvest_notes: '',
        base_price: '',
        auto_discount_enabled: true,
      })
    }
  }, [open])

  const fetchVarieties = async () => {
    try {
      const response = await fetch('/api/varieties')
      if (response.ok) {
        const data = await response.json()
        setVarieties(data.varieties || [])
      }
    } catch (error) {
      console.error('Error fetching varieties:', error)
    }
  }

  const generateBatchNumber = () => {
    const variety = varieties.find(v => v.id === formData.variety_id)
    if (variety && formData.harvest_date) {
      const date = new Date(formData.harvest_date)
      const dateStr = date.toISOString().slice(0, 10).replace(/-/g, '')
      const varietyCode = variety.name.substring(0, 3).toUpperCase()
      const randomSuffix = Math.random().toString(36).substring(2, 5).toUpperCase()
      return `${varietyCode}-${dateStr}-${randomSuffix}`
    }
    return ''
  }

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault()
    setLoading(true)

    try {
      const batchNumber = formData.batch_number || generateBatchNumber()

      const response = await fetch('/api/batches', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({
          ...formData,
          farm_id: farmId,
          batch_number: batchNumber,
          quantity_harvested: parseFloat(formData.quantity_harvested),
          base_price: parseFloat(formData.base_price),
        }),
      })

      if (response.ok) {
        onSuccess()
        onOpenChange(false)
      } else {
        const error = await response.json()
        console.error('Error creating batch:', error)
      }
    } catch (error) {
      console.error('Error creating batch:', error)
    } finally {
      setLoading(false)
    }
  }

  return (
    <Dialog open={open} onOpenChange={onOpenChange}>
      <DialogContent className="max-w-2xl max-h-[90vh] overflow-y-auto">
        <DialogHeader>
          <DialogTitle>Create New Harvest Batch</DialogTitle>
          <DialogDescription>
            Add a new harvest batch to track inventory and pricing
          </DialogDescription>
        </DialogHeader>

        <form onSubmit={handleSubmit} className="space-y-6">
          <div className="grid gap-4 md:grid-cols-2">
            <div className="space-y-2">
              <Label htmlFor="variety">Variety *</Label>
              <Select
                value={formData.variety_id}
                onValueChange={value => setFormData(prev => ({ ...prev, variety_id: value }))}
                required
              >
                <SelectTrigger>
                  <SelectValue placeholder="Select variety" />
                </SelectTrigger>
                <SelectContent>
                  {varieties.map(variety => (
                    <SelectItem key={variety.id} value={variety.id}>
                      {variety.emoji} {variety.name}
                    </SelectItem>
                  ))}
                </SelectContent>
              </Select>
            </div>

            <div className="space-y-2">
              <Label htmlFor="batch_number">Batch Number</Label>
              <Input
                id="batch_number"
                value={formData.batch_number}
                onChange={e => setFormData(prev => ({ ...prev, batch_number: e.target.value }))}
                placeholder="Auto-generated if empty"
              />
            </div>

            <div className="space-y-2">
              <Label htmlFor="harvest_date">Harvest Date *</Label>
              <Input
                id="harvest_date"
                type="date"
                value={formData.harvest_date}
                onChange={e => setFormData(prev => ({ ...prev, harvest_date: e.target.value }))}
                required
              />
            </div>

            <div className="space-y-2">
              <Label htmlFor="quality_grade">Quality Grade</Label>
              <Select
                value={formData.quality_grade}
                onValueChange={value => setFormData(prev => ({ ...prev, quality_grade: value }))}
              >
                <SelectTrigger>
                  <SelectValue />
                </SelectTrigger>
                <SelectContent>
                  <SelectItem value="A">Grade A (Premium)</SelectItem>
                  <SelectItem value="B">Grade B (Standard)</SelectItem>
                  <SelectItem value="C">Grade C (Utility)</SelectItem>
                </SelectContent>
              </Select>
            </div>

            <div className="space-y-2">
              <Label htmlFor="quantity">Quantity Harvested *</Label>
              <div className="flex space-x-2">
                <Input
                  id="quantity"
                  type="number"
                  step="0.1"
                  value={formData.quantity_harvested}
                  onChange={e =>
                    setFormData(prev => ({ ...prev, quantity_harvested: e.target.value }))
                  }
                  placeholder="0.0"
                  required
                />
                <Select
                  value={formData.unit}
                  onValueChange={value => setFormData(prev => ({ ...prev, unit: value }))}
                >
                  <SelectTrigger className="w-20">
                    <SelectValue />
                  </SelectTrigger>
                  <SelectContent>
                    <SelectItem value="lbs">lbs</SelectItem>
                    <SelectItem value="oz">oz</SelectItem>
                    <SelectItem value="kg">kg</SelectItem>
                    <SelectItem value="g">g</SelectItem>
                  </SelectContent>
                </Select>
              </div>
            </div>

            <div className="space-y-2">
              <Label htmlFor="base_price">Base Price per {formData.unit} *</Label>
              <Input
                id="base_price"
                type="number"
                step="0.01"
                value={formData.base_price}
                onChange={e => setFormData(prev => ({ ...prev, base_price: e.target.value }))}
                placeholder="0.00"
                required
              />
            </div>

            <div className="space-y-2">
              <Label htmlFor="location">Location in Farm</Label>
              <Input
                id="location"
                value={formData.location_in_farm}
                onChange={e => setFormData(prev => ({ ...prev, location_in_farm: e.target.value }))}
                placeholder="e.g., North Field, Greenhouse 2"
              />
            </div>
          </div>

          <div className="space-y-4">
            <div className="flex items-center space-x-2">
              <Switch
                id="organic"
                checked={formData.organic}
                onCheckedChange={checked => setFormData(prev => ({ ...prev, organic: checked }))}
              />
              <Label htmlFor="organic">Organic</Label>
            </div>

            <div className="flex items-center space-x-2">
              <Switch
                id="auto_discount"
                checked={formData.auto_discount_enabled}
                onCheckedChange={checked =>
                  setFormData(prev => ({ ...prev, auto_discount_enabled: checked }))
                }
              />
              <Label htmlFor="auto_discount">Enable Auto-Discounting</Label>
            </div>

            <div className="space-y-2">
              <Label htmlFor="notes">Harvest Notes</Label>
              <Textarea
                id="notes"
                value={formData.harvest_notes}
                onChange={e => setFormData(prev => ({ ...prev, harvest_notes: e.target.value }))}
                placeholder="Optional notes about this harvest batch..."
                rows={3}
              />
            </div>
          </div>

          {formData.auto_discount_enabled && (
            <Card>
              <CardHeader>
                <CardTitle className="text-sm">Auto-Discount Settings</CardTitle>
                <CardDescription className="text-xs">
                  Prices will automatically decrease by 2% per day after 3 days, with additional
                  discounts for lower grades
                </CardDescription>
              </CardHeader>
              <CardContent className="text-sm">
                <ul className="space-y-1 text-muted-foreground">
                  <li>• Grade A: No additional discount</li>
                  <li>• Grade B: 15% discount from base price</li>
                  <li>• Grade C: 30% discount from base price</li>
                  <li>• Age discount starts after 3 days at 2% per day</li>
                </ul>
              </CardContent>
            </Card>
          )}

          <DialogFooter>
            <Button type="button" variant="outline" onClick={() => onOpenChange(false)}>
              Cancel
            </Button>
            <Button type="submit" disabled={loading}>
              {loading ? 'Creating...' : 'Create Batch'}
            </Button>
          </DialogFooter>
        </form>
      </DialogContent>
    </Dialog>
  )
}
