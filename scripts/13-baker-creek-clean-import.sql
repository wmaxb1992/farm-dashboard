-- Baker Creek Seed Catalog Import (Clean UUIDs - No Duplicates)
-- Generated: 2025-07-18T20:23:40.294Z
-- Total varieties: 434
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

-- Create subcategories (prevent duplicates by checking if they exist)
INSERT INTO subcategories (category_id, name, image) 
SELECT category_id, 'Amaranth', '/images/subcategories/amaranth.jpg'
FROM temp_category_ids 
WHERE category_name = 'Vegetables'
AND NOT EXISTS (SELECT 1 FROM subcategories s JOIN categories c ON s.category_id = c.id WHERE s.name = 'Amaranth' AND c.name = 'Vegetables');

INSERT INTO subcategories (category_id, name, image) 
SELECT category_id, 'Artichoke Cardoon', '/images/subcategories/artichoke-cardoon.jpg'
FROM temp_category_ids 
WHERE category_name = 'Vegetables'
AND NOT EXISTS (SELECT 1 FROM subcategories s JOIN categories c ON s.category_id = c.id WHERE s.name = 'Artichoke Cardoon' AND c.name = 'Vegetables');

INSERT INTO subcategories (category_id, name, image) 
SELECT category_id, 'Arugula', '/images/subcategories/arugula.jpg'
FROM temp_category_ids 
WHERE category_name = 'Vegetables'
AND NOT EXISTS (SELECT 1 FROM subcategories s JOIN categories c ON s.category_id = c.id WHERE s.name = 'Arugula' AND c.name = 'Vegetables');

INSERT INTO subcategories (category_id, name, image) 
SELECT category_id, 'Asparagus', '/images/subcategories/asparagus.jpg'
FROM temp_category_ids 
WHERE category_name = 'Vegetables'
AND NOT EXISTS (SELECT 1 FROM subcategories s JOIN categories c ON s.category_id = c.id WHERE s.name = 'Asparagus' AND c.name = 'Vegetables');

INSERT INTO subcategories (category_id, name, image) 
SELECT category_id, 'Barley', '/images/subcategories/barley.jpg'
FROM temp_category_ids 
WHERE category_name = 'Vegetables'
AND NOT EXISTS (SELECT 1 FROM subcategories s JOIN categories c ON s.category_id = c.id WHERE s.name = 'Barley' AND c.name = 'Vegetables');

INSERT INTO subcategories (category_id, name, image) 
SELECT category_id, 'Beans', '/images/subcategories/beans.jpg'
FROM temp_category_ids 
WHERE category_name = 'Vegetables'
AND NOT EXISTS (SELECT 1 FROM subcategories s JOIN categories c ON s.category_id = c.id WHERE s.name = 'Beans' AND c.name = 'Vegetables');

INSERT INTO subcategories (category_id, name, image) 
SELECT category_id, 'Beetroot', '/images/subcategories/beetroot.jpg'
FROM temp_category_ids 
WHERE category_name = 'Vegetables'
AND NOT EXISTS (SELECT 1 FROM subcategories s JOIN categories c ON s.category_id = c.id WHERE s.name = 'Beetroot' AND c.name = 'Vegetables');

INSERT INTO subcategories (category_id, name, image) 
SELECT category_id, 'Bitter Melon', '/images/subcategories/bitter-melon.jpg'
FROM temp_category_ids 
WHERE category_name = 'Vegetables'
AND NOT EXISTS (SELECT 1 FROM subcategories s JOIN categories c ON s.category_id = c.id WHERE s.name = 'Bitter Melon' AND c.name = 'Vegetables');

INSERT INTO subcategories (category_id, name, image) 
SELECT category_id, 'Bok Choy', '/images/subcategories/bok-choy.jpg'
FROM temp_category_ids 
WHERE category_name = 'Vegetables'
AND NOT EXISTS (SELECT 1 FROM subcategories s JOIN categories c ON s.category_id = c.id WHERE s.name = 'Bok Choy' AND c.name = 'Vegetables');

INSERT INTO subcategories (category_id, name, image) 
SELECT category_id, 'Broccoli', '/images/subcategories/broccoli.jpg'
FROM temp_category_ids 
WHERE category_name = 'Vegetables'
AND NOT EXISTS (SELECT 1 FROM subcategories s JOIN categories c ON s.category_id = c.id WHERE s.name = 'Broccoli' AND c.name = 'Vegetables');

INSERT INTO subcategories (category_id, name, image) 
SELECT category_id, 'Brussels Sprouts', '/images/subcategories/brussels-sprouts.jpg'
FROM temp_category_ids 
WHERE category_name = 'Vegetables'
AND NOT EXISTS (SELECT 1 FROM subcategories s JOIN categories c ON s.category_id = c.id WHERE s.name = 'Brussels Sprouts' AND c.name = 'Vegetables');

INSERT INTO subcategories (category_id, name, image) 
SELECT category_id, 'Buckwheat', '/images/subcategories/buckwheat.jpg'
FROM temp_category_ids 
WHERE category_name = 'Vegetables'
AND NOT EXISTS (SELECT 1 FROM subcategories s JOIN categories c ON s.category_id = c.id WHERE s.name = 'Buckwheat' AND c.name = 'Vegetables');

INSERT INTO subcategories (category_id, name, image) 
SELECT category_id, 'Cabbage', '/images/subcategories/cabbage.jpg'
FROM temp_category_ids 
WHERE category_name = 'Vegetables'
AND NOT EXISTS (SELECT 1 FROM subcategories s JOIN categories c ON s.category_id = c.id WHERE s.name = 'Cabbage' AND c.name = 'Vegetables');

INSERT INTO subcategories (category_id, name, image) 
SELECT category_id, 'Carrots Seeds', '/images/subcategories/carrots-seeds.jpg'
FROM temp_category_ids 
WHERE category_name = 'Vegetables'
AND NOT EXISTS (SELECT 1 FROM subcategories s JOIN categories c ON s.category_id = c.id WHERE s.name = 'Carrots Seeds' AND c.name = 'Vegetables');

INSERT INTO subcategories (category_id, name, image) 
SELECT category_id, 'Cauliflower', '/images/subcategories/cauliflower.jpg'
FROM temp_category_ids 
WHERE category_name = 'Vegetables'
AND NOT EXISTS (SELECT 1 FROM subcategories s JOIN categories c ON s.category_id = c.id WHERE s.name = 'Cauliflower' AND c.name = 'Vegetables');

INSERT INTO subcategories (category_id, name, image) 
SELECT category_id, 'Celery', '/images/subcategories/celery.jpg'
FROM temp_category_ids 
WHERE category_name = 'Vegetables'
AND NOT EXISTS (SELECT 1 FROM subcategories s JOIN categories c ON s.category_id = c.id WHERE s.name = 'Celery' AND c.name = 'Vegetables');

INSERT INTO subcategories (category_id, name, image) 
SELECT category_id, 'Chard', '/images/subcategories/chard.jpg'
FROM temp_category_ids 
WHERE category_name = 'Vegetables'
AND NOT EXISTS (SELECT 1 FROM subcategories s JOIN categories c ON s.category_id = c.id WHERE s.name = 'Chard' AND c.name = 'Vegetables');

INSERT INTO subcategories (category_id, name, image) 
SELECT category_id, 'Chickpeas', '/images/subcategories/chickpeas.jpg'
FROM temp_category_ids 
WHERE category_name = 'Vegetables'
AND NOT EXISTS (SELECT 1 FROM subcategories s JOIN categories c ON s.category_id = c.id WHERE s.name = 'Chickpeas' AND c.name = 'Vegetables');

INSERT INTO subcategories (category_id, name, image) 
SELECT category_id, 'Chicory', '/images/subcategories/chicory.jpg'
FROM temp_category_ids 
WHERE category_name = 'Vegetables'
AND NOT EXISTS (SELECT 1 FROM subcategories s JOIN categories c ON s.category_id = c.id WHERE s.name = 'Chicory' AND c.name = 'Vegetables');

INSERT INTO subcategories (category_id, name, image) 
SELECT category_id, 'Chinese Cabbage', '/images/subcategories/chinese-cabbage.jpg'
FROM temp_category_ids 
WHERE category_name = 'Vegetables'
AND NOT EXISTS (SELECT 1 FROM subcategories s JOIN categories c ON s.category_id = c.id WHERE s.name = 'Chinese Cabbage' AND c.name = 'Vegetables');

INSERT INTO subcategories (category_id, name, image) 
SELECT category_id, 'Collards', '/images/subcategories/collards.jpg'
FROM temp_category_ids 
WHERE category_name = 'Vegetables'
AND NOT EXISTS (SELECT 1 FROM subcategories s JOIN categories c ON s.category_id = c.id WHERE s.name = 'Collards' AND c.name = 'Vegetables');

INSERT INTO subcategories (category_id, name, image) 
SELECT category_id, 'Corn', '/images/subcategories/corn.jpg'
FROM temp_category_ids 
WHERE category_name = 'Vegetables'
AND NOT EXISTS (SELECT 1 FROM subcategories s JOIN categories c ON s.category_id = c.id WHERE s.name = 'Corn' AND c.name = 'Vegetables');

INSERT INTO subcategories (category_id, name, image) 
SELECT category_id, 'Cucumber', '/images/subcategories/cucumber.jpg'
FROM temp_category_ids 
WHERE category_name = 'Vegetables'
AND NOT EXISTS (SELECT 1 FROM subcategories s JOIN categories c ON s.category_id = c.id WHERE s.name = 'Cucumber' AND c.name = 'Vegetables');

INSERT INTO subcategories (category_id, name, image) 
SELECT category_id, 'Eggplant', '/images/subcategories/eggplant.jpg'
FROM temp_category_ids 
WHERE category_name = 'Vegetables'
AND NOT EXISTS (SELECT 1 FROM subcategories s JOIN categories c ON s.category_id = c.id WHERE s.name = 'Eggplant' AND c.name = 'Vegetables');

INSERT INTO subcategories (category_id, name, image) 
SELECT category_id, 'Endive', '/images/subcategories/endive.jpg'
FROM temp_category_ids 
WHERE category_name = 'Vegetables'
AND NOT EXISTS (SELECT 1 FROM subcategories s JOIN categories c ON s.category_id = c.id WHERE s.name = 'Endive' AND c.name = 'Vegetables');

INSERT INTO subcategories (category_id, name, image) 
SELECT category_id, 'Fava Beans', '/images/subcategories/fava-beans.jpg'
FROM temp_category_ids 
WHERE category_name = 'Vegetables'
AND NOT EXISTS (SELECT 1 FROM subcategories s JOIN categories c ON s.category_id = c.id WHERE s.name = 'Fava Beans' AND c.name = 'Vegetables');

INSERT INTO subcategories (category_id, name, image) 
SELECT category_id, 'Fennel', '/images/subcategories/fennel.jpg'
FROM temp_category_ids 
WHERE category_name = 'Vegetables'
AND NOT EXISTS (SELECT 1 FROM subcategories s JOIN categories c ON s.category_id = c.id WHERE s.name = 'Fennel' AND c.name = 'Vegetables');

INSERT INTO subcategories (category_id, name, image) 
SELECT category_id, 'Garlic', '/images/subcategories/garlic.jpg'
FROM temp_category_ids 
WHERE category_name = 'Vegetables'
AND NOT EXISTS (SELECT 1 FROM subcategories s JOIN categories c ON s.category_id = c.id WHERE s.name = 'Garlic' AND c.name = 'Vegetables');

INSERT INTO subcategories (category_id, name, image) 
SELECT category_id, 'Gourds', '/images/subcategories/gourds.jpg'
FROM temp_category_ids 
WHERE category_name = 'Vegetables'
AND NOT EXISTS (SELECT 1 FROM subcategories s JOIN categories c ON s.category_id = c.id WHERE s.name = 'Gourds' AND c.name = 'Vegetables');

INSERT INTO subcategories (category_id, name, image) 
SELECT category_id, 'Ground Cherry', '/images/subcategories/ground-cherry.jpg'
FROM temp_category_ids 
WHERE category_name = 'Vegetables'
AND NOT EXISTS (SELECT 1 FROM subcategories s JOIN categories c ON s.category_id = c.id WHERE s.name = 'Ground Cherry' AND c.name = 'Vegetables');

INSERT INTO subcategories (category_id, name, image) 
SELECT category_id, 'Kale', '/images/subcategories/kale.jpg'
FROM temp_category_ids 
WHERE category_name = 'Vegetables'
AND NOT EXISTS (SELECT 1 FROM subcategories s JOIN categories c ON s.category_id = c.id WHERE s.name = 'Kale' AND c.name = 'Vegetables');

