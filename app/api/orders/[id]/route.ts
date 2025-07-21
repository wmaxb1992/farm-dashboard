import { type NextRequest, NextResponse } from 'next/server'
import { OrderService } from '@/lib/services/order.service'

export async function PUT(request: NextRequest, { params }: { params: { id: string } }) {
  try {
    const body = await request.json()

    const orderService = new OrderService()
    const order = await orderService.updateOrder(params.id, { status: body.status })

    return NextResponse.json({ order })
  } catch (error) {
    console.error('Unexpected error:', error)
    return NextResponse.json({ error: 'Internal server error' }, { status: 500 })
  }
}
