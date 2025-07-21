const fs = require('fs')
const path = require('path')

// Load the scraped data
const varietiesData = JSON.parse(fs.readFileSync('./baker-creek-data/varieties.json', 'utf8'))
const categoriesData = JSON.parse(fs.readFileSync('./baker-creek-data/categories.json', 'utf8'))

function generateCleanImport() {
  let sql = `-- Baker Creek Seed Catalog Import (Clean UUIDs - No Duplicates)
-- Generated: ${new Date().toISOString()}
-- Total varieties: ${varietiesData.length}
-- Uses existing schema with proper UUIDs and clean names
-- Includes comprehensive duplicate prevention

BEGIN;

-- Create variables for UUIDs that we'll reuse
-- Farm (prevent duplicate farms by email)
INSERT INTO farms (name, address, description, email, phone, website, logo) VALUES
('Baker Creek Heirloom Seeds', 'Mansfield, Missouri', 'Premier heirloom seed company offering the largest selection of heirloom vegetable, herb, and flower seeds in the United States.', 'info@rareseeds.com', '417-924-8917', 'https://www.rareseeds.com', '/images/farms/baker-creek-logo.jpg')
ON CONFLICT (email) DO UPDATE SET
    name = EXCLUDED.name,
    address = EXCLUDED.address,
    description = EXCLUDED.description,
    phone = EXCLUDED.phone,
    website = EXCLUDED.website,
    logo = EXCLUDED.logo,
    updated_at = NOW();

-- Get the farm ID for reference
CREATE TEMP TABLE temp_farm_id AS SELECT id as farm_id FROM farms WHERE email = 'info@rareseeds.com';

-- Create main categories (prevent duplicates by checking if they exist)
INSERT INTO categories (name, image) 
SELECT 'Vegetables', '/images/categories/vegetables.jpg'
WHERE NOT EXISTS (SELECT 1 FROM categories WHERE name = 'Vegetables');

INSERT INTO categories (name, image) 
SELECT 'Herbs', '/images/categories/herbs.jpg'
WHERE NOT EXISTS (SELECT 1 FROM categories WHERE name = 'Herbs');

INSERT INTO categories (name, image) 
SELECT 'Flowers', '/images/categories/flowers.jpg'
WHERE NOT EXISTS (SELECT 1 FROM categories WHERE name = 'Flowers');

-- Create temp table for category IDs
CREATE TEMP TABLE temp_category_ids AS 
SELECT id as category_id, name as category_name FROM categories WHERE name IN ('Vegetables', 'Herbs', 'Flowers');

`

  // Group varieties by category/subcategory
  const categoryGroups = {}
  const subcategoryGroups = {}

  varietiesData.forEach(variety => {
    const categoryKey = variety.category
    const subcategoryKey = variety.subcategory
    
    if (!categoryGroups[categoryKey]) {
      categoryGroups[categoryKey] = []
    }
    categoryGroups[categoryKey].push(variety)
    
    if (!subcategoryGroups[subcategoryKey]) {
      subcategoryGroups[subcategoryKey] = {
        category: categoryKey,
        varieties: []
      }
    }
    subcategoryGroups[subcategoryKey].varieties.push(variety)
  })

  // Create subcategories
  sql += '-- Create subcategories (prevent duplicates by checking if they exist)\n'
  Object.keys(subcategoryGroups).forEach(subcategoryName => {
    const subcategory = subcategoryGroups[subcategoryName]
    const categoryName = subcategory.category
    
    sql += `INSERT INTO subcategories (category_id, name, image) 
SELECT category_id, '${subcategoryName}', '/images/subcategories/${subcategoryName.toLowerCase().replace(/\s+/g, '-')}.jpg'
FROM temp_category_ids 
WHERE category_name = '${categoryName}'
AND NOT EXISTS (SELECT 1 FROM subcategories s JOIN categories c ON s.category_id = c.id WHERE s.name = '${subcategoryName}' AND c.name = '${categoryName}');

`
  })

  // Create temp table for subcategory IDs
  sql += '-- Create temp table for subcategory IDs\n'
  sql += 'CREATE TEMP TABLE temp_subcategory_ids AS \n'
  sql += 'SELECT s.id as subcategory_id, s.name as subcategory_name, c.name as category_name \n'
  sql += 'FROM subcategories s \n'
  sql += 'JOIN categories c ON s.category_id = c.id \n'
  sql += 'WHERE c.name IN (\'Vegetables\', \'Herbs\', \'Flowers\');\n\n'

  // Create base varieties (one per subcategory)
  sql += '-- Create base varieties (prevent duplicates by checking if they exist)\n'
  Object.keys(subcategoryGroups).forEach(subcategoryName => {
    sql += `INSERT INTO varieties (subcategory_id, name, emoji, description) 
SELECT subcategory_id, '${subcategoryName}', '🌱', 'Heirloom ${subcategoryName.toLowerCase()} varieties'
FROM temp_subcategory_ids 
WHERE subcategory_name = '${subcategoryName}'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = '${subcategoryName}' AND s.name = '${subcategoryName}');

`
  })

  // Create temp table for variety IDs
  sql += '-- Create temp table for variety IDs\n'
  sql += 'CREATE TEMP TABLE temp_variety_ids AS \n'
  sql += 'SELECT v.id as variety_id, v.name as variety_name \n'
  sql += 'FROM varieties v \n'
  sql += 'JOIN subcategories s ON v.subcategory_id = s.id \n'
  sql += 'JOIN categories c ON s.category_id = c.id \n'
  sql += 'WHERE c.name IN (\'Vegetables\', \'Herbs\', \'Flowers\');\n\n'

  // Create products directly
  sql += '-- Insert products (using existing products table fields only)\n'
  sql += 'INSERT INTO products (\n'
  sql += '    name,\n'
  sql += '    farm_id,\n'
  sql += '    variety_id,\n'
  sql += '    price,\n'
  sql += '    stock,\n'
  sql += '    freshness,\n'
  sql += '    organic,\n'
  sql += '    in_season,\n'
  sql += '    images\n'
  sql += ') \n'
  sql += 'SELECT \n'
  sql += '    products_data.name,\n'
  sql += '    tf.farm_id,\n'
  sql += '    tv.variety_id,\n'
  sql += '    products_data.price,\n'
  sql += '    products_data.stock,\n'
  sql += '    products_data.freshness,\n'
  sql += '    products_data.organic,\n'
  sql += '    products_data.in_season,\n'
  sql += '    products_data.images\n'
  sql += 'FROM (\n'
  sql += '    VALUES\n'

  const productValues = []
  
  varietiesData.forEach((variety, index) => {
    // Clean up text fields
    const cleanText = (text) => {
      if (!text) return null
      return text.replace(/'/g, "''").replace(/\n/g, ' ').trim()
    }
    
    // Extract numeric price
    let price = 3.50 // default price
    if (variety.price) {
      const priceMatch = variety.price.match(/\$?(\d+\.?\d*)/)
      if (priceMatch) {
        price = parseFloat(priceMatch[1])
      }
    }
    
    // Generate stock level based on availability
    const stock = variety.inStock !== false ? Math.floor(Math.random() * 95) + 5 : 0
    
    // Create images array
    const images = []
    if (variety.imageUrl) {
      images.push(variety.imageUrl)
    }
    
    // Convert images to PostgreSQL array syntax
    const imagesArray = images.length > 0 ? `ARRAY['${images.join("', '")}']` : 'NULL'
    
    // Freshness as integer (0-100)
    const freshness = 95 // Seeds are always fresh when properly stored
    
    const values = [
      `'${cleanText(variety.name)}'`, // name
      `'${variety.subcategory}'`, // subcategory_name for JOIN
      price, // price
      stock, // stock
      freshness, // freshness (integer 0-100)
      `TRUE`, // organic
      `TRUE`, // in_season
      imagesArray // images as PostgreSQL array
    ]
    
    productValues.push(`    (${values.join(', ')})`)
  })

  sql += productValues.join(',\n')
  sql += '\n) AS products_data(name, subcategory_name, price, stock, freshness, organic, in_season, images)\n'
  sql += 'CROSS JOIN temp_farm_id tf\n'
  sql += 'JOIN temp_variety_ids tv ON tv.variety_name = products_data.subcategory_name\n'
  sql += 'WHERE NOT EXISTS (\n'
  sql += '    SELECT 1 FROM products p \n'
  sql += '    WHERE p.name = products_data.name \n'
  sql += '    AND p.farm_id = tf.farm_id \n'
  sql += '    AND p.variety_id = tv.variety_id\n'
  sql += ');\n\n'

  sql += `-- Verification queries
SELECT 'Categories created' as status, count(*) as count FROM categories WHERE name IN ('Vegetables', 'Herbs', 'Flowers');
SELECT 'Subcategories created' as status, count(*) as count FROM subcategories s JOIN categories c ON s.category_id = c.id WHERE c.name IN ('Vegetables', 'Herbs', 'Flowers');
SELECT 'Varieties created' as status, count(*) as count FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id JOIN categories c ON s.category_id = c.id WHERE c.name IN ('Vegetables', 'Herbs', 'Flowers');
SELECT 'Products created' as status, count(*) as count FROM products p JOIN farms f ON p.farm_id = f.id WHERE f.email = 'info@rareseeds.com';

-- Sample query to see the complete hierarchy with products
SELECT 
    c.name as category,
    s.name as subcategory,
    v.name as variety,
    p.name as product,
    p.price,
    p.stock,
    p.organic,
    p.in_season
FROM categories c
JOIN subcategories s ON c.id = s.category_id
JOIN varieties v ON s.id = v.subcategory_id
JOIN products p ON v.id = p.variety_id
JOIN farms f ON p.farm_id = f.id
WHERE f.email = 'info@rareseeds.com'
ORDER BY c.name, s.name, v.name, p.name
LIMIT 20;

-- Check total products by category
SELECT 
    c.name as category,
    COUNT(p.id) as product_count
FROM categories c
JOIN subcategories s ON c.id = s.category_id
JOIN varieties v ON s.id = v.subcategory_id
JOIN products p ON v.id = p.variety_id
JOIN farms f ON p.farm_id = f.id
WHERE f.email = 'info@rareseeds.com'
GROUP BY c.name
ORDER BY product_count DESC;

-- Drop temp tables
DROP TABLE temp_farm_id;
DROP TABLE temp_category_ids;
DROP TABLE temp_subcategory_ids;
DROP TABLE temp_variety_ids;

COMMIT;

-- Final summary
-- Baker Creek import completed using existing schema!
-- Total products imported: ${varietiesData.length}
-- Total categories: ${Object.keys(categoryGroups).length}
-- Total subcategories: ${Object.keys(subcategoryGroups).length}
-- 
-- All data uses proper UUIDs and clean names:
-- - No "baker" prefixes in database
-- - Uses system-generated UUIDs
-- - Products table contains all varieties
-- - Full 3-level hierarchy: Categories → Subcategories → Varieties → Products
-- 
-- Sample products you can now search for:
-- - Cherokee Purple (Tomato variety)
-- - Genovese (Basil variety)
-- - Dragon Tongue Bush (Bean variety)
-- - Little Gem (Lettuce variety)
`

  return sql
}

// Generate the SQL
const sql = generateCleanImport()

// Write to file
fs.writeFileSync('./scripts/13-baker-creek-clean-import.sql', sql)

console.log('✅ Clean Baker Creek import script generated!')
console.log('📄 File: scripts/13-baker-creek-clean-import.sql')
console.log(`📊 Contains ${varietiesData.length} products across ${Object.keys(varietiesData.reduce((acc, v) => ({ ...acc, [v.subcategory]: true }), {})).length} subcategories`)
console.log('')
console.log('🚀 To import into your database:')
console.log('1. Go to your Supabase dashboard')
console.log('2. Open the SQL Editor')
console.log('3. Copy and paste the entire script')
console.log('4. Click "Run" to execute')
console.log('')
console.log('✨ This script:')
console.log('- Uses proper UUIDs for all IDs')
console.log('- No "baker" prefixes anywhere')
console.log('- Uses clean, descriptive names')
console.log('- Handles all foreign key relationships properly')
console.log('- Includes temp tables for proper UUID resolution')
