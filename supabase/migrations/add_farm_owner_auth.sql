-- Migration to add farm owner authentication
-- Run this in Supabase SQL Editor after the initial schema

-- Add owner_id to farms table to link to Supabase Auth users
ALTER TABLE farms ADD COLUMN owner_id UUID REFERENCES auth.users(id);

-- Create index for performance
CREATE INDEX idx_farms_owner_id ON farms(owner_id);

-- Update RLS policies for farms to only show farms owned by the authenticated user
DROP POLICY IF EXISTS "Allow public read access" ON farms;
DROP POLICY IF EXISTS "Service role has full access" ON farms;

-- Farms: Users can only see their own farms
CREATE POLICY "Users can view their own farms" ON farms 
    FOR SELECT USING (auth.uid() = owner_id);

-- Farms: Users can update their own farms  
CREATE POLICY "Users can update their own farms" ON farms 
    FOR UPDATE USING (auth.uid() = owner_id);

-- Farms: Users can insert farms (for farm creation)
CREATE POLICY "Users can create farms" ON farms 
    FOR INSERT WITH CHECK (auth.uid() = owner_id);

-- Service role still has full access
CREATE POLICY "Service role has full access on farms" ON farms 
    FOR ALL USING (auth.role() = 'service_role');

-- Update RLS policies for products to only show products from user's farm
DROP POLICY IF EXISTS "Allow public read access" ON products;
DROP POLICY IF EXISTS "Service role has full access" ON products;

-- Products: Users can only see products from their own farms
CREATE POLICY "Users can view their farm products" ON products 
    FOR SELECT USING (
        EXISTS (
            SELECT 1 FROM farms 
            WHERE farms.id = products.farm_id 
            AND farms.owner_id = auth.uid()
        )
    );

-- Products: Users can manage products from their own farms
CREATE POLICY "Users can manage their farm products" ON products 
    FOR ALL USING (
        EXISTS (
            SELECT 1 FROM farms 
            WHERE farms.id = products.farm_id 
            AND farms.owner_id = auth.uid()
        )
    );

-- Service role still has full access
CREATE POLICY "Service role has full access on products" ON products 
    FOR ALL USING (auth.role() = 'service_role');

-- Update orders policies similarly
DROP POLICY IF EXISTS "Service role has full access" ON orders;

-- Orders: Farmers can see orders for their farms
CREATE POLICY "Farmers can view their farm orders" ON orders 
    FOR SELECT USING (
        EXISTS (
            SELECT 1 FROM farms 
            WHERE farms.id = orders.farm_id 
            AND farms.owner_id = auth.uid()
        )
    );

-- Orders: Farmers can update orders for their farms
CREATE POLICY "Farmers can manage their farm orders" ON orders 
    FOR UPDATE USING (
        EXISTS (
            SELECT 1 FROM farms 
            WHERE farms.id = orders.farm_id 
            AND farms.owner_id = auth.uid()
        )
    );

-- Service role still has full access
CREATE POLICY "Service role has full access on orders" ON orders 
    FOR ALL USING (auth.role() = 'service_role');

-- Add policies for public access (for the iPhone consumer app)
-- Categories, subcategories, varieties - public read access for consumer app
CREATE POLICY "Public read access for consumer app" ON categories FOR SELECT USING (true);
CREATE POLICY "Public read access for consumer app" ON subcategories FOR SELECT USING (true);
CREATE POLICY "Public read access for consumer app" ON varieties FOR SELECT USING (true);

-- Farms - public read access for consumer app (to show farm info)
CREATE POLICY "Public read access for consumer app" ON farms FOR SELECT USING (true);

-- Products - public read access for consumer app (to browse products)
CREATE POLICY "Public read access for consumer app" ON products FOR SELECT USING (true);
