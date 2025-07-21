const fs = require('fs')
const path = require('path')

// Load the scraped data
const varietiesData = JSON.parse(fs.readFileSync('./baker-creek-data/varieties.json', 'utf8'))
const categoriesData = JSON.parse(fs.readFileSync('./baker-creek-data/categories.json', 'utf8'))

function generateComprehensiveImport() {
  let sql = `-- Comprehensive Baker Creek Seed Catalog Import
-- Generated: ${new Date().toISOString()}
-- Total varieties: ${varietiesData.length}
-- Total categories: ${categoriesData.length}

BEGIN;

-- First, create the cultivars table if it doesn't exist
CREATE TABLE IF NOT EXISTS cultivars (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    variety_id UUID REFERENCES varieties(id) ON DELETE CASCADE,
    name VARCHAR(255) NOT NULL,
    common_name VARCHAR(255),
    description TEXT,
    characteristics TEXT,
    growing_notes TEXT,
    botanical_name VARCHAR(255),
    days_to_maturity INTEGER,
    plant_spacing VARCHAR(50),
    seed_depth VARCHAR(50),
    germination_days VARCHAR(50),
    sun_requirements VARCHAR(100),
    frost_hardy BOOLEAN DEFAULT FALSE,
    image_url TEXT,
    source_url TEXT,
    rating DECIMAL(3,2),
    review_count INTEGER,
    price VARCHAR(20),
    sku VARCHAR(50),
    in_stock BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    
    -- Ensure unique cultivar names per variety
    UNIQUE(variety_id, name)
);

-- Add cultivar support to products table
ALTER TABLE products 
ADD COLUMN IF NOT EXISTS cultivar_id UUID REFERENCES cultivars(id),
ADD COLUMN IF NOT EXISTS cultivar_name VARCHAR(255);

-- Create indexes for performance
CREATE INDEX IF NOT EXISTS idx_cultivars_variety_id ON cultivars(variety_id);
CREATE INDEX IF NOT EXISTS idx_cultivars_name ON cultivars(name);
CREATE INDEX IF NOT EXISTS idx_products_cultivar_id ON products(cultivar_id);

-- Ensure we have the main categories
INSERT INTO categories (id, name, image) VALUES
('baker-vegetables', 'Vegetables', '/images/categories/vegetables.jpg'),
('baker-herbs', 'Herbs', '/images/categories/herbs.jpg'),
('baker-flowers', 'Flowers', '/images/categories/flowers.jpg')
ON CONFLICT (id) DO NOTHING;

-- Create subcategories for each Baker Creek category
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
  sql += '\n-- Create subcategories\n'
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
  sql += '\n-- Create base varieties\n'
  Object.keys(subcategoryGroups).forEach(subcategoryName => {
    const subcategory = subcategoryGroups[subcategoryName]
    const subcategoryId = `baker-${subcategoryName.toLowerCase().replace(/\s+/g, '-')}`
    const varietyId = `baker-variety-${subcategoryName.toLowerCase().replace(/\s+/g, '-')}`
    
    sql += `INSERT INTO varieties (id, subcategory_id, name, emoji, description) VALUES
('${varietyId}', '${subcategoryId}', '${subcategoryName}', '🌱', 'Heirloom ${subcategoryName.toLowerCase()} varieties from Baker Creek')
ON CONFLICT (id) DO NOTHING;

`
  })

  // Create cultivars
  sql += '\n-- Insert Baker Creek cultivars\n'
  sql += 'INSERT INTO cultivars (\n'
  sql += '    variety_id,\n'
  sql += '    name,\n'
  sql += '    common_name,\n'
  sql += '    description,\n'
  sql += '    characteristics,\n'
  sql += '    growing_notes,\n'
  sql += '    botanical_name,\n'
  sql += '    days_to_maturity,\n'
  sql += '    plant_spacing,\n'
  sql += '    seed_depth,\n'
  sql += '    germination_days,\n'
  sql += '    sun_requirements,\n'
  sql += '    frost_hardy,\n'
  sql += '    image_url,\n'
  sql += '    source_url,\n'
  sql += '    rating,\n'
  sql += '    review_count,\n'
  sql += '    price,\n'
  sql += '    sku,\n'
  sql += '    in_stock\n'
  sql += ') VALUES\n'

  const cultivarValues = []
  
  varietiesData.forEach((variety, index) => {
    const varietyId = `baker-variety-${variety.subcategory.toLowerCase().replace(/\s+/g, '-')}`
    
    // Extract days to maturity as integer
    let daysToMaturity = null
    if (variety.daysToMaturity) {
      const match = variety.daysToMaturity.match(/(\d+)/)
      if (match) {
        daysToMaturity = parseInt(match[1])
      }
    }
    
    // Clean up text fields
    const cleanText = (text) => {
      if (!text) return null
      return text.replace(/'/g, "''").replace(/\n/g, ' ').trim()
    }
    
    const values = [
      `'${varietyId}'`, // variety_id
      `'${cleanText(variety.name)}'`, // name
      `'${cleanText(variety.name)}'`, // common_name (same as name for now)
      variety.description ? `'${cleanText(variety.description)}'` : 'NULL', // description
      variety.characteristics ? `'${cleanText(variety.characteristics)}'` : 'NULL', // characteristics
      variety.growing_notes ? `'${cleanText(variety.growing_notes)}'` : 'NULL', // growing_notes
      variety.botanicalName ? `'${cleanText(variety.botanicalName)}'` : 'NULL', // botanical_name
      daysToMaturity || 'NULL', // days_to_maturity
      variety.plantSpacing ? `'${cleanText(variety.plantSpacing)}'` : 'NULL', // plant_spacing
      variety.seedDepth ? `'${cleanText(variety.seedDepth)}'` : 'NULL', // seed_depth
      variety.sproutDays ? `'${cleanText(variety.sproutDays)}'` : 'NULL', // germination_days
      variety.sunRequirements ? `'${cleanText(variety.sunRequirements)}'` : 'NULL', // sun_requirements
      variety.frostHardy !== undefined ? variety.frostHardy : 'NULL', // frost_hardy
      variety.imageUrl ? `'${variety.imageUrl}'` : 'NULL', // image_url
      variety.url ? `'${variety.url}'` : 'NULL', // source_url
      variety.rating || 'NULL', // rating
      variety.reviewCount || 'NULL', // review_count
      variety.price ? `'${variety.price}'` : 'NULL', // price
      variety.sku ? `'${variety.sku}'` : 'NULL', // sku
      variety.inStock !== undefined ? variety.inStock : 'TRUE' // in_stock
    ]
    
    cultivarValues.push(`(${values.join(', ')})`)
  })

  sql += cultivarValues.join(',\n')
  sql += '\nON CONFLICT (variety_id, name) DO UPDATE SET\n'
  sql += '    description = EXCLUDED.description,\n'
  sql += '    botanical_name = EXCLUDED.botanical_name,\n'
  sql += '    days_to_maturity = EXCLUDED.days_to_maturity,\n'
  sql += '    plant_spacing = EXCLUDED.plant_spacing,\n'
  sql += '    seed_depth = EXCLUDED.seed_depth,\n'
  sql += '    sun_requirements = EXCLUDED.sun_requirements,\n'
  sql += '    frost_hardy = EXCLUDED.frost_hardy,\n'
  sql += '    image_url = EXCLUDED.image_url,\n'
  sql += '    source_url = EXCLUDED.source_url,\n'
  sql += '    rating = EXCLUDED.rating,\n'
  sql += '    review_count = EXCLUDED.review_count,\n'
  sql += '    price = EXCLUDED.price,\n'
  sql += '    sku = EXCLUDED.sku,\n'
  sql += '    in_stock = EXCLUDED.in_stock,\n'
  sql += '    updated_at = NOW();\n\n'

  sql += `-- Verification queries
SELECT 'Categories created' as status, count(*) as count FROM categories WHERE id LIKE 'baker-%';
SELECT 'Subcategories created' as status, count(*) as count FROM subcategories WHERE id LIKE 'baker-%';
SELECT 'Varieties created' as status, count(*) as count FROM varieties WHERE id LIKE 'baker-%';
SELECT 'Cultivars created' as status, count(*) as count FROM cultivars;

-- Sample query to see the hierarchy
SELECT 
    c.name as category,
    s.name as subcategory,
    v.name as variety,
    cv.name as cultivar,
    cv.botanical_name,
    cv.days_to_maturity,
    cv.rating,
    cv.price
FROM categories c
JOIN subcategories s ON c.id = s.category_id
JOIN varieties v ON s.id = v.subcategory_id
JOIN cultivars cv ON v.id = cv.variety_id
WHERE c.id LIKE 'baker-%'
ORDER BY c.name, s.name, v.name, cv.name
LIMIT 20;

COMMIT;

-- Final summary
\\echo 'Baker Creek import completed!'
\\echo 'Total cultivars imported: ${varietiesData.length}'
\\echo 'Total categories: ${Object.keys(categoryGroups).length}'
\\echo 'Total subcategories: ${Object.keys(subcategoryGroups).length}'
\\echo ''
\\echo 'You can now search for cultivars like:'
\\echo '- Genovese Basil'
\\echo '- Cherokee Purple Tomato'
\\echo '- Dragon Tongue Bush Bean'
\\echo '- Little Gem Lettuce'
\\echo ''
\\echo 'The system supports the full 4-level hierarchy:'
\\echo 'Categories → Subcategories → Varieties → Cultivars'
`

  return sql
}

// Generate the SQL
const sql = generateComprehensiveImport()

// Write to file
fs.writeFileSync('./scripts/10-baker-creek-comprehensive-import.sql', sql)

console.log('✅ Comprehensive Baker Creek import script generated!')
console.log('📄 File: scripts/10-baker-creek-comprehensive-import.sql')
console.log(`📊 Contains ${varietiesData.length} cultivars across ${Object.keys(varietiesData.reduce((acc, v) => ({ ...acc, [v.subcategory]: true }), {})).length} subcategories`)
console.log('')
console.log('🚀 To import into your database:')
console.log('1. Go to your Supabase dashboard')
console.log('2. Open the SQL Editor')
console.log('3. Copy and paste the entire script')
console.log('4. Click "Run" to execute')
console.log('')
console.log('This will create a complete seed catalog with:')
console.log('- All Baker Creek categories and subcategories')
console.log('- Base varieties for each plant type')
console.log('- Detailed cultivar information')
console.log('- Growing instructions and botanical names')
console.log('- Pricing and availability data')
console.log('- Full 4-level hierarchy support')
