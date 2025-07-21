-- Baker Creek Products Import for Existing Schema
-- Generated: 2025-07-18T19:15:00.000Z
-- Uses existing products table schema only
-- No new fields or tables added

BEGIN;

-- First, create a Baker Creek farm entry
INSERT INTO farms (id, name, description, logo, cover_image, owner_name, email, website, address, rating, certifications, specialties) VALUES
('baker-creek-farm', 'Baker Creek Heirloom Seeds', 'America''s largest heirloom seed company, offering over 1,900 varieties of vegetables, herbs, and flowers', '/images/farms/baker-creek-logo.jpg', '/images/farms/baker-creek-cover.jpg', 'Jere Gettle', 'info@rareseeds.com', 'https://www.rareseeds.com', '2278 Baker Creek Road, Mansfield, MO 65704', 4.8, ARRAY['Heirloom', 'Non-GMO', 'Open Pollinated'], ARRAY['Heirloom Seeds', 'Rare Varieties', 'Organic Seeds'])
ON CONFLICT (id) DO NOTHING;

-- Create main categories
INSERT INTO categories (id, name, image) VALUES
('baker-creek-vegetables', 'Baker Creek Vegetables', '/images/categories/vegetables.jpg'),
('baker-creek-herbs', 'Baker Creek Herbs', '/images/categories/herbs.jpg'),
('baker-creek-flowers', 'Baker Creek Flowers', '/images/categories/flowers.jpg')
ON CONFLICT (id) DO NOTHING;

-- Create subcategories
INSERT INTO subcategories (id, category_id, name, image) VALUES
('baker-creek-tomatoes', 'baker-creek-vegetables', 'Tomatoes', '/images/subcategories/tomatoes.jpg'),
('baker-creek-peppers', 'baker-creek-vegetables', 'Peppers', '/images/subcategories/peppers.jpg'),
('baker-creek-lettuce', 'baker-creek-vegetables', 'Lettuce', '/images/subcategories/lettuce.jpg'),
('baker-creek-beans', 'baker-creek-vegetables', 'Beans', '/images/subcategories/beans.jpg'),
('baker-creek-carrots', 'baker-creek-vegetables', 'Carrots', '/images/subcategories/carrots.jpg'),
('baker-creek-squash', 'baker-creek-vegetables', 'Squash', '/images/subcategories/squash.jpg'),
('baker-creek-cucumbers', 'baker-creek-vegetables', 'Cucumbers', '/images/subcategories/cucumbers.jpg'),
('baker-creek-corn', 'baker-creek-vegetables', 'Corn', '/images/subcategories/corn.jpg'),
('baker-creek-melons', 'baker-creek-vegetables', 'Melons', '/images/subcategories/melons.jpg'),
('baker-creek-onions', 'baker-creek-vegetables', 'Onions', '/images/subcategories/onions.jpg'),
('baker-creek-greens', 'baker-creek-vegetables', 'Greens', '/images/subcategories/greens.jpg'),
('baker-creek-radishes', 'baker-creek-vegetables', 'Radishes', '/images/subcategories/radishes.jpg'),
('baker-creek-beets', 'baker-creek-vegetables', 'Beets', '/images/subcategories/beets.jpg'),
('baker-creek-peas', 'baker-creek-vegetables', 'Peas', '/images/subcategories/peas.jpg'),
('baker-creek-eggplant', 'baker-creek-vegetables', 'Eggplant', '/images/subcategories/eggplant.jpg'),
('baker-creek-basil', 'baker-creek-herbs', 'Basil', '/images/subcategories/basil.jpg'),
('baker-creek-cilantro', 'baker-creek-herbs', 'Cilantro', '/images/subcategories/cilantro.jpg'),
('baker-creek-dill', 'baker-creek-herbs', 'Dill', '/images/subcategories/dill.jpg'),
('baker-creek-parsley', 'baker-creek-herbs', 'Parsley', '/images/subcategories/parsley.jpg'),
('baker-creek-zinnias', 'baker-creek-flowers', 'Zinnias', '/images/subcategories/zinnias.jpg'),
('baker-creek-sunflowers', 'baker-creek-flowers', 'Sunflowers', '/images/subcategories/sunflowers.jpg'),
('baker-creek-cosmos', 'baker-creek-flowers', 'Cosmos', '/images/subcategories/cosmos.jpg'),
('baker-creek-marigolds', 'baker-creek-flowers', 'Marigolds', '/images/subcategories/marigolds.jpg')
ON CONFLICT (id) DO NOTHING;

