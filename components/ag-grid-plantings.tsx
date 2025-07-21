'use client'

import { useState } from 'react'
import { Button } from '@/components/ui/button'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card'
import {
  Table,
  TableBody,
  TableCell,
  TableHead,
  TableHeader,
  TableRow,
} from '@/components/ui/table'
import { Badge } from '@/components/ui/badge'
import {
  DropdownMenu,
  DropdownMenuContent,
  DropdownMenuItem,
  DropdownMenuTrigger,
} from '@/components/ui/dropdown-menu'
import { MoreHorizontal, Eye, Edit, Trash2 } from 'lucide-react'

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

interface PlantingsTableProps {
  plantings: Planting[]
  onPlantingUpdate: (id: string, updatedData: Partial<Planting>) => Promise<void>
  onRefresh: () => void
}

export default function PlantingsTable({
  plantings,
  onPlantingUpdate,
  onRefresh,
}: PlantingsTableProps) {
  const [loading, setLoading] = useState(false)

  const getStatusColor = (status: string) => {
    switch (status) {
      case 'producing':
        return 'default'
      case 'ready_to_harvest':
        return 'secondary'
      case 'growing':
        return 'outline'
      case 'planted':
        return 'outline'
      case 'finished':
        return 'secondary'
      default:
        return 'outline'
    }
  }

  const formatDate = (dateString: string) => {
    const date = new Date(dateString)
    return date.toLocaleDateString('en-US', { month: 'short', day: 'numeric', year: 'numeric' })
  }

  const formatYield = (value: number) => {
    return `${value.toLocaleString()} lbs`
  }

  const formatArea = (value: number, unit: string) => {
    return `${value.toLocaleString()} ${unit || 'sq_ft'}`
  }

  if (!plantings || plantings.length === 0) {
    return (
      <Card>
        <CardContent className="pt-6">
          <div className="text-center py-8">
            <p className="text-gray-500 mb-4">No plantings data available</p>
            <Button onClick={onRefresh} variant="outline">
              Refresh
            </Button>
          </div>
        </CardContent>
      </Card>
    )
  }

  return (
    <Card>
      <CardHeader>
        <div className="flex items-center justify-between">
          <div>
            <CardTitle>Plantings ({plantings.length})</CardTitle>
            <CardDescription>Manage your crop plantings and track progress</CardDescription>
          </div>
          <Button onClick={onRefresh} variant="outline">
            Refresh
          </Button>
        </div>
      </CardHeader>
      <CardContent>
        <div className="overflow-x-auto">
          <Table>
            <TableHeader>
              <TableRow>
                <TableHead>Variety</TableHead>
                <TableHead>Location</TableHead>
                <TableHead>Planted Date</TableHead>
                <TableHead>Status</TableHead>
                <TableHead>Total Yield</TableHead>
                <TableHead>Remaining</TableHead>
                <TableHead>Quantity</TableHead>
                <TableHead>Area</TableHead>
                <TableHead>Notes</TableHead>
                <TableHead className="text-right">Actions</TableHead>
              </TableRow>
            </TableHeader>
            <TableBody>
              {plantings.map(planting => (
                <TableRow key={planting.id}>
                  <TableCell className="font-medium">{planting.farm_variety_name}</TableCell>
                  <TableCell>{planting.planting_location}</TableCell>
                  <TableCell>{formatDate(planting.planting_date)}</TableCell>
                  <TableCell>
                    <Badge variant={getStatusColor(planting.crop_status)}>
                      {planting.crop_status?.replace('_', ' ')}
                    </Badge>
                  </TableCell>
                  <TableCell className="font-mono text-sm">
                    {formatYield(planting.total_estimated_yield)}
                  </TableCell>
                  <TableCell className="font-mono text-sm">
                    {formatYield(planting.estimated_remaining_yield)}
                  </TableCell>
                  <TableCell className="font-mono text-sm">
                    {planting.planted_quantity.toLocaleString()}
                  </TableCell>
                  <TableCell className="font-mono text-sm">
                    {formatArea(planting.planted_area, planting.planted_area_unit)}
                  </TableCell>
                  <TableCell>
                    <div className="truncate max-w-32 text-sm text-gray-600">
                      {planting.notes || '-'}
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
                        <DropdownMenuItem>
                          <Edit className="h-4 w-4 mr-2" />
                          Edit Planting
                        </DropdownMenuItem>
                        <DropdownMenuItem className="text-red-600">
                          <Trash2 className="h-4 w-4 mr-2" />
                          Delete Planting
                        </DropdownMenuItem>
                      </DropdownMenuContent>
                    </DropdownMenu>
                  </TableCell>
                </TableRow>
              ))}
            </TableBody>
          </Table>
        </div>
      </CardContent>
    </Card>
  )
}
