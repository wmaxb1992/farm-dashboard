'use client'

import { useState } from 'react'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card'
import { Badge } from '@/components/ui/badge'
import { Button } from '@/components/ui/button'
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
import { Search, Filter, MoreHorizontal, Eye, CheckCircle, Clock, Truck } from 'lucide-react'

export default function OrdersPage() {
  const [searchTerm, setSearchTerm] = useState('')
  const [statusFilter, setStatusFilter] = useState('all')

  // Mock orders data
  const orders = [
    {
      id: 'ORD-001',
      customer: 'Sarah Johnson',
      email: 'sarah@email.com',
      items: [
        { name: 'Organic Cherry Tomatoes', quantity: 2, price: 4.99 },
        { name: 'Fresh Basil', quantity: 1, price: 2.5 },
      ],
      total: 12.48,
      status: 'pending',
      orderDate: '2024-01-15',
      deliveryDate: '2024-01-17',
      address: '123 Main St, City, State 12345',
    },
    {
      id: 'ORD-002',
      customer: 'Mike Chen',
      email: 'mike@email.com',
      items: [
        { name: 'Baby Spinach', quantity: 3, price: 3.75 },
        { name: 'Rainbow Carrots', quantity: 2, price: 3.25 },
      ],
      total: 17.75,
      status: 'confirmed',
      orderDate: '2024-01-14',
      deliveryDate: '2024-01-16',
      address: '456 Oak Ave, City, State 12345',
    },
    {
      id: 'ORD-003',
      customer: 'Emma Davis',
      email: 'emma@email.com',
      items: [
        { name: 'Organic Cherry Tomatoes', quantity: 1, price: 4.99 },
        { name: 'Fresh Basil', quantity: 2, price: 2.5 },
      ],
      total: 9.99,
      status: 'delivered',
      orderDate: '2024-01-13',
      deliveryDate: '2024-01-15',
      address: '789 Pine St, City, State 12345',
    },
    {
      id: 'ORD-004',
      customer: 'Tom Wilson',
      email: 'tom@email.com',
      items: [{ name: 'Rainbow Carrots', quantity: 4, price: 3.25 }],
      total: 13.0,
      status: 'pending',
      orderDate: '2024-01-15',
      deliveryDate: '2024-01-18',
      address: '321 Elm Dr, City, State 12345',
    },
  ]

  const filteredOrders = orders.filter(order => {
    const matchesSearch =
      order.customer.toLowerCase().includes(searchTerm.toLowerCase()) ||
      order.id.toLowerCase().includes(searchTerm.toLowerCase())
    const matchesStatus = statusFilter === 'all' || order.status === statusFilter
    return matchesSearch && matchesStatus
  })

  const getStatusIcon = (status: string) => {
    switch (status) {
      case 'pending':
        return <Clock className="h-4 w-4" />
      case 'confirmed':
        return <CheckCircle className="h-4 w-4" />
      case 'delivered':
        return <Truck className="h-4 w-4" />
      default:
        return <Clock className="h-4 w-4" />
    }
  }

  const getStatusColor = (status: string) => {
    switch (status) {
      case 'pending':
        return 'secondary'
      case 'confirmed':
        return 'default'
      case 'delivered':
        return 'outline'
      default:
        return 'secondary'
    }
  }

  const updateOrderStatus = (orderId: string, newStatus: string) => {
    console.log(`Updating order ${orderId} to ${newStatus}`)
    // Here you would update the order status in your backend
  }

  return (
    <div className="space-y-6">
      <div>
        <h1 className="text-3xl font-bold text-gray-900">Orders</h1>
        <p className="text-gray-600">Manage customer orders and deliveries</p>
      </div>

      {/* Order Stats */}
      <div className="grid grid-cols-1 md:grid-cols-4 gap-4">
        <Card>
          <CardContent className="pt-6">
            <div className="flex items-center justify-between">
              <div>
                <p className="text-sm font-medium text-gray-600">Total Orders</p>
                <p className="text-2xl font-bold">{orders.length}</p>
              </div>
              <div className="bg-blue-100 p-2 rounded-full">
                <Eye className="h-5 w-5 text-blue-600" />
              </div>
            </div>
          </CardContent>
        </Card>
        <Card>
          <CardContent className="pt-6">
            <div className="flex items-center justify-between">
              <div>
                <p className="text-sm font-medium text-gray-600">Pending</p>
                <p className="text-2xl font-bold">
                  {orders.filter(o => o.status === 'pending').length}
                </p>
              </div>
              <div className="bg-yellow-100 p-2 rounded-full">
                <Clock className="h-5 w-5 text-yellow-600" />
              </div>
            </div>
          </CardContent>
        </Card>
        <Card>
          <CardContent className="pt-6">
            <div className="flex items-center justify-between">
              <div>
                <p className="text-sm font-medium text-gray-600">Confirmed</p>
                <p className="text-2xl font-bold">
                  {orders.filter(o => o.status === 'confirmed').length}
                </p>
              </div>
              <div className="bg-green-100 p-2 rounded-full">
                <CheckCircle className="h-5 w-5 text-green-600" />
              </div>
            </div>
          </CardContent>
        </Card>
        <Card>
          <CardContent className="pt-6">
            <div className="flex items-center justify-between">
              <div>
                <p className="text-sm font-medium text-gray-600">Delivered</p>
                <p className="text-2xl font-bold">
                  {orders.filter(o => o.status === 'delivered').length}
                </p>
              </div>
              <div className="bg-purple-100 p-2 rounded-full">
                <Truck className="h-5 w-5 text-purple-600" />
              </div>
            </div>
          </CardContent>
        </Card>
      </div>

      {/* Filters */}
      <Card>
        <CardContent className="pt-6">
          <div className="flex flex-col sm:flex-row gap-4">
            <div className="flex-1">
              <div className="relative">
                <Search className="absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-400 h-4 w-4" />
                <Input
                  placeholder="Search orders..."
                  value={searchTerm}
                  onChange={e => setSearchTerm(e.target.value)}
                  className="pl-10"
                />
              </div>
            </div>
            <Select value={statusFilter} onValueChange={setStatusFilter}>
              <SelectTrigger className="w-full sm:w-48">
                <Filter className="h-4 w-4 mr-2" />
                <SelectValue placeholder="Filter by status" />
              </SelectTrigger>
              <SelectContent>
                <SelectItem value="all">All Orders</SelectItem>
                <SelectItem value="pending">Pending</SelectItem>
                <SelectItem value="confirmed">Confirmed</SelectItem>
                <SelectItem value="delivered">Delivered</SelectItem>
              </SelectContent>
            </Select>
          </div>
        </CardContent>
      </Card>

      {/* Orders Table */}
      <Card>
        <CardHeader>
          <CardTitle>Recent Orders ({filteredOrders.length})</CardTitle>
          <CardDescription>Manage and track customer orders</CardDescription>
        </CardHeader>
        <CardContent>
          <div className="overflow-x-auto">
            <Table>
              <TableHeader>
                <TableRow>
                  <TableHead>Order ID</TableHead>
                  <TableHead>Customer</TableHead>
                  <TableHead>Items</TableHead>
                  <TableHead>Total</TableHead>
                  <TableHead>Status</TableHead>
                  <TableHead>Order Date</TableHead>
                  <TableHead>Delivery Date</TableHead>
                  <TableHead className="text-right">Actions</TableHead>
                </TableRow>
              </TableHeader>
              <TableBody>
                {filteredOrders.map(order => (
                  <TableRow key={order.id}>
                    <TableCell className="font-medium">{order.id}</TableCell>
                    <TableCell>
                      <div>
                        <p className="font-medium">{order.customer}</p>
                        <p className="text-sm text-gray-500">{order.email}</p>
                      </div>
                    </TableCell>
                    <TableCell>
                      <div className="space-y-1">
                        {order.items.map((item, index) => (
                          <div key={index} className="text-sm">
                            {item.quantity}x {item.name}
                          </div>
                        ))}
                      </div>
                    </TableCell>
                    <TableCell className="font-medium">${order.total.toFixed(2)}</TableCell>
                    <TableCell>
                      <Badge
                        variant={getStatusColor(order.status)}
                        className="flex items-center gap-1 w-fit"
                      >
                        {getStatusIcon(order.status)}
                        {order.status}
                      </Badge>
                    </TableCell>
                    <TableCell>{order.orderDate}</TableCell>
                    <TableCell>{order.deliveryDate}</TableCell>
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
                          {order.status === 'pending' && (
                            <DropdownMenuItem
                              onClick={() => updateOrderStatus(order.id, 'confirmed')}
                            >
                              <CheckCircle className="h-4 w-4 mr-2" />
                              Confirm Order
                            </DropdownMenuItem>
                          )}
                          {order.status === 'confirmed' && (
                            <DropdownMenuItem
                              onClick={() => updateOrderStatus(order.id, 'delivered')}
                            >
                              <Truck className="h-4 w-4 mr-2" />
                              Mark as Delivered
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
        </CardContent>
      </Card>
    </div>
  )
}
