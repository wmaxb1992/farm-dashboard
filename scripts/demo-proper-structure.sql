-- Demo: Proper Master Catalog Structure
-- This shows how the corrected structure works

-- 1. MASTER CATALOG STRUCTURE (after running 17-proper-master-catalog.sql)
-- View the proper 3-level hierarchy

SELECT 
    c.name as category,
    s.name as subcategory,
    v.name as variety,
    v.emoji,
    v.nutritional_info->>'variety_count' as available_cultivars,
    v.nutritional_info->>'example_varieties' as example_cultivars
FROM categories c
JOIN subcategories s ON c.id = s.category_id
JOIN varieties v ON s.id = v.subcategory_id
WHERE c.name = 'Vegetables' AND s.name IN ('Tomatoes', 'Basil', 'Amaranth')
ORDER BY c.name, s.name;

-- 2. SEARCH EXAMPLE - Farm searches for "Tomatoes" 
-- (This would be done via Elasticsearch in your app)

SELECT 
    v.id as variety_id,
    v.name as variety_name,
    v.emoji,
    v.description,
    v.nutritional_info->>'botanical_name' as botanical_name,
    v.nutritional_info->>'variety_count' as available_cultivars,
    v.nutritional_info->>'example_varieties' as example_cultivars,
    v.culinary_uses
FROM varieties v
JOIN subcategories s ON v.subcategory_id = s.id
WHERE v.name ILIKE '%tomato%'
ORDER BY v.name;

-- 3. FARM ADDS PRODUCTS - Using the proper structure
-- Create a sample farm
INSERT INTO farms (name, email, address, phone, website, logo) VALUES
('Organic Valley Farm', 'contact@organicvalley.com', '789 Valley Road, California', '555-0789', 'https://organicvalley.com', '/images/farms/organic-valley.jpg')
ON CONFLICT (email) DO UPDATE SET
    name = EXCLUDED.name,
    address = EXCLUDED.address,
    phone = EXCLUDED.phone,
    website = EXCLUDED.website,
    logo = EXCLUDED.logo;

-- Farm searches master catalog for "Tomatoes" variety and adds specific cultivars
INSERT INTO products (
    name, 
    farm_id, 
    variety_id, 
    price, 
    stock, 
    freshness, 
    harvest_date,
    organic, 
    in_season,
    delivery_days,
    images
)
SELECT 
    'Cherokee Purple',  -- Specific cultivar name
    f.id,              -- Farm ID
    v.id,              -- References "Tomatoes" variety from master catalog
    6.99,              -- Farm's price
    15,                -- Farm's stock
    95,                -- Farm's freshness
    '2025-07-20'::DATE, -- Farm's harvest date
    TRUE,              -- Farm's organic status
    TRUE,              -- Farm's seasonal availability
    ARRAY['Monday', 'Wednesday', 'Friday'],  -- Farm's delivery days
    ARRAY['/images/products/cherokee-purple-organic-valley.jpg']  -- Farm's photos
FROM varieties v
JOIN subcategories s ON v.subcategory_id = s.id
JOIN farms f ON f.email = 'contact@organicvalley.com'
WHERE v.name = 'Tomatoes' AND s.name = 'Tomatoes'
AND NOT EXISTS (
    SELECT 1 FROM products p 
    WHERE p.farm_id = f.id 
    AND p.variety_id = v.id
    AND p.name = 'Cherokee Purple'
);

-- Farm adds another cultivar of the same variety
INSERT INTO products (
    name, 
    farm_id, 
    variety_id, 
    price, 
    stock, 
    freshness, 
    harvest_date,
    organic, 
    in_season,
    delivery_days,
    images
)
SELECT 
    'Brandywine',      -- Different specific cultivar
    f.id,              -- Same farm
    v.id,              -- Same "Tomatoes" variety reference
    7.49,              -- Different price
    8,                 -- Different stock
    98,                -- Different freshness
    '2025-07-18'::DATE, -- Different harvest date
    TRUE,              -- Also organic
    TRUE,              -- Also in season
    ARRAY['Tuesday', 'Thursday', 'Saturday'],  -- Different delivery days
    ARRAY['/images/products/brandywine-organic-valley.jpg']  -- Different photos
FROM varieties v
JOIN subcategories s ON v.subcategory_id = s.id
JOIN farms f ON f.email = 'contact@organicvalley.com'
WHERE v.name = 'Tomatoes' AND s.name = 'Tomatoes'
AND NOT EXISTS (
    SELECT 1 FROM products p 
    WHERE p.farm_id = f.id 
    AND p.variety_id = v.id
    AND p.name = 'Brandywine'
);

-- 4. VIEW RESULTS - See how multiple products reference the same variety
SELECT 
    v.name as variety_type,
    v.emoji,
    v.nutritional_info->>'variety_count' as total_cultivars_available,
    f.name as farm_name,
    p.name as specific_cultivar,
    p.price,
    p.stock,
    p.harvest_date,
    p.organic
FROM varieties v
JOIN products p ON v.id = p.variety_id
JOIN farms f ON p.farm_id = f.id
WHERE v.name = 'Tomatoes'
ORDER BY f.name, p.name;

-- 5. CUSTOMER SEARCH - Find all tomato products across all farms
SELECT 
    v.name as variety_type,
    v.emoji,
    v.description,
    f.name as farm_name,
    f.address as farm_location,
    p.name as specific_cultivar,
    p.price,
    p.stock,
    p.harvest_date,
    p.organic,
    p.in_season
FROM varieties v
JOIN products p ON v.id = p.variety_id
JOIN farms f ON p.farm_id = f.id
WHERE v.name = 'Tomatoes'
ORDER BY p.price;

-- 6. ELASTICSEARCH STRUCTURE - What gets indexed
SELECT 
    v.id as variety_id,
    v.name as variety_name,
    v.emoji,
    s.name as subcategory,
    c.name as category,
    v.description,
    v.nutritional_info->>'botanical_name' as botanical_name,
    v.nutritional_info->>'variety_count' as available_cultivars,
    v.nutritional_info->>'example_varieties' as example_cultivars,
    v.culinary_uses,
    COUNT(p.id) as farms_offering_count
FROM varieties v
JOIN subcategories s ON v.subcategory_id = s.id
JOIN categories c ON s.category_id = c.id
LEFT JOIN products p ON v.id = p.variety_id
WHERE c.name IN ('Vegetables', 'Herbs', 'Flowers')
GROUP BY v.id, v.name, v.emoji, s.name, c.name, v.description, v.nutritional_info, v.culinary_uses
ORDER BY farms_offering_count DESC, v.name
LIMIT 10;
