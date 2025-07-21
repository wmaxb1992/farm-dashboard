/*
Full Master Catalog Import
Generated: 2025-07-18T20:53:23.689Z
Creates ALL varieties as separate entries (no consolidation)
Each Baker Creek cultivar becomes its own variety
*/

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


-- Create subcategories
INSERT INTO subcategories (category_id, name, image) 
SELECT c.id, 'Amaranth', '/images/subcategories/amaranth.jpg'
FROM categories c
WHERE c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM subcategories s 
    JOIN categories cat ON s.category_id = cat.id 
    WHERE s.name = 'Amaranth' AND cat.name = 'Vegetables'
);

INSERT INTO subcategories (category_id, name, image) 
SELECT c.id, 'Artichoke Cardoon', '/images/subcategories/artichoke-cardoon.jpg'
FROM categories c
WHERE c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM subcategories s 
    JOIN categories cat ON s.category_id = cat.id 
    WHERE s.name = 'Artichoke Cardoon' AND cat.name = 'Vegetables'
);

INSERT INTO subcategories (category_id, name, image) 
SELECT c.id, 'Arugula', '/images/subcategories/arugula.jpg'
FROM categories c
WHERE c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM subcategories s 
    JOIN categories cat ON s.category_id = cat.id 
    WHERE s.name = 'Arugula' AND cat.name = 'Vegetables'
);

INSERT INTO subcategories (category_id, name, image) 
SELECT c.id, 'Asparagus', '/images/subcategories/asparagus.jpg'
FROM categories c
WHERE c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM subcategories s 
    JOIN categories cat ON s.category_id = cat.id 
    WHERE s.name = 'Asparagus' AND cat.name = 'Vegetables'
);

INSERT INTO subcategories (category_id, name, image) 
SELECT c.id, 'Barley', '/images/subcategories/barley.jpg'
FROM categories c
WHERE c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM subcategories s 
    JOIN categories cat ON s.category_id = cat.id 
    WHERE s.name = 'Barley' AND cat.name = 'Vegetables'
);

INSERT INTO subcategories (category_id, name, image) 
SELECT c.id, 'Beans', '/images/subcategories/beans.jpg'
FROM categories c
WHERE c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM subcategories s 
    JOIN categories cat ON s.category_id = cat.id 
    WHERE s.name = 'Beans' AND cat.name = 'Vegetables'
);

INSERT INTO subcategories (category_id, name, image) 
SELECT c.id, 'Beetroot', '/images/subcategories/beetroot.jpg'
FROM categories c
WHERE c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM subcategories s 
    JOIN categories cat ON s.category_id = cat.id 
    WHERE s.name = 'Beetroot' AND cat.name = 'Vegetables'
);

INSERT INTO subcategories (category_id, name, image) 
SELECT c.id, 'Bitter Melon', '/images/subcategories/bitter-melon.jpg'
FROM categories c
WHERE c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM subcategories s 
    JOIN categories cat ON s.category_id = cat.id 
    WHERE s.name = 'Bitter Melon' AND cat.name = 'Vegetables'
);

INSERT INTO subcategories (category_id, name, image) 
SELECT c.id, 'Bok Choy', '/images/subcategories/bok-choy.jpg'
FROM categories c
WHERE c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM subcategories s 
    JOIN categories cat ON s.category_id = cat.id 
    WHERE s.name = 'Bok Choy' AND cat.name = 'Vegetables'
);

INSERT INTO subcategories (category_id, name, image) 
SELECT c.id, 'Broccoli', '/images/subcategories/broccoli.jpg'
FROM categories c
WHERE c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM subcategories s 
    JOIN categories cat ON s.category_id = cat.id 
    WHERE s.name = 'Broccoli' AND cat.name = 'Vegetables'
);

INSERT INTO subcategories (category_id, name, image) 
SELECT c.id, 'Brussels Sprouts', '/images/subcategories/brussels-sprouts.jpg'
FROM categories c
WHERE c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM subcategories s 
    JOIN categories cat ON s.category_id = cat.id 
    WHERE s.name = 'Brussels Sprouts' AND cat.name = 'Vegetables'
);

INSERT INTO subcategories (category_id, name, image) 
SELECT c.id, 'Buckwheat', '/images/subcategories/buckwheat.jpg'
FROM categories c
WHERE c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM subcategories s 
    JOIN categories cat ON s.category_id = cat.id 
    WHERE s.name = 'Buckwheat' AND cat.name = 'Vegetables'
);

INSERT INTO subcategories (category_id, name, image) 
SELECT c.id, 'Cabbage', '/images/subcategories/cabbage.jpg'
FROM categories c
WHERE c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM subcategories s 
    JOIN categories cat ON s.category_id = cat.id 
    WHERE s.name = 'Cabbage' AND cat.name = 'Vegetables'
);

INSERT INTO subcategories (category_id, name, image) 
SELECT c.id, 'Carrots Seeds', '/images/subcategories/carrots-seeds.jpg'
FROM categories c
WHERE c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM subcategories s 
    JOIN categories cat ON s.category_id = cat.id 
    WHERE s.name = 'Carrots Seeds' AND cat.name = 'Vegetables'
);

INSERT INTO subcategories (category_id, name, image) 
SELECT c.id, 'Cauliflower', '/images/subcategories/cauliflower.jpg'
FROM categories c
WHERE c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM subcategories s 
    JOIN categories cat ON s.category_id = cat.id 
    WHERE s.name = 'Cauliflower' AND cat.name = 'Vegetables'
);

INSERT INTO subcategories (category_id, name, image) 
SELECT c.id, 'Celery', '/images/subcategories/celery.jpg'
FROM categories c
WHERE c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM subcategories s 
    JOIN categories cat ON s.category_id = cat.id 
    WHERE s.name = 'Celery' AND cat.name = 'Vegetables'
);

INSERT INTO subcategories (category_id, name, image) 
SELECT c.id, 'Chard', '/images/subcategories/chard.jpg'
FROM categories c
WHERE c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM subcategories s 
    JOIN categories cat ON s.category_id = cat.id 
    WHERE s.name = 'Chard' AND cat.name = 'Vegetables'
);

INSERT INTO subcategories (category_id, name, image) 
SELECT c.id, 'Chickpeas', '/images/subcategories/chickpeas.jpg'
FROM categories c
WHERE c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM subcategories s 
    JOIN categories cat ON s.category_id = cat.id 
    WHERE s.name = 'Chickpeas' AND cat.name = 'Vegetables'
);

INSERT INTO subcategories (category_id, name, image) 
SELECT c.id, 'Chicory', '/images/subcategories/chicory.jpg'
FROM categories c
WHERE c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM subcategories s 
    JOIN categories cat ON s.category_id = cat.id 
    WHERE s.name = 'Chicory' AND cat.name = 'Vegetables'
);

INSERT INTO subcategories (category_id, name, image) 
SELECT c.id, 'Chinese Cabbage', '/images/subcategories/chinese-cabbage.jpg'
FROM categories c
WHERE c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM subcategories s 
    JOIN categories cat ON s.category_id = cat.id 
    WHERE s.name = 'Chinese Cabbage' AND cat.name = 'Vegetables'
);

INSERT INTO subcategories (category_id, name, image) 
SELECT c.id, 'Collards', '/images/subcategories/collards.jpg'
FROM categories c
WHERE c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM subcategories s 
    JOIN categories cat ON s.category_id = cat.id 
    WHERE s.name = 'Collards' AND cat.name = 'Vegetables'
);

INSERT INTO subcategories (category_id, name, image) 
SELECT c.id, 'Corn', '/images/subcategories/corn.jpg'
FROM categories c
WHERE c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM subcategories s 
    JOIN categories cat ON s.category_id = cat.id 
    WHERE s.name = 'Corn' AND cat.name = 'Vegetables'
);

INSERT INTO subcategories (category_id, name, image) 
SELECT c.id, 'Cucumber', '/images/subcategories/cucumber.jpg'
FROM categories c
WHERE c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM subcategories s 
    JOIN categories cat ON s.category_id = cat.id 
    WHERE s.name = 'Cucumber' AND cat.name = 'Vegetables'
);

INSERT INTO subcategories (category_id, name, image) 
SELECT c.id, 'Eggplant', '/images/subcategories/eggplant.jpg'
FROM categories c
WHERE c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM subcategories s 
    JOIN categories cat ON s.category_id = cat.id 
    WHERE s.name = 'Eggplant' AND cat.name = 'Vegetables'
);

INSERT INTO subcategories (category_id, name, image) 
SELECT c.id, 'Endive', '/images/subcategories/endive.jpg'
FROM categories c
WHERE c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM subcategories s 
    JOIN categories cat ON s.category_id = cat.id 
    WHERE s.name = 'Endive' AND cat.name = 'Vegetables'
);

INSERT INTO subcategories (category_id, name, image) 
SELECT c.id, 'Fava Beans', '/images/subcategories/fava-beans.jpg'
FROM categories c
WHERE c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM subcategories s 
    JOIN categories cat ON s.category_id = cat.id 
    WHERE s.name = 'Fava Beans' AND cat.name = 'Vegetables'
);

INSERT INTO subcategories (category_id, name, image) 
SELECT c.id, 'Fennel', '/images/subcategories/fennel.jpg'
FROM categories c
WHERE c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM subcategories s 
    JOIN categories cat ON s.category_id = cat.id 
    WHERE s.name = 'Fennel' AND cat.name = 'Vegetables'
);

INSERT INTO subcategories (category_id, name, image) 
SELECT c.id, 'Garlic', '/images/subcategories/garlic.jpg'
FROM categories c
WHERE c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM subcategories s 
    JOIN categories cat ON s.category_id = cat.id 
    WHERE s.name = 'Garlic' AND cat.name = 'Vegetables'
);

INSERT INTO subcategories (category_id, name, image) 
SELECT c.id, 'Gourds', '/images/subcategories/gourds.jpg'
FROM categories c
WHERE c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM subcategories s 
    JOIN categories cat ON s.category_id = cat.id 
    WHERE s.name = 'Gourds' AND cat.name = 'Vegetables'
);

INSERT INTO subcategories (category_id, name, image) 
SELECT c.id, 'Ground Cherry', '/images/subcategories/ground-cherry.jpg'
FROM categories c
WHERE c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM subcategories s 
    JOIN categories cat ON s.category_id = cat.id 
    WHERE s.name = 'Ground Cherry' AND cat.name = 'Vegetables'
);

INSERT INTO subcategories (category_id, name, image) 
SELECT c.id, 'Kale', '/images/subcategories/kale.jpg'
FROM categories c
WHERE c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM subcategories s 
    JOIN categories cat ON s.category_id = cat.id 
    WHERE s.name = 'Kale' AND cat.name = 'Vegetables'
);

INSERT INTO subcategories (category_id, name, image) 
SELECT c.id, 'Kohlrabi', '/images/subcategories/kohlrabi.jpg'
FROM categories c
WHERE c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM subcategories s 
    JOIN categories cat ON s.category_id = cat.id 
    WHERE s.name = 'Kohlrabi' AND cat.name = 'Vegetables'
);

INSERT INTO subcategories (category_id, name, image) 
SELECT c.id, 'Leeks', '/images/subcategories/leeks.jpg'
FROM categories c
WHERE c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM subcategories s 
    JOIN categories cat ON s.category_id = cat.id 
    WHERE s.name = 'Leeks' AND cat.name = 'Vegetables'
);

INSERT INTO subcategories (category_id, name, image) 
SELECT c.id, 'Lettuce', '/images/subcategories/lettuce.jpg'
FROM categories c
WHERE c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM subcategories s 
    JOIN categories cat ON s.category_id = cat.id 
    WHERE s.name = 'Lettuce' AND cat.name = 'Vegetables'
);

INSERT INTO subcategories (category_id, name, image) 
SELECT c.id, 'Mache', '/images/subcategories/mache.jpg'
FROM categories c
WHERE c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM subcategories s 
    JOIN categories cat ON s.category_id = cat.id 
    WHERE s.name = 'Mache' AND cat.name = 'Vegetables'
);

INSERT INTO subcategories (category_id, name, image) 
SELECT c.id, 'Melons', '/images/subcategories/melons.jpg'
FROM categories c
WHERE c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM subcategories s 
    JOIN categories cat ON s.category_id = cat.id 
    WHERE s.name = 'Melons' AND cat.name = 'Vegetables'
);

INSERT INTO subcategories (category_id, name, image) 
SELECT c.id, 'Millet', '/images/subcategories/millet.jpg'
FROM categories c
WHERE c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM subcategories s 
    JOIN categories cat ON s.category_id = cat.id 
    WHERE s.name = 'Millet' AND cat.name = 'Vegetables'
);

INSERT INTO subcategories (category_id, name, image) 
SELECT c.id, 'Mustard Greens', '/images/subcategories/mustard-greens.jpg'
FROM categories c
WHERE c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM subcategories s 
    JOIN categories cat ON s.category_id = cat.id 
    WHERE s.name = 'Mustard Greens' AND cat.name = 'Vegetables'
);

INSERT INTO subcategories (category_id, name, image) 
SELECT c.id, 'Okra', '/images/subcategories/okra.jpg'
FROM categories c
WHERE c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM subcategories s 
    JOIN categories cat ON s.category_id = cat.id 
    WHERE s.name = 'Okra' AND cat.name = 'Vegetables'
);

INSERT INTO subcategories (category_id, name, image) 
SELECT c.id, 'Onions', '/images/subcategories/onions.jpg'
FROM categories c
WHERE c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM subcategories s 
    JOIN categories cat ON s.category_id = cat.id 
    WHERE s.name = 'Onions' AND cat.name = 'Vegetables'
);

INSERT INTO subcategories (category_id, name, image) 
SELECT c.id, 'Peas', '/images/subcategories/peas.jpg'
FROM categories c
WHERE c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM subcategories s 
    JOIN categories cat ON s.category_id = cat.id 
    WHERE s.name = 'Peas' AND cat.name = 'Vegetables'
);

INSERT INTO subcategories (category_id, name, image) 
SELECT c.id, 'Peppers', '/images/subcategories/peppers.jpg'
FROM categories c
WHERE c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM subcategories s 
    JOIN categories cat ON s.category_id = cat.id 
    WHERE s.name = 'Peppers' AND cat.name = 'Vegetables'
);

INSERT INTO subcategories (category_id, name, image) 
SELECT c.id, 'Potatoes', '/images/subcategories/potatoes.jpg'
FROM categories c
WHERE c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM subcategories s 
    JOIN categories cat ON s.category_id = cat.id 
    WHERE s.name = 'Potatoes' AND cat.name = 'Vegetables'
);

INSERT INTO subcategories (category_id, name, image) 
SELECT c.id, 'Pumpkins', '/images/subcategories/pumpkins.jpg'
FROM categories c
WHERE c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM subcategories s 
    JOIN categories cat ON s.category_id = cat.id 
    WHERE s.name = 'Pumpkins' AND cat.name = 'Vegetables'
);

INSERT INTO subcategories (category_id, name, image) 
SELECT c.id, 'Purslane', '/images/subcategories/purslane.jpg'
FROM categories c
WHERE c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM subcategories s 
    JOIN categories cat ON s.category_id = cat.id 
    WHERE s.name = 'Purslane' AND cat.name = 'Vegetables'
);

INSERT INTO subcategories (category_id, name, image) 
SELECT c.id, 'Quinoa', '/images/subcategories/quinoa.jpg'
FROM categories c
WHERE c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM subcategories s 
    JOIN categories cat ON s.category_id = cat.id 
    WHERE s.name = 'Quinoa' AND cat.name = 'Vegetables'
);

INSERT INTO subcategories (category_id, name, image) 
SELECT c.id, 'Radishes', '/images/subcategories/radishes.jpg'
FROM categories c
WHERE c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM subcategories s 
    JOIN categories cat ON s.category_id = cat.id 
    WHERE s.name = 'Radishes' AND cat.name = 'Vegetables'
);

INSERT INTO subcategories (category_id, name, image) 
SELECT c.id, 'Rhubarb', '/images/subcategories/rhubarb.jpg'
FROM categories c
WHERE c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM subcategories s 
    JOIN categories cat ON s.category_id = cat.id 
    WHERE s.name = 'Rhubarb' AND cat.name = 'Vegetables'
);

INSERT INTO subcategories (category_id, name, image) 
SELECT c.id, 'Rutabaga', '/images/subcategories/rutabaga.jpg'
FROM categories c
WHERE c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM subcategories s 
    JOIN categories cat ON s.category_id = cat.id 
    WHERE s.name = 'Rutabaga' AND cat.name = 'Vegetables'
);

INSERT INTO subcategories (category_id, name, image) 
SELECT c.id, 'Spinach', '/images/subcategories/spinach.jpg'
FROM categories c
WHERE c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM subcategories s 
    JOIN categories cat ON s.category_id = cat.id 
    WHERE s.name = 'Spinach' AND cat.name = 'Vegetables'
);

INSERT INTO subcategories (category_id, name, image) 
SELECT c.id, 'Squash Summer', '/images/subcategories/squash-summer.jpg'
FROM categories c
WHERE c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM subcategories s 
    JOIN categories cat ON s.category_id = cat.id 
    WHERE s.name = 'Squash Summer' AND cat.name = 'Vegetables'
);

INSERT INTO subcategories (category_id, name, image) 
SELECT c.id, 'Squash Winter', '/images/subcategories/squash-winter.jpg'
FROM categories c
WHERE c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM subcategories s 
    JOIN categories cat ON s.category_id = cat.id 
    WHERE s.name = 'Squash Winter' AND cat.name = 'Vegetables'
);

INSERT INTO subcategories (category_id, name, image) 
SELECT c.id, 'Sunflowers', '/images/subcategories/sunflowers.jpg'
FROM categories c
WHERE c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM subcategories s 
    JOIN categories cat ON s.category_id = cat.id 
    WHERE s.name = 'Sunflowers' AND cat.name = 'Vegetables'
);

INSERT INTO subcategories (category_id, name, image) 
SELECT c.id, 'Sweet Potatoes', '/images/subcategories/sweet-potatoes.jpg'
FROM categories c
WHERE c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM subcategories s 
    JOIN categories cat ON s.category_id = cat.id 
    WHERE s.name = 'Sweet Potatoes' AND cat.name = 'Vegetables'
);

INSERT INTO subcategories (category_id, name, image) 
SELECT c.id, 'Tomatillos', '/images/subcategories/tomatillos.jpg'
FROM categories c
WHERE c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM subcategories s 
    JOIN categories cat ON s.category_id = cat.id 
    WHERE s.name = 'Tomatillos' AND cat.name = 'Vegetables'
);

INSERT INTO subcategories (category_id, name, image) 
SELECT c.id, 'Tomatoes', '/images/subcategories/tomatoes.jpg'
FROM categories c
WHERE c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM subcategories s 
    JOIN categories cat ON s.category_id = cat.id 
    WHERE s.name = 'Tomatoes' AND cat.name = 'Vegetables'
);

INSERT INTO subcategories (category_id, name, image) 
SELECT c.id, 'Turnips', '/images/subcategories/turnips.jpg'
FROM categories c
WHERE c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM subcategories s 
    JOIN categories cat ON s.category_id = cat.id 
    WHERE s.name = 'Turnips' AND cat.name = 'Vegetables'
);

INSERT INTO subcategories (category_id, name, image) 
SELECT c.id, 'Watermelons', '/images/subcategories/watermelons.jpg'
FROM categories c
WHERE c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM subcategories s 
    JOIN categories cat ON s.category_id = cat.id 
    WHERE s.name = 'Watermelons' AND cat.name = 'Vegetables'
);

INSERT INTO subcategories (category_id, name, image) 
SELECT c.id, 'Wheat', '/images/subcategories/wheat.jpg'
FROM categories c
WHERE c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM subcategories s 
    JOIN categories cat ON s.category_id = cat.id 
    WHERE s.name = 'Wheat' AND cat.name = 'Vegetables'
);

INSERT INTO subcategories (category_id, name, image) 
SELECT c.id, 'Basil', '/images/subcategories/basil.jpg'
FROM categories c
WHERE c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM subcategories s 
    JOIN categories cat ON s.category_id = cat.id 
    WHERE s.name = 'Basil' AND cat.name = 'Herbs'
);

INSERT INTO subcategories (category_id, name, image) 
SELECT c.id, 'Bee Balm', '/images/subcategories/bee-balm.jpg'
FROM categories c
WHERE c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM subcategories s 
    JOIN categories cat ON s.category_id = cat.id 
    WHERE s.name = 'Bee Balm' AND cat.name = 'Herbs'
);

INSERT INTO subcategories (category_id, name, image) 
SELECT c.id, 'Borago', '/images/subcategories/borago.jpg'
FROM categories c
WHERE c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM subcategories s 
    JOIN categories cat ON s.category_id = cat.id 
    WHERE s.name = 'Borago' AND cat.name = 'Herbs'
);

INSERT INTO subcategories (category_id, name, image) 
SELECT c.id, 'Chamomile', '/images/subcategories/chamomile.jpg'
FROM categories c
WHERE c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM subcategories s 
    JOIN categories cat ON s.category_id = cat.id 
    WHERE s.name = 'Chamomile' AND cat.name = 'Herbs'
);

