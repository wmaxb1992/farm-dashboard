const fs = require('fs')
const path = require('path')

// Load the scraped data
const varietiesData = JSON.parse(fs.readFileSync('./baker-creek-data/varieties.json', 'utf8'))
const categoriesData = JSON.parse(fs.readFileSync('./baker-creek-data/categories.json', 'utf8'))

function generateMasterCatalog() {
  let sql = `-- Master Catalog Import from Baker Creek Data
-- Generated: ${new Date().toISOString()}
-- Total varieties: ${varietiesData.length}
-- Creates searchable master catalog for ALL farms to reference
-- NO farm-specific products - just the master variety catalog

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

  // Create subcategories (master catalog)
  sql += '-- Create subcategories (master catalog - prevent duplicates)\n'
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

  // Create individual varieties (master catalog) - ONE PER ACTUAL VARIETY
  sql += '-- Create individual varieties (master catalog - each Baker Creek variety becomes a master variety)\n'
  
  const varietyInserts = []
  
  varietiesData.forEach((variety, index) => {
    // Clean up text fields
    const cleanText = (text) => {
      if (!text) return null
      return text.replace(/'/g, "''").replace(/\n/g, ' ').trim()
    }
    
    // Build comprehensive description from all available fields
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
    if (variety.plantSpacing) {
      description = description ? `${description} Plant spacing: ${variety.plantSpacing}` : `Plant spacing: ${variety.plantSpacing}`
    }
    if (variety.seedDepth) {
      description = description ? `${description} Seed depth: ${variety.seedDepth}` : `Seed depth: ${variety.seedDepth}`
    }
    if (variety.sunRequirements) {
      description = description ? `${description} Sun: ${variety.sunRequirements}` : `Sun: ${variety.sunRequirements}`
    }
    
    // Create nutritional info JSON
    const nutritionalInfo = {
      botanical_name: variety.botanicalName || null,
      days_to_maturity: variety.daysToMaturity || null,
      plant_spacing: variety.plantSpacing || null,
      seed_depth: variety.seedDepth || null,
      sun_requirements: variety.sunRequirements || null,
      frost_hardy: variety.frostHardy || null
    }
    
    // Create taste profile JSON (if available)
    const tasteProfile = {
      rating: variety.rating || null,
      characteristics: variety.characteristics || null
    }
    
    // Create culinary uses array
    const culinaryUses = []
    if (variety.subcategory === 'Herbs') {
      culinaryUses.push('seasoning', 'cooking', 'tea')
    } else if (variety.subcategory === 'Tomatoes') {
      culinaryUses.push('fresh', 'sauce', 'salad')
    } else if (variety.subcategory === 'Lettuce') {
      culinaryUses.push('salad', 'fresh', 'sandwich')
    } else {
      culinaryUses.push('fresh', 'cooking')
    }
    
    const varietyInsert = `INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, '${cleanText(variety.name)}', '🌱', '${cleanText(description)}', '${JSON.stringify(nutritionalInfo)}', '${JSON.stringify(tasteProfile)}', ARRAY['${culinaryUses.join("', '")}']
FROM temp_subcategory_ids 
WHERE subcategory_name = '${variety.subcategory}'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = '${cleanText(variety.name)}' AND s.name = '${variety.subcategory}');`
    
    varietyInserts.push(varietyInsert)
  })
  
  sql += varietyInserts.join('\n\n')
  sql += '\n\n'

  sql += `-- Verification queries for master catalog
SELECT 'Master Categories' as type, count(*) as count FROM categories WHERE name IN ('Vegetables', 'Herbs', 'Flowers');
SELECT 'Master Subcategories' as type, count(*) as count FROM subcategories s JOIN categories c ON s.category_id = c.id WHERE c.name IN ('Vegetables', 'Herbs', 'Flowers');
SELECT 'Master Varieties' as type, count(*) as count FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id JOIN categories c ON s.category_id = c.id WHERE c.name IN ('Vegetables', 'Herbs', 'Flowers');

-- Sample master catalog entries
SELECT 
    c.name as category,
    s.name as subcategory,
    v.name as variety,
    v.emoji,
    LENGTH(v.description) as description_length,
    v.nutritional_info->>'botanical_name' as botanical_name,
    v.nutritional_info->>'days_to_maturity' as days_to_maturity,
    v.culinary_uses
FROM categories c
JOIN subcategories s ON c.id = s.category_id
JOIN varieties v ON s.id = v.subcategory_id
WHERE c.name IN ('Vegetables', 'Herbs', 'Flowers')
ORDER BY c.name, s.name, v.name
LIMIT 20;

-- Drop temp tables
DROP TABLE temp_category_ids;
DROP TABLE temp_subcategory_ids;

COMMIT;

-- Final summary
-- Master catalog created successfully!
-- Total varieties imported: ${varietiesData.length}
-- Total categories: ${Object.keys(categoryGroups).length}
-- Total subcategories: ${Object.keys(subcategoryGroups).length}
-- 
-- This master catalog can now be searched by ALL farms when adding products
-- Each farm can reference these varieties in their products table
-- 
-- Next steps for farms:
-- 1. Search the master catalog (varieties table) via Elasticsearch
-- 2. Reference variety_id when creating products
-- 3. Add farm-specific data (price, stock, harvest_date, etc.)
-- 
-- Famous varieties now available in master catalog:
-- - Cherokee Purple (Tomatoes)
-- - Genovese (Basil)
-- - Dragon Tongue Bush (Beans)
-- - Black Krim (Tomatoes)
-- - Brandywine (Tomatoes)
-- - Glass Gem (Corn)
-- - And ${varietiesData.length - 6} more varieties!
`

  return sql
}

// Generate the SQL
const sql = generateMasterCatalog()

// Write to file
fs.writeFileSync('./scripts/14-master-catalog-import.sql', sql)

console.log('✅ Master catalog import script generated!')
console.log('📄 File: scripts/14-master-catalog-import.sql')
console.log(`📊 Contains ${varietiesData.length} varieties across ${Object.keys(varietiesData.reduce((acc, v) => ({ ...acc, [v.subcategory]: true }), {})).length} subcategories`)
console.log('')
console.log('🎯 Purpose: Creates searchable master catalog for ALL farms')
console.log('🔍 Elasticsearch ready: All varieties with rich metadata')
console.log('🏪 Farm workflow: Search master catalog → Reference variety_id → Add farm-specific data')
console.log('')
console.log('📋 Master catalog includes:')
console.log('- Categories (Vegetables, Herbs, Flowers)')
console.log('- Subcategories (Tomatoes, Basil, Beans, etc.)')
console.log('- Individual varieties (Cherokee Purple, Genovese, etc.)')
console.log('- Rich metadata (botanical names, growing info, nutrition)')
console.log('- Searchable descriptions and culinary uses')
console.log('')
console.log('🚀 Next: Any farm can now search this catalog when adding products!')
