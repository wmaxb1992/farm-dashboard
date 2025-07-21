import { getSupabaseAdmin } from '@/lib/supabase'

export class OrderService {
  private supabase = getSupabaseAdmin()

  async getAllOrders(farmId?: string, status?: string) {
    try {
      let query = this.supabase
        .from('orders')
        .select('*')
        .order('created_at', { ascending: false })

      if (farmId) {
        query = query.eq('farm_id', farmId)
      }

      if (status) {
        query = query.eq('status', status)
      }

      const { data, error } = await query

      if (error) {
        throw new Error(`Error fetching orders: ${error.message}`)
      }

      return data || []
    } catch (error) {
      console.error('Error in getAllOrders:', error)
      throw error
    }
  }

  async getOrderById(id: string) {
    try {
      const { data, error } = await this.supabase
        .from('orders')
        .select('*')
        .eq('id', id)
        .single()

      if (error) {
        if (error.code === 'PGRST116') {
          return null // Not found
        }
        throw new Error(`Error fetching order: ${error.message}`)
      }

      return data
    } catch (error) {
      console.error('Error in getOrderById:', error)
      throw error
    }
  }

  async createOrder(orderData: any) {
    try {
      const { data, error } = await this.supabase
        .from('orders')
        .insert(orderData)
        .select()
        .single()

      if (error) {
        throw new Error(`Error creating order: ${error.message}`)
      }

      return data
    } catch (error) {
      console.error('Error in createOrder:', error)
      throw error
    }
  }

  async updateOrder(id: string, updates: any) {
    try {
      const { data, error } = await this.supabase
        .from('orders')
        .update(updates)
        .eq('id', id)
        .select()
        .single()

      if (error) {
        throw new Error(`Error updating order: ${error.message}`)
      }

      return data
    } catch (error) {
      console.error('Error in updateOrder:', error)
      throw error
    }
  }

  async deleteOrder(id: string) {
    try {
      const { error } = await this.supabase
        .from('orders')
        .delete()
        .eq('id', id)

      if (error) {
        throw new Error(`Error deleting order: ${error.message}`)
      }
    } catch (error) {
      console.error('Error in deleteOrder:', error)
      throw error
    }
  }
}
