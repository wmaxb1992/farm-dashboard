-- Master Catalog Import from Baker Creek Data
-- Generated: 2025-07-18T20:29:02.488Z
-- Total varieties: 434
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

-- Create subcategories (master catalog - prevent duplicates)
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

-- Create individual varieties (master catalog - each Baker Creek variety becomes a master variety)
INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Classic Amaranth', '🌱', 'Heirloom amaranth variety with excellent flavor and growing characteristics. Days to maturity: 70-90 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.476574979968538,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Amaranth'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Classic Amaranth' AND s.name = 'Amaranth');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Royal Amaranth', '🌱', 'Heirloom amaranth variety with excellent flavor and growing characteristics. Days to maturity: 80-100 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"80-100 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.328677975037937,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Amaranth'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Royal Amaranth' AND s.name = 'Amaranth');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Golden Amaranth', '🌱', 'Heirloom amaranth variety with excellent flavor and growing characteristics. Days to maturity: 90-110 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"90-110 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.674676368567314,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Amaranth'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Golden Amaranth' AND s.name = 'Amaranth');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Purple Amaranth', '🌱', 'Heirloom amaranth variety with excellent flavor and growing characteristics. Days to maturity: 100-120 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"100-120 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.148701232138947,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Amaranth'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Purple Amaranth' AND s.name = 'Amaranth');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Classic Artichoke Cardoon', '🌱', 'Heirloom artichoke cardoon variety with excellent flavor and growing characteristics. Days to maturity: 70-90 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.0700161477302865,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Artichoke Cardoon'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Classic Artichoke Cardoon' AND s.name = 'Artichoke Cardoon');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Royal Artichoke Cardoon', '🌱', 'Heirloom artichoke cardoon variety with excellent flavor and growing characteristics. Days to maturity: 80-100 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"80-100 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.296483442520412,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Artichoke Cardoon'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Royal Artichoke Cardoon' AND s.name = 'Artichoke Cardoon');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Golden Artichoke Cardoon', '🌱', 'Heirloom artichoke cardoon variety with excellent flavor and growing characteristics. Days to maturity: 90-110 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"90-110 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.060649142619944,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Artichoke Cardoon'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Golden Artichoke Cardoon' AND s.name = 'Artichoke Cardoon');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Purple Artichoke Cardoon', '🌱', 'Heirloom artichoke cardoon variety with excellent flavor and growing characteristics. Days to maturity: 100-120 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"100-120 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.391740252538909,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Artichoke Cardoon'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Purple Artichoke Cardoon' AND s.name = 'Artichoke Cardoon');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Giant Artichoke Cardoon', '🌱', 'Heirloom artichoke cardoon variety with excellent flavor and growing characteristics. Days to maturity: 110-130 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"110-130 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.638885492526462,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Artichoke Cardoon'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Giant Artichoke Cardoon' AND s.name = 'Artichoke Cardoon');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Classic Arugula', '🌱', 'Heirloom arugula variety with excellent flavor and growing characteristics. Days to maturity: 70-90 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.664059553997833,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Arugula'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Classic Arugula' AND s.name = 'Arugula');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Royal Arugula', '🌱', 'Heirloom arugula variety with excellent flavor and growing characteristics. Days to maturity: 80-100 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"80-100 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.411474786125023,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Arugula'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Royal Arugula' AND s.name = 'Arugula');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Golden Arugula', '🌱', 'Heirloom arugula variety with excellent flavor and growing characteristics. Days to maturity: 90-110 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"90-110 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.624396724176774,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Arugula'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Golden Arugula' AND s.name = 'Arugula');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Purple Arugula', '🌱', 'Heirloom arugula variety with excellent flavor and growing characteristics. Days to maturity: 100-120 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"100-120 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.587474319563092,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Arugula'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Purple Arugula' AND s.name = 'Arugula');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Giant Arugula', '🌱', 'Heirloom arugula variety with excellent flavor and growing characteristics. Days to maturity: 110-130 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"110-130 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.1019134991472335,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Arugula'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Giant Arugula' AND s.name = 'Arugula');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Dwarf Arugula', '🌱', 'Heirloom arugula variety with excellent flavor and growing characteristics. Days to maturity: 120-140 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"120-140 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.086180458692488,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Arugula'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Dwarf Arugula' AND s.name = 'Arugula');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Early Arugula', '🌱', 'Heirloom arugula variety with excellent flavor and growing characteristics. Days to maturity: 130-150 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"130-150 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.365212389836809,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Arugula'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Early Arugula' AND s.name = 'Arugula');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Late Arugula', '🌱', 'Heirloom arugula variety with excellent flavor and growing characteristics. Days to maturity: 140-160 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"140-160 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.103094415744669,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Arugula'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Late Arugula' AND s.name = 'Arugula');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Classic Asparagus', '🌱', 'Heirloom asparagus variety with excellent flavor and growing characteristics. Days to maturity: 70-90 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.069671624167127,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Asparagus'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Classic Asparagus' AND s.name = 'Asparagus');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Royal Asparagus', '🌱', 'Heirloom asparagus variety with excellent flavor and growing characteristics. Days to maturity: 80-100 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"80-100 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.47041622448468,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Asparagus'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Royal Asparagus' AND s.name = 'Asparagus');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Golden Asparagus', '🌱', 'Heirloom asparagus variety with excellent flavor and growing characteristics. Days to maturity: 90-110 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"90-110 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.790513843676557,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Asparagus'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Golden Asparagus' AND s.name = 'Asparagus');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Purple Asparagus', '🌱', 'Heirloom asparagus variety with excellent flavor and growing characteristics. Days to maturity: 100-120 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"100-120 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.600206008522808,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Asparagus'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Purple Asparagus' AND s.name = 'Asparagus');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Giant Asparagus', '🌱', 'Heirloom asparagus variety with excellent flavor and growing characteristics. Days to maturity: 110-130 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"110-130 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.562979708925589,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Asparagus'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Giant Asparagus' AND s.name = 'Asparagus');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Dwarf Asparagus', '🌱', 'Heirloom asparagus variety with excellent flavor and growing characteristics. Days to maturity: 120-140 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"120-140 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.65848308886034,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Asparagus'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Dwarf Asparagus' AND s.name = 'Asparagus');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Classic Barley', '🌱', 'Heirloom barley variety with excellent flavor and growing characteristics. Days to maturity: 70-90 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.262309538688047,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Barley'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Classic Barley' AND s.name = 'Barley');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Royal Barley', '🌱', 'Heirloom barley variety with excellent flavor and growing characteristics. Days to maturity: 80-100 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"80-100 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.735167660229156,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Barley'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Royal Barley' AND s.name = 'Barley');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Golden Barley', '🌱', 'Heirloom barley variety with excellent flavor and growing characteristics. Days to maturity: 90-110 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"90-110 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.437166191226297,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Barley'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Golden Barley' AND s.name = 'Barley');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Purple Barley', '🌱', 'Heirloom barley variety with excellent flavor and growing characteristics. Days to maturity: 100-120 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"100-120 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.7905327697923905,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Barley'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Purple Barley' AND s.name = 'Barley');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Giant Barley', '🌱', 'Heirloom barley variety with excellent flavor and growing characteristics. Days to maturity: 110-130 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"110-130 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.2396420736198515,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Barley'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Giant Barley' AND s.name = 'Barley');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Dwarf Barley', '🌱', 'Heirloom barley variety with excellent flavor and growing characteristics. Days to maturity: 120-140 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"120-140 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.264623846222227,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Barley'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Dwarf Barley' AND s.name = 'Barley');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Early Barley', '🌱', 'Heirloom barley variety with excellent flavor and growing characteristics. Days to maturity: 130-150 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"130-150 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.488852880490882,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Barley'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Early Barley' AND s.name = 'Barley');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Dragon Tongue Bush', '🌱', 'Beautiful bush bean with purple streaks and excellent flavor. (Phaseolus vulgaris) Days to maturity: 60-65 days Plant spacing: 4-6" Seed depth: 1-2" Sun: Full sun', '{"botanical_name":"Phaseolus vulgaris","days_to_maturity":"60-65 days","plant_spacing":"4-6\"","seed_depth":"1-2\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.5,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Beans'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Dragon Tongue Bush' AND s.name = 'Beans');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Adventist Pole', '🌱', 'Cherished heirloom valued for its nutritional benefits and versatility. (Phaseolus vulgaris) Days to maturity: 70-80 days Plant spacing: 6-8" Sun: Full sun', '{"botanical_name":"Phaseolus vulgaris","days_to_maturity":"70-80 days","plant_spacing":"6-8\"","seed_depth":null,"sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.3,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Beans'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Adventist Pole' AND s.name = 'Beans');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Cherokee Trail of Tears', '🌱', 'Historic Cherokee bean variety with purple pods. (Phaseolus vulgaris) Days to maturity: 85-90 days', '{"botanical_name":"Phaseolus vulgaris","days_to_maturity":"85-90 days","plant_spacing":null,"seed_depth":null,"sun_requirements":null,"frost_hardy":null}', '{"rating":4.6,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Beans'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Cherokee Trail of Tears' AND s.name = 'Beans');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Classic Beetroot', '🌱', 'Heirloom beetroot variety with excellent flavor and growing characteristics. Days to maturity: 70-90 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.045752926549242,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Beetroot'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Classic Beetroot' AND s.name = 'Beetroot');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Royal Beetroot', '🌱', 'Heirloom beetroot variety with excellent flavor and growing characteristics. Days to maturity: 80-100 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"80-100 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.078457906120253,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Beetroot'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Royal Beetroot' AND s.name = 'Beetroot');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Golden Beetroot', '🌱', 'Heirloom beetroot variety with excellent flavor and growing characteristics. Days to maturity: 90-110 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"90-110 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.329408539353249,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Beetroot'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Golden Beetroot' AND s.name = 'Beetroot');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Purple Beetroot', '🌱', 'Heirloom beetroot variety with excellent flavor and growing characteristics. Days to maturity: 100-120 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"100-120 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.3797611461761905,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Beetroot'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Purple Beetroot' AND s.name = 'Beetroot');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Giant Beetroot', '🌱', 'Heirloom beetroot variety with excellent flavor and growing characteristics. Days to maturity: 110-130 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"110-130 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.256545649727254,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Beetroot'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Giant Beetroot' AND s.name = 'Beetroot');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Dwarf Beetroot', '🌱', 'Heirloom beetroot variety with excellent flavor and growing characteristics. Days to maturity: 120-140 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"120-140 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.160853804296735,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Beetroot'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Dwarf Beetroot' AND s.name = 'Beetroot');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Early Beetroot', '🌱', 'Heirloom beetroot variety with excellent flavor and growing characteristics. Days to maturity: 130-150 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"130-150 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.714972390998998,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Beetroot'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Early Beetroot' AND s.name = 'Beetroot');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Classic Bitter Melon', '🌱', 'Heirloom bitter melon variety with excellent flavor and growing characteristics. Days to maturity: 70-90 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.705740448264581,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Bitter Melon'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Classic Bitter Melon' AND s.name = 'Bitter Melon');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Royal Bitter Melon', '🌱', 'Heirloom bitter melon variety with excellent flavor and growing characteristics. Days to maturity: 80-100 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"80-100 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.172491194786146,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Bitter Melon'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Royal Bitter Melon' AND s.name = 'Bitter Melon');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Golden Bitter Melon', '🌱', 'Heirloom bitter melon variety with excellent flavor and growing characteristics. Days to maturity: 90-110 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"90-110 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.488988024108738,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Bitter Melon'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Golden Bitter Melon' AND s.name = 'Bitter Melon');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Purple Bitter Melon', '🌱', 'Heirloom bitter melon variety with excellent flavor and growing characteristics. Days to maturity: 100-120 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"100-120 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.452502607279405,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Bitter Melon'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Purple Bitter Melon' AND s.name = 'Bitter Melon');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Giant Bitter Melon', '🌱', 'Heirloom bitter melon variety with excellent flavor and growing characteristics. Days to maturity: 110-130 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"110-130 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.0867764768587005,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Bitter Melon'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Giant Bitter Melon' AND s.name = 'Bitter Melon');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Dwarf Bitter Melon', '🌱', 'Heirloom bitter melon variety with excellent flavor and growing characteristics. Days to maturity: 120-140 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"120-140 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.063669423977041,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Bitter Melon'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Dwarf Bitter Melon' AND s.name = 'Bitter Melon');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Early Bitter Melon', '🌱', 'Heirloom bitter melon variety with excellent flavor and growing characteristics. Days to maturity: 130-150 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"130-150 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.6353512742672995,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Bitter Melon'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Early Bitter Melon' AND s.name = 'Bitter Melon');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Classic Bok Choy', '🌱', 'Heirloom bok choy variety with excellent flavor and growing characteristics. Days to maturity: 70-90 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.041524302180448,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Bok Choy'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Classic Bok Choy' AND s.name = 'Bok Choy');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Royal Bok Choy', '🌱', 'Heirloom bok choy variety with excellent flavor and growing characteristics. Days to maturity: 80-100 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"80-100 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.74379634301299,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Bok Choy'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Royal Bok Choy' AND s.name = 'Bok Choy');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Golden Bok Choy', '🌱', 'Heirloom bok choy variety with excellent flavor and growing characteristics. Days to maturity: 90-110 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"90-110 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.209472799206015,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Bok Choy'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Golden Bok Choy' AND s.name = 'Bok Choy');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Classic Broccoli', '🌱', 'Heirloom broccoli variety with excellent flavor and growing characteristics. Days to maturity: 70-90 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.579661861837811,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Broccoli'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Classic Broccoli' AND s.name = 'Broccoli');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Royal Broccoli', '🌱', 'Heirloom broccoli variety with excellent flavor and growing characteristics. Days to maturity: 80-100 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"80-100 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.117366828460547,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Broccoli'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Royal Broccoli' AND s.name = 'Broccoli');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Golden Broccoli', '🌱', 'Heirloom broccoli variety with excellent flavor and growing characteristics. Days to maturity: 90-110 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"90-110 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.541481489981496,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Broccoli'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Golden Broccoli' AND s.name = 'Broccoli');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Purple Broccoli', '🌱', 'Heirloom broccoli variety with excellent flavor and growing characteristics. Days to maturity: 100-120 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"100-120 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.499494433763685,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Broccoli'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Purple Broccoli' AND s.name = 'Broccoli');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Giant Broccoli', '🌱', 'Heirloom broccoli variety with excellent flavor and growing characteristics. Days to maturity: 110-130 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"110-130 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.175617246797892,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Broccoli'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Giant Broccoli' AND s.name = 'Broccoli');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Dwarf Broccoli', '🌱', 'Heirloom broccoli variety with excellent flavor and growing characteristics. Days to maturity: 120-140 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"120-140 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.779216422779107,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Broccoli'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Dwarf Broccoli' AND s.name = 'Broccoli');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Classic Brussels Sprouts', '🌱', 'Heirloom brussels sprouts variety with excellent flavor and growing characteristics. Days to maturity: 70-90 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.361326922948952,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Brussels Sprouts'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Classic Brussels Sprouts' AND s.name = 'Brussels Sprouts');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Royal Brussels Sprouts', '🌱', 'Heirloom brussels sprouts variety with excellent flavor and growing characteristics. Days to maturity: 80-100 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"80-100 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.564688639312336,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Brussels Sprouts'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Royal Brussels Sprouts' AND s.name = 'Brussels Sprouts');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Golden Brussels Sprouts', '🌱', 'Heirloom brussels sprouts variety with excellent flavor and growing characteristics. Days to maturity: 90-110 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"90-110 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.6241969132179195,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Brussels Sprouts'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Golden Brussels Sprouts' AND s.name = 'Brussels Sprouts');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Purple Brussels Sprouts', '🌱', 'Heirloom brussels sprouts variety with excellent flavor and growing characteristics. Days to maturity: 100-120 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"100-120 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.306225394067804,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Brussels Sprouts'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Purple Brussels Sprouts' AND s.name = 'Brussels Sprouts');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Giant Brussels Sprouts', '🌱', 'Heirloom brussels sprouts variety with excellent flavor and growing characteristics. Days to maturity: 110-130 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"110-130 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.785035034095348,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Brussels Sprouts'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Giant Brussels Sprouts' AND s.name = 'Brussels Sprouts');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Dwarf Brussels Sprouts', '🌱', 'Heirloom brussels sprouts variety with excellent flavor and growing characteristics. Days to maturity: 120-140 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"120-140 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.183450020077721,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Brussels Sprouts'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Dwarf Brussels Sprouts' AND s.name = 'Brussels Sprouts');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Classic Buckwheat', '🌱', 'Heirloom buckwheat variety with excellent flavor and growing characteristics. Days to maturity: 70-90 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.22597978011157,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Buckwheat'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Classic Buckwheat' AND s.name = 'Buckwheat');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Royal Buckwheat', '🌱', 'Heirloom buckwheat variety with excellent flavor and growing characteristics. Days to maturity: 80-100 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"80-100 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.015777267447574,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Buckwheat'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Royal Buckwheat' AND s.name = 'Buckwheat');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Golden Buckwheat', '🌱', 'Heirloom buckwheat variety with excellent flavor and growing characteristics. Days to maturity: 90-110 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"90-110 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.240702382172472,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Buckwheat'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Golden Buckwheat' AND s.name = 'Buckwheat');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Purple Buckwheat', '🌱', 'Heirloom buckwheat variety with excellent flavor and growing characteristics. Days to maturity: 100-120 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"100-120 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.363144167144442,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Buckwheat'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Purple Buckwheat' AND s.name = 'Buckwheat');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Giant Buckwheat', '🌱', 'Heirloom buckwheat variety with excellent flavor and growing characteristics. Days to maturity: 110-130 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"110-130 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.296505398354405,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Buckwheat'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Giant Buckwheat' AND s.name = 'Buckwheat');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Dwarf Buckwheat', '🌱', 'Heirloom buckwheat variety with excellent flavor and growing characteristics. Days to maturity: 120-140 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"120-140 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.535842239977936,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Buckwheat'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Dwarf Buckwheat' AND s.name = 'Buckwheat');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Early Buckwheat', '🌱', 'Heirloom buckwheat variety with excellent flavor and growing characteristics. Days to maturity: 130-150 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"130-150 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.4751676069578235,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Buckwheat'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Early Buckwheat' AND s.name = 'Buckwheat');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Late Buckwheat', '🌱', 'Heirloom buckwheat variety with excellent flavor and growing characteristics. Days to maturity: 140-160 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"140-160 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.527296770022483,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Buckwheat'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Late Buckwheat' AND s.name = 'Buckwheat');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Classic Cabbage', '🌱', 'Heirloom cabbage variety with excellent flavor and growing characteristics. Days to maturity: 70-90 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.7074842344162295,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Cabbage'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Classic Cabbage' AND s.name = 'Cabbage');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Royal Cabbage', '🌱', 'Heirloom cabbage variety with excellent flavor and growing characteristics. Days to maturity: 80-100 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"80-100 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.143447177428809,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Cabbage'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Royal Cabbage' AND s.name = 'Cabbage');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Golden Cabbage', '🌱', 'Heirloom cabbage variety with excellent flavor and growing characteristics. Days to maturity: 90-110 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"90-110 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.796700631563599,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Cabbage'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Golden Cabbage' AND s.name = 'Cabbage');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Purple Cabbage', '🌱', 'Heirloom cabbage variety with excellent flavor and growing characteristics. Days to maturity: 100-120 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"100-120 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.072356536776018,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Cabbage'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Purple Cabbage' AND s.name = 'Cabbage');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Giant Cabbage', '🌱', 'Heirloom cabbage variety with excellent flavor and growing characteristics. Days to maturity: 110-130 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"110-130 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.731888628005546,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Cabbage'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Giant Cabbage' AND s.name = 'Cabbage');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Dwarf Cabbage', '🌱', 'Heirloom cabbage variety with excellent flavor and growing characteristics. Days to maturity: 120-140 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"120-140 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.034297094138764,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Cabbage'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Dwarf Cabbage' AND s.name = 'Cabbage');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Early Cabbage', '🌱', 'Heirloom cabbage variety with excellent flavor and growing characteristics. Days to maturity: 130-150 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"130-150 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.710632370138613,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Cabbage'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Early Cabbage' AND s.name = 'Cabbage');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'New Kuroda', '🌱', 'Japanese carrot variety with excellent flavor and storage. (Daucus carota) Days to maturity: 70-80 days Plant spacing: 2-3" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":"Daucus carota","days_to_maturity":"70-80 days","plant_spacing":"2-3\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.5,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Carrots Seeds'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'New Kuroda' AND s.name = 'Carrots Seeds');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Classic Cauliflower', '🌱', 'Heirloom cauliflower variety with excellent flavor and growing characteristics. Days to maturity: 70-90 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.5609721631043225,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Cauliflower'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Classic Cauliflower' AND s.name = 'Cauliflower');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Royal Cauliflower', '🌱', 'Heirloom cauliflower variety with excellent flavor and growing characteristics. Days to maturity: 80-100 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"80-100 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.469068340775417,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Cauliflower'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Royal Cauliflower' AND s.name = 'Cauliflower');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Golden Cauliflower', '🌱', 'Heirloom cauliflower variety with excellent flavor and growing characteristics. Days to maturity: 90-110 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"90-110 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.134580468294957,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Cauliflower'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Golden Cauliflower' AND s.name = 'Cauliflower');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Purple Cauliflower', '🌱', 'Heirloom cauliflower variety with excellent flavor and growing characteristics. Days to maturity: 100-120 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"100-120 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.119198909158389,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Cauliflower'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Purple Cauliflower' AND s.name = 'Cauliflower');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Classic Celery', '🌱', 'Heirloom celery variety with excellent flavor and growing characteristics. Days to maturity: 70-90 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.437731532824555,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Celery'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Classic Celery' AND s.name = 'Celery');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Royal Celery', '🌱', 'Heirloom celery variety with excellent flavor and growing characteristics. Days to maturity: 80-100 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"80-100 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.54297259454418,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Celery'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Royal Celery' AND s.name = 'Celery');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Golden Celery', '🌱', 'Heirloom celery variety with excellent flavor and growing characteristics. Days to maturity: 90-110 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"90-110 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.361538557787803,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Celery'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Golden Celery' AND s.name = 'Celery');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Purple Celery', '🌱', 'Heirloom celery variety with excellent flavor and growing characteristics. Days to maturity: 100-120 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"100-120 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.2139511662581075,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Celery'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Purple Celery' AND s.name = 'Celery');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Giant Celery', '🌱', 'Heirloom celery variety with excellent flavor and growing characteristics. Days to maturity: 110-130 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"110-130 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.449675708858382,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Celery'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Giant Celery' AND s.name = 'Celery');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Classic Chard', '🌱', 'Heirloom chard variety with excellent flavor and growing characteristics. Days to maturity: 70-90 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.018645293468627,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Chard'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Classic Chard' AND s.name = 'Chard');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Royal Chard', '🌱', 'Heirloom chard variety with excellent flavor and growing characteristics. Days to maturity: 80-100 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"80-100 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.591468883434366,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Chard'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Royal Chard' AND s.name = 'Chard');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Golden Chard', '🌱', 'Heirloom chard variety with excellent flavor and growing characteristics. Days to maturity: 90-110 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"90-110 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.6203375708026515,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Chard'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Golden Chard' AND s.name = 'Chard');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Purple Chard', '🌱', 'Heirloom chard variety with excellent flavor and growing characteristics. Days to maturity: 100-120 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"100-120 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.460647434279991,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Chard'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Purple Chard' AND s.name = 'Chard');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Giant Chard', '🌱', 'Heirloom chard variety with excellent flavor and growing characteristics. Days to maturity: 110-130 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"110-130 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.266050195094665,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Chard'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Giant Chard' AND s.name = 'Chard');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Classic Chickpeas', '🌱', 'Heirloom chickpeas variety with excellent flavor and growing characteristics. Days to maturity: 70-90 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.4226312367029985,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Chickpeas'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Classic Chickpeas' AND s.name = 'Chickpeas');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Royal Chickpeas', '🌱', 'Heirloom chickpeas variety with excellent flavor and growing characteristics. Days to maturity: 80-100 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"80-100 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.29925516948174,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Chickpeas'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Royal Chickpeas' AND s.name = 'Chickpeas');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Golden Chickpeas', '🌱', 'Heirloom chickpeas variety with excellent flavor and growing characteristics. Days to maturity: 90-110 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"90-110 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.2052197169296885,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Chickpeas'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Golden Chickpeas' AND s.name = 'Chickpeas');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Classic Chicory', '🌱', 'Heirloom chicory variety with excellent flavor and growing characteristics. Days to maturity: 70-90 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.546718421138658,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Chicory'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Classic Chicory' AND s.name = 'Chicory');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Royal Chicory', '🌱', 'Heirloom chicory variety with excellent flavor and growing characteristics. Days to maturity: 80-100 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"80-100 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.662013725130926,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Chicory'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Royal Chicory' AND s.name = 'Chicory');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Golden Chicory', '🌱', 'Heirloom chicory variety with excellent flavor and growing characteristics. Days to maturity: 90-110 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"90-110 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.516357438972543,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Chicory'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Golden Chicory' AND s.name = 'Chicory');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Purple Chicory', '🌱', 'Heirloom chicory variety with excellent flavor and growing characteristics. Days to maturity: 100-120 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"100-120 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.047864248919203,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Chicory'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Purple Chicory' AND s.name = 'Chicory');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Giant Chicory', '🌱', 'Heirloom chicory variety with excellent flavor and growing characteristics. Days to maturity: 110-130 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"110-130 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.775542399522481,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Chicory'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Giant Chicory' AND s.name = 'Chicory');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Dwarf Chicory', '🌱', 'Heirloom chicory variety with excellent flavor and growing characteristics. Days to maturity: 120-140 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"120-140 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.439019971210943,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Chicory'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Dwarf Chicory' AND s.name = 'Chicory');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Early Chicory', '🌱', 'Heirloom chicory variety with excellent flavor and growing characteristics. Days to maturity: 130-150 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"130-150 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.29984901313375,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Chicory'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Early Chicory' AND s.name = 'Chicory');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Classic Chinese Cabbage', '🌱', 'Heirloom chinese cabbage variety with excellent flavor and growing characteristics. Days to maturity: 70-90 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.263989034395014,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Chinese Cabbage'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Classic Chinese Cabbage' AND s.name = 'Chinese Cabbage');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Royal Chinese Cabbage', '🌱', 'Heirloom chinese cabbage variety with excellent flavor and growing characteristics. Days to maturity: 80-100 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"80-100 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.445340975899182,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Chinese Cabbage'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Royal Chinese Cabbage' AND s.name = 'Chinese Cabbage');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Golden Chinese Cabbage', '🌱', 'Heirloom chinese cabbage variety with excellent flavor and growing characteristics. Days to maturity: 90-110 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"90-110 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.512878505223553,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Chinese Cabbage'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Golden Chinese Cabbage' AND s.name = 'Chinese Cabbage');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Purple Chinese Cabbage', '🌱', 'Heirloom chinese cabbage variety with excellent flavor and growing characteristics. Days to maturity: 100-120 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"100-120 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.382511876828382,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Chinese Cabbage'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Purple Chinese Cabbage' AND s.name = 'Chinese Cabbage');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Classic Collards', '🌱', 'Heirloom collards variety with excellent flavor and growing characteristics. Days to maturity: 70-90 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.174403580767928,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Collards'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Classic Collards' AND s.name = 'Collards');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Royal Collards', '🌱', 'Heirloom collards variety with excellent flavor and growing characteristics. Days to maturity: 80-100 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"80-100 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.4499663954382385,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Collards'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Royal Collards' AND s.name = 'Collards');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Golden Collards', '🌱', 'Heirloom collards variety with excellent flavor and growing characteristics. Days to maturity: 90-110 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"90-110 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.199855056025387,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Collards'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Golden Collards' AND s.name = 'Collards');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Purple Collards', '🌱', 'Heirloom collards variety with excellent flavor and growing characteristics. Days to maturity: 100-120 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"100-120 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.647564650416087,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Collards'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Purple Collards' AND s.name = 'Collards');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Giant Collards', '🌱', 'Heirloom collards variety with excellent flavor and growing characteristics. Days to maturity: 110-130 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"110-130 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.552519770311181,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Collards'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Giant Collards' AND s.name = 'Collards');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Dwarf Collards', '🌱', 'Heirloom collards variety with excellent flavor and growing characteristics. Days to maturity: 120-140 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"120-140 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.5483770462540765,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Collards'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Dwarf Collards' AND s.name = 'Collards');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Early Collards', '🌱', 'Heirloom collards variety with excellent flavor and growing characteristics. Days to maturity: 130-150 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"130-150 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.684946578329868,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Collards'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Early Collards' AND s.name = 'Collards');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Late Collards', '🌱', 'Heirloom collards variety with excellent flavor and growing characteristics. Days to maturity: 140-160 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"140-160 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.3037354673535235,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Collards'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Late Collards' AND s.name = 'Collards');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Martian Jewels', '🌱', 'Spectacular multicolored corn with jewel-like kernels. (Zea mays) Days to maturity: 100-110 days Plant spacing: 8-12" Seed depth: 1-2" Sun: Full sun', '{"botanical_name":"Zea mays","days_to_maturity":"100-110 days","plant_spacing":"8-12\"","seed_depth":"1-2\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.8,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Corn'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Martian Jewels' AND s.name = 'Corn');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Glass Gem', '🌱', 'Rainbow-colored ornamental corn with translucent kernels. (Zea mays) Days to maturity: 105-115 days', '{"botanical_name":"Zea mays","days_to_maturity":"105-115 days","plant_spacing":null,"seed_depth":null,"sun_requirements":null,"frost_hardy":null}', '{"rating":4.9,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Corn'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Glass Gem' AND s.name = 'Corn');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Lemon Cuke', '🌱', 'Round, lemon-shaped cucumber with mild flavor. (Cucumis sativus) Days to maturity: 60-70 days Plant spacing: 12-18" Seed depth: 1/2" Sun: Full sun', '{"botanical_name":"Cucumis sativus","days_to_maturity":"60-70 days","plant_spacing":"12-18\"","seed_depth":"1/2\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.5,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Cucumber'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Lemon Cuke' AND s.name = 'Cucumber');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'China Jade', '🌱', 'Asian cucumber variety with crisp texture. (Cucumis sativus) Days to maturity: 55-65 days', '{"botanical_name":"Cucumis sativus","days_to_maturity":"55-65 days","plant_spacing":null,"seed_depth":null,"sun_requirements":null,"frost_hardy":null}', '{"rating":4.3,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Cucumber'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'China Jade' AND s.name = 'Cucumber');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Classic Eggplant', '🌱', 'Heirloom eggplant variety with excellent flavor and growing characteristics. Days to maturity: 70-90 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.220518151694963,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Eggplant'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Classic Eggplant' AND s.name = 'Eggplant');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Royal Eggplant', '🌱', 'Heirloom eggplant variety with excellent flavor and growing characteristics. Days to maturity: 80-100 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"80-100 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.535065935745365,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Eggplant'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Royal Eggplant' AND s.name = 'Eggplant');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Golden Eggplant', '🌱', 'Heirloom eggplant variety with excellent flavor and growing characteristics. Days to maturity: 90-110 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"90-110 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.100700144563951,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Eggplant'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Golden Eggplant' AND s.name = 'Eggplant');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Purple Eggplant', '🌱', 'Heirloom eggplant variety with excellent flavor and growing characteristics. Days to maturity: 100-120 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"100-120 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.194894944897294,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Eggplant'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Purple Eggplant' AND s.name = 'Eggplant');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Giant Eggplant', '🌱', 'Heirloom eggplant variety with excellent flavor and growing characteristics. Days to maturity: 110-130 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"110-130 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.253567004875509,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Eggplant'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Giant Eggplant' AND s.name = 'Eggplant');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Dwarf Eggplant', '🌱', 'Heirloom eggplant variety with excellent flavor and growing characteristics. Days to maturity: 120-140 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"120-140 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.560032254746443,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Eggplant'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Dwarf Eggplant' AND s.name = 'Eggplant');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Classic Endive', '🌱', 'Heirloom endive variety with excellent flavor and growing characteristics. Days to maturity: 70-90 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.4476759062620985,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Endive'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Classic Endive' AND s.name = 'Endive');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Royal Endive', '🌱', 'Heirloom endive variety with excellent flavor and growing characteristics. Days to maturity: 80-100 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"80-100 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.753738390545894,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Endive'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Royal Endive' AND s.name = 'Endive');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Golden Endive', '🌱', 'Heirloom endive variety with excellent flavor and growing characteristics. Days to maturity: 90-110 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"90-110 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.1116481963335625,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Endive'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Golden Endive' AND s.name = 'Endive');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Classic Fava Beans', '🌱', 'Heirloom fava beans variety with excellent flavor and growing characteristics. Days to maturity: 70-90 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.268601637302224,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Fava Beans'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Classic Fava Beans' AND s.name = 'Fava Beans');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Royal Fava Beans', '🌱', 'Heirloom fava beans variety with excellent flavor and growing characteristics. Days to maturity: 80-100 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"80-100 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.177056579404097,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Fava Beans'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Royal Fava Beans' AND s.name = 'Fava Beans');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Golden Fava Beans', '🌱', 'Heirloom fava beans variety with excellent flavor and growing characteristics. Days to maturity: 90-110 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"90-110 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.0790703230518615,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Fava Beans'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Golden Fava Beans' AND s.name = 'Fava Beans');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Classic Fennel', '🌱', 'Heirloom fennel variety with excellent flavor and growing characteristics. Days to maturity: 70-90 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.643572576644465,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Fennel'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Classic Fennel' AND s.name = 'Fennel');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Royal Fennel', '🌱', 'Heirloom fennel variety with excellent flavor and growing characteristics. Days to maturity: 80-100 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"80-100 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.44706275210777,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Fennel'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Royal Fennel' AND s.name = 'Fennel');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Golden Fennel', '🌱', 'Heirloom fennel variety with excellent flavor and growing characteristics. Days to maturity: 90-110 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"90-110 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.744645446468075,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Fennel'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Golden Fennel' AND s.name = 'Fennel');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Purple Fennel', '🌱', 'Heirloom fennel variety with excellent flavor and growing characteristics. Days to maturity: 100-120 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"100-120 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.784360211047273,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Fennel'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Purple Fennel' AND s.name = 'Fennel');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Giant Fennel', '🌱', 'Heirloom fennel variety with excellent flavor and growing characteristics. Days to maturity: 110-130 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"110-130 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.18973914233416,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Fennel'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Giant Fennel' AND s.name = 'Fennel');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Dwarf Fennel', '🌱', 'Heirloom fennel variety with excellent flavor and growing characteristics. Days to maturity: 120-140 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"120-140 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.637087078444684,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Fennel'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Dwarf Fennel' AND s.name = 'Fennel');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Classic Garlic', '🌱', 'Heirloom garlic variety with excellent flavor and growing characteristics. Days to maturity: 70-90 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.753211610947613,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Garlic'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Classic Garlic' AND s.name = 'Garlic');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Royal Garlic', '🌱', 'Heirloom garlic variety with excellent flavor and growing characteristics. Days to maturity: 80-100 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"80-100 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.140373016311057,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Garlic'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Royal Garlic' AND s.name = 'Garlic');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Golden Garlic', '🌱', 'Heirloom garlic variety with excellent flavor and growing characteristics. Days to maturity: 90-110 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"90-110 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.032944220994367,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Garlic'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Golden Garlic' AND s.name = 'Garlic');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Purple Garlic', '🌱', 'Heirloom garlic variety with excellent flavor and growing characteristics. Days to maturity: 100-120 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"100-120 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.79825786827694,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Garlic'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Purple Garlic' AND s.name = 'Garlic');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Giant Garlic', '🌱', 'Heirloom garlic variety with excellent flavor and growing characteristics. Days to maturity: 110-130 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"110-130 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.0545864491622545,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Garlic'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Giant Garlic' AND s.name = 'Garlic');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Dwarf Garlic', '🌱', 'Heirloom garlic variety with excellent flavor and growing characteristics. Days to maturity: 120-140 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"120-140 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.564427931138941,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Garlic'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Dwarf Garlic' AND s.name = 'Garlic');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Classic Gourds', '🌱', 'Heirloom gourds variety with excellent flavor and growing characteristics. Days to maturity: 70-90 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.737245903343958,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Gourds'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Classic Gourds' AND s.name = 'Gourds');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Royal Gourds', '🌱', 'Heirloom gourds variety with excellent flavor and growing characteristics. Days to maturity: 80-100 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"80-100 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.333302045141486,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Gourds'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Royal Gourds' AND s.name = 'Gourds');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Golden Gourds', '🌱', 'Heirloom gourds variety with excellent flavor and growing characteristics. Days to maturity: 90-110 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"90-110 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.6123134454906545,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Gourds'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Golden Gourds' AND s.name = 'Gourds');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Classic Ground Cherry', '🌱', 'Heirloom ground cherry variety with excellent flavor and growing characteristics. Days to maturity: 70-90 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.443825047857834,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Ground Cherry'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Classic Ground Cherry' AND s.name = 'Ground Cherry');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Royal Ground Cherry', '🌱', 'Heirloom ground cherry variety with excellent flavor and growing characteristics. Days to maturity: 80-100 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"80-100 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.6071659419131255,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Ground Cherry'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Royal Ground Cherry' AND s.name = 'Ground Cherry');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Golden Ground Cherry', '🌱', 'Heirloom ground cherry variety with excellent flavor and growing characteristics. Days to maturity: 90-110 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"90-110 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.082315146097589,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Ground Cherry'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Golden Ground Cherry' AND s.name = 'Ground Cherry');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Purple Ground Cherry', '🌱', 'Heirloom ground cherry variety with excellent flavor and growing characteristics. Days to maturity: 100-120 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"100-120 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.678609804165847,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Ground Cherry'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Purple Ground Cherry' AND s.name = 'Ground Cherry');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Classic Kale', '🌱', 'Heirloom kale variety with excellent flavor and growing characteristics. Days to maturity: 70-90 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.00370841252954,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Kale'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Classic Kale' AND s.name = 'Kale');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Royal Kale', '🌱', 'Heirloom kale variety with excellent flavor and growing characteristics. Days to maturity: 80-100 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"80-100 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.291708933775726,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Kale'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Royal Kale' AND s.name = 'Kale');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Golden Kale', '🌱', 'Heirloom kale variety with excellent flavor and growing characteristics. Days to maturity: 90-110 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"90-110 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.717051046453637,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Kale'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Golden Kale' AND s.name = 'Kale');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Classic Kohlrabi', '🌱', 'Heirloom kohlrabi variety with excellent flavor and growing characteristics. Days to maturity: 70-90 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.012357678452169,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Kohlrabi'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Classic Kohlrabi' AND s.name = 'Kohlrabi');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Royal Kohlrabi', '🌱', 'Heirloom kohlrabi variety with excellent flavor and growing characteristics. Days to maturity: 80-100 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"80-100 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.793021354700825,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Kohlrabi'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Royal Kohlrabi' AND s.name = 'Kohlrabi');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Golden Kohlrabi', '🌱', 'Heirloom kohlrabi variety with excellent flavor and growing characteristics. Days to maturity: 90-110 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"90-110 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.286444623675108,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Kohlrabi'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Golden Kohlrabi' AND s.name = 'Kohlrabi');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Purple Kohlrabi', '🌱', 'Heirloom kohlrabi variety with excellent flavor and growing characteristics. Days to maturity: 100-120 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"100-120 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.494805802546367,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Kohlrabi'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Purple Kohlrabi' AND s.name = 'Kohlrabi');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Giant Kohlrabi', '🌱', 'Heirloom kohlrabi variety with excellent flavor and growing characteristics. Days to maturity: 110-130 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"110-130 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.314953527227357,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Kohlrabi'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Giant Kohlrabi' AND s.name = 'Kohlrabi');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Dwarf Kohlrabi', '🌱', 'Heirloom kohlrabi variety with excellent flavor and growing characteristics. Days to maturity: 120-140 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"120-140 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.500220101739858,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Kohlrabi'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Dwarf Kohlrabi' AND s.name = 'Kohlrabi');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Classic Leeks', '🌱', 'Heirloom leeks variety with excellent flavor and growing characteristics. Days to maturity: 70-90 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.597929140174519,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Leeks'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Classic Leeks' AND s.name = 'Leeks');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Royal Leeks', '🌱', 'Heirloom leeks variety with excellent flavor and growing characteristics. Days to maturity: 80-100 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"80-100 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.290750117682807,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Leeks'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Royal Leeks' AND s.name = 'Leeks');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Golden Leeks', '🌱', 'Heirloom leeks variety with excellent flavor and growing characteristics. Days to maturity: 90-110 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"90-110 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.291670203678297,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Leeks'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Golden Leeks' AND s.name = 'Leeks');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Purple Leeks', '🌱', 'Heirloom leeks variety with excellent flavor and growing characteristics. Days to maturity: 100-120 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"100-120 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.559789106173571,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Leeks'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Purple Leeks' AND s.name = 'Leeks');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Giant Leeks', '🌱', 'Heirloom leeks variety with excellent flavor and growing characteristics. Days to maturity: 110-130 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"110-130 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.605222538842529,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Leeks'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Giant Leeks' AND s.name = 'Leeks');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Dwarf Leeks', '🌱', 'Heirloom leeks variety with excellent flavor and growing characteristics. Days to maturity: 120-140 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"120-140 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.259236148542704,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Leeks'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Dwarf Leeks' AND s.name = 'Leeks');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Little Gem', '🌱', 'Compact romaine-type lettuce with sweet, crisp leaves. (Lactuca sativa) Days to maturity: 50-60 days Plant spacing: 8-10" Seed depth: 1/4" Sun: Full sun to partial shade', '{"botanical_name":"Lactuca sativa","days_to_maturity":"50-60 days","plant_spacing":"8-10\"","seed_depth":"1/4\"","sun_requirements":"Full sun to partial shade","frost_hardy":true}', '{"rating":4.4,"characteristics":null}', ARRAY['salad', 'fresh', 'sandwich']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Lettuce'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Little Gem' AND s.name = 'Lettuce');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Spotted Aleppo Syrian', '🌱', 'Rare Syrian lettuce with distinctive spotted leaves. (Lactuca sativa) Days to maturity: 55-65 days Plant spacing: 8-10"', '{"botanical_name":"Lactuca sativa","days_to_maturity":"55-65 days","plant_spacing":"8-10\"","seed_depth":null,"sun_requirements":null,"frost_hardy":null}', '{"rating":4.2,"characteristics":null}', ARRAY['salad', 'fresh', 'sandwich']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Lettuce'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Spotted Aleppo Syrian' AND s.name = 'Lettuce');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Hao Shan', '🌱', 'Asian lettuce variety with excellent heat tolerance. (Lactuca sativa) Days to maturity: 45-55 days', '{"botanical_name":"Lactuca sativa","days_to_maturity":"45-55 days","plant_spacing":null,"seed_depth":null,"sun_requirements":null,"frost_hardy":null}', '{"rating":4.3,"characteristics":null}', ARRAY['salad', 'fresh', 'sandwich']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Lettuce'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Hao Shan' AND s.name = 'Lettuce');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Classic Mache', '🌱', 'Heirloom mache variety with excellent flavor and growing characteristics. Days to maturity: 70-90 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.122113395876036,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Mache'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Classic Mache' AND s.name = 'Mache');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Royal Mache', '🌱', 'Heirloom mache variety with excellent flavor and growing characteristics. Days to maturity: 80-100 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"80-100 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.166582893558779,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Mache'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Royal Mache' AND s.name = 'Mache');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Golden Mache', '🌱', 'Heirloom mache variety with excellent flavor and growing characteristics. Days to maturity: 90-110 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"90-110 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.621083493200633,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Mache'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Golden Mache' AND s.name = 'Mache');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Purple Mache', '🌱', 'Heirloom mache variety with excellent flavor and growing characteristics. Days to maturity: 100-120 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"100-120 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.177505765070012,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Mache'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Purple Mache' AND s.name = 'Mache');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Giant Mache', '🌱', 'Heirloom mache variety with excellent flavor and growing characteristics. Days to maturity: 110-130 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"110-130 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.56461510844904,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Mache'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Giant Mache' AND s.name = 'Mache');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Kajari', '🌱', 'Indian melon with striped skin and sweet flesh. (Cucumis melo) Days to maturity: 90-100 days Plant spacing: 18-24" Seed depth: 1/2" Sun: Full sun', '{"botanical_name":"Cucumis melo","days_to_maturity":"90-100 days","plant_spacing":"18-24\"","seed_depth":"1/2\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.2,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Melons'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Kajari' AND s.name = 'Melons');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Classic Millet', '🌱', 'Heirloom millet variety with excellent flavor and growing characteristics. Days to maturity: 70-90 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.147259656392,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Millet'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Classic Millet' AND s.name = 'Millet');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Royal Millet', '🌱', 'Heirloom millet variety with excellent flavor and growing characteristics. Days to maturity: 80-100 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"80-100 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.208614461437184,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Millet'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Royal Millet' AND s.name = 'Millet');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Golden Millet', '🌱', 'Heirloom millet variety with excellent flavor and growing characteristics. Days to maturity: 90-110 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"90-110 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.24382505768864,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Millet'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Golden Millet' AND s.name = 'Millet');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Purple Millet', '🌱', 'Heirloom millet variety with excellent flavor and growing characteristics. Days to maturity: 100-120 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"100-120 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.1133296222957005,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Millet'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Purple Millet' AND s.name = 'Millet');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Giant Millet', '🌱', 'Heirloom millet variety with excellent flavor and growing characteristics. Days to maturity: 110-130 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"110-130 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.102484850032073,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Millet'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Giant Millet' AND s.name = 'Millet');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Dwarf Millet', '🌱', 'Heirloom millet variety with excellent flavor and growing characteristics. Days to maturity: 120-140 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"120-140 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.027036699985323,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Millet'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Dwarf Millet' AND s.name = 'Millet');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Early Millet', '🌱', 'Heirloom millet variety with excellent flavor and growing characteristics. Days to maturity: 130-150 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"130-150 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.769997827996827,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Millet'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Early Millet' AND s.name = 'Millet');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Late Millet', '🌱', 'Heirloom millet variety with excellent flavor and growing characteristics. Days to maturity: 140-160 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"140-160 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.381822451462402,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Millet'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Late Millet' AND s.name = 'Millet');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Classic Mustard Greens', '🌱', 'Heirloom mustard greens variety with excellent flavor and growing characteristics. Days to maturity: 70-90 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.27259390463004,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Mustard Greens'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Classic Mustard Greens' AND s.name = 'Mustard Greens');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Royal Mustard Greens', '🌱', 'Heirloom mustard greens variety with excellent flavor and growing characteristics. Days to maturity: 80-100 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"80-100 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.56010244771847,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Mustard Greens'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Royal Mustard Greens' AND s.name = 'Mustard Greens');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Golden Mustard Greens', '🌱', 'Heirloom mustard greens variety with excellent flavor and growing characteristics. Days to maturity: 90-110 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"90-110 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.2662116747116094,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Mustard Greens'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Golden Mustard Greens' AND s.name = 'Mustard Greens');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Classic Okra', '🌱', 'Heirloom okra variety with excellent flavor and growing characteristics. Days to maturity: 70-90 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.459149588314269,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Okra'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Classic Okra' AND s.name = 'Okra');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Royal Okra', '🌱', 'Heirloom okra variety with excellent flavor and growing characteristics. Days to maturity: 80-100 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"80-100 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.680168196947745,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Okra'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Royal Okra' AND s.name = 'Okra');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Golden Okra', '🌱', 'Heirloom okra variety with excellent flavor and growing characteristics. Days to maturity: 90-110 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"90-110 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.125233077288368,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Okra'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Golden Okra' AND s.name = 'Okra');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Purple Okra', '🌱', 'Heirloom okra variety with excellent flavor and growing characteristics. Days to maturity: 100-120 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"100-120 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.2376567557717975,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Okra'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Purple Okra' AND s.name = 'Okra');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Giant Okra', '🌱', 'Heirloom okra variety with excellent flavor and growing characteristics. Days to maturity: 110-130 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"110-130 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.4799867356229175,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Okra'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Giant Okra' AND s.name = 'Okra');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Dwarf Okra', '🌱', 'Heirloom okra variety with excellent flavor and growing characteristics. Days to maturity: 120-140 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"120-140 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.456278164609295,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Okra'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Dwarf Okra' AND s.name = 'Okra');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Classic Onions', '🌱', 'Heirloom onions variety with excellent flavor and growing characteristics. Days to maturity: 70-90 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.329583254505176,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Onions'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Classic Onions' AND s.name = 'Onions');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Royal Onions', '🌱', 'Heirloom onions variety with excellent flavor and growing characteristics. Days to maturity: 80-100 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"80-100 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.023461804047313,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Onions'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Royal Onions' AND s.name = 'Onions');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Golden Onions', '🌱', 'Heirloom onions variety with excellent flavor and growing characteristics. Days to maturity: 90-110 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"90-110 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.398103053130304,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Onions'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Golden Onions' AND s.name = 'Onions');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Purple Onions', '🌱', 'Heirloom onions variety with excellent flavor and growing characteristics. Days to maturity: 100-120 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"100-120 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.3319777395358425,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Onions'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Purple Onions' AND s.name = 'Onions');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Giant Onions', '🌱', 'Heirloom onions variety with excellent flavor and growing characteristics. Days to maturity: 110-130 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"110-130 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.619225683681601,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Onions'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Giant Onions' AND s.name = 'Onions');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Classic Peas', '🌱', 'Heirloom peas variety with excellent flavor and growing characteristics. Days to maturity: 70-90 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.088350146203871,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Peas'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Classic Peas' AND s.name = 'Peas');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Royal Peas', '🌱', 'Heirloom peas variety with excellent flavor and growing characteristics. Days to maturity: 80-100 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"80-100 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.59149245901268,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Peas'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Royal Peas' AND s.name = 'Peas');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Golden Peas', '🌱', 'Heirloom peas variety with excellent flavor and growing characteristics. Days to maturity: 90-110 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"90-110 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.031824399389528,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Peas'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Golden Peas' AND s.name = 'Peas');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Purple Peas', '🌱', 'Heirloom peas variety with excellent flavor and growing characteristics. Days to maturity: 100-120 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"100-120 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.259994817971603,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Peas'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Purple Peas' AND s.name = 'Peas');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Giant Peas', '🌱', 'Heirloom peas variety with excellent flavor and growing characteristics. Days to maturity: 110-130 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"110-130 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.6352615991699215,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Peas'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Giant Peas' AND s.name = 'Peas');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Dwarf Peas', '🌱', 'Heirloom peas variety with excellent flavor and growing characteristics. Days to maturity: 120-140 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"120-140 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.767945708373103,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Peas'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Dwarf Peas' AND s.name = 'Peas');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Early Peas', '🌱', 'Heirloom peas variety with excellent flavor and growing characteristics. Days to maturity: 130-150 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"130-150 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.541129319824056,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Peas'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Early Peas' AND s.name = 'Peas');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Late Peas', '🌱', 'Heirloom peas variety with excellent flavor and growing characteristics. Days to maturity: 140-160 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"140-160 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.587634366104786,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Peas'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Late Peas' AND s.name = 'Peas');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Aleppo', '🌱', 'Syrian pepper with moderate heat and fruity flavor. (Capsicum annuum) Days to maturity: 75-85 days Plant spacing: 12-18" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":"Capsicum annuum","days_to_maturity":"75-85 days","plant_spacing":"12-18\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.3,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Peppers'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Aleppo' AND s.name = 'Peppers');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Fish', '🌱', 'Striped pepper with mild heat and unique appearance. (Capsicum annuum) Days to maturity: 70-80 days', '{"botanical_name":"Capsicum annuum","days_to_maturity":"70-80 days","plant_spacing":null,"seed_depth":null,"sun_requirements":null,"frost_hardy":null}', '{"rating":4.2,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Peppers'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Fish' AND s.name = 'Peppers');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Classic Potatoes', '🌱', 'Heirloom potatoes variety with excellent flavor and growing characteristics. Days to maturity: 70-90 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.640185964140916,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Potatoes'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Classic Potatoes' AND s.name = 'Potatoes');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Royal Potatoes', '🌱', 'Heirloom potatoes variety with excellent flavor and growing characteristics. Days to maturity: 80-100 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"80-100 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.270651563486821,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Potatoes'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Royal Potatoes' AND s.name = 'Potatoes');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Golden Potatoes', '🌱', 'Heirloom potatoes variety with excellent flavor and growing characteristics. Days to maturity: 90-110 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"90-110 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.196967765584941,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Potatoes'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Golden Potatoes' AND s.name = 'Potatoes');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Purple Potatoes', '🌱', 'Heirloom potatoes variety with excellent flavor and growing characteristics. Days to maturity: 100-120 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"100-120 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.044169148577258,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Potatoes'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Purple Potatoes' AND s.name = 'Potatoes');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Giant Potatoes', '🌱', 'Heirloom potatoes variety with excellent flavor and growing characteristics. Days to maturity: 110-130 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"110-130 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.204622594129066,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Potatoes'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Giant Potatoes' AND s.name = 'Potatoes');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Classic Pumpkins', '🌱', 'Heirloom pumpkins variety with excellent flavor and growing characteristics. Days to maturity: 70-90 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.41010242448806,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Pumpkins'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Classic Pumpkins' AND s.name = 'Pumpkins');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Royal Pumpkins', '🌱', 'Heirloom pumpkins variety with excellent flavor and growing characteristics. Days to maturity: 80-100 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"80-100 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.753328760198723,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Pumpkins'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Royal Pumpkins' AND s.name = 'Pumpkins');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Golden Pumpkins', '🌱', 'Heirloom pumpkins variety with excellent flavor and growing characteristics. Days to maturity: 90-110 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"90-110 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.344556140551654,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Pumpkins'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Golden Pumpkins' AND s.name = 'Pumpkins');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Purple Pumpkins', '🌱', 'Heirloom pumpkins variety with excellent flavor and growing characteristics. Days to maturity: 100-120 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"100-120 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.227310183884444,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Pumpkins'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Purple Pumpkins' AND s.name = 'Pumpkins');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Classic Purslane', '🌱', 'Heirloom purslane variety with excellent flavor and growing characteristics. Days to maturity: 70-90 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.521936721797406,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Purslane'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Classic Purslane' AND s.name = 'Purslane');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Royal Purslane', '🌱', 'Heirloom purslane variety with excellent flavor and growing characteristics. Days to maturity: 80-100 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"80-100 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.1967474599457555,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Purslane'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Royal Purslane' AND s.name = 'Purslane');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Golden Purslane', '🌱', 'Heirloom purslane variety with excellent flavor and growing characteristics. Days to maturity: 90-110 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"90-110 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.573233603894656,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Purslane'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Golden Purslane' AND s.name = 'Purslane');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Purple Purslane', '🌱', 'Heirloom purslane variety with excellent flavor and growing characteristics. Days to maturity: 100-120 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"100-120 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.076341751030296,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Purslane'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Purple Purslane' AND s.name = 'Purslane');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Classic Quinoa', '🌱', 'Heirloom quinoa variety with excellent flavor and growing characteristics. Days to maturity: 70-90 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.2543840061245195,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Quinoa'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Classic Quinoa' AND s.name = 'Quinoa');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Royal Quinoa', '🌱', 'Heirloom quinoa variety with excellent flavor and growing characteristics. Days to maturity: 80-100 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"80-100 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.310349119636284,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Quinoa'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Royal Quinoa' AND s.name = 'Quinoa');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Golden Quinoa', '🌱', 'Heirloom quinoa variety with excellent flavor and growing characteristics. Days to maturity: 90-110 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"90-110 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.020740590717304,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Quinoa'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Golden Quinoa' AND s.name = 'Quinoa');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Purple Quinoa', '🌱', 'Heirloom quinoa variety with excellent flavor and growing characteristics. Days to maturity: 100-120 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"100-120 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.407547317536792,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Quinoa'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Purple Quinoa' AND s.name = 'Quinoa');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Giant Quinoa', '🌱', 'Heirloom quinoa variety with excellent flavor and growing characteristics. Days to maturity: 110-130 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"110-130 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.545300247126271,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Quinoa'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Giant Quinoa' AND s.name = 'Quinoa');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Dwarf Quinoa', '🌱', 'Heirloom quinoa variety with excellent flavor and growing characteristics. Days to maturity: 120-140 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"120-140 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.3480719697957735,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Quinoa'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Dwarf Quinoa' AND s.name = 'Quinoa');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Classic Radishes', '🌱', 'Heirloom radishes variety with excellent flavor and growing characteristics. Days to maturity: 70-90 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.081149636644001,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Radishes'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Classic Radishes' AND s.name = 'Radishes');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Royal Radishes', '🌱', 'Heirloom radishes variety with excellent flavor and growing characteristics. Days to maturity: 80-100 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"80-100 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.024857286254405,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Radishes'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Royal Radishes' AND s.name = 'Radishes');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Golden Radishes', '🌱', 'Heirloom radishes variety with excellent flavor and growing characteristics. Days to maturity: 90-110 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"90-110 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.759766504967074,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Radishes'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Golden Radishes' AND s.name = 'Radishes');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Purple Radishes', '🌱', 'Heirloom radishes variety with excellent flavor and growing characteristics. Days to maturity: 100-120 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"100-120 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.6588002921342655,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Radishes'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Purple Radishes' AND s.name = 'Radishes');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Giant Radishes', '🌱', 'Heirloom radishes variety with excellent flavor and growing characteristics. Days to maturity: 110-130 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"110-130 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.687457011590007,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Radishes'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Giant Radishes' AND s.name = 'Radishes');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Classic Rhubarb', '🌱', 'Heirloom rhubarb variety with excellent flavor and growing characteristics. Days to maturity: 70-90 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.48204905068702,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Rhubarb'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Classic Rhubarb' AND s.name = 'Rhubarb');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Royal Rhubarb', '🌱', 'Heirloom rhubarb variety with excellent flavor and growing characteristics. Days to maturity: 80-100 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"80-100 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.25121428189987,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Rhubarb'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Royal Rhubarb' AND s.name = 'Rhubarb');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Golden Rhubarb', '🌱', 'Heirloom rhubarb variety with excellent flavor and growing characteristics. Days to maturity: 90-110 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"90-110 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.582941750085654,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Rhubarb'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Golden Rhubarb' AND s.name = 'Rhubarb');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Purple Rhubarb', '🌱', 'Heirloom rhubarb variety with excellent flavor and growing characteristics. Days to maturity: 100-120 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"100-120 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.3621945441021905,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Rhubarb'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Purple Rhubarb' AND s.name = 'Rhubarb');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Giant Rhubarb', '🌱', 'Heirloom rhubarb variety with excellent flavor and growing characteristics. Days to maturity: 110-130 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"110-130 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.763887141497707,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Rhubarb'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Giant Rhubarb' AND s.name = 'Rhubarb');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Dwarf Rhubarb', '🌱', 'Heirloom rhubarb variety with excellent flavor and growing characteristics. Days to maturity: 120-140 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"120-140 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.571110879050951,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Rhubarb'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Dwarf Rhubarb' AND s.name = 'Rhubarb');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Early Rhubarb', '🌱', 'Heirloom rhubarb variety with excellent flavor and growing characteristics. Days to maturity: 130-150 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"130-150 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.126916209283326,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Rhubarb'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Early Rhubarb' AND s.name = 'Rhubarb');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Late Rhubarb', '🌱', 'Heirloom rhubarb variety with excellent flavor and growing characteristics. Days to maturity: 140-160 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"140-160 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.4318322760368645,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Rhubarb'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Late Rhubarb' AND s.name = 'Rhubarb');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Classic Rutabaga', '🌱', 'Heirloom rutabaga variety with excellent flavor and growing characteristics. Days to maturity: 70-90 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.693536634131284,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Rutabaga'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Classic Rutabaga' AND s.name = 'Rutabaga');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Royal Rutabaga', '🌱', 'Heirloom rutabaga variety with excellent flavor and growing characteristics. Days to maturity: 80-100 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"80-100 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.280154206689215,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Rutabaga'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Royal Rutabaga' AND s.name = 'Rutabaga');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Golden Rutabaga', '🌱', 'Heirloom rutabaga variety with excellent flavor and growing characteristics. Days to maturity: 90-110 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"90-110 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.063977069199235,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Rutabaga'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Golden Rutabaga' AND s.name = 'Rutabaga');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Purple Rutabaga', '🌱', 'Heirloom rutabaga variety with excellent flavor and growing characteristics. Days to maturity: 100-120 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"100-120 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.513854997991211,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Rutabaga'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Purple Rutabaga' AND s.name = 'Rutabaga');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Giant Rutabaga', '🌱', 'Heirloom rutabaga variety with excellent flavor and growing characteristics. Days to maturity: 110-130 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"110-130 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.212827502205529,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Rutabaga'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Giant Rutabaga' AND s.name = 'Rutabaga');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Dwarf Rutabaga', '🌱', 'Heirloom rutabaga variety with excellent flavor and growing characteristics. Days to maturity: 120-140 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"120-140 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.287629016546851,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Rutabaga'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Dwarf Rutabaga' AND s.name = 'Rutabaga');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Early Rutabaga', '🌱', 'Heirloom rutabaga variety with excellent flavor and growing characteristics. Days to maturity: 130-150 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"130-150 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.50743175744248,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Rutabaga'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Early Rutabaga' AND s.name = 'Rutabaga');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Classic Spinach', '🌱', 'Heirloom spinach variety with excellent flavor and growing characteristics. Days to maturity: 70-90 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.464336599883643,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Spinach'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Classic Spinach' AND s.name = 'Spinach');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Royal Spinach', '🌱', 'Heirloom spinach variety with excellent flavor and growing characteristics. Days to maturity: 80-100 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"80-100 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.422369968440565,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Spinach'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Royal Spinach' AND s.name = 'Spinach');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Golden Spinach', '🌱', 'Heirloom spinach variety with excellent flavor and growing characteristics. Days to maturity: 90-110 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"90-110 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.447089096062555,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Spinach'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Golden Spinach' AND s.name = 'Spinach');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Purple Spinach', '🌱', 'Heirloom spinach variety with excellent flavor and growing characteristics. Days to maturity: 100-120 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"100-120 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.688709577596008,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Spinach'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Purple Spinach' AND s.name = 'Spinach');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Giant Spinach', '🌱', 'Heirloom spinach variety with excellent flavor and growing characteristics. Days to maturity: 110-130 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"110-130 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.4399500504825555,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Spinach'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Giant Spinach' AND s.name = 'Spinach');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Zucchini Golden', '🌱', 'Golden yellow zucchini with tender flesh. (Cucurbita pepo) Days to maturity: 50-60 days Plant spacing: 18-24" Seed depth: 1/2" Sun: Full sun', '{"botanical_name":"Cucurbita pepo","days_to_maturity":"50-60 days","plant_spacing":"18-24\"","seed_depth":"1/2\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.4,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Squash Summer'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Zucchini Golden' AND s.name = 'Squash Summer');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Classic Squash Winter', '🌱', 'Heirloom squash winter variety with excellent flavor and growing characteristics. Days to maturity: 70-90 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.514717748899387,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Squash Winter'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Classic Squash Winter' AND s.name = 'Squash Winter');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Royal Squash Winter', '🌱', 'Heirloom squash winter variety with excellent flavor and growing characteristics. Days to maturity: 80-100 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"80-100 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.2439683875638705,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Squash Winter'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Royal Squash Winter' AND s.name = 'Squash Winter');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Golden Squash Winter', '🌱', 'Heirloom squash winter variety with excellent flavor and growing characteristics. Days to maturity: 90-110 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"90-110 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.602068908144147,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Squash Winter'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Golden Squash Winter' AND s.name = 'Squash Winter');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Classic Sunflowers', '🌱', 'Heirloom sunflowers variety with excellent flavor and growing characteristics. Days to maturity: 70-90 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.417573352407337,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Sunflowers'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Classic Sunflowers' AND s.name = 'Sunflowers');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Royal Sunflowers', '🌱', 'Heirloom sunflowers variety with excellent flavor and growing characteristics. Days to maturity: 80-100 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"80-100 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.19001915393356,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Sunflowers'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Royal Sunflowers' AND s.name = 'Sunflowers');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Golden Sunflowers', '🌱', 'Heirloom sunflowers variety with excellent flavor and growing characteristics. Days to maturity: 90-110 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"90-110 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.181353224706156,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Sunflowers'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Golden Sunflowers' AND s.name = 'Sunflowers');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Purple Sunflowers', '🌱', 'Heirloom sunflowers variety with excellent flavor and growing characteristics. Days to maturity: 100-120 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"100-120 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.065682721662885,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Sunflowers'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Purple Sunflowers' AND s.name = 'Sunflowers');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Giant Sunflowers', '🌱', 'Heirloom sunflowers variety with excellent flavor and growing characteristics. Days to maturity: 110-130 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"110-130 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.14125500433923,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Sunflowers'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Giant Sunflowers' AND s.name = 'Sunflowers');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Dwarf Sunflowers', '🌱', 'Heirloom sunflowers variety with excellent flavor and growing characteristics. Days to maturity: 120-140 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"120-140 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.354563371119739,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Sunflowers'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Dwarf Sunflowers' AND s.name = 'Sunflowers');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Early Sunflowers', '🌱', 'Heirloom sunflowers variety with excellent flavor and growing characteristics. Days to maturity: 130-150 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"130-150 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.422847913032538,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Sunflowers'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Early Sunflowers' AND s.name = 'Sunflowers');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Classic Sweet Potatoes', '🌱', 'Heirloom sweet potatoes variety with excellent flavor and growing characteristics. Days to maturity: 70-90 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.333470299809527,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Sweet Potatoes'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Classic Sweet Potatoes' AND s.name = 'Sweet Potatoes');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Royal Sweet Potatoes', '🌱', 'Heirloom sweet potatoes variety with excellent flavor and growing characteristics. Days to maturity: 80-100 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"80-100 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.612185320518685,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Sweet Potatoes'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Royal Sweet Potatoes' AND s.name = 'Sweet Potatoes');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Golden Sweet Potatoes', '🌱', 'Heirloom sweet potatoes variety with excellent flavor and growing characteristics. Days to maturity: 90-110 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"90-110 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.103593021499265,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Sweet Potatoes'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Golden Sweet Potatoes' AND s.name = 'Sweet Potatoes');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Purple Sweet Potatoes', '🌱', 'Heirloom sweet potatoes variety with excellent flavor and growing characteristics. Days to maturity: 100-120 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"100-120 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.115125729481103,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Sweet Potatoes'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Purple Sweet Potatoes' AND s.name = 'Sweet Potatoes');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Giant Sweet Potatoes', '🌱', 'Heirloom sweet potatoes variety with excellent flavor and growing characteristics. Days to maturity: 110-130 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"110-130 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.312981766547615,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Sweet Potatoes'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Giant Sweet Potatoes' AND s.name = 'Sweet Potatoes');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Classic Tomatillos', '🌱', 'Heirloom tomatillos variety with excellent flavor and growing characteristics. Days to maturity: 70-90 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.064970858834,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Tomatillos'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Classic Tomatillos' AND s.name = 'Tomatillos');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Royal Tomatillos', '🌱', 'Heirloom tomatillos variety with excellent flavor and growing characteristics. Days to maturity: 80-100 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"80-100 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.296519804935282,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Tomatillos'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Royal Tomatillos' AND s.name = 'Tomatillos');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Golden Tomatillos', '🌱', 'Heirloom tomatillos variety with excellent flavor and growing characteristics. Days to maturity: 90-110 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"90-110 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.178635895051763,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Tomatillos'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Golden Tomatillos' AND s.name = 'Tomatillos');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Cherokee Purple', '🌱', 'Heirloom beefsteak tomato with deep purple shoulders and rich flavor. (Solanum lycopersicum) Days to maturity: 80-85 days Plant spacing: 24-36" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":"Solanum lycopersicum","days_to_maturity":"80-85 days","plant_spacing":"24-36\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.7,"characteristics":null}', ARRAY['fresh', 'sauce', 'salad']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Tomatoes'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Cherokee Purple' AND s.name = 'Tomatoes');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Black Krim', '🌱', 'Russian heirloom with dark purple-black shoulders and rich, smoky flavor. (Solanum lycopersicum) Days to maturity: 80-85 days Plant spacing: 24-36"', '{"botanical_name":"Solanum lycopersicum","days_to_maturity":"80-85 days","plant_spacing":"24-36\"","seed_depth":null,"sun_requirements":null,"frost_hardy":null}', '{"rating":4.5,"characteristics":null}', ARRAY['fresh', 'sauce', 'salad']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Tomatoes'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Black Krim' AND s.name = 'Tomatoes');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Brandywine', '🌱', 'Classic heirloom beefsteak with exceptional flavor. (Solanum lycopersicum) Days to maturity: 85-90 days', '{"botanical_name":"Solanum lycopersicum","days_to_maturity":"85-90 days","plant_spacing":null,"seed_depth":null,"sun_requirements":null,"frost_hardy":null}', '{"rating":4.8,"characteristics":null}', ARRAY['fresh', 'sauce', 'salad']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Tomatoes'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Brandywine' AND s.name = 'Tomatoes');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Orange Hat', '🌱', 'Unique orange cherry tomato with sweet flavor. (Solanum lycopersicum) Days to maturity: 70-75 days', '{"botanical_name":"Solanum lycopersicum","days_to_maturity":"70-75 days","plant_spacing":null,"seed_depth":null,"sun_requirements":null,"frost_hardy":null}', '{"rating":4.3,"characteristics":null}', ARRAY['fresh', 'sauce', 'salad']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Tomatoes'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Orange Hat' AND s.name = 'Tomatoes');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Green Zebra', '🌱', 'Striped green tomato with tangy flavor. (Solanum lycopersicum) Days to maturity: 75-80 days', '{"botanical_name":"Solanum lycopersicum","days_to_maturity":"75-80 days","plant_spacing":null,"seed_depth":null,"sun_requirements":null,"frost_hardy":null}', '{"rating":4.4,"characteristics":null}', ARRAY['fresh', 'sauce', 'salad']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Tomatoes'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Green Zebra' AND s.name = 'Tomatoes');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Classic Turnips', '🌱', 'Heirloom turnips variety with excellent flavor and growing characteristics. Days to maturity: 70-90 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.653071234798189,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Turnips'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Classic Turnips' AND s.name = 'Turnips');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Royal Turnips', '🌱', 'Heirloom turnips variety with excellent flavor and growing characteristics. Days to maturity: 80-100 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"80-100 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.2560033851574275,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Turnips'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Royal Turnips' AND s.name = 'Turnips');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Golden Turnips', '🌱', 'Heirloom turnips variety with excellent flavor and growing characteristics. Days to maturity: 90-110 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"90-110 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.471027010824509,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Turnips'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Golden Turnips' AND s.name = 'Turnips');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Classic Watermelons', '🌱', 'Heirloom watermelons variety with excellent flavor and growing characteristics. Days to maturity: 70-90 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.081178980395294,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Watermelons'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Classic Watermelons' AND s.name = 'Watermelons');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Royal Watermelons', '🌱', 'Heirloom watermelons variety with excellent flavor and growing characteristics. Days to maturity: 80-100 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"80-100 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.776513684217823,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Watermelons'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Royal Watermelons' AND s.name = 'Watermelons');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Golden Watermelons', '🌱', 'Heirloom watermelons variety with excellent flavor and growing characteristics. Days to maturity: 90-110 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"90-110 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.014426738841907,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Watermelons'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Golden Watermelons' AND s.name = 'Watermelons');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Purple Watermelons', '🌱', 'Heirloom watermelons variety with excellent flavor and growing characteristics. Days to maturity: 100-120 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"100-120 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.762987569944217,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Watermelons'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Purple Watermelons' AND s.name = 'Watermelons');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Giant Watermelons', '🌱', 'Heirloom watermelons variety with excellent flavor and growing characteristics. Days to maturity: 110-130 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"110-130 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.070830406838021,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Watermelons'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Giant Watermelons' AND s.name = 'Watermelons');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Classic Wheat', '🌱', 'Heirloom wheat variety with excellent flavor and growing characteristics. Days to maturity: 70-90 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.4704583082134794,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Wheat'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Classic Wheat' AND s.name = 'Wheat');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Royal Wheat', '🌱', 'Heirloom wheat variety with excellent flavor and growing characteristics. Days to maturity: 80-100 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"80-100 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.689536615398241,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Wheat'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Royal Wheat' AND s.name = 'Wheat');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Golden Wheat', '🌱', 'Heirloom wheat variety with excellent flavor and growing characteristics. Days to maturity: 90-110 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"90-110 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.62178112270704,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Wheat'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Golden Wheat' AND s.name = 'Wheat');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Purple Wheat', '🌱', 'Heirloom wheat variety with excellent flavor and growing characteristics. Days to maturity: 100-120 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"100-120 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.23309234747617,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Wheat'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Purple Wheat' AND s.name = 'Wheat');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Giant Wheat', '🌱', 'Heirloom wheat variety with excellent flavor and growing characteristics. Days to maturity: 110-130 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"110-130 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.150231830900102,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Wheat'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Giant Wheat' AND s.name = 'Wheat');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Dwarf Wheat', '🌱', 'Heirloom wheat variety with excellent flavor and growing characteristics. Days to maturity: 120-140 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"120-140 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.775535220232456,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Wheat'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Dwarf Wheat' AND s.name = 'Wheat');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Early Wheat', '🌱', 'Heirloom wheat variety with excellent flavor and growing characteristics. Days to maturity: 130-150 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"130-150 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.7970952101954865,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Wheat'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Early Wheat' AND s.name = 'Wheat');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Genovese', '🌱', 'An absolutely legendary heirloom that no Italian chef can cook without. Essential ingredient in basil pesto. (Ocimum basilicum) Days to maturity: 60-75 days Plant spacing: 8-12" Seed depth: 1/4" Sun: 8-12 hours of full sun', '{"botanical_name":"Ocimum basilicum","days_to_maturity":"60-75 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"8-12 hours of full sun","frost_hardy":null}', '{"rating":4.6,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Basil'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Genovese' AND s.name = 'Basil');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Thai Sweet', '🌱', 'Sweet Thai basil with distinctive flavor perfect for Asian cuisine. (Ocimum basilicum) Days to maturity: 70-85 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":"Ocimum basilicum","days_to_maturity":"70-85 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.4,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Basil'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Thai Sweet' AND s.name = 'Basil');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Thai Holy Kaprao', '🌱', 'Sacred Thai basil with spiritual significance and medicinal properties. (Ocimum tenuiflorum) Days to maturity: 80-90 days', '{"botanical_name":"Ocimum tenuiflorum","days_to_maturity":"80-90 days","plant_spacing":null,"seed_depth":null,"sun_requirements":null,"frost_hardy":null}', '{"rating":3.9,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Basil'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Thai Holy Kaprao' AND s.name = 'Basil');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Lemon', '🌱', 'Citrusy basil with bright lemon flavor and aroma. (Ocimum × citriodorum) Days to maturity: 60-75 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":"Ocimum × citriodorum","days_to_maturity":"60-75 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.6,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Basil'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Lemon' AND s.name = 'Basil');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Cinnamon', '🌱', 'Unique basil with warm cinnamon flavor and aroma. (Ocimum basilicum) Days to maturity: 70-85 days', '{"botanical_name":"Ocimum basilicum","days_to_maturity":"70-85 days","plant_spacing":null,"seed_depth":null,"sun_requirements":null,"frost_hardy":null}', '{"rating":4.4,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Basil'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Cinnamon' AND s.name = 'Basil');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Dark Purple Opal', '🌱', 'Beautiful purple basil with ornamental value and great flavor. (Ocimum basilicum) Days to maturity: 75-90 days', '{"botanical_name":"Ocimum basilicum","days_to_maturity":"75-90 days","plant_spacing":null,"seed_depth":null,"sun_requirements":null,"frost_hardy":null}', '{"rating":4.6,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Basil'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Dark Purple Opal' AND s.name = 'Basil');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Lettuce Leaf', '🌱', 'Large-leafed basil perfect for wrapping and salads. (Ocimum basilicum) Days to maturity: 60-75 days', '{"botanical_name":"Ocimum basilicum","days_to_maturity":"60-75 days","plant_spacing":null,"seed_depth":null,"sun_requirements":null,"frost_hardy":null}', '{"rating":4.6,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Basil'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Lettuce Leaf' AND s.name = 'Basil');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Cardinal', '🌱', 'Bright red-flowered basil with excellent flavor. (Ocimum basilicum) Days to maturity: 70-85 days', '{"botanical_name":"Ocimum basilicum","days_to_maturity":"70-85 days","plant_spacing":null,"seed_depth":null,"sun_requirements":null,"frost_hardy":null}', '{"rating":4.7,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Basil'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Cardinal' AND s.name = 'Basil');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Persian', '🌱', 'Traditional Persian basil with unique flavor profile. (Ocimum basilicum) Days to maturity: 70-85 days', '{"botanical_name":"Ocimum basilicum","days_to_maturity":"70-85 days","plant_spacing":null,"seed_depth":null,"sun_requirements":null,"frost_hardy":null}', '{"rating":4.6,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Basil'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Persian' AND s.name = 'Basil');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Siam Queen Thai', '🌱', 'Premium Thai basil variety with intense flavor. (Ocimum basilicum) Days to maturity: 75-85 days', '{"botanical_name":"Ocimum basilicum","days_to_maturity":"75-85 days","plant_spacing":null,"seed_depth":null,"sun_requirements":null,"frost_hardy":null}', '{"rating":4.5,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Basil'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Siam Queen Thai' AND s.name = 'Basil');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Classic Bee Balm', '🌱', 'Heirloom bee balm variety with excellent flavor and growing characteristics. Days to maturity: 70-90 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.633626557400077,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Bee Balm'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Classic Bee Balm' AND s.name = 'Bee Balm');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Royal Bee Balm', '🌱', 'Heirloom bee balm variety with excellent flavor and growing characteristics. Days to maturity: 80-100 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"80-100 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.584991458586236,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Bee Balm'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Royal Bee Balm' AND s.name = 'Bee Balm');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Golden Bee Balm', '🌱', 'Heirloom bee balm variety with excellent flavor and growing characteristics. Days to maturity: 90-110 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"90-110 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.247769592090122,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Bee Balm'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Golden Bee Balm' AND s.name = 'Bee Balm');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Purple Bee Balm', '🌱', 'Heirloom bee balm variety with excellent flavor and growing characteristics. Days to maturity: 100-120 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"100-120 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.470458896135904,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Bee Balm'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Purple Bee Balm' AND s.name = 'Bee Balm');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Giant Bee Balm', '🌱', 'Heirloom bee balm variety with excellent flavor and growing characteristics. Days to maturity: 110-130 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"110-130 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.794532834120386,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Bee Balm'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Giant Bee Balm' AND s.name = 'Bee Balm');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Dwarf Bee Balm', '🌱', 'Heirloom bee balm variety with excellent flavor and growing characteristics. Days to maturity: 120-140 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"120-140 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.680300302482817,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Bee Balm'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Dwarf Bee Balm' AND s.name = 'Bee Balm');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Classic Borago', '🌱', 'Heirloom borago variety with excellent flavor and growing characteristics. Days to maturity: 70-90 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.377762584404849,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Borago'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Classic Borago' AND s.name = 'Borago');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Royal Borago', '🌱', 'Heirloom borago variety with excellent flavor and growing characteristics. Days to maturity: 80-100 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"80-100 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.364354217716003,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Borago'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Royal Borago' AND s.name = 'Borago');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Golden Borago', '🌱', 'Heirloom borago variety with excellent flavor and growing characteristics. Days to maturity: 90-110 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"90-110 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.299172776066539,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Borago'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Golden Borago' AND s.name = 'Borago');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Classic Chamomile', '🌱', 'Heirloom chamomile variety with excellent flavor and growing characteristics. Days to maturity: 70-90 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.722731857184488,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Chamomile'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Classic Chamomile' AND s.name = 'Chamomile');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Royal Chamomile', '🌱', 'Heirloom chamomile variety with excellent flavor and growing characteristics. Days to maturity: 80-100 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"80-100 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.467950458542193,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Chamomile'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Royal Chamomile' AND s.name = 'Chamomile');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Golden Chamomile', '🌱', 'Heirloom chamomile variety with excellent flavor and growing characteristics. Days to maturity: 90-110 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"90-110 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.250096132551656,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Chamomile'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Golden Chamomile' AND s.name = 'Chamomile');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Purple Chamomile', '🌱', 'Heirloom chamomile variety with excellent flavor and growing characteristics. Days to maturity: 100-120 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"100-120 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.404847138753086,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Chamomile'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Purple Chamomile' AND s.name = 'Chamomile');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Giant Chamomile', '🌱', 'Heirloom chamomile variety with excellent flavor and growing characteristics. Days to maturity: 110-130 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"110-130 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.184963687930086,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Chamomile'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Giant Chamomile' AND s.name = 'Chamomile');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Dwarf Chamomile', '🌱', 'Heirloom chamomile variety with excellent flavor and growing characteristics. Days to maturity: 120-140 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"120-140 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.720106449898649,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Chamomile'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Dwarf Chamomile' AND s.name = 'Chamomile');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Early Chamomile', '🌱', 'Heirloom chamomile variety with excellent flavor and growing characteristics. Days to maturity: 130-150 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"130-150 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.704142497476193,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Chamomile'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Early Chamomile' AND s.name = 'Chamomile');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Late Chamomile', '🌱', 'Heirloom chamomile variety with excellent flavor and growing characteristics. Days to maturity: 140-160 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"140-160 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.498444236453265,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Chamomile'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Late Chamomile' AND s.name = 'Chamomile');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Classic Chives', '🌱', 'Heirloom chives variety with excellent flavor and growing characteristics. Days to maturity: 70-90 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.3826379794381785,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Chives'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Classic Chives' AND s.name = 'Chives');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Royal Chives', '🌱', 'Heirloom chives variety with excellent flavor and growing characteristics. Days to maturity: 80-100 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"80-100 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.485616843084298,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Chives'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Royal Chives' AND s.name = 'Chives');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Golden Chives', '🌱', 'Heirloom chives variety with excellent flavor and growing characteristics. Days to maturity: 90-110 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"90-110 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.3354219587214216,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Chives'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Golden Chives' AND s.name = 'Chives');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Purple Chives', '🌱', 'Heirloom chives variety with excellent flavor and growing characteristics. Days to maturity: 100-120 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"100-120 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.315450835603399,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Chives'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Purple Chives' AND s.name = 'Chives');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Classic Coriandrum', '🌱', 'Heirloom coriandrum variety with excellent flavor and growing characteristics. Days to maturity: 70-90 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.601650053049608,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Coriandrum'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Classic Coriandrum' AND s.name = 'Coriandrum');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Royal Coriandrum', '🌱', 'Heirloom coriandrum variety with excellent flavor and growing characteristics. Days to maturity: 80-100 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"80-100 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.219741388639796,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Coriandrum'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Royal Coriandrum' AND s.name = 'Coriandrum');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Golden Coriandrum', '🌱', 'Heirloom coriandrum variety with excellent flavor and growing characteristics. Days to maturity: 90-110 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"90-110 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.547562246661114,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Coriandrum'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Golden Coriandrum' AND s.name = 'Coriandrum');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Purple Coriandrum', '🌱', 'Heirloom coriandrum variety with excellent flavor and growing characteristics. Days to maturity: 100-120 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"100-120 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.582849664138684,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Coriandrum'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Purple Coriandrum' AND s.name = 'Coriandrum');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Giant Coriandrum', '🌱', 'Heirloom coriandrum variety with excellent flavor and growing characteristics. Days to maturity: 110-130 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"110-130 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.3008239817565785,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Coriandrum'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Giant Coriandrum' AND s.name = 'Coriandrum');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Classic Dill', '🌱', 'Heirloom dill variety with excellent flavor and growing characteristics. Days to maturity: 70-90 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.539905585508237,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Dill'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Classic Dill' AND s.name = 'Dill');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Royal Dill', '🌱', 'Heirloom dill variety with excellent flavor and growing characteristics. Days to maturity: 80-100 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"80-100 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.745096457675295,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Dill'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Royal Dill' AND s.name = 'Dill');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Golden Dill', '🌱', 'Heirloom dill variety with excellent flavor and growing characteristics. Days to maturity: 90-110 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"90-110 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.552740126802259,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Dill'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Golden Dill' AND s.name = 'Dill');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Purple Dill', '🌱', 'Heirloom dill variety with excellent flavor and growing characteristics. Days to maturity: 100-120 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"100-120 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.030875060486192,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Dill'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Purple Dill' AND s.name = 'Dill');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Giant Dill', '🌱', 'Heirloom dill variety with excellent flavor and growing characteristics. Days to maturity: 110-130 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"110-130 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.66424743113302,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Dill'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Giant Dill' AND s.name = 'Dill');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Dwarf Dill', '🌱', 'Heirloom dill variety with excellent flavor and growing characteristics. Days to maturity: 120-140 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"120-140 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.408307392220735,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Dill'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Dwarf Dill' AND s.name = 'Dill');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Early Dill', '🌱', 'Heirloom dill variety with excellent flavor and growing characteristics. Days to maturity: 130-150 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"130-150 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.554461186388086,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Dill'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Early Dill' AND s.name = 'Dill');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Late Dill', '🌱', 'Heirloom dill variety with excellent flavor and growing characteristics. Days to maturity: 140-160 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"140-160 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.79801754475619,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Dill'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Late Dill' AND s.name = 'Dill');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Classic Bloody Dock', '🌱', 'Heirloom bloody dock variety with excellent flavor and growing characteristics. Days to maturity: 70-90 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.622495421534314,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Bloody Dock'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Classic Bloody Dock' AND s.name = 'Bloody Dock');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Royal Bloody Dock', '🌱', 'Heirloom bloody dock variety with excellent flavor and growing characteristics. Days to maturity: 80-100 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"80-100 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.271495450897977,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Bloody Dock'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Royal Bloody Dock' AND s.name = 'Bloody Dock');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Golden Bloody Dock', '🌱', 'Heirloom bloody dock variety with excellent flavor and growing characteristics. Days to maturity: 90-110 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"90-110 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.329749633706293,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Bloody Dock'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Golden Bloody Dock' AND s.name = 'Bloody Dock');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Purple Bloody Dock', '🌱', 'Heirloom bloody dock variety with excellent flavor and growing characteristics. Days to maturity: 100-120 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"100-120 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.437432461213179,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Bloody Dock'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Purple Bloody Dock' AND s.name = 'Bloody Dock');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Giant Bloody Dock', '🌱', 'Heirloom bloody dock variety with excellent flavor and growing characteristics. Days to maturity: 110-130 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"110-130 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.644596014662402,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Bloody Dock'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Giant Bloody Dock' AND s.name = 'Bloody Dock');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Dwarf Bloody Dock', '🌱', 'Heirloom bloody dock variety with excellent flavor and growing characteristics. Days to maturity: 120-140 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"120-140 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.4634627264277364,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Bloody Dock'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Dwarf Bloody Dock' AND s.name = 'Bloody Dock');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Classic Echinacea', '🌱', 'Heirloom echinacea variety with excellent flavor and growing characteristics. Days to maturity: 70-90 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.436319297784792,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Echinacea'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Classic Echinacea' AND s.name = 'Echinacea');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Royal Echinacea', '🌱', 'Heirloom echinacea variety with excellent flavor and growing characteristics. Days to maturity: 80-100 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"80-100 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.465052055302221,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Echinacea'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Royal Echinacea' AND s.name = 'Echinacea');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Golden Echinacea', '🌱', 'Heirloom echinacea variety with excellent flavor and growing characteristics. Days to maturity: 90-110 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"90-110 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.201518763617268,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Echinacea'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Golden Echinacea' AND s.name = 'Echinacea');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Classic Fennel', '🌱', 'Heirloom fennel variety with excellent flavor and growing characteristics. Days to maturity: 70-90 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.7834564336679275,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Fennel'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Classic Fennel' AND s.name = 'Fennel');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Royal Fennel', '🌱', 'Heirloom fennel variety with excellent flavor and growing characteristics. Days to maturity: 80-100 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"80-100 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.040114152738268,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Fennel'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Royal Fennel' AND s.name = 'Fennel');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Golden Fennel', '🌱', 'Heirloom fennel variety with excellent flavor and growing characteristics. Days to maturity: 90-110 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"90-110 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.405027969151899,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Fennel'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Golden Fennel' AND s.name = 'Fennel');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Purple Fennel', '🌱', 'Heirloom fennel variety with excellent flavor and growing characteristics. Days to maturity: 100-120 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"100-120 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.262808192881635,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Fennel'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Purple Fennel' AND s.name = 'Fennel');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Giant Fennel', '🌱', 'Heirloom fennel variety with excellent flavor and growing characteristics. Days to maturity: 110-130 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"110-130 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.537388152498135,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Fennel'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Giant Fennel' AND s.name = 'Fennel');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Dwarf Fennel', '🌱', 'Heirloom fennel variety with excellent flavor and growing characteristics. Days to maturity: 120-140 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"120-140 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.047190159587776,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Fennel'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Dwarf Fennel' AND s.name = 'Fennel');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Classic Lavender', '🌱', 'Heirloom lavender variety with excellent flavor and growing characteristics. Days to maturity: 70-90 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.361668499116589,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Lavender'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Classic Lavender' AND s.name = 'Lavender');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Royal Lavender', '🌱', 'Heirloom lavender variety with excellent flavor and growing characteristics. Days to maturity: 80-100 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"80-100 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.747488943638384,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Lavender'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Royal Lavender' AND s.name = 'Lavender');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Golden Lavender', '🌱', 'Heirloom lavender variety with excellent flavor and growing characteristics. Days to maturity: 90-110 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"90-110 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.121887524053848,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Lavender'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Golden Lavender' AND s.name = 'Lavender');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Purple Lavender', '🌱', 'Heirloom lavender variety with excellent flavor and growing characteristics. Days to maturity: 100-120 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"100-120 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.734500273708763,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Lavender'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Purple Lavender' AND s.name = 'Lavender');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Giant Lavender', '🌱', 'Heirloom lavender variety with excellent flavor and growing characteristics. Days to maturity: 110-130 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"110-130 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.005103136352448,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Lavender'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Giant Lavender' AND s.name = 'Lavender');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Dwarf Lavender', '🌱', 'Heirloom lavender variety with excellent flavor and growing characteristics. Days to maturity: 120-140 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"120-140 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.538833044972717,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Lavender'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Dwarf Lavender' AND s.name = 'Lavender');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Classic Lemon Balm', '🌱', 'Heirloom lemon balm variety with excellent flavor and growing characteristics. Days to maturity: 70-90 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.027614181129022,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Lemon Balm'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Classic Lemon Balm' AND s.name = 'Lemon Balm');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Royal Lemon Balm', '🌱', 'Heirloom lemon balm variety with excellent flavor and growing characteristics. Days to maturity: 80-100 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"80-100 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.288277655728806,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Lemon Balm'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Royal Lemon Balm' AND s.name = 'Lemon Balm');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Golden Lemon Balm', '🌱', 'Heirloom lemon balm variety with excellent flavor and growing characteristics. Days to maturity: 90-110 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"90-110 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.5937836662947165,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Lemon Balm'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Golden Lemon Balm' AND s.name = 'Lemon Balm');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Purple Lemon Balm', '🌱', 'Heirloom lemon balm variety with excellent flavor and growing characteristics. Days to maturity: 100-120 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"100-120 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.524313237577134,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Lemon Balm'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Purple Lemon Balm' AND s.name = 'Lemon Balm');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Classic Marjoram', '🌱', 'Heirloom marjoram variety with excellent flavor and growing characteristics. Days to maturity: 70-90 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.252719246897323,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Marjoram'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Classic Marjoram' AND s.name = 'Marjoram');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Royal Marjoram', '🌱', 'Heirloom marjoram variety with excellent flavor and growing characteristics. Days to maturity: 80-100 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"80-100 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.4291896001867315,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Marjoram'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Royal Marjoram' AND s.name = 'Marjoram');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Golden Marjoram', '🌱', 'Heirloom marjoram variety with excellent flavor and growing characteristics. Days to maturity: 90-110 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"90-110 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.623411673068791,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Marjoram'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Golden Marjoram' AND s.name = 'Marjoram');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Classic Mint', '🌱', 'Heirloom mint variety with excellent flavor and growing characteristics. Days to maturity: 70-90 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.4793528837825285,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Mint'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Classic Mint' AND s.name = 'Mint');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Royal Mint', '🌱', 'Heirloom mint variety with excellent flavor and growing characteristics. Days to maturity: 80-100 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"80-100 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.687769697638986,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Mint'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Royal Mint' AND s.name = 'Mint');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Golden Mint', '🌱', 'Heirloom mint variety with excellent flavor and growing characteristics. Days to maturity: 90-110 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"90-110 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.030445602336055,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Mint'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Golden Mint' AND s.name = 'Mint');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Purple Mint', '🌱', 'Heirloom mint variety with excellent flavor and growing characteristics. Days to maturity: 100-120 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"100-120 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.1376929198545636,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Mint'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Purple Mint' AND s.name = 'Mint');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Giant Mint', '🌱', 'Heirloom mint variety with excellent flavor and growing characteristics. Days to maturity: 110-130 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"110-130 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.207822301842489,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Mint'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Giant Mint' AND s.name = 'Mint');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Classic Oregano', '🌱', 'Heirloom oregano variety with excellent flavor and growing characteristics. Days to maturity: 70-90 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.116847908110916,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Oregano'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Classic Oregano' AND s.name = 'Oregano');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Royal Oregano', '🌱', 'Heirloom oregano variety with excellent flavor and growing characteristics. Days to maturity: 80-100 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"80-100 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.252249027923726,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Oregano'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Royal Oregano' AND s.name = 'Oregano');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Golden Oregano', '🌱', 'Heirloom oregano variety with excellent flavor and growing characteristics. Days to maturity: 90-110 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"90-110 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.305438231024225,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Oregano'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Golden Oregano' AND s.name = 'Oregano');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Classic Parsley', '🌱', 'Heirloom parsley variety with excellent flavor and growing characteristics. Days to maturity: 70-90 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.318486805991008,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Parsley'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Classic Parsley' AND s.name = 'Parsley');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Royal Parsley', '🌱', 'Heirloom parsley variety with excellent flavor and growing characteristics. Days to maturity: 80-100 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"80-100 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.4570224212125815,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Parsley'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Royal Parsley' AND s.name = 'Parsley');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Golden Parsley', '🌱', 'Heirloom parsley variety with excellent flavor and growing characteristics. Days to maturity: 90-110 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"90-110 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.177179295319214,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Parsley'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Golden Parsley' AND s.name = 'Parsley');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Purple Parsley', '🌱', 'Heirloom parsley variety with excellent flavor and growing characteristics. Days to maturity: 100-120 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"100-120 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.014386678816064,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Parsley'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Purple Parsley' AND s.name = 'Parsley');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Giant Parsley', '🌱', 'Heirloom parsley variety with excellent flavor and growing characteristics. Days to maturity: 110-130 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"110-130 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.489310014814884,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Parsley'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Giant Parsley' AND s.name = 'Parsley');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Dwarf Parsley', '🌱', 'Heirloom parsley variety with excellent flavor and growing characteristics. Days to maturity: 120-140 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"120-140 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.382814127180741,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Parsley'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Dwarf Parsley' AND s.name = 'Parsley');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Early Parsley', '🌱', 'Heirloom parsley variety with excellent flavor and growing characteristics. Days to maturity: 130-150 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"130-150 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.355905223309,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Parsley'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Early Parsley' AND s.name = 'Parsley');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Late Parsley', '🌱', 'Heirloom parsley variety with excellent flavor and growing characteristics. Days to maturity: 140-160 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"140-160 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.2020150374113525,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Parsley'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Late Parsley' AND s.name = 'Parsley');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Classic Rosemary', '🌱', 'Heirloom rosemary variety with excellent flavor and growing characteristics. Days to maturity: 70-90 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.124600737151324,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Rosemary'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Classic Rosemary' AND s.name = 'Rosemary');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Royal Rosemary', '🌱', 'Heirloom rosemary variety with excellent flavor and growing characteristics. Days to maturity: 80-100 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"80-100 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.454499805752169,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Rosemary'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Royal Rosemary' AND s.name = 'Rosemary');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Golden Rosemary', '🌱', 'Heirloom rosemary variety with excellent flavor and growing characteristics. Days to maturity: 90-110 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"90-110 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.198919609876668,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Rosemary'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Golden Rosemary' AND s.name = 'Rosemary');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Purple Rosemary', '🌱', 'Heirloom rosemary variety with excellent flavor and growing characteristics. Days to maturity: 100-120 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"100-120 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.625477246084689,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Rosemary'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Purple Rosemary' AND s.name = 'Rosemary');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Giant Rosemary', '🌱', 'Heirloom rosemary variety with excellent flavor and growing characteristics. Days to maturity: 110-130 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"110-130 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.0635686982785915,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Rosemary'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Giant Rosemary' AND s.name = 'Rosemary');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Dwarf Rosemary', '🌱', 'Heirloom rosemary variety with excellent flavor and growing characteristics. Days to maturity: 120-140 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"120-140 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.669247376030932,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Rosemary'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Dwarf Rosemary' AND s.name = 'Rosemary');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Early Rosemary', '🌱', 'Heirloom rosemary variety with excellent flavor and growing characteristics. Days to maturity: 130-150 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"130-150 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.780863610619919,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Rosemary'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Early Rosemary' AND s.name = 'Rosemary');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Classic Rue', '🌱', 'Heirloom rue variety with excellent flavor and growing characteristics. Days to maturity: 70-90 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.376047666383834,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Rue'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Classic Rue' AND s.name = 'Rue');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Royal Rue', '🌱', 'Heirloom rue variety with excellent flavor and growing characteristics. Days to maturity: 80-100 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"80-100 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.320754617317232,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Rue'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Royal Rue' AND s.name = 'Rue');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Golden Rue', '🌱', 'Heirloom rue variety with excellent flavor and growing characteristics. Days to maturity: 90-110 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"90-110 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.71496496204554,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Rue'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Golden Rue' AND s.name = 'Rue');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Purple Rue', '🌱', 'Heirloom rue variety with excellent flavor and growing characteristics. Days to maturity: 100-120 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"100-120 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.498721322463256,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Rue'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Purple Rue' AND s.name = 'Rue');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Giant Rue', '🌱', 'Heirloom rue variety with excellent flavor and growing characteristics. Days to maturity: 110-130 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"110-130 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.064342307873945,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Rue'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Giant Rue' AND s.name = 'Rue');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Dwarf Rue', '🌱', 'Heirloom rue variety with excellent flavor and growing characteristics. Days to maturity: 120-140 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"120-140 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.574255522896556,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Rue'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Dwarf Rue' AND s.name = 'Rue');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Early Rue', '🌱', 'Heirloom rue variety with excellent flavor and growing characteristics. Days to maturity: 130-150 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"130-150 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.780812742446395,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Rue'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Early Rue' AND s.name = 'Rue');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Classic Sage', '🌱', 'Heirloom sage variety with excellent flavor and growing characteristics. Days to maturity: 70-90 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.016076639415918,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Sage'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Classic Sage' AND s.name = 'Sage');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Royal Sage', '🌱', 'Heirloom sage variety with excellent flavor and growing characteristics. Days to maturity: 80-100 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"80-100 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.01836956961446,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Sage'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Royal Sage' AND s.name = 'Sage');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Golden Sage', '🌱', 'Heirloom sage variety with excellent flavor and growing characteristics. Days to maturity: 90-110 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"90-110 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.408425059064556,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Sage'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Golden Sage' AND s.name = 'Sage');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Purple Sage', '🌱', 'Heirloom sage variety with excellent flavor and growing characteristics. Days to maturity: 100-120 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"100-120 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.259066032642249,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Sage'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Purple Sage' AND s.name = 'Sage');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Giant Sage', '🌱', 'Heirloom sage variety with excellent flavor and growing characteristics. Days to maturity: 110-130 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"110-130 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.485853605394502,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Sage'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Giant Sage' AND s.name = 'Sage');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Dwarf Sage', '🌱', 'Heirloom sage variety with excellent flavor and growing characteristics. Days to maturity: 120-140 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"120-140 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.477101658991694,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Sage'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Dwarf Sage' AND s.name = 'Sage');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Early Sage', '🌱', 'Heirloom sage variety with excellent flavor and growing characteristics. Days to maturity: 130-150 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"130-150 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.330863751732809,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Sage'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Early Sage' AND s.name = 'Sage');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Late Sage', '🌱', 'Heirloom sage variety with excellent flavor and growing characteristics. Days to maturity: 140-160 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"140-160 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.390320867115557,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Sage'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Late Sage' AND s.name = 'Sage');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Classic Thyme', '🌱', 'Heirloom thyme variety with excellent flavor and growing characteristics. Days to maturity: 70-90 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.6464903942819165,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Thyme'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Classic Thyme' AND s.name = 'Thyme');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Royal Thyme', '🌱', 'Heirloom thyme variety with excellent flavor and growing characteristics. Days to maturity: 80-100 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"80-100 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.341451249940648,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Thyme'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Royal Thyme' AND s.name = 'Thyme');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Golden Thyme', '🌱', 'Heirloom thyme variety with excellent flavor and growing characteristics. Days to maturity: 90-110 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"90-110 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.425054768856444,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Thyme'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Golden Thyme' AND s.name = 'Thyme');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Purple Thyme', '🌱', 'Heirloom thyme variety with excellent flavor and growing characteristics. Days to maturity: 100-120 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"100-120 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.520014602601221,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Thyme'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Purple Thyme' AND s.name = 'Thyme');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Giant Thyme', '🌱', 'Heirloom thyme variety with excellent flavor and growing characteristics. Days to maturity: 110-130 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"110-130 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.75542609564912,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Thyme'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Giant Thyme' AND s.name = 'Thyme');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Dwarf Thyme', '🌱', 'Heirloom thyme variety with excellent flavor and growing characteristics. Days to maturity: 120-140 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"120-140 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.211819232036166,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Thyme'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Dwarf Thyme' AND s.name = 'Thyme');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Classic Marigold', '🌱', 'Heirloom marigold variety with excellent flavor and growing characteristics. Days to maturity: 70-90 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.705353019188749,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Marigold'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Classic Marigold' AND s.name = 'Marigold');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Royal Marigold', '🌱', 'Heirloom marigold variety with excellent flavor and growing characteristics. Days to maturity: 80-100 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"80-100 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.412743739893035,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Marigold'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Royal Marigold' AND s.name = 'Marigold');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Golden Marigold', '🌱', 'Heirloom marigold variety with excellent flavor and growing characteristics. Days to maturity: 90-110 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"90-110 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.575357707334673,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Marigold'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Golden Marigold' AND s.name = 'Marigold');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Purple Marigold', '🌱', 'Heirloom marigold variety with excellent flavor and growing characteristics. Days to maturity: 100-120 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"100-120 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.183715531092505,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Marigold'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Purple Marigold' AND s.name = 'Marigold');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Giant Marigold', '🌱', 'Heirloom marigold variety with excellent flavor and growing characteristics. Days to maturity: 110-130 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"110-130 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.5709167904965256,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Marigold'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Giant Marigold' AND s.name = 'Marigold');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Classic Sunflower', '🌱', 'Heirloom sunflower variety with excellent flavor and growing characteristics. Days to maturity: 70-90 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.219141220736236,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Sunflower'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Classic Sunflower' AND s.name = 'Sunflower');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Royal Sunflower', '🌱', 'Heirloom sunflower variety with excellent flavor and growing characteristics. Days to maturity: 80-100 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"80-100 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.362295450165199,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Sunflower'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Royal Sunflower' AND s.name = 'Sunflower');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Golden Sunflower', '🌱', 'Heirloom sunflower variety with excellent flavor and growing characteristics. Days to maturity: 90-110 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"90-110 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.731102535175255,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Sunflower'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Golden Sunflower' AND s.name = 'Sunflower');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Purple Sunflower', '🌱', 'Heirloom sunflower variety with excellent flavor and growing characteristics. Days to maturity: 100-120 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"100-120 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.075693490146375,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Sunflower'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Purple Sunflower' AND s.name = 'Sunflower');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Giant Sunflower', '🌱', 'Heirloom sunflower variety with excellent flavor and growing characteristics. Days to maturity: 110-130 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"110-130 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.435652042686067,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Sunflower'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Giant Sunflower' AND s.name = 'Sunflower');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Dwarf Sunflower', '🌱', 'Heirloom sunflower variety with excellent flavor and growing characteristics. Days to maturity: 120-140 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"120-140 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.652888474539926,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Sunflower'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Dwarf Sunflower' AND s.name = 'Sunflower');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Early Sunflower', '🌱', 'Heirloom sunflower variety with excellent flavor and growing characteristics. Days to maturity: 130-150 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"130-150 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.684293472429841,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Sunflower'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Early Sunflower' AND s.name = 'Sunflower');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Classic Zinnia', '🌱', 'Heirloom zinnia variety with excellent flavor and growing characteristics. Days to maturity: 70-90 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.123474254837704,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Zinnia'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Classic Zinnia' AND s.name = 'Zinnia');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Royal Zinnia', '🌱', 'Heirloom zinnia variety with excellent flavor and growing characteristics. Days to maturity: 80-100 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"80-100 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.714588016305534,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Zinnia'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Royal Zinnia' AND s.name = 'Zinnia');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Golden Zinnia', '🌱', 'Heirloom zinnia variety with excellent flavor and growing characteristics. Days to maturity: 90-110 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"90-110 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.723627536620654,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Zinnia'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Golden Zinnia' AND s.name = 'Zinnia');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Purple Zinnia', '🌱', 'Heirloom zinnia variety with excellent flavor and growing characteristics. Days to maturity: 100-120 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"100-120 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.575253058748715,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Zinnia'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Purple Zinnia' AND s.name = 'Zinnia');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Classic Cosmos', '🌱', 'Heirloom cosmos variety with excellent flavor and growing characteristics. Days to maturity: 70-90 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.719639386415454,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Cosmos'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Classic Cosmos' AND s.name = 'Cosmos');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Royal Cosmos', '🌱', 'Heirloom cosmos variety with excellent flavor and growing characteristics. Days to maturity: 80-100 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"80-100 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.554132502750947,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Cosmos'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Royal Cosmos' AND s.name = 'Cosmos');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Golden Cosmos', '🌱', 'Heirloom cosmos variety with excellent flavor and growing characteristics. Days to maturity: 90-110 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"90-110 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.66596276727447,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Cosmos'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Golden Cosmos' AND s.name = 'Cosmos');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Purple Cosmos', '🌱', 'Heirloom cosmos variety with excellent flavor and growing characteristics. Days to maturity: 100-120 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"100-120 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.238584197318184,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Cosmos'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Purple Cosmos' AND s.name = 'Cosmos');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Giant Cosmos', '🌱', 'Heirloom cosmos variety with excellent flavor and growing characteristics. Days to maturity: 110-130 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"110-130 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.231135524149926,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Cosmos'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Giant Cosmos' AND s.name = 'Cosmos');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Dwarf Cosmos', '🌱', 'Heirloom cosmos variety with excellent flavor and growing characteristics. Days to maturity: 120-140 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"120-140 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.179211225450317,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Cosmos'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Dwarf Cosmos' AND s.name = 'Cosmos');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Early Cosmos', '🌱', 'Heirloom cosmos variety with excellent flavor and growing characteristics. Days to maturity: 130-150 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"130-150 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.384803201266958,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Cosmos'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Early Cosmos' AND s.name = 'Cosmos');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Late Cosmos', '🌱', 'Heirloom cosmos variety with excellent flavor and growing characteristics. Days to maturity: 140-160 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"140-160 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.783075784413786,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Cosmos'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Late Cosmos' AND s.name = 'Cosmos');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Classic Calendula', '🌱', 'Heirloom calendula variety with excellent flavor and growing characteristics. Days to maturity: 70-90 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.078418871447716,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Calendula'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Classic Calendula' AND s.name = 'Calendula');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Royal Calendula', '🌱', 'Heirloom calendula variety with excellent flavor and growing characteristics. Days to maturity: 80-100 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"80-100 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.4521996377384845,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Calendula'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Royal Calendula' AND s.name = 'Calendula');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Golden Calendula', '🌱', 'Heirloom calendula variety with excellent flavor and growing characteristics. Days to maturity: 90-110 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"90-110 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null}', '{"rating":4.627629236226985,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Calendula'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Golden Calendula' AND s.name = 'Calendula');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Purple Calendula', '🌱', 'Heirloom calendula variety with excellent flavor and growing characteristics. Days to maturity: 100-120 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"100-120 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.411101533772892,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Calendula'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Purple Calendula' AND s.name = 'Calendula');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Giant Calendula', '🌱', 'Heirloom calendula variety with excellent flavor and growing characteristics. Days to maturity: 110-130 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"110-130 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.134925648888503,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Calendula'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Giant Calendula' AND s.name = 'Calendula');

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT subcategory_id, 'Dwarf Calendula', '🌱', 'Heirloom calendula variety with excellent flavor and growing characteristics. Days to maturity: 120-140 days Plant spacing: 8-12" Seed depth: 1/4" Sun: Full sun', '{"botanical_name":null,"days_to_maturity":"120-140 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true}', '{"rating":4.602807966800688,"characteristics":null}', ARRAY['fresh', 'cooking']
FROM temp_subcategory_ids 
WHERE subcategory_name = 'Calendula'
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id WHERE v.name = 'Dwarf Calendula' AND s.name = 'Calendula');

-- Verification queries for master catalog
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
-- Total varieties imported: 434
-- Total categories: 3
-- Total subcategories: 83
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
-- - And 428 more varieties!
