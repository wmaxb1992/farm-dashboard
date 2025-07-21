-- Verification script - run this to check if everything was created correctly

-- Check all tables exist
SELECT table_name 
FROM information_schema.tables 
WHERE table_schema = 'public' 
  AND table_type = 'BASE TABLE'
ORDER BY table_name;

-- Check sample data
SELECT 'Categories' as table_name, count(*) as count FROM categories
UNION ALL
SELECT 'Subcategories', count(*) FROM subcategories  
UNION ALL
SELECT 'Varieties', count(*) FROM varieties
UNION ALL
SELECT 'Farms', count(*) FROM farms
UNION ALL
SELECT 'Products', count(*) FROM products
UNION ALL
SELECT 'Farm Plantings', count(*) FROM farm_plantings
UNION ALL
SELECT 'Harvests', count(*) FROM harvests
UNION ALL
SELECT 'Inventory Batches', count(*) FROM inventory_batches;

-- Show sample varieties with their relationships
SELECT 
    c.name as category,
    sc.name as subcategory, 
    v.name as variety,
    v.emoji
FROM varieties v
JOIN subcategories sc ON v.subcategory_id = sc.id
JOIN categories c ON sc.category_id = c.id
ORDER BY c.name, sc.name, v.name;
