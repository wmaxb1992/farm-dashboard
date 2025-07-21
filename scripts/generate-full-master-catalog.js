const fs = require('fs')
const path = require('path')

// Load the scraped data
const varietiesData = JSON.parse(fs.readFileSync('./baker-creek-data/varieties.json', 'utf8'))

function generateFullMasterCatalog() {
  let sql = `/*
Full Master Catalog Import
Generated: ${new Date().toISOString()}
Creates ALL varieties as separate entries (no consolidation)
Each Baker Creek cultivar becomes its own variety
*/

BEGIN;

-- Create main categories
INSERT INTO categories (name, image) 
SELECT 'Vegetables', '/images/categories/vegetables.jpg'
WHERE NOT EXISTS (SELECT 1 FROM categories WHERE name = 'Vegetables');

INSERT INTO categories (name, image) 
SELECT 'Herbs', '/images/categories/herbs.jpg'
WHERE NOT EXISTS (SELECT 1 FROM categories WHERE name = 'Herbs');

INSERT INTO categories (name, image) 
SELECT 'Flowers', '/images/categories/flowers.jpg'
WHERE NOT EXISTS (SELECT 1 FROM categories WHERE name = 'Flowers');

`

  // Group by category and subcategory to get unique subcategories
  const subcategoriesMap = new Map()
  const varietiesMap = new Map()
  
  varietiesData.forEach(item => {
    const subKey = `${item.category}|||${item.subcategory}`
    if (!subcategoriesMap.has(subKey)) {
      subcategoriesMap.set(subKey, {
        category: item.category,
        subcategory: item.subcategory
      })
    }
    
    // Each variety gets its own entry
    const varKey = `${item.category}|||${item.subcategory}|||${item.name}`
    if (!varietiesMap.has(varKey)) {
      varietiesMap.set(varKey, {
        category: item.category,
        subcategory: item.subcategory,
        variety: item.name,
        description: item.description,
        image: item.image,
        days_to_maturity: item.daysToMaturity,
        spacing: item.plantSpacing,
        height: item.height,
        sun_requirements: item.sunRequirements,
        water_requirements: item.water_requirements,
        hardiness_zone: item.hardiness_zone,
        packet_size: item.packet_size,
        price: item.price
      })
    }
  })

  // Generate subcategories
  sql += `\n-- Create subcategories\n`
  Array.from(subcategoriesMap.values()).forEach(sub => {
    const safeName = sub.subcategory.replace(/'/g, "''")
    const categoryName = sub.category.replace(/'/g, "''")
    const imageSlug = sub.subcategory.toLowerCase().replace(/[^a-z0-9]+/g, '-')
    
    sql += `INSERT INTO subcategories (category_id, name, image) 
SELECT c.id, '${safeName}', '/images/subcategories/${imageSlug}.jpg'
FROM categories c
WHERE c.name = '${categoryName}'
AND NOT EXISTS (
    SELECT 1 FROM subcategories s 
    JOIN categories cat ON s.category_id = cat.id 
    WHERE s.name = '${safeName}' AND cat.name = '${categoryName}'
);

`
  })

  // Generate varieties (each cultivar as separate variety)
  sql += `\n-- Create varieties (each cultivar as separate variety)\n`
  Array.from(varietiesMap.values()).forEach(variety => {
    const safeName = variety.variety.replace(/'/g, "''")
    const safeSubcategory = variety.subcategory.replace(/'/g, "''")
    const safeCategory = variety.category.replace(/'/g, "''")
    const safeDescription = variety.description ? variety.description.replace(/'/g, "''") : ''
    const imageSlug = variety.variety.toLowerCase().replace(/[^a-z0-9]+/g, '-')
    
    // Build nutritional_info and taste_profile with Baker Creek data
    const nutritionalInfo = {
      source: 'Baker Creek',
      days_to_maturity: variety.days_to_maturity,
      spacing: variety.spacing,
      sun_requirements: variety.sun_requirements,
      original_price: variety.price
    }
    
    const tasteProfile = {
      image_url: variety.image,
      slug: variety.variety.toLowerCase().replace(/[^a-z0-9]+/g, '-'),
      height: variety.height,
      water_requirements: variety.water_requirements,
      hardiness_zone: variety.hardiness_zone,
      packet_size: variety.packet_size
    }
    
    const nutritionalJson = JSON.stringify(nutritionalInfo).replace(/'/g, "''")
    const tasteJson = JSON.stringify(tasteProfile).replace(/'/g, "''")
    
    sql += `INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, '${safeName}', '${safeDescription}', '/images/varieties/${imageSlug}.jpg', '${nutritionalJson}'::jsonb, '${tasteJson}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = '${safeSubcategory}' AND c.name = '${safeCategory}'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = '${safeName}' AND sub.name = '${safeSubcategory}' AND cat.name = '${safeCategory}'
);

`
  })

  sql += `
-- Verification queries
SELECT 
    'Import Complete' as status,
    'Categories' as type,
    count(*) as count 
FROM categories 
WHERE name IN ('Vegetables', 'Herbs', 'Flowers');

SELECT 
    'Import Complete' as status,
    'Subcategories' as type,
    count(*) as count 
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE c.name IN ('Vegetables', 'Herbs', 'Flowers');

SELECT 
    'Import Complete' as status,
    'Varieties' as type,
    count(*) as count 
FROM varieties v
JOIN subcategories s ON v.subcategory_id = s.id
JOIN categories c ON s.category_id = c.id
WHERE c.name IN ('Vegetables', 'Herbs', 'Flowers');

COMMIT;

-- Master catalog import completed successfully
-- Each Baker Creek cultivar is now a separate variety
-- Farms can search and reference any of these varieties when creating products
`

  return sql
}

// Generate the SQL file
const sql = generateFullMasterCatalog()
fs.writeFileSync('./scripts/18-full-master-catalog.sql', sql)
console.log('Generated ./scripts/18-full-master-catalog.sql')
console.log('This creates ALL Baker Creek varieties as separate entries')
