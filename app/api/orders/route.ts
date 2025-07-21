import { type NextRequest, NextResponse } from 'next/server'
import { OrderService } from '@/lib/services/order.service'
import { validateCreateOrder } from '@/lib/validations/schemas'

export async function GET(request: NextRequest) {
  try {
    const { searchParams } = new URL(request.url)
    const farmId = searchParams.get('farm_id')
    const status = searchParams.get('status')

    const orderService = new OrderService()
    const orders = await orderService.getOrders({ farmId: farmId || undefined, status: status !== 'all' ? status || undefined : undefined })

    return NextResponse.json({ orders })
  } catch (error) {
    console.error('Unexpected error:', error)
    return NextResponse.json({ error: 'Internal server error' }, { status: 500 })
  }
}

export async function POST(request: NextRequest) {
  try {
    const body = await request.json()

    // Validate input
    const validation = validateCreateOrder(body)
    if (!validation.isValid) {
      return NextResponse.json(
        {
          error: 'Validation failed',
          details: validation.errors,
        },
        { status: 400 }
      )
    }

    const orderService = new OrderService()
    const order = await orderService.createOrder(body)

    return NextResponse.json({ order }, { status: 201 })
  } catch (error) {
    console.error('Unexpected error:', error)
    return NextResponse.json({ error: 'Internal server error' }, { status: 500 })
  }
}
