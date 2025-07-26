import { create } from 'zustand'
import { devtools } from 'zustand/middleware'

interface HarvestBatch {
  id: string
  variety_name: string
  harvest_date: string
  quantity: number
  quality_grade: string
  status: string
  current_price: number
  freshness_score: number
}

interface BatchesState {
  batches: HarvestBatch[]
  isLoading: boolean
  error: string | null
  
  setBatches: (batches: HarvestBatch[]) => void
  addBatch: (batch: HarvestBatch) => void
  updateBatch: (id: string, updates: Partial<HarvestBatch>) => void
  removeBatch: (id: string) => void
  setLoading: (loading: boolean) => void
  setError: (error: string | null) => void
}

export const useBatchesStore = create<BatchesState>()(
  devtools(
    (set) => ({
      batches: [],
      isLoading: false,
      error: null,

      setBatches: (batches) => set({ batches }),
      addBatch: (batch) => set((state) => ({ 
        batches: [...state.batches, batch] 
      })),
      updateBatch: (id, updates) => set((state) => ({
        batches: state.batches.map(b => 
          b.id === id ? { ...b, ...updates } : b
        )
      })),
      removeBatch: (id) => set((state) => ({
        batches: state.batches.filter(b => b.id !== id)
      })),
      setLoading: (loading) => set({ isLoading: loading }),
      setError: (error) => set({ error }),
    }),
    {
      name: 'batches-store',
    }
  )
)