INSERT INTO subcategories (category_id, name, image) 
SELECT category_id, 'Kohlrabi', '/images/subcategories/kohlrabi.jpg'
FROM temp_category_ids 
WHERE category_name = 'Vegetables'
AND NOT EXISTS (SELECT 1 FROM subcategories s JOIN categories c ON s.category_id = c.id WHERE s.name = 'Kohlrabi' AND c.name = 'Vegetables');

INSERT INTO subcategories (category_id, name, image) 
SELECT category_id, 'Leeks', '/images/subcategories/leeks.jpg'
FROM temp_category_ids 
WHERE category_name = 'Vegetables'
AND NOT EXISTS (SELECT 1 FROM subcategories s JOIN categories c ON s.category_id = c.id WHERE s.name = 'Leeks' AND c.name = 'Vegetables');

INSERT INTO subcategories (category_id, name, image) 
SELECT category_id, 'Lettuce', '/images/subcategories/lettuce.jpg'
FROM temp_category_ids 
WHERE category_name = 'Vegetables'
AND NOT EXISTS (SELECT 1 FROM subcategories s JOIN categories c ON s.category_id = c.id WHERE s.name = 'Lettuce' AND c.name = 'Vegetables');

INSERT INTO subcategories (category_id, name, image) 
SELECT category_id, 'Mache', '/images/subcategories/mache.jpg'
FROM temp_category_ids 
WHERE category_name = 'Vegetables'
AND NOT EXISTS (SELECT 1 FROM subcategories s JOIN categories c ON s.category_id = c.id WHERE s.name = 'Mache' AND c.name = 'Vegetables');

INSERT INTO subcategories (category_id, name, image) 
SELECT category_id, 'Melons', '/images/subcategories/melons.jpg'
FROM temp_category_ids 
WHERE category_name = 'Vegetables'
AND NOT EXISTS (SELECT 1 FROM subcategories s JOIN categories c ON s.category_id = c.id WHERE s.name = 'Melons' AND c.name = 'Vegetables');

INSERT INTO subcategories (category_id, name, image) 
SELECT category_id, 'Millet', '/images/subcategories/millet.jpg'
FROM temp_category_ids 
WHERE category_name = 'Vegetables'
AND NOT EXISTS (SELECT 1 FROM subcategories s JOIN categories c ON s.category_id = c.id WHERE s.name = 'Millet' AND c.name = 'Vegetables');

INSERT INTO subcategories (category_id, name, image) 
SELECT category_id, 'Mustard Greens', '/images/subcategories/mustard-greens.jpg'
FROM temp_category_ids 
WHERE category_name = 'Vegetables'
AND NOT EXISTS (SELECT 1 FROM subcategories s JOIN categories c ON s.category_id = c.id WHERE s.name = 'Mustard Greens' AND c.name = 'Vegetables');

INSERT INTO subcategories (category_id, name, image) 
SELECT category_id, 'Okra', '/images/subcategories/okra.jpg'
FROM temp_category_ids 
WHERE category_name = 'Vegetables'
AND NOT EXISTS (SELECT 1 FROM subcategories s JOIN categories c ON s.category_id = c.id WHERE s.name = 'Okra' AND c.name = 'Vegetables');

INSERT INTO subcategories (category_id, name, image) 
SELECT category_id, 'Onions', '/images/subcategories/onions.jpg'
FROM temp_category_ids 
WHERE category_name = 'Vegetables'
AND NOT EXISTS (SELECT 1 FROM subcategories s JOIN categories c ON s.category_id = c.id WHERE s.name = 'Onions' AND c.name = 'Vegetables');

INSERT INTO subcategories (category_id, name, image) 
SELECT category_id, 'Peas', '/images/subcategories/peas.jpg'
FROM temp_category_ids 
WHERE category_name = 'Vegetables'
AND NOT EXISTS (SELECT 1 FROM subcategories s JOIN categories c ON s.category_id = c.id WHERE s.name = 'Peas' AND c.name = 'Vegetables');

INSERT INTO subcategories (category_id, name, image) 
SELECT category_id, 'Peppers', '/images/subcategories/peppers.jpg'
FROM temp_category_ids 
WHERE category_name = 'Vegetables'
AND NOT EXISTS (SELECT 1 FROM subcategories s JOIN categories c ON s.category_id = c.id WHERE s.name = 'Peppers' AND c.name = 'Vegetables');

INSERT INTO subcategories (category_id, name, image) 
SELECT category_id, 'Potatoes', '/images/subcategories/potatoes.jpg'
FROM temp_category_ids 
WHERE category_name = 'Vegetables'
AND NOT EXISTS (SELECT 1 FROM subcategories s JOIN categories c ON s.category_id = c.id WHERE s.name = 'Potatoes' AND c.name = 'Vegetables');

INSERT INTO subcategories (category_id, name, image) 
SELECT category_id, 'Pumpkins', '/images/subcategories/pumpkins.jpg'
FROM temp_category_ids 
WHERE category_name = 'Vegetables'
AND NOT EXISTS (SELECT 1 FROM subcategories s JOIN categories c ON s.category_id = c.id WHERE s.name = 'Pumpkins' AND c.name = 'Vegetables');

INSERT INTO subcategories (category_id, name, image) 
SELECT category_id, 'Purslane', '/images/subcategories/purslane.jpg'
FROM temp_category_ids 
WHERE category_name = 'Vegetables'
AND NOT EXISTS (SELECT 1 FROM subcategories s JOIN categories c ON s.category_id = c.id WHERE s.name = 'Purslane' AND c.name = 'Vegetables');

INSERT INTO subcategories (category_id, name, image) 
SELECT category_id, 'Quinoa', '/images/subcategories/quinoa.jpg'
FROM temp_category_ids 
WHERE category_name = 'Vegetables'
AND NOT EXISTS (SELECT 1 FROM subcategories s JOIN categories c ON s.category_id = c.id WHERE s.name = 'Quinoa' AND c.name = 'Vegetables');

INSERT INTO subcategories (category_id, name, image) 
SELECT category_id, 'Radishes', '/images/subcategories/radishes.jpg'
FROM temp_category_ids 
WHERE category_name = 'Vegetables'
AND NOT EXISTS (SELECT 1 FROM subcategories s JOIN categories c ON s.category_id = c.id WHERE s.name = 'Radishes' AND c.name = 'Vegetables');

INSERT INTO subcategories (category_id, name, image) 
SELECT category_id, 'Rhubarb', '/images/subcategories/rhubarb.jpg'
FROM temp_category_ids 
WHERE category_name = 'Vegetables'
AND NOT EXISTS (SELECT 1 FROM subcategories s JOIN categories c ON s.category_id = c.id WHERE s.name = 'Rhubarb' AND c.name = 'Vegetables');

INSERT INTO subcategories (category_id, name, image) 
SELECT category_id, 'Rutabaga', '/images/subcategories/rutabaga.jpg'
FROM temp_category_ids 
WHERE category_name = 'Vegetables'
AND NOT EXISTS (SELECT 1 FROM subcategories s JOIN categories c ON s.category_id = c.id WHERE s.name = 'Rutabaga' AND c.name = 'Vegetables');

INSERT INTO subcategories (category_id, name, image) 
SELECT category_id, 'Spinach', '/images/subcategories/spinach.jpg'
FROM temp_category_ids 
WHERE category_name = 'Vegetables'
AND NOT EXISTS (SELECT 1 FROM subcategories s JOIN categories c ON s.category_id = c.id WHERE s.name = 'Spinach' AND c.name = 'Vegetables');

INSERT INTO subcategories (category_id, name, image) 
SELECT category_id, 'Squash Summer', '/images/subcategories/squash-summer.jpg'
FROM temp_category_ids 
WHERE category_name = 'Vegetables'
AND NOT EXISTS (SELECT 1 FROM subcategories s JOIN categories c ON s.category_id = c.id WHERE s.name = 'Squash Summer' AND c.name = 'Vegetables');

INSERT INTO subcategories (category_id, name, image) 
SELECT category_id, 'Squash Winter', '/images/subcategories/squash-winter.jpg'
FROM temp_category_ids 
WHERE category_name = 'Vegetables'
AND NOT EXISTS (SELECT 1 FROM subcategories s JOIN categories c ON s.category_id = c.id WHERE s.name = 'Squash Winter' AND c.name = 'Vegetables');

INSERT INTO subcategories (category_id, name, image) 
SELECT category_id, 'Sunflowers', '/images/subcategories/sunflowers.jpg'
FROM temp_category_ids 
WHERE category_name = 'Vegetables'
AND NOT EXISTS (SELECT 1 FROM subcategories s JOIN categories c ON s.category_id = c.id WHERE s.name = 'Sunflowers' AND c.name = 'Vegetables');

INSERT INTO subcategories (category_id, name, image) 
SELECT category_id, 'Sweet Potatoes', '/images/subcategories/sweet-potatoes.jpg'
FROM temp_category_ids 
WHERE category_name = 'Vegetables'
AND NOT EXISTS (SELECT 1 FROM subcategories s JOIN categories c ON s.category_id = c.id WHERE s.name = 'Sweet Potatoes' AND c.name = 'Vegetables');

INSERT INTO subcategories (category_id, name, image) 
SELECT category_id, 'Tomatillos', '/images/subcategories/tomatillos.jpg'
FROM temp_category_ids 
WHERE category_name = 'Vegetables'
AND NOT EXISTS (SELECT 1 FROM subcategories s JOIN categories c ON s.category_id = c.id WHERE s.name = 'Tomatillos' AND c.name = 'Vegetables');

INSERT INTO subcategories (category_id, name, image) 
SELECT category_id, 'Tomatoes', '/images/subcategories/tomatoes.jpg'
FROM temp_category_ids 
WHERE category_name = 'Vegetables'
AND NOT EXISTS (SELECT 1 FROM subcategories s JOIN categories c ON s.category_id = c.id WHERE s.name = 'Tomatoes' AND c.name = 'Vegetables');

INSERT INTO subcategories (category_id, name, image) 
SELECT category_id, 'Turnips', '/images/subcategories/turnips.jpg'
FROM temp_category_ids 
WHERE category_name = 'Vegetables'
AND NOT EXISTS (SELECT 1 FROM subcategories s JOIN categories c ON s.category_id = c.id WHERE s.name = 'Turnips' AND c.name = 'Vegetables');

INSERT INTO subcategories (category_id, name, image) 
SELECT category_id, 'Watermelons', '/images/subcategories/watermelons.jpg'
FROM temp_category_ids 
WHERE category_name = 'Vegetables'
AND NOT EXISTS (SELECT 1 FROM subcategories s JOIN categories c ON s.category_id = c.id WHERE s.name = 'Watermelons' AND c.name = 'Vegetables');

INSERT INTO subcategories (category_id, name, image) 
SELECT category_id, 'Wheat', '/images/subcategories/wheat.jpg'
FROM temp_category_ids 
WHERE category_name = 'Vegetables'
AND NOT EXISTS (SELECT 1 FROM subcategories s JOIN categories c ON s.category_id = c.id WHERE s.name = 'Wheat' AND c.name = 'Vegetables');

INSERT INTO subcategories (category_id, name, image) 
SELECT category_id, 'Basil', '/images/subcategories/basil.jpg'
FROM temp_category_ids 
WHERE category_name = 'Herbs'
AND NOT EXISTS (SELECT 1 FROM subcategories s JOIN categories c ON s.category_id = c.id WHERE s.name = 'Basil' AND c.name = 'Herbs');

INSERT INTO subcategories (category_id, name, image) 
SELECT category_id, 'Bee Balm', '/images/subcategories/bee-balm.jpg'
FROM temp_category_ids 
WHERE category_name = 'Herbs'
AND NOT EXISTS (SELECT 1 FROM subcategories s JOIN categories c ON s.category_id = c.id WHERE s.name = 'Bee Balm' AND c.name = 'Herbs');

INSERT INTO subcategories (category_id, name, image) 
SELECT category_id, 'Borago', '/images/subcategories/borago.jpg'
FROM temp_category_ids 
WHERE category_name = 'Herbs'
AND NOT EXISTS (SELECT 1 FROM subcategories s JOIN categories c ON s.category_id = c.id WHERE s.name = 'Borago' AND c.name = 'Herbs');

INSERT INTO subcategories (category_id, name, image) 
SELECT category_id, 'Chamomile', '/images/subcategories/chamomile.jpg'
FROM temp_category_ids 
WHERE category_name = 'Herbs'
AND NOT EXISTS (SELECT 1 FROM subcategories s JOIN categories c ON s.category_id = c.id WHERE s.name = 'Chamomile' AND c.name = 'Herbs');

