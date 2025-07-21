'use client'

import { useState, useEffect, useRef } from 'react'
import { Input } from '@/components/ui/input'
import { Label } from '@/components/ui/label'
import { Button } from '@/components/ui/button'
import { Card, CardContent } from '@/components/ui/card'
import { Badge } from '@/components/ui/badge'
import { Plus, Search, X } from 'lucide-react'
import {
  Dialog,
  DialogContent,
  DialogDescription,
  DialogHeader,
  DialogTitle,
  DialogTrigger,
} from '@/components/ui/dialog'
import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from '@/components/ui/select'

interface Variety {
  id: string
  name: string
  emoji: string
  description?: string
  category?: string
  subcategory?: string
  displayName: string
  fullPath: string
  type?: 'variety' | 'cultivar' // New field to distinguish between varieties and cultivars
  variety_id?: string // For cultivars - reference to parent variety
  cultivar_id?: string // For varieties that have cultivars
  characteristics?: string // For cultivars
  botanical_name?: string // For cultivars
}

interface Category {
  id: string
  name: string
  subcategories: Array<{
    id: string
    name: string
  }>
}

interface VarietySearchProps {
  value: string
  onVarietySelect: (variety: Variety) => void
  placeholder?: string
  required?: boolean
}

export function VarietySearch({ 
  value, 
  onVarietySelect, 
  placeholder = "Search for a variety...",
  required = false 
}: VarietySearchProps) {
  const [query, setQuery] = useState('')
  const [selectedVariety, setSelectedVariety] = useState<Variety | null>(null)
  const [varieties, setVarieties] = useState<Variety[]>([])
  const [isLoading, setIsLoading] = useState(false)
  const [showResults, setShowResults] = useState(false)
  const [showAddDialog, setShowAddDialog] = useState(false)
  const [categories, setCategories] = useState<Category[]>([])
  
  // New variety form state
  const [newVariety, setNewVariety] = useState({
    name: '',
    subcategory_id: '',
    emoji: '🌱',
    description: ''
  })
  
  const searchRef = useRef<HTMLDivElement>(null)
  const debounceRef = useRef<NodeJS.Timeout>()

  // Load categories for new variety dialog
  useEffect(() => {
    fetchCategories()
  }, [])

  // Handle outside clicks
  useEffect(() => {
    const handleClickOutside = (event: MouseEvent) => {
      if (searchRef.current && !searchRef.current.contains(event.target as Node)) {
        setShowResults(false)
      }
    }

    document.addEventListener('mousedown', handleClickOutside)
    return () => document.removeEventListener('mousedown', handleClickOutside)
  }, [])

  const fetchCategories = async () => {
    try {
      const response = await fetch('/api/categories')
      if (response.ok) {
        const data = await response.json()
        setCategories(data.categories)
      }
    } catch (error) {
      console.error('Error fetching categories:', error)
    }
  }

  const searchVarieties = async (searchQuery: string) => {
    if (searchQuery.length < 2) {
      setVarieties([])
      return
    }

    setIsLoading(true)
    try {
      // Use the enhanced search API that includes cultivars
      const response = await fetch(`/api/search/varieties?query=${encodeURIComponent(searchQuery)}`)
      if (response.ok) {
        const data = await response.json()
        setVarieties(data.results || [])
        setShowResults(true)
      }
    } catch (error) {
      console.error('Error searching varieties:', error)
    } finally {
      setIsLoading(false)
    }
  }

  const handleInputChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    const newQuery = e.target.value
    setQuery(newQuery)
    
    // Clear previous debounce
    if (debounceRef.current) {
      clearTimeout(debounceRef.current)
    }
    
    // Debounce search
    debounceRef.current = setTimeout(() => {
      searchVarieties(newQuery)
    }, 300)
  }

  const handleVarietySelect = (variety: Variety) => {
    setSelectedVariety(variety)
    setQuery(variety.name)
    setShowResults(false)
    onVarietySelect(variety)
  }

  const handleAddNewVariety = async () => {
    if (!newVariety.name || !newVariety.subcategory_id) {
      return
    }

    try {
      const response = await fetch('/api/varieties', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(newVariety)
      })

      if (response.ok) {
        const data = await response.json()
        handleVarietySelect(data.variety)
        setShowAddDialog(false)
        setNewVariety({
          name: '',
          subcategory_id: '',
          emoji: '🌱',
          description: ''
        })
      }
    } catch (error) {
      console.error('Error adding variety:', error)
    }
  }

  const clearSelection = () => {
    setSelectedVariety(null)
    setQuery('')
    onVarietySelect({ id: '', name: '', emoji: '', displayName: '', fullPath: '' })
  }

  return (
    <div className="space-y-2">
      <Label htmlFor="variety-search">
        Product Name / Variety {required && <span className="text-red-500">*</span>}
      </Label>
      
      <div className="relative" ref={searchRef}>
        <div className="relative">
          <Search className="absolute left-3 top-3 h-4 w-4 text-gray-400" />
          <Input
            id="variety-search"
            value={query}
            onChange={handleInputChange}
            placeholder={placeholder}
            className="pl-10 pr-20"
            required={required}
          />
          {selectedVariety && (
            <Button
              type="button"
              variant="ghost"
              size="sm"
              onClick={clearSelection}
              className="absolute right-2 top-1 h-8 w-8 p-0"
            >
              <X className="h-4 w-4" />
            </Button>
          )}
        </div>

        {/* Selected Variety Display */}
        {selectedVariety && (
          <div className="mt-2">
            <Badge variant="secondary" className="text-sm">
              {selectedVariety.displayName}
            </Badge>
            <p className="text-xs text-gray-500 mt-1">{selectedVariety.fullPath}</p>
          </div>
        )}

        {/* Search Results */}
        {showResults && (
          <Card className="absolute z-10 w-full mt-1 max-h-64 overflow-y-auto">
            <CardContent className="p-0">
              {isLoading ? (
                <div className="p-3 text-center text-gray-500">
                  <Search className="h-4 w-4 animate-spin mx-auto mb-2" />
                  Searching...
                </div>
              ) : varieties.length > 0 ? (
                <div className="space-y-0">
                  {varieties.map((variety) => (
                    <button
                      key={variety.id}
                      onClick={() => handleVarietySelect(variety)}
                      className="w-full p-3 text-left hover:bg-gray-50 border-b last:border-b-0 flex items-center justify-between"
                    >
                      <div className="flex-1">
                        <div className="flex items-center gap-2">
                          <span className="font-medium">{variety.displayName}</span>
                          {variety.type === 'cultivar' && (
                            <Badge variant="outline" className="text-xs">Cultivar</Badge>
                          )}
                        </div>
                        <div className="text-sm text-gray-500">{variety.fullPath}</div>
                        {variety.characteristics && (
                          <div className="text-xs text-gray-400 mt-1">{variety.characteristics}</div>
                        )}
                      </div>
                      <div className="text-lg">{variety.emoji}</div>
                    </button>
                  ))}
                </div>
              ) : query.length >= 2 ? (
                <div className="p-3 text-center">
                  <p className="text-gray-500 mb-2">No varieties found for "{query}"</p>
                  <Dialog open={showAddDialog} onOpenChange={setShowAddDialog}>
                    <DialogTrigger asChild>
                      <Button size="sm" variant="outline">
                        <Plus className="h-4 w-4 mr-2" />
                        Add New Variety
                      </Button>
                    </DialogTrigger>
                    <DialogContent>
                      <DialogHeader>
                        <DialogTitle>Add New Variety</DialogTitle>
                        <DialogDescription>
                          Add "{query}" as a new variety to the database
                        </DialogDescription>
                      </DialogHeader>
                      <div className="space-y-4">
                        <div>
                          <Label htmlFor="new-variety-name">Variety Name</Label>
                          <Input
                            id="new-variety-name"
                            value={newVariety.name || query}
                            onChange={(e) => setNewVariety(prev => ({ ...prev, name: e.target.value }))}
                            placeholder="Enter variety name"
                          />
                        </div>
                        
                        <div>
                          <Label htmlFor="new-variety-category">Category</Label>
                          <Select 
                            value={newVariety.subcategory_id} 
                            onValueChange={(value) => setNewVariety(prev => ({ ...prev, subcategory_id: value }))}
                          >
                            <SelectTrigger>
                              <SelectValue placeholder="Select category" />
                            </SelectTrigger>
                            <SelectContent>
                              {categories.map((category) => (
                                category.subcategories.map((subcategory) => (
                                  <SelectItem key={subcategory.id} value={subcategory.id}>
                                    {category.name} {'>'} {subcategory.name}
                                  </SelectItem>
                                ))
                              ))}
                            </SelectContent>
                          </Select>
                        </div>
                        
                        <div>
                          <Label htmlFor="new-variety-emoji">Emoji</Label>
                          <Input
                            id="new-variety-emoji"
                            value={newVariety.emoji}
                            onChange={(e) => setNewVariety(prev => ({ ...prev, emoji: e.target.value }))}
                            placeholder="🌱"
                            maxLength={2}
                          />
                        </div>
                        
                        <div>
                          <Label htmlFor="new-variety-description">Description (optional)</Label>
                          <Input
                            id="new-variety-description"
                            value={newVariety.description}
                            onChange={(e) => setNewVariety(prev => ({ ...prev, description: e.target.value }))}
                            placeholder="Brief description of the variety"
                          />
                        </div>
                        
                        <div className="flex gap-2">
                          <Button 
                            onClick={handleAddNewVariety}
                            disabled={!newVariety.name || !newVariety.subcategory_id}
                          >
                            Add Variety
                          </Button>
                          <Button variant="outline" onClick={() => setShowAddDialog(false)}>
                            Cancel
                          </Button>
                        </div>
                      </div>
                    </DialogContent>
                  </Dialog>
                </div>
              ) : null}
            </CardContent>
          </Card>
        )}
      </div>
    </div>
  )
}
