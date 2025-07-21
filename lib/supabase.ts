import { createClient } from '@supabase/supabase-js'

// Simple client initialization with fallback values
const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL || ''
const supabaseAnonKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY || ''

// Create client only if we have the required values
export const supabase =
  supabaseUrl && supabaseAnonKey ? createClient(supabaseUrl, supabaseAnonKey) : null

// Server-side client for admin operations
let _supabaseAdmin: ReturnType<typeof createClient> | null = null

export const getSupabaseAdmin = () => {
  if (!_supabaseAdmin) {
    const serviceKey = process.env.SUPABASE_SERVICE_ROLE_KEY

    if (!supabaseUrl || !serviceKey) {
      throw new Error('Missing Supabase admin environment variables')
    }

    _supabaseAdmin = createClient(supabaseUrl, serviceKey, {
      auth: {
        autoRefreshToken: false,
        persistSession: false,
      },
    })
  }
  return _supabaseAdmin
}

// For backward compatibility - lazy loaded to avoid build time issues
export const supabaseAdmin = null // Will be created when needed via getSupabaseAdmin()

// Types based on your schema
export interface Farm {
  id: string
  name: string
  description?: string
  logo?: string
  cover_image?: string
  owner_name?: string
  email: string
  phone?: string
  website?: string
  address?: string
  location_coordinates?: any
  rating: number
  certifications: string[]
  specialties: string[]
  delivery_zones: string[]
  created_at: string
  updated_at: string
}

export interface Product {
  id: string
  name: string
  farm_id: string
  variety_id?: string
  price: number
  stock: number
  freshness?: number
  harvest_date?: string
  pre_harvest: boolean
  organic: boolean
  in_season: boolean
  delivery_days: string[]
  images: string[]
  created_at: string
  updated_at: string
  // Relations
  farm?: Farm
  variety?: Variety
}

export interface Variety {
  id: string
  subcategory_id: string
  name: string
  emoji?: string
  description?: string
  card_image?: string
  nutritional_info?: any
  taste_profile?: any
  culinary_uses: string[]
  created_at: string
  updated_at: string
}

export interface Category {
  id: string
  name: string
  image?: string
  created_at: string
  updated_at: string
}

export interface Subcategory {
  id: string
  category_id: string
  name: string
  image?: string
  created_at: string
  updated_at: string
}

export interface Order {
  id: string
  order_number: string
  user_id?: string
  farm_id: string
  status: 'pending' | 'confirmed' | 'preparing' | 'delivered' | 'cancelled'
  subtotal: number
  tax: number
  delivery_fee: number
  total: number
  delivery_address?: any
  delivery_date?: string
  notes?: string
  created_at: string
  updated_at: string
  // Relations
  order_items?: OrderItem[]
  user?: User
}

export interface OrderItem {
  id: string
  order_id: string
  product_id: string
  quantity: number
  unit_price: number
  total_price: number
  created_at: string
  // Relations
  product?: Product
}

export interface User {
  id: string
  name: string
  email: string
  phone?: string
  created_at: string
  updated_at: string
}
