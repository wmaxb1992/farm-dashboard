// Database types
export interface User {
  id: string
  email: string
  created_at: string
  updated_at: string
}

export interface Farm {
  id: string
  name: string
  owner_name: string
  owner_id: string | null
  description?: string
  address?: string
  phone?: string
  email?: string
  certifications?: string[]
  specialties?: string[]
  delivery_zones?: string[]
  rating?: number
  logo?: string
  cover_image?: string
  created_at: string
  updated_at: string
}

export interface Category {
  id: string
  name: string
  description?: string
  created_at: string
}

export interface Subcategory {
  id: string
  name: string
  category_id: string
  description?: string
  created_at: string
}

export interface Variety {
  id: string
  name: string
  subcategory_id: string
  emoji?: string
  description?: string
  card_image?: string
  nutritional_info?: Record<string, any>
  taste_profile?: Record<string, any>
  culinary_uses?: string[]
  created_at: string
  updated_at: string
}

export interface HarvestBatch {
  id: string
  farm_id: string
  variety_id: string
  batch_number: string
  harvest_date: string
  quantity_harvested: number
  unit: string
  quality_grade: 'A' | 'B' | 'C'
  organic: boolean
  location_in_farm?: string
  harvest_notes?: string
  created_at: string
  updated_at: string
}

export interface BatchPricing {
  id: string
  batch_id: string
  base_price: number
  current_price: number
  discount_percentage: number
  discount_reason?: string
  price_per_unit: number
  minimum_order_quantity: number
  bulk_discount_threshold?: number
  bulk_discount_percentage?: number
  auto_discount_enabled: boolean
  age_discount_start_days: number
  age_discount_percentage_per_day: number
  grade_discount_b: number
  grade_discount_c: number
  created_at: string
  updated_at: string
}

export interface BatchInventory {
  id: string
  batch_id: string
  quantity_available: number
  quantity_reserved: number
  quantity_sold: number
  quantity_expired: number
  quantity_damaged: number
  last_updated: string
}

export interface MarketPricing {
  id: string
  variety_id: string
  region: string
  average_price: number
  price_range_low?: number
  price_range_high?: number
  unit: string
  quality_grade: string
  sample_size: number
  data_source?: string
  last_updated: string
  created_at: string
}

export interface BatchCurrentPricing {
  id: string
  batch_id: string
  base_price: number
  current_price: number
  discount_percentage: number
  harvest_date: string
  quality_grade: 'A' | 'B' | 'C'
  farm_id: string
  variety_id: string
  age_days: number
  calculated_discount_percentage: number
  grade_discount_percentage: number
  final_price: number
}

export interface BatchInventoryStatus extends HarvestBatch {
  quantity_available: number
  quantity_reserved: number
  quantity_sold: number
  quantity_expired: number
  quantity_damaged: number
  total_accounted: number
  quantity_unaccounted: number
  status: 'available' | 'reserved_only' | 'sold_out' | 'unknown'
  freshness_score: number
}

export interface PriceRecommendation {
  recommended_price: number
  market_average: number
  price_range_low?: number
  price_range_high?: number
  confidence_level: 'high' | 'medium' | 'low'
}

export interface Product {
  id: string
  name: string
  farm_id: string
  variety_id: string
  batch_id?: string
  price: number
  stock: number
  freshness: string
  harvest_date: string
  pre_harvest: boolean
  is_batch_product: boolean
  description?: string
  image?: string
  created_at: string
  updated_at: string
  // Relations
  farm?: Farm
  variety?: Variety & {
    subcategory?: Subcategory & {
      category?: Category
    }
  }
  batch?: HarvestBatch
}

export interface Order {
  id: string
  order_number: string
  farm_id: string
  user_id?: string
  total: number
  status: 'pending' | 'confirmed' | 'preparing' | 'ready' | 'completed' | 'cancelled'
  customer_name?: string
  customer_email?: string
  customer_phone?: string
  delivery_address?: string
  notes?: string
  created_at: string
  updated_at: string
  // Relations
  farm?: Farm
  user?: User
  order_items?: OrderItem[]
}

export interface OrderItem {
  id: string
  order_id: string
  product_id: string
  quantity: number
  price: number
  created_at: string
  // Relations
  product?: Product
  order?: Order
}
