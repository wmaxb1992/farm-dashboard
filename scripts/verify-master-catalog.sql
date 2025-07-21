-- Verify Master Catalog Import Results
-- Check what was actually created

-- Show all categories
SELECT 'Categories' as type, name, 
       (SELECT count(*) FROM subcategories s WHERE s.category_id = c.id) as subcategory_count
FROM categories c
WHERE name IN ('Vegetables', 'Herbs', 'Flowers')
ORDER BY name;

-- Show all subcategories 
SELECT 'Subcategories' as type, 
       c.name as category,
       s.name as subcategory,
       (SELECT count(*) FROM varieties v WHERE v.subcategory_id = s.id) as variety_count
FROM categories c
JOIN subcategories s ON c.id = s.category_id
WHERE c.name IN ('Vegetables', 'Herbs', 'Flowers')
ORDER BY c.name, s.name;

-- Show all varieties
SELECT 'Varieties' as type,
       c.name as category,
       s.name as subcategory,
       v.name as variety,
       CASE 
           WHEN v.metadata IS NOT NULL THEN 'Has metadata'
           ELSE 'No metadata'
       END as has_metadata
FROM categories c
JOIN subcategories s ON c.id = s.category_id
JOIN varieties v ON s.id = v.subcategory_id
WHERE c.name IN ('Vegetables', 'Herbs', 'Flowers')
ORDER BY c.name, s.name, v.name;

-- Count totals
SELECT 
    'Totals' as info,
    (SELECT count(*) FROM categories WHERE name IN ('Vegetables', 'Herbs', 'Flowers')) as categories,
    (SELECT count(*) FROM subcategories s JOIN categories c ON s.category_id = c.id WHERE c.name IN ('Vegetables', 'Herbs', 'Flowers')) as subcategories,
    (SELECT count(*) FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id JOIN categories c ON s.category_id = c.id WHERE c.name IN ('Vegetables', 'Herbs', 'Flowers')) as varieties;
