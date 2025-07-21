-- Inspect Current Database State
-- Run this first to see what data you currently have

-- Check all farms
SELECT 'Current Farms' as info, name, email, address FROM farms ORDER BY name;

-- Check categories
SELECT 'Current Categories' as info, c.name, count(s.id) as subcategory_count
FROM categories c
LEFT JOIN subcategories s ON c.id = s.category_id
GROUP BY c.id, c.name
ORDER BY c.name;

-- Check subcategories  
SELECT 'Current Subcategories' as info, 
       c.name as category, 
       s.name as subcategory, 
       count(v.id) as variety_count
FROM categories c
JOIN subcategories s ON c.id = s.category_id
LEFT JOIN varieties v ON s.id = v.subcategory_id
GROUP BY c.name, s.name
ORDER BY c.name, s.name;

-- Check varieties
SELECT 'Current Varieties' as info,
       c.name as category,
       s.name as subcategory, 
       v.name as variety,
       count(p.id) as product_count
FROM categories c
JOIN subcategories s ON c.id = s.category_id
JOIN varieties v ON s.id = v.subcategory_id
LEFT JOIN products p ON v.id = p.variety_id
GROUP BY c.name, s.name, v.name
ORDER BY c.name, s.name, v.name;

-- Check products
SELECT 'Current Products' as info,
       f.name as farm,
       v.name as variety,
       p.name as product,
       p.price,
       p.stock
FROM products p
JOIN farms f ON p.farm_id = f.id
JOIN varieties v ON p.variety_id = v.id
ORDER BY f.name, v.name, p.name;

-- Summary counts
SELECT 'Total Counts' as info, 
       (SELECT count(*) FROM farms) as farms,
       (SELECT count(*) FROM categories) as categories,
       (SELECT count(*) FROM subcategories) as subcategories,
       (SELECT count(*) FROM varieties) as varieties,
       (SELECT count(*) FROM products) as products;
