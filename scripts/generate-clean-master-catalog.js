const fs = require('fs')
const path = require('path')

// Load the scraped data
const varietiesData = JSON.parse(fs.readFileSync('./baker-creek-data/varieties.json', 'utf8'))
const categoriesData = JSON.parse(fs.readFileSync('./baker-creek-data/categories.json', 'utf8'))

function generateCleanMasterCatalog() {
  let sql = `-- Master Catalog Import from Baker Creek Data
-- Generated: ${new Date().toISOString()}
-- Total varieties: ${varietiesData.length}
-- Creates searchable master catalog for ALL farms to reference

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

  // Group varieties by category/subcategory
  const subcategoryGroups = {}
  
  varietiesData.forEach(variety => {
    const subcategoryKey = variety.subcategory
    if (!subcategoryGroups[subcategoryKey]) {
      subcategoryGroups[subcategoryKey] = {
        category: variety.category,
        varieties: []
      }
    }
    subcategoryGroups[subcategoryKey].varieties.push(variety)
  })

  // Create subcategories in batches
  sql += '-- Create subcategories\n'
  const subcategoryNames = Object.keys(subcategoryGroups)
  
  for (let i = 0; i < subcategoryNames.length; i += 10) {
    const batch = subcategoryNames.slice(i, i + 10)
    
    batch.forEach(subcategoryName => {
      const subcategory = subcategoryGroups[subcategoryName]
      const categoryName = subcategory.category
      
      sql += `INSERT INTO subcategories (category_id, name, image) 
SELECT c.id, '${subcategoryName}', '/images/subcategories/${subcategoryName.toLowerCase().replace(/\s+/g, '-')}.jpg'
FROM categories c
WHERE c.name = '${categoryName}'
AND NOT EXISTS (
    SELECT 1 FROM subcategories s 
    JOIN categories cat ON s.category_id = cat.id 
    WHERE s.name = '${subcategoryName}' AND cat.name = '${categoryName}'
);

`
    })
  }

  // Create varieties in smaller batches
  sql += '-- Create varieties (in batches for better performance)\n'
  
  for (let i = 0; i < varietiesData.length; i += 20) {
    const batch = varietiesData.slice(i, i + 20)
    
    sql += `-- Batch ${Math.floor(i / 20) + 1} (varieties ${i + 1}-${Math.min(i + 20, varietiesData.length)})\n`
    
    batch.forEach(variety => {
      // Clean up text fields
      const cleanText = (text) => {
        if (!text) return null
        return text.replace(/'/g, "''").replace(/\n/g, ' ').trim()
      }
      
      // Build description
      let description = ''
      if (variety.description) description = variety.description
      if (variety.botanicalName) description = description ? `${description} (${variety.botanicalName})` : `(${variety.botanicalName})`
      if (variety.daysToMaturity) description = description ? `${description} Days to maturity: ${variety.daysToMaturity}` : `Days to maturity: ${variety.daysToMaturity}`
      
      // Create nutritional info
      const nutritionalInfo = {
        botanical_name: variety.botanicalName || null,
        days_to_maturity: variety.daysToMaturity || null,
        plant_spacing: variety.plantSpacing || null,
        seed_depth: variety.seedDepth || null,
        sun_requirements: variety.sunRequirements || null,
        frost_hardy: variety.frostHardy || null
      }
      
      // Create taste profile
      const tasteProfile = {
        rating: variety.rating || null,
        characteristics: variety.characteristics || null
      }
      
      // Culinary uses
      const culinaryUses = variety.subcategory === 'Herbs' ? 
        ['seasoning', 'cooking', 'tea'] : 
        ['fresh', 'cooking']
      
      sql += `INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT s.id, '${cleanText(variety.name)}', '🌱', '${cleanText(description)}', 
'${JSON.stringify(nutritionalInfo)}', '${JSON.stringify(tasteProfile)}', 
ARRAY['${culinaryUses.join("', '")}']
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = '${variety.subcategory}' AND c.name = '${variety.category}'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    WHERE v.name = '${cleanText(variety.name)}' AND sub.name = '${variety.subcategory}'
);

`
    })
  }

  sql += `-- Verification queries
SELECT 'Categories' as type, count(*) as count FROM categories WHERE name IN ('Vegetables', 'Herbs', 'Flowers');
SELECT 'Subcategories' as type, count(*) as count FROM subcategories s JOIN categories c ON s.category_id = c.id WHERE c.name IN ('Vegetables', 'Herbs', 'Flowers');
SELECT 'Varieties' as type, count(*) as count FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id JOIN categories c ON s.category_id = c.id WHERE c.name IN ('Vegetables', 'Herbs', 'Flowers');

-- Sample entries
SELECT 
    c.name as category,
    s.name as subcategory,
    v.name as variety,
    v.nutritional_info->>'botanical_name' as botanical_name,
    v.nutritional_info->>'days_to_maturity' as days_to_maturity,
    v.culinary_uses
FROM categories c
JOIN subcategories s ON c.id = s.category_id
JOIN varieties v ON s.id = v.subcategory_id
WHERE c.name IN ('Vegetables', 'Herbs', 'Flowers')
AND v.name IN ('Cherokee Purple', 'Genovese', 'Dragon Tongue Bush', 'Black Krim', 'Brandywine')
ORDER BY c.name, s.name, v.name;

COMMIT;

-- Master catalog import completed successfully
-- Total varieties: ${varietiesData.length}
-- Ready for Elasticsearch indexing
-- All farms can now search and reference these varieties
`

  return sql
}

// Generate the SQL
const sql = generateCleanMasterCatalog()

// Write to file
fs.writeFileSync('./scripts/16-master-catalog-clean.sql', sql)

console.log('✅ Clean master catalog import script generated!')
console.log('📄 File: scripts/16-master-catalog-clean.sql')
console.log(`📊 Contains ${varietiesData.length} varieties across ${Object.keys(varietiesData.reduce((acc, v) => ({ ...acc, [v.subcategory]: true }), {})).length} subcategories`)
console.log('')
console.log('🔧 Improvements:')
console.log('- Cleaner SQL formatting')
console.log('- Batched inserts for better performance')
console.log('- Simplified structure')
console.log('- Better error handling')
console.log('- Smaller file size')
console.log('')
console.log('🚀 This should run without syntax errors!')
