-- Simple cultivar table creation
CREATE TABLE IF NOT EXISTS cultivars (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    variety_id UUID REFERENCES varieties(id) ON DELETE CASCADE,
    name VARCHAR(255) NOT NULL,
    common_name VARCHAR(255),
    description TEXT,
    characteristics TEXT,
    growing_notes TEXT,
    botanical_name VARCHAR(255),
    days_to_maturity INTEGER,
    plant_spacing VARCHAR(50),
    seed_depth VARCHAR(50),
    germination_days VARCHAR(50),
    sun_requirements VARCHAR(100),
    frost_hardy BOOLEAN DEFAULT FALSE,
    image_url TEXT,
    source_url TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    
    -- Ensure unique cultivar names per variety
    UNIQUE(variety_id, name)
);

-- Add cultivar support to products table
ALTER TABLE products 
ADD COLUMN IF NOT EXISTS cultivar_id UUID REFERENCES cultivars(id),
ADD COLUMN IF NOT EXISTS cultivar_name VARCHAR(255);

-- Create indexes for performance
CREATE INDEX IF NOT EXISTS idx_cultivars_variety_id ON cultivars(variety_id);
CREATE INDEX IF NOT EXISTS idx_cultivars_name ON cultivars(name);
CREATE INDEX IF NOT EXISTS idx_products_cultivar_id ON products(cultivar_id);
