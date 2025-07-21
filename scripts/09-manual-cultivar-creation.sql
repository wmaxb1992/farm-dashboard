-- Manual execution steps for cultivars table creation
-- These commands should be run in the Supabase SQL editor

-- Step 1: Create the cultivars table
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

-- Step 4: Insert sample cultivar data
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
    source_url
) VALUES 
-- Basil cultivars (using the existing Basil variety)
(
    '00000000-0000-0000-0000-000000000005', -- Basil variety ID
    'Genovese',
    'Genovese Basil',
    'Classic Italian basil with large, aromatic leaves perfect for pesto',
    'Large, bright green leaves; sweet, aromatic flavor',
    'Excellent for pesto. Pinch flowers to maintain leaf production.',
    'Ocimum basilicum',
    75,
    '6-12"',
    '1/4"',
    '7-14 days',
    'Full Sun',
    false,
    'https://www.rareseeds.com/basil-genovese'
),

(
    '00000000-0000-0000-0000-000000000005', -- Basil variety ID
    'Thai',
    'Thai Basil',
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
    'https://www.rareseeds.com/basil-thai'
),

(
    '00000000-0000-0000-0000-000000000005', -- Basil variety ID
    'Holy Basil',
    'Sacred Basil',
    'Sacred herb in Hindu tradition, also known as Tulsi',
    'Small, aromatic leaves; spiritual significance; medicinal properties',
    'Revered in Hindu tradition. Excellent for teas and spiritual practices.',
    'Ocimum tenuiflorum',
    90,
    '8-12"',
    '1/4"',
    '10-14 days',
    'Full Sun',
    false,
    'https://www.rareseeds.com/basil-holy'
),

-- Cherry Tomato cultivars (using the existing Cherry Tomatoes variety)
(
    '4f47b5f4-a23a-4c2e-bc4c-3b2e3fa0be2e', -- Cherry Tomatoes variety ID
    'Surefire Red',
    'Surefire Red Cherry Tomato',
    'Early-maturing cherry tomato with excellent flavor and disease resistance',
    'Small, red fruits; early maturity; disease resistant',
    'Excellent for containers. Determinate variety.',
    'Solanum lycopersicum',
    65,
    '18-24"',
    '1/4"',
    '7-14 days',
    'Full Sun',
    false,
    'https://www.rareseeds.com/tomato-surefire-red'
),

(
    '4f47b5f4-a23a-4c2e-bc4c-3b2e3fa0be2e', -- Cherry Tomatoes variety ID
    'Sun Gold',
    'Sun Gold Cherry Tomato',
    'Sweet, orange cherry tomato with exceptional flavor',
    'Small, orange fruits; incredibly sweet; heavy production',
    'Indeterminate variety. Excellent for fresh eating.',
    'Solanum lycopersicum',
    75,
    '24-36"',
    '1/4"',
    '7-14 days',
    'Full Sun',
    false,
    'https://www.rareseeds.com/tomato-sun-gold'
);

-- Verification queries
SELECT 'Cultivars created' as status, count(*) as count FROM cultivars;
SELECT 'Products table updated' as status, 
       EXISTS(SELECT 1 FROM information_schema.columns 
              WHERE table_name='products' AND column_name='cultivar_id') as has_cultivar_id;
