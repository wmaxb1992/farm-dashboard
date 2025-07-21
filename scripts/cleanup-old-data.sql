-- Clean Old Baker Creek Data
-- This script safely removes old/duplicate data before importing the proper master catalog
-- Run this BEFORE running 17-proper-master-catalog.sql

BEGIN;

-- Step 1: Remove all products from Baker Creek farm (if any)
DELETE FROM products 
WHERE farm_id IN (
    SELECT id FROM farms WHERE email = 'info@rareseeds.com'
);

-- Step 2: Remove Baker Creek farm
DELETE FROM farms WHERE email = 'info@rareseeds.com';

-- Step 3: Remove all varieties that were created from Baker Creek import
-- (This will also cascade delete any products referencing these varieties)
DELETE FROM varieties 
WHERE id IN (
    SELECT v.id 
    FROM varieties v
    JOIN subcategories s ON v.subcategory_id = s.id
    JOIN categories c ON s.category_id = c.id
    WHERE c.name IN ('Vegetables', 'Herbs', 'Flowers')
    AND (
        -- Remove varieties that look like Baker Creek individual cultivars
        v.name LIKE '%Amaranth%' OR
        v.name LIKE '%Cherokee%' OR
        v.name LIKE '%Brandywine%' OR
        v.name LIKE '%Genovese%' OR
        v.name LIKE '%Dragon%' OR
        v.name LIKE '%Black Krim%' OR
        v.name LIKE '%Glass Gem%' OR
        -- Remove varieties that are exact duplicates of subcategory names
        v.name = s.name
    )
);

-- Step 4: Remove subcategories that were created from Baker Creek import
-- (Only remove if they have no varieties left)
DELETE FROM subcategories 
WHERE id IN (
    SELECT s.id 
    FROM subcategories s
    JOIN categories c ON s.category_id = c.id
    WHERE c.name IN ('Vegetables', 'Herbs', 'Flowers')
    AND NOT EXISTS (
        SELECT 1 FROM varieties v WHERE v.subcategory_id = s.id
    )
);

-- Step 5: Remove categories if they have no subcategories left
-- (Only remove if they are empty)
DELETE FROM categories 
WHERE name IN ('Vegetables', 'Herbs', 'Flowers')
AND NOT EXISTS (
    SELECT 1 FROM subcategories s WHERE s.category_id = categories.id
);

-- Step 6: Clean up any orphaned data (safety check)
-- Remove any products that reference non-existent varieties
DELETE FROM products 
WHERE variety_id NOT IN (SELECT id FROM varieties);

-- Step 7: Remove any varieties that reference non-existent subcategories
DELETE FROM varieties 
WHERE subcategory_id NOT IN (SELECT id FROM subcategories);

-- Step 8: Remove any subcategories that reference non-existent categories
DELETE FROM subcategories 
WHERE category_id NOT IN (SELECT id FROM categories);

-- Verification: Check what's left
SELECT 'Remaining Categories' as type, count(*) as count FROM categories;
SELECT 'Remaining Subcategories' as type, count(*) as count FROM subcategories;
SELECT 'Remaining Varieties' as type, count(*) as count FROM varieties;
SELECT 'Remaining Products' as type, count(*) as count FROM products;
SELECT 'Remaining Farms' as type, count(*) as count FROM farms;

-- Show remaining data (if any)
SELECT 
    'Remaining Categories' as type,
    name as item
FROM categories
ORDER BY name;

SELECT 
    'Remaining Subcategories' as type,
    s.name as item,
    c.name as parent_category
FROM subcategories s
JOIN categories c ON s.category_id = c.id
ORDER BY c.name, s.name;

SELECT 
    'Remaining Varieties' as type,
    v.name as item,
    s.name as parent_subcategory,
    c.name as parent_category
FROM varieties v
JOIN subcategories s ON v.subcategory_id = s.id
JOIN categories c ON s.category_id = c.id
ORDER BY c.name, s.name, v.name;

COMMIT;

-- Cleanup completed successfully
-- Your database is now clean and ready for the proper master catalog import
-- Next step: Run 17-proper-master-catalog.sql
