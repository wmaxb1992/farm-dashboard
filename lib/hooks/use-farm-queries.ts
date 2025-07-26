import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query'

export const farmQueryKeys = {
  plantings: (farmId: string) => ['plantings', farmId],
  harvestBatches: (farmId: string) => ['harvest-batches', farmId],
  products: () => ['products'],
  orders: (farmId: string) => ['orders', farmId],
  batchPricing: (farmId: string) => ['batch-pricing', farmId],
}

export function useFarmPlantings(farmId: string) {
  return useQuery({
    queryKey: farmQueryKeys.plantings(farmId),
    queryFn: async () => {
      const response = await fetch(`/api/farm-plantings?farm_id=${farmId}`)
      if (!response.ok) throw new Error('Failed to fetch plantings')
      const data = await response.json()
      return data.plantings || []
    },
    enabled: !!farmId,
  })
}

export function useAddPlanting() {
  const queryClient = useQueryClient()
  
  return useMutation({
    mutationFn: async (plantingData: any) => {
      const response = await fetch('/api/farm-plantings', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(plantingData),
      })
      if (!response.ok) throw new Error('Failed to add planting')
      return response.json()
    },
    onSuccess: (_, variables) => {
      queryClient.invalidateQueries({ 
        queryKey: farmQueryKeys.plantings(variables.farm_id) 
      })
    },
  })
}

export function useUpdatePlanting() {
  const queryClient = useQueryClient()
  
  return useMutation({
    mutationFn: async ({ id, farmId, ...updates }: any) => {
      const response = await fetch('/api/farm-plantings', {
        method: 'PUT',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ id, ...updates }),
      })
      if (!response.ok) throw new Error('Failed to update planting')
      return response.json()
    },
    onSuccess: (_, variables) => {
      queryClient.invalidateQueries({ 
        queryKey: farmQueryKeys.plantings(variables.farmId) 
      })
    },
  })
}

export function useHarvestBatches(farmId: string) {
  return useQuery({
    queryKey: farmQueryKeys.harvestBatches(farmId),
    queryFn: async () => {
      const response = await fetch(`/api/harvest-batches?farm_id=${farmId}`)
      if (!response.ok) throw new Error('Failed to fetch harvest batches')
      const data = await response.json()
      return data.batches || []
    },
    enabled: !!farmId,
  })
}

export function useProducts() {
  return useQuery({
    queryKey: farmQueryKeys.products(),
    queryFn: async () => {
      const response = await fetch('/api/products')
      if (!response.ok) throw new Error('Failed to fetch products')
      const data = await response.json()
      return data.products || []
    },
  })
}

export function useOrders(farmId: string) {
  return useQuery({
    queryKey: farmQueryKeys.orders(farmId),
    queryFn: async () => {
      const response = await fetch(`/api/orders?farm_id=${farmId}`)
      if (!response.ok) throw new Error('Failed to fetch orders')
      const data = await response.json()
      return data.orders || []
    },
    enabled: !!farmId,
  })
}

export function useBatchPricing(farmId: string) {
  return useQuery({
    queryKey: farmQueryKeys.batchPricing(farmId),
    queryFn: async () => {
      const response = await fetch(`/api/batch-pricing?farm_id=${farmId}`)
      if (!response.ok) throw new Error('Failed to fetch batch pricing')
      const data = await response.json()
      return data.batches || []
    },
    enabled: !!farmId,
  })
}

export function useUpdateBatchPricing() {
  const queryClient = useQueryClient()
  
  return useMutation({
    mutationFn: async ({ batchId, farmId, ...updates }: any) => {
      const response = await fetch('/api/batch-pricing', {
        method: 'PUT',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ batch_id: batchId, ...updates }),
      })
      if (!response.ok) throw new Error('Failed to update batch pricing')
      return response.json()
    },
    onSuccess: (_, variables) => {
      queryClient.invalidateQueries({ 
        queryKey: farmQueryKeys.batchPricing(variables.farmId) 
      })
    },
  })
}
