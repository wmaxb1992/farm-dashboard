-- Example: How Farms Use the Master Catalog
-- This demonstrates how any farm can search and reference the master catalog

-- 1. SEARCH the master catalog (this would be done via Elasticsearch in your app)
-- Find tomato varieties
SELECT 
    v.id as variety_id,
    v.name as variety_name,
    s.name as subcategory,
    c.name as category,
    v.description,
    v.nutritional_info->>'botanical_name' as botanical_name,
    v.nutritional_info->>'days_to_maturity' as days_to_maturity,
    v.culinary_uses
FROM varieties v
JOIN subcategories s ON v.subcategory_id = s.id
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Tomatoes'
AND v.name ILIKE '%purple%'
ORDER BY v.name;

-- 2. EXAMPLE: Local Farm adds their products using the master catalog
-- First, create a sample local farm
INSERT INTO farms (name, email, address, phone, website, logo) VALUES
('Sunset Valley Farm', 'info@sunsetvalley.com', '123 Farm Road, California', '555-0123', 'https://sunsetvalley.com', '/images/farms/sunset-valley.jpg')
ON CONFLICT (email) DO UPDATE SET
    name = EXCLUDED.name,
    address = EXCLUDED.address,
    phone = EXCLUDED.phone,
    website = EXCLUDED.website,
    logo = EXCLUDED.logo;

-- 3. Farm searches master catalog and adds their Cherokee Purple tomatoes
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
    v.name,  -- Cherokee Purple
    f.id,    -- Sunset Valley Farm
    v.id,    -- Reference to master catalog variety
    4.99,    -- Farm's price
    25,      -- Farm's stock
    98,      -- Farm's freshness rating
    '2025-07-15'::DATE,  -- Farm's harvest date
    TRUE,    -- Farm's organic certification
    TRUE,    -- Farm's seasonal availability
    ARRAY['Monday', 'Wednesday', 'Friday'],  -- Farm's delivery days
    ARRAY['/images/products/sunset-cherokee-purple.jpg']  -- Farm's product photos
FROM varieties v
JOIN subcategories s ON v.subcategory_id = s.id
JOIN farms f ON f.email = 'info@sunsetvalley.com'
WHERE v.name = 'Cherokee Purple' 
AND s.name = 'Tomatoes'
AND NOT EXISTS (
    SELECT 1 FROM products p 
    WHERE p.farm_id = f.id 
    AND p.variety_id = v.id
);

-- 4. Another farm adds the same variety with different details
INSERT INTO farms (name, email, address, phone, website, logo) VALUES
('Green Acres Organic', 'hello@greenacres.org', '456 Organic Lane, Oregon', '555-0456', 'https://greenacres.org', '/images/farms/green-acres.jpg')
ON CONFLICT (email) DO UPDATE SET
    name = EXCLUDED.name,
    address = EXCLUDED.address,
    phone = EXCLUDED.phone,
    website = EXCLUDED.website,
    logo = EXCLUDED.logo;

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
    v.name,  -- Cherokee Purple (same variety)
    f.id,    -- Green Acres Organic (different farm)
    v.id,    -- Same reference to master catalog variety
    5.49,    -- Different price
    12,      -- Different stock
    95,      -- Different freshness rating
    '2025-07-20'::DATE,  -- Different harvest date
    TRUE,    -- Also organic
    TRUE,    -- Also in season
    ARRAY['Tuesday', 'Thursday', 'Saturday'],  -- Different delivery days
    ARRAY['/images/products/green-acres-cherokee-purple.jpg']  -- Different product photos
FROM varieties v
JOIN subcategories s ON v.subcategory_id = s.id
JOIN farms f ON f.email = 'hello@greenacres.org'
WHERE v.name = 'Cherokee Purple' 
AND s.name = 'Tomatoes'
AND NOT EXISTS (
    SELECT 1 FROM products p 
    WHERE p.farm_id = f.id 
    AND p.variety_id = v.id
);

-- 5. VIEW: See how multiple farms offer the same variety
SELECT 
    v.name as variety_name,
    v.description as variety_description,
    v.nutritional_info->>'botanical_name' as botanical_name,
    f.name as farm_name,
    f.address as farm_location,
    p.price as farm_price,
    p.stock as farm_stock,
    p.freshness as farm_freshness,
    p.harvest_date as farm_harvest_date,
    p.organic as farm_organic,
    p.delivery_days as farm_delivery_days
FROM varieties v
JOIN products p ON v.id = p.variety_id
JOIN farms f ON p.farm_id = f.id
WHERE v.name = 'Cherokee Purple'
ORDER BY p.price;

-- 6. ELASTICSEARCH SEARCH EXAMPLE (would be done in your app)
-- Search for "purple tomato" across all master catalog varieties
SELECT 
    v.id as variety_id,
    v.name as variety_name,
    s.name as subcategory,
    c.name as category,
    v.description,
    v.nutritional_info->>'botanical_name' as botanical_name,
    v.nutritional_info->>'days_to_maturity' as days_to_maturity,
    v.culinary_uses,
    -- Show how many farms offer this variety
    COUNT(p.id) as farms_offering_count
FROM varieties v
JOIN subcategories s ON v.subcategory_id = s.id
JOIN categories c ON s.category_id = c.id
LEFT JOIN products p ON v.id = p.variety_id
WHERE (
    v.name ILIKE '%purple%' 
    OR v.description ILIKE '%purple%'
    OR s.name ILIKE '%tomato%'
)
GROUP BY v.id, v.name, s.name, c.name, v.description, v.nutritional_info, v.culinary_uses
ORDER BY farms_offering_count DESC, v.name;