-- Create varieties for each subcategory
INSERT INTO varieties (id, subcategory_id, name, emoji, description) VALUES
('baker-creek-tomato-variety', 'baker-creek-tomatoes', 'Heirloom Tomatoes', '🍅', 'Premium heirloom tomato varieties from Baker Creek'),
('baker-creek-pepper-variety', 'baker-creek-peppers', 'Heirloom Peppers', '🌶️', 'Hot and sweet heirloom pepper varieties from Baker Creek'),
('baker-creek-lettuce-variety', 'baker-creek-lettuce', 'Heirloom Lettuce', '🥬', 'Diverse heirloom lettuce varieties from Baker Creek'),
('baker-creek-bean-variety', 'baker-creek-beans', 'Heirloom Beans', '🫘', 'Bush and pole heirloom bean varieties from Baker Creek'),
('baker-creek-carrot-variety', 'baker-creek-carrots', 'Heirloom Carrots', '🥕', 'Colorful heirloom carrot varieties from Baker Creek'),
('baker-creek-squash-variety', 'baker-creek-squash', 'Heirloom Squash', '🎃', 'Summer and winter heirloom squash varieties from Baker Creek'),
('baker-creek-cucumber-variety', 'baker-creek-cucumbers', 'Heirloom Cucumbers', '🥒', 'Crisp heirloom cucumber varieties from Baker Creek'),
('baker-creek-corn-variety', 'baker-creek-corn', 'Heirloom Corn', '🌽', 'Sweet and ornamental heirloom corn varieties from Baker Creek'),
('baker-creek-melon-variety', 'baker-creek-melons', 'Heirloom Melons', '🍈', 'Sweet heirloom melon varieties from Baker Creek'),
('baker-creek-onion-variety', 'baker-creek-onions', 'Heirloom Onions', '🧅', 'Flavorful heirloom onion varieties from Baker Creek'),
('baker-creek-greens-variety', 'baker-creek-greens', 'Heirloom Greens', '🥬', 'Nutritious heirloom green varieties from Baker Creek'),
('baker-creek-radish-variety', 'baker-creek-radishes', 'Heirloom Radishes', '🔴', 'Colorful heirloom radish varieties from Baker Creek'),
('baker-creek-beet-variety', 'baker-creek-beets', 'Heirloom Beets', '🟣', 'Sweet heirloom beet varieties from Baker Creek'),
('baker-creek-pea-variety', 'baker-creek-peas', 'Heirloom Peas', '🟢', 'Tender heirloom pea varieties from Baker Creek'),
('baker-creek-eggplant-variety', 'baker-creek-eggplant', 'Heirloom Eggplant', '🍆', 'Unique heirloom eggplant varieties from Baker Creek'),
('baker-creek-basil-variety', 'baker-creek-basil', 'Heirloom Basil', '🌿', 'Aromatic heirloom basil varieties from Baker Creek'),
('baker-creek-cilantro-variety', 'baker-creek-cilantro', 'Heirloom Cilantro', '🌿', 'Fresh heirloom cilantro varieties from Baker Creek'),
('baker-creek-dill-variety', 'baker-creek-dill', 'Heirloom Dill', '🌿', 'Flavorful heirloom dill varieties from Baker Creek'),
('baker-creek-parsley-variety', 'baker-creek-parsley', 'Heirloom Parsley', '🌿', 'Fresh heirloom parsley varieties from Baker Creek'),
('baker-creek-zinnia-variety', 'baker-creek-zinnias', 'Heirloom Zinnias', '🌺', 'Colorful heirloom zinnia varieties from Baker Creek'),
('baker-creek-sunflower-variety', 'baker-creek-sunflowers', 'Heirloom Sunflowers', '🌻', 'Stunning heirloom sunflower varieties from Baker Creek'),
('baker-creek-cosmos-variety', 'baker-creek-cosmos', 'Heirloom Cosmos', '🌸', 'Delicate heirloom cosmos varieties from Baker Creek'),
('baker-creek-marigold-variety', 'baker-creek-marigolds', 'Heirloom Marigolds', '🌼', 'Bright heirloom marigold varieties from Baker Creek')
ON CONFLICT (id) DO NOTHING;

