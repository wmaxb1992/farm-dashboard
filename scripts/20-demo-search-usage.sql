-- Demo: How Farms Use the Master Catalog Search
-- This shows practical examples of how farms search and add products

-- Example 1: Farm searches for tomato varieties
SELECT 'Example 1: Searching for tomato varieties' as demo;

SELECT 
    name,
    subcategory_name,
    category_name,
    description,
    nutritional_info->>'days_to_maturity' as days_to_maturity,
    nutritional_info->>'spacing' as spacing
FROM search_varieties('tomato')
ORDER BY name
LIMIT 10;

-- Example 2: Farm searches for herbs with specific growing requirements
SELECT 'Example 2: Searching for full sun herbs' as demo;

SELECT 
    name,
    subcategory_name,
    nutritional_info->>'sun_requirements' as sun_requirements,
    nutritional_info->>'days_to_maturity' as days_to_maturity
FROM search_varieties('full sun', 'Herbs')
ORDER BY name
LIMIT 10;

-- Example 3: Farm searches for quick-growing varieties (short season)
SELECT 'Example 3: Quick-growing varieties' as demo;

SELECT 
    name,
    subcategory_name,
    category_name,
    nutritional_info->>'days_to_maturity' as days_to_maturity
FROM varieties_search
WHERE nutritional_info->>'days_to_maturity' ILIKE '%30%'
   OR nutritional_info->>'days_to_maturity' ILIKE '%40%'
   OR nutritional_info->>'days_to_maturity' ILIKE '%50%'
ORDER BY name
LIMIT 10;

-- Example 4: Farm uses autocomplete while typing
SELECT 'Example 4: Autocomplete suggestions for "pep"' as demo;

SELECT * FROM get_variety_suggestions('pep', 10);

-- Example 5: Farm adds products based on master catalog
SELECT 'Example 5: Farm adds products referencing master catalog' as demo;

-- First, let's create a sample farm if it doesn't exist
INSERT INTO farms (name, email, address, description)
SELECT 'Green Valley Farm', 'info@greenvalleyfarm.com', '123 Farm Road, Valley, CA', 'Organic vegetable farm'
WHERE NOT EXISTS (SELECT 1 FROM farms WHERE email = 'info@greenvalleyfarm.com');

-- Now the farm searches for varieties they want to grow
-- They find Cherokee Purple tomato in the master catalog
WITH found_variety AS (
    SELECT id, name, subcategory_name
    FROM search_varieties('Cherokee Purple')
    WHERE name = 'Cherokee Purple'
    LIMIT 1
),
farm_info AS (
    SELECT id FROM farms WHERE email = 'info@greenvalleyfarm.com'
)
-- Farm adds their own product based on the master catalog variety
INSERT INTO products (farm_id, variety_id, name, price, stock, description, organic, in_season)
SELECT 
    f.id,
    v.id,
    'Organic Cherokee Purple Tomatoes - 1lb',
    8.99,
    25,
    'Fresh organic Cherokee Purple tomatoes grown with care. Rich, complex flavor perfect for slicing.',
    true,
    true
FROM farm_info f, found_variety v
WHERE NOT EXISTS (
    SELECT 1 FROM products p 
    WHERE p.farm_id = f.id 
    AND p.variety_id = v.id 
    AND p.name = 'Organic Cherokee Purple Tomatoes - 1lb'
);

-- Show the added product
SELECT 'Added Product' as info,
       f.name as farm_name,
       p.name as product_name,
       p.price,
       v.name as variety_name,
       s.name as subcategory
FROM products p
JOIN farms f ON p.farm_id = f.id
JOIN varieties v ON p.variety_id = v.id
JOIN subcategories s ON v.subcategory_id = s.id
WHERE f.email = 'info@greenvalleyfarm.com'
ORDER BY p.created_at DESC
LIMIT 5;

-- Example 6: Search by growing characteristics
SELECT 'Example 6: Search by spacing requirements' as demo;

SELECT 
    name,
    subcategory_name,
    nutritional_info->>'spacing' as spacing,
    nutritional_info->>'sun_requirements' as sun_requirements
FROM varieties_search
WHERE nutritional_info->>'spacing' ILIKE '%12%'
ORDER BY name
LIMIT 10;

-- Example 7: Advanced search combining multiple criteria
SELECT 'Example 7: Advanced search - herbs that are easy to grow' as demo;

SELECT 
    name,
    subcategory_name,
    description,
    nutritional_info->>'days_to_maturity' as days_to_maturity,
    nutritional_info->>'sun_requirements' as sun_requirements
FROM search_varieties('easy annual', 'Herbs')
ORDER BY name
LIMIT 10;

-- Summary: Show the power of the search system
SELECT 'Search System Summary' as info;

SELECT 
    'Total searchable varieties' as metric,
    count(*) as count
FROM varieties_search;

SELECT 
    'Categories available' as metric,
    count(DISTINCT category_name) as count
FROM varieties_search;

SELECT 
    'Subcategories available' as metric,
    count(DISTINCT subcategory_name) as count
FROM varieties_search;

-- Show variety distribution by category
SELECT 
    category_name,
    count(*) as variety_count
FROM varieties_search
GROUP BY category_name
ORDER BY variety_count DESC;