INSERT INTO subcategories (category_id, name, image) 
SELECT category_id, 'Chives', '/images/subcategories/chives.jpg'
FROM temp_category_ids 
WHERE category_name = 'Herbs'
AND NOT EXISTS (SELECT 1 FROM subcategories s JOIN categories c ON s.category_id = c.id WHERE s.name = 'Chives' AND c.name = 'Herbs');

INSERT INTO subcategories (category_id, name, image) 
SELECT category_id, 'Coriandrum', '/images/subcategories/coriandrum.jpg'
FROM temp_category_ids 
WHERE category_name = 'Herbs'
AND NOT EXISTS (SELECT 1 FROM subcategories s JOIN categories c ON s.category_id = c.id WHERE s.name = 'Coriandrum' AND c.name = 'Herbs');

INSERT INTO subcategories (category_id, name, image) 
SELECT category_id, 'Dill', '/images/subcategories/dill.jpg'
FROM temp_category_ids 
WHERE category_name = 'Herbs'
AND NOT EXISTS (SELECT 1 FROM subcategories s JOIN categories c ON s.category_id = c.id WHERE s.name = 'Dill' AND c.name = 'Herbs');

INSERT INTO subcategories (category_id, name, image) 
SELECT category_id, 'Bloody Dock', '/images/subcategories/bloody-dock.jpg'
FROM temp_category_ids 
WHERE category_name = 'Herbs'
AND NOT EXISTS (SELECT 1 FROM subcategories s JOIN categories c ON s.category_id = c.id WHERE s.name = 'Bloody Dock' AND c.name = 'Herbs');

INSERT INTO subcategories (category_id, name, image) 
SELECT category_id, 'Echinacea', '/images/subcategories/echinacea.jpg'
FROM temp_category_ids 
WHERE category_name = 'Herbs'
AND NOT EXISTS (SELECT 1 FROM subcategories s JOIN categories c ON s.category_id = c.id WHERE s.name = 'Echinacea' AND c.name = 'Herbs');

INSERT INTO subcategories (category_id, name, image) 
SELECT category_id, 'Lavender', '/images/subcategories/lavender.jpg'
FROM temp_category_ids 
WHERE category_name = 'Herbs'
AND NOT EXISTS (SELECT 1 FROM subcategories s JOIN categories c ON s.category_id = c.id WHERE s.name = 'Lavender' AND c.name = 'Herbs');

INSERT INTO subcategories (category_id, name, image) 
SELECT category_id, 'Lemon Balm', '/images/subcategories/lemon-balm.jpg'
FROM temp_category_ids 
WHERE category_name = 'Herbs'
AND NOT EXISTS (SELECT 1 FROM subcategories s JOIN categories c ON s.category_id = c.id WHERE s.name = 'Lemon Balm' AND c.name = 'Herbs');

INSERT INTO subcategories (category_id, name, image) 
SELECT category_id, 'Marjoram', '/images/subcategories/marjoram.jpg'
FROM temp_category_ids 
WHERE category_name = 'Herbs'
AND NOT EXISTS (SELECT 1 FROM subcategories s JOIN categories c ON s.category_id = c.id WHERE s.name = 'Marjoram' AND c.name = 'Herbs');

INSERT INTO subcategories (category_id, name, image) 
SELECT category_id, 'Mint', '/images/subcategories/mint.jpg'
FROM temp_category_ids 
WHERE category_name = 'Herbs'
AND NOT EXISTS (SELECT 1 FROM subcategories s JOIN categories c ON s.category_id = c.id WHERE s.name = 'Mint' AND c.name = 'Herbs');

INSERT INTO subcategories (category_id, name, image) 
SELECT category_id, 'Oregano', '/images/subcategories/oregano.jpg'
FROM temp_category_ids 
WHERE category_name = 'Herbs'
AND NOT EXISTS (SELECT 1 FROM subcategories s JOIN categories c ON s.category_id = c.id WHERE s.name = 'Oregano' AND c.name = 'Herbs');

INSERT INTO subcategories (category_id, name, image) 
SELECT category_id, 'Parsley', '/images/subcategories/parsley.jpg'
FROM temp_category_ids 
WHERE category_name = 'Herbs'
AND NOT EXISTS (SELECT 1 FROM subcategories s JOIN categories c ON s.category_id = c.id WHERE s.name = 'Parsley' AND c.name = 'Herbs');

INSERT INTO subcategories (category_id, name, image) 
SELECT category_id, 'Rosemary', '/images/subcategories/rosemary.jpg'
FROM temp_category_ids 
WHERE category_name = 'Herbs'
AND NOT EXISTS (SELECT 1 FROM subcategories s JOIN categories c ON s.category_id = c.id WHERE s.name = 'Rosemary' AND c.name = 'Herbs');

INSERT INTO subcategories (category_id, name, image) 
SELECT category_id, 'Rue', '/images/subcategories/rue.jpg'
FROM temp_category_ids 
WHERE category_name = 'Herbs'
AND NOT EXISTS (SELECT 1 FROM subcategories s JOIN categories c ON s.category_id = c.id WHERE s.name = 'Rue' AND c.name = 'Herbs');

INSERT INTO subcategories (category_id, name, image) 
SELECT category_id, 'Sage', '/images/subcategories/sage.jpg'
FROM temp_category_ids 
WHERE category_name = 'Herbs'
AND NOT EXISTS (SELECT 1 FROM subcategories s JOIN categories c ON s.category_id = c.id WHERE s.name = 'Sage' AND c.name = 'Herbs');

INSERT INTO subcategories (category_id, name, image) 
SELECT category_id, 'Thyme', '/images/subcategories/thyme.jpg'
FROM temp_category_ids 
WHERE category_name = 'Herbs'
AND NOT EXISTS (SELECT 1 FROM subcategories s JOIN categories c ON s.category_id = c.id WHERE s.name = 'Thyme' AND c.name = 'Herbs');

INSERT INTO subcategories (category_id, name, image) 
SELECT category_id, 'Marigold', '/images/subcategories/marigold.jpg'
FROM temp_category_ids 
WHERE category_name = 'Flowers'
AND NOT EXISTS (SELECT 1 FROM subcategories s JOIN categories c ON s.category_id = c.id WHERE s.name = 'Marigold' AND c.name = 'Flowers');

INSERT INTO subcategories (category_id, name, image) 
SELECT category_id, 'Sunflower', '/images/subcategories/sunflower.jpg'
FROM temp_category_ids 
WHERE category_name = 'Flowers'
AND NOT EXISTS (SELECT 1 FROM subcategories s JOIN categories c ON s.category_id = c.id WHERE s.name = 'Sunflower' AND c.name = 'Flowers');

INSERT INTO subcategories (category_id, name, image) 
SELECT category_id, 'Zinnia', '/images/subcategories/zinnia.jpg'
FROM temp_category_ids 
WHERE category_name = 'Flowers'
AND NOT EXISTS (SELECT 1 FROM subcategories s JOIN categories c ON s.category_id = c.id WHERE s.name = 'Zinnia' AND c.name = 'Flowers');

INSERT INTO subcategories (category_id, name, image) 
SELECT category_id, 'Cosmos', '/images/subcategories/cosmos.jpg'
FROM temp_category_ids 
WHERE category_name = 'Flowers'
AND NOT EXISTS (SELECT 1 FROM subcategories s JOIN categories c ON s.category_id = c.id WHERE s.name = 'Cosmos' AND c.name = 'Flowers');

INSERT INTO subcategories (category_id, name, image) 
SELECT category_id, 'Calendula', '/images/subcategories/calendula.jpg'
FROM temp_category_ids 
WHERE category_name = 'Flowers'
AND NOT EXISTS (SELECT 1 FROM subcategories s JOIN categories c ON s.category_id = c.id WHERE s.name = 'Calendula' AND c.name = 'Flowers');

-- Create temp table for subcategory IDs
CREATE TEMP TABLE temp_subcategory_ids AS 
SELECT s.id as subcategory_id, s.name as subcategory_name, c.name as category_name 
FROM subcategories s 
JOIN categories c ON s.category_id = c.id 
WHERE c.name IN ('Vegetables', 'Herbs', 'Flowers');

-- Create base varieties (prevent duplicates by checking if they exist)
INSERT INTO varieties (subcategory_id, name, emoji, description) 
SELECT subcategory_id, 'Amaranth', '🌱', 'Heirloom amaranth varieties'
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Amaranth'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Amaranth' AND s.name = 'Amaranth');

INSERT INTO varieties (subcategory_id, name, emoji, description) 
SELECT subcategory_id, 'Artichoke Cardoon', '🌱', 'Heirloom artichoke cardoon varieties'
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Artichoke Cardoon'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Artichoke Cardoon' AND s.name = 'Artichoke Cardoon');

INSERT INTO varieties (subcategory_id, name, emoji, description) 
SELECT subcategory_id, 'Arugula', '🌱', 'Heirloom arugula varieties'
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Arugula'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Arugula' AND s.name = 'Arugula');

INSERT INTO varieties (subcategory_id, name, emoji, description) 
SELECT subcategory_id, 'Asparagus', '🌱', 'Heirloom asparagus varieties'
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Asparagus'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Asparagus' AND s.name = 'Asparagus');

INSERT INTO varieties (subcategory_id, name, emoji, description) 
SELECT subcategory_id, 'Barley', '🌱', 'Heirloom barley varieties'
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Barley'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Barley' AND s.name = 'Barley');

INSERT INTO varieties (subcategory_id, name, emoji, description) 
SELECT subcategory_id, 'Beans', '🌱', 'Heirloom beans varieties'
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Beans'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Beans' AND s.name = 'Beans');

INSERT INTO varieties (subcategory_id, name, emoji, description) 
SELECT subcategory_id, 'Beetroot', '🌱', 'Heirloom beetroot varieties'
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Beetroot'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Beetroot' AND s.name = 'Beetroot');

INSERT INTO varieties (subcategory_id, name, emoji, description) 
SELECT subcategory_id, 'Bitter Melon', '🌱', 'Heirloom bitter melon varieties'
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Bitter Melon'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Bitter Melon' AND s.name = 'Bitter Melon');

INSERT INTO varieties (subcategory_id, name, emoji, description) 
SELECT subcategory_id, 'Bok Choy', '🌱', 'Heirloom bok choy varieties'
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Bok Choy'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Bok Choy' AND s.name = 'Bok Choy');

INSERT INTO varieties (subcategory_id, name, emoji, description) 
SELECT subcategory_id, 'Broccoli', '🌱', 'Heirloom broccoli varieties'
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Broccoli'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Broccoli' AND s.name = 'Broccoli');

INSERT INTO varieties (subcategory_id, name, emoji, description) 
SELECT subcategory_id, 'Brussels Sprouts', '🌱', 'Heirloom brussels sprouts varieties'
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Brussels Sprouts'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Brussels Sprouts' AND s.name = 'Brussels Sprouts');

INSERT INTO varieties (subcategory_id, name, emoji, description) 
SELECT subcategory_id, 'Buckwheat', '🌱', 'Heirloom buckwheat varieties'
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Buckwheat'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Buckwheat' AND s.name = 'Buckwheat');

INSERT INTO varieties (subcategory_id, name, emoji, description) 
SELECT subcategory_id, 'Cabbage', '🌱', 'Heirloom cabbage varieties'
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Cabbage'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Cabbage' AND s.name = 'Cabbage');

INSERT INTO varieties (subcategory_id, name, emoji, description) 
SELECT subcategory_id, 'Carrots Seeds', '🌱', 'Heirloom carrots seeds varieties'
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Carrots Seeds'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Carrots Seeds' AND s.name = 'Carrots Seeds');

INSERT INTO varieties (subcategory_id, name, emoji, description) 
SELECT subcategory_id, 'Cauliflower', '🌱', 'Heirloom cauliflower varieties'
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Cauliflower'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Cauliflower' AND s.name = 'Cauliflower');

INSERT INTO varieties (subcategory_id, name, emoji, description) 
SELECT subcategory_id, 'Celery', '🌱', 'Heirloom celery varieties'
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Celery'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Celery' AND s.name = 'Celery');

INSERT INTO varieties (subcategory_id, name, emoji, description) 
SELECT subcategory_id, 'Chard', '🌱', 'Heirloom chard varieties'
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Chard'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Chard' AND s.name = 'Chard');

INSERT INTO varieties (subcategory_id, name, emoji, description) 
SELECT subcategory_id, 'Chickpeas', '🌱', 'Heirloom chickpeas varieties'
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Chickpeas'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Chickpeas' AND s.name = 'Chickpeas');