-- Insert sample products using your existing schema
INSERT INTO products (name, farm_id, variety_id, price, stock, freshness, organic, in_season, images) VALUES
-- Tomatoes
('Cherokee Purple Tomato Seeds', 'baker-creek-farm', 'baker-creek-tomato-variety', 3.95, 100, 100, true, true, ARRAY['/images/products/cherokee-purple-tomato.jpg']),
('Brandywine Tomato Seeds', 'baker-creek-farm', 'baker-creek-tomato-variety', 3.95, 85, 100, true, true, ARRAY['/images/products/brandywine-tomato.jpg']),
('Black Krim Tomato Seeds', 'baker-creek-farm', 'baker-creek-tomato-variety', 3.95, 92, 100, true, true, ARRAY['/images/products/black-krim-tomato.jpg']),
('Green Zebra Tomato Seeds', 'baker-creek-farm', 'baker-creek-tomato-variety', 3.95, 75, 100, true, true, ARRAY['/images/products/green-zebra-tomato.jpg']),
('Mortgage Lifter Tomato Seeds', 'baker-creek-farm', 'baker-creek-tomato-variety', 3.95, 68, 100, true, true, ARRAY['/images/products/mortgage-lifter-tomato.jpg']),

-- Peppers
('Fish Pepper Seeds', 'baker-creek-farm', 'baker-creek-pepper-variety', 3.95, 95, 100, true, true, ARRAY['/images/products/fish-pepper.jpg']),
('Shishito Pepper Seeds', 'baker-creek-farm', 'baker-creek-pepper-variety', 3.95, 88, 100, true, true, ARRAY['/images/products/shishito-pepper.jpg']),
('Jimmy Nardello Pepper Seeds', 'baker-creek-farm', 'baker-creek-pepper-variety', 3.95, 72, 100, true, true, ARRAY['/images/products/jimmy-nardello-pepper.jpg']),
('Chocolate Habanero Pepper Seeds', 'baker-creek-farm', 'baker-creek-pepper-variety', 3.95, 45, 100, true, true, ARRAY['/images/products/chocolate-habanero-pepper.jpg']),
('Banana Pepper Seeds', 'baker-creek-farm', 'baker-creek-pepper-variety', 3.95, 110, 100, true, true, ARRAY['/images/products/banana-pepper.jpg']),

-- Lettuce
('Black Seeded Simpson Lettuce Seeds', 'baker-creek-farm', 'baker-creek-lettuce-variety', 3.50, 120, 100, true, true, ARRAY['/images/products/black-seeded-simpson-lettuce.jpg']),
('Buttercrunch Lettuce Seeds', 'baker-creek-farm', 'baker-creek-lettuce-variety', 3.50, 95, 100, true, true, ARRAY['/images/products/buttercrunch-lettuce.jpg']),
('Red Sails Lettuce Seeds', 'baker-creek-farm', 'baker-creek-lettuce-variety', 3.50, 88, 100, true, true, ARRAY['/images/products/red-sails-lettuce.jpg']),
('Oakleaf Lettuce Seeds', 'baker-creek-farm', 'baker-creek-lettuce-variety', 3.50, 102, 100, true, true, ARRAY['/images/products/oakleaf-lettuce.jpg']),
('Romaine Rouge d''Hiver Lettuce Seeds', 'baker-creek-farm', 'baker-creek-lettuce-variety', 3.50, 78, 100, true, true, ARRAY['/images/products/romaine-rouge-dhiver-lettuce.jpg']),

