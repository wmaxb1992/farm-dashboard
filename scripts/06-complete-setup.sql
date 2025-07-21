-- Complete setup script for Supabase database
-- Run this script in your Supabase SQL Editor to create all required tables

-- Step 1: Run the original schema first (if not already done)
-- Then run this script to add the farm management tables

-- Check if the main tables exist, if not create them
DO $$
BEGIN
    -- Create categories table if it doesn't exist
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'categories') THEN
        CREATE TABLE categories (
            id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
            name VARCHAR(255) NOT NULL,
            image TEXT,
            created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
            updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
        );
    END IF;

    -- Create subcategories table if it doesn't exist
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'subcategories') THEN
        CREATE TABLE subcategories (
            id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
            category_id UUID REFERENCES categories(id) ON DELETE CASCADE,
            name VARCHAR(255) NOT NULL,
            image TEXT,
            created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
            updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
        );
    END IF;

    -- Create varieties table if it doesn't exist
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'varieties') THEN
        CREATE TABLE varieties (
            id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
            subcategory_id UUID REFERENCES subcategories(id) ON DELETE CASCADE,
            name VARCHAR(255) NOT NULL,
            emoji VARCHAR(10),
            description TEXT,
            card_image TEXT,
            nutritional_info JSONB,
            taste_profile JSONB,
            culinary_uses TEXT[],
            created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
            updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
        );
    END IF;

    -- Create farms table if it doesn't exist
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'farms') THEN
        CREATE TABLE farms (
            id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
            name VARCHAR(255) NOT NULL,
            description TEXT,
            logo TEXT,
            cover_image TEXT,
            owner_name VARCHAR(255),
            email VARCHAR(255) UNIQUE NOT NULL,
            phone VARCHAR(50),
            website VARCHAR(255),
            address TEXT,
            location_coordinates POINT,
            rating DECIMAL(3,2) DEFAULT 0,
            certifications TEXT[],
            specialties TEXT[],
            delivery_zones TEXT[],
            created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
            updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
        );
    END IF;

    -- Create users table if it doesn't exist
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'users') THEN
        CREATE TABLE users (
            id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
            name VARCHAR(255) NOT NULL,
            email VARCHAR(255) UNIQUE NOT NULL,
            phone VARCHAR(50),
            created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
            updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
        );
    END IF;

    -- Create products table if it doesn't exist
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'products') THEN
        CREATE TABLE products (
            id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
            name VARCHAR(255) NOT NULL,
            farm_id UUID REFERENCES farms(id) ON DELETE CASCADE,
            variety_id UUID REFERENCES varieties(id),
            price DECIMAL(10,2) NOT NULL,
            stock INTEGER DEFAULT 0,
            freshness INTEGER CHECK (freshness >= 0 AND freshness <= 100),
            harvest_date DATE,
            pre_harvest BOOLEAN DEFAULT FALSE,
            organic BOOLEAN DEFAULT FALSE,
            in_season BOOLEAN DEFAULT TRUE,
            delivery_days TEXT[],
            images TEXT[],
            created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
            updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
        );
    END IF;

    -- Create orders table if it doesn't exist
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'orders') THEN
        CREATE TABLE orders (
            id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
            order_number VARCHAR(50) UNIQUE NOT NULL,
            user_id UUID REFERENCES users(id),
            farm_id UUID REFERENCES farms(id),
            status VARCHAR(50) DEFAULT 'pending' CHECK (status IN ('pending', 'confirmed', 'preparing', 'delivered', 'cancelled')),
            subtotal DECIMAL(10,2) NOT NULL,
            tax DECIMAL(10,2) DEFAULT 0,
            delivery_fee DECIMAL(10,2) DEFAULT 0,
            total DECIMAL(10,2) NOT NULL,
            delivery_address JSONB,
            delivery_date DATE,
            notes TEXT,
            created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
            updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
        );
    END IF;

    -- Create order_items table if it doesn't exist
    IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'order_items') THEN
        CREATE TABLE order_items (
            id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
            order_id UUID REFERENCES orders(id) ON DELETE CASCADE,
            product_id UUID REFERENCES products(id),
            quantity INTEGER NOT NULL,
            unit_price DECIMAL(10,2) NOT NULL,
            total_price DECIMAL(10,2) NOT NULL,
            created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
        );
    END IF;
END $$;

