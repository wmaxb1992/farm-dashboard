import { create } from 'zustand'
import { devtools } from 'zustand/middleware'

interface Farm {
  id: string
  name: string
  owner_id: string
  location?: string
  description?: string
}

interface User {
  id: string
  email: string
  full_name?: string
  farm?: Farm
}

interface FarmState {
  user: User | null
  currentFarm: Farm | null
  farmId: string | null
  isAuthenticated: boolean
  isLoading: boolean
  
  setUser: (user: User | null) => void
  setCurrentFarm: (farm: Farm | null) => void
  setFarmId: (farmId: string | null) => void
  setAuthenticated: (authenticated: boolean) => void
  setLoading: (loading: boolean) => void
  logout: () => void
}

export const useFarmStore = create<FarmState>()(
  devtools(
    (set) => ({
      user: null,
      currentFarm: null,
      farmId: '850e8400-e29b-41d4-a716-446655440002',
      isAuthenticated: false,
      isLoading: true,

      setUser: (user) => set({ user }),
      setCurrentFarm: (farm) => set({ currentFarm: farm }),
      setFarmId: (farmId) => set({ farmId }),
      setAuthenticated: (authenticated) => set({ isAuthenticated: authenticated }),
      setLoading: (loading) => set({ isLoading: loading }),
      logout: () => set({ 
        user: null, 
        currentFarm: null, 
        farmId: null,
        isAuthenticated: false 
      }),
    }),
    {
      name: 'farm-store',
    }
  )
)
