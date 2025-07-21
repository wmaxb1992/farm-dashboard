-- Migration script to add cultivar support to existing database
-- This adds a new cultivars table and updates the products table

BEGIN;

-- Step 1: Create cultivars table
CREATE TABLE cultivars (
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

-- Step 2: Add cultivar support to products table
ALTER TABLE products 
ADD COLUMN cultivar_id UUID REFERENCES cultivars(id),
ADD COLUMN cultivar_name VARCHAR(255); -- Denormalized for easier queries

-- Step 3: Create indexes for performance
CREATE INDEX idx_cultivars_variety_id ON cultivars(variety_id);
CREATE INDEX idx_cultivars_name ON cultivars(name);
CREATE INDEX idx_products_cultivar_id ON products(cultivar_id);

-- Step 4: Update existing products to work with new structure
-- For now, we'll keep the existing variety_id references
-- Later we can migrate specific varieties to cultivars

COMMIT;

-- Example data based on Baker Creek Artichoke Green Globe
INSERT INTO cultivars (
    variety_id, 
    name, 
    common_name,
    description,
    characteristics,
    growing_notes,
    botanical_name,
    days_to_maturity,
    plant_spacing,
    seed_depth,
    germination_days,
    sun_requirements,
    frost_hardy,
    image_url,
    source_url
) VALUES (
    (SELECT id FROM varieties WHERE name = 'Artichoke' LIMIT 1),
    'Green Globe',
    'Globe Artichoke',
    'Tasty! Needs a fairly long, mild growing season, or can be grown as an annual. This colorful plant makes a great ornamental.',
    'Large, globe-shaped heads; can be grown as annual or perennial',
    'Needs fairly long, mild growing season. Can be grown as annual. Makes great ornamental plant.',
    'Cynara cardunculus var. scolymus',
    120,
    '18 inches',
    '1/4" to 1/2"',
    '10-21 days',
    'Full Sun',
    true,
    'https://www.rareseeds.com/media/catalog/product/cache/5667e39955f7b47720c7610bf376471d/a/r/artichoke-green-globe-lss-dsc_8174.jpg',
    'https://www.rareseeds.com/artichoke-green-globe'
);
