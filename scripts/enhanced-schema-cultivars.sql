-- Enhanced schema with cultivar/type support

-- Varieties table (base varieties)
CREATE TABLE varieties (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    subcategory_id UUID REFERENCES subcategories(id) ON DELETE CASCADE,
    name VARCHAR(255) NOT NULL,  -- Base variety name (e.g., "Basil")
    emoji VARCHAR(10),
    description TEXT,
    card_image TEXT,
    nutritional_info JSONB,
    taste_profile JSONB,
    culinary_uses TEXT[],
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Cultivars table (specific types/cultivars of varieties)
CREATE TABLE cultivars (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    variety_id UUID REFERENCES varieties(id) ON DELETE CASCADE,
    name VARCHAR(255) NOT NULL,  -- Cultivar name (e.g., "Sweet Basil", "Thai Basil")
    common_name VARCHAR(255),    -- Alternative name
    description TEXT,
    characteristics TEXT,        -- Specific traits of this cultivar
    growing_notes TEXT,
    image TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    
    -- Ensure unique cultivar names per variety
    UNIQUE(variety_id, name)
);

-- Update products table to reference cultivars instead of varieties
-- (or add both variety_id and cultivar_id for flexibility)
ALTER TABLE products 
ADD COLUMN cultivar_id UUID REFERENCES cultivars(id),
ADD COLUMN variety_name VARCHAR(255), -- Denormalized for easier queries
ADD COLUMN cultivar_name VARCHAR(255); -- Denormalized for easier queries

-- Index for performance
CREATE INDEX idx_cultivars_variety_id ON cultivars(variety_id);
CREATE INDEX idx_products_cultivar_id ON products(cultivar_id);
