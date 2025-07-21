import { db } from '../db/client'
import { products, farms, varieties } from '../db/schema'
import { eq, desc, and } from 'drizzle-orm'
import type { Product } from '@/types/database'

export interface ProductFilters {
  farmId?: string
  varietyId?: string
  inSeason?: boolean
  organic?: boolean
  preHarvest?: boolean
  limit?: number
  offset?: number
}

export class ProductsDrizzleService {
  async getAll(filters?: ProductFilters) {
    // Use type assertion to avoid complex Drizzle typing issues
    let query: any = db
      .select()
      .from(products)
      .leftJoin(farms, eq(products.farmId, farms.id))
      .leftJoin(varieties, eq(products.varietyId, varieties.id))
      .orderBy(desc(products.createdAt))

    // Apply filters
    const conditions = []
    if (filters?.farmId) {
      conditions.push(eq(products.farmId, filters.farmId))
    }
    if (filters?.varietyId) {
      conditions.push(eq(products.varietyId, filters.varietyId))
    }
    if (filters?.inSeason !== undefined) {
      conditions.push(eq(products.inSeason, filters.inSeason))
    }
    if (filters?.organic !== undefined) {
      conditions.push(eq(products.organic, filters.organic))
    }
    if (filters?.preHarvest !== undefined) {
      conditions.push(eq(products.preHarvest, filters.preHarvest))
    }

    if (conditions.length > 0) {
      query = query.where(and(...conditions))
    }

    if (filters?.limit) {
      query = query.limit(filters.limit)
    }

    if (filters?.offset) {
      query = query.offset(filters.offset)
    }

    const results = await query.execute()
    
    // Transform results to match expected API format with snake_case
    return results.map((row: any) => ({
      id: row.products.id,
      name: row.products.name,
      farm_id: row.products.farmId,
      variety_id: row.products.varietyId,
      price: Number(row.products.price),
      stock: row.products.stock,
      freshness: row.products.freshness,
      harvest_date: row.products.harvestDate?.toISOString() || null,
      pre_harvest: row.products.preHarvest,
      organic: row.products.organic,
      in_season: row.products.inSeason,
      delivery_days: row.products.deliveryDays || [],
      images: row.products.images || [],
      created_at: row.products.createdAt?.toISOString() || '',
      updated_at: row.products.updatedAt?.toISOString() || '',
      farm: row.farms ? {
        id: row.farms.id,
        name: row.farms.name,
        description: row.farms.description,
        address: row.farms.address,
        phone: row.farms.phone,
        email: row.farms.email,
        website: row.farms.website,
        owner_id: row.farms.ownerId,
        created_at: row.farms.createdAt?.toISOString() || '',
        updated_at: row.farms.updatedAt?.toISOString() || '',
      } : undefined,
      variety: row.varieties ? {
        id: row.varieties.id,
        name: row.varieties.name,
        description: row.varieties.description,
        subcategory_id: row.varieties.subcategoryId,
        created_at: row.varieties.createdAt?.toISOString() || '',
        updated_at: row.varieties.updatedAt?.toISOString() || '',
      } : undefined
    }))
  }

  async getById(id: string) {
    const results = await db
      .select()
      .from(products)
      .leftJoin(farms, eq(products.farmId, farms.id))
      .leftJoin(varieties, eq(products.varietyId, varieties.id))
      .where(eq(products.id, id))
      .execute()

    const row = results[0]
    if (!row) {
      throw new Error('Product not found')
    }

    // Transform result to match expected API format
    return {
      id: row.products.id,
      name: row.products.name,
      farm_id: row.products.farmId,
      variety_id: row.products.varietyId,
      price: Number(row.products.price),
      stock: row.products.stock,
      freshness: row.products.freshness,
      harvest_date: row.products.harvestDate?.toISOString() || null,
      pre_harvest: row.products.preHarvest,
      organic: row.products.organic,
      in_season: row.products.inSeason,
      delivery_days: row.products.deliveryDays || [],
      images: row.products.images || [],
      created_at: row.products.createdAt?.toISOString() || '',
      updated_at: row.products.updatedAt?.toISOString() || '',
      farm: row.farms ? {
        id: row.farms.id,
        name: row.farms.name,
        description: row.farms.description,
        address: row.farms.address,
        phone: row.farms.phone,
        email: row.farms.email,
        website: row.farms.website,
        owner_id: row.farms.ownerId,
        created_at: row.farms.createdAt?.toISOString() || '',
        updated_at: row.farms.updatedAt?.toISOString() || '',
      } : undefined,
      variety: row.varieties ? {
        id: row.varieties.id,
        name: row.varieties.name,
        description: row.varieties.description,
        subcategory_id: row.varieties.subcategoryId,
        created_at: row.varieties.createdAt?.toISOString() || '',
        updated_at: row.varieties.updatedAt?.toISOString() || '',
      } : undefined
    }
  }

