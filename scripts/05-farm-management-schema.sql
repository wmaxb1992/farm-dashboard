-- Farm Management Schema
-- This script creates the additional tables needed for farm plantings, harvests, and inventory

-- Farm plantings table (crops currently being grown)
CREATE TABLE IF NOT EXISTS farm_plantings (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    farm_id UUID REFERENCES farms(id) ON DELETE CASCADE,
    variety_id UUID REFERENCES varieties(id) ON DELETE SET NULL,
    farm_variety_name VARCHAR(255), -- Custom name for the variety at this farm
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
    growing_method VARCHAR(100), -- e.g., 'greenhouse', 'outdoor', 'hydroponic'
    planted_quantity INTEGER,
    planted_area DECIMAL(10,2),
    planted_area_unit VARCHAR(20) DEFAULT 'sq_ft',
    organic BOOLEAN DEFAULT FALSE,
    notes TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Harvests table (individual harvest records)
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

-- Inventory batches table (groups of harvested products)
CREATE TABLE IF NOT EXISTS inventory_batches (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    farm_id UUID REFERENCES farms(id) ON DELETE CASCADE,
    variety_id UUID REFERENCES varieties(id) ON DELETE SET NULL,
    harvest_id UUID REFERENCES harvests(id) ON DELETE SET NULL,
    batch_number VARCHAR(100) UNIQUE NOT NULL,
    harvest_date DATE NOT NULL,
    quantity_harvested DECIMAL(10,2) NOT NULL,
    quantity_available DECIMAL(10,2) NOT NULL, -- Remaining after sales
    quality_grade VARCHAR(10) DEFAULT 'A',
    status VARCHAR(50) DEFAULT 'fresh' CHECK (status IN ('fresh', 'aging', 'ready', 'sold', 'expired')),
    organic BOOLEAN DEFAULT FALSE,
    notes TEXT,
    expiry_date DATE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Batch sales tracking (when batches are sold)
CREATE TABLE IF NOT EXISTS batch_sales (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    batch_id UUID REFERENCES inventory_batches(id) ON DELETE CASCADE,
    order_id UUID REFERENCES orders(id) ON DELETE SET NULL,
    quantity_sold DECIMAL(10,2) NOT NULL,
    sale_price DECIMAL(10,2) NOT NULL,
    sale_date DATE DEFAULT CURRENT_DATE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Create indexes for better performance
CREATE INDEX IF NOT EXISTS idx_farm_plantings_farm_id ON farm_plantings(farm_id);
CREATE INDEX IF NOT EXISTS idx_farm_plantings_variety_id ON farm_plantings(variety_id);
CREATE INDEX IF NOT EXISTS idx_farm_plantings_status ON farm_plantings(crop_status);
CREATE INDEX IF NOT EXISTS idx_farm_plantings_planting_date ON farm_plantings(planting_date);

CREATE INDEX IF NOT EXISTS idx_harvests_planting_id ON harvests(planting_id);
CREATE INDEX IF NOT EXISTS idx_harvests_farm_id ON harvests(farm_id);
CREATE INDEX IF NOT EXISTS idx_harvests_harvest_date ON harvests(harvest_date);

CREATE INDEX IF NOT EXISTS idx_inventory_batches_farm_id ON inventory_batches(farm_id);
CREATE INDEX IF NOT EXISTS idx_inventory_batches_harvest_id ON inventory_batches(harvest_id);
CREATE INDEX IF NOT EXISTS idx_inventory_batches_status ON inventory_batches(status);
CREATE INDEX IF NOT EXISTS idx_inventory_batches_harvest_date ON inventory_batches(harvest_date);

CREATE INDEX IF NOT EXISTS idx_batch_sales_batch_id ON batch_sales(batch_id);
CREATE INDEX IF NOT EXISTS idx_batch_sales_order_id ON batch_sales(order_id);

-- Add triggers to update updated_at timestamps
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ language 'plpgsql';

-- Only create triggers if they don't exist
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_trigger WHERE tgname = 'update_farm_plantings_updated_at') THEN
        CREATE TRIGGER update_farm_plantings_updated_at 
            BEFORE UPDATE ON farm_plantings 
            FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
    END IF;
    
    IF NOT EXISTS (SELECT 1 FROM pg_trigger WHERE tgname = 'update_inventory_batches_updated_at') THEN
        CREATE TRIGGER update_inventory_batches_updated_at 
            BEFORE UPDATE ON inventory_batches 
            FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
    END IF;
END $$;

-- Sample data to test with (optional)
-- Uncomment if you want to add test data

/*
-- Insert a test farm if it doesn't exist
INSERT INTO farms (id, name, email, description) 
VALUES (
    '00000000-0000-0000-0000-000000000001',
    'Test Farm',
    'test@farm.com',
    'A test farm for development'
) ON CONFLICT (email) DO NOTHING;

-- Insert test varieties if they don't exist
INSERT INTO categories (id, name) 
VALUES ('00000000-0000-0000-0000-000000000001', 'Vegetables')
ON CONFLICT DO NOTHING;

INSERT INTO subcategories (id, category_id, name)
VALUES ('00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000001', 'Leafy Greens')
ON CONFLICT DO NOTHING;

INSERT INTO varieties (id, subcategory_id, name, emoji)
VALUES ('00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000001', 'Lettuce', '🥬')
ON CONFLICT DO NOTHING;
*/