-- Now create the farm management tables
CREATE TABLE IF NOT EXISTS farm_plantings (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    farm_id UUID REFERENCES farms(id) ON DELETE CASCADE,
    variety_id UUID REFERENCES varieties(id) ON DELETE SET NULL,
    farm_variety_name VARCHAR(255),
    planting_location VARCHAR(255),
    planting_date DATE NOT NULL,
    first_harvest_date DATE,
    total_estimated_yield DECIMAL(10,2),
    estimated_remaining_yield DECIMAL(10,2),
    estimated_yield_per_harvest DECIMAL(10,2),
    harvest_frequency_days INTEGER DEFAULT 7,
    next_projected_harvest_date DATE,
    next_projected_quantity DECIMAL(10,2),
    crop_status VARCHAR(50) DEFAULT 'planted' CHECK (crop_status IN ('planted', 'growing', 'producing', 'finished')),
    growing_method VARCHAR(100),
    planted_quantity INTEGER,
    planted_area DECIMAL(10,2),
    planted_area_unit VARCHAR(20) DEFAULT 'sq_ft',
    organic BOOLEAN DEFAULT FALSE,
    notes TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS harvests (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    planting_id UUID REFERENCES farm_plantings(id) ON DELETE CASCADE,
    farm_id UUID REFERENCES farms(id) ON DELETE CASCADE,
    variety_id UUID REFERENCES varieties(id) ON DELETE SET NULL,
    harvest_date DATE NOT NULL,
    quantity_harvested DECIMAL(10,2) NOT NULL,
    quality_grade VARCHAR(10) DEFAULT 'A' CHECK (quality_grade IN ('A', 'B', 'C')),
    notes TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS inventory_batches (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    farm_id UUID REFERENCES farms(id) ON DELETE CASCADE,
    variety_id UUID REFERENCES varieties(id) ON DELETE SET NULL,
    harvest_id UUID REFERENCES harvests(id) ON DELETE SET NULL,
    batch_number VARCHAR(100) UNIQUE NOT NULL,
    harvest_date DATE NOT NULL,
    quantity_harvested DECIMAL(10,2) NOT NULL,
    quantity_available DECIMAL(10,2) NOT NULL,
    quality_grade VARCHAR(10) DEFAULT 'A',
    status VARCHAR(50) DEFAULT 'fresh' CHECK (status IN ('fresh', 'aging', 'ready', 'sold', 'expired')),
    organic BOOLEAN DEFAULT FALSE,
    notes TEXT,
    expiry_date DATE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Create indexes
CREATE INDEX IF NOT EXISTS idx_products_farm_id ON products(farm_id);
CREATE INDEX IF NOT EXISTS idx_products_variety_id ON products(variety_id);
CREATE INDEX IF NOT EXISTS idx_subcategories_category_id ON subcategories(category_id);
CREATE INDEX IF NOT EXISTS idx_varieties_subcategory_id ON varieties(subcategory_id);
CREATE INDEX IF NOT EXISTS idx_farm_plantings_farm_id ON farm_plantings(farm_id);
CREATE INDEX IF NOT EXISTS idx_farm_plantings_variety_id ON farm_plantings(variety_id);
CREATE INDEX IF NOT EXISTS idx_harvests_planting_id ON harvests(planting_id);
CREATE INDEX IF NOT EXISTS idx_harvests_farm_id ON harvests(farm_id);
CREATE INDEX IF NOT EXISTS idx_inventory_batches_farm_id ON inventory_batches(farm_id);
CREATE INDEX IF NOT EXISTS idx_inventory_batches_harvest_id ON inventory_batches(harvest_id);

-- Insert basic test data
INSERT INTO categories (id, name) VALUES 
    ('00000000-0000-0000-0000-000000000001', 'Vegetables'),
    ('00000000-0000-0000-0000-000000000002', 'Fruits'),
    ('00000000-0000-0000-0000-000000000003', 'Herbs')
ON CONFLICT (id) DO NOTHING;

INSERT INTO subcategories (id, category_id, name) VALUES 
    ('00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000001', 'Leafy Greens'),
    ('00000000-0000-0000-0000-000000000002', '00000000-0000-0000-0000-000000000001', 'Root Vegetables'),
    ('00000000-0000-0000-0000-000000000003', '00000000-0000-0000-0000-000000000002', 'Stone Fruits'),
    ('00000000-0000-0000-0000-000000000004', '00000000-0000-0000-0000-000000000003', 'Culinary Herbs')
ON CONFLICT (id) DO NOTHING;

INSERT INTO varieties (id, subcategory_id, name, emoji) VALUES 
    ('00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000001', 'Butter Lettuce', '🥬'),
    ('00000000-0000-0000-0000-000000000002', '00000000-0000-0000-0000-000000000001', 'Spinach', '🥬'),
    ('00000000-0000-0000-0000-000000000003', '00000000-0000-0000-0000-000000000002', 'Carrots', '🥕'),
    ('00000000-0000-0000-0000-000000000004', '00000000-0000-0000-0000-000000000003', 'Peaches', '🍑'),
    ('00000000-0000-0000-0000-000000000005', '00000000-0000-0000-0000-000000000004', 'Basil', '🌿')
ON CONFLICT (id) DO NOTHING;

INSERT INTO farms (id, name, email, description) VALUES 
    ('00000000-0000-0000-0000-000000000001', 'Sunny Acres Farm', 'contact@sunnyacres.com', 'Organic farm specializing in fresh vegetables and herbs')
ON CONFLICT (email) DO NOTHING;

-- Create some test products
INSERT INTO products (id, name, farm_id, variety_id, price, stock) VALUES 
    ('00000000-0000-0000-0000-000000000001', 'Fresh Butter Lettuce', '00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000001', 3.50, 20),
    ('00000000-0000-0000-0000-000000000002', 'Organic Spinach', '00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000002', 4.00, 15),
    ('00000000-0000-0000-0000-000000000003', 'Garden Carrots', '00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000003', 2.75, 30),
    ('00000000-0000-0000-0000-000000000004', 'Sweet Basil', '00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000005', 5.00, 10)
ON CONFLICT (id) DO NOTHING;
