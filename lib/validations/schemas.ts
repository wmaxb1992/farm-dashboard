// Form validation schemas (using simple validation for now)

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
}

export interface ProductFormData {
  name: string
  farm_id: string
  variety_id: string
  cultivar_id?: string // New field for cultivar ID
  cultivar_name?: string // New field for cultivar name
  price: number
  stock: number
  freshness: number
  harvest_date: string
  pre_harvest: boolean
  organic: boolean
  in_season: boolean
  delivery_days: string[]
  images: string[]
}

export interface OrderFormData {
  farm_id: string
  user_id?: string
  total: number
  status: 'pending' | 'confirmed' | 'preparing' | 'ready' | 'completed' | 'cancelled'
  customer_name?: string
  customer_email?: string
  customer_phone?: string
  delivery_address?: string
  notes?: string
}

// Simple validation functions
export const validateEmail = (email: string): boolean => {
  const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/
  return emailRegex.test(email)
}

export const validatePassword = (password: string): boolean => {
  return password.length >= 6
}

export const validateRequired = (value: string): boolean => {
  return value.trim().length > 0
}

export const validatePositiveNumber = (value: number): boolean => {
  return value > 0
}

export const validateNonNegativeNumber = (value: number): boolean => {
  return value >= 0
}

// Form validation functions
export const validateLogin = (data: LoginFormData) => {
  const errors: string[] = []

  if (!validateEmail(data.email)) {
    errors.push('Invalid email format')
  }

  if (!validatePassword(data.password)) {
    errors.push('Password must be at least 6 characters')
  }

  return {
    isValid: errors.length === 0,
    errors,
  }
}

export const validateSignup = (data: SignupFormData) => {
  const errors: string[] = []

  if (!validateRequired(data.farmName)) {
    errors.push('Farm name is required')
  }

  if (!validateRequired(data.ownerName)) {
    errors.push('Owner name is required')
  }

  if (!validateEmail(data.email)) {
    errors.push('Invalid email format')
  }

  if (!validatePassword(data.password)) {
    errors.push('Password must be at least 6 characters')
  }

  if (!validateRequired(data.address)) {
    errors.push('Address is required')
  }

  return {
    isValid: errors.length === 0,
    errors,
  }
}

export const validateProduct = (data: ProductFormData) => {
  const errors: string[] = []

  if (!validateRequired(data.name)) {
    errors.push('Product name is required')
  }

  if (!data.farm_id) {
    errors.push('Farm ID is required')
  }

  if (!data.variety_id) {
    errors.push('Variety ID is required')
  }

  if (!validatePositiveNumber(data.price)) {
    errors.push('Price must be a positive number')
  }

  if (!validateNonNegativeNumber(data.stock)) {
    errors.push('Stock must be a non-negative number')
  }

  return {
    isValid: errors.length === 0,
    errors,
  }
}

export const validateCreateOrder = (data: any) => {
  const errors: string[] = []

  if (!data.farm_id) {
    errors.push('Farm ID is required')
  }

  if (!data.total || !validatePositiveNumber(Number(data.total))) {
    errors.push('Total must be a positive number')
  }

  if (data.delivery_address && !validateRequired(data.delivery_address)) {
    errors.push('Delivery address cannot be empty if provided')
  }

  return {
    isValid: errors.length === 0,
    errors,
  }
}
