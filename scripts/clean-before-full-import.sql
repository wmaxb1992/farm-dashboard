-- Clean up existing varieties before running full import
-- This removes the consolidated approach varieties

BEGIN;

-- Remove existing varieties that might be from Baker Creek import
-- Look for varieties with Baker Creek-style names or descriptions
DELETE FROM varieties 
WHERE description LIKE '%Baker Creek%' 
OR description LIKE '%Heirloom%'
OR description LIKE '%rareseeds%'
OR nutritional_info::text LIKE '%Baker Creek%'
OR taste_profile::text LIKE '%Baker Creek%';

-- Remove the consolidated categories/subcategories if they exist
DELETE FROM subcategories s
USING categories c
WHERE s.category_id = c.id
AND c.name IN ('Vegetables', 'Herbs', 'Flowers')
AND NOT EXISTS (
    SELECT 1 FROM varieties v WHERE v.subcategory_id = s.id
);

DELETE FROM categories 
WHERE name IN ('Vegetables', 'Herbs', 'Flowers')
AND NOT EXISTS (
    SELECT 1 FROM subcategories s WHERE s.category_id = categories.id
);

COMMIT;

-- Database is now clean and ready for full master catalog import
-- Next: Run the full master catalog import
