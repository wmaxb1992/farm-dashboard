import { getSupabaseAdmin } from '../database/client'
import type { Farm } from '@/types/database'

export class FarmService {
  private static getClient() {
    return getSupabaseAdmin()
  }

  static async getAll() {
    const client = this.getClient()
    const { data, error } = await client
      .from('farms')
      .select('*')
      .order('created_at', { ascending: false })

    if (error) throw error
    return data as Farm[]
  }

  static async getById(id: string) {
    const client = this.getClient()
    const { data, error } = await client.from('farms').select('*').eq('id', id).single()

    if (error) throw error
    return data as Farm
  }

  static async getByOwnerId(ownerId: string) {
    const client = this.getClient()
    const { data, error } = await client.from('farms').select('*').eq('owner_id', ownerId)

    if (error) throw error
    return data as Farm[]
  }

  static async create(farmData: Omit<Farm, 'id' | 'created_at' | 'updated_at'>) {
    const client = this.getClient()
    const { data, error } = await client.from('farms').insert([farmData]).select().single()

    if (error) throw error
    return data as Farm
  }

  static async update(id: string, farmData: Partial<Farm>) {
    const client = this.getClient()
    const { data, error } = await client
      .from('farms')
      .update(farmData)
      .eq('id', id)
      .select()
      .single()

    if (error) throw error
    return data as Farm
  }

  static async delete(id: string) {
    const client = this.getClient()
    const { error } = await client.from('farms').delete().eq('id', id)

    if (error) throw error
  }
}
