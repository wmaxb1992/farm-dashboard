-- Baker Creek seed data import
-- This contains structured data extracted from rareseeds.com

BEGIN;

-- First, let's add some missing base varieties that we'll need for cultivars
INSERT INTO varieties (id, subcategory_id, name, emoji, description) VALUES
-- Artichokes (if not exists)
('baker-artichoke-001', 
 (SELECT id FROM subcategories WHERE name = 'Brassicas' LIMIT 1), 
 'Artichoke', 
 '🌰', 
 'Edible flower buds of the artichoke plant'
)
ON CONFLICT (id) DO NOTHING;

-- Now add Baker Creek cultivars
INSERT INTO cultivars (
    variety_id, 
    name, 
    common_name,
    description,
    characteristics,
    growing_notes,
    botanical_name,
    days_to_maturity,
    plant_spacing,
    seed_depth,
    germination_days,
    sun_requirements,
    frost_hardy,
    image_url,
    source_url
) VALUES 
-- Green Globe Artichoke
(
    'baker-artichoke-001',
    'Green Globe',
    'Globe Artichoke',
    'Tasty! Needs a fairly long, mild growing season, or can be grown as an annual. This colorful plant makes a great ornamental.',
    'Large, globe-shaped heads; can be grown as annual or perennial',
    'Needs fairly long, mild growing season. Can be grown as annual. Makes great ornamental plant.',
    'Cynara cardunculus var. scolymus',
    120,
    '18"',
    '1/4" to 1/2"',
    '10-21 days',
    'Full Sun',
    true,
    'https://www.rareseeds.com/media/catalog/product/cache/5667e39955f7b47720c7610bf376471d/a/r/artichoke-green-globe-lss-dsc_8174.jpg',
    'https://www.rareseeds.com/artichoke-green-globe'
),

-- Example Basil cultivars (assuming we have basil variety)
(
    (SELECT id FROM varieties WHERE name = 'Basil' LIMIT 1),
    'Genovese',
    'Genovese Basil',
    'Classic Italian basil with large, aromatic leaves perfect for pesto',
    'Large, bright green leaves; sweet, aromatic flavor',
    'Excellent for pesto. Pinch flowers to maintain leaf production.',
    'Ocimum basilicum',
    75,
    '6-12"',
    '1/4"',
    '7-14 days',
    'Full Sun',
    false,
    NULL,
    'https://www.rareseeds.com/basil-genovese'
),

(
    (SELECT id FROM varieties WHERE name = 'Basil' LIMIT 1),
    'Thai',
    'Thai Basil',
    'Spicy, licorice-flavored basil used in Asian cuisine',
    'Purple stems; spicy, anise-like flavor; small leaves',
    'Heat-loving. Excellent for stir-fries and Asian dishes.',
    'Ocimum basilicum var. thyrsiflora',
    85,
    '8-12"',
    '1/4"',
    '7-14 days',
    'Full Sun',
    false,
    NULL,
    'https://www.rareseeds.com/basil-thai'
),

-- Example Tomato cultivars (assuming we have tomato variety)
(
    (SELECT id FROM varieties WHERE name = 'Tomato' LIMIT 1),
    'Cherokee Purple',
    'Cherokee Purple Tomato',
    'Heirloom beefsteak tomato with deep purple shoulders and rich flavor',
    'Large, beefsteak type; purple shoulders; excellent flavor',
    'Indeterminate variety. Needs support. Excellent for fresh eating.',
    'Solanum lycopersicum',
    80,
    '24-36"',
    '1/4"',
    '7-14 days',
    'Full Sun',
    false,
    NULL,
    'https://www.rareseeds.com/tomato-cherokee-purple'
),

(
    (SELECT id FROM varieties WHERE name = 'Tomato' LIMIT 1),
    'Black Krim',
    'Black Krim Tomato',
    'Russian heirloom with dark purple-black shoulders and rich, smoky flavor',
    'Medium-large, dark purple-black shoulders; rich, complex flavor',
    'Indeterminate. Excellent for slicing. Unique appearance.',
    'Solanum lycopersicum',
    85,
    '24-36"',
    '1/4"',
    '7-14 days',
    'Full Sun',
    false,
    NULL,
    'https://www.rareseeds.com/tomato-black-krim'
);

COMMIT;