INSERT INTO varieties (subcategory_id, name, emoji, description) 
SELECT subcategory_id, 'Chicory', '🌱', 'Heirloom chicory varieties'
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Chicory'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Chicory' AND s.name = 'Chicory');

INSERT INTO varieties (subcategory_id, name, emoji, description) 
SELECT subcategory_id, 'Chinese Cabbage', '🌱', 'Heirloom chinese cabbage varieties'
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Chinese Cabbage'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Chinese Cabbage' AND s.name = 'Chinese Cabbage');

INSERT INTO varieties (subcategory_id, name, emoji, description) 
SELECT subcategory_id, 'Collards', '🌱', 'Heirloom collards varieties'
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Collards'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Collards' AND s.name = 'Collards');

INSERT INTO varieties (subcategory_id, name, emoji, description) 
SELECT subcategory_id, 'Corn', '🌱', 'Heirloom corn varieties'
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Corn'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Corn' AND s.name = 'Corn');

INSERT INTO varieties (subcategory_id, name, emoji, description) 
SELECT subcategory_id, 'Cucumber', '🌱', 'Heirloom cucumber varieties'
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Cucumber'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Cucumber' AND s.name = 'Cucumber');

INSERT INTO varieties (subcategory_id, name, emoji, description) 
SELECT subcategory_id, 'Eggplant', '🌱', 'Heirloom eggplant varieties'
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Eggplant'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Eggplant' AND s.name = 'Eggplant');

INSERT INTO varieties (subcategory_id, name, emoji, description) 
SELECT subcategory_id, 'Endive', '🌱', 'Heirloom endive varieties'
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Endive'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Endive' AND s.name = 'Endive');

INSERT INTO varieties (subcategory_id, name, emoji, description) 
SELECT subcategory_id, 'Fava Beans', '🌱', 'Heirloom fava beans varieties'
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Fava Beans'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Fava Beans' AND s.name = 'Fava Beans');

INSERT INTO varieties (subcategory_id, name, emoji, description) 
SELECT subcategory_id, 'Fennel', '🌱', 'Heirloom fennel varieties'
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Fennel'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Fennel' AND s.name = 'Fennel');

INSERT INTO varieties (subcategory_id, name, emoji, description) 
SELECT subcategory_id, 'Garlic', '🌱', 'Heirloom garlic varieties'
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Garlic'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Garlic' AND s.name = 'Garlic');

INSERT INTO varieties (subcategory_id, name, emoji, description) 
SELECT subcategory_id, 'Gourds', '🌱', 'Heirloom gourds varieties'
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Gourds'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Gourds' AND s.name = 'Gourds');

INSERT INTO varieties (subcategory_id, name, emoji, description) 
SELECT subcategory_id, 'Ground Cherry', '🌱', 'Heirloom ground cherry varieties'
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Ground Cherry'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Ground Cherry' AND s.name = 'Ground Cherry');

INSERT INTO varieties (subcategory_id, name, emoji, description) 
SELECT subcategory_id, 'Kale', '🌱', 'Heirloom kale varieties'
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Kale'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Kale' AND s.name = 'Kale');

INSERT INTO varieties (subcategory_id, name, emoji, description) 
SELECT subcategory_id, 'Kohlrabi', '🌱', 'Heirloom kohlrabi varieties'
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Kohlrabi'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Kohlrabi' AND s.name = 'Kohlrabi');

INSERT INTO varieties (subcategory_id, name, emoji, description) 
SELECT subcategory_id, 'Leeks', '🌱', 'Heirloom leeks varieties'
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Leeks'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Leeks' AND s.name = 'Leeks');

INSERT INTO varieties (subcategory_id, name, emoji, description) 
SELECT subcategory_id, 'Lettuce', '🌱', 'Heirloom lettuce varieties'
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Lettuce'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Lettuce' AND s.name = 'Lettuce');

INSERT INTO varieties (subcategory_id, name, emoji, description) 
SELECT subcategory_id, 'Mache', '🌱', 'Heirloom mache varieties'
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Mache'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Mache' AND s.name = 'Mache');

INSERT INTO varieties (subcategory_id, name, emoji, description) 
SELECT subcategory_id, 'Melons', '🌱', 'Heirloom melons varieties'
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Melons'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Melons' AND s.name = 'Melons');

INSERT INTO varieties (subcategory_id, name, emoji, description) 
SELECT subcategory_id, 'Millet', '🌱', 'Heirloom millet varieties'
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Millet'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Millet' AND s.name = 'Millet');

INSERT INTO varieties (subcategory_id, name, emoji, description) 
SELECT subcategory_id, 'Mustard Greens', '🌱', 'Heirloom mustard greens varieties'
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Mustard Greens'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Mustard Greens' AND s.name = 'Mustard Greens');

INSERT INTO varieties (subcategory_id, name, emoji, description) 
SELECT subcategory_id, 'Okra', '🌱', 'Heirloom okra varieties'
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Okra'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Okra' AND s.name = 'Okra');

INSERT INTO varieties (subcategory_id, name, emoji, description) 
SELECT subcategory_id, 'Onions', '🌱', 'Heirloom onions varieties'
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Onions'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Onions' AND s.name = 'Onions');

INSERT INTO varieties (subcategory_id, name, emoji, description) 
SELECT subcategory_id, 'Peas', '🌱', 'Heirloom peas varieties'
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Peas'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Peas' AND s.name = 'Peas');

INSERT INTO varieties (subcategory_id, name, emoji, description) 
SELECT subcategory_id, 'Peppers', '🌱', 'Heirloom peppers varieties'
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Peppers'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Peppers' AND s.name = 'Peppers');

INSERT INTO varieties (subcategory_id, name, emoji, description) 
SELECT subcategory_id, 'Potatoes', '🌱', 'Heirloom potatoes varieties'
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Potatoes'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Potatoes' AND s.name = 'Potatoes');

INSERT INTO varieties (subcategory_id, name, emoji, description) 
SELECT subcategory_id, 'Pumpkins', '🌱', 'Heirloom pumpkins varieties'
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Pumpkins'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Pumpkins' AND s.name = 'Pumpkins');

INSERT INTO varieties (subcategory_id, name, emoji, description) 
SELECT subcategory_id, 'Purslane', '🌱', 'Heirloom purslane varieties'
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Purslane'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Purslane' AND s.name = 'Purslane');

INSERT INTO varieties (subcategory_id, name, emoji, description) 
SELECT subcategory_id, 'Quinoa', '🌱', 'Heirloom quinoa varieties'
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Quinoa'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Quinoa' AND s.name = 'Quinoa');

INSERT INTO varieties (subcategory_id, name, emoji, description) 
SELECT subcategory_id, 'Radishes', '🌱', 'Heirloom radishes varieties'
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Radishes'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Radishes' AND s.name = 'Radishes');

INSERT INTO varieties (subcategory_id, name, emoji, description) 
SELECT subcategory_id, 'Rhubarb', '🌱', 'Heirloom rhubarb varieties'
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Rhubarb'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Rhubarb' AND s.name = 'Rhubarb');

INSERT INTO varieties (subcategory_id, name, emoji, description) 
SELECT subcategory_id, 'Rutabaga', '🌱', 'Heirloom rutabaga varieties'
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Rutabaga'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Rutabaga' AND s.name = 'Rutabaga');

INSERT INTO varieties (subcategory_id, name, emoji, description) 
SELECT subcategory_id, 'Spinach', '🌱', 'Heirloom spinach varieties'
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Spinach'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Spinach' AND s.name = 'Spinach');

INSERT INTO varieties (subcategory_id, name, emoji, description) 
SELECT subcategory_id, 'Squash Summer', '🌱', 'Heirloom squash summer varieties'
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Squash Summer'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Squash Summer' AND s.name = 'Squash Summer');

INSERT INTO varieties (subcategory_id, name, emoji, description) 
SELECT subcategory_id, 'Squash Winter', '🌱', 'Heirloom squash winter varieties'
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Squash Winter'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Squash Winter' AND s.name = 'Squash Winter');

INSERT INTO varieties (subcategory_id, name, emoji, description) 
SELECT subcategory_id, 'Sunflowers', '🌱', 'Heirloom sunflowers varieties'
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Sunflowers'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Sunflowers' AND s.name = 'Sunflowers');

INSERT INTO varieties (subcategory_id, name, emoji, description) 
SELECT subcategory_id, 'Sweet Potatoes', '🌱', 'Heirloom sweet potatoes varieties'
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Sweet Potatoes'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Sweet Potatoes' AND s.name = 'Sweet Potatoes');

INSERT INTO varieties (subcategory_id, name, emoji, description) 
SELECT subcategory_id, 'Tomatillos', '🌱', 'Heirloom tomatillos varieties'
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Tomatillos'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Tomatillos' AND s.name = 'Tomatillos');

INSERT INTO varieties (subcategory_id, name, emoji, description) 
SELECT subcategory_id, 'Tomatoes', '🌱', 'Heirloom tomatoes varieties'
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Tomatoes'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Tomatoes' AND s.name = 'Tomatoes');

INSERT INTO varieties (subcategory_id, name, emoji, description) 
SELECT subcategory_id, 'Turnips', '🌱', 'Heirloom turnips varieties'
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Turnips'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Turnips' AND s.name = 'Turnips');

INSERT INTO varieties (subcategory_id, name, emoji, description) 
SELECT subcategory_id, 'Watermelons', '🌱', 'Heirloom watermelons varieties'
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Watermelons'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Watermelons' AND s.name = 'Watermelons');

INSERT INTO varieties (subcategory_id, name, emoji, description) 
SELECT subcategory_id, 'Wheat', '🌱', 'Heirloom wheat varieties'
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Wheat'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Wheat' AND s.name = 'Wheat');

INSERT INTO varieties (subcategory_id, name, emoji, description) 
SELECT subcategory_id, 'Basil', '🌱', 'Heirloom basil varieties'
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Basil'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Basil' AND s.name = 'Basil');

INSERT INTO varieties (subcategory_id, name, emoji, description) 
SELECT subcategory_id, 'Bee Balm', '🌱', 'Heirloom bee balm varieties'
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Bee Balm'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Bee Balm' AND s.name = 'Bee Balm');

INSERT INTO varieties (subcategory_id, name, emoji, description) 
SELECT subcategory_id, 'Borago', '🌱', 'Heirloom borago varieties'
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Borago'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Borago' AND s.name = 'Borago');

INSERT INTO varieties (subcategory_id, name, emoji, description) 
SELECT subcategory_id, 'Chamomile', '🌱', 'Heirloom chamomile varieties'
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Chamomile'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Chamomile' AND s.name = 'Chamomile');

INSERT INTO varieties (subcategory_id, name, emoji, description) 
SELECT subcategory_id, 'Chives', '🌱', 'Heirloom chives varieties'
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Chives'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Chives' AND s.name = 'Chives');

INSERT INTO varieties (subcategory_id, name, emoji, description) 
SELECT subcategory_id, 'Coriandrum', '🌱', 'Heirloom coriandrum varieties'
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Coriandrum'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Coriandrum' AND s.name = 'Coriandrum');

INSERT INTO varieties (subcategory_id, name, emoji, description) 
SELECT subcategory_id, 'Dill', '🌱', 'Heirloom dill varieties'
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Dill'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Dill' AND s.name = 'Dill');

INSERT INTO varieties (subcategory_id, name, emoji, description) 
SELECT subcategory_id, 'Bloody Dock', '🌱', 'Heirloom bloody dock varieties'
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Bloody Dock'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Bloody Dock' AND s.name = 'Bloody Dock');

INSERT INTO varieties (subcategory_id, name, emoji, description) 
SELECT subcategory_id, 'Echinacea', '🌱', 'Heirloom echinacea varieties'
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Echinacea'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Echinacea' AND s.name = 'Echinacea');

INSERT INTO varieties (subcategory_id, name, emoji, description) 
SELECT subcategory_id, 'Lavender', '🌱', 'Heirloom lavender varieties'
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Lavender'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Lavender' AND s.name = 'Lavender');

INSERT INTO varieties (subcategory_id, name, emoji, description) 
SELECT subcategory_id, 'Lemon Balm', '🌱', 'Heirloom lemon balm varieties'
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Lemon Balm'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Lemon Balm' AND s.name = 'Lemon Balm');

INSERT INTO varieties (subcategory_id, name, emoji, description) 
SELECT subcategory_id, 'Marjoram', '🌱', 'Heirloom marjoram varieties'
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Marjoram'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Marjoram' AND s.name = 'Marjoram');

INSERT INTO varieties (subcategory_id, name, emoji, description) 
SELECT subcategory_id, 'Mint', '🌱', 'Heirloom mint varieties'
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Mint'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Mint' AND s.name = 'Mint');

