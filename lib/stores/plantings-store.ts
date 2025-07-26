import { create } from 'zustand'
import { devtools } from 'zustand/middleware'

interface Planting {
  id: string
  farm_variety_name: string
  variety_name: string
  planting_location: string
  planting_date: string
  crop_status: string
  growth_stage: string
  total_estimated_yield: number
  estimated_remaining_yield: number
  remaining_yield: number
  planted_quantity: number
  planted_area: number
  planted_area_unit: string
  notes: string
}

interface PlantingsState {
  plantings: Planting[]
  isLoading: boolean
  error: string | null
  
  setPlantings: (plantings: Planting[]) => void
  addPlanting: (planting: Planting) => void
  updatePlanting: (id: string, updates: Partial<Planting>) => void
  removePlanting: (id: string) => void
  setLoading: (loading: boolean) => void
  setError: (error: string | null) => void
}

export const usePlantingsStore = create<PlantingsState>()(
  devtools(
    (set) => ({
      plantings: [],
      isLoading: false,
      error: null,

      setPlantings: (plantings) => set({ plantings }),
      addPlanting: (planting) => set((state) => ({ 
        plantings: [...state.plantings, planting] 
      })),
      updatePlanting: (id, updates) => set((state) => ({
        plantings: state.plantings.map(p => 
          p.id === id ? { ...p, ...updates } : p
        )
      })),
      removePlanting: (id) => set((state) => ({
        plantings: state.plantings.filter(p => p.id !== id)
      })),
      setLoading: (loading) => set({ isLoading: loading }),
      setError: (error) => set({ error }),
    }),
    {
      name: 'plantings-store',
    }
  )
)