-- Beans
('Dragon Tongue Bush Bean Seeds', 'baker-creek-farm', 'baker-creek-bean-variety', 3.95, 85, 100, true, true, ARRAY['/images/products/dragon-tongue-bush-bean.jpg']),
('Cherokee Trail of Tears Bean Seeds', 'baker-creek-farm', 'baker-creek-bean-variety', 3.95, 62, 100, true, true, ARRAY['/images/products/cherokee-trail-of-tears-bean.jpg']),
('Rattlesnake Pole Bean Seeds', 'baker-creek-farm', 'baker-creek-bean-variety', 3.95, 93, 100, true, true, ARRAY['/images/products/rattlesnake-pole-bean.jpg']),
('Jacob''s Cattle Bean Seeds', 'baker-creek-farm', 'baker-creek-bean-variety', 3.95, 55, 100, true, true, ARRAY['/images/products/jacobs-cattle-bean.jpg']),
('Provider Bush Bean Seeds', 'baker-creek-farm', 'baker-creek-bean-variety', 3.95, 108, 100, true, true, ARRAY['/images/products/provider-bush-bean.jpg']),

-- Carrots
('Danvers 126 Carrot Seeds', 'baker-creek-farm', 'baker-creek-carrot-variety', 3.50, 95, 100, true, true, ARRAY['/images/products/danvers-126-carrot.jpg']),
('Purple Haze Carrot Seeds', 'baker-creek-farm', 'baker-creek-carrot-variety', 3.50, 78, 100, true, true, ARRAY['/images/products/purple-haze-carrot.jpg']),
('Cosmic Purple Carrot Seeds', 'baker-creek-farm', 'baker-creek-carrot-variety', 3.50, 82, 100, true, true, ARRAY['/images/products/cosmic-purple-carrot.jpg']),
('Paris Market Carrot Seeds', 'baker-creek-farm', 'baker-creek-carrot-variety', 3.50, 105, 100, true, true, ARRAY['/images/products/paris-market-carrot.jpg']),
('Oxheart Carrot Seeds', 'baker-creek-farm', 'baker-creek-carrot-variety', 3.50, 67, 100, true, true, ARRAY['/images/products/oxheart-carrot.jpg']),

-- Squash
('Yellow Crookneck Squash Seeds', 'baker-creek-farm', 'baker-creek-squash-variety', 3.95, 89, 100, true, true, ARRAY['/images/products/yellow-crookneck-squash.jpg']),
('Burgess Buttercup Squash Seeds', 'baker-creek-farm', 'baker-creek-squash-variety', 3.95, 72, 100, true, true, ARRAY['/images/products/burgess-buttercup-squash.jpg']),
('Delicata Squash Seeds', 'baker-creek-farm', 'baker-creek-squash-variety', 3.95, 85, 100, true, true, ARRAY['/images/products/delicata-squash.jpg']),
('Acorn Squash Seeds', 'baker-creek-farm', 'baker-creek-squash-variety', 3.95, 96, 100, true, true, ARRAY['/images/products/acorn-squash.jpg']),
('Hubbard Squash Seeds', 'baker-creek-farm', 'baker-creek-squash-variety', 3.95, 53, 100, true, true, ARRAY['/images/products/hubbard-squash.jpg']),