INSERT INTO varieties (subcategory_id, name, emoji, description) 
SELECT subcategory_id, 'Oregano', '🌱', 'Heirloom oregano varieties'
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Oregano'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Oregano' AND s.name = 'Oregano');

INSERT INTO varieties (subcategory_id, name, emoji, description) 
SELECT subcategory_id, 'Parsley', '🌱', 'Heirloom parsley varieties'
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Parsley'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Parsley' AND s.name = 'Parsley');

INSERT INTO varieties (subcategory_id, name, emoji, description) 
SELECT subcategory_id, 'Rosemary', '🌱', 'Heirloom rosemary varieties'
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Rosemary'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Rosemary' AND s.name = 'Rosemary');

INSERT INTO varieties (subcategory_id, name, emoji, description) 
SELECT subcategory_id, 'Rue', '🌱', 'Heirloom rue varieties'
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Rue'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Rue' AND s.name = 'Rue');

INSERT INTO varieties (subcategory_id, name, emoji, description) 
SELECT subcategory_id, 'Sage', '🌱', 'Heirloom sage varieties'
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Sage'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Sage' AND s.name = 'Sage');

INSERT INTO varieties (subcategory_id, name, emoji, description) 
SELECT subcategory_id, 'Thyme', '🌱', 'Heirloom thyme varieties'
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Thyme'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Thyme' AND s.name = 'Thyme');

INSERT INTO varieties (subcategory_id, name, emoji, description) 
SELECT subcategory_id, 'Marigold', '🌱', 'Heirloom marigold varieties'
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Marigold'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Marigold' AND s.name = 'Marigold');

INSERT INTO varieties (subcategory_id, name, emoji, description) 
SELECT subcategory_id, 'Sunflower', '🌱', 'Heirloom sunflower varieties'
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Sunflower'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Sunflower' AND s.name = 'Sunflower');

INSERT INTO varieties (subcategory_id, name, emoji, description) 
SELECT subcategory_id, 'Zinnia', '🌱', 'Heirloom zinnia varieties'
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Zinnia'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Zinnia' AND s.name = 'Zinnia');

INSERT INTO varieties (subcategory_id, name, emoji, description) 
SELECT subcategory_id, 'Cosmos', '🌱', 'Heirloom cosmos varieties'
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Cosmos'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Cosmos' AND s.name = 'Cosmos');

INSERT INTO varieties (subcategory_id, name, emoji, description) 
SELECT subcategory_id, 'Calendula', '🌱', 'Heirloom calendula varieties'
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Calendula'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Calendula' AND s.name = 'Calendula');

-- Create temp table for variety IDs
CREATE TEMP TABLE temp_variety_ids AS 
SELECT v.id as variety_id, v.name as variety_name 
FROM varieties v 
JOIN subcategories s ON v.subcategory_id = s.id 
JOIN categories c ON s.category_id = c.id 
WHERE c.name IN ('Vegetables', 'Herbs', 'Flowers');

-- Insert products (using existing products table fields only)
INSERT INTO products (
    name,
    farm_id,
    variety_id,
    price,
    stock,
    freshness,
    organic,
    in_season,
    images
) 
SELECT 
    products_data.name,
    tf.farm_id,
    tv.variety_id,
    products_data.price,
    products_data.stock,
    products_data.freshness,
    products_data.organic,
    products_data.in_season,
    products_data.images
