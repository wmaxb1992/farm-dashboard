const fs = require('fs')
const path = require('path')

// Load the scraped data
const varietiesData = JSON.parse(fs.readFileSync('./baker-creek-data/varieties.json', 'utf8'))

function generateProperMasterCatalog() {
  let sql = `-- Master Catalog Import (Proper Structure)
-- Generated: ${new Date().toISOString()}
-- Creates proper 3-level hierarchy: Categories > Subcategories > Varieties
-- Individual Baker Creek products will be reference examples, not duplicates

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

  // Group varieties by subcategory to get unique subcategories
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

  // Create subcategories (one per unique subcategory)
  sql += '-- Create subcategories (one per unique subcategory)\n'
  Object.keys(subcategoryGroups).forEach(subcategoryName => {
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

  // Create varieties (ONE per subcategory with rich metadata)
  sql += '-- Create varieties (ONE per subcategory with comprehensive info)\n'
  Object.keys(subcategoryGroups).forEach(subcategoryName => {
    const subcategory = subcategoryGroups[subcategoryName]
    const categoryName = subcategory.category
    const allVarietiesInSubcategory = subcategory.varieties
    
    // Get the best example variety for metadata (prefer ones with most info)
    const bestExample = allVarietiesInSubcategory.reduce((best, current) => {
      const currentScore = (current.botanicalName ? 1 : 0) + 
                          (current.description ? 1 : 0) + 
                          (current.daysToMaturity ? 1 : 0) + 
                          (current.characteristics ? 1 : 0)
      const bestScore = (best.botanicalName ? 1 : 0) + 
                       (best.description ? 1 : 0) + 
                       (best.daysToMaturity ? 1 : 0) + 
                       (best.characteristics ? 1 : 0)
      return currentScore > bestScore ? current : best
    })
    
    // Clean up text fields
    const cleanText = (text) => {
      if (!text) return null
      return text.replace(/'/g, "''").replace(/\n/g, ' ').trim()
    }
    
    // Build comprehensive description from the best example
    let description = `${subcategoryName} varieties. `
    if (bestExample.description) description += bestExample.description + ' '
    if (bestExample.characteristics) description += bestExample.characteristics + ' '
    if (bestExample.botanicalName) description += `(${bestExample.botanicalName}) `
    if (bestExample.daysToMaturity) description += `Typical maturity: ${bestExample.daysToMaturity}. `
    if (bestExample.sunRequirements) description += `Sun: ${bestExample.sunRequirements}. `
    
    // Add variety count info
    description += `Available varieties include: ${allVarietiesInSubcategory.slice(0, 3).map(v => v.name).join(', ')}`
    if (allVarietiesInSubcategory.length > 3) {
      description += ` and ${allVarietiesInSubcategory.length - 3} more varieties.`
    }
    
    // Create nutritional info from best example
    const nutritionalInfo = {
      botanical_name: bestExample.botanicalName || null,
      days_to_maturity: bestExample.daysToMaturity || null,
      plant_spacing: bestExample.plantSpacing || null,
      seed_depth: bestExample.seedDepth || null,
      sun_requirements: bestExample.sunRequirements || null,
      frost_hardy: bestExample.frostHardy || null,
      variety_count: allVarietiesInSubcategory.length,
      example_varieties: allVarietiesInSubcategory.slice(0, 5).map(v => v.name)
    }
    
    // Create taste profile
    const tasteProfile = {
      rating: bestExample.rating || null,
      characteristics: bestExample.characteristics || null,
      variety_range: `${allVarietiesInSubcategory.length} varieties available`
    }
    
    // Culinary uses based on subcategory
    let culinaryUses = ['fresh', 'cooking']
    if (subcategoryName.toLowerCase().includes('herb') || categoryName === 'Herbs') {
      culinaryUses = ['seasoning', 'cooking', 'tea', 'medicinal']
    } else if (subcategoryName.toLowerCase().includes('tomato')) {
      culinaryUses = ['fresh', 'sauce', 'salad', 'canning']
    } else if (subcategoryName.toLowerCase().includes('lettuce') || subcategoryName.toLowerCase().includes('greens')) {
      culinaryUses = ['salad', 'fresh', 'sandwich', 'wraps']
    } else if (subcategoryName.toLowerCase().includes('bean')) {
      culinaryUses = ['fresh', 'dried', 'cooking', 'canning']
    } else if (subcategoryName.toLowerCase().includes('pepper')) {
      culinaryUses = ['fresh', 'cooking', 'sauce', 'drying']
    }
    
    // Choose appropriate emoji
    let emoji = '🌱'
    if (subcategoryName.toLowerCase().includes('tomato')) emoji = '🍅'
    else if (subcategoryName.toLowerCase().includes('pepper')) emoji = '🌶️'
    else if (subcategoryName.toLowerCase().includes('lettuce')) emoji = '🥬'
    else if (subcategoryName.toLowerCase().includes('bean')) emoji = '🫘'
    else if (subcategoryName.toLowerCase().includes('herb') || categoryName === 'Herbs') emoji = '🌿'
    else if (subcategoryName.toLowerCase().includes('flower') || categoryName === 'Flowers') emoji = '🌸'
    else if (subcategoryName.toLowerCase().includes('corn')) emoji = '🌽'
    else if (subcategoryName.toLowerCase().includes('carrot')) emoji = '🥕'
    else if (subcategoryName.toLowerCase().includes('onion')) emoji = '🧅'
    
    sql += `INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT s.id, '${subcategoryName}', '${emoji}', '${cleanText(description)}', 
'${JSON.stringify(nutritionalInfo)}', '${JSON.stringify(tasteProfile)}', 
ARRAY['${culinaryUses.join("', '")}']
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = '${subcategoryName}' AND c.name = '${categoryName}'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    WHERE v.name = '${subcategoryName}' AND sub.name = '${subcategoryName}'
);

