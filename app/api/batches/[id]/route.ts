import { NextRequest, NextResponse } from 'next/server'
import { supabase } from '@/lib/supabase'
import type { BatchPricing, BatchInventory, HarvestBatch } from '@/types/database'

// GET /api/batches/[id] - Get specific batch with pricing and inventory
export async function GET(request: NextRequest, { params }: { params: { id: string } }) {
  const batchId = params.id

  if (!supabase) {
    return NextResponse.json({ error: 'Database connection not available' }, { status: 500 })
  }

  try {
    // Get batch details with current pricing
    const { data: batchWithPricing, error: batchError } = await supabase
      .from('batch_current_pricing')
      .select(
        `
        *,
        variety:varieties(
          id,
          name,
          emoji,
          description,
          subcategory:subcategories(
            id,
            name,
            category:categories(id, name)
          )
        )
      `
      )
      .eq('batch_id', batchId)
      .single()

    if (batchError) {
      console.error('Error fetching batch:', batchError)
      return NextResponse.json({ error: 'Batch not found' }, { status: 404 })
    }

    // Get inventory status
    const { data: inventory, error: inventoryError } = await supabase
      .from('batch_inventory')
      .select('*')
      .eq('batch_id', batchId)
      .single()

    if (inventoryError) {
      console.error('Error fetching inventory:', inventoryError)
    }

    return NextResponse.json({
      batch: batchWithPricing,
      inventory: inventory || null,
    })
  } catch (error) {
    console.error('Error in GET /api/batches/[id]:', error)
    return NextResponse.json({ error: 'Internal server error' }, { status: 500 })
  }
}

// PUT /api/batches/[id] - Update batch pricing or inventory
export async function PUT(request: NextRequest, { params }: { params: { id: string } }) {
  const batchId = params.id

  if (!supabase) {
    return NextResponse.json({ error: 'Database connection not available' }, { status: 500 })
  }

  try {
    const body = await request.json()
    const { pricing_updates, inventory_updates, batch_updates } = body

    const results: any = {}

    // Update batch details if provided
    if (batch_updates) {
      const { data: batchData, error: batchError } = await supabase
        .from('harvest_batches')
        .update(batch_updates)
        .eq('id', batchId)
        .select()
        .single()

      if (batchError) {
        console.error('Error updating batch:', batchError)
        return NextResponse.json({ error: 'Failed to update batch' }, { status: 500 })
      }

      results.batch = batchData
    }

    // Update pricing if provided
    if (pricing_updates) {
      const { data: pricingData, error: pricingError } = await supabase
        .from('batch_pricing')
        .update({
          ...pricing_updates,
          updated_at: new Date().toISOString(),
        })
        .eq('batch_id', batchId)
        .select()
        .single()

      if (pricingError) {
        console.error('Error updating pricing:', pricingError)
        return NextResponse.json({ error: 'Failed to update pricing' }, { status: 500 })
      }

      results.pricing = pricingData
    }

    // Update inventory if provided
    if (inventory_updates) {
      const { data: inventoryData, error: inventoryError } = await supabase
        .from('batch_inventory')
        .update({
          ...inventory_updates,
          last_updated: new Date().toISOString(),
        })
        .eq('batch_id', batchId)
        .select()
        .single()

      if (inventoryError) {
        console.error('Error updating inventory:', inventoryError)
        return NextResponse.json({ error: 'Failed to update inventory' }, { status: 500 })
      }

      results.inventory = inventoryData
    }

    return NextResponse.json({
      message: 'Batch updated successfully',
      ...results,
    })
  } catch (error) {
    console.error('Error in PUT /api/batches/[id]:', error)
    return NextResponse.json({ error: 'Internal server error' }, { status: 500 })
  }
}

// DELETE /api/batches/[id] - Mark batch as expired/waste
export async function DELETE(request: NextRequest, { params }: { params: { id: string } }) {
  const batchId = params.id

  if (!supabase) {
    return NextResponse.json({ error: 'Database connection not available' }, { status: 500 })
  }

  try {
    const { searchParams } = new URL(request.url)
    const reason = searchParams.get('reason') || 'expired'
    const quantity = searchParams.get('quantity')

    if (reason === 'soft_delete') {
      // Soft delete by moving all available quantity to expired
      const { data: inventory, error: getInventoryError } = await supabase
        .from('batch_inventory')
        .select('quantity_available')
        .eq('batch_id', batchId)
        .single()

      if (getInventoryError) {
        return NextResponse.json({ error: 'Batch not found' }, { status: 404 })
      }

      const { error: updateError } = await supabase
        .from('batch_inventory')
        .update({
          quantity_available: 0,
          quantity_expired: inventory.quantity_available,
          last_updated: new Date().toISOString(),
        })
        .eq('batch_id', batchId)

      if (updateError) {
        console.error('Error marking batch as expired:', updateError)
        return NextResponse.json({ error: 'Failed to mark batch as expired' }, { status: 500 })
      }

      return NextResponse.json({ message: 'Batch marked as expired' })
    } else {
      // Move specific quantity to damaged or expired
      const moveQuantity = quantity ? parseFloat(quantity) : 0

      if (moveQuantity <= 0) {
        return NextResponse.json({ error: 'Valid quantity is required' }, { status: 400 })
      }

      const { data: inventory, error: getInventoryError } = await supabase
        .from('batch_inventory')
        .select('*')
        .eq('batch_id', batchId)
        .single()

      if (getInventoryError) {
        return NextResponse.json({ error: 'Batch not found' }, { status: 404 })
      }

      if (inventory.quantity_available < moveQuantity) {
        return NextResponse.json({ error: 'Insufficient available quantity' }, { status: 400 })
      }

      const updates: any = {
        quantity_available: inventory.quantity_available - moveQuantity,
        last_updated: new Date().toISOString(),
      }

      if (reason === 'damaged') {
        updates.quantity_damaged = inventory.quantity_damaged + moveQuantity
      } else {
        updates.quantity_expired = inventory.quantity_expired + moveQuantity
      }

      const { error: updateError } = await supabase
        .from('batch_inventory')
        .update(updates)
        .eq('batch_id', batchId)

      if (updateError) {
        console.error('Error updating inventory:', updateError)
        return NextResponse.json({ error: 'Failed to update inventory' }, { status: 500 })
      }

      return NextResponse.json({
        message: `Moved ${moveQuantity} units to ${reason}`,
        updated_inventory: updates,
      })
    }
  } catch (error) {
    console.error('Error in DELETE /api/batches/[id]:', error)
    return NextResponse.json({ error: 'Internal server error' }, { status: 500 })
  }
}
