-- Quick Test Summary for Baker Creek Import
-- Run this single query to get a complete overview

WITH import_summary AS (
    SELECT 
        f.name as farm_name,
        f.email,
        COUNT(DISTINCT c.id) as category_count,
        COUNT(DISTINCT s.id) as subcategory_count,
        COUNT(DISTINCT v.id) as variety_count,
        COUNT(p.id) as product_count,
        MIN(p.price) as min_price,
        MAX(p.price) as max_price,
        AVG(p.price) as avg_price,
        COUNT(CASE WHEN p.stock = 0 THEN 1 END) as out_of_stock,
        COUNT(CASE WHEN p.images IS NOT NULL AND array_length(p.images, 1) > 0 THEN 1 END) as products_with_images,
        COUNT(CASE WHEN p.organic = TRUE THEN 1 END) as organic_products,
        COUNT(CASE WHEN p.in_season = TRUE THEN 1 END) as in_season_products
    FROM farms f
    JOIN products p ON f.id = p.farm_id
    JOIN varieties v ON p.variety_id = v.id
    JOIN subcategories s ON v.subcategory_id = s.id
    JOIN categories c ON s.category_id = c.id
    WHERE f.email = 'info@rareseeds.com'
    GROUP BY f.name, f.email
)
SELECT 
    '🏪 ' || farm_name as "Farm",
    '📧 ' || email as "Email",
    '📁 ' || category_count || ' categories' as "Categories",
    '📂 ' || subcategory_count || ' subcategories' as "Subcategories", 
    '🌱 ' || variety_count || ' varieties' as "Varieties",
    '📦 ' || product_count || ' products' as "Products",
    '💰 $' || ROUND(min_price, 2) || ' - $' || ROUND(max_price, 2) || ' (avg: $' || ROUND(avg_price, 2) || ')' as "Price Range",
    '📊 ' || out_of_stock || ' out of stock' as "Stock Status",
    '🖼️ ' || products_with_images || ' with images' as "Images",
    '🌿 ' || organic_products || ' organic' as "Organic",
    '🌞 ' || in_season_products || ' in season' as "Seasonal"
FROM import_summary;

-- Famous varieties check
SELECT 
    '🍅 Famous Varieties Found:' as "Status",
    STRING_AGG(p.name, ', ') as "Varieties"
FROM products p
JOIN farms f ON p.farm_id = f.id
WHERE f.email = 'info@rareseeds.com'
AND p.name ILIKE ANY (ARRAY['%Cherokee Purple%', '%Genovese%', '%Dragon Tongue%', '%Black Krim%', '%Brandywine%', '%Glass Gem%']);
