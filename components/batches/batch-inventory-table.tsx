'use client'

import { useState } from 'react'
import {
  Table,
  TableBody,
  TableCell,
  TableHead,
  TableHeader,
  TableRow,
} from '@/components/ui/table'
import { Badge } from '@/components/ui/badge'
import { Button } from '@/components/ui/button'
import {
  DropdownMenu,
  DropdownMenuContent,
  DropdownMenuItem,
  DropdownMenuTrigger,
} from '@/components/ui/dropdown-menu'
import { MoreHorizontal, Eye, Edit, Trash2 } from 'lucide-react'

interface BatchData {
  id: string
  batch_number: string
  variety: {
    name: string
    emoji: string
  }
  harvest_date: string
  quantity_harvested: number
  unit: string
  quality_grade: string
  status: 'available' | 'low_stock' | 'sold_out' | 'expired'
  current_price: number
  quantity_available: number
  quantity_reserved: number
  quantity_sold: number
  quantity_expired: number
  organic: boolean
}

interface BatchInventoryTableProps {
  batches: BatchData[]
  loading: boolean
  onRefresh: () => void
}

export function BatchInventoryTable({ batches, loading, onRefresh }: BatchInventoryTableProps) {
  const getStatusBadge = (status: string) => {
    const variants = {
      available: 'bg-green-100 text-green-800',
      low_stock: 'bg-yellow-100 text-yellow-800',
      sold_out: 'bg-gray-100 text-gray-800',
      expired: 'bg-red-100 text-red-800',
    }
    return variants[status as keyof typeof variants] || variants.available
  }

  const getQualityBadge = (grade: string) => {
    const variants = {
      A: 'bg-blue-100 text-blue-800',
      B: 'bg-purple-100 text-purple-800',
      C: 'bg-orange-100 text-orange-800',
    }
    return variants[grade as keyof typeof variants] || variants.A
  }

  if (loading) {
    return <div className="text-center py-8">Loading batches...</div>
  }

  if (batches.length === 0) {
    return (
      <div className="text-center py-8">
        <p className="text-muted-foreground">No batches found</p>
      </div>
    )
  }

  return (
    <div className="rounded-md border">
      <Table>
        <TableHeader>
          <TableRow>
            <TableHead>Batch</TableHead>
            <TableHead>Variety</TableHead>
            <TableHead>Harvest Date</TableHead>
            <TableHead>Quality</TableHead>
            <TableHead>Status</TableHead>
            <TableHead>Available</TableHead>
            <TableHead>Reserved</TableHead>
            <TableHead>Price</TableHead>
            <TableHead>Actions</TableHead>
          </TableRow>
        </TableHeader>
        <TableBody>
          {batches.map(batch => (
            <TableRow key={batch.id}>
              <TableCell className="font-medium">
                <div className="flex items-center space-x-2">
                  <span>{batch.batch_number}</span>
                  {batch.organic && (
                    <Badge variant="outline" className="text-xs">
                      Organic
                    </Badge>
                  )}
                </div>
              </TableCell>
              <TableCell>
                <div className="flex items-center space-x-2">
                  <span>{batch.variety.emoji}</span>
                  <span>{batch.variety.name}</span>
                </div>
              </TableCell>
              <TableCell>{new Date(batch.harvest_date).toLocaleDateString()}</TableCell>
              <TableCell>
                <Badge className={getQualityBadge(batch.quality_grade)}>
                  Grade {batch.quality_grade}
                </Badge>
              </TableCell>
              <TableCell>
                <Badge className={getStatusBadge(batch.status)}>
                  {batch.status.replace('_', ' ')}
                </Badge>
              </TableCell>
              <TableCell>
                {batch.quantity_available.toFixed(1)} {batch.unit}
              </TableCell>
              <TableCell>
                {batch.quantity_reserved.toFixed(1)} {batch.unit}
              </TableCell>
              <TableCell>
                ${batch.current_price.toFixed(2)}/{batch.unit}
              </TableCell>
              <TableCell>
                <DropdownMenu>
                  <DropdownMenuTrigger asChild>
                    <Button variant="ghost" className="h-8 w-8 p-0">
                      <MoreHorizontal className="h-4 w-4" />
                    </Button>
                  </DropdownMenuTrigger>
                  <DropdownMenuContent align="end">
                    <DropdownMenuItem>
                      <Eye className="mr-2 h-4 w-4" />
                      View Details
                    </DropdownMenuItem>
                    <DropdownMenuItem>
                      <Edit className="mr-2 h-4 w-4" />
                      Update Pricing
                    </DropdownMenuItem>
                    {batch.status === 'available' && (
                      <DropdownMenuItem className="text-red-600">
                        <Trash2 className="mr-2 h-4 w-4" />
                        Mark as Expired
                      </DropdownMenuItem>
                    )}
                  </DropdownMenuContent>
                </DropdownMenu>
              </TableCell>
            </TableRow>
          ))}
        </TableBody>
      </Table>
    </div>
  )
}
