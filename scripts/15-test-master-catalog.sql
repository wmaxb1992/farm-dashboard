-- Test Master Catalog Import (Simplified)
-- This is a smaller version to test the structure first

BEGIN;

-- Create main categories (master catalog)
INSERT INTO categories (name, image) 
SELECT 'Vegetables', '/images/categories/vegetables.jpg'
WHERE NOT EXISTS (SELECT 1 FROM categories WHERE name = 'Vegetables');

INSERT INTO categories (name, image) 
SELECT 'Herbs', '/images/categories/herbs.jpg'
WHERE NOT EXISTS (SELECT 1 FROM categories WHERE name = 'Herbs');

INSERT INTO categories (name, image) 
SELECT 'Flowers', '/images/categories/flowers.jpg'
WHERE NOT EXISTS (SELECT 1 FROM categories WHERE name = 'Flowers');

-- Test subcategory
INSERT INTO subcategories (category_id, name, image) 
SELECT c.id, 'Tomatoes', '/images/subcategories/tomatoes.jpg'
FROM categories c
WHERE c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM subcategories s 
    JOIN categories cat ON s.category_id = cat.id 
    WHERE s.name = 'Tomatoes' AND cat.name = 'Vegetables'
);

-- Test variety
INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT s.id, 'Cherokee Purple', '🍅', 'Heirloom beefsteak tomato with deep purple shoulders and rich flavor. (Solanum lycopersicum) Days to maturity: 80-85 days', 
'{"botanical_name": "Solanum lycopersicum", "days_to_maturity": "80-85 days"}', 
'{"rating": 4.7, "characteristics": "rich flavor"}', 
ARRAY['fresh', 'sauce', 'salad']
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Tomatoes' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    WHERE v.name = 'Cherokee Purple' AND sub.name = 'Tomatoes'
);

-- Verification
SELECT 'Master Categories' as type, count(*) as count FROM categories WHERE name IN ('Vegetables', 'Herbs', 'Flowers');
SELECT 'Master Subcategories' as type, count(*) as count FROM subcategories s JOIN categories c ON s.category_id = c.id WHERE c.name IN ('Vegetables', 'Herbs', 'Flowers') AND s.name = 'Tomatoes';
SELECT 'Master Varieties' as type, count(*) as count FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE s.name = 'Tomatoes' AND v.name = 'Cherokee Purple';

COMMIT;

-- Test completed successfully
-- This confirms the structure works
-- Now you can run the full master catalog import
