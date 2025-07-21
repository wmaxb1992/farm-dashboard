-- Query to find all basil varieties in the master catalog

-- Method 1: Search for all basil varieties using the search function
SELECT 'All Basil Varieties (using search function)' as info;
SELECT 
    name,
    subcategory_name,
    description,
    nutritional_info->>'days_to_maturity' as days_to_maturity,
    nutritional_info->>'spacing' as spacing,
    nutritional_info->>'sun_requirements' as sun_requirements
FROM search_varieties('basil')
ORDER BY name;

-- Method 2: Direct query for basil subcategory
SELECT 'All Basil Varieties (direct query)' as info;
SELECT 
    v.name,
    v.description,
    v.nutritional_info->>'days_to_maturity' as days_to_maturity,
    v.nutritional_info->>'spacing' as spacing,
    v.nutritional_info->>'sun_requirements' as sun_requirements,
    v.nutritional_info->>'original_price' as original_price
FROM varieties v
JOIN subcategories s ON v.subcategory_id = s.id
JOIN categories c ON s.category_id = c.id
WHERE s.name ILIKE '%basil%'
ORDER BY v.name;

-- Method 3: Search for varieties containing "basil" in the name
SELECT 'Varieties with "basil" in name' as info;
SELECT 
    v.name,
    s.name as subcategory,
    c.name as category,
    v.description
FROM varieties v
JOIN subcategories s ON v.subcategory_id = s.id
JOIN categories c ON s.category_id = c.id
WHERE v.name ILIKE '%basil%'
ORDER BY v.name;

-- Method 4: Count basil varieties
SELECT 'Basil Variety Count' as info;
SELECT 
    s.name as subcategory,
    count(*) as variety_count
FROM varieties v
JOIN subcategories s ON v.subcategory_id = s.id
JOIN categories c ON s.category_id = c.id
WHERE s.name ILIKE '%basil%' OR v.name ILIKE '%basil%'
GROUP BY s.name
ORDER BY variety_count DESC;
