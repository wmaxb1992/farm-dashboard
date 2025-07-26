import { create } from 'zustand'
import { devtools } from 'zustand/middleware'

interface BatchPricing {
  id: string
  batch_id: string
  variety_name: string
  current_price: number
  base_price: number
  freshness_score: number
  quality_grade: string
  quantity: number
  harvest_date: string
}

interface PricingState {
  batchPricing: BatchPricing[]
  isLoading: boolean
  error: string | null
  
  setBatchPricing: (pricing: BatchPricing[]) => void
  updateBatchPrice: (batchId: string, updates: Partial<BatchPricing>) => void
  setLoading: (loading: boolean) => void
  setError: (error: string | null) => void
}

export const usePricingStore = create<PricingState>()(
  devtools(
    (set) => ({
      batchPricing: [],
      isLoading: false,
      error: null,

      setBatchPricing: (pricing) => set({ batchPricing: pricing }),
      updateBatchPrice: (batchId, updates) => set((state) => ({
        batchPricing: state.batchPricing.map(p => 
          p.batch_id === batchId ? { ...p, ...updates } : p
        )
      })),
      setLoading: (loading) => set({ isLoading: loading }),
      setError: (error) => set({ error }),
    }),
    {
      name: 'pricing-store',
    }
  )
)
