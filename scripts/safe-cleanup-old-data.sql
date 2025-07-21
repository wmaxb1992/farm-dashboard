-- Safe Cleanup of Baker Creek Data
-- This script removes only the Baker Creek specific data, leaving other data intact
-- Run this BEFORE running 17-proper-master-catalog.sql

BEGIN;

-- Step 1: Show what will be removed (for review)
SELECT 'Baker Creek Products to be removed' as info, count(*) as count
FROM products p
JOIN farms f ON p.farm_id = f.id
WHERE f.email = 'info@rareseeds.com';

SELECT 'Baker Creek Farm to be removed' as info, name, email
FROM farms 
WHERE email = 'info@rareseeds.com';

-- Step 2: Remove Baker Creek products first
DELETE FROM products 
WHERE farm_id IN (
    SELECT id FROM farms WHERE email = 'info@rareseeds.com'
);

-- Step 3: Remove Baker Creek farm
DELETE FROM farms WHERE email = 'info@rareseeds.com';

-- Step 4: Find and remove duplicate varieties (keep only the first one per subcategory)
-- This handles the case where we have multiple varieties with the same subcategory name
WITH duplicate_varieties AS (
    SELECT 
        v.id,
        v.name,
        s.name as subcategory_name,
        ROW_NUMBER() OVER (PARTITION BY s.name ORDER BY v.created_at) as rn
    FROM varieties v
    JOIN subcategories s ON v.subcategory_id = s.id
    JOIN categories c ON s.category_id = c.id
    WHERE c.name IN ('Vegetables', 'Herbs', 'Flowers')
    AND v.name = s.name  -- Only remove varieties that are exact duplicates of subcategory names
)
DELETE FROM varieties 
WHERE id IN (
    SELECT id FROM duplicate_varieties WHERE rn > 1
);

-- Step 5: Remove varieties that look like individual cultivars (not plant types)
DELETE FROM varieties 
WHERE name IN (
    'Cherokee Purple',
    'Brandywine', 
    'Black Krim',
    'Genovese',
    'Dragon Tongue Bush',
    'Glass Gem',
    'Classic Amaranth',
    'Royal Amaranth',
    'Golden Amaranth'
) AND id IN (
    SELECT v.id 
    FROM varieties v
    JOIN subcategories s ON v.subcategory_id = s.id
    JOIN categories c ON s.category_id = c.id
    WHERE c.name IN ('Vegetables', 'Herbs', 'Flowers')
);

-- Step 6: Clean up empty subcategories and categories
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

DELETE FROM categories 
WHERE name IN ('Vegetables', 'Herbs', 'Flowers')
AND NOT EXISTS (
    SELECT 1 FROM subcategories s WHERE s.category_id = categories.id
);

-- Verification: Show what's left
SELECT 
    'After Cleanup' as status,
    'Categories' as type, 
    count(*) as count 
FROM categories 
WHERE name IN ('Vegetables', 'Herbs', 'Flowers');

SELECT 
    'After Cleanup' as status,
    'Subcategories' as type, 
    count(*) as count 
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE c.name IN ('Vegetables', 'Herbs', 'Flowers');

SELECT 
    'After Cleanup' as status,
    'Varieties' as type, 
    count(*) as count 
FROM varieties v
JOIN subcategories s ON v.subcategory_id = s.id
JOIN categories c ON s.category_id = c.id
WHERE c.name IN ('Vegetables', 'Herbs', 'Flowers');

SELECT 
    'After Cleanup' as status,
    'Products' as type, 
    count(*) as count 
FROM products p
JOIN farms f ON p.farm_id = f.id
WHERE f.email = 'info@rareseeds.com';

COMMIT;

-- Cleanup completed
-- Database is now clean and ready for proper master catalog import
-- Next: Run 17-proper-master-catalog.sql