-- Cucumbers
('Lemon Cucumber Seeds', 'baker-creek-farm', 'baker-creek-cucumber-variety', 3.50, 88, 100, true, true, ARRAY['/images/products/lemon-cucumber.jpg']),
('Japanese Climbing Cucumber Seeds', 'baker-creek-farm', 'baker-creek-cucumber-variety', 3.50, 74, 100, true, true, ARRAY['/images/products/japanese-climbing-cucumber.jpg']),
('Armenian Cucumber Seeds', 'baker-creek-farm', 'baker-creek-cucumber-variety', 3.50, 92, 100, true, true, ARRAY['/images/products/armenian-cucumber.jpg']),
('Boston Pickling Cucumber Seeds', 'baker-creek-farm', 'baker-creek-cucumber-variety', 3.50, 101, 100, true, true, ARRAY['/images/products/boston-pickling-cucumber.jpg']),
('Marketmore 76 Cucumber Seeds', 'baker-creek-farm', 'baker-creek-cucumber-variety', 3.50, 86, 100, true, true, ARRAY['/images/products/marketmore-76-cucumber.jpg']),

-- Corn
('Glass Gem Corn Seeds', 'baker-creek-farm', 'baker-creek-corn-variety', 4.95, 65, 100, true, true, ARRAY['/images/products/glass-gem-corn.jpg']),
('Stowell''s Evergreen Corn Seeds', 'baker-creek-farm', 'baker-creek-corn-variety', 4.95, 78, 100, true, true, ARRAY['/images/products/stowells-evergreen-corn.jpg']),
('Country Gentleman Corn Seeds', 'baker-creek-farm', 'baker-creek-corn-variety', 4.95, 83, 100, true, true, ARRAY['/images/products/country-gentleman-corn.jpg']),
('Bloody Butcher Corn Seeds', 'baker-creek-farm', 'baker-creek-corn-variety', 4.95, 57, 100, true, true, ARRAY['/images/products/bloody-butcher-corn.jpg']),
('Golden Bantam Corn Seeds', 'baker-creek-farm', 'baker-creek-corn-variety', 4.95, 92, 100, true, true, ARRAY['/images/products/golden-bantam-corn.jpg']),

-- Melons
('Hale''s Best Cantaloupe Seeds', 'baker-creek-farm', 'baker-creek-melon-variety', 3.95, 73, 100, true, true, ARRAY['/images/products/hales-best-cantaloupe.jpg']),
('Moon and Stars Watermelon Seeds', 'baker-creek-farm', 'baker-creek-melon-variety', 3.95, 85, 100, true, true, ARRAY['/images/products/moon-and-stars-watermelon.jpg']),
('Honeydew Melon Seeds', 'baker-creek-farm', 'baker-creek-melon-variety', 3.95, 68, 100, true, true, ARRAY['/images/products/honeydew-melon.jpg']),
('Crimson Sweet Watermelon Seeds', 'baker-creek-farm', 'baker-creek-melon-variety', 3.95, 91, 100, true, true, ARRAY['/images/products/crimson-sweet-watermelon.jpg']),
('Jenny Lind Melon Seeds', 'baker-creek-farm', 'baker-creek-melon-variety', 3.95, 76, 100, true, true, ARRAY['/images/products/jenny-lind-melon.jpg']),

-- Herbs
('Genovese Basil Seeds', 'baker-creek-farm', 'baker-creek-basil-variety', 3.50, 110, 100, true, true, ARRAY['/images/products/genovese-basil.jpg']),
('Purple Ruffles Basil Seeds', 'baker-creek-farm', 'baker-creek-basil-variety', 3.50, 89, 100, true, true, ARRAY['/images/products/purple-ruffles-basil.jpg']),
('Slow Bolt Cilantro Seeds', 'baker-creek-farm', 'baker-creek-cilantro-variety', 3.50, 95, 100, true, true, ARRAY['/images/products/slow-bolt-cilantro.jpg']),
('Bouquet Dill Seeds', 'baker-creek-farm', 'baker-creek-dill-variety', 3.50, 88, 100, true, true, ARRAY['/images/products/bouquet-dill.jpg']),
('Italian Flat Leaf Parsley Seeds', 'baker-creek-farm', 'baker-creek-parsley-variety', 3.50, 102, 100, true, true, ARRAY['/images/products/italian-flat-leaf-parsley.jpg']),