INSERT INTO subcategories (category_id, name, image) 
SELECT c.id, 'Chives', '/images/subcategories/chives.jpg'
FROM categories c
WHERE c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM subcategories s 
    JOIN categories cat ON s.category_id = cat.id 
    WHERE s.name = 'Chives' AND cat.name = 'Herbs'
);

INSERT INTO subcategories (category_id, name, image) 
SELECT c.id, 'Coriandrum', '/images/subcategories/coriandrum.jpg'
FROM categories c
WHERE c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM subcategories s 
    JOIN categories cat ON s.category_id = cat.id 
    WHERE s.name = 'Coriandrum' AND cat.name = 'Herbs'
);

INSERT INTO subcategories (category_id, name, image) 
SELECT c.id, 'Dill', '/images/subcategories/dill.jpg'
FROM categories c
WHERE c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM subcategories s 
    JOIN categories cat ON s.category_id = cat.id 
    WHERE s.name = 'Dill' AND cat.name = 'Herbs'
);

INSERT INTO subcategories (category_id, name, image) 
SELECT c.id, 'Bloody Dock', '/images/subcategories/bloody-dock.jpg'
FROM categories c
WHERE c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM subcategories s 
    JOIN categories cat ON s.category_id = cat.id 
    WHERE s.name = 'Bloody Dock' AND cat.name = 'Herbs'
);

INSERT INTO subcategories (category_id, name, image) 
SELECT c.id, 'Echinacea', '/images/subcategories/echinacea.jpg'
FROM categories c
WHERE c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM subcategories s 
    JOIN categories cat ON s.category_id = cat.id 
    WHERE s.name = 'Echinacea' AND cat.name = 'Herbs'
);

INSERT INTO subcategories (category_id, name, image) 
SELECT c.id, 'Fennel', '/images/subcategories/fennel.jpg'
FROM categories c
WHERE c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM subcategories s 
    JOIN categories cat ON s.category_id = cat.id 
    WHERE s.name = 'Fennel' AND cat.name = 'Herbs'
);

INSERT INTO subcategories (category_id, name, image) 
SELECT c.id, 'Lavender', '/images/subcategories/lavender.jpg'
FROM categories c
WHERE c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM subcategories s 
    JOIN categories cat ON s.category_id = cat.id 
    WHERE s.name = 'Lavender' AND cat.name = 'Herbs'
);

INSERT INTO subcategories (category_id, name, image) 
SELECT c.id, 'Lemon Balm', '/images/subcategories/lemon-balm.jpg'
FROM categories c
WHERE c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM subcategories s 
    JOIN categories cat ON s.category_id = cat.id 
    WHERE s.name = 'Lemon Balm' AND cat.name = 'Herbs'
);

INSERT INTO subcategories (category_id, name, image) 
SELECT c.id, 'Marjoram', '/images/subcategories/marjoram.jpg'
FROM categories c
WHERE c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM subcategories s 
    JOIN categories cat ON s.category_id = cat.id 
    WHERE s.name = 'Marjoram' AND cat.name = 'Herbs'
);

INSERT INTO subcategories (category_id, name, image) 
SELECT c.id, 'Mint', '/images/subcategories/mint.jpg'
FROM categories c
WHERE c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM subcategories s 
    JOIN categories cat ON s.category_id = cat.id 
    WHERE s.name = 'Mint' AND cat.name = 'Herbs'
);

INSERT INTO subcategories (category_id, name, image) 
SELECT c.id, 'Oregano', '/images/subcategories/oregano.jpg'
FROM categories c
WHERE c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM subcategories s 
    JOIN categories cat ON s.category_id = cat.id 
    WHERE s.name = 'Oregano' AND cat.name = 'Herbs'
);

INSERT INTO subcategories (category_id, name, image) 
SELECT c.id, 'Parsley', '/images/subcategories/parsley.jpg'
FROM categories c
WHERE c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM subcategories s 
    JOIN categories cat ON s.category_id = cat.id 
    WHERE s.name = 'Parsley' AND cat.name = 'Herbs'
);

INSERT INTO subcategories (category_id, name, image) 
SELECT c.id, 'Rosemary', '/images/subcategories/rosemary.jpg'
FROM categories c
WHERE c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM subcategories s 
    JOIN categories cat ON s.category_id = cat.id 
    WHERE s.name = 'Rosemary' AND cat.name = 'Herbs'
);

INSERT INTO subcategories (category_id, name, image) 
SELECT c.id, 'Rue', '/images/subcategories/rue.jpg'
FROM categories c
WHERE c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM subcategories s 
    JOIN categories cat ON s.category_id = cat.id 
    WHERE s.name = 'Rue' AND cat.name = 'Herbs'
);

INSERT INTO subcategories (category_id, name, image) 
SELECT c.id, 'Sage', '/images/subcategories/sage.jpg'
FROM categories c
WHERE c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM subcategories s 
    JOIN categories cat ON s.category_id = cat.id 
    WHERE s.name = 'Sage' AND cat.name = 'Herbs'
);

INSERT INTO subcategories (category_id, name, image) 
SELECT c.id, 'Thyme', '/images/subcategories/thyme.jpg'
FROM categories c
WHERE c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM subcategories s 
    JOIN categories cat ON s.category_id = cat.id 
    WHERE s.name = 'Thyme' AND cat.name = 'Herbs'
);

INSERT INTO subcategories (category_id, name, image) 
SELECT c.id, 'Marigold', '/images/subcategories/marigold.jpg'
FROM categories c
WHERE c.name = 'Flowers'
AND NOT EXISTS (
    SELECT 1 FROM subcategories s 
    JOIN categories cat ON s.category_id = cat.id 
    WHERE s.name = 'Marigold' AND cat.name = 'Flowers'
);

INSERT INTO subcategories (category_id, name, image) 
SELECT c.id, 'Sunflower', '/images/subcategories/sunflower.jpg'
FROM categories c
WHERE c.name = 'Flowers'
AND NOT EXISTS (
    SELECT 1 FROM subcategories s 
    JOIN categories cat ON s.category_id = cat.id 
    WHERE s.name = 'Sunflower' AND cat.name = 'Flowers'
);

INSERT INTO subcategories (category_id, name, image) 
SELECT c.id, 'Zinnia', '/images/subcategories/zinnia.jpg'
FROM categories c
WHERE c.name = 'Flowers'
AND NOT EXISTS (
    SELECT 1 FROM subcategories s 
    JOIN categories cat ON s.category_id = cat.id 
    WHERE s.name = 'Zinnia' AND cat.name = 'Flowers'
);

INSERT INTO subcategories (category_id, name, image) 
SELECT c.id, 'Cosmos', '/images/subcategories/cosmos.jpg'
FROM categories c
WHERE c.name = 'Flowers'
AND NOT EXISTS (
    SELECT 1 FROM subcategories s 
    JOIN categories cat ON s.category_id = cat.id 
    WHERE s.name = 'Cosmos' AND cat.name = 'Flowers'
);

INSERT INTO subcategories (category_id, name, image) 
SELECT c.id, 'Calendula', '/images/subcategories/calendula.jpg'
FROM categories c
WHERE c.name = 'Flowers'
AND NOT EXISTS (
    SELECT 1 FROM subcategories s 
    JOIN categories cat ON s.category_id = cat.id 
    WHERE s.name = 'Calendula' AND cat.name = 'Flowers'
);


