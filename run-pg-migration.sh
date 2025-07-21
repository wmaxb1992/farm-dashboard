#!/bin/bash

# Direct PostgreSQL migration script
echo "🚀 Running direct PostgreSQL migration..."

# Get credentials from .env.local
source .env.local

# Extract project reference from URL
PROJECT_REF=$(echo $NEXT_PUBLIC_SUPABASE_URL | sed 's/https:\/\///' | sed 's/\.supabase\.co//')

# Create the PostgreSQL connection string
PG_URL="postgresql://postgres.${PROJECT_REF}:${SUPABASE_SERVICE_ROLE_KEY}@aws-0-us-west-1.pooler.supabase.com:6543/postgres"

echo "📝 Running migration SQL..."

# Run the migration
psql "$PG_URL" << 'EOF'
-- Add owner_id column to farms table
ALTER TABLE farms ADD COLUMN IF NOT EXISTS owner_id UUID REFERENCES auth.users(id);

-- Create index for performance
CREATE INDEX IF NOT EXISTS idx_farms_owner_id ON farms(owner_id);

-- Verify the column was added
\d+ farms

-- Check current farms data
SELECT id, name, owner_name, owner_id FROM farms LIMIT 3;

-- Drop existing policies (some may not exist - that's OK)
DROP POLICY IF EXISTS "Allow public read access" ON farms;
DROP POLICY IF EXISTS "Service role has full access" ON farms;
DROP POLICY IF EXISTS "Allow public read access" ON products;
DROP POLICY IF EXISTS "Service role has full access" ON products;
DROP POLICY IF EXISTS "Service role has full access" ON orders;

-- Create new farm policies
CREATE POLICY "Users can view their own farms" ON farms 
    FOR SELECT USING (auth.uid() = owner_id);

CREATE POLICY "Users can update their own farms" ON farms 
    FOR UPDATE USING (auth.uid() = owner_id);

CREATE POLICY "Users can create farms" ON farms 
    FOR INSERT WITH CHECK (auth.uid() = owner_id);

CREATE POLICY "Service role has full access on farms" ON farms 
    FOR ALL USING (auth.role() = 'service_role');

-- Create new product policies
CREATE POLICY "Users can view their farm products" ON products 
    FOR SELECT USING (
        EXISTS (
            SELECT 1 FROM farms 
            WHERE farms.id = products.farm_id 
            AND farms.owner_id = auth.uid()
        )
    );

CREATE POLICY "Users can manage their farm products" ON products 
    FOR ALL USING (
        EXISTS (
            SELECT 1 FROM farms 
            WHERE farms.id = products.farm_id 
            AND farms.owner_id = auth.uid()
        )
    );

CREATE POLICY "Service role has full access on products" ON products 
    FOR ALL USING (auth.role() = 'service_role');

-- Create new order policies
CREATE POLICY "Farmers can view their farm orders" ON orders 
    FOR SELECT USING (
        EXISTS (
            SELECT 1 FROM farms 
            WHERE farms.id = orders.farm_id 
            AND farms.owner_id = auth.uid()
        )
    );

CREATE POLICY "Farmers can manage their farm orders" ON orders 
    FOR UPDATE USING (
        EXISTS (
            SELECT 1 FROM farms 
            WHERE farms.id = orders.farm_id 
            AND farms.owner_id = auth.uid()
        )
    );

CREATE POLICY "Service role has full access on orders" ON orders 
    FOR ALL USING (auth.role() = 'service_role');

-- Create public access policies for consumer app
CREATE POLICY "Public read access for consumer app" ON categories FOR SELECT USING (true);
CREATE POLICY "Public read access for consumer app" ON subcategories FOR SELECT USING (true);
CREATE POLICY "Public read access for consumer app" ON varieties FOR SELECT USING (true);
CREATE POLICY "Public read access for consumer app" ON farms FOR SELECT USING (true);
CREATE POLICY "Public read access for consumer app" ON products FOR SELECT USING (true);

-- Verify policies were created
SELECT schemaname, tablename, policyname, cmd 
FROM pg_policies 
WHERE tablename IN ('farms', 'products', 'orders') 
ORDER BY tablename, policyname;

\echo '✅ Migration completed!'
EOF

echo "🎉 PostgreSQL migration finished!"
echo "📋 Testing API endpoints..."

# Test the endpoints
curl -s http://localhost:3000/api/user-farm-status | jq '.'
