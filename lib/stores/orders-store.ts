import { create } from 'zustand'
import { devtools } from 'zustand/middleware'

interface Order {
  id: string
  customer_name: string
  customer_email: string
  order_date: string
  status: string
  total_amount: number
  items: any[]
}

interface OrdersState {
  orders: Order[]
  isLoading: boolean
  error: string | null
  
  setOrders: (orders: Order[]) => void
  addOrder: (order: Order) => void
  updateOrder: (id: string, updates: Partial<Order>) => void
  removeOrder: (id: string) => void
  setLoading: (loading: boolean) => void
  setError: (error: string | null) => void
}

export const useOrdersStore = create<OrdersState>()(
  devtools(
    (set) => ({
      orders: [],
      isLoading: false,
      error: null,

      setOrders: (orders) => set({ orders }),
      addOrder: (order) => set((state) => ({ 
        orders: [...state.orders, order] 
      })),
      updateOrder: (id, updates) => set((state) => ({
        orders: state.orders.map(o => 
          o.id === id ? { ...o, ...updates } : o
        )
      })),
      removeOrder: (id) => set((state) => ({
        orders: state.orders.filter(o => o.id !== id)
      })),
      setLoading: (loading) => set({ isLoading: loading }),
      setError: (error) => set({ error }),
    }),
    {
      name: 'orders-store',
    }
  )
)
