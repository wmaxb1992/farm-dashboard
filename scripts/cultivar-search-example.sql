-- Example: How cultivar search would work

-- Search for "basil" would return both varieties and cultivars
SELECT 
    c.name as category,
    sc.name as subcategory,
    v.name as variety,
    cv.name as cultivar,
    CONCAT(c.name, ' > ', sc.name, ' > ', v.name, ' > ', cv.name) as full_path,
    v.emoji
FROM cultivars cv
JOIN varieties v ON cv.variety_id = v.id
JOIN subcategories sc ON v.subcategory_id = sc.id
JOIN categories c ON sc.category_id = c.id
WHERE 
    v.name ILIKE '%basil%' OR 
    cv.name ILIKE '%basil%'
ORDER BY v.name, cv.name;

-- Example results:
-- category | subcategory    | variety | cultivar      | full_path                                    | emoji
-- Herbs    | Culinary Herbs | Basil   | Sweet Basil   | Herbs > Culinary Herbs > Basil > Sweet Basil | 🌿
-- Herbs    | Culinary Herbs | Basil   | Thai Basil    | Herbs > Culinary Herbs > Basil > Thai Basil  | 🌿
-- Herbs    | Culinary Herbs | Basil   | Lemon Basil   | Herbs > Culinary Herbs > Basil > Lemon Basil | 🌿
-- Herbs    | Culinary Herbs | Basil   | Holy Basil    | Herbs > Culinary Herbs > Basil > Holy Basil  | 🌿
