-- Complete database migration for cultivar support
-- This script will:
-- 1. Create the cultivar table
-- 2. Add missing varieties 
-- 3. Convert some existing varieties to cultivars
-- 4. Add Baker Creek data

BEGIN;

-- Step 1: Create cultivars table
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

-- Step 2: Add cultivar support to products table
ALTER TABLE products 
ADD COLUMN IF NOT EXISTS cultivar_id UUID REFERENCES cultivars(id),
ADD COLUMN IF NOT EXISTS cultivar_name VARCHAR(255);

-- Step 3: Create indexes for performance
CREATE INDEX IF NOT EXISTS idx_cultivars_variety_id ON cultivars(variety_id);
CREATE INDEX IF NOT EXISTS idx_cultivars_name ON cultivars(name);
CREATE INDEX IF NOT EXISTS idx_products_cultivar_id ON products(cultivar_id);

-- Step 4: Add missing base varieties that we need
INSERT INTO varieties (id, subcategory_id, name, emoji, description) 
SELECT 
    'variety-artichoke-001',
    sc.id,
    'Artichoke',
    '🌰',
    'Edible flower buds of the artichoke plant'
FROM subcategories sc
JOIN categories c ON sc.category_id = c.id
WHERE c.name = 'Vegetables' AND sc.name = 'Brassicas'
ON CONFLICT (id) DO NOTHING;

INSERT INTO varieties (id, subcategory_id, name, emoji, description) 
SELECT 
    'variety-tomato-001',
    sc.id,
    'Tomato',
    '🍅',
    'Popular fruit vegetable in many cuisines'
FROM subcategories sc
JOIN categories c ON sc.category_id = c.id
WHERE c.name = 'Vegetables' AND sc.name = 'Solanaceae'
ON CONFLICT (id) DO NOTHING;

-- Step 5: Convert existing "Sweet Basil" to a cultivar of "Basil"
-- First, get the base basil variety ID
DO $$
DECLARE
    basil_variety_id UUID;
    sweet_basil_variety_id UUID;
BEGIN
    -- Get the base basil variety
    SELECT id INTO basil_variety_id FROM varieties WHERE name = 'Basil' LIMIT 1;
    
    -- Get the sweet basil variety
    SELECT id INTO sweet_basil_variety_id FROM varieties WHERE name = 'Sweet Basil' LIMIT 1;
    
    -- If both exist, convert Sweet Basil to a cultivar
    IF basil_variety_id IS NOT NULL AND sweet_basil_variety_id IS NOT NULL THEN
        -- Insert Sweet Basil as a cultivar
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
            frost_hardy
        ) VALUES (
            basil_variety_id,
            'Sweet Basil',
            'Genovese Basil',
            'Classic Italian basil with sweet, aromatic flavor',
            'Large, bright green leaves; sweet, aromatic flavor',
            'Excellent for pesto. Pinch flowers to maintain leaf production.',
            'Ocimum basilicum',
            75,
            '6-12"',
            '1/4"',
            '7-14 days',
            'Full Sun',
            false
        ) ON CONFLICT (variety_id, name) DO NOTHING;
        
        -- Update any products that reference the old Sweet Basil variety
        UPDATE products 
        SET cultivar_id = (SELECT id FROM cultivars WHERE variety_id = basil_variety_id AND name = 'Sweet Basil'),
            cultivar_name = 'Sweet Basil',
            variety_id = basil_variety_id
        WHERE variety_id = sweet_basil_variety_id;
    END IF;
END $$;

-- Step 6: Add Baker Creek cultivar data
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
) VALUES 
-- Green Globe Artichoke (use the variety we just created)
(
    'variety-artichoke-001',
    'Green Globe',
    'Globe Artichoke',
    'Tasty! Needs a fairly long, mild growing season, or can be grown as an annual. This colorful plant makes a great ornamental.',
    'Large, globe-shaped heads; can be grown as annual or perennial',
    'Needs fairly long, mild growing season. Can be grown as annual. Makes great ornamental plant.',
    'Cynara cardunculus var. scolymus',
    120,
    '18"',
    '1/4" to 1/2"',
    '10-21 days',
    'Full Sun',
    true,
    'https://www.rareseeds.com/media/catalog/product/cache/5667e39955f7b47720c7610bf376471d/a/r/artichoke-green-globe-lss-dsc_8174.jpg',
    'https://www.rareseeds.com/artichoke-green-globe'
),

-- Thai Basil (use the existing basil variety)
(
    (SELECT id FROM varieties WHERE name = 'Basil' LIMIT 1),
    'Thai Basil',
    'Thai Sweet Basil',
    'Spicy, licorice-flavored basil used in Asian cuisine',
    'Purple stems; spicy, anise-like flavor; small leaves',
    'Heat-loving. Excellent for stir-fries and Asian dishes.',
    'Ocimum basilicum var. thyrsiflora',
    85,
    '8-12"',
    '1/4"',
    '7-14 days',
    'Full Sun',
    false,
    NULL,
    'https://www.rareseeds.com/basil-thai'
),

-- Cherokee Purple Tomato
(
    'variety-tomato-001',
    'Cherokee Purple',
    'Cherokee Purple Tomato',
    'Heirloom beefsteak tomato with deep purple shoulders and rich flavor',
    'Large, beefsteak type; purple shoulders; excellent flavor',
    'Indeterminate variety. Needs support. Excellent for fresh eating.',
    'Solanum lycopersicum',
    80,
    '24-36"',
    '1/4"',
    '7-14 days',
    'Full Sun',
    false,
    NULL,
    'https://www.rareseeds.com/tomato-cherokee-purple'
),

-- Black Krim Tomato
(
    'variety-tomato-001',
    'Black Krim',
    'Black Krim Tomato',
    'Russian heirloom with dark purple-black shoulders and rich, smoky flavor',
    'Medium-large, dark purple-black shoulders; rich, complex flavor',
    'Indeterminate. Excellent for slicing. Unique appearance.',
    'Solanum lycopersicum',
    85,
    '24-36"',
    '1/4"',
    '7-14 days',
    'Full Sun',
    false,
    NULL,
    'https://www.rareseeds.com/tomato-black-krim'
)
ON CONFLICT (variety_id, name) DO NOTHING;

COMMIT;