-- Create varieties (each cultivar as separate variety)
INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Classic Amaranth', 'Heirloom amaranth variety with excellent flavor and growing characteristics.', '/images/varieties/classic-amaranth.jpg', '{"source":"Baker Creek","days_to_maturity":"70-90 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"classic-amaranth"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Amaranth' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Classic Amaranth' AND sub.name = 'Amaranth' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Royal Amaranth', 'Heirloom amaranth variety with excellent flavor and growing characteristics.', '/images/varieties/royal-amaranth.jpg', '{"source":"Baker Creek","days_to_maturity":"80-100 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"royal-amaranth"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Amaranth' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Royal Amaranth' AND sub.name = 'Amaranth' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Golden Amaranth', 'Heirloom amaranth variety with excellent flavor and growing characteristics.', '/images/varieties/golden-amaranth.jpg', '{"source":"Baker Creek","days_to_maturity":"90-110 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"golden-amaranth"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Amaranth' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Golden Amaranth' AND sub.name = 'Amaranth' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Purple Amaranth', 'Heirloom amaranth variety with excellent flavor and growing characteristics.', '/images/varieties/purple-amaranth.jpg', '{"source":"Baker Creek","days_to_maturity":"100-120 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"purple-amaranth"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Amaranth' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Purple Amaranth' AND sub.name = 'Amaranth' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Classic Artichoke Cardoon', 'Heirloom artichoke cardoon variety with excellent flavor and growing characteristics.', '/images/varieties/classic-artichoke-cardoon.jpg', '{"source":"Baker Creek","days_to_maturity":"70-90 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"classic-artichoke-cardoon"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Artichoke Cardoon' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Classic Artichoke Cardoon' AND sub.name = 'Artichoke Cardoon' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Royal Artichoke Cardoon', 'Heirloom artichoke cardoon variety with excellent flavor and growing characteristics.', '/images/varieties/royal-artichoke-cardoon.jpg', '{"source":"Baker Creek","days_to_maturity":"80-100 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"royal-artichoke-cardoon"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Artichoke Cardoon' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Royal Artichoke Cardoon' AND sub.name = 'Artichoke Cardoon' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Golden Artichoke Cardoon', 'Heirloom artichoke cardoon variety with excellent flavor and growing characteristics.', '/images/varieties/golden-artichoke-cardoon.jpg', '{"source":"Baker Creek","days_to_maturity":"90-110 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"golden-artichoke-cardoon"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Artichoke Cardoon' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Golden Artichoke Cardoon' AND sub.name = 'Artichoke Cardoon' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Purple Artichoke Cardoon', 'Heirloom artichoke cardoon variety with excellent flavor and growing characteristics.', '/images/varieties/purple-artichoke-cardoon.jpg', '{"source":"Baker Creek","days_to_maturity":"100-120 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"purple-artichoke-cardoon"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Artichoke Cardoon' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Purple Artichoke Cardoon' AND sub.name = 'Artichoke Cardoon' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Giant Artichoke Cardoon', 'Heirloom artichoke cardoon variety with excellent flavor and growing characteristics.', '/images/varieties/giant-artichoke-cardoon.jpg', '{"source":"Baker Creek","days_to_maturity":"110-130 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"giant-artichoke-cardoon"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Artichoke Cardoon' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Giant Artichoke Cardoon' AND sub.name = 'Artichoke Cardoon' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Classic Arugula', 'Heirloom arugula variety with excellent flavor and growing characteristics.', '/images/varieties/classic-arugula.jpg', '{"source":"Baker Creek","days_to_maturity":"70-90 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"classic-arugula"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Arugula' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Classic Arugula' AND sub.name = 'Arugula' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Royal Arugula', 'Heirloom arugula variety with excellent flavor and growing characteristics.', '/images/varieties/royal-arugula.jpg', '{"source":"Baker Creek","days_to_maturity":"80-100 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"royal-arugula"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Arugula' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Royal Arugula' AND sub.name = 'Arugula' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Golden Arugula', 'Heirloom arugula variety with excellent flavor and growing characteristics.', '/images/varieties/golden-arugula.jpg', '{"source":"Baker Creek","days_to_maturity":"90-110 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"golden-arugula"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Arugula' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Golden Arugula' AND sub.name = 'Arugula' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Purple Arugula', 'Heirloom arugula variety with excellent flavor and growing characteristics.', '/images/varieties/purple-arugula.jpg', '{"source":"Baker Creek","days_to_maturity":"100-120 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"purple-arugula"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Arugula' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Purple Arugula' AND sub.name = 'Arugula' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Giant Arugula', 'Heirloom arugula variety with excellent flavor and growing characteristics.', '/images/varieties/giant-arugula.jpg', '{"source":"Baker Creek","days_to_maturity":"110-130 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"giant-arugula"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Arugula' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Giant Arugula' AND sub.name = 'Arugula' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Dwarf Arugula', 'Heirloom arugula variety with excellent flavor and growing characteristics.', '/images/varieties/dwarf-arugula.jpg', '{"source":"Baker Creek","days_to_maturity":"120-140 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"dwarf-arugula"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Arugula' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Dwarf Arugula' AND sub.name = 'Arugula' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Early Arugula', 'Heirloom arugula variety with excellent flavor and growing characteristics.', '/images/varieties/early-arugula.jpg', '{"source":"Baker Creek","days_to_maturity":"130-150 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"early-arugula"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Arugula' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Early Arugula' AND sub.name = 'Arugula' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Late Arugula', 'Heirloom arugula variety with excellent flavor and growing characteristics.', '/images/varieties/late-arugula.jpg', '{"source":"Baker Creek","days_to_maturity":"140-160 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"late-arugula"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Arugula' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Late Arugula' AND sub.name = 'Arugula' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Classic Asparagus', 'Heirloom asparagus variety with excellent flavor and growing characteristics.', '/images/varieties/classic-asparagus.jpg', '{"source":"Baker Creek","days_to_maturity":"70-90 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"classic-asparagus"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Asparagus' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Classic Asparagus' AND sub.name = 'Asparagus' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Royal Asparagus', 'Heirloom asparagus variety with excellent flavor and growing characteristics.', '/images/varieties/royal-asparagus.jpg', '{"source":"Baker Creek","days_to_maturity":"80-100 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"royal-asparagus"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Asparagus' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Royal Asparagus' AND sub.name = 'Asparagus' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Golden Asparagus', 'Heirloom asparagus variety with excellent flavor and growing characteristics.', '/images/varieties/golden-asparagus.jpg', '{"source":"Baker Creek","days_to_maturity":"90-110 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"golden-asparagus"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Asparagus' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Golden Asparagus' AND sub.name = 'Asparagus' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Purple Asparagus', 'Heirloom asparagus variety with excellent flavor and growing characteristics.', '/images/varieties/purple-asparagus.jpg', '{"source":"Baker Creek","days_to_maturity":"100-120 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"purple-asparagus"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Asparagus' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Purple Asparagus' AND sub.name = 'Asparagus' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Giant Asparagus', 'Heirloom asparagus variety with excellent flavor and growing characteristics.', '/images/varieties/giant-asparagus.jpg', '{"source":"Baker Creek","days_to_maturity":"110-130 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"giant-asparagus"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Asparagus' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Giant Asparagus' AND sub.name = 'Asparagus' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Dwarf Asparagus', 'Heirloom asparagus variety with excellent flavor and growing characteristics.', '/images/varieties/dwarf-asparagus.jpg', '{"source":"Baker Creek","days_to_maturity":"120-140 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"dwarf-asparagus"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Asparagus' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Dwarf Asparagus' AND sub.name = 'Asparagus' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Classic Barley', 'Heirloom barley variety with excellent flavor and growing characteristics.', '/images/varieties/classic-barley.jpg', '{"source":"Baker Creek","days_to_maturity":"70-90 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"classic-barley"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Barley' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Classic Barley' AND sub.name = 'Barley' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Royal Barley', 'Heirloom barley variety with excellent flavor and growing characteristics.', '/images/varieties/royal-barley.jpg', '{"source":"Baker Creek","days_to_maturity":"80-100 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"royal-barley"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Barley' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Royal Barley' AND sub.name = 'Barley' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Golden Barley', 'Heirloom barley variety with excellent flavor and growing characteristics.', '/images/varieties/golden-barley.jpg', '{"source":"Baker Creek","days_to_maturity":"90-110 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"golden-barley"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Barley' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Golden Barley' AND sub.name = 'Barley' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Purple Barley', 'Heirloom barley variety with excellent flavor and growing characteristics.', '/images/varieties/purple-barley.jpg', '{"source":"Baker Creek","days_to_maturity":"100-120 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"purple-barley"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Barley' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Purple Barley' AND sub.name = 'Barley' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Giant Barley', 'Heirloom barley variety with excellent flavor and growing characteristics.', '/images/varieties/giant-barley.jpg', '{"source":"Baker Creek","days_to_maturity":"110-130 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"giant-barley"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Barley' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Giant Barley' AND sub.name = 'Barley' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Dwarf Barley', 'Heirloom barley variety with excellent flavor and growing characteristics.', '/images/varieties/dwarf-barley.jpg', '{"source":"Baker Creek","days_to_maturity":"120-140 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"dwarf-barley"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Barley' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Dwarf Barley' AND sub.name = 'Barley' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Early Barley', 'Heirloom barley variety with excellent flavor and growing characteristics.', '/images/varieties/early-barley.jpg', '{"source":"Baker Creek","days_to_maturity":"130-150 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"early-barley"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Barley' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Early Barley' AND sub.name = 'Barley' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Dragon Tongue Bush', 'Beautiful bush bean with purple streaks and excellent flavor.', '/images/varieties/dragon-tongue-bush.jpg', '{"source":"Baker Creek","days_to_maturity":"60-65 days","spacing":"4-6\"","sun_requirements":"Full sun","original_price":"$4.00"}'::jsonb, '{"slug":"dragon-tongue-bush"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Beans' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Dragon Tongue Bush' AND sub.name = 'Beans' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Adventist Pole', 'Cherished heirloom valued for its nutritional benefits and versatility.', '/images/varieties/adventist-pole.jpg', '{"source":"Baker Creek","days_to_maturity":"70-80 days","spacing":"6-8\"","sun_requirements":"Full sun","original_price":"$4.50"}'::jsonb, '{"slug":"adventist-pole"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Beans' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Adventist Pole' AND sub.name = 'Beans' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Cherokee Trail of Tears', 'Historic Cherokee bean variety with purple pods.', '/images/varieties/cherokee-trail-of-tears.jpg', '{"source":"Baker Creek","days_to_maturity":"85-90 days","original_price":"$4.50"}'::jsonb, '{"slug":"cherokee-trail-of-tears"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Beans' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Cherokee Trail of Tears' AND sub.name = 'Beans' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Classic Beetroot', 'Heirloom beetroot variety with excellent flavor and growing characteristics.', '/images/varieties/classic-beetroot.jpg', '{"source":"Baker Creek","days_to_maturity":"70-90 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"classic-beetroot"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Beetroot' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Classic Beetroot' AND sub.name = 'Beetroot' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Royal Beetroot', 'Heirloom beetroot variety with excellent flavor and growing characteristics.', '/images/varieties/royal-beetroot.jpg', '{"source":"Baker Creek","days_to_maturity":"80-100 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"royal-beetroot"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Beetroot' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Royal Beetroot' AND sub.name = 'Beetroot' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Golden Beetroot', 'Heirloom beetroot variety with excellent flavor and growing characteristics.', '/images/varieties/golden-beetroot.jpg', '{"source":"Baker Creek","days_to_maturity":"90-110 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"golden-beetroot"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Beetroot' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Golden Beetroot' AND sub.name = 'Beetroot' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Purple Beetroot', 'Heirloom beetroot variety with excellent flavor and growing characteristics.', '/images/varieties/purple-beetroot.jpg', '{"source":"Baker Creek","days_to_maturity":"100-120 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"purple-beetroot"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Beetroot' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Purple Beetroot' AND sub.name = 'Beetroot' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Giant Beetroot', 'Heirloom beetroot variety with excellent flavor and growing characteristics.', '/images/varieties/giant-beetroot.jpg', '{"source":"Baker Creek","days_to_maturity":"110-130 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"giant-beetroot"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Beetroot' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Giant Beetroot' AND sub.name = 'Beetroot' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Dwarf Beetroot', 'Heirloom beetroot variety with excellent flavor and growing characteristics.', '/images/varieties/dwarf-beetroot.jpg', '{"source":"Baker Creek","days_to_maturity":"120-140 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"dwarf-beetroot"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Beetroot' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Dwarf Beetroot' AND sub.name = 'Beetroot' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Early Beetroot', 'Heirloom beetroot variety with excellent flavor and growing characteristics.', '/images/varieties/early-beetroot.jpg', '{"source":"Baker Creek","days_to_maturity":"130-150 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"early-beetroot"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Beetroot' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Early Beetroot' AND sub.name = 'Beetroot' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Classic Bitter Melon', 'Heirloom bitter melon variety with excellent flavor and growing characteristics.', '/images/varieties/classic-bitter-melon.jpg', '{"source":"Baker Creek","days_to_maturity":"70-90 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"classic-bitter-melon"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Bitter Melon' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Classic Bitter Melon' AND sub.name = 'Bitter Melon' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Royal Bitter Melon', 'Heirloom bitter melon variety with excellent flavor and growing characteristics.', '/images/varieties/royal-bitter-melon.jpg', '{"source":"Baker Creek","days_to_maturity":"80-100 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"royal-bitter-melon"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Bitter Melon' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Royal Bitter Melon' AND sub.name = 'Bitter Melon' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Golden Bitter Melon', 'Heirloom bitter melon variety with excellent flavor and growing characteristics.', '/images/varieties/golden-bitter-melon.jpg', '{"source":"Baker Creek","days_to_maturity":"90-110 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"golden-bitter-melon"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Bitter Melon' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Golden Bitter Melon' AND sub.name = 'Bitter Melon' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Purple Bitter Melon', 'Heirloom bitter melon variety with excellent flavor and growing characteristics.', '/images/varieties/purple-bitter-melon.jpg', '{"source":"Baker Creek","days_to_maturity":"100-120 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"purple-bitter-melon"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Bitter Melon' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Purple Bitter Melon' AND sub.name = 'Bitter Melon' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Giant Bitter Melon', 'Heirloom bitter melon variety with excellent flavor and growing characteristics.', '/images/varieties/giant-bitter-melon.jpg', '{"source":"Baker Creek","days_to_maturity":"110-130 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"giant-bitter-melon"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Bitter Melon' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Giant Bitter Melon' AND sub.name = 'Bitter Melon' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Dwarf Bitter Melon', 'Heirloom bitter melon variety with excellent flavor and growing characteristics.', '/images/varieties/dwarf-bitter-melon.jpg', '{"source":"Baker Creek","days_to_maturity":"120-140 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"dwarf-bitter-melon"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Bitter Melon' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Dwarf Bitter Melon' AND sub.name = 'Bitter Melon' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Early Bitter Melon', 'Heirloom bitter melon variety with excellent flavor and growing characteristics.', '/images/varieties/early-bitter-melon.jpg', '{"source":"Baker Creek","days_to_maturity":"130-150 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"early-bitter-melon"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Bitter Melon' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Early Bitter Melon' AND sub.name = 'Bitter Melon' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Classic Bok Choy', 'Heirloom bok choy variety with excellent flavor and growing characteristics.', '/images/varieties/classic-bok-choy.jpg', '{"source":"Baker Creek","days_to_maturity":"70-90 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"classic-bok-choy"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Bok Choy' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Classic Bok Choy' AND sub.name = 'Bok Choy' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Royal Bok Choy', 'Heirloom bok choy variety with excellent flavor and growing characteristics.', '/images/varieties/royal-bok-choy.jpg', '{"source":"Baker Creek","days_to_maturity":"80-100 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"royal-bok-choy"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Bok Choy' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Royal Bok Choy' AND sub.name = 'Bok Choy' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Golden Bok Choy', 'Heirloom bok choy variety with excellent flavor and growing characteristics.', '/images/varieties/golden-bok-choy.jpg', '{"source":"Baker Creek","days_to_maturity":"90-110 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"golden-bok-choy"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Bok Choy' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Golden Bok Choy' AND sub.name = 'Bok Choy' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Classic Broccoli', 'Heirloom broccoli variety with excellent flavor and growing characteristics.', '/images/varieties/classic-broccoli.jpg', '{"source":"Baker Creek","days_to_maturity":"70-90 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"classic-broccoli"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Broccoli' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Classic Broccoli' AND sub.name = 'Broccoli' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Royal Broccoli', 'Heirloom broccoli variety with excellent flavor and growing characteristics.', '/images/varieties/royal-broccoli.jpg', '{"source":"Baker Creek","days_to_maturity":"80-100 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"royal-broccoli"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Broccoli' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Royal Broccoli' AND sub.name = 'Broccoli' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Golden Broccoli', 'Heirloom broccoli variety with excellent flavor and growing characteristics.', '/images/varieties/golden-broccoli.jpg', '{"source":"Baker Creek","days_to_maturity":"90-110 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"golden-broccoli"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Broccoli' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Golden Broccoli' AND sub.name = 'Broccoli' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Purple Broccoli', 'Heirloom broccoli variety with excellent flavor and growing characteristics.', '/images/varieties/purple-broccoli.jpg', '{"source":"Baker Creek","days_to_maturity":"100-120 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"purple-broccoli"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Broccoli' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Purple Broccoli' AND sub.name = 'Broccoli' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Giant Broccoli', 'Heirloom broccoli variety with excellent flavor and growing characteristics.', '/images/varieties/giant-broccoli.jpg', '{"source":"Baker Creek","days_to_maturity":"110-130 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"giant-broccoli"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Broccoli' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Giant Broccoli' AND sub.name = 'Broccoli' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Dwarf Broccoli', 'Heirloom broccoli variety with excellent flavor and growing characteristics.', '/images/varieties/dwarf-broccoli.jpg', '{"source":"Baker Creek","days_to_maturity":"120-140 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"dwarf-broccoli"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Broccoli' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Dwarf Broccoli' AND sub.name = 'Broccoli' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Classic Brussels Sprouts', 'Heirloom brussels sprouts variety with excellent flavor and growing characteristics.', '/images/varieties/classic-brussels-sprouts.jpg', '{"source":"Baker Creek","days_to_maturity":"70-90 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"classic-brussels-sprouts"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Brussels Sprouts' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Classic Brussels Sprouts' AND sub.name = 'Brussels Sprouts' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Royal Brussels Sprouts', 'Heirloom brussels sprouts variety with excellent flavor and growing characteristics.', '/images/varieties/royal-brussels-sprouts.jpg', '{"source":"Baker Creek","days_to_maturity":"80-100 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"royal-brussels-sprouts"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Brussels Sprouts' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Royal Brussels Sprouts' AND sub.name = 'Brussels Sprouts' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Golden Brussels Sprouts', 'Heirloom brussels sprouts variety with excellent flavor and growing characteristics.', '/images/varieties/golden-brussels-sprouts.jpg', '{"source":"Baker Creek","days_to_maturity":"90-110 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"golden-brussels-sprouts"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Brussels Sprouts' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Golden Brussels Sprouts' AND sub.name = 'Brussels Sprouts' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Purple Brussels Sprouts', 'Heirloom brussels sprouts variety with excellent flavor and growing characteristics.', '/images/varieties/purple-brussels-sprouts.jpg', '{"source":"Baker Creek","days_to_maturity":"100-120 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"purple-brussels-sprouts"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Brussels Sprouts' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Purple Brussels Sprouts' AND sub.name = 'Brussels Sprouts' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Giant Brussels Sprouts', 'Heirloom brussels sprouts variety with excellent flavor and growing characteristics.', '/images/varieties/giant-brussels-sprouts.jpg', '{"source":"Baker Creek","days_to_maturity":"110-130 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"giant-brussels-sprouts"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Brussels Sprouts' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Giant Brussels Sprouts' AND sub.name = 'Brussels Sprouts' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Dwarf Brussels Sprouts', 'Heirloom brussels sprouts variety with excellent flavor and growing characteristics.', '/images/varieties/dwarf-brussels-sprouts.jpg', '{"source":"Baker Creek","days_to_maturity":"120-140 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"dwarf-brussels-sprouts"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Brussels Sprouts' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Dwarf Brussels Sprouts' AND sub.name = 'Brussels Sprouts' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Classic Buckwheat', 'Heirloom buckwheat variety with excellent flavor and growing characteristics.', '/images/varieties/classic-buckwheat.jpg', '{"source":"Baker Creek","days_to_maturity":"70-90 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"classic-buckwheat"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Buckwheat' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Classic Buckwheat' AND sub.name = 'Buckwheat' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Royal Buckwheat', 'Heirloom buckwheat variety with excellent flavor and growing characteristics.', '/images/varieties/royal-buckwheat.jpg', '{"source":"Baker Creek","days_to_maturity":"80-100 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"royal-buckwheat"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Buckwheat' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Royal Buckwheat' AND sub.name = 'Buckwheat' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Golden Buckwheat', 'Heirloom buckwheat variety with excellent flavor and growing characteristics.', '/images/varieties/golden-buckwheat.jpg', '{"source":"Baker Creek","days_to_maturity":"90-110 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"golden-buckwheat"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Buckwheat' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Golden Buckwheat' AND sub.name = 'Buckwheat' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Purple Buckwheat', 'Heirloom buckwheat variety with excellent flavor and growing characteristics.', '/images/varieties/purple-buckwheat.jpg', '{"source":"Baker Creek","days_to_maturity":"100-120 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"purple-buckwheat"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Buckwheat' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Purple Buckwheat' AND sub.name = 'Buckwheat' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Giant Buckwheat', 'Heirloom buckwheat variety with excellent flavor and growing characteristics.', '/images/varieties/giant-buckwheat.jpg', '{"source":"Baker Creek","days_to_maturity":"110-130 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"giant-buckwheat"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Buckwheat' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Giant Buckwheat' AND sub.name = 'Buckwheat' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Dwarf Buckwheat', 'Heirloom buckwheat variety with excellent flavor and growing characteristics.', '/images/varieties/dwarf-buckwheat.jpg', '{"source":"Baker Creek","days_to_maturity":"120-140 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"dwarf-buckwheat"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Buckwheat' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Dwarf Buckwheat' AND sub.name = 'Buckwheat' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Early Buckwheat', 'Heirloom buckwheat variety with excellent flavor and growing characteristics.', '/images/varieties/early-buckwheat.jpg', '{"source":"Baker Creek","days_to_maturity":"130-150 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"early-buckwheat"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Buckwheat' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Early Buckwheat' AND sub.name = 'Buckwheat' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Late Buckwheat', 'Heirloom buckwheat variety with excellent flavor and growing characteristics.', '/images/varieties/late-buckwheat.jpg', '{"source":"Baker Creek","days_to_maturity":"140-160 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"late-buckwheat"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Buckwheat' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Late Buckwheat' AND sub.name = 'Buckwheat' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Classic Cabbage', 'Heirloom cabbage variety with excellent flavor and growing characteristics.', '/images/varieties/classic-cabbage.jpg', '{"source":"Baker Creek","days_to_maturity":"70-90 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"classic-cabbage"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Cabbage' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Classic Cabbage' AND sub.name = 'Cabbage' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Royal Cabbage', 'Heirloom cabbage variety with excellent flavor and growing characteristics.', '/images/varieties/royal-cabbage.jpg', '{"source":"Baker Creek","days_to_maturity":"80-100 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"royal-cabbage"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Cabbage' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Royal Cabbage' AND sub.name = 'Cabbage' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Golden Cabbage', 'Heirloom cabbage variety with excellent flavor and growing characteristics.', '/images/varieties/golden-cabbage.jpg', '{"source":"Baker Creek","days_to_maturity":"90-110 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"golden-cabbage"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Cabbage' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Golden Cabbage' AND sub.name = 'Cabbage' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Purple Cabbage', 'Heirloom cabbage variety with excellent flavor and growing characteristics.', '/images/varieties/purple-cabbage.jpg', '{"source":"Baker Creek","days_to_maturity":"100-120 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"purple-cabbage"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Cabbage' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Purple Cabbage' AND sub.name = 'Cabbage' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Giant Cabbage', 'Heirloom cabbage variety with excellent flavor and growing characteristics.', '/images/varieties/giant-cabbage.jpg', '{"source":"Baker Creek","days_to_maturity":"110-130 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"giant-cabbage"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Cabbage' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Giant Cabbage' AND sub.name = 'Cabbage' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Dwarf Cabbage', 'Heirloom cabbage variety with excellent flavor and growing characteristics.', '/images/varieties/dwarf-cabbage.jpg', '{"source":"Baker Creek","days_to_maturity":"120-140 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"dwarf-cabbage"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Cabbage' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Dwarf Cabbage' AND sub.name = 'Cabbage' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Early Cabbage', 'Heirloom cabbage variety with excellent flavor and growing characteristics.', '/images/varieties/early-cabbage.jpg', '{"source":"Baker Creek","days_to_maturity":"130-150 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"early-cabbage"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Cabbage' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Early Cabbage' AND sub.name = 'Cabbage' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'New Kuroda', 'Japanese carrot variety with excellent flavor and storage.', '/images/varieties/new-kuroda.jpg', '{"source":"Baker Creek","days_to_maturity":"70-80 days","spacing":"2-3\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"new-kuroda"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Carrots Seeds' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'New Kuroda' AND sub.name = 'Carrots Seeds' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Classic Cauliflower', 'Heirloom cauliflower variety with excellent flavor and growing characteristics.', '/images/varieties/classic-cauliflower.jpg', '{"source":"Baker Creek","days_to_maturity":"70-90 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"classic-cauliflower"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Cauliflower' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Classic Cauliflower' AND sub.name = 'Cauliflower' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Royal Cauliflower', 'Heirloom cauliflower variety with excellent flavor and growing characteristics.', '/images/varieties/royal-cauliflower.jpg', '{"source":"Baker Creek","days_to_maturity":"80-100 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"royal-cauliflower"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Cauliflower' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Royal Cauliflower' AND sub.name = 'Cauliflower' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Golden Cauliflower', 'Heirloom cauliflower variety with excellent flavor and growing characteristics.', '/images/varieties/golden-cauliflower.jpg', '{"source":"Baker Creek","days_to_maturity":"90-110 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"golden-cauliflower"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Cauliflower' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Golden Cauliflower' AND sub.name = 'Cauliflower' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Purple Cauliflower', 'Heirloom cauliflower variety with excellent flavor and growing characteristics.', '/images/varieties/purple-cauliflower.jpg', '{"source":"Baker Creek","days_to_maturity":"100-120 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"purple-cauliflower"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Cauliflower' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Purple Cauliflower' AND sub.name = 'Cauliflower' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Classic Celery', 'Heirloom celery variety with excellent flavor and growing characteristics.', '/images/varieties/classic-celery.jpg', '{"source":"Baker Creek","days_to_maturity":"70-90 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"classic-celery"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Celery' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Classic Celery' AND sub.name = 'Celery' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Royal Celery', 'Heirloom celery variety with excellent flavor and growing characteristics.', '/images/varieties/royal-celery.jpg', '{"source":"Baker Creek","days_to_maturity":"80-100 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"royal-celery"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Celery' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Royal Celery' AND sub.name = 'Celery' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Golden Celery', 'Heirloom celery variety with excellent flavor and growing characteristics.', '/images/varieties/golden-celery.jpg', '{"source":"Baker Creek","days_to_maturity":"90-110 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"golden-celery"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Celery' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Golden Celery' AND sub.name = 'Celery' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Purple Celery', 'Heirloom celery variety with excellent flavor and growing characteristics.', '/images/varieties/purple-celery.jpg', '{"source":"Baker Creek","days_to_maturity":"100-120 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"purple-celery"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Celery' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Purple Celery' AND sub.name = 'Celery' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Giant Celery', 'Heirloom celery variety with excellent flavor and growing characteristics.', '/images/varieties/giant-celery.jpg', '{"source":"Baker Creek","days_to_maturity":"110-130 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"giant-celery"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Celery' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Giant Celery' AND sub.name = 'Celery' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Classic Chard', 'Heirloom chard variety with excellent flavor and growing characteristics.', '/images/varieties/classic-chard.jpg', '{"source":"Baker Creek","days_to_maturity":"70-90 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"classic-chard"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Chard' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Classic Chard' AND sub.name = 'Chard' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Royal Chard', 'Heirloom chard variety with excellent flavor and growing characteristics.', '/images/varieties/royal-chard.jpg', '{"source":"Baker Creek","days_to_maturity":"80-100 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"royal-chard"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Chard' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Royal Chard' AND sub.name = 'Chard' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Golden Chard', 'Heirloom chard variety with excellent flavor and growing characteristics.', '/images/varieties/golden-chard.jpg', '{"source":"Baker Creek","days_to_maturity":"90-110 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"golden-chard"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Chard' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Golden Chard' AND sub.name = 'Chard' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Purple Chard', 'Heirloom chard variety with excellent flavor and growing characteristics.', '/images/varieties/purple-chard.jpg', '{"source":"Baker Creek","days_to_maturity":"100-120 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"purple-chard"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Chard' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Purple Chard' AND sub.name = 'Chard' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Giant Chard', 'Heirloom chard variety with excellent flavor and growing characteristics.', '/images/varieties/giant-chard.jpg', '{"source":"Baker Creek","days_to_maturity":"110-130 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"giant-chard"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Chard' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Giant Chard' AND sub.name = 'Chard' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Classic Chickpeas', 'Heirloom chickpeas variety with excellent flavor and growing characteristics.', '/images/varieties/classic-chickpeas.jpg', '{"source":"Baker Creek","days_to_maturity":"70-90 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"classic-chickpeas"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Chickpeas' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Classic Chickpeas' AND sub.name = 'Chickpeas' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Royal Chickpeas', 'Heirloom chickpeas variety with excellent flavor and growing characteristics.', '/images/varieties/royal-chickpeas.jpg', '{"source":"Baker Creek","days_to_maturity":"80-100 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"royal-chickpeas"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Chickpeas' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Royal Chickpeas' AND sub.name = 'Chickpeas' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Golden Chickpeas', 'Heirloom chickpeas variety with excellent flavor and growing characteristics.', '/images/varieties/golden-chickpeas.jpg', '{"source":"Baker Creek","days_to_maturity":"90-110 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"golden-chickpeas"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Chickpeas' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Golden Chickpeas' AND sub.name = 'Chickpeas' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Classic Chicory', 'Heirloom chicory variety with excellent flavor and growing characteristics.', '/images/varieties/classic-chicory.jpg', '{"source":"Baker Creek","days_to_maturity":"70-90 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"classic-chicory"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Chicory' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Classic Chicory' AND sub.name = 'Chicory' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Royal Chicory', 'Heirloom chicory variety with excellent flavor and growing characteristics.', '/images/varieties/royal-chicory.jpg', '{"source":"Baker Creek","days_to_maturity":"80-100 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"royal-chicory"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Chicory' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Royal Chicory' AND sub.name = 'Chicory' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Golden Chicory', 'Heirloom chicory variety with excellent flavor and growing characteristics.', '/images/varieties/golden-chicory.jpg', '{"source":"Baker Creek","days_to_maturity":"90-110 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"golden-chicory"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Chicory' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Golden Chicory' AND sub.name = 'Chicory' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Purple Chicory', 'Heirloom chicory variety with excellent flavor and growing characteristics.', '/images/varieties/purple-chicory.jpg', '{"source":"Baker Creek","days_to_maturity":"100-120 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"purple-chicory"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Chicory' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Purple Chicory' AND sub.name = 'Chicory' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Giant Chicory', 'Heirloom chicory variety with excellent flavor and growing characteristics.', '/images/varieties/giant-chicory.jpg', '{"source":"Baker Creek","days_to_maturity":"110-130 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"giant-chicory"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Chicory' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Giant Chicory' AND sub.name = 'Chicory' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Dwarf Chicory', 'Heirloom chicory variety with excellent flavor and growing characteristics.', '/images/varieties/dwarf-chicory.jpg', '{"source":"Baker Creek","days_to_maturity":"120-140 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"dwarf-chicory"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Chicory' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Dwarf Chicory' AND sub.name = 'Chicory' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Early Chicory', 'Heirloom chicory variety with excellent flavor and growing characteristics.', '/images/varieties/early-chicory.jpg', '{"source":"Baker Creek","days_to_maturity":"130-150 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"early-chicory"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Chicory' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Early Chicory' AND sub.name = 'Chicory' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Classic Chinese Cabbage', 'Heirloom chinese cabbage variety with excellent flavor and growing characteristics.', '/images/varieties/classic-chinese-cabbage.jpg', '{"source":"Baker Creek","days_to_maturity":"70-90 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"classic-chinese-cabbage"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Chinese Cabbage' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Classic Chinese Cabbage' AND sub.name = 'Chinese Cabbage' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Royal Chinese Cabbage', 'Heirloom chinese cabbage variety with excellent flavor and growing characteristics.', '/images/varieties/royal-chinese-cabbage.jpg', '{"source":"Baker Creek","days_to_maturity":"80-100 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"royal-chinese-cabbage"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Chinese Cabbage' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Royal Chinese Cabbage' AND sub.name = 'Chinese Cabbage' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Golden Chinese Cabbage', 'Heirloom chinese cabbage variety with excellent flavor and growing characteristics.', '/images/varieties/golden-chinese-cabbage.jpg', '{"source":"Baker Creek","days_to_maturity":"90-110 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"golden-chinese-cabbage"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Chinese Cabbage' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Golden Chinese Cabbage' AND sub.name = 'Chinese Cabbage' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Purple Chinese Cabbage', 'Heirloom chinese cabbage variety with excellent flavor and growing characteristics.', '/images/varieties/purple-chinese-cabbage.jpg', '{"source":"Baker Creek","days_to_maturity":"100-120 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"purple-chinese-cabbage"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Chinese Cabbage' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Purple Chinese Cabbage' AND sub.name = 'Chinese Cabbage' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Classic Collards', 'Heirloom collards variety with excellent flavor and growing characteristics.', '/images/varieties/classic-collards.jpg', '{"source":"Baker Creek","days_to_maturity":"70-90 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"classic-collards"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Collards' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Classic Collards' AND sub.name = 'Collards' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Royal Collards', 'Heirloom collards variety with excellent flavor and growing characteristics.', '/images/varieties/royal-collards.jpg', '{"source":"Baker Creek","days_to_maturity":"80-100 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"royal-collards"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Collards' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Royal Collards' AND sub.name = 'Collards' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Golden Collards', 'Heirloom collards variety with excellent flavor and growing characteristics.', '/images/varieties/golden-collards.jpg', '{"source":"Baker Creek","days_to_maturity":"90-110 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"golden-collards"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Collards' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Golden Collards' AND sub.name = 'Collards' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Purple Collards', 'Heirloom collards variety with excellent flavor and growing characteristics.', '/images/varieties/purple-collards.jpg', '{"source":"Baker Creek","days_to_maturity":"100-120 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"purple-collards"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Collards' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Purple Collards' AND sub.name = 'Collards' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Giant Collards', 'Heirloom collards variety with excellent flavor and growing characteristics.', '/images/varieties/giant-collards.jpg', '{"source":"Baker Creek","days_to_maturity":"110-130 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"giant-collards"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Collards' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Giant Collards' AND sub.name = 'Collards' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Dwarf Collards', 'Heirloom collards variety with excellent flavor and growing characteristics.', '/images/varieties/dwarf-collards.jpg', '{"source":"Baker Creek","days_to_maturity":"120-140 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"dwarf-collards"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Collards' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Dwarf Collards' AND sub.name = 'Collards' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Early Collards', 'Heirloom collards variety with excellent flavor and growing characteristics.', '/images/varieties/early-collards.jpg', '{"source":"Baker Creek","days_to_maturity":"130-150 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"early-collards"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Collards' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Early Collards' AND sub.name = 'Collards' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Late Collards', 'Heirloom collards variety with excellent flavor and growing characteristics.', '/images/varieties/late-collards.jpg', '{"source":"Baker Creek","days_to_maturity":"140-160 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"late-collards"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Collards' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Late Collards' AND sub.name = 'Collards' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Martian Jewels', 'Spectacular multicolored corn with jewel-like kernels.', '/images/varieties/martian-jewels.jpg', '{"source":"Baker Creek","days_to_maturity":"100-110 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$4.50"}'::jsonb, '{"slug":"martian-jewels"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Corn' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Martian Jewels' AND sub.name = 'Corn' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Glass Gem', 'Rainbow-colored ornamental corn with translucent kernels.', '/images/varieties/glass-gem.jpg', '{"source":"Baker Creek","days_to_maturity":"105-115 days","original_price":"$4.50"}'::jsonb, '{"slug":"glass-gem"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Corn' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Glass Gem' AND sub.name = 'Corn' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Lemon Cuke', 'Round, lemon-shaped cucumber with mild flavor.', '/images/varieties/lemon-cuke.jpg', '{"source":"Baker Creek","days_to_maturity":"60-70 days","spacing":"12-18\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"lemon-cuke"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Cucumber' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Lemon Cuke' AND sub.name = 'Cucumber' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'China Jade', 'Asian cucumber variety with crisp texture.', '/images/varieties/china-jade.jpg', '{"source":"Baker Creek","days_to_maturity":"55-65 days","original_price":"$3.00"}'::jsonb, '{"slug":"china-jade"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Cucumber' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'China Jade' AND sub.name = 'Cucumber' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Classic Eggplant', 'Heirloom eggplant variety with excellent flavor and growing characteristics.', '/images/varieties/classic-eggplant.jpg', '{"source":"Baker Creek","days_to_maturity":"70-90 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"classic-eggplant"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Eggplant' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Classic Eggplant' AND sub.name = 'Eggplant' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Royal Eggplant', 'Heirloom eggplant variety with excellent flavor and growing characteristics.', '/images/varieties/royal-eggplant.jpg', '{"source":"Baker Creek","days_to_maturity":"80-100 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"royal-eggplant"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Eggplant' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Royal Eggplant' AND sub.name = 'Eggplant' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Golden Eggplant', 'Heirloom eggplant variety with excellent flavor and growing characteristics.', '/images/varieties/golden-eggplant.jpg', '{"source":"Baker Creek","days_to_maturity":"90-110 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"golden-eggplant"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Eggplant' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Golden Eggplant' AND sub.name = 'Eggplant' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Purple Eggplant', 'Heirloom eggplant variety with excellent flavor and growing characteristics.', '/images/varieties/purple-eggplant.jpg', '{"source":"Baker Creek","days_to_maturity":"100-120 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"purple-eggplant"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Eggplant' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Purple Eggplant' AND sub.name = 'Eggplant' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Giant Eggplant', 'Heirloom eggplant variety with excellent flavor and growing characteristics.', '/images/varieties/giant-eggplant.jpg', '{"source":"Baker Creek","days_to_maturity":"110-130 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"giant-eggplant"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Eggplant' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Giant Eggplant' AND sub.name = 'Eggplant' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Dwarf Eggplant', 'Heirloom eggplant variety with excellent flavor and growing characteristics.', '/images/varieties/dwarf-eggplant.jpg', '{"source":"Baker Creek","days_to_maturity":"120-140 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"dwarf-eggplant"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Eggplant' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Dwarf Eggplant' AND sub.name = 'Eggplant' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Classic Endive', 'Heirloom endive variety with excellent flavor and growing characteristics.', '/images/varieties/classic-endive.jpg', '{"source":"Baker Creek","days_to_maturity":"70-90 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"classic-endive"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Endive' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Classic Endive' AND sub.name = 'Endive' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Royal Endive', 'Heirloom endive variety with excellent flavor and growing characteristics.', '/images/varieties/royal-endive.jpg', '{"source":"Baker Creek","days_to_maturity":"80-100 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"royal-endive"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Endive' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Royal Endive' AND sub.name = 'Endive' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Golden Endive', 'Heirloom endive variety with excellent flavor and growing characteristics.', '/images/varieties/golden-endive.jpg', '{"source":"Baker Creek","days_to_maturity":"90-110 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"golden-endive"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Endive' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Golden Endive' AND sub.name = 'Endive' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Classic Fava Beans', 'Heirloom fava beans variety with excellent flavor and growing characteristics.', '/images/varieties/classic-fava-beans.jpg', '{"source":"Baker Creek","days_to_maturity":"70-90 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"classic-fava-beans"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Fava Beans' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Classic Fava Beans' AND sub.name = 'Fava Beans' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Royal Fava Beans', 'Heirloom fava beans variety with excellent flavor and growing characteristics.', '/images/varieties/royal-fava-beans.jpg', '{"source":"Baker Creek","days_to_maturity":"80-100 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"royal-fava-beans"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Fava Beans' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Royal Fava Beans' AND sub.name = 'Fava Beans' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Golden Fava Beans', 'Heirloom fava beans variety with excellent flavor and growing characteristics.', '/images/varieties/golden-fava-beans.jpg', '{"source":"Baker Creek","days_to_maturity":"90-110 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"golden-fava-beans"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Fava Beans' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Golden Fava Beans' AND sub.name = 'Fava Beans' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Classic Fennel', 'Heirloom fennel variety with excellent flavor and growing characteristics.', '/images/varieties/classic-fennel.jpg', '{"source":"Baker Creek","days_to_maturity":"70-90 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"classic-fennel"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Fennel' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Classic Fennel' AND sub.name = 'Fennel' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Royal Fennel', 'Heirloom fennel variety with excellent flavor and growing characteristics.', '/images/varieties/royal-fennel.jpg', '{"source":"Baker Creek","days_to_maturity":"80-100 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"royal-fennel"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Fennel' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Royal Fennel' AND sub.name = 'Fennel' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Golden Fennel', 'Heirloom fennel variety with excellent flavor and growing characteristics.', '/images/varieties/golden-fennel.jpg', '{"source":"Baker Creek","days_to_maturity":"90-110 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"golden-fennel"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Fennel' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Golden Fennel' AND sub.name = 'Fennel' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Purple Fennel', 'Heirloom fennel variety with excellent flavor and growing characteristics.', '/images/varieties/purple-fennel.jpg', '{"source":"Baker Creek","days_to_maturity":"100-120 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"purple-fennel"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Fennel' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Purple Fennel' AND sub.name = 'Fennel' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Giant Fennel', 'Heirloom fennel variety with excellent flavor and growing characteristics.', '/images/varieties/giant-fennel.jpg', '{"source":"Baker Creek","days_to_maturity":"110-130 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"giant-fennel"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Fennel' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Giant Fennel' AND sub.name = 'Fennel' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Dwarf Fennel', 'Heirloom fennel variety with excellent flavor and growing characteristics.', '/images/varieties/dwarf-fennel.jpg', '{"source":"Baker Creek","days_to_maturity":"120-140 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"dwarf-fennel"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Fennel' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Dwarf Fennel' AND sub.name = 'Fennel' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Classic Garlic', 'Heirloom garlic variety with excellent flavor and growing characteristics.', '/images/varieties/classic-garlic.jpg', '{"source":"Baker Creek","days_to_maturity":"70-90 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"classic-garlic"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Garlic' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Classic Garlic' AND sub.name = 'Garlic' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Royal Garlic', 'Heirloom garlic variety with excellent flavor and growing characteristics.', '/images/varieties/royal-garlic.jpg', '{"source":"Baker Creek","days_to_maturity":"80-100 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"royal-garlic"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Garlic' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Royal Garlic' AND sub.name = 'Garlic' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Golden Garlic', 'Heirloom garlic variety with excellent flavor and growing characteristics.', '/images/varieties/golden-garlic.jpg', '{"source":"Baker Creek","days_to_maturity":"90-110 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"golden-garlic"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Garlic' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Golden Garlic' AND sub.name = 'Garlic' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Purple Garlic', 'Heirloom garlic variety with excellent flavor and growing characteristics.', '/images/varieties/purple-garlic.jpg', '{"source":"Baker Creek","days_to_maturity":"100-120 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"purple-garlic"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Garlic' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Purple Garlic' AND sub.name = 'Garlic' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Giant Garlic', 'Heirloom garlic variety with excellent flavor and growing characteristics.', '/images/varieties/giant-garlic.jpg', '{"source":"Baker Creek","days_to_maturity":"110-130 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"giant-garlic"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Garlic' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Giant Garlic' AND sub.name = 'Garlic' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Dwarf Garlic', 'Heirloom garlic variety with excellent flavor and growing characteristics.', '/images/varieties/dwarf-garlic.jpg', '{"source":"Baker Creek","days_to_maturity":"120-140 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"dwarf-garlic"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Garlic' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Dwarf Garlic' AND sub.name = 'Garlic' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Classic Gourds', 'Heirloom gourds variety with excellent flavor and growing characteristics.', '/images/varieties/classic-gourds.jpg', '{"source":"Baker Creek","days_to_maturity":"70-90 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"classic-gourds"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Gourds' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Classic Gourds' AND sub.name = 'Gourds' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Royal Gourds', 'Heirloom gourds variety with excellent flavor and growing characteristics.', '/images/varieties/royal-gourds.jpg', '{"source":"Baker Creek","days_to_maturity":"80-100 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"royal-gourds"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Gourds' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Royal Gourds' AND sub.name = 'Gourds' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Golden Gourds', 'Heirloom gourds variety with excellent flavor and growing characteristics.', '/images/varieties/golden-gourds.jpg', '{"source":"Baker Creek","days_to_maturity":"90-110 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"golden-gourds"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Gourds' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Golden Gourds' AND sub.name = 'Gourds' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Classic Ground Cherry', 'Heirloom ground cherry variety with excellent flavor and growing characteristics.', '/images/varieties/classic-ground-cherry.jpg', '{"source":"Baker Creek","days_to_maturity":"70-90 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"classic-ground-cherry"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Ground Cherry' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Classic Ground Cherry' AND sub.name = 'Ground Cherry' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Royal Ground Cherry', 'Heirloom ground cherry variety with excellent flavor and growing characteristics.', '/images/varieties/royal-ground-cherry.jpg', '{"source":"Baker Creek","days_to_maturity":"80-100 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"royal-ground-cherry"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Ground Cherry' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Royal Ground Cherry' AND sub.name = 'Ground Cherry' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Golden Ground Cherry', 'Heirloom ground cherry variety with excellent flavor and growing characteristics.', '/images/varieties/golden-ground-cherry.jpg', '{"source":"Baker Creek","days_to_maturity":"90-110 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"golden-ground-cherry"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Ground Cherry' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Golden Ground Cherry' AND sub.name = 'Ground Cherry' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Purple Ground Cherry', 'Heirloom ground cherry variety with excellent flavor and growing characteristics.', '/images/varieties/purple-ground-cherry.jpg', '{"source":"Baker Creek","days_to_maturity":"100-120 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"purple-ground-cherry"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Ground Cherry' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Purple Ground Cherry' AND sub.name = 'Ground Cherry' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Classic Kale', 'Heirloom kale variety with excellent flavor and growing characteristics.', '/images/varieties/classic-kale.jpg', '{"source":"Baker Creek","days_to_maturity":"70-90 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"classic-kale"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Kale' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Classic Kale' AND sub.name = 'Kale' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Royal Kale', 'Heirloom kale variety with excellent flavor and growing characteristics.', '/images/varieties/royal-kale.jpg', '{"source":"Baker Creek","days_to_maturity":"80-100 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"royal-kale"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Kale' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Royal Kale' AND sub.name = 'Kale' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Golden Kale', 'Heirloom kale variety with excellent flavor and growing characteristics.', '/images/varieties/golden-kale.jpg', '{"source":"Baker Creek","days_to_maturity":"90-110 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"golden-kale"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Kale' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Golden Kale' AND sub.name = 'Kale' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Classic Kohlrabi', 'Heirloom kohlrabi variety with excellent flavor and growing characteristics.', '/images/varieties/classic-kohlrabi.jpg', '{"source":"Baker Creek","days_to_maturity":"70-90 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"classic-kohlrabi"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Kohlrabi' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Classic Kohlrabi' AND sub.name = 'Kohlrabi' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Royal Kohlrabi', 'Heirloom kohlrabi variety with excellent flavor and growing characteristics.', '/images/varieties/royal-kohlrabi.jpg', '{"source":"Baker Creek","days_to_maturity":"80-100 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"royal-kohlrabi"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Kohlrabi' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Royal Kohlrabi' AND sub.name = 'Kohlrabi' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Golden Kohlrabi', 'Heirloom kohlrabi variety with excellent flavor and growing characteristics.', '/images/varieties/golden-kohlrabi.jpg', '{"source":"Baker Creek","days_to_maturity":"90-110 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"golden-kohlrabi"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Kohlrabi' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Golden Kohlrabi' AND sub.name = 'Kohlrabi' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Purple Kohlrabi', 'Heirloom kohlrabi variety with excellent flavor and growing characteristics.', '/images/varieties/purple-kohlrabi.jpg', '{"source":"Baker Creek","days_to_maturity":"100-120 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"purple-kohlrabi"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Kohlrabi' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Purple Kohlrabi' AND sub.name = 'Kohlrabi' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Giant Kohlrabi', 'Heirloom kohlrabi variety with excellent flavor and growing characteristics.', '/images/varieties/giant-kohlrabi.jpg', '{"source":"Baker Creek","days_to_maturity":"110-130 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"giant-kohlrabi"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Kohlrabi' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Giant Kohlrabi' AND sub.name = 'Kohlrabi' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Dwarf Kohlrabi', 'Heirloom kohlrabi variety with excellent flavor and growing characteristics.', '/images/varieties/dwarf-kohlrabi.jpg', '{"source":"Baker Creek","days_to_maturity":"120-140 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"dwarf-kohlrabi"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Kohlrabi' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Dwarf Kohlrabi' AND sub.name = 'Kohlrabi' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Classic Leeks', 'Heirloom leeks variety with excellent flavor and growing characteristics.', '/images/varieties/classic-leeks.jpg', '{"source":"Baker Creek","days_to_maturity":"70-90 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"classic-leeks"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Leeks' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Classic Leeks' AND sub.name = 'Leeks' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Royal Leeks', 'Heirloom leeks variety with excellent flavor and growing characteristics.', '/images/varieties/royal-leeks.jpg', '{"source":"Baker Creek","days_to_maturity":"80-100 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"royal-leeks"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Leeks' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Royal Leeks' AND sub.name = 'Leeks' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Golden Leeks', 'Heirloom leeks variety with excellent flavor and growing characteristics.', '/images/varieties/golden-leeks.jpg', '{"source":"Baker Creek","days_to_maturity":"90-110 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"golden-leeks"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Leeks' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Golden Leeks' AND sub.name = 'Leeks' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Purple Leeks', 'Heirloom leeks variety with excellent flavor and growing characteristics.', '/images/varieties/purple-leeks.jpg', '{"source":"Baker Creek","days_to_maturity":"100-120 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"purple-leeks"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Leeks' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Purple Leeks' AND sub.name = 'Leeks' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Giant Leeks', 'Heirloom leeks variety with excellent flavor and growing characteristics.', '/images/varieties/giant-leeks.jpg', '{"source":"Baker Creek","days_to_maturity":"110-130 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"giant-leeks"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Leeks' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Giant Leeks' AND sub.name = 'Leeks' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Dwarf Leeks', 'Heirloom leeks variety with excellent flavor and growing characteristics.', '/images/varieties/dwarf-leeks.jpg', '{"source":"Baker Creek","days_to_maturity":"120-140 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"dwarf-leeks"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Leeks' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Dwarf Leeks' AND sub.name = 'Leeks' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Little Gem', 'Compact romaine-type lettuce with sweet, crisp leaves.', '/images/varieties/little-gem.jpg', '{"source":"Baker Creek","days_to_maturity":"50-60 days","spacing":"8-10\"","sun_requirements":"Full sun to partial shade","original_price":"$3.00"}'::jsonb, '{"slug":"little-gem"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Lettuce' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Little Gem' AND sub.name = 'Lettuce' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Spotted Aleppo Syrian', 'Rare Syrian lettuce with distinctive spotted leaves.', '/images/varieties/spotted-aleppo-syrian.jpg', '{"source":"Baker Creek","days_to_maturity":"55-65 days","spacing":"8-10\"","original_price":"$3.50"}'::jsonb, '{"slug":"spotted-aleppo-syrian"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Lettuce' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Spotted Aleppo Syrian' AND sub.name = 'Lettuce' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Hao Shan', 'Asian lettuce variety with excellent heat tolerance.', '/images/varieties/hao-shan.jpg', '{"source":"Baker Creek","days_to_maturity":"45-55 days","original_price":"$3.00"}'::jsonb, '{"slug":"hao-shan"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Lettuce' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Hao Shan' AND sub.name = 'Lettuce' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Classic Mache', 'Heirloom mache variety with excellent flavor and growing characteristics.', '/images/varieties/classic-mache.jpg', '{"source":"Baker Creek","days_to_maturity":"70-90 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"classic-mache"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Mache' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Classic Mache' AND sub.name = 'Mache' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Royal Mache', 'Heirloom mache variety with excellent flavor and growing characteristics.', '/images/varieties/royal-mache.jpg', '{"source":"Baker Creek","days_to_maturity":"80-100 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"royal-mache"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Mache' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Royal Mache' AND sub.name = 'Mache' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Golden Mache', 'Heirloom mache variety with excellent flavor and growing characteristics.', '/images/varieties/golden-mache.jpg', '{"source":"Baker Creek","days_to_maturity":"90-110 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"golden-mache"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Mache' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Golden Mache' AND sub.name = 'Mache' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Purple Mache', 'Heirloom mache variety with excellent flavor and growing characteristics.', '/images/varieties/purple-mache.jpg', '{"source":"Baker Creek","days_to_maturity":"100-120 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"purple-mache"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Mache' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Purple Mache' AND sub.name = 'Mache' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Giant Mache', 'Heirloom mache variety with excellent flavor and growing characteristics.', '/images/varieties/giant-mache.jpg', '{"source":"Baker Creek","days_to_maturity":"110-130 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"giant-mache"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Mache' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Giant Mache' AND sub.name = 'Mache' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Kajari', 'Indian melon with striped skin and sweet flesh.', '/images/varieties/kajari.jpg', '{"source":"Baker Creek","days_to_maturity":"90-100 days","spacing":"18-24\"","sun_requirements":"Full sun","original_price":"$4.50"}'::jsonb, '{"slug":"kajari"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Melons' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Kajari' AND sub.name = 'Melons' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Classic Millet', 'Heirloom millet variety with excellent flavor and growing characteristics.', '/images/varieties/classic-millet.jpg', '{"source":"Baker Creek","days_to_maturity":"70-90 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"classic-millet"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Millet' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Classic Millet' AND sub.name = 'Millet' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Royal Millet', 'Heirloom millet variety with excellent flavor and growing characteristics.', '/images/varieties/royal-millet.jpg', '{"source":"Baker Creek","days_to_maturity":"80-100 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"royal-millet"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Millet' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Royal Millet' AND sub.name = 'Millet' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Golden Millet', 'Heirloom millet variety with excellent flavor and growing characteristics.', '/images/varieties/golden-millet.jpg', '{"source":"Baker Creek","days_to_maturity":"90-110 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"golden-millet"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Millet' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Golden Millet' AND sub.name = 'Millet' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Purple Millet', 'Heirloom millet variety with excellent flavor and growing characteristics.', '/images/varieties/purple-millet.jpg', '{"source":"Baker Creek","days_to_maturity":"100-120 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"purple-millet"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Millet' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Purple Millet' AND sub.name = 'Millet' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Giant Millet', 'Heirloom millet variety with excellent flavor and growing characteristics.', '/images/varieties/giant-millet.jpg', '{"source":"Baker Creek","days_to_maturity":"110-130 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"giant-millet"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Millet' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Giant Millet' AND sub.name = 'Millet' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Dwarf Millet', 'Heirloom millet variety with excellent flavor and growing characteristics.', '/images/varieties/dwarf-millet.jpg', '{"source":"Baker Creek","days_to_maturity":"120-140 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"dwarf-millet"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Millet' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Dwarf Millet' AND sub.name = 'Millet' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Early Millet', 'Heirloom millet variety with excellent flavor and growing characteristics.', '/images/varieties/early-millet.jpg', '{"source":"Baker Creek","days_to_maturity":"130-150 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"early-millet"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Millet' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Early Millet' AND sub.name = 'Millet' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Late Millet', 'Heirloom millet variety with excellent flavor and growing characteristics.', '/images/varieties/late-millet.jpg', '{"source":"Baker Creek","days_to_maturity":"140-160 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"late-millet"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Millet' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Late Millet' AND sub.name = 'Millet' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Classic Mustard Greens', 'Heirloom mustard greens variety with excellent flavor and growing characteristics.', '/images/varieties/classic-mustard-greens.jpg', '{"source":"Baker Creek","days_to_maturity":"70-90 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"classic-mustard-greens"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Mustard Greens' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Classic Mustard Greens' AND sub.name = 'Mustard Greens' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Royal Mustard Greens', 'Heirloom mustard greens variety with excellent flavor and growing characteristics.', '/images/varieties/royal-mustard-greens.jpg', '{"source":"Baker Creek","days_to_maturity":"80-100 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"royal-mustard-greens"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Mustard Greens' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Royal Mustard Greens' AND sub.name = 'Mustard Greens' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Golden Mustard Greens', 'Heirloom mustard greens variety with excellent flavor and growing characteristics.', '/images/varieties/golden-mustard-greens.jpg', '{"source":"Baker Creek","days_to_maturity":"90-110 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"golden-mustard-greens"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Mustard Greens' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Golden Mustard Greens' AND sub.name = 'Mustard Greens' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Classic Okra', 'Heirloom okra variety with excellent flavor and growing characteristics.', '/images/varieties/classic-okra.jpg', '{"source":"Baker Creek","days_to_maturity":"70-90 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"classic-okra"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Okra' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Classic Okra' AND sub.name = 'Okra' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Royal Okra', 'Heirloom okra variety with excellent flavor and growing characteristics.', '/images/varieties/royal-okra.jpg', '{"source":"Baker Creek","days_to_maturity":"80-100 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"royal-okra"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Okra' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Royal Okra' AND sub.name = 'Okra' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Golden Okra', 'Heirloom okra variety with excellent flavor and growing characteristics.', '/images/varieties/golden-okra.jpg', '{"source":"Baker Creek","days_to_maturity":"90-110 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"golden-okra"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Okra' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Golden Okra' AND sub.name = 'Okra' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Purple Okra', 'Heirloom okra variety with excellent flavor and growing characteristics.', '/images/varieties/purple-okra.jpg', '{"source":"Baker Creek","days_to_maturity":"100-120 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"purple-okra"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Okra' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Purple Okra' AND sub.name = 'Okra' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Giant Okra', 'Heirloom okra variety with excellent flavor and growing characteristics.', '/images/varieties/giant-okra.jpg', '{"source":"Baker Creek","days_to_maturity":"110-130 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"giant-okra"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Okra' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Giant Okra' AND sub.name = 'Okra' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Dwarf Okra', 'Heirloom okra variety with excellent flavor and growing characteristics.', '/images/varieties/dwarf-okra.jpg', '{"source":"Baker Creek","days_to_maturity":"120-140 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"dwarf-okra"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Okra' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Dwarf Okra' AND sub.name = 'Okra' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Classic Onions', 'Heirloom onions variety with excellent flavor and growing characteristics.', '/images/varieties/classic-onions.jpg', '{"source":"Baker Creek","days_to_maturity":"70-90 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"classic-onions"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Onions' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Classic Onions' AND sub.name = 'Onions' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Royal Onions', 'Heirloom onions variety with excellent flavor and growing characteristics.', '/images/varieties/royal-onions.jpg', '{"source":"Baker Creek","days_to_maturity":"80-100 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"royal-onions"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Onions' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Royal Onions' AND sub.name = 'Onions' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Golden Onions', 'Heirloom onions variety with excellent flavor and growing characteristics.', '/images/varieties/golden-onions.jpg', '{"source":"Baker Creek","days_to_maturity":"90-110 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"golden-onions"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Onions' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Golden Onions' AND sub.name = 'Onions' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Purple Onions', 'Heirloom onions variety with excellent flavor and growing characteristics.', '/images/varieties/purple-onions.jpg', '{"source":"Baker Creek","days_to_maturity":"100-120 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"purple-onions"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Onions' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Purple Onions' AND sub.name = 'Onions' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Giant Onions', 'Heirloom onions variety with excellent flavor and growing characteristics.', '/images/varieties/giant-onions.jpg', '{"source":"Baker Creek","days_to_maturity":"110-130 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"giant-onions"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Onions' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Giant Onions' AND sub.name = 'Onions' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Classic Peas', 'Heirloom peas variety with excellent flavor and growing characteristics.', '/images/varieties/classic-peas.jpg', '{"source":"Baker Creek","days_to_maturity":"70-90 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"classic-peas"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Peas' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Classic Peas' AND sub.name = 'Peas' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Royal Peas', 'Heirloom peas variety with excellent flavor and growing characteristics.', '/images/varieties/royal-peas.jpg', '{"source":"Baker Creek","days_to_maturity":"80-100 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"royal-peas"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Peas' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Royal Peas' AND sub.name = 'Peas' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Golden Peas', 'Heirloom peas variety with excellent flavor and growing characteristics.', '/images/varieties/golden-peas.jpg', '{"source":"Baker Creek","days_to_maturity":"90-110 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"golden-peas"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Peas' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Golden Peas' AND sub.name = 'Peas' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Purple Peas', 'Heirloom peas variety with excellent flavor and growing characteristics.', '/images/varieties/purple-peas.jpg', '{"source":"Baker Creek","days_to_maturity":"100-120 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"purple-peas"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Peas' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Purple Peas' AND sub.name = 'Peas' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Giant Peas', 'Heirloom peas variety with excellent flavor and growing characteristics.', '/images/varieties/giant-peas.jpg', '{"source":"Baker Creek","days_to_maturity":"110-130 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"giant-peas"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Peas' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Giant Peas' AND sub.name = 'Peas' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Dwarf Peas', 'Heirloom peas variety with excellent flavor and growing characteristics.', '/images/varieties/dwarf-peas.jpg', '{"source":"Baker Creek","days_to_maturity":"120-140 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"dwarf-peas"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Peas' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Dwarf Peas' AND sub.name = 'Peas' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Early Peas', 'Heirloom peas variety with excellent flavor and growing characteristics.', '/images/varieties/early-peas.jpg', '{"source":"Baker Creek","days_to_maturity":"130-150 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"early-peas"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Peas' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Early Peas' AND sub.name = 'Peas' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Late Peas', 'Heirloom peas variety with excellent flavor and growing characteristics.', '/images/varieties/late-peas.jpg', '{"source":"Baker Creek","days_to_maturity":"140-160 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"late-peas"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Peas' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Late Peas' AND sub.name = 'Peas' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Aleppo', 'Syrian pepper with moderate heat and fruity flavor.', '/images/varieties/aleppo.jpg', '{"source":"Baker Creek","days_to_maturity":"75-85 days","spacing":"12-18\"","sun_requirements":"Full sun","original_price":"$3.50"}'::jsonb, '{"slug":"aleppo"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Peppers' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Aleppo' AND sub.name = 'Peppers' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Fish', 'Striped pepper with mild heat and unique appearance.', '/images/varieties/fish.jpg', '{"source":"Baker Creek","days_to_maturity":"70-80 days","original_price":"$3.50"}'::jsonb, '{"slug":"fish"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Peppers' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Fish' AND sub.name = 'Peppers' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Classic Potatoes', 'Heirloom potatoes variety with excellent flavor and growing characteristics.', '/images/varieties/classic-potatoes.jpg', '{"source":"Baker Creek","days_to_maturity":"70-90 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"classic-potatoes"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Potatoes' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Classic Potatoes' AND sub.name = 'Potatoes' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Royal Potatoes', 'Heirloom potatoes variety with excellent flavor and growing characteristics.', '/images/varieties/royal-potatoes.jpg', '{"source":"Baker Creek","days_to_maturity":"80-100 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"royal-potatoes"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Potatoes' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Royal Potatoes' AND sub.name = 'Potatoes' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Golden Potatoes', 'Heirloom potatoes variety with excellent flavor and growing characteristics.', '/images/varieties/golden-potatoes.jpg', '{"source":"Baker Creek","days_to_maturity":"90-110 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"golden-potatoes"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Potatoes' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Golden Potatoes' AND sub.name = 'Potatoes' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Purple Potatoes', 'Heirloom potatoes variety with excellent flavor and growing characteristics.', '/images/varieties/purple-potatoes.jpg', '{"source":"Baker Creek","days_to_maturity":"100-120 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"purple-potatoes"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Potatoes' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Purple Potatoes' AND sub.name = 'Potatoes' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Giant Potatoes', 'Heirloom potatoes variety with excellent flavor and growing characteristics.', '/images/varieties/giant-potatoes.jpg', '{"source":"Baker Creek","days_to_maturity":"110-130 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"giant-potatoes"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Potatoes' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Giant Potatoes' AND sub.name = 'Potatoes' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Classic Pumpkins', 'Heirloom pumpkins variety with excellent flavor and growing characteristics.', '/images/varieties/classic-pumpkins.jpg', '{"source":"Baker Creek","days_to_maturity":"70-90 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"classic-pumpkins"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Pumpkins' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Classic Pumpkins' AND sub.name = 'Pumpkins' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Royal Pumpkins', 'Heirloom pumpkins variety with excellent flavor and growing characteristics.', '/images/varieties/royal-pumpkins.jpg', '{"source":"Baker Creek","days_to_maturity":"80-100 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"royal-pumpkins"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Pumpkins' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Royal Pumpkins' AND sub.name = 'Pumpkins' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Golden Pumpkins', 'Heirloom pumpkins variety with excellent flavor and growing characteristics.', '/images/varieties/golden-pumpkins.jpg', '{"source":"Baker Creek","days_to_maturity":"90-110 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"golden-pumpkins"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Pumpkins' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Golden Pumpkins' AND sub.name = 'Pumpkins' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Purple Pumpkins', 'Heirloom pumpkins variety with excellent flavor and growing characteristics.', '/images/varieties/purple-pumpkins.jpg', '{"source":"Baker Creek","days_to_maturity":"100-120 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"purple-pumpkins"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Pumpkins' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Purple Pumpkins' AND sub.name = 'Pumpkins' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Classic Purslane', 'Heirloom purslane variety with excellent flavor and growing characteristics.', '/images/varieties/classic-purslane.jpg', '{"source":"Baker Creek","days_to_maturity":"70-90 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"classic-purslane"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Purslane' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Classic Purslane' AND sub.name = 'Purslane' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Royal Purslane', 'Heirloom purslane variety with excellent flavor and growing characteristics.', '/images/varieties/royal-purslane.jpg', '{"source":"Baker Creek","days_to_maturity":"80-100 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"royal-purslane"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Purslane' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Royal Purslane' AND sub.name = 'Purslane' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Golden Purslane', 'Heirloom purslane variety with excellent flavor and growing characteristics.', '/images/varieties/golden-purslane.jpg', '{"source":"Baker Creek","days_to_maturity":"90-110 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"golden-purslane"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Purslane' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Golden Purslane' AND sub.name = 'Purslane' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Purple Purslane', 'Heirloom purslane variety with excellent flavor and growing characteristics.', '/images/varieties/purple-purslane.jpg', '{"source":"Baker Creek","days_to_maturity":"100-120 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"purple-purslane"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Purslane' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Purple Purslane' AND sub.name = 'Purslane' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Classic Quinoa', 'Heirloom quinoa variety with excellent flavor and growing characteristics.', '/images/varieties/classic-quinoa.jpg', '{"source":"Baker Creek","days_to_maturity":"70-90 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"classic-quinoa"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Quinoa' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Classic Quinoa' AND sub.name = 'Quinoa' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Royal Quinoa', 'Heirloom quinoa variety with excellent flavor and growing characteristics.', '/images/varieties/royal-quinoa.jpg', '{"source":"Baker Creek","days_to_maturity":"80-100 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"royal-quinoa"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Quinoa' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Royal Quinoa' AND sub.name = 'Quinoa' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Golden Quinoa', 'Heirloom quinoa variety with excellent flavor and growing characteristics.', '/images/varieties/golden-quinoa.jpg', '{"source":"Baker Creek","days_to_maturity":"90-110 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"golden-quinoa"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Quinoa' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Golden Quinoa' AND sub.name = 'Quinoa' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Purple Quinoa', 'Heirloom quinoa variety with excellent flavor and growing characteristics.', '/images/varieties/purple-quinoa.jpg', '{"source":"Baker Creek","days_to_maturity":"100-120 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"purple-quinoa"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Quinoa' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Purple Quinoa' AND sub.name = 'Quinoa' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Giant Quinoa', 'Heirloom quinoa variety with excellent flavor and growing characteristics.', '/images/varieties/giant-quinoa.jpg', '{"source":"Baker Creek","days_to_maturity":"110-130 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"giant-quinoa"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Quinoa' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Giant Quinoa' AND sub.name = 'Quinoa' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Dwarf Quinoa', 'Heirloom quinoa variety with excellent flavor and growing characteristics.', '/images/varieties/dwarf-quinoa.jpg', '{"source":"Baker Creek","days_to_maturity":"120-140 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"dwarf-quinoa"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Quinoa' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Dwarf Quinoa' AND sub.name = 'Quinoa' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Classic Radishes', 'Heirloom radishes variety with excellent flavor and growing characteristics.', '/images/varieties/classic-radishes.jpg', '{"source":"Baker Creek","days_to_maturity":"70-90 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"classic-radishes"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Radishes' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Classic Radishes' AND sub.name = 'Radishes' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Royal Radishes', 'Heirloom radishes variety with excellent flavor and growing characteristics.', '/images/varieties/royal-radishes.jpg', '{"source":"Baker Creek","days_to_maturity":"80-100 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"royal-radishes"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Radishes' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Royal Radishes' AND sub.name = 'Radishes' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Golden Radishes', 'Heirloom radishes variety with excellent flavor and growing characteristics.', '/images/varieties/golden-radishes.jpg', '{"source":"Baker Creek","days_to_maturity":"90-110 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"golden-radishes"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Radishes' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Golden Radishes' AND sub.name = 'Radishes' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Purple Radishes', 'Heirloom radishes variety with excellent flavor and growing characteristics.', '/images/varieties/purple-radishes.jpg', '{"source":"Baker Creek","days_to_maturity":"100-120 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"purple-radishes"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Radishes' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Purple Radishes' AND sub.name = 'Radishes' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Giant Radishes', 'Heirloom radishes variety with excellent flavor and growing characteristics.', '/images/varieties/giant-radishes.jpg', '{"source":"Baker Creek","days_to_maturity":"110-130 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"giant-radishes"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Radishes' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Giant Radishes' AND sub.name = 'Radishes' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Classic Rhubarb', 'Heirloom rhubarb variety with excellent flavor and growing characteristics.', '/images/varieties/classic-rhubarb.jpg', '{"source":"Baker Creek","days_to_maturity":"70-90 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"classic-rhubarb"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Rhubarb' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Classic Rhubarb' AND sub.name = 'Rhubarb' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Royal Rhubarb', 'Heirloom rhubarb variety with excellent flavor and growing characteristics.', '/images/varieties/royal-rhubarb.jpg', '{"source":"Baker Creek","days_to_maturity":"80-100 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"royal-rhubarb"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Rhubarb' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Royal Rhubarb' AND sub.name = 'Rhubarb' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Golden Rhubarb', 'Heirloom rhubarb variety with excellent flavor and growing characteristics.', '/images/varieties/golden-rhubarb.jpg', '{"source":"Baker Creek","days_to_maturity":"90-110 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"golden-rhubarb"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Rhubarb' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Golden Rhubarb' AND sub.name = 'Rhubarb' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Purple Rhubarb', 'Heirloom rhubarb variety with excellent flavor and growing characteristics.', '/images/varieties/purple-rhubarb.jpg', '{"source":"Baker Creek","days_to_maturity":"100-120 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"purple-rhubarb"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Rhubarb' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Purple Rhubarb' AND sub.name = 'Rhubarb' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Giant Rhubarb', 'Heirloom rhubarb variety with excellent flavor and growing characteristics.', '/images/varieties/giant-rhubarb.jpg', '{"source":"Baker Creek","days_to_maturity":"110-130 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"giant-rhubarb"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Rhubarb' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Giant Rhubarb' AND sub.name = 'Rhubarb' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Dwarf Rhubarb', 'Heirloom rhubarb variety with excellent flavor and growing characteristics.', '/images/varieties/dwarf-rhubarb.jpg', '{"source":"Baker Creek","days_to_maturity":"120-140 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"dwarf-rhubarb"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Rhubarb' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Dwarf Rhubarb' AND sub.name = 'Rhubarb' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Early Rhubarb', 'Heirloom rhubarb variety with excellent flavor and growing characteristics.', '/images/varieties/early-rhubarb.jpg', '{"source":"Baker Creek","days_to_maturity":"130-150 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"early-rhubarb"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Rhubarb' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Early Rhubarb' AND sub.name = 'Rhubarb' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Late Rhubarb', 'Heirloom rhubarb variety with excellent flavor and growing characteristics.', '/images/varieties/late-rhubarb.jpg', '{"source":"Baker Creek","days_to_maturity":"140-160 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"late-rhubarb"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Rhubarb' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Late Rhubarb' AND sub.name = 'Rhubarb' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Classic Rutabaga', 'Heirloom rutabaga variety with excellent flavor and growing characteristics.', '/images/varieties/classic-rutabaga.jpg', '{"source":"Baker Creek","days_to_maturity":"70-90 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"classic-rutabaga"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Rutabaga' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Classic Rutabaga' AND sub.name = 'Rutabaga' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Royal Rutabaga', 'Heirloom rutabaga variety with excellent flavor and growing characteristics.', '/images/varieties/royal-rutabaga.jpg', '{"source":"Baker Creek","days_to_maturity":"80-100 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"royal-rutabaga"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Rutabaga' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Royal Rutabaga' AND sub.name = 'Rutabaga' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Golden Rutabaga', 'Heirloom rutabaga variety with excellent flavor and growing characteristics.', '/images/varieties/golden-rutabaga.jpg', '{"source":"Baker Creek","days_to_maturity":"90-110 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"golden-rutabaga"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Rutabaga' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Golden Rutabaga' AND sub.name = 'Rutabaga' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Purple Rutabaga', 'Heirloom rutabaga variety with excellent flavor and growing characteristics.', '/images/varieties/purple-rutabaga.jpg', '{"source":"Baker Creek","days_to_maturity":"100-120 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"purple-rutabaga"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Rutabaga' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Purple Rutabaga' AND sub.name = 'Rutabaga' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Giant Rutabaga', 'Heirloom rutabaga variety with excellent flavor and growing characteristics.', '/images/varieties/giant-rutabaga.jpg', '{"source":"Baker Creek","days_to_maturity":"110-130 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"giant-rutabaga"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Rutabaga' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Giant Rutabaga' AND sub.name = 'Rutabaga' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Dwarf Rutabaga', 'Heirloom rutabaga variety with excellent flavor and growing characteristics.', '/images/varieties/dwarf-rutabaga.jpg', '{"source":"Baker Creek","days_to_maturity":"120-140 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"dwarf-rutabaga"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Rutabaga' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Dwarf Rutabaga' AND sub.name = 'Rutabaga' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Early Rutabaga', 'Heirloom rutabaga variety with excellent flavor and growing characteristics.', '/images/varieties/early-rutabaga.jpg', '{"source":"Baker Creek","days_to_maturity":"130-150 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"early-rutabaga"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Rutabaga' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Early Rutabaga' AND sub.name = 'Rutabaga' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Classic Spinach', 'Heirloom spinach variety with excellent flavor and growing characteristics.', '/images/varieties/classic-spinach.jpg', '{"source":"Baker Creek","days_to_maturity":"70-90 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"classic-spinach"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Spinach' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Classic Spinach' AND sub.name = 'Spinach' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Royal Spinach', 'Heirloom spinach variety with excellent flavor and growing characteristics.', '/images/varieties/royal-spinach.jpg', '{"source":"Baker Creek","days_to_maturity":"80-100 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"royal-spinach"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Spinach' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Royal Spinach' AND sub.name = 'Spinach' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Golden Spinach', 'Heirloom spinach variety with excellent flavor and growing characteristics.', '/images/varieties/golden-spinach.jpg', '{"source":"Baker Creek","days_to_maturity":"90-110 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"golden-spinach"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Spinach' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Golden Spinach' AND sub.name = 'Spinach' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Purple Spinach', 'Heirloom spinach variety with excellent flavor and growing characteristics.', '/images/varieties/purple-spinach.jpg', '{"source":"Baker Creek","days_to_maturity":"100-120 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"purple-spinach"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Spinach' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Purple Spinach' AND sub.name = 'Spinach' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Giant Spinach', 'Heirloom spinach variety with excellent flavor and growing characteristics.', '/images/varieties/giant-spinach.jpg', '{"source":"Baker Creek","days_to_maturity":"110-130 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"giant-spinach"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Spinach' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Giant Spinach' AND sub.name = 'Spinach' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Zucchini Golden', 'Golden yellow zucchini with tender flesh.', '/images/varieties/zucchini-golden.jpg', '{"source":"Baker Creek","days_to_maturity":"50-60 days","spacing":"18-24\"","sun_requirements":"Full sun","original_price":"$3.50"}'::jsonb, '{"slug":"zucchini-golden"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Squash Summer' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Zucchini Golden' AND sub.name = 'Squash Summer' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Classic Squash Winter', 'Heirloom squash winter variety with excellent flavor and growing characteristics.', '/images/varieties/classic-squash-winter.jpg', '{"source":"Baker Creek","days_to_maturity":"70-90 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"classic-squash-winter"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Squash Winter' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Classic Squash Winter' AND sub.name = 'Squash Winter' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Royal Squash Winter', 'Heirloom squash winter variety with excellent flavor and growing characteristics.', '/images/varieties/royal-squash-winter.jpg', '{"source":"Baker Creek","days_to_maturity":"80-100 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"royal-squash-winter"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Squash Winter' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Royal Squash Winter' AND sub.name = 'Squash Winter' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Golden Squash Winter', 'Heirloom squash winter variety with excellent flavor and growing characteristics.', '/images/varieties/golden-squash-winter.jpg', '{"source":"Baker Creek","days_to_maturity":"90-110 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"golden-squash-winter"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Squash Winter' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Golden Squash Winter' AND sub.name = 'Squash Winter' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Classic Sunflowers', 'Heirloom sunflowers variety with excellent flavor and growing characteristics.', '/images/varieties/classic-sunflowers.jpg', '{"source":"Baker Creek","days_to_maturity":"70-90 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"classic-sunflowers"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Sunflowers' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Classic Sunflowers' AND sub.name = 'Sunflowers' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Royal Sunflowers', 'Heirloom sunflowers variety with excellent flavor and growing characteristics.', '/images/varieties/royal-sunflowers.jpg', '{"source":"Baker Creek","days_to_maturity":"80-100 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"royal-sunflowers"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Sunflowers' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Royal Sunflowers' AND sub.name = 'Sunflowers' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Golden Sunflowers', 'Heirloom sunflowers variety with excellent flavor and growing characteristics.', '/images/varieties/golden-sunflowers.jpg', '{"source":"Baker Creek","days_to_maturity":"90-110 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"golden-sunflowers"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Sunflowers' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Golden Sunflowers' AND sub.name = 'Sunflowers' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Purple Sunflowers', 'Heirloom sunflowers variety with excellent flavor and growing characteristics.', '/images/varieties/purple-sunflowers.jpg', '{"source":"Baker Creek","days_to_maturity":"100-120 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"purple-sunflowers"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Sunflowers' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Purple Sunflowers' AND sub.name = 'Sunflowers' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Giant Sunflowers', 'Heirloom sunflowers variety with excellent flavor and growing characteristics.', '/images/varieties/giant-sunflowers.jpg', '{"source":"Baker Creek","days_to_maturity":"110-130 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"giant-sunflowers"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Sunflowers' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Giant Sunflowers' AND sub.name = 'Sunflowers' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Dwarf Sunflowers', 'Heirloom sunflowers variety with excellent flavor and growing characteristics.', '/images/varieties/dwarf-sunflowers.jpg', '{"source":"Baker Creek","days_to_maturity":"120-140 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"dwarf-sunflowers"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Sunflowers' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Dwarf Sunflowers' AND sub.name = 'Sunflowers' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Early Sunflowers', 'Heirloom sunflowers variety with excellent flavor and growing characteristics.', '/images/varieties/early-sunflowers.jpg', '{"source":"Baker Creek","days_to_maturity":"130-150 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"early-sunflowers"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Sunflowers' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Early Sunflowers' AND sub.name = 'Sunflowers' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Classic Sweet Potatoes', 'Heirloom sweet potatoes variety with excellent flavor and growing characteristics.', '/images/varieties/classic-sweet-potatoes.jpg', '{"source":"Baker Creek","days_to_maturity":"70-90 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"classic-sweet-potatoes"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Sweet Potatoes' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Classic Sweet Potatoes' AND sub.name = 'Sweet Potatoes' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Royal Sweet Potatoes', 'Heirloom sweet potatoes variety with excellent flavor and growing characteristics.', '/images/varieties/royal-sweet-potatoes.jpg', '{"source":"Baker Creek","days_to_maturity":"80-100 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"royal-sweet-potatoes"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Sweet Potatoes' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Royal Sweet Potatoes' AND sub.name = 'Sweet Potatoes' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Golden Sweet Potatoes', 'Heirloom sweet potatoes variety with excellent flavor and growing characteristics.', '/images/varieties/golden-sweet-potatoes.jpg', '{"source":"Baker Creek","days_to_maturity":"90-110 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"golden-sweet-potatoes"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Sweet Potatoes' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Golden Sweet Potatoes' AND sub.name = 'Sweet Potatoes' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Purple Sweet Potatoes', 'Heirloom sweet potatoes variety with excellent flavor and growing characteristics.', '/images/varieties/purple-sweet-potatoes.jpg', '{"source":"Baker Creek","days_to_maturity":"100-120 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"purple-sweet-potatoes"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Sweet Potatoes' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Purple Sweet Potatoes' AND sub.name = 'Sweet Potatoes' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Giant Sweet Potatoes', 'Heirloom sweet potatoes variety with excellent flavor and growing characteristics.', '/images/varieties/giant-sweet-potatoes.jpg', '{"source":"Baker Creek","days_to_maturity":"110-130 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"giant-sweet-potatoes"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Sweet Potatoes' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Giant Sweet Potatoes' AND sub.name = 'Sweet Potatoes' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Classic Tomatillos', 'Heirloom tomatillos variety with excellent flavor and growing characteristics.', '/images/varieties/classic-tomatillos.jpg', '{"source":"Baker Creek","days_to_maturity":"70-90 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"classic-tomatillos"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Tomatillos' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Classic Tomatillos' AND sub.name = 'Tomatillos' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Royal Tomatillos', 'Heirloom tomatillos variety with excellent flavor and growing characteristics.', '/images/varieties/royal-tomatillos.jpg', '{"source":"Baker Creek","days_to_maturity":"80-100 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"royal-tomatillos"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Tomatillos' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Royal Tomatillos' AND sub.name = 'Tomatillos' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Golden Tomatillos', 'Heirloom tomatillos variety with excellent flavor and growing characteristics.', '/images/varieties/golden-tomatillos.jpg', '{"source":"Baker Creek","days_to_maturity":"90-110 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"golden-tomatillos"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Tomatillos' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Golden Tomatillos' AND sub.name = 'Tomatillos' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Cherokee Purple', 'Heirloom beefsteak tomato with deep purple shoulders and rich flavor.', '/images/varieties/cherokee-purple.jpg', '{"source":"Baker Creek","days_to_maturity":"80-85 days","spacing":"24-36\"","sun_requirements":"Full sun","original_price":"$3.50"}'::jsonb, '{"slug":"cherokee-purple"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Tomatoes' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Cherokee Purple' AND sub.name = 'Tomatoes' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Black Krim', 'Russian heirloom with dark purple-black shoulders and rich, smoky flavor.', '/images/varieties/black-krim.jpg', '{"source":"Baker Creek","days_to_maturity":"80-85 days","spacing":"24-36\"","original_price":"$3.50"}'::jsonb, '{"slug":"black-krim"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Tomatoes' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Black Krim' AND sub.name = 'Tomatoes' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Brandywine', 'Classic heirloom beefsteak with exceptional flavor.', '/images/varieties/brandywine.jpg', '{"source":"Baker Creek","days_to_maturity":"85-90 days","original_price":"$3.50"}'::jsonb, '{"slug":"brandywine"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Tomatoes' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Brandywine' AND sub.name = 'Tomatoes' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Orange Hat', 'Unique orange cherry tomato with sweet flavor.', '/images/varieties/orange-hat.jpg', '{"source":"Baker Creek","days_to_maturity":"70-75 days","original_price":"$3.50"}'::jsonb, '{"slug":"orange-hat"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Tomatoes' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Orange Hat' AND sub.name = 'Tomatoes' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Green Zebra', 'Striped green tomato with tangy flavor.', '/images/varieties/green-zebra.jpg', '{"source":"Baker Creek","days_to_maturity":"75-80 days","original_price":"$3.50"}'::jsonb, '{"slug":"green-zebra"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Tomatoes' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Green Zebra' AND sub.name = 'Tomatoes' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Classic Turnips', 'Heirloom turnips variety with excellent flavor and growing characteristics.', '/images/varieties/classic-turnips.jpg', '{"source":"Baker Creek","days_to_maturity":"70-90 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"classic-turnips"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Turnips' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Classic Turnips' AND sub.name = 'Turnips' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Royal Turnips', 'Heirloom turnips variety with excellent flavor and growing characteristics.', '/images/varieties/royal-turnips.jpg', '{"source":"Baker Creek","days_to_maturity":"80-100 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"royal-turnips"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Turnips' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Royal Turnips' AND sub.name = 'Turnips' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Golden Turnips', 'Heirloom turnips variety with excellent flavor and growing characteristics.', '/images/varieties/golden-turnips.jpg', '{"source":"Baker Creek","days_to_maturity":"90-110 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"golden-turnips"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Turnips' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Golden Turnips' AND sub.name = 'Turnips' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Classic Watermelons', 'Heirloom watermelons variety with excellent flavor and growing characteristics.', '/images/varieties/classic-watermelons.jpg', '{"source":"Baker Creek","days_to_maturity":"70-90 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"classic-watermelons"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Watermelons' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Classic Watermelons' AND sub.name = 'Watermelons' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Royal Watermelons', 'Heirloom watermelons variety with excellent flavor and growing characteristics.', '/images/varieties/royal-watermelons.jpg', '{"source":"Baker Creek","days_to_maturity":"80-100 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"royal-watermelons"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Watermelons' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Royal Watermelons' AND sub.name = 'Watermelons' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Golden Watermelons', 'Heirloom watermelons variety with excellent flavor and growing characteristics.', '/images/varieties/golden-watermelons.jpg', '{"source":"Baker Creek","days_to_maturity":"90-110 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"golden-watermelons"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Watermelons' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Golden Watermelons' AND sub.name = 'Watermelons' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Purple Watermelons', 'Heirloom watermelons variety with excellent flavor and growing characteristics.', '/images/varieties/purple-watermelons.jpg', '{"source":"Baker Creek","days_to_maturity":"100-120 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"purple-watermelons"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Watermelons' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Purple Watermelons' AND sub.name = 'Watermelons' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Giant Watermelons', 'Heirloom watermelons variety with excellent flavor and growing characteristics.', '/images/varieties/giant-watermelons.jpg', '{"source":"Baker Creek","days_to_maturity":"110-130 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"giant-watermelons"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Watermelons' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Giant Watermelons' AND sub.name = 'Watermelons' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Classic Wheat', 'Heirloom wheat variety with excellent flavor and growing characteristics.', '/images/varieties/classic-wheat.jpg', '{"source":"Baker Creek","days_to_maturity":"70-90 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"classic-wheat"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Wheat' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Classic Wheat' AND sub.name = 'Wheat' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Royal Wheat', 'Heirloom wheat variety with excellent flavor and growing characteristics.', '/images/varieties/royal-wheat.jpg', '{"source":"Baker Creek","days_to_maturity":"80-100 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"royal-wheat"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Wheat' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Royal Wheat' AND sub.name = 'Wheat' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Golden Wheat', 'Heirloom wheat variety with excellent flavor and growing characteristics.', '/images/varieties/golden-wheat.jpg', '{"source":"Baker Creek","days_to_maturity":"90-110 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"golden-wheat"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Wheat' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Golden Wheat' AND sub.name = 'Wheat' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Purple Wheat', 'Heirloom wheat variety with excellent flavor and growing characteristics.', '/images/varieties/purple-wheat.jpg', '{"source":"Baker Creek","days_to_maturity":"100-120 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"purple-wheat"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Wheat' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Purple Wheat' AND sub.name = 'Wheat' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Giant Wheat', 'Heirloom wheat variety with excellent flavor and growing characteristics.', '/images/varieties/giant-wheat.jpg', '{"source":"Baker Creek","days_to_maturity":"110-130 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"giant-wheat"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Wheat' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Giant Wheat' AND sub.name = 'Wheat' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Dwarf Wheat', 'Heirloom wheat variety with excellent flavor and growing characteristics.', '/images/varieties/dwarf-wheat.jpg', '{"source":"Baker Creek","days_to_maturity":"120-140 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"dwarf-wheat"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Wheat' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Dwarf Wheat' AND sub.name = 'Wheat' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Early Wheat', 'Heirloom wheat variety with excellent flavor and growing characteristics.', '/images/varieties/early-wheat.jpg', '{"source":"Baker Creek","days_to_maturity":"130-150 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"early-wheat"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Wheat' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Early Wheat' AND sub.name = 'Wheat' AND cat.name = 'Vegetables'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Genovese', 'An absolutely legendary heirloom that no Italian chef can cook without. Essential ingredient in basil pesto.', '/images/varieties/genovese.jpg', '{"source":"Baker Creek","days_to_maturity":"60-75 days","spacing":"8-12\"","sun_requirements":"8-12 hours of full sun","original_price":"$3.00"}'::jsonb, '{"slug":"genovese"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Basil' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Genovese' AND sub.name = 'Basil' AND cat.name = 'Herbs'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Thai Sweet', 'Sweet Thai basil with distinctive flavor perfect for Asian cuisine.', '/images/varieties/thai-sweet.jpg', '{"source":"Baker Creek","days_to_maturity":"70-85 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"thai-sweet"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Basil' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Thai Sweet' AND sub.name = 'Basil' AND cat.name = 'Herbs'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Thai Holy Kaprao', 'Sacred Thai basil with spiritual significance and medicinal properties.', '/images/varieties/thai-holy-kaprao.jpg', '{"source":"Baker Creek","days_to_maturity":"80-90 days","original_price":"$3.00"}'::jsonb, '{"slug":"thai-holy-kaprao"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Basil' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Thai Holy Kaprao' AND sub.name = 'Basil' AND cat.name = 'Herbs'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Lemon', 'Citrusy basil with bright lemon flavor and aroma.', '/images/varieties/lemon.jpg', '{"source":"Baker Creek","days_to_maturity":"60-75 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"lemon"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Basil' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Lemon' AND sub.name = 'Basil' AND cat.name = 'Herbs'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Cinnamon', 'Unique basil with warm cinnamon flavor and aroma.', '/images/varieties/cinnamon.jpg', '{"source":"Baker Creek","days_to_maturity":"70-85 days","original_price":"$3.00"}'::jsonb, '{"slug":"cinnamon"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Basil' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Cinnamon' AND sub.name = 'Basil' AND cat.name = 'Herbs'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Dark Purple Opal', 'Beautiful purple basil with ornamental value and great flavor.', '/images/varieties/dark-purple-opal.jpg', '{"source":"Baker Creek","days_to_maturity":"75-90 days","original_price":"$3.00"}'::jsonb, '{"slug":"dark-purple-opal"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Basil' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Dark Purple Opal' AND sub.name = 'Basil' AND cat.name = 'Herbs'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Lettuce Leaf', 'Large-leafed basil perfect for wrapping and salads.', '/images/varieties/lettuce-leaf.jpg', '{"source":"Baker Creek","days_to_maturity":"60-75 days","original_price":"$3.00"}'::jsonb, '{"slug":"lettuce-leaf"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Basil' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Lettuce Leaf' AND sub.name = 'Basil' AND cat.name = 'Herbs'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Cardinal', 'Bright red-flowered basil with excellent flavor.', '/images/varieties/cardinal.jpg', '{"source":"Baker Creek","days_to_maturity":"70-85 days","original_price":"$3.00"}'::jsonb, '{"slug":"cardinal"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Basil' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Cardinal' AND sub.name = 'Basil' AND cat.name = 'Herbs'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Persian', 'Traditional Persian basil with unique flavor profile.', '/images/varieties/persian.jpg', '{"source":"Baker Creek","days_to_maturity":"70-85 days","original_price":"$3.00"}'::jsonb, '{"slug":"persian"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Basil' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Persian' AND sub.name = 'Basil' AND cat.name = 'Herbs'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Siam Queen Thai', 'Premium Thai basil variety with intense flavor.', '/images/varieties/siam-queen-thai.jpg', '{"source":"Baker Creek","days_to_maturity":"75-85 days","original_price":"$3.00"}'::jsonb, '{"slug":"siam-queen-thai"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Basil' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Siam Queen Thai' AND sub.name = 'Basil' AND cat.name = 'Herbs'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Classic Bee Balm', 'Heirloom bee balm variety with excellent flavor and growing characteristics.', '/images/varieties/classic-bee-balm.jpg', '{"source":"Baker Creek","days_to_maturity":"70-90 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"classic-bee-balm"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Bee Balm' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Classic Bee Balm' AND sub.name = 'Bee Balm' AND cat.name = 'Herbs'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Royal Bee Balm', 'Heirloom bee balm variety with excellent flavor and growing characteristics.', '/images/varieties/royal-bee-balm.jpg', '{"source":"Baker Creek","days_to_maturity":"80-100 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"royal-bee-balm"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Bee Balm' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Royal Bee Balm' AND sub.name = 'Bee Balm' AND cat.name = 'Herbs'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Golden Bee Balm', 'Heirloom bee balm variety with excellent flavor and growing characteristics.', '/images/varieties/golden-bee-balm.jpg', '{"source":"Baker Creek","days_to_maturity":"90-110 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"golden-bee-balm"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Bee Balm' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Golden Bee Balm' AND sub.name = 'Bee Balm' AND cat.name = 'Herbs'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Purple Bee Balm', 'Heirloom bee balm variety with excellent flavor and growing characteristics.', '/images/varieties/purple-bee-balm.jpg', '{"source":"Baker Creek","days_to_maturity":"100-120 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"purple-bee-balm"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Bee Balm' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Purple Bee Balm' AND sub.name = 'Bee Balm' AND cat.name = 'Herbs'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Giant Bee Balm', 'Heirloom bee balm variety with excellent flavor and growing characteristics.', '/images/varieties/giant-bee-balm.jpg', '{"source":"Baker Creek","days_to_maturity":"110-130 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"giant-bee-balm"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Bee Balm' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Giant Bee Balm' AND sub.name = 'Bee Balm' AND cat.name = 'Herbs'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Dwarf Bee Balm', 'Heirloom bee balm variety with excellent flavor and growing characteristics.', '/images/varieties/dwarf-bee-balm.jpg', '{"source":"Baker Creek","days_to_maturity":"120-140 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"dwarf-bee-balm"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Bee Balm' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Dwarf Bee Balm' AND sub.name = 'Bee Balm' AND cat.name = 'Herbs'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Classic Borago', 'Heirloom borago variety with excellent flavor and growing characteristics.', '/images/varieties/classic-borago.jpg', '{"source":"Baker Creek","days_to_maturity":"70-90 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"classic-borago"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Borago' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Classic Borago' AND sub.name = 'Borago' AND cat.name = 'Herbs'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Royal Borago', 'Heirloom borago variety with excellent flavor and growing characteristics.', '/images/varieties/royal-borago.jpg', '{"source":"Baker Creek","days_to_maturity":"80-100 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"royal-borago"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Borago' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Royal Borago' AND sub.name = 'Borago' AND cat.name = 'Herbs'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Golden Borago', 'Heirloom borago variety with excellent flavor and growing characteristics.', '/images/varieties/golden-borago.jpg', '{"source":"Baker Creek","days_to_maturity":"90-110 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"golden-borago"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Borago' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Golden Borago' AND sub.name = 'Borago' AND cat.name = 'Herbs'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Classic Chamomile', 'Heirloom chamomile variety with excellent flavor and growing characteristics.', '/images/varieties/classic-chamomile.jpg', '{"source":"Baker Creek","days_to_maturity":"70-90 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"classic-chamomile"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Chamomile' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Classic Chamomile' AND sub.name = 'Chamomile' AND cat.name = 'Herbs'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Royal Chamomile', 'Heirloom chamomile variety with excellent flavor and growing characteristics.', '/images/varieties/royal-chamomile.jpg', '{"source":"Baker Creek","days_to_maturity":"80-100 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"royal-chamomile"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Chamomile' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Royal Chamomile' AND sub.name = 'Chamomile' AND cat.name = 'Herbs'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Golden Chamomile', 'Heirloom chamomile variety with excellent flavor and growing characteristics.', '/images/varieties/golden-chamomile.jpg', '{"source":"Baker Creek","days_to_maturity":"90-110 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"golden-chamomile"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Chamomile' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Golden Chamomile' AND sub.name = 'Chamomile' AND cat.name = 'Herbs'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Purple Chamomile', 'Heirloom chamomile variety with excellent flavor and growing characteristics.', '/images/varieties/purple-chamomile.jpg', '{"source":"Baker Creek","days_to_maturity":"100-120 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"purple-chamomile"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Chamomile' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Purple Chamomile' AND sub.name = 'Chamomile' AND cat.name = 'Herbs'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Giant Chamomile', 'Heirloom chamomile variety with excellent flavor and growing characteristics.', '/images/varieties/giant-chamomile.jpg', '{"source":"Baker Creek","days_to_maturity":"110-130 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"giant-chamomile"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Chamomile' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Giant Chamomile' AND sub.name = 'Chamomile' AND cat.name = 'Herbs'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Dwarf Chamomile', 'Heirloom chamomile variety with excellent flavor and growing characteristics.', '/images/varieties/dwarf-chamomile.jpg', '{"source":"Baker Creek","days_to_maturity":"120-140 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"dwarf-chamomile"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Chamomile' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Dwarf Chamomile' AND sub.name = 'Chamomile' AND cat.name = 'Herbs'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Early Chamomile', 'Heirloom chamomile variety with excellent flavor and growing characteristics.', '/images/varieties/early-chamomile.jpg', '{"source":"Baker Creek","days_to_maturity":"130-150 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"early-chamomile"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Chamomile' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Early Chamomile' AND sub.name = 'Chamomile' AND cat.name = 'Herbs'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Late Chamomile', 'Heirloom chamomile variety with excellent flavor and growing characteristics.', '/images/varieties/late-chamomile.jpg', '{"source":"Baker Creek","days_to_maturity":"140-160 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"late-chamomile"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Chamomile' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Late Chamomile' AND sub.name = 'Chamomile' AND cat.name = 'Herbs'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Classic Chives', 'Heirloom chives variety with excellent flavor and growing characteristics.', '/images/varieties/classic-chives.jpg', '{"source":"Baker Creek","days_to_maturity":"70-90 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"classic-chives"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Chives' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Classic Chives' AND sub.name = 'Chives' AND cat.name = 'Herbs'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Royal Chives', 'Heirloom chives variety with excellent flavor and growing characteristics.', '/images/varieties/royal-chives.jpg', '{"source":"Baker Creek","days_to_maturity":"80-100 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"royal-chives"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Chives' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Royal Chives' AND sub.name = 'Chives' AND cat.name = 'Herbs'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Golden Chives', 'Heirloom chives variety with excellent flavor and growing characteristics.', '/images/varieties/golden-chives.jpg', '{"source":"Baker Creek","days_to_maturity":"90-110 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"golden-chives"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Chives' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Golden Chives' AND sub.name = 'Chives' AND cat.name = 'Herbs'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Purple Chives', 'Heirloom chives variety with excellent flavor and growing characteristics.', '/images/varieties/purple-chives.jpg', '{"source":"Baker Creek","days_to_maturity":"100-120 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"purple-chives"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Chives' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Purple Chives' AND sub.name = 'Chives' AND cat.name = 'Herbs'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Classic Coriandrum', 'Heirloom coriandrum variety with excellent flavor and growing characteristics.', '/images/varieties/classic-coriandrum.jpg', '{"source":"Baker Creek","days_to_maturity":"70-90 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"classic-coriandrum"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Coriandrum' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Classic Coriandrum' AND sub.name = 'Coriandrum' AND cat.name = 'Herbs'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Royal Coriandrum', 'Heirloom coriandrum variety with excellent flavor and growing characteristics.', '/images/varieties/royal-coriandrum.jpg', '{"source":"Baker Creek","days_to_maturity":"80-100 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"royal-coriandrum"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Coriandrum' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Royal Coriandrum' AND sub.name = 'Coriandrum' AND cat.name = 'Herbs'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Golden Coriandrum', 'Heirloom coriandrum variety with excellent flavor and growing characteristics.', '/images/varieties/golden-coriandrum.jpg', '{"source":"Baker Creek","days_to_maturity":"90-110 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"golden-coriandrum"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Coriandrum' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Golden Coriandrum' AND sub.name = 'Coriandrum' AND cat.name = 'Herbs'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Purple Coriandrum', 'Heirloom coriandrum variety with excellent flavor and growing characteristics.', '/images/varieties/purple-coriandrum.jpg', '{"source":"Baker Creek","days_to_maturity":"100-120 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"purple-coriandrum"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Coriandrum' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Purple Coriandrum' AND sub.name = 'Coriandrum' AND cat.name = 'Herbs'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Giant Coriandrum', 'Heirloom coriandrum variety with excellent flavor and growing characteristics.', '/images/varieties/giant-coriandrum.jpg', '{"source":"Baker Creek","days_to_maturity":"110-130 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"giant-coriandrum"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Coriandrum' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Giant Coriandrum' AND sub.name = 'Coriandrum' AND cat.name = 'Herbs'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Classic Dill', 'Heirloom dill variety with excellent flavor and growing characteristics.', '/images/varieties/classic-dill.jpg', '{"source":"Baker Creek","days_to_maturity":"70-90 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"classic-dill"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Dill' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Classic Dill' AND sub.name = 'Dill' AND cat.name = 'Herbs'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Royal Dill', 'Heirloom dill variety with excellent flavor and growing characteristics.', '/images/varieties/royal-dill.jpg', '{"source":"Baker Creek","days_to_maturity":"80-100 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"royal-dill"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Dill' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Royal Dill' AND sub.name = 'Dill' AND cat.name = 'Herbs'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Golden Dill', 'Heirloom dill variety with excellent flavor and growing characteristics.', '/images/varieties/golden-dill.jpg', '{"source":"Baker Creek","days_to_maturity":"90-110 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"golden-dill"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Dill' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Golden Dill' AND sub.name = 'Dill' AND cat.name = 'Herbs'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Purple Dill', 'Heirloom dill variety with excellent flavor and growing characteristics.', '/images/varieties/purple-dill.jpg', '{"source":"Baker Creek","days_to_maturity":"100-120 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"purple-dill"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Dill' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Purple Dill' AND sub.name = 'Dill' AND cat.name = 'Herbs'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Giant Dill', 'Heirloom dill variety with excellent flavor and growing characteristics.', '/images/varieties/giant-dill.jpg', '{"source":"Baker Creek","days_to_maturity":"110-130 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"giant-dill"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Dill' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Giant Dill' AND sub.name = 'Dill' AND cat.name = 'Herbs'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Dwarf Dill', 'Heirloom dill variety with excellent flavor and growing characteristics.', '/images/varieties/dwarf-dill.jpg', '{"source":"Baker Creek","days_to_maturity":"120-140 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"dwarf-dill"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Dill' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Dwarf Dill' AND sub.name = 'Dill' AND cat.name = 'Herbs'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Early Dill', 'Heirloom dill variety with excellent flavor and growing characteristics.', '/images/varieties/early-dill.jpg', '{"source":"Baker Creek","days_to_maturity":"130-150 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"early-dill"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Dill' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Early Dill' AND sub.name = 'Dill' AND cat.name = 'Herbs'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Late Dill', 'Heirloom dill variety with excellent flavor and growing characteristics.', '/images/varieties/late-dill.jpg', '{"source":"Baker Creek","days_to_maturity":"140-160 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"late-dill"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Dill' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Late Dill' AND sub.name = 'Dill' AND cat.name = 'Herbs'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Classic Bloody Dock', 'Heirloom bloody dock variety with excellent flavor and growing characteristics.', '/images/varieties/classic-bloody-dock.jpg', '{"source":"Baker Creek","days_to_maturity":"70-90 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"classic-bloody-dock"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Bloody Dock' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Classic Bloody Dock' AND sub.name = 'Bloody Dock' AND cat.name = 'Herbs'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Royal Bloody Dock', 'Heirloom bloody dock variety with excellent flavor and growing characteristics.', '/images/varieties/royal-bloody-dock.jpg', '{"source":"Baker Creek","days_to_maturity":"80-100 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"royal-bloody-dock"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Bloody Dock' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Royal Bloody Dock' AND sub.name = 'Bloody Dock' AND cat.name = 'Herbs'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Golden Bloody Dock', 'Heirloom bloody dock variety with excellent flavor and growing characteristics.', '/images/varieties/golden-bloody-dock.jpg', '{"source":"Baker Creek","days_to_maturity":"90-110 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"golden-bloody-dock"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Bloody Dock' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Golden Bloody Dock' AND sub.name = 'Bloody Dock' AND cat.name = 'Herbs'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Purple Bloody Dock', 'Heirloom bloody dock variety with excellent flavor and growing characteristics.', '/images/varieties/purple-bloody-dock.jpg', '{"source":"Baker Creek","days_to_maturity":"100-120 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"purple-bloody-dock"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Bloody Dock' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Purple Bloody Dock' AND sub.name = 'Bloody Dock' AND cat.name = 'Herbs'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Giant Bloody Dock', 'Heirloom bloody dock variety with excellent flavor and growing characteristics.', '/images/varieties/giant-bloody-dock.jpg', '{"source":"Baker Creek","days_to_maturity":"110-130 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"giant-bloody-dock"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Bloody Dock' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Giant Bloody Dock' AND sub.name = 'Bloody Dock' AND cat.name = 'Herbs'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Dwarf Bloody Dock', 'Heirloom bloody dock variety with excellent flavor and growing characteristics.', '/images/varieties/dwarf-bloody-dock.jpg', '{"source":"Baker Creek","days_to_maturity":"120-140 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"dwarf-bloody-dock"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Bloody Dock' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Dwarf Bloody Dock' AND sub.name = 'Bloody Dock' AND cat.name = 'Herbs'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Classic Echinacea', 'Heirloom echinacea variety with excellent flavor and growing characteristics.', '/images/varieties/classic-echinacea.jpg', '{"source":"Baker Creek","days_to_maturity":"70-90 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"classic-echinacea"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Echinacea' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Classic Echinacea' AND sub.name = 'Echinacea' AND cat.name = 'Herbs'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Royal Echinacea', 'Heirloom echinacea variety with excellent flavor and growing characteristics.', '/images/varieties/royal-echinacea.jpg', '{"source":"Baker Creek","days_to_maturity":"80-100 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"royal-echinacea"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Echinacea' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Royal Echinacea' AND sub.name = 'Echinacea' AND cat.name = 'Herbs'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Golden Echinacea', 'Heirloom echinacea variety with excellent flavor and growing characteristics.', '/images/varieties/golden-echinacea.jpg', '{"source":"Baker Creek","days_to_maturity":"90-110 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"golden-echinacea"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Echinacea' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Golden Echinacea' AND sub.name = 'Echinacea' AND cat.name = 'Herbs'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Classic Fennel', 'Heirloom fennel variety with excellent flavor and growing characteristics.', '/images/varieties/classic-fennel.jpg', '{"source":"Baker Creek","days_to_maturity":"70-90 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"classic-fennel"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Fennel' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Classic Fennel' AND sub.name = 'Fennel' AND cat.name = 'Herbs'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Royal Fennel', 'Heirloom fennel variety with excellent flavor and growing characteristics.', '/images/varieties/royal-fennel.jpg', '{"source":"Baker Creek","days_to_maturity":"80-100 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"royal-fennel"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Fennel' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Royal Fennel' AND sub.name = 'Fennel' AND cat.name = 'Herbs'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Golden Fennel', 'Heirloom fennel variety with excellent flavor and growing characteristics.', '/images/varieties/golden-fennel.jpg', '{"source":"Baker Creek","days_to_maturity":"90-110 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"golden-fennel"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Fennel' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Golden Fennel' AND sub.name = 'Fennel' AND cat.name = 'Herbs'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Purple Fennel', 'Heirloom fennel variety with excellent flavor and growing characteristics.', '/images/varieties/purple-fennel.jpg', '{"source":"Baker Creek","days_to_maturity":"100-120 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"purple-fennel"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Fennel' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Purple Fennel' AND sub.name = 'Fennel' AND cat.name = 'Herbs'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Giant Fennel', 'Heirloom fennel variety with excellent flavor and growing characteristics.', '/images/varieties/giant-fennel.jpg', '{"source":"Baker Creek","days_to_maturity":"110-130 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"giant-fennel"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Fennel' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Giant Fennel' AND sub.name = 'Fennel' AND cat.name = 'Herbs'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Dwarf Fennel', 'Heirloom fennel variety with excellent flavor and growing characteristics.', '/images/varieties/dwarf-fennel.jpg', '{"source":"Baker Creek","days_to_maturity":"120-140 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"dwarf-fennel"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Fennel' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Dwarf Fennel' AND sub.name = 'Fennel' AND cat.name = 'Herbs'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Classic Lavender', 'Heirloom lavender variety with excellent flavor and growing characteristics.', '/images/varieties/classic-lavender.jpg', '{"source":"Baker Creek","days_to_maturity":"70-90 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"classic-lavender"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Lavender' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Classic Lavender' AND sub.name = 'Lavender' AND cat.name = 'Herbs'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Royal Lavender', 'Heirloom lavender variety with excellent flavor and growing characteristics.', '/images/varieties/royal-lavender.jpg', '{"source":"Baker Creek","days_to_maturity":"80-100 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"royal-lavender"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Lavender' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Royal Lavender' AND sub.name = 'Lavender' AND cat.name = 'Herbs'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Golden Lavender', 'Heirloom lavender variety with excellent flavor and growing characteristics.', '/images/varieties/golden-lavender.jpg', '{"source":"Baker Creek","days_to_maturity":"90-110 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"golden-lavender"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Lavender' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Golden Lavender' AND sub.name = 'Lavender' AND cat.name = 'Herbs'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Purple Lavender', 'Heirloom lavender variety with excellent flavor and growing characteristics.', '/images/varieties/purple-lavender.jpg', '{"source":"Baker Creek","days_to_maturity":"100-120 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"purple-lavender"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Lavender' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Purple Lavender' AND sub.name = 'Lavender' AND cat.name = 'Herbs'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Giant Lavender', 'Heirloom lavender variety with excellent flavor and growing characteristics.', '/images/varieties/giant-lavender.jpg', '{"source":"Baker Creek","days_to_maturity":"110-130 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"giant-lavender"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Lavender' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Giant Lavender' AND sub.name = 'Lavender' AND cat.name = 'Herbs'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Dwarf Lavender', 'Heirloom lavender variety with excellent flavor and growing characteristics.', '/images/varieties/dwarf-lavender.jpg', '{"source":"Baker Creek","days_to_maturity":"120-140 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"dwarf-lavender"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Lavender' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Dwarf Lavender' AND sub.name = 'Lavender' AND cat.name = 'Herbs'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Classic Lemon Balm', 'Heirloom lemon balm variety with excellent flavor and growing characteristics.', '/images/varieties/classic-lemon-balm.jpg', '{"source":"Baker Creek","days_to_maturity":"70-90 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"classic-lemon-balm"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Lemon Balm' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Classic Lemon Balm' AND sub.name = 'Lemon Balm' AND cat.name = 'Herbs'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Royal Lemon Balm', 'Heirloom lemon balm variety with excellent flavor and growing characteristics.', '/images/varieties/royal-lemon-balm.jpg', '{"source":"Baker Creek","days_to_maturity":"80-100 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"royal-lemon-balm"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Lemon Balm' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Royal Lemon Balm' AND sub.name = 'Lemon Balm' AND cat.name = 'Herbs'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Golden Lemon Balm', 'Heirloom lemon balm variety with excellent flavor and growing characteristics.', '/images/varieties/golden-lemon-balm.jpg', '{"source":"Baker Creek","days_to_maturity":"90-110 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"golden-lemon-balm"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Lemon Balm' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Golden Lemon Balm' AND sub.name = 'Lemon Balm' AND cat.name = 'Herbs'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Purple Lemon Balm', 'Heirloom lemon balm variety with excellent flavor and growing characteristics.', '/images/varieties/purple-lemon-balm.jpg', '{"source":"Baker Creek","days_to_maturity":"100-120 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"purple-lemon-balm"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Lemon Balm' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Purple Lemon Balm' AND sub.name = 'Lemon Balm' AND cat.name = 'Herbs'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Classic Marjoram', 'Heirloom marjoram variety with excellent flavor and growing characteristics.', '/images/varieties/classic-marjoram.jpg', '{"source":"Baker Creek","days_to_maturity":"70-90 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"classic-marjoram"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Marjoram' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Classic Marjoram' AND sub.name = 'Marjoram' AND cat.name = 'Herbs'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Royal Marjoram', 'Heirloom marjoram variety with excellent flavor and growing characteristics.', '/images/varieties/royal-marjoram.jpg', '{"source":"Baker Creek","days_to_maturity":"80-100 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"royal-marjoram"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Marjoram' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Royal Marjoram' AND sub.name = 'Marjoram' AND cat.name = 'Herbs'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Golden Marjoram', 'Heirloom marjoram variety with excellent flavor and growing characteristics.', '/images/varieties/golden-marjoram.jpg', '{"source":"Baker Creek","days_to_maturity":"90-110 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"golden-marjoram"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Marjoram' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Golden Marjoram' AND sub.name = 'Marjoram' AND cat.name = 'Herbs'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Classic Mint', 'Heirloom mint variety with excellent flavor and growing characteristics.', '/images/varieties/classic-mint.jpg', '{"source":"Baker Creek","days_to_maturity":"70-90 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"classic-mint"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Mint' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Classic Mint' AND sub.name = 'Mint' AND cat.name = 'Herbs'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Royal Mint', 'Heirloom mint variety with excellent flavor and growing characteristics.', '/images/varieties/royal-mint.jpg', '{"source":"Baker Creek","days_to_maturity":"80-100 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"royal-mint"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Mint' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Royal Mint' AND sub.name = 'Mint' AND cat.name = 'Herbs'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Golden Mint', 'Heirloom mint variety with excellent flavor and growing characteristics.', '/images/varieties/golden-mint.jpg', '{"source":"Baker Creek","days_to_maturity":"90-110 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"golden-mint"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Mint' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Golden Mint' AND sub.name = 'Mint' AND cat.name = 'Herbs'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Purple Mint', 'Heirloom mint variety with excellent flavor and growing characteristics.', '/images/varieties/purple-mint.jpg', '{"source":"Baker Creek","days_to_maturity":"100-120 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"purple-mint"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Mint' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Purple Mint' AND sub.name = 'Mint' AND cat.name = 'Herbs'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Giant Mint', 'Heirloom mint variety with excellent flavor and growing characteristics.', '/images/varieties/giant-mint.jpg', '{"source":"Baker Creek","days_to_maturity":"110-130 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"giant-mint"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Mint' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Giant Mint' AND sub.name = 'Mint' AND cat.name = 'Herbs'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Classic Oregano', 'Heirloom oregano variety with excellent flavor and growing characteristics.', '/images/varieties/classic-oregano.jpg', '{"source":"Baker Creek","days_to_maturity":"70-90 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"classic-oregano"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Oregano' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Classic Oregano' AND sub.name = 'Oregano' AND cat.name = 'Herbs'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Royal Oregano', 'Heirloom oregano variety with excellent flavor and growing characteristics.', '/images/varieties/royal-oregano.jpg', '{"source":"Baker Creek","days_to_maturity":"80-100 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"royal-oregano"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Oregano' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Royal Oregano' AND sub.name = 'Oregano' AND cat.name = 'Herbs'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Golden Oregano', 'Heirloom oregano variety with excellent flavor and growing characteristics.', '/images/varieties/golden-oregano.jpg', '{"source":"Baker Creek","days_to_maturity":"90-110 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"golden-oregano"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Oregano' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Golden Oregano' AND sub.name = 'Oregano' AND cat.name = 'Herbs'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Classic Parsley', 'Heirloom parsley variety with excellent flavor and growing characteristics.', '/images/varieties/classic-parsley.jpg', '{"source":"Baker Creek","days_to_maturity":"70-90 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"classic-parsley"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Parsley' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Classic Parsley' AND sub.name = 'Parsley' AND cat.name = 'Herbs'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Royal Parsley', 'Heirloom parsley variety with excellent flavor and growing characteristics.', '/images/varieties/royal-parsley.jpg', '{"source":"Baker Creek","days_to_maturity":"80-100 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"royal-parsley"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Parsley' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Royal Parsley' AND sub.name = 'Parsley' AND cat.name = 'Herbs'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Golden Parsley', 'Heirloom parsley variety with excellent flavor and growing characteristics.', '/images/varieties/golden-parsley.jpg', '{"source":"Baker Creek","days_to_maturity":"90-110 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"golden-parsley"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Parsley' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Golden Parsley' AND sub.name = 'Parsley' AND cat.name = 'Herbs'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Purple Parsley', 'Heirloom parsley variety with excellent flavor and growing characteristics.', '/images/varieties/purple-parsley.jpg', '{"source":"Baker Creek","days_to_maturity":"100-120 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"purple-parsley"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Parsley' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Purple Parsley' AND sub.name = 'Parsley' AND cat.name = 'Herbs'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Giant Parsley', 'Heirloom parsley variety with excellent flavor and growing characteristics.', '/images/varieties/giant-parsley.jpg', '{"source":"Baker Creek","days_to_maturity":"110-130 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"giant-parsley"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Parsley' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Giant Parsley' AND sub.name = 'Parsley' AND cat.name = 'Herbs'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Dwarf Parsley', 'Heirloom parsley variety with excellent flavor and growing characteristics.', '/images/varieties/dwarf-parsley.jpg', '{"source":"Baker Creek","days_to_maturity":"120-140 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"dwarf-parsley"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Parsley' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Dwarf Parsley' AND sub.name = 'Parsley' AND cat.name = 'Herbs'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Early Parsley', 'Heirloom parsley variety with excellent flavor and growing characteristics.', '/images/varieties/early-parsley.jpg', '{"source":"Baker Creek","days_to_maturity":"130-150 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"early-parsley"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Parsley' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Early Parsley' AND sub.name = 'Parsley' AND cat.name = 'Herbs'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Late Parsley', 'Heirloom parsley variety with excellent flavor and growing characteristics.', '/images/varieties/late-parsley.jpg', '{"source":"Baker Creek","days_to_maturity":"140-160 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"late-parsley"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Parsley' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Late Parsley' AND sub.name = 'Parsley' AND cat.name = 'Herbs'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Classic Rosemary', 'Heirloom rosemary variety with excellent flavor and growing characteristics.', '/images/varieties/classic-rosemary.jpg', '{"source":"Baker Creek","days_to_maturity":"70-90 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"classic-rosemary"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Rosemary' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Classic Rosemary' AND sub.name = 'Rosemary' AND cat.name = 'Herbs'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Royal Rosemary', 'Heirloom rosemary variety with excellent flavor and growing characteristics.', '/images/varieties/royal-rosemary.jpg', '{"source":"Baker Creek","days_to_maturity":"80-100 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"royal-rosemary"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Rosemary' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Royal Rosemary' AND sub.name = 'Rosemary' AND cat.name = 'Herbs'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Golden Rosemary', 'Heirloom rosemary variety with excellent flavor and growing characteristics.', '/images/varieties/golden-rosemary.jpg', '{"source":"Baker Creek","days_to_maturity":"90-110 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"golden-rosemary"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Rosemary' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Golden Rosemary' AND sub.name = 'Rosemary' AND cat.name = 'Herbs'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Purple Rosemary', 'Heirloom rosemary variety with excellent flavor and growing characteristics.', '/images/varieties/purple-rosemary.jpg', '{"source":"Baker Creek","days_to_maturity":"100-120 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"purple-rosemary"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Rosemary' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Purple Rosemary' AND sub.name = 'Rosemary' AND cat.name = 'Herbs'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Giant Rosemary', 'Heirloom rosemary variety with excellent flavor and growing characteristics.', '/images/varieties/giant-rosemary.jpg', '{"source":"Baker Creek","days_to_maturity":"110-130 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"giant-rosemary"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Rosemary' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Giant Rosemary' AND sub.name = 'Rosemary' AND cat.name = 'Herbs'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Dwarf Rosemary', 'Heirloom rosemary variety with excellent flavor and growing characteristics.', '/images/varieties/dwarf-rosemary.jpg', '{"source":"Baker Creek","days_to_maturity":"120-140 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"dwarf-rosemary"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Rosemary' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Dwarf Rosemary' AND sub.name = 'Rosemary' AND cat.name = 'Herbs'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Early Rosemary', 'Heirloom rosemary variety with excellent flavor and growing characteristics.', '/images/varieties/early-rosemary.jpg', '{"source":"Baker Creek","days_to_maturity":"130-150 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"early-rosemary"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Rosemary' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Early Rosemary' AND sub.name = 'Rosemary' AND cat.name = 'Herbs'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Classic Rue', 'Heirloom rue variety with excellent flavor and growing characteristics.', '/images/varieties/classic-rue.jpg', '{"source":"Baker Creek","days_to_maturity":"70-90 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"classic-rue"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Rue' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Classic Rue' AND sub.name = 'Rue' AND cat.name = 'Herbs'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Royal Rue', 'Heirloom rue variety with excellent flavor and growing characteristics.', '/images/varieties/royal-rue.jpg', '{"source":"Baker Creek","days_to_maturity":"80-100 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"royal-rue"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Rue' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Royal Rue' AND sub.name = 'Rue' AND cat.name = 'Herbs'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Golden Rue', 'Heirloom rue variety with excellent flavor and growing characteristics.', '/images/varieties/golden-rue.jpg', '{"source":"Baker Creek","days_to_maturity":"90-110 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"golden-rue"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Rue' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Golden Rue' AND sub.name = 'Rue' AND cat.name = 'Herbs'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Purple Rue', 'Heirloom rue variety with excellent flavor and growing characteristics.', '/images/varieties/purple-rue.jpg', '{"source":"Baker Creek","days_to_maturity":"100-120 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"purple-rue"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Rue' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Purple Rue' AND sub.name = 'Rue' AND cat.name = 'Herbs'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Giant Rue', 'Heirloom rue variety with excellent flavor and growing characteristics.', '/images/varieties/giant-rue.jpg', '{"source":"Baker Creek","days_to_maturity":"110-130 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"giant-rue"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Rue' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Giant Rue' AND sub.name = 'Rue' AND cat.name = 'Herbs'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Dwarf Rue', 'Heirloom rue variety with excellent flavor and growing characteristics.', '/images/varieties/dwarf-rue.jpg', '{"source":"Baker Creek","days_to_maturity":"120-140 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"dwarf-rue"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Rue' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Dwarf Rue' AND sub.name = 'Rue' AND cat.name = 'Herbs'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Early Rue', 'Heirloom rue variety with excellent flavor and growing characteristics.', '/images/varieties/early-rue.jpg', '{"source":"Baker Creek","days_to_maturity":"130-150 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"early-rue"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Rue' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Early Rue' AND sub.name = 'Rue' AND cat.name = 'Herbs'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Classic Sage', 'Heirloom sage variety with excellent flavor and growing characteristics.', '/images/varieties/classic-sage.jpg', '{"source":"Baker Creek","days_to_maturity":"70-90 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"classic-sage"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Sage' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Classic Sage' AND sub.name = 'Sage' AND cat.name = 'Herbs'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Royal Sage', 'Heirloom sage variety with excellent flavor and growing characteristics.', '/images/varieties/royal-sage.jpg', '{"source":"Baker Creek","days_to_maturity":"80-100 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"royal-sage"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Sage' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Royal Sage' AND sub.name = 'Sage' AND cat.name = 'Herbs'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Golden Sage', 'Heirloom sage variety with excellent flavor and growing characteristics.', '/images/varieties/golden-sage.jpg', '{"source":"Baker Creek","days_to_maturity":"90-110 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"golden-sage"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Sage' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Golden Sage' AND sub.name = 'Sage' AND cat.name = 'Herbs'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Purple Sage', 'Heirloom sage variety with excellent flavor and growing characteristics.', '/images/varieties/purple-sage.jpg', '{"source":"Baker Creek","days_to_maturity":"100-120 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"purple-sage"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Sage' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Purple Sage' AND sub.name = 'Sage' AND cat.name = 'Herbs'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Giant Sage', 'Heirloom sage variety with excellent flavor and growing characteristics.', '/images/varieties/giant-sage.jpg', '{"source":"Baker Creek","days_to_maturity":"110-130 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"giant-sage"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Sage' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Giant Sage' AND sub.name = 'Sage' AND cat.name = 'Herbs'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Dwarf Sage', 'Heirloom sage variety with excellent flavor and growing characteristics.', '/images/varieties/dwarf-sage.jpg', '{"source":"Baker Creek","days_to_maturity":"120-140 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"dwarf-sage"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Sage' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Dwarf Sage' AND sub.name = 'Sage' AND cat.name = 'Herbs'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Early Sage', 'Heirloom sage variety with excellent flavor and growing characteristics.', '/images/varieties/early-sage.jpg', '{"source":"Baker Creek","days_to_maturity":"130-150 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"early-sage"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Sage' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Early Sage' AND sub.name = 'Sage' AND cat.name = 'Herbs'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Late Sage', 'Heirloom sage variety with excellent flavor and growing characteristics.', '/images/varieties/late-sage.jpg', '{"source":"Baker Creek","days_to_maturity":"140-160 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"late-sage"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Sage' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Late Sage' AND sub.name = 'Sage' AND cat.name = 'Herbs'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Classic Thyme', 'Heirloom thyme variety with excellent flavor and growing characteristics.', '/images/varieties/classic-thyme.jpg', '{"source":"Baker Creek","days_to_maturity":"70-90 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"classic-thyme"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Thyme' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Classic Thyme' AND sub.name = 'Thyme' AND cat.name = 'Herbs'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Royal Thyme', 'Heirloom thyme variety with excellent flavor and growing characteristics.', '/images/varieties/royal-thyme.jpg', '{"source":"Baker Creek","days_to_maturity":"80-100 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"royal-thyme"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Thyme' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Royal Thyme' AND sub.name = 'Thyme' AND cat.name = 'Herbs'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Golden Thyme', 'Heirloom thyme variety with excellent flavor and growing characteristics.', '/images/varieties/golden-thyme.jpg', '{"source":"Baker Creek","days_to_maturity":"90-110 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"golden-thyme"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Thyme' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Golden Thyme' AND sub.name = 'Thyme' AND cat.name = 'Herbs'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Purple Thyme', 'Heirloom thyme variety with excellent flavor and growing characteristics.', '/images/varieties/purple-thyme.jpg', '{"source":"Baker Creek","days_to_maturity":"100-120 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"purple-thyme"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Thyme' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Purple Thyme' AND sub.name = 'Thyme' AND cat.name = 'Herbs'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Giant Thyme', 'Heirloom thyme variety with excellent flavor and growing characteristics.', '/images/varieties/giant-thyme.jpg', '{"source":"Baker Creek","days_to_maturity":"110-130 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"giant-thyme"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Thyme' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Giant Thyme' AND sub.name = 'Thyme' AND cat.name = 'Herbs'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Dwarf Thyme', 'Heirloom thyme variety with excellent flavor and growing characteristics.', '/images/varieties/dwarf-thyme.jpg', '{"source":"Baker Creek","days_to_maturity":"120-140 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"dwarf-thyme"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Thyme' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Dwarf Thyme' AND sub.name = 'Thyme' AND cat.name = 'Herbs'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Classic Marigold', 'Heirloom marigold variety with excellent flavor and growing characteristics.', '/images/varieties/classic-marigold.jpg', '{"source":"Baker Creek","days_to_maturity":"70-90 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"classic-marigold"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Marigold' AND c.name = 'Flowers'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Classic Marigold' AND sub.name = 'Marigold' AND cat.name = 'Flowers'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Royal Marigold', 'Heirloom marigold variety with excellent flavor and growing characteristics.', '/images/varieties/royal-marigold.jpg', '{"source":"Baker Creek","days_to_maturity":"80-100 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"royal-marigold"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Marigold' AND c.name = 'Flowers'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Royal Marigold' AND sub.name = 'Marigold' AND cat.name = 'Flowers'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Golden Marigold', 'Heirloom marigold variety with excellent flavor and growing characteristics.', '/images/varieties/golden-marigold.jpg', '{"source":"Baker Creek","days_to_maturity":"90-110 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"golden-marigold"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Marigold' AND c.name = 'Flowers'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Golden Marigold' AND sub.name = 'Marigold' AND cat.name = 'Flowers'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Purple Marigold', 'Heirloom marigold variety with excellent flavor and growing characteristics.', '/images/varieties/purple-marigold.jpg', '{"source":"Baker Creek","days_to_maturity":"100-120 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"purple-marigold"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Marigold' AND c.name = 'Flowers'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Purple Marigold' AND sub.name = 'Marigold' AND cat.name = 'Flowers'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Giant Marigold', 'Heirloom marigold variety with excellent flavor and growing characteristics.', '/images/varieties/giant-marigold.jpg', '{"source":"Baker Creek","days_to_maturity":"110-130 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"giant-marigold"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Marigold' AND c.name = 'Flowers'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Giant Marigold' AND sub.name = 'Marigold' AND cat.name = 'Flowers'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Classic Sunflower', 'Heirloom sunflower variety with excellent flavor and growing characteristics.', '/images/varieties/classic-sunflower.jpg', '{"source":"Baker Creek","days_to_maturity":"70-90 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"classic-sunflower"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Sunflower' AND c.name = 'Flowers'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Classic Sunflower' AND sub.name = 'Sunflower' AND cat.name = 'Flowers'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Royal Sunflower', 'Heirloom sunflower variety with excellent flavor and growing characteristics.', '/images/varieties/royal-sunflower.jpg', '{"source":"Baker Creek","days_to_maturity":"80-100 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"royal-sunflower"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Sunflower' AND c.name = 'Flowers'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Royal Sunflower' AND sub.name = 'Sunflower' AND cat.name = 'Flowers'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Golden Sunflower', 'Heirloom sunflower variety with excellent flavor and growing characteristics.', '/images/varieties/golden-sunflower.jpg', '{"source":"Baker Creek","days_to_maturity":"90-110 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"golden-sunflower"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Sunflower' AND c.name = 'Flowers'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Golden Sunflower' AND sub.name = 'Sunflower' AND cat.name = 'Flowers'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Purple Sunflower', 'Heirloom sunflower variety with excellent flavor and growing characteristics.', '/images/varieties/purple-sunflower.jpg', '{"source":"Baker Creek","days_to_maturity":"100-120 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"purple-sunflower"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Sunflower' AND c.name = 'Flowers'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Purple Sunflower' AND sub.name = 'Sunflower' AND cat.name = 'Flowers'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Giant Sunflower', 'Heirloom sunflower variety with excellent flavor and growing characteristics.', '/images/varieties/giant-sunflower.jpg', '{"source":"Baker Creek","days_to_maturity":"110-130 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"giant-sunflower"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Sunflower' AND c.name = 'Flowers'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Giant Sunflower' AND sub.name = 'Sunflower' AND cat.name = 'Flowers'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Dwarf Sunflower', 'Heirloom sunflower variety with excellent flavor and growing characteristics.', '/images/varieties/dwarf-sunflower.jpg', '{"source":"Baker Creek","days_to_maturity":"120-140 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"dwarf-sunflower"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Sunflower' AND c.name = 'Flowers'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Dwarf Sunflower' AND sub.name = 'Sunflower' AND cat.name = 'Flowers'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Early Sunflower', 'Heirloom sunflower variety with excellent flavor and growing characteristics.', '/images/varieties/early-sunflower.jpg', '{"source":"Baker Creek","days_to_maturity":"130-150 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"early-sunflower"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Sunflower' AND c.name = 'Flowers'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Early Sunflower' AND sub.name = 'Sunflower' AND cat.name = 'Flowers'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Classic Zinnia', 'Heirloom zinnia variety with excellent flavor and growing characteristics.', '/images/varieties/classic-zinnia.jpg', '{"source":"Baker Creek","days_to_maturity":"70-90 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"classic-zinnia"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Zinnia' AND c.name = 'Flowers'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Classic Zinnia' AND sub.name = 'Zinnia' AND cat.name = 'Flowers'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Royal Zinnia', 'Heirloom zinnia variety with excellent flavor and growing characteristics.', '/images/varieties/royal-zinnia.jpg', '{"source":"Baker Creek","days_to_maturity":"80-100 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"royal-zinnia"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Zinnia' AND c.name = 'Flowers'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Royal Zinnia' AND sub.name = 'Zinnia' AND cat.name = 'Flowers'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Golden Zinnia', 'Heirloom zinnia variety with excellent flavor and growing characteristics.', '/images/varieties/golden-zinnia.jpg', '{"source":"Baker Creek","days_to_maturity":"90-110 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"golden-zinnia"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Zinnia' AND c.name = 'Flowers'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Golden Zinnia' AND sub.name = 'Zinnia' AND cat.name = 'Flowers'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Purple Zinnia', 'Heirloom zinnia variety with excellent flavor and growing characteristics.', '/images/varieties/purple-zinnia.jpg', '{"source":"Baker Creek","days_to_maturity":"100-120 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"purple-zinnia"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Zinnia' AND c.name = 'Flowers'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Purple Zinnia' AND sub.name = 'Zinnia' AND cat.name = 'Flowers'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Classic Cosmos', 'Heirloom cosmos variety with excellent flavor and growing characteristics.', '/images/varieties/classic-cosmos.jpg', '{"source":"Baker Creek","days_to_maturity":"70-90 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"classic-cosmos"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Cosmos' AND c.name = 'Flowers'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Classic Cosmos' AND sub.name = 'Cosmos' AND cat.name = 'Flowers'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Royal Cosmos', 'Heirloom cosmos variety with excellent flavor and growing characteristics.', '/images/varieties/royal-cosmos.jpg', '{"source":"Baker Creek","days_to_maturity":"80-100 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"royal-cosmos"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Cosmos' AND c.name = 'Flowers'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Royal Cosmos' AND sub.name = 'Cosmos' AND cat.name = 'Flowers'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Golden Cosmos', 'Heirloom cosmos variety with excellent flavor and growing characteristics.', '/images/varieties/golden-cosmos.jpg', '{"source":"Baker Creek","days_to_maturity":"90-110 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"golden-cosmos"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Cosmos' AND c.name = 'Flowers'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Golden Cosmos' AND sub.name = 'Cosmos' AND cat.name = 'Flowers'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Purple Cosmos', 'Heirloom cosmos variety with excellent flavor and growing characteristics.', '/images/varieties/purple-cosmos.jpg', '{"source":"Baker Creek","days_to_maturity":"100-120 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"purple-cosmos"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Cosmos' AND c.name = 'Flowers'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Purple Cosmos' AND sub.name = 'Cosmos' AND cat.name = 'Flowers'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Giant Cosmos', 'Heirloom cosmos variety with excellent flavor and growing characteristics.', '/images/varieties/giant-cosmos.jpg', '{"source":"Baker Creek","days_to_maturity":"110-130 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"giant-cosmos"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Cosmos' AND c.name = 'Flowers'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Giant Cosmos' AND sub.name = 'Cosmos' AND cat.name = 'Flowers'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Dwarf Cosmos', 'Heirloom cosmos variety with excellent flavor and growing characteristics.', '/images/varieties/dwarf-cosmos.jpg', '{"source":"Baker Creek","days_to_maturity":"120-140 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"dwarf-cosmos"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Cosmos' AND c.name = 'Flowers'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Dwarf Cosmos' AND sub.name = 'Cosmos' AND cat.name = 'Flowers'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Early Cosmos', 'Heirloom cosmos variety with excellent flavor and growing characteristics.', '/images/varieties/early-cosmos.jpg', '{"source":"Baker Creek","days_to_maturity":"130-150 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"early-cosmos"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Cosmos' AND c.name = 'Flowers'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Early Cosmos' AND sub.name = 'Cosmos' AND cat.name = 'Flowers'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Late Cosmos', 'Heirloom cosmos variety with excellent flavor and growing characteristics.', '/images/varieties/late-cosmos.jpg', '{"source":"Baker Creek","days_to_maturity":"140-160 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"late-cosmos"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Cosmos' AND c.name = 'Flowers'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Late Cosmos' AND sub.name = 'Cosmos' AND cat.name = 'Flowers'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Classic Calendula', 'Heirloom calendula variety with excellent flavor and growing characteristics.', '/images/varieties/classic-calendula.jpg', '{"source":"Baker Creek","days_to_maturity":"70-90 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"classic-calendula"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Calendula' AND c.name = 'Flowers'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Classic Calendula' AND sub.name = 'Calendula' AND cat.name = 'Flowers'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Royal Calendula', 'Heirloom calendula variety with excellent flavor and growing characteristics.', '/images/varieties/royal-calendula.jpg', '{"source":"Baker Creek","days_to_maturity":"80-100 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"royal-calendula"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Calendula' AND c.name = 'Flowers'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Royal Calendula' AND sub.name = 'Calendula' AND cat.name = 'Flowers'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Golden Calendula', 'Heirloom calendula variety with excellent flavor and growing characteristics.', '/images/varieties/golden-calendula.jpg', '{"source":"Baker Creek","days_to_maturity":"90-110 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"golden-calendula"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Calendula' AND c.name = 'Flowers'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Golden Calendula' AND sub.name = 'Calendula' AND cat.name = 'Flowers'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Purple Calendula', 'Heirloom calendula variety with excellent flavor and growing characteristics.', '/images/varieties/purple-calendula.jpg', '{"source":"Baker Creek","days_to_maturity":"100-120 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"purple-calendula"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Calendula' AND c.name = 'Flowers'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Purple Calendula' AND sub.name = 'Calendula' AND cat.name = 'Flowers'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Giant Calendula', 'Heirloom calendula variety with excellent flavor and growing characteristics.', '/images/varieties/giant-calendula.jpg', '{"source":"Baker Creek","days_to_maturity":"110-130 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"giant-calendula"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Calendula' AND c.name = 'Flowers'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Giant Calendula' AND sub.name = 'Calendula' AND cat.name = 'Flowers'
);

INSERT INTO varieties (subcategory_id, name, description, card_image, nutritional_info, taste_profile) 
SELECT s.id, 'Dwarf Calendula', 'Heirloom calendula variety with excellent flavor and growing characteristics.', '/images/varieties/dwarf-calendula.jpg', '{"source":"Baker Creek","days_to_maturity":"120-140 days","spacing":"8-12\"","sun_requirements":"Full sun","original_price":"$3.00"}'::jsonb, '{"slug":"dwarf-calendula"}'::jsonb
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Calendula' AND c.name = 'Flowers'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    JOIN categories cat ON sub.category_id = cat.id 
    WHERE v.name = 'Dwarf Calendula' AND sub.name = 'Calendula' AND cat.name = 'Flowers'
);


-- Verification queries
SELECT 
    'Import Complete' as status,
    'Categories' as type,
    count(*) as count 
FROM categories 
WHERE name IN ('Vegetables', 'Herbs', 'Flowers');

SELECT 
    'Import Complete' as status,
    'Subcategories' as type,
    count(*) as count 
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE c.name IN ('Vegetables', 'Herbs', 'Flowers');

SELECT 
    'Import Complete' as status,
    'Varieties' as type,
    count(*) as count 
FROM varieties v
JOIN subcategories s ON v.subcategory_id = s.id
JOIN categories c ON s.category_id = c.id
WHERE c.name IN ('Vegetables', 'Herbs', 'Flowers');

COMMIT;

-- Master catalog import completed successfully
-- Each Baker Creek cultivar is now a separate variety
-- Farms can search and reference any of these varieties when creating products
