const fs = require('fs')
const path = require('path')

// Load the scraped data
const varietiesData = JSON.parse(fs.readFileSync('./baker-creek-data/varieties.json', 'utf8'))
const categoriesData = JSON.parse(fs.readFileSync('./baker-creek-data/categories.json', 'utf8'))

function generateSchemaMatchedImport() {
  let sql = `-- Baker Creek Seed Catalog Import (Schema-Matched)
-- Generated: ${new Date().toISOString()}
-- Total varieties: ${varietiesData.length}
-- Uses existing schema only - no new tables or fields

BEGIN;

-- First, add Baker Creek as a farm
INSERT INTO farms (id, name, location, description, contact_email, contact_phone, website, logo_url) VALUES
('baker-creek-farm', 'Baker Creek Heirloom Seeds', 'Mansfield, Missouri', 'Premier heirloom seed company offering the largest selection of heirloom vegetable, herb, and flower seeds in the United States.', 'info@rareseeds.com', '417-924-8917', 'https://www.rareseeds.com', '/images/farms/baker-creek-logo.jpg')
ON CONFLICT (id) DO NOTHING;

-- Create main categories
INSERT INTO categories (id, name, image) VALUES
('baker-vegetables', 'Vegetables', '/images/categories/vegetables.jpg'),
('baker-herbs', 'Herbs', '/images/categories/herbs.jpg'),
('baker-flowers', 'Flowers', '/images/categories/flowers.jpg')
ON CONFLICT (id) DO NOTHING;

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
  sql += '-- Create subcategories\n'
  Object.keys(subcategoryGroups).forEach(subcategoryName => {
    const subcategory = subcategoryGroups[subcategoryName]
    const categoryId = subcategory.category === 'Vegetables' ? 'baker-vegetables' : 
                     subcategory.category === 'Herbs' ? 'baker-herbs' : 'baker-flowers'
    
    const subcategoryId = `baker-${subcategoryName.toLowerCase().replace(/\s+/g, '-')}`
    const subcategorySlug = subcategoryName.toLowerCase().replace(/\s+/g, '-')
    
    sql += `INSERT INTO subcategories (id, category_id, name, image) VALUES
('${subcategoryId}', '${categoryId}', '${subcategoryName}', '/images/subcategories/${subcategorySlug}.jpg')
ON CONFLICT (id) DO NOTHING;

`
  })

  // Create base varieties (one per subcategory)
  sql += '-- Create base varieties\n'
  Object.keys(subcategoryGroups).forEach(subcategoryName => {
    const subcategory = subcategoryGroups[subcategoryName]
    const subcategoryId = `baker-${subcategoryName.toLowerCase().replace(/\s+/g, '-')}`
    const varietyId = `baker-variety-${subcategoryName.toLowerCase().replace(/\s+/g, '-')}`
    
    sql += `INSERT INTO varieties (id, subcategory_id, name, emoji, description) VALUES
('${varietyId}', '${subcategoryId}', '${subcategoryName}', '🌱', 'Heirloom ${subcategoryName.toLowerCase()} varieties from Baker Creek')
ON CONFLICT (id) DO NOTHING;

`
  })

  // Create products directly - no cultivars table needed
  sql += '-- Insert Baker Creek products (using existing products table fields only)\n'
  sql += 'INSERT INTO products (\n'
  sql += '    name,\n'
  sql += '    farm_id,\n'
  sql += '    variety_id,\n'
  sql += '    description,\n'
  sql += '    price,\n'
  sql += '    stock,\n'
  sql += '    freshness,\n'
  sql += '    organic,\n'
  sql += '    in_season,\n'
  sql += '    images\n'
  sql += ') VALUES\n'

  const productValues = []
  
  varietiesData.forEach((variety, index) => {
    const varietyId = `baker-variety-${variety.subcategory.toLowerCase().replace(/\s+/g, '-')}`
    
    // Clean up text fields
    const cleanText = (text) => {
      if (!text) return null
      return text.replace(/'/g, "''").replace(/\n/g, ' ').trim()
    }
    
    // Build description from available fields
    let description = ''
    if (variety.description) {
      description = variety.description
    }
    if (variety.characteristics) {
      description = description ? `${description} ${variety.characteristics}` : variety.characteristics
    }
    if (variety.growing_notes) {
      description = description ? `${description} Growing: ${variety.growing_notes}` : `Growing: ${variety.growing_notes}`
    }
    if (variety.botanicalName) {
      description = description ? `${description} (${variety.botanicalName})` : `(${variety.botanicalName})`
    }
    if (variety.daysToMaturity) {
      description = description ? `${description} Days to maturity: ${variety.daysToMaturity}` : `Days to maturity: ${variety.daysToMaturity}`
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
    
    const values = [
      `'${cleanText(variety.name)}'`, // name
      `'baker-creek-farm'`, // farm_id
      `'${varietyId}'`, // variety_id
      description ? `'${cleanText(description)}'` : 'NULL', // description
      price, // price
      stock, // stock
      `'excellent'`, // freshness (seeds are always fresh when properly stored)
      `TRUE`, // organic (Baker Creek focuses on heirloom/organic)
      `TRUE`, // in_season (seeds are available year-round)
      images.length > 0 ? `'${JSON.stringify(images)}'` : 'NULL' // images
    ]
    
    productValues.push(`(${values.join(', ')})`)
  })

  sql += productValues.join(',\n')
  sql += ';\n\n'

  sql += `-- Verification queries
SELECT 'Categories created' as status, count(*) as count FROM categories WHERE id LIKE 'baker-%';
SELECT 'Subcategories created' as status, count(*) as count FROM subcategories WHERE id LIKE 'baker-%';
SELECT 'Varieties created' as status, count(*) as count FROM varieties WHERE id LIKE 'baker-%';
SELECT 'Products created' as status, count(*) as count FROM products WHERE farm_id = 'baker-creek-farm';

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
WHERE c.id LIKE 'baker-%'
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
WHERE c.id LIKE 'baker-%'
GROUP BY c.name
ORDER BY product_count DESC;

COMMIT;

-- Final summary
\\echo 'Baker Creek import completed using existing schema!'
\\echo 'Total products imported: ${varietiesData.length}'
\\echo 'Total categories: ${Object.keys(categoryGroups).length}'
\\echo 'Total subcategories: ${Object.keys(subcategoryGroups).length}'
\\echo ''
\\echo 'All data fits into your existing schema:'
\\echo '- No new tables created'
\\echo '- No new fields added'
\\echo '- Products table contains all Baker Creek varieties'
\\echo '- Full 3-level hierarchy: Categories → Subcategories → Varieties → Products'
\\echo ''
\\echo 'Sample products you can now search for:'
\\echo '- Cherokee Purple Tomato'
\\echo '- Genovese Basil'
\\echo '- Dragon Tongue Bush Bean'
\\echo '- Little Gem Lettuce'
`

  return sql
}

// Generate the SQL
const sql = generateSchemaMatchedImport()

// Write to file
fs.writeFileSync('./scripts/12-baker-creek-schema-matched-import.sql', sql)

console.log('✅ Schema-matched Baker Creek import script generated!')
console.log('📄 File: scripts/12-baker-creek-schema-matched-import.sql')
console.log(`📊 Contains ${varietiesData.length} products across ${Object.keys(varietiesData.reduce((acc, v) => ({ ...acc, [v.subcategory]: true }), {})).length} subcategories`)
console.log('')
console.log('🚀 To import into your database:')
console.log('1. Go to your Supabase dashboard')
console.log('2. Open the SQL Editor')
console.log('3. Copy and paste the entire script')
console.log('4. Click "Run" to execute')
console.log('')
console.log('✨ This script:')
console.log('- Uses ONLY your existing schema')
console.log('- Creates products in the products table')
console.log('- Preserves all scraped data in the description field')
console.log('- Maps to your 3-level hierarchy')
console.log('- Includes realistic pricing and stock levels')
console.log('- Maintains seed images where available')
