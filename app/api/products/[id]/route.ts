import { NextRequest, NextResponse } from 'next/server'
import { getSupabaseAdmin } from '@/lib/supabase'

// Helper function to get user's farm
async function getUserFarm(userId: string) {
  const supabaseAdmin = getSupabaseAdmin()
  
  const { data: farm, error } = await supabaseAdmin
    .from('farms')
    .select('id')
    .eq('owner_id', userId)
    .single()
    
  if (error) {
    console.error('Error fetching user farm:', error)
    return null
  }
  
  return farm
}

// Helper function to verify user has access to product
async function verifyProductAccess(productId: string, userId: string) {
  const supabaseAdmin = getSupabaseAdmin()
  
  // Get the product's farm_id
  const { data: product, error: productError } = await supabaseAdmin
    .from('products')
    .select('farm_id')
    .eq('id', productId)
    .single()
    
  if (productError || !product) {
    return false
  }
  
  // Get user's farm
  const userFarm = await getUserFarm(userId)
  if (!userFarm) {
    return false
  }
  
  // Check if product belongs to user's farm
  return product.farm_id === userFarm.id
}

export async function GET(
  request: NextRequest,
  { params }: { params: { id: string } }
) {
  try {
    const productId = params.id

    if (!productId) {
      return NextResponse.json(
        { error: 'Product ID is required' },
        { status: 400 }
      )
    }

    const supabaseAdmin = getSupabaseAdmin()

    // For now, let's get the product without authentication
    // TODO: Add proper session-based authentication
    const { data: product, error } = await supabaseAdmin
      .from('products')
      .select('*')
      .eq('id', productId)
      .single()

    if (error) {
      return NextResponse.json(
        { error: 'Product not found' },
        { status: 404 }
      )
    }

    return NextResponse.json({
      product,
    })
  } catch (error) {
    console.error('Error fetching product:', error)
    return NextResponse.json(
      { error: 'Failed to fetch product' },
      { status: 500 }
    )
  }
}

export async function PUT(
  request: NextRequest,
  { params }: { params: { id: string } }
) {
  try {
    const productId = params.id
    const updateData = await request.json()

    if (!productId) {
      return NextResponse.json(
        { error: 'Product ID is required' },
        { status: 400 }
      )
    }

    // Validate required fields
    if (!updateData.farm_id) {
      return NextResponse.json(
        { error: 'Farm ID is required' },
        { status: 400 }
      )
    }

    if (!updateData.variety_id) {
      return NextResponse.json(
        { error: 'Variety ID is required' },
        { status: 400 }
      )
    }

    const supabaseAdmin = getSupabaseAdmin()

    // TODO: Add proper authentication and farm ownership verification
    // For now, let's add a basic check to ensure the product belongs to a farm
    
    // First, get the existing product to check its farm_id
    const { data: existingProduct, error: fetchError } = await supabaseAdmin
      .from('products')
      .select('farm_id')
      .eq('id', productId)
      .single()

    if (fetchError || !existingProduct) {
      return NextResponse.json(
        { error: 'Product not found' },
        { status: 404 }
      )
    }

    // Update product - only allow updates to products that belong to a farm
    const { data: updatedProduct, error } = await supabaseAdmin
      .from('products')
      .update({
        ...updateData,
        updated_at: new Date().toISOString(),
      })
      .eq('id', productId)
      .eq('farm_id', existingProduct.farm_id as string) // Ensure we're updating the right farm's product
      .select()

    if (error) {
      console.error('Supabase update error:', error)
      return NextResponse.json(
        { error: `Failed to update product: ${error.message}` },
        { status: 400 }
      )
    }

    if (!updatedProduct || updatedProduct.length === 0) {
      return NextResponse.json(
        { error: 'Product not found or access denied' },
        { status: 404 }
      )
    }

    return NextResponse.json({
      message: 'Product updated successfully',
      product: updatedProduct[0],
    })
  } catch (error) {
    console.error('Error updating product:', error)
    return NextResponse.json(
      { error: 'Failed to update product' },
      { status: 500 }
    )
  }
}

export async function DELETE(
  request: NextRequest,
  { params }: { params: { id: string } }
) {
  try {
    const productId = params.id

    if (!productId) {
      return NextResponse.json(
        { error: 'Product ID is required' },
        { status: 400 }
      )
    }

    const supabaseAdmin = getSupabaseAdmin()

    // TODO: Add proper authentication and farm ownership verification
    // For now, let's add a basic check to ensure the product belongs to a farm
    
    // First, get the existing product to check its farm_id
    const { data: existingProduct, error: fetchError } = await supabaseAdmin
      .from('products')
      .select('farm_id')
      .eq('id', productId)
      .single()

    if (fetchError || !existingProduct) {
      return NextResponse.json(
        { error: 'Product not found' },
        { status: 404 }
      )
    }

    // Delete product - only allow deletion of products that belong to a farm
    const { error } = await supabaseAdmin
      .from('products')
      .delete()
      .eq('id', productId)
      .eq('farm_id', existingProduct.farm_id as string) // Ensure we're deleting the right farm's product

    if (error) {
      return NextResponse.json(
        { error: 'Product not found or failed to delete' },
        { status: 404 }
      )
    }

    return NextResponse.json({
      message: 'Product deleted successfully',
    })
  } catch (error) {
    console.error('Error deleting product:', error)
    return NextResponse.json(
      { error: 'Failed to delete product' },
      { status: 500 }
    )
  }
}