  async create(productData: any) {
    const [newProduct] = await db
      .insert(products)
      .values({
        name: productData.name,
        farmId: productData.farm_id,
        varietyId: productData.variety_id,
        price: String(productData.price),
        stock: productData.stock,
        freshness: productData.freshness as any,
        harvestDate: productData.harvest_date ? new Date(productData.harvest_date) : null,
        preHarvest: productData.pre_harvest || false,
        organic: productData.organic || false,
        inSeason: productData.in_season !== false,
        deliveryDays: productData.delivery_days || [],
        images: productData.images || [],
      })
      .returning()
      .execute()

    return {
      id: newProduct.id,
      name: newProduct.name,
      farm_id: newProduct.farmId,
      variety_id: newProduct.varietyId,
      price: Number(newProduct.price),
      stock: newProduct.stock,
      freshness: newProduct.freshness,
      harvest_date: newProduct.harvestDate?.toISOString() || null,
      pre_harvest: newProduct.preHarvest,
      organic: newProduct.organic,
      in_season: newProduct.inSeason,
      delivery_days: newProduct.deliveryDays || [],
      images: newProduct.images || [],
      created_at: newProduct.createdAt?.toISOString() || '',
      updated_at: newProduct.updatedAt?.toISOString() || '',
    }
  }

  async update(id: string, productData: any) {
    const [updatedProduct] = await db
      .update(products)
      .set({
        name: productData.name,
        farmId: productData.farm_id,
        varietyId: productData.variety_id,
        price: productData.price ? String(productData.price) : undefined,
        stock: productData.stock,
        freshness: productData.freshness as any,
        harvestDate: productData.harvest_date ? new Date(productData.harvest_date) : undefined,
        preHarvest: productData.pre_harvest,
        organic: productData.organic,
        inSeason: productData.in_season,
        deliveryDays: productData.delivery_days,
        images: productData.images,
        updatedAt: new Date(),
      })
      .where(eq(products.id, id))
      .returning()
      .execute()

    if (!updatedProduct) {
      throw new Error('Product not found')
    }

    return {
      id: updatedProduct.id,
      name: updatedProduct.name,
      farm_id: updatedProduct.farmId,
      variety_id: updatedProduct.varietyId,
      price: Number(updatedProduct.price),
      stock: updatedProduct.stock,
      freshness: updatedProduct.freshness,
      harvest_date: updatedProduct.harvestDate?.toISOString() || null,
      pre_harvest: updatedProduct.preHarvest,
      organic: updatedProduct.organic,
      in_season: updatedProduct.inSeason,
      delivery_days: updatedProduct.deliveryDays || [],
      images: updatedProduct.images || [],
      created_at: updatedProduct.createdAt?.toISOString() || '',
      updated_at: updatedProduct.updatedAt?.toISOString() || '',
    }
  }

  async delete(id: string) {
    const [deletedProduct] = await db
      .delete(products)
      .where(eq(products.id, id))
      .returning()
      .execute()

    if (!deletedProduct) {
      throw new Error('Product not found')
    }

    return {
      id: deletedProduct.id,
      name: deletedProduct.name,
      farm_id: deletedProduct.farmId,
      variety_id: deletedProduct.varietyId,
      price: Number(deletedProduct.price),
      stock: deletedProduct.stock,
      freshness: deletedProduct.freshness,
      harvest_date: deletedProduct.harvestDate?.toISOString() || null,
      pre_harvest: deletedProduct.preHarvest,
      organic: deletedProduct.organic,
      in_season: deletedProduct.inSeason,
      delivery_days: deletedProduct.deliveryDays || [],
      images: deletedProduct.images || [],
      created_at: deletedProduct.createdAt?.toISOString() || '',
      updated_at: deletedProduct.updatedAt?.toISOString() || '',
    }
  }

  async getByFarmId(farmId: string, limit?: number) {
    let query: any = db
      .select()
      .from(products)
      .where(eq(products.farmId, farmId))
      .orderBy(desc(products.createdAt))

    if (limit) {
      query = query.limit(limit)
    }

    const results = await query.execute()
    
    return results.map((row: any) => ({
      id: row.id,
      name: row.name,
      farm_id: row.farmId,
      variety_id: row.varietyId,
      price: Number(row.price),
      stock: row.stock,
      freshness: row.freshness,
      harvest_date: row.harvestDate?.toISOString() || null,
      pre_harvest: row.preHarvest,
      organic: row.organic,
      in_season: row.inSeason,
      delivery_days: row.deliveryDays || [],
      images: row.images || [],
      created_at: row.createdAt?.toISOString() || '',
      updated_at: row.updatedAt?.toISOString() || '',
    }))
  }

  async getProductStats(farmId?: string) {
    let query: any = db
      .select({
        stock: products.stock,
        price: products.price,
      })
      .from(products)

    if (farmId) {
      query = query.where(eq(products.farmId, farmId))
    }

    const results = await query.execute()

    const totalProducts = results.length
    const totalValue = results.reduce((sum: number, product: any) => 
      sum + (Number(product.stock || 0) * Number(product.price || 0)), 0)
    const averagePrice = totalProducts > 0 ? 
      results.reduce((sum: number, product: any) => sum + Number(product.price || 0), 0) / totalProducts : 0

    return {
      totalProducts,
      totalValue,
      averagePrice,
    }
  }
}

export const productsDrizzleService = new ProductsDrizzleService()