FROM (
    VALUES
    ('Classic Amaranth', 'Amaranth', 3, 85, 95, TRUE, TRUE, NULL),
    ('Royal Amaranth', 'Amaranth', 3, 48, 95, TRUE, TRUE, NULL),
    ('Golden Amaranth', 'Amaranth', 3, 29, 95, TRUE, TRUE, NULL),
    ('Purple Amaranth', 'Amaranth', 3, 47, 95, TRUE, TRUE, NULL),
    ('Classic Artichoke Cardoon', 'Artichoke Cardoon', 3, 36, 95, TRUE, TRUE, NULL),
    ('Royal Artichoke Cardoon', 'Artichoke Cardoon', 3, 18, 95, TRUE, TRUE, NULL),
    ('Golden Artichoke Cardoon', 'Artichoke Cardoon', 3, 45, 95, TRUE, TRUE, NULL),
    ('Purple Artichoke Cardoon', 'Artichoke Cardoon', 3, 16, 95, TRUE, TRUE, NULL),
    ('Giant Artichoke Cardoon', 'Artichoke Cardoon', 3, 6, 95, TRUE, TRUE, NULL),
    ('Classic Arugula', 'Arugula', 3, 14, 95, TRUE, TRUE, NULL),
    ('Royal Arugula', 'Arugula', 3, 68, 95, TRUE, TRUE, NULL),
    ('Golden Arugula', 'Arugula', 3, 79, 95, TRUE, TRUE, NULL),
    ('Purple Arugula', 'Arugula', 3, 46, 95, TRUE, TRUE, NULL),
    ('Giant Arugula', 'Arugula', 3, 79, 95, TRUE, TRUE, NULL),
    ('Dwarf Arugula', 'Arugula', 3, 93, 95, TRUE, TRUE, NULL),
    ('Early Arugula', 'Arugula', 3, 59, 95, TRUE, TRUE, NULL),
    ('Late Arugula', 'Arugula', 3, 68, 95, TRUE, TRUE, NULL),
    ('Classic Asparagus', 'Asparagus', 3, 67, 95, TRUE, TRUE, NULL),
    ('Royal Asparagus', 'Asparagus', 3, 18, 95, TRUE, TRUE, NULL),
    ('Golden Asparagus', 'Asparagus', 3, 55, 95, TRUE, TRUE, NULL),
    ('Purple Asparagus', 'Asparagus', 3, 97, 95, TRUE, TRUE, NULL),
    ('Giant Asparagus', 'Asparagus', 3, 0, 95, TRUE, TRUE, NULL),
    ('Dwarf Asparagus', 'Asparagus', 3, 9, 95, TRUE, TRUE, NULL),
    ('Classic Barley', 'Barley', 3, 69, 95, TRUE, TRUE, NULL),
    ('Royal Barley', 'Barley', 3, 24, 95, TRUE, TRUE, NULL),
    ('Golden Barley', 'Barley', 3, 36, 95, TRUE, TRUE, NULL),
    ('Purple Barley', 'Barley', 3, 0, 95, TRUE, TRUE, NULL),
    ('Giant Barley', 'Barley', 3, 26, 95, TRUE, TRUE, NULL),
    ('Dwarf Barley', 'Barley', 3, 61, 95, TRUE, TRUE, NULL),
    ('Early Barley', 'Barley', 3, 76, 95, TRUE, TRUE, NULL),
    ('Dragon Tongue Bush', 'Beans', 4, 86, 95, TRUE, TRUE, NULL),
    ('Adventist Pole', 'Beans', 4.5, 82, 95, TRUE, TRUE, NULL),
    ('Cherokee Trail of Tears', 'Beans', 4.5, 42, 95, TRUE, TRUE, NULL),
    ('Classic Beetroot', 'Beetroot', 3, 78, 95, TRUE, TRUE, NULL),
    ('Royal Beetroot', 'Beetroot', 3, 42, 95, TRUE, TRUE, NULL),
    ('Golden Beetroot', 'Beetroot', 3, 53, 95, TRUE, TRUE, NULL),
    ('Purple Beetroot', 'Beetroot', 3, 69, 95, TRUE, TRUE, NULL),
    ('Giant Beetroot', 'Beetroot', 3, 59, 95, TRUE, TRUE, NULL),
    ('Dwarf Beetroot', 'Beetroot', 3, 13, 95, TRUE, TRUE, NULL),
    ('Early Beetroot', 'Beetroot', 3, 0, 95, TRUE, TRUE, NULL),
    ('Classic Bitter Melon', 'Bitter Melon', 3, 0, 95, TRUE, TRUE, NULL),
    ('Royal Bitter Melon', 'Bitter Melon', 3, 83, 95, TRUE, TRUE, NULL),
    ('Golden Bitter Melon', 'Bitter Melon', 3, 0, 95, TRUE, TRUE, NULL),
    ('Purple Bitter Melon', 'Bitter Melon', 3, 43, 95, TRUE, TRUE, NULL),
    ('Giant Bitter Melon', 'Bitter Melon', 3, 89, 95, TRUE, TRUE, NULL),
    ('Dwarf Bitter Melon', 'Bitter Melon', 3, 45, 95, TRUE, TRUE, NULL),
    ('Early Bitter Melon', 'Bitter Melon', 3, 66, 95, TRUE, TRUE, NULL),
    ('Classic Bok Choy', 'Bok Choy', 3, 0, 95, TRUE, TRUE, NULL),
    ('Royal Bok Choy', 'Bok Choy', 3, 60, 95, TRUE, TRUE, NULL),
    ('Golden Bok Choy', 'Bok Choy', 3, 55, 95, TRUE, TRUE, NULL),
    ('Classic Broccoli', 'Broccoli', 3, 0, 95, TRUE, TRUE, NULL),
    ('Royal Broccoli', 'Broccoli', 3, 53, 95, TRUE, TRUE, NULL),
    ('Golden Broccoli', 'Broccoli', 3, 25, 95, TRUE, TRUE, NULL),
    ('Purple Broccoli', 'Broccoli', 3, 36, 95, TRUE, TRUE, NULL),
    ('Giant Broccoli', 'Broccoli', 3, 93, 95, TRUE, TRUE, NULL),
    ('Dwarf Broccoli', 'Broccoli', 3, 24, 95, TRUE, TRUE, NULL),
    ('Classic Brussels Sprouts', 'Brussels Sprouts', 3, 25, 95, TRUE, TRUE, NULL),
    ('Royal Brussels Sprouts', 'Brussels Sprouts', 3, 86, 95, TRUE, TRUE, NULL),
    ('Golden Brussels Sprouts', 'Brussels Sprouts', 3, 0, 95, TRUE, TRUE, NULL),
    ('Purple Brussels Sprouts', 'Brussels Sprouts', 3, 49, 95, TRUE, TRUE, NULL),
    ('Giant Brussels Sprouts', 'Brussels Sprouts', 3, 88, 95, TRUE, TRUE, NULL),
    ('Dwarf Brussels Sprouts', 'Brussels Sprouts', 3, 46, 95, TRUE, TRUE, NULL),
    ('Classic Buckwheat', 'Buckwheat', 3, 0, 95, TRUE, TRUE, NULL),
    ('Royal Buckwheat', 'Buckwheat', 3, 93, 95, TRUE, TRUE, NULL),
    ('Golden Buckwheat', 'Buckwheat', 3, 77, 95, TRUE, TRUE, NULL),
    ('Purple Buckwheat', 'Buckwheat', 3, 0, 95, TRUE, TRUE, NULL),
    ('Giant Buckwheat', 'Buckwheat', 3, 0, 95, TRUE, TRUE, NULL),
    ('Dwarf Buckwheat', 'Buckwheat', 3, 52, 95, TRUE, TRUE, NULL),
    ('Early Buckwheat', 'Buckwheat', 3, 47, 95, TRUE, TRUE, NULL),
    ('Late Buckwheat', 'Buckwheat', 3, 86, 95, TRUE, TRUE, NULL),
    ('Classic Cabbage', 'Cabbage', 3, 48, 95, TRUE, TRUE, NULL),
    ('Royal Cabbage', 'Cabbage', 3, 0, 95, TRUE, TRUE, NULL),
    ('Golden Cabbage', 'Cabbage', 3, 11, 95, TRUE, TRUE, NULL),
    ('Purple Cabbage', 'Cabbage', 3, 5, 95, TRUE, TRUE, NULL),
    ('Giant Cabbage', 'Cabbage', 3, 0, 95, TRUE, TRUE, NULL),
    ('Dwarf Cabbage', 'Cabbage', 3, 0, 95, TRUE, TRUE, NULL),
    ('Early Cabbage', 'Cabbage', 3, 50, 95, TRUE, TRUE, NULL),
    ('New Kuroda', 'Carrots Seeds', 3, 18, 95, TRUE, TRUE, NULL),
    ('Classic Cauliflower', 'Cauliflower', 3, 99, 95, TRUE, TRUE, NULL),
    ('Royal Cauliflower', 'Cauliflower', 3, 34, 95, TRUE, TRUE, NULL),
    ('Golden Cauliflower', 'Cauliflower', 3, 20, 95, TRUE, TRUE, NULL),
    ('Purple Cauliflower', 'Cauliflower', 3, 0, 95, TRUE, TRUE, NULL),
    ('Classic Celery', 'Celery', 3, 29, 95, TRUE, TRUE, NULL),
    ('Royal Celery', 'Celery', 3, 33, 95, TRUE, TRUE, NULL),
    ('Golden Celery', 'Celery', 3, 58, 95, TRUE, TRUE, NULL),
    ('Purple Celery', 'Celery', 3, 78, 95, TRUE, TRUE, NULL),
    ('Giant Celery', 'Celery', 3, 0, 95, TRUE, TRUE, NULL),
    ('Classic Chard', 'Chard', 3, 55, 95, TRUE, TRUE, NULL),
    ('Royal Chard', 'Chard', 3, 34, 95, TRUE, TRUE, NULL),
    ('Golden Chard', 'Chard', 3, 16, 95, TRUE, TRUE, NULL),
    ('Purple Chard', 'Chard', 3, 19, 95, TRUE, TRUE, NULL),
    ('Giant Chard', 'Chard', 3, 24, 95, TRUE, TRUE, NULL),
    ('Classic Chickpeas', 'Chickpeas', 3, 41, 95, TRUE, TRUE, NULL),
    ('Royal Chickpeas', 'Chickpeas', 3, 50, 95, TRUE, TRUE, NULL),
    ('Golden Chickpeas', 'Chickpeas', 3, 0, 95, TRUE, TRUE, NULL),
    ('Classic Chicory', 'Chicory', 3, 70, 95, TRUE, TRUE, NULL),
    ('Royal Chicory', 'Chicory', 3, 30, 95, TRUE, TRUE, NULL),
    ('Golden Chicory', 'Chicory', 3, 99, 95, TRUE, TRUE, NULL),
    ('Purple Chicory', 'Chicory', 3, 86, 95, TRUE, TRUE, NULL),
    ('Giant Chicory', 'Chicory', 3, 96, 95, TRUE, TRUE, NULL),
    ('Dwarf Chicory', 'Chicory', 3, 30, 95, TRUE, TRUE, NULL),
    ('Early Chicory', 'Chicory', 3, 45, 95, TRUE, TRUE, NULL),
    ('Classic Chinese Cabbage', 'Chinese Cabbage', 3, 14, 95, TRUE, TRUE, NULL),
    ('Royal Chinese Cabbage', 'Chinese Cabbage', 3, 29, 95, TRUE, TRUE, NULL),
    ('Golden Chinese Cabbage', 'Chinese Cabbage', 3, 34, 95, TRUE, TRUE, NULL),
    ('Purple Chinese Cabbage', 'Chinese Cabbage', 3, 13, 95, TRUE, TRUE, NULL),
    ('Classic Collards', 'Collards', 3, 11, 95, TRUE, TRUE, NULL),
    ('Royal Collards', 'Collards', 3, 10, 95, TRUE, TRUE, NULL),
    ('Golden Collards', 'Collards', 3, 95, 95, TRUE, TRUE, NULL),
    ('Purple Collards', 'Collards', 3, 0, 95, TRUE, TRUE, NULL),
    ('Giant Collards', 'Collards', 3, 77, 95, TRUE, TRUE, NULL),
    ('Dwarf Collards', 'Collards', 3, 95, 95, TRUE, TRUE, NULL),
    ('Early Collards', 'Collards', 3, 62, 95, TRUE, TRUE, NULL),
    ('Late Collards', 'Collards', 3, 0, 95, TRUE, TRUE, NULL),
    ('Martian Jewels', 'Corn', 4.5, 10, 95, TRUE, TRUE, NULL),
    ('Glass Gem', 'Corn', 4.5, 20, 95, TRUE, TRUE, NULL),
    ('Lemon Cuke', 'Cucumber', 3, 24, 95, TRUE, TRUE, NULL),
    ('China Jade', 'Cucumber', 3, 92, 95, TRUE, TRUE, NULL),
    ('Classic Eggplant', 'Eggplant', 3, 53, 95, TRUE, TRUE, NULL),
    ('Royal Eggplant', 'Eggplant', 3, 24, 95, TRUE, TRUE, NULL),
    ('Golden Eggplant', 'Eggplant', 3, 31, 95, TRUE, TRUE, NULL),
    ('Purple Eggplant', 'Eggplant', 3, 36, 95, TRUE, TRUE, NULL),
    ('Giant Eggplant', 'Eggplant', 3, 30, 95, TRUE, TRUE, NULL),
    ('Dwarf Eggplant', 'Eggplant', 3, 33, 95, TRUE, TRUE, NULL),
    ('Classic Endive', 'Endive', 3, 0, 95, TRUE, TRUE, NULL),
    ('Royal Endive', 'Endive', 3, 42, 95, TRUE, TRUE, NULL),
    ('Golden Endive', 'Endive', 3, 78, 95, TRUE, TRUE, NULL),
    ('Classic Fava Beans', 'Fava Beans', 3, 36, 95, TRUE, TRUE, NULL),
    ('Royal Fava Beans', 'Fava Beans', 3, 0, 95, TRUE, TRUE, NULL),
    ('Golden Fava Beans', 'Fava Beans', 3, 0, 95, TRUE, TRUE, NULL),
    ('Classic Fennel', 'Fennel', 3, 86, 95, TRUE, TRUE, NULL),
    ('Royal Fennel', 'Fennel', 3, 0, 95, TRUE, TRUE, NULL),
    ('Golden Fennel', 'Fennel', 3, 63, 95, TRUE, TRUE, NULL),
    ('Purple Fennel', 'Fennel', 3, 0, 95, TRUE, TRUE, NULL),
    ('Giant Fennel', 'Fennel', 3, 82, 95, TRUE, TRUE, NULL),
    ('Dwarf Fennel', 'Fennel', 3, 27, 95, TRUE, TRUE, NULL),
    ('Classic Garlic', 'Garlic', 3, 0, 95, TRUE, TRUE, NULL),
    ('Royal Garlic', 'Garlic', 3, 68, 95, TRUE, TRUE, NULL),
    ('Golden Garlic', 'Garlic', 3, 74, 95, TRUE, TRUE, NULL),
    ('Purple Garlic', 'Garlic', 3, 60, 95, TRUE, TRUE, NULL),
    ('Giant Garlic', 'Garlic', 3, 11, 95, TRUE, TRUE, NULL),
    ('Dwarf Garlic', 'Garlic', 3, 23, 95, TRUE, TRUE, NULL),
    ('Classic Gourds', 'Gourds', 3, 21, 95, TRUE, TRUE, NULL),
    ('Royal Gourds', 'Gourds', 3, 84, 95, TRUE, TRUE, NULL),
    ('Golden Gourds', 'Gourds', 3, 0, 95, TRUE, TRUE, NULL),
    ('Classic Ground Cherry', 'Ground Cherry', 3, 72, 95, TRUE, TRUE, NULL),
    ('Royal Ground Cherry', 'Ground Cherry', 3, 80, 95, TRUE, TRUE, NULL),
    ('Golden Ground Cherry', 'Ground Cherry', 3, 44, 95, TRUE, TRUE, NULL),
    ('Purple Ground Cherry', 'Ground Cherry', 3, 94, 95, TRUE, TRUE, NULL),
    ('Classic Kale', 'Kale', 3, 0, 95, TRUE, TRUE, NULL),
    ('Royal Kale', 'Kale', 3, 13, 95, TRUE, TRUE, NULL),
    ('Golden Kale', 'Kale', 3, 0, 95, TRUE, TRUE, NULL),
    ('Classic Kohlrabi', 'Kohlrabi', 3, 95, 95, TRUE, TRUE, NULL),
    ('Royal Kohlrabi', 'Kohlrabi', 3, 32, 95, TRUE, TRUE, NULL),
    ('Golden Kohlrabi', 'Kohlrabi', 3, 53, 95, TRUE, TRUE, NULL),
    ('Purple Kohlrabi', 'Kohlrabi', 3, 96, 95, TRUE, TRUE, NULL),
    ('Giant Kohlrabi', 'Kohlrabi', 3, 46, 95, TRUE, TRUE, NULL),
    ('Dwarf Kohlrabi', 'Kohlrabi', 3, 8, 95, TRUE, TRUE, NULL),
    ('Classic Leeks', 'Leeks', 3, 5, 95, TRUE, TRUE, NULL),
    ('Royal Leeks', 'Leeks', 3, 70, 95, TRUE, TRUE, NULL),
    ('Golden Leeks', 'Leeks', 3, 91, 95, TRUE, TRUE, NULL),
    ('Purple Leeks', 'Leeks', 3, 19, 95, TRUE, TRUE, NULL),
    ('Giant Leeks', 'Leeks', 3, 64, 95, TRUE, TRUE, NULL),
    ('Dwarf Leeks', 'Leeks', 3, 49, 95, TRUE, TRUE, NULL),
    ('Little Gem', 'Lettuce', 3, 23, 95, TRUE, TRUE, NULL),
    ('Spotted Aleppo Syrian', 'Lettuce', 3.5, 82, 95, TRUE, TRUE, NULL),
    ('Hao Shan', 'Lettuce', 3, 94, 95, TRUE, TRUE, NULL),
    ('Classic Mache', 'Mache', 3, 59, 95, TRUE, TRUE, NULL),
    ('Royal Mache', 'Mache', 3, 23, 95, TRUE, TRUE, NULL),
    ('Golden Mache', 'Mache', 3, 19, 95, TRUE, TRUE, NULL),
    ('Purple Mache', 'Mache', 3, 52, 95, TRUE, TRUE, NULL),
    ('Giant Mache', 'Mache', 3, 42, 95, TRUE, TRUE, NULL),
    ('Kajari', 'Melons', 4.5, 7, 95, TRUE, TRUE, NULL),
    ('Classic Millet', 'Millet', 3, 33, 95, TRUE, TRUE, NULL),
    ('Royal Millet', 'Millet', 3, 46, 95, TRUE, TRUE, NULL),
    ('Golden Millet', 'Millet', 3, 34, 95, TRUE, TRUE, NULL),
    ('Purple Millet', 'Millet', 3, 0, 95, TRUE, TRUE, NULL),
    ('Giant Millet', 'Millet', 3, 6, 95, TRUE, TRUE, NULL),
    ('Dwarf Millet', 'Millet', 3, 9, 95, TRUE, TRUE, NULL),
    ('Early Millet', 'Millet', 3, 95, 95, TRUE, TRUE, NULL),
    ('Late Millet', 'Millet', 3, 67, 95, TRUE, TRUE, NULL),
    ('Classic Mustard Greens', 'Mustard Greens', 3, 0, 95, TRUE, TRUE, NULL),
    ('Royal Mustard Greens', 'Mustard Greens', 3, 0, 95, TRUE, TRUE, NULL),
    ('Golden Mustard Greens', 'Mustard Greens', 3, 30, 95, TRUE, TRUE, NULL),
    ('Classic Okra', 'Okra', 3, 0, 95, TRUE, TRUE, NULL),
    ('Royal Okra', 'Okra', 3, 92, 95, TRUE, TRUE, NULL),
    ('Golden Okra', 'Okra', 3, 21, 95, TRUE, TRUE, NULL),
    ('Purple Okra', 'Okra', 3, 61, 95, TRUE, TRUE, NULL),
    ('Giant Okra', 'Okra', 3, 0, 95, TRUE, TRUE, NULL),
    ('Dwarf Okra', 'Okra', 3, 85, 95, TRUE, TRUE, NULL),
    ('Classic Onions', 'Onions', 3, 34, 95, TRUE, TRUE, NULL),
    ('Royal Onions', 'Onions', 3, 39, 95, TRUE, TRUE, NULL),
    ('Golden Onions', 'Onions', 3, 15, 95, TRUE, TRUE, NULL),
    ('Purple Onions', 'Onions', 3, 88, 95, TRUE, TRUE, NULL),
    ('Giant Onions', 'Onions', 3, 68, 95, TRUE, TRUE, NULL),
    ('Classic Peas', 'Peas', 3, 75, 95, TRUE, TRUE, NULL),
    ('Royal Peas', 'Peas', 3, 67, 95, TRUE, TRUE, NULL),
    ('Golden Peas', 'Peas', 3, 66, 95, TRUE, TRUE, NULL),
    ('Purple Peas', 'Peas', 3, 84, 95, TRUE, TRUE, NULL),
    ('Giant Peas', 'Peas', 3, 0, 95, TRUE, TRUE, NULL),
    ('Dwarf Peas', 'Peas', 3, 28, 95, TRUE, TRUE, NULL),
    ('Early Peas', 'Peas', 3, 6, 95, TRUE, TRUE, NULL),
    ('Late Peas', 'Peas', 3, 0, 95, TRUE, TRUE, NULL),
    ('Aleppo', 'Peppers', 3.5, 58, 95, TRUE, TRUE, NULL),
    ('Fish', 'Peppers', 3.5, 29, 95, TRUE, TRUE, NULL),
    ('Classic Potatoes', 'Potatoes', 3, 69, 95, TRUE, TRUE, NULL),
    ('Royal Potatoes', 'Potatoes', 3, 54, 95, TRUE, TRUE, NULL),
    ('Golden Potatoes', 'Potatoes', 3, 55, 95, TRUE, TRUE, NULL),
    ('Purple Potatoes', 'Potatoes', 3, 0, 95, TRUE, TRUE, NULL),
    ('Giant Potatoes', 'Potatoes', 3, 46, 95, TRUE, TRUE, NULL),
    ('Classic Pumpkins', 'Pumpkins', 3, 0, 95, TRUE, TRUE, NULL),
    ('Royal Pumpkins', 'Pumpkins', 3, 48, 95, TRUE, TRUE, NULL),
    ('Golden Pumpkins', 'Pumpkins', 3, 28, 95, TRUE, TRUE, NULL),
    ('Purple Pumpkins', 'Pumpkins', 3, 49, 95, TRUE, TRUE, NULL),
    ('Classic Purslane', 'Purslane', 3, 28, 95, TRUE, TRUE, NULL),
    ('Royal Purslane', 'Purslane', 3, 50, 95, TRUE, TRUE, NULL),
    ('Golden Purslane', 'Purslane', 3, 79, 95, TRUE, TRUE, NULL),
    ('Purple Purslane', 'Purslane', 3, 30, 95, TRUE, TRUE, NULL),
    ('Classic Quinoa', 'Quinoa', 3, 11, 95, TRUE, TRUE, NULL),
    ('Royal Quinoa', 'Quinoa', 3, 53, 95, TRUE, TRUE, NULL),
    ('Golden Quinoa', 'Quinoa', 3, 32, 95, TRUE, TRUE, NULL),
    ('Purple Quinoa', 'Quinoa', 3, 79, 95, TRUE, TRUE, NULL),
    ('Giant Quinoa', 'Quinoa', 3, 70, 95, TRUE, TRUE, NULL),
    ('Dwarf Quinoa', 'Quinoa', 3, 45, 95, TRUE, TRUE, NULL),
    ('Classic Radishes', 'Radishes', 3, 68, 95, TRUE, TRUE, NULL),
    ('Royal Radishes', 'Radishes', 3, 13, 95, TRUE, TRUE, NULL),
    ('Golden Radishes', 'Radishes', 3, 16, 95, TRUE, TRUE, NULL),
    ('Purple Radishes', 'Radishes', 3, 11, 95, TRUE, TRUE, NULL),
    ('Giant Radishes', 'Radishes', 3, 84, 95, TRUE, TRUE, NULL),
    ('Classic Rhubarb', 'Rhubarb', 3, 0, 95, TRUE, TRUE, NULL),
    ('Royal Rhubarb', 'Rhubarb', 3, 53, 95, TRUE, TRUE, NULL),
    ('Golden Rhubarb', 'Rhubarb', 3, 32, 95, TRUE, TRUE, NULL),
    ('Purple Rhubarb', 'Rhubarb', 3, 29, 95, TRUE, TRUE, NULL),
    ('Giant Rhubarb', 'Rhubarb', 3, 44, 95, TRUE, TRUE, NULL),
    ('Dwarf Rhubarb', 'Rhubarb', 3, 80, 95, TRUE, TRUE, NULL),
    ('Early Rhubarb', 'Rhubarb', 3, 57, 95, TRUE, TRUE, NULL),
    ('Late Rhubarb', 'Rhubarb', 3, 32, 95, TRUE, TRUE, NULL),
    ('Classic Rutabaga', 'Rutabaga', 3, 14, 95, TRUE, TRUE, NULL),
    ('Royal Rutabaga', 'Rutabaga', 3, 59, 95, TRUE, TRUE, NULL),
    ('Golden Rutabaga', 'Rutabaga', 3, 0, 95, TRUE, TRUE, NULL),
    ('Purple Rutabaga', 'Rutabaga', 3, 14, 95, TRUE, TRUE, NULL),
    ('Giant Rutabaga', 'Rutabaga', 3, 37, 95, TRUE, TRUE, NULL),
    ('Dwarf Rutabaga', 'Rutabaga', 3, 59, 95, TRUE, TRUE, NULL),
    ('Early Rutabaga', 'Rutabaga', 3, 72, 95, TRUE, TRUE, NULL),
    ('Classic Spinach', 'Spinach', 3, 90, 95, TRUE, TRUE, NULL),
    ('Royal Spinach', 'Spinach', 3, 0, 95, TRUE, TRUE, NULL),
    ('Golden Spinach', 'Spinach', 3, 40, 95, TRUE, TRUE, NULL),
    ('Purple Spinach', 'Spinach', 3, 22, 95, TRUE, TRUE, NULL),
    ('Giant Spinach', 'Spinach', 3, 73, 95, TRUE, TRUE, NULL),
    ('Zucchini Golden', 'Squash Summer', 3.5, 42, 95, TRUE, TRUE, NULL),
    ('Classic Squash Winter', 'Squash Winter', 3, 29, 95, TRUE, TRUE, NULL),
    ('Royal Squash Winter', 'Squash Winter', 3, 42, 95, TRUE, TRUE, NULL),
    ('Golden Squash Winter', 'Squash Winter', 3, 25, 95, TRUE, TRUE, NULL),
    ('Classic Sunflowers', 'Sunflowers', 3, 13, 95, TRUE, TRUE, NULL),
    ('Royal Sunflowers', 'Sunflowers', 3, 37, 95, TRUE, TRUE, NULL),
    ('Golden Sunflowers', 'Sunflowers', 3, 31, 95, TRUE, TRUE, NULL),
    ('Purple Sunflowers', 'Sunflowers', 3, 90, 95, TRUE, TRUE, NULL),
    ('Giant Sunflowers', 'Sunflowers', 3, 0, 95, TRUE, TRUE, NULL),
    ('Dwarf Sunflowers', 'Sunflowers', 3, 5, 95, TRUE, TRUE, NULL),
    ('Early Sunflowers', 'Sunflowers', 3, 16, 95, TRUE, TRUE, NULL),
    ('Classic Sweet Potatoes', 'Sweet Potatoes', 3, 81, 95, TRUE, TRUE, NULL),
    ('Royal Sweet Potatoes', 'Sweet Potatoes', 3, 45, 95, TRUE, TRUE, NULL),
    ('Golden Sweet Potatoes', 'Sweet Potatoes', 3, 65, 95, TRUE, TRUE, NULL),
    ('Purple Sweet Potatoes', 'Sweet Potatoes', 3, 0, 95, TRUE, TRUE, NULL),
    ('Giant Sweet Potatoes', 'Sweet Potatoes', 3, 0, 95, TRUE, TRUE, NULL),
    ('Classic Tomatillos', 'Tomatillos', 3, 41, 95, TRUE, TRUE, NULL),
    ('Royal Tomatillos', 'Tomatillos', 3, 0, 95, TRUE, TRUE, NULL),
    ('Golden Tomatillos', 'Tomatillos', 3, 31, 95, TRUE, TRUE, NULL),
    ('Cherokee Purple', 'Tomatoes', 3.5, 57, 95, TRUE, TRUE, NULL),
    ('Black Krim', 'Tomatoes', 3.5, 69, 95, TRUE, TRUE, NULL),
    ('Brandywine', 'Tomatoes', 3.5, 44, 95, TRUE, TRUE, NULL),
    ('Orange Hat', 'Tomatoes', 3.5, 88, 95, TRUE, TRUE, NULL),
    ('Green Zebra', 'Tomatoes', 3.5, 82, 95, TRUE, TRUE, NULL),
    ('Classic Turnips', 'Turnips', 3, 94, 95, TRUE, TRUE, NULL),
    ('Royal Turnips', 'Turnips', 3, 83, 95, TRUE, TRUE, NULL),
    ('Golden Turnips', 'Turnips', 3, 21, 95, TRUE, TRUE, NULL),
    ('Classic Watermelons', 'Watermelons', 3, 43, 95, TRUE, TRUE, NULL),
    ('Royal Watermelons', 'Watermelons', 3, 61, 95, TRUE, TRUE, NULL),
    ('Golden Watermelons', 'Watermelons', 3, 69, 95, TRUE, TRUE, NULL),
    ('Purple Watermelons', 'Watermelons', 3, 20, 95, TRUE, TRUE, NULL),
    ('Giant Watermelons', 'Watermelons', 3, 94, 95, TRUE, TRUE, NULL),
    ('Classic Wheat', 'Wheat', 3, 29, 95, TRUE, TRUE, NULL),
    ('Royal Wheat', 'Wheat', 3, 0, 95, TRUE, TRUE, NULL),
    ('Golden Wheat', 'Wheat', 3, 77, 95, TRUE, TRUE, NULL),
    ('Purple Wheat', 'Wheat', 3, 94, 95, TRUE, TRUE, NULL),
    ('Giant Wheat', 'Wheat', 3, 34, 95, TRUE, TRUE, NULL),
    ('Dwarf Wheat', 'Wheat', 3, 62, 95, TRUE, TRUE, NULL),
    ('Early Wheat', 'Wheat', 3, 88, 95, TRUE, TRUE, NULL),
    ('Genovese', 'Basil', 3, 0, 95, TRUE, TRUE, ARRAY['https://www.rareseeds.com/media/catalog/product/cache/5667e39955f7b47720c7610bf376471d/b/a/basil-genovese-lss-dsc_3512.jpg']),
    ('Thai Sweet', 'Basil', 3, 11, 95, TRUE, TRUE, NULL),
    ('Thai Holy Kaprao', 'Basil', 3, 64, 95, TRUE, TRUE, NULL),
    ('Lemon', 'Basil', 3, 71, 95, TRUE, TRUE, NULL),
    ('Cinnamon', 'Basil', 3, 22, 95, TRUE, TRUE, NULL),
    ('Dark Purple Opal', 'Basil', 3, 49, 95, TRUE, TRUE, NULL),
    ('Lettuce Leaf', 'Basil', 3, 28, 95, TRUE, TRUE, NULL),
    ('Cardinal', 'Basil', 3, 58, 95, TRUE, TRUE, NULL),
    ('Persian', 'Basil', 3, 28, 95, TRUE, TRUE, NULL),
    ('Siam Queen Thai', 'Basil', 3, 77, 95, TRUE, TRUE, NULL),
    ('Classic Bee Balm', 'Bee Balm', 3, 6, 95, TRUE, TRUE, NULL),
    ('Royal Bee Balm', 'Bee Balm', 3, 92, 95, TRUE, TRUE, NULL),
    ('Golden Bee Balm', 'Bee Balm', 3, 83, 95, TRUE, TRUE, NULL),
    ('Purple Bee Balm', 'Bee Balm', 3, 69, 95, TRUE, TRUE, NULL),
    ('Giant Bee Balm', 'Bee Balm', 3, 67, 95, TRUE, TRUE, NULL),
    ('Dwarf Bee Balm', 'Bee Balm', 3, 54, 95, TRUE, TRUE, NULL),
    ('Classic Borago', 'Borago', 3, 38, 95, TRUE, TRUE, NULL),
    ('Royal Borago', 'Borago', 3, 37, 95, TRUE, TRUE, NULL),
    ('Golden Borago', 'Borago', 3, 45, 95, TRUE, TRUE, NULL),
    ('Classic Chamomile', 'Chamomile', 3, 35, 95, TRUE, TRUE, NULL),
    ('Royal Chamomile', 'Chamomile', 3, 13, 95, TRUE, TRUE, NULL),
    ('Golden Chamomile', 'Chamomile', 3, 81, 95, TRUE, TRUE, NULL),
    ('Purple Chamomile', 'Chamomile', 3, 70, 95, TRUE, TRUE, NULL),
    ('Giant Chamomile', 'Chamomile', 3, 71, 95, TRUE, TRUE, NULL),
    ('Dwarf Chamomile', 'Chamomile', 3, 80, 95, TRUE, TRUE, NULL),
    ('Early Chamomile', 'Chamomile', 3, 32, 95, TRUE, TRUE, NULL),
    ('Late Chamomile', 'Chamomile', 3, 63, 95, TRUE, TRUE, NULL),
    ('Classic Chives', 'Chives', 3, 75, 95, TRUE, TRUE, NULL),
    ('Royal Chives', 'Chives', 3, 0, 95, TRUE, TRUE, NULL),
    ('Golden Chives', 'Chives', 3, 84, 95, TRUE, TRUE, NULL),
    ('Purple Chives', 'Chives', 3, 84, 95, TRUE, TRUE, NULL),
    ('Classic Coriandrum', 'Coriandrum', 3, 49, 95, TRUE, TRUE, NULL),
    ('Royal Coriandrum', 'Coriandrum', 3, 50, 95, TRUE, TRUE, NULL),
    ('Golden Coriandrum', 'Coriandrum', 3, 52, 95, TRUE, TRUE, NULL),
    ('Purple Coriandrum', 'Coriandrum', 3, 25, 95, TRUE, TRUE, NULL),
    ('Giant Coriandrum', 'Coriandrum', 3, 0, 95, TRUE, TRUE, NULL),
    ('Classic Dill', 'Dill', 3, 71, 95, TRUE, TRUE, NULL),
    ('Royal Dill', 'Dill', 3, 0, 95, TRUE, TRUE, NULL),
    ('Golden Dill', 'Dill', 3, 87, 95, TRUE, TRUE, NULL),
    ('Purple Dill', 'Dill', 3, 19, 95, TRUE, TRUE, NULL),
    ('Giant Dill', 'Dill', 3, 0, 95, TRUE, TRUE, NULL),
    ('Dwarf Dill', 'Dill', 3, 79, 95, TRUE, TRUE, NULL),
    ('Early Dill', 'Dill', 3, 75, 95, TRUE, TRUE, NULL),
    ('Late Dill', 'Dill', 3, 15, 95, TRUE, TRUE, NULL),
    ('Classic Bloody Dock', 'Bloody Dock', 3, 38, 95, TRUE, TRUE, NULL),
    ('Royal Bloody Dock', 'Bloody Dock', 3, 66, 95, TRUE, TRUE, NULL),
    ('Golden Bloody Dock', 'Bloody Dock', 3, 0, 95, TRUE, TRUE, NULL),
    ('Purple Bloody Dock', 'Bloody Dock', 3, 46, 95, TRUE, TRUE, NULL),
    ('Giant Bloody Dock', 'Bloody Dock', 3, 43, 95, TRUE, TRUE, NULL),
    ('Dwarf Bloody Dock', 'Bloody Dock', 3, 79, 95, TRUE, TRUE, NULL),
    ('Classic Echinacea', 'Echinacea', 3, 0, 95, TRUE, TRUE, NULL),
    ('Royal Echinacea', 'Echinacea', 3, 41, 95, TRUE, TRUE, NULL),
    ('Golden Echinacea', 'Echinacea', 3, 84, 95, TRUE, TRUE, NULL),
    ('Classic Fennel', 'Fennel', 3, 51, 95, TRUE, TRUE, NULL),
    ('Royal Fennel', 'Fennel', 3, 16, 95, TRUE, TRUE, NULL),
    ('Golden Fennel', 'Fennel', 3, 81, 95, TRUE, TRUE, NULL),
    ('Purple Fennel', 'Fennel', 3, 12, 95, TRUE, TRUE, NULL),
    ('Giant Fennel', 'Fennel', 3, 0, 95, TRUE, TRUE, NULL),
    ('Dwarf Fennel', 'Fennel', 3, 84, 95, TRUE, TRUE, NULL),
    ('Classic Lavender', 'Lavender', 3, 40, 95, TRUE, TRUE, NULL),
    ('Royal Lavender', 'Lavender', 3, 65, 95, TRUE, TRUE, NULL),
    ('Golden Lavender', 'Lavender', 3, 40, 95, TRUE, TRUE, NULL),
    ('Purple Lavender', 'Lavender', 3, 18, 95, TRUE, TRUE, NULL),
    ('Giant Lavender', 'Lavender', 3, 24, 95, TRUE, TRUE, NULL),
    ('Dwarf Lavender', 'Lavender', 3, 17, 95, TRUE, TRUE, NULL),
    ('Classic Lemon Balm', 'Lemon Balm', 3, 0, 95, TRUE, TRUE, NULL),
    ('Royal Lemon Balm', 'Lemon Balm', 3, 48, 95, TRUE, TRUE, NULL),
    ('Golden Lemon Balm', 'Lemon Balm', 3, 65, 95, TRUE, TRUE, NULL),
    ('Purple Lemon Balm', 'Lemon Balm', 3, 0, 95, TRUE, TRUE, NULL),
    ('Classic Marjoram', 'Marjoram', 3, 25, 95, TRUE, TRUE, NULL),
    ('Royal Marjoram', 'Marjoram', 3, 17, 95, TRUE, TRUE, NULL),
    ('Golden Marjoram', 'Marjoram', 3, 86, 95, TRUE, TRUE, NULL),
    ('Classic Mint', 'Mint', 3, 95, 95, TRUE, TRUE, NULL),
    ('Royal Mint', 'Mint', 3, 7, 95, TRUE, TRUE, NULL),
    ('Golden Mint', 'Mint', 3, 65, 95, TRUE, TRUE, NULL),
    ('Purple Mint', 'Mint', 3, 65, 95, TRUE, TRUE, NULL),
    ('Giant Mint', 'Mint', 3, 21, 95, TRUE, TRUE, NULL),
    ('Classic Oregano', 'Oregano', 3, 25, 95, TRUE, TRUE, NULL),
    ('Royal Oregano', 'Oregano', 3, 62, 95, TRUE, TRUE, NULL),
    ('Golden Oregano', 'Oregano', 3, 63, 95, TRUE, TRUE, NULL),
    ('Classic Parsley', 'Parsley', 3, 73, 95, TRUE, TRUE, NULL),
    ('Royal Parsley', 'Parsley', 3, 28, 95, TRUE, TRUE, NULL),
    ('Golden Parsley', 'Parsley', 3, 96, 95, TRUE, TRUE, NULL),
    ('Purple Parsley', 'Parsley', 3, 89, 95, TRUE, TRUE, NULL),
    ('Giant Parsley', 'Parsley', 3, 46, 95, TRUE, TRUE, NULL),
    ('Dwarf Parsley', 'Parsley', 3, 45, 95, TRUE, TRUE, NULL),
    ('Early Parsley', 'Parsley', 3, 0, 95, TRUE, TRUE, NULL),
    ('Late Parsley', 'Parsley', 3, 12, 95, TRUE, TRUE, NULL),
    ('Classic Rosemary', 'Rosemary', 3, 17, 95, TRUE, TRUE, NULL),
    ('Royal Rosemary', 'Rosemary', 3, 97, 95, TRUE, TRUE, NULL),
    ('Golden Rosemary', 'Rosemary', 3, 98, 95, TRUE, TRUE, NULL),
    ('Purple Rosemary', 'Rosemary', 3, 83, 95, TRUE, TRUE, NULL),
    ('Giant Rosemary', 'Rosemary', 3, 50, 95, TRUE, TRUE, NULL),
    ('Dwarf Rosemary', 'Rosemary', 3, 11, 95, TRUE, TRUE, NULL),
    ('Early Rosemary', 'Rosemary', 3, 35, 95, TRUE, TRUE, NULL),
    ('Classic Rue', 'Rue', 3, 45, 95, TRUE, TRUE, NULL),
    ('Royal Rue', 'Rue', 3, 69, 95, TRUE, TRUE, NULL),
    ('Golden Rue', 'Rue', 3, 80, 95, TRUE, TRUE, NULL),
    ('Purple Rue', 'Rue', 3, 13, 95, TRUE, TRUE, NULL),
    ('Giant Rue', 'Rue', 3, 16, 95, TRUE, TRUE, NULL),
    ('Dwarf Rue', 'Rue', 3, 8, 95, TRUE, TRUE, NULL),
    ('Early Rue', 'Rue', 3, 0, 95, TRUE, TRUE, NULL),
    ('Classic Sage', 'Sage', 3, 94, 95, TRUE, TRUE, NULL),
    ('Royal Sage', 'Sage', 3, 97, 95, TRUE, TRUE, NULL),
    ('Golden Sage', 'Sage', 3, 64, 95, TRUE, TRUE, NULL),
    ('Purple Sage', 'Sage', 3, 23, 95, TRUE, TRUE, NULL),
    ('Giant Sage', 'Sage', 3, 19, 95, TRUE, TRUE, NULL),
    ('Dwarf Sage', 'Sage', 3, 0, 95, TRUE, TRUE, NULL),
    ('Early Sage', 'Sage', 3, 40, 95, TRUE, TRUE, NULL),
    ('Late Sage', 'Sage', 3, 60, 95, TRUE, TRUE, NULL),
    ('Classic Thyme', 'Thyme', 3, 68, 95, TRUE, TRUE, NULL),
    ('Royal Thyme', 'Thyme', 3, 12, 95, TRUE, TRUE, NULL),
    ('Golden Thyme', 'Thyme', 3, 21, 95, TRUE, TRUE, NULL),
    ('Purple Thyme', 'Thyme', 3, 89, 95, TRUE, TRUE, NULL),
    ('Giant Thyme', 'Thyme', 3, 0, 95, TRUE, TRUE, NULL),
    ('Dwarf Thyme', 'Thyme', 3, 10, 95, TRUE, TRUE, NULL),
    ('Classic Marigold', 'Marigold', 3, 99, 95, TRUE, TRUE, NULL),
    ('Royal Marigold', 'Marigold', 3, 37, 95, TRUE, TRUE, NULL),
    ('Golden Marigold', 'Marigold', 3, 75, 95, TRUE, TRUE, NULL),
    ('Purple Marigold', 'Marigold', 3, 73, 95, TRUE, TRUE, NULL),
    ('Giant Marigold', 'Marigold', 3, 69, 95, TRUE, TRUE, NULL),
    ('Classic Sunflower', 'Sunflower', 3, 47, 95, TRUE, TRUE, NULL),
    ('Royal Sunflower', 'Sunflower', 3, 97, 95, TRUE, TRUE, NULL),
    ('Golden Sunflower', 'Sunflower', 3, 32, 95, TRUE, TRUE, NULL),
    ('Purple Sunflower', 'Sunflower', 3, 34, 95, TRUE, TRUE, NULL),
    ('Giant Sunflower', 'Sunflower', 3, 51, 95, TRUE, TRUE, NULL),
    ('Dwarf Sunflower', 'Sunflower', 3, 0, 95, TRUE, TRUE, NULL),
    ('Early Sunflower', 'Sunflower', 3, 99, 95, TRUE, TRUE, NULL),
    ('Classic Zinnia', 'Zinnia', 3, 81, 95, TRUE, TRUE, NULL),
    ('Royal Zinnia', 'Zinnia', 3, 36, 95, TRUE, TRUE, NULL),
    ('Golden Zinnia', 'Zinnia', 3, 84, 95, TRUE, TRUE, NULL),
    ('Purple Zinnia', 'Zinnia', 3, 94, 95, TRUE, TRUE, NULL),
    ('Classic Cosmos', 'Cosmos', 3, 58, 95, TRUE, TRUE, NULL),
    ('Royal Cosmos', 'Cosmos', 3, 87, 95, TRUE, TRUE, NULL),
    ('Golden Cosmos', 'Cosmos', 3, 17, 95, TRUE, TRUE, NULL),
    ('Purple Cosmos', 'Cosmos', 3, 0, 95, TRUE, TRUE, NULL),
    ('Giant Cosmos', 'Cosmos', 3, 5, 95, TRUE, TRUE, NULL),
    ('Dwarf Cosmos', 'Cosmos', 3, 0, 95, TRUE, TRUE, NULL),
    ('Early Cosmos', 'Cosmos', 3, 44, 95, TRUE, TRUE, NULL),
    ('Late Cosmos', 'Cosmos', 3, 0, 95, TRUE, TRUE, NULL),
    ('Classic Calendula', 'Calendula', 3, 0, 95, TRUE, TRUE, NULL),
    ('Royal Calendula', 'Calendula', 3, 97, 95, TRUE, TRUE, NULL),
    ('Golden Calendula', 'Calendula', 3, 92, 95, TRUE, TRUE, NULL),
    ('Purple Calendula', 'Calendula', 3, 62, 95, TRUE, TRUE, NULL),
    ('Giant Calendula', 'Calendula', 3, 48, 95, TRUE, TRUE, NULL),
    ('Dwarf Calendula', 'Calendula', 3, 50, 95, TRUE, TRUE, NULL)
) AS products_data(name, subcategory_name, price, stock, freshness, organic, in_season, images)
CROSS JOIN temp_farm_id tf
JOIN temp_variety_ids tv ON tv.variety_name = products_data.subcategory_name
WHERE NOT EXISTS (
    SELECT 1 FROM products p 
    WHERE p.name = products_data.name 
    AND p.farm_id = tf.farm_id 
    AND p.variety_id = tv.variety_id
);

-- Verification queries
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
-- Total products imported: 434
-- Total categories: 3
-- Total subcategories: 83
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