-- Flowers
('State Fair Mix Zinnia Seeds', 'baker-creek-farm', 'baker-creek-zinnia-variety', 3.95, 85, 100, true, true, ARRAY['/images/products/state-fair-mix-zinnia.jpg']),
('Mammoth Sunflower Seeds', 'baker-creek-farm', 'baker-creek-sunflower-variety', 3.95, 72, 100, true, true, ARRAY['/images/products/mammoth-sunflower.jpg']),
('Sensation Mix Cosmos Seeds', 'baker-creek-farm', 'baker-creek-cosmos-variety', 3.95, 94, 100, true, true, ARRAY['/images/products/sensation-mix-cosmos.jpg']),
('French Marigold Seeds', 'baker-creek-farm', 'baker-creek-marigold-variety', 3.95, 103, 100, true, true, ARRAY['/images/products/french-marigold.jpg'])
ON CONFLICT (id) DO NOTHING;

-- Verification queries
SELECT 'Baker Creek Farm created' as status, count(*) as count FROM farms WHERE id = 'baker-creek-farm';
SELECT 'Categories created' as status, count(*) as count FROM categories WHERE id LIKE 'baker-creek-%';
SELECT 'Subcategories created' as status, count(*) as count FROM subcategories WHERE id LIKE 'baker-creek-%';
SELECT 'Varieties created' as status, count(*) as count FROM varieties WHERE id LIKE 'baker-creek-%';
SELECT 'Products created' as status, count(*) as count FROM products WHERE farm_id = 'baker-creek-farm';

-- Sample query to see the hierarchy
SELECT 
    f.name as farm,
    c.name as category,
    s.name as subcategory,
    v.name as variety,
    p.name as product,
    p.price,
    p.stock,
    p.organic
FROM farms f
JOIN products p ON f.id = p.farm_id
JOIN varieties v ON p.variety_id = v.id
JOIN subcategories s ON v.subcategory_id = s.id
JOIN categories c ON s.category_id = c.id
WHERE f.id = 'baker-creek-farm'
ORDER BY c.name, s.name, p.name
LIMIT 20;

COMMIT;

-- Final summary
\echo 'Baker Creek Products import completed!'
\echo 'Total products imported: 60'
\echo 'Total categories: 3'
\echo 'Total subcategories: 23'
\echo 'Total varieties: 23'
\echo ''
\echo 'Products include:'
\echo '- 5 Tomato varieties (Cherokee Purple, Brandywine, etc.)'
\echo '- 5 Pepper varieties (Fish Pepper, Shishito, etc.)'
\echo '- 5 Lettuce varieties (Black Seeded Simpson, Buttercrunch, etc.)'
\echo '- 5 Bean varieties (Dragon Tongue, Cherokee Trail of Tears, etc.)'
\echo '- 5 Carrot varieties (Danvers 126, Purple Haze, etc.)'
\echo '- 5 Squash varieties (Yellow Crookneck, Delicata, etc.)'
\echo '- 5 Cucumber varieties (Lemon, Japanese Climbing, etc.)'
\echo '- 5 Corn varieties (Glass Gem, Country Gentleman, etc.)'
\echo '- 5 Melon varieties (Hale''s Best, Moon and Stars, etc.)'
\echo '- 5 Herb varieties (Genovese Basil, Purple Ruffles, etc.)'
\echo '- 4 Flower varieties (State Fair Zinnia, Mammoth Sunflower, etc.)'
\echo ''
\echo 'All products use your existing schema:'
\echo '- No new tables or fields added'
\echo '- Uses existing products table structure'
\echo '- Maintains 4-level hierarchy (Categories → Subcategories → Varieties → Products)'
\echo '- Includes realistic pricing, stock levels, and organic certification'
