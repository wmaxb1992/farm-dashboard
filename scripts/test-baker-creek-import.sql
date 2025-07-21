-- Test Queries for Baker Creek Import
-- Run these queries in your Supabase SQL Editor to verify the import

-- 1. Check if the farm was created
SELECT 
    name,
    email,
    address,
    phone,
    website
FROM farms 
WHERE email = 'info@rareseeds.com';

-- 2. Check categories
SELECT 
    name,
    COUNT(*) as subcategory_count
FROM categories c
LEFT JOIN subcategories s ON c.id = s.category_id
WHERE c.name IN ('Vegetables', 'Herbs', 'Flowers')
GROUP BY c.name
ORDER BY c.name;

-- 3. Check subcategories (top 10)
SELECT 
    c.name as category,
    s.name as subcategory,
    COUNT(v.id) as variety_count
FROM categories c
JOIN subcategories s ON c.id = s.category_id
LEFT JOIN varieties v ON s.id = v.subcategory_id
WHERE c.name IN ('Vegetables', 'Herbs', 'Flowers')
GROUP BY c.name, s.name
ORDER BY variety_count DESC
LIMIT 10;

-- 4. Check varieties
SELECT 
    c.name as category,
    s.name as subcategory,
    v.name as variety,
    v.emoji,
    COUNT(p.id) as product_count
FROM categories c
JOIN subcategories s ON c.id = s.category_id
JOIN varieties v ON s.id = v.subcategory_id
LEFT JOIN products p ON v.id = p.variety_id
WHERE c.name IN ('Vegetables', 'Herbs', 'Flowers')
GROUP BY c.name, s.name, v.name, v.emoji
ORDER BY product_count DESC
LIMIT 10;

-- 5. Check total products imported
SELECT 
    f.name as farm_name,
    COUNT(p.id) as total_products
FROM farms f
JOIN products p ON f.id = p.farm_id
WHERE f.email = 'info@rareseeds.com'
GROUP BY f.name;

-- 6. Check some famous varieties
SELECT 
    p.name as product_name,
    v.name as variety,
    s.name as subcategory,
    c.name as category,
    p.price,
    p.stock,
    p.organic,
    p.in_season,
    CASE 
        WHEN p.images IS NOT NULL THEN array_length(p.images, 1) 
        ELSE 0 
    END as image_count
FROM products p
JOIN varieties v ON p.variety_id = v.id
JOIN subcategories s ON v.subcategory_id = s.id
JOIN categories c ON s.category_id = c.id
WHERE p.name ILIKE ANY (ARRAY['%Cherokee Purple%', '%Genovese%', '%Dragon Tongue%', '%Black Krim%', '%Brandywine%', '%Glass Gem%'])
ORDER BY p.name;

-- 7. Check price range
SELECT 
    MIN(price) as min_price,
    MAX(price) as max_price,
    AVG(price) as avg_price,
    COUNT(*) as total_products
FROM products p
JOIN farms f ON p.farm_id = f.id
WHERE f.email = 'info@rareseeds.com';

-- 8. Check stock levels
SELECT 
    CASE 
        WHEN stock = 0 THEN 'Out of Stock'
        WHEN stock < 20 THEN 'Low Stock'
        WHEN stock < 50 THEN 'Medium Stock'
        ELSE 'High Stock'
    END as stock_level,
    COUNT(*) as product_count
FROM products p
JOIN farms f ON p.farm_id = f.id
WHERE f.email = 'info@rareseeds.com'
GROUP BY 
    CASE 
        WHEN stock = 0 THEN 'Out of Stock'
        WHEN stock < 20 THEN 'Low Stock'
        WHEN stock < 50 THEN 'Medium Stock'
        ELSE 'High Stock'
    END
ORDER BY product_count DESC;

-- 9. Check products with images
SELECT 
    COUNT(CASE WHEN images IS NOT NULL AND array_length(images, 1) > 0 THEN 1 END) as products_with_images,
    COUNT(CASE WHEN images IS NULL OR array_length(images, 1) = 0 THEN 1 END) as products_without_images,
    COUNT(*) as total_products
FROM products p
JOIN farms f ON p.farm_id = f.id
WHERE f.email = 'info@rareseeds.com';

-- 10. Sample products from each category
SELECT 
    c.name as category,
    p.name as product_name,
    p.price,
    p.stock,
    p.freshness
FROM categories c
JOIN subcategories s ON c.id = s.category_id
JOIN varieties v ON s.id = v.subcategory_id
JOIN products p ON v.id = p.variety_id
WHERE c.name IN ('Vegetables', 'Herbs', 'Flowers')
AND p.name NOT LIKE '%Classic%'  -- Skip generic names
ORDER BY c.name, RANDOM()
LIMIT 15;