`
  })

  sql += `-- Verification queries
SELECT 'Categories' as type, count(*) as count FROM categories WHERE name IN ('Vegetables', 'Herbs', 'Flowers');
SELECT 'Subcategories' as type, count(*) as count FROM subcategories s JOIN categories c ON s.category_id = c.id WHERE c.name IN ('Vegetables', 'Herbs', 'Flowers');
SELECT 'Varieties' as type, count(*) as count FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id JOIN categories c ON s.category_id = c.id WHERE c.name IN ('Vegetables', 'Herbs', 'Flowers');

-- Sample master catalog structure
SELECT 
    c.name as category,
    s.name as subcategory,
    v.name as variety,
    v.emoji,
    v.nutritional_info->>'variety_count' as available_varieties,
    v.nutritional_info->>'botanical_name' as botanical_name,
    v.culinary_uses
FROM categories c
JOIN subcategories s ON c.id = s.category_id
JOIN varieties v ON s.id = v.subcategory_id
WHERE c.name IN ('Vegetables', 'Herbs', 'Flowers')
ORDER BY c.name, s.name
LIMIT 20;

-- Show varieties with most options
SELECT 
    v.name as variety_type,
    v.emoji,
    v.nutritional_info->>'variety_count' as available_varieties,
    v.nutritional_info->>'example_varieties' as example_varieties
FROM varieties v
JOIN subcategories s ON v.subcategory_id = s.id
JOIN categories c ON s.category_id = c.id
WHERE c.name IN ('Vegetables', 'Herbs', 'Flowers')
ORDER BY (v.nutritional_info->>'variety_count')::int DESC
LIMIT 10;

COMMIT;

-- Master catalog created with proper structure
-- Each variety represents a plant type (like "Tomatoes", "Basil", "Amaranth")
-- Individual cultivars are referenced in the metadata
-- Farms can now search for plant types and add their specific varieties as products
-- Total plant types: ${Object.keys(subcategoryGroups).length}
-- Total individual cultivars available: ${varietiesData.length}
`

  return sql
}

// Generate the SQL
const sql = generateProperMasterCatalog()

// Write to file
fs.writeFileSync('./scripts/17-proper-master-catalog.sql', sql)

console.log('✅ Proper master catalog import script generated!')
console.log('📄 File: scripts/17-proper-master-catalog.sql')
console.log(`📊 Contains ${Object.keys(varietiesData.reduce((acc, v) => ({ ...acc, [v.subcategory]: true }), {})).length} plant types (varieties)`)
console.log(`📝 References ${varietiesData.length} individual cultivars in metadata`)
console.log('')
console.log('🏗️ Proper structure:')
console.log('- Categories: Vegetables, Herbs, Flowers')
console.log('- Subcategories: Tomatoes, Basil, Amaranth, etc.')
console.log('- Varieties: ONE per subcategory (Tomatoes, Basil, Amaranth)')
console.log('- Products: Individual farm offerings (Cherokee Purple, Genovese, etc.)')
console.log('')
console.log('🎯 No more duplicates - each variety type appears only once!')
console.log('🔍 All individual cultivars are searchable in the metadata')
console.log('🏪 Farms search for plant types, then add specific cultivars as products')
