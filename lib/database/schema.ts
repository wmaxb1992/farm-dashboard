/**
 * Drizzle Database Schema
 * Modern type-safe database schema using Drizzle ORM
 */

import { pgTable, text, uuid, timestamp, decimal, integer, boolean, jsonb, pgEnum } from 'drizzle-orm/pg-core'
import { sql } from 'drizzle-orm'

// Create enums
export const orderStatusEnum = pgEnum('order_status', ['pending', 'processing', 'shipped', 'delivered', 'cancelled'])
export const plantingStatusEnum = pgEnum('planting_status', ['planned', 'planted', 'growing', 'harvested', 'completed'])
export const harvestStatusEnum = pgEnum('harvest_status', ['pending', 'in_progress', 'completed', 'cancelled'])

// Users table
export const users = pgTable('users', {
  id: uuid('id').primaryKey().defaultRandom(),
  name: text('name'),
  email: text('email').unique().notNull(),
  phone: text('phone'),
  created_at: timestamp('created_at').defaultNow(),
  updated_at: timestamp('updated_at').defaultNow()
})

// Categories table
export const categories = pgTable('categories', {
  id: uuid('id').primaryKey().defaultRandom(),
  name: text('name').notNull(),
  image: text('image'),
  created_at: timestamp('created_at').defaultNow(),
  updated_at: timestamp('updated_at').defaultNow()
})

// Subcategories table
export const subcategories = pgTable('subcategories', {
  id: uuid('id').primaryKey().defaultRandom(),
  category_id: uuid('category_id').references(() => categories.id),
  name: text('name').notNull(),
  image: text('image'),
  created_at: timestamp('created_at').defaultNow(),
  updated_at: timestamp('updated_at').defaultNow()
})

// Varieties table
export const varieties = pgTable('varieties', {
  id: uuid('id').primaryKey().defaultRandom(),
  subcategory_id: uuid('subcategory_id').references(() => subcategories.id),
  name: text('name').notNull(),
  emoji: text('emoji'),
  description: text('description'),
  card_image: text('card_image'),
  nutritional_info: jsonb('nutritional_info'),
  taste_profile: jsonb('taste_profile'),
  culinary_uses: text('culinary_uses').array(),
  created_at: timestamp('created_at').defaultNow(),
  updated_at: timestamp('updated_at').defaultNow()
})

// Cultivars table (specific varieties/cultivars of base varieties)
export const cultivars = pgTable('cultivars', {
  id: uuid('id').primaryKey().defaultRandom(),
  variety_id: uuid('variety_id').references(() => varieties.id),
  name: text('name').notNull(),
  common_name: text('common_name'),
  description: text('description'),
  characteristics: text('characteristics'),
  growing_notes: text('growing_notes'),
  botanical_name: text('botanical_name'),
  days_to_maturity: integer('days_to_maturity'),
  plant_spacing: text('plant_spacing'),
  seed_depth: text('seed_depth'),
  germination_days: text('germination_days'),
  sun_requirements: text('sun_requirements'),
  frost_hardy: boolean('frost_hardy').default(false),
  image_url: text('image_url'),
  source_url: text('source_url'),
  created_at: timestamp('created_at').defaultNow(),
  updated_at: timestamp('updated_at').defaultNow()
})

// Farms table
export const farms = pgTable('farms', {
  id: uuid('id').primaryKey().defaultRandom(),
  name: text('name').notNull(),
  description: text('description'),
  logo: text('logo'),
  cover_image: text('cover_image'),
  owner_name: text('owner_name'),
  email: text('email').notNull(),
  phone: text('phone'),
  website: text('website'),
  address: text('address'),
  location_coordinates: jsonb('location_coordinates'),
  rating: decimal('rating', { precision: 3, scale: 2 }).default('0'),
  certifications: text('certifications').array(),
  specialties: text('specialties').array(),
  delivery_zones: text('delivery_zones').array(),
  owner_id: uuid('owner_id').references(() => users.id),
  created_at: timestamp('created_at').defaultNow(),
  updated_at: timestamp('updated_at').defaultNow()
})

// Products table
export const products = pgTable('products', {
  id: uuid('id').primaryKey().defaultRandom(),
  farm_id: uuid('farm_id').references(() => farms.id),
  variety_id: uuid('variety_id').references(() => varieties.id),
  cultivar_id: uuid('cultivar_id').references(() => cultivars.id),
  name: text('name').notNull(),
  cultivar_name: text('cultivar_name'), // Denormalized for easier queries
  price: decimal('price', { precision: 10, scale: 2 }).notNull(),
  stock: integer('stock').default(0),
  freshness: integer('freshness'),
  harvest_date: timestamp('harvest_date'),
  pre_harvest: boolean('pre_harvest').default(false),
  organic: boolean('organic').default(false),
  in_season: boolean('in_season').default(true),
  delivery_days: text('delivery_days').array(),
  images: text('images').array(),
  created_at: timestamp('created_at').defaultNow(),
  updated_at: timestamp('updated_at').defaultNow()
})

// Orders table
export const orders = pgTable('orders', {
  id: uuid('id').primaryKey().defaultRandom(),
  user_id: uuid('user_id').references(() => users.id),
  farm_id: uuid('farm_id').references(() => farms.id),
  total_amount: decimal('total_amount', { precision: 10, scale: 2 }).notNull(),
  status: orderStatusEnum('status').default('pending'),
  delivery_address: text('delivery_address'),
  delivery_date: timestamp('delivery_date'),
  notes: text('notes'),
  created_at: timestamp('created_at').defaultNow(),
  updated_at: timestamp('updated_at').defaultNow()
})

// Order Items table
export const order_items = pgTable('order_items', {
  id: uuid('id').primaryKey().defaultRandom(),
  order_id: uuid('order_id').references(() => orders.id),
  product_id: uuid('product_id').references(() => products.id),
  quantity: integer('quantity').notNull(),
  price_per_unit: decimal('price_per_unit', { precision: 10, scale: 2 }).notNull(),
  total_price: decimal('total_price', { precision: 10, scale: 2 }).notNull(),
  created_at: timestamp('created_at').defaultNow(),
  updated_at: timestamp('updated_at').defaultNow()
})

// Export all tables for use in queries
export const schema = {
  users,
  categories,
  subcategories,
  varieties,
  cultivars,
  farms,
  products,
  orders,
  order_items
}
