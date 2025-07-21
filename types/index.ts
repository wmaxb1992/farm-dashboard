// Form types
export interface LoginFormData {
  email: string
  password: string
}

export interface SignupFormData {
  farmName: string
  ownerName: string
  email: string
  password: string
  phone: string
  address: string
  description: string
  certifications: string[]
  logo: File | null
  coverImage: File | null
}

export interface ProductFormData {
  name: string
  farm_id: string
  variety_id: string
  price: string
  stock: string
  freshness: string
  harvest_date: string
  pre_harvest: boolean
  description: string
  image: File | null
}

// API Response types
export interface ApiResponse<T = any> {
  success: boolean
  data?: T
  error?: string
  message?: string
}

// Component props types
export interface DashboardStats {
  totalOrders: number
  activeProducts: number
  revenue: number
  customers: number
}

export interface AuthContextType {
  user: any | null
  loading: boolean
  signIn: (email: string, password: string) => Promise<void>
  signUp: (email: string, password: string) => Promise<void>
  signOut: () => Promise<void>
}
