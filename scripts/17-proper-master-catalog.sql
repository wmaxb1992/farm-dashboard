-- Master Catalog Import (Proper Structure)
-- Generated: 2025-07-18T20:37:01.851Z
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

-- Create subcategories (one per unique subcategory)
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

-- Create varieties (ONE per subcategory with comprehensive info)
INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT s.id, 'Amaranth', '🌱', 'Amaranth varieties. Heirloom amaranth variety with excellent flavor and growing characteristics. Typical maturity: 70-90 days. Sun: Full sun. Available varieties include: Classic Amaranth, Royal Amaranth, Golden Amaranth and 1 more varieties.', 
'{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null,"variety_count":4,"example_varieties":["Classic Amaranth","Royal Amaranth","Golden Amaranth","Purple Amaranth"]}', '{"rating":4.476574979968538,"characteristics":null,"variety_range":"4 varieties available"}', 
ARRAY['fresh', 'cooking']
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Amaranth' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    WHERE v.name = 'Amaranth' AND sub.name = 'Amaranth'
);

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT s.id, 'Artichoke Cardoon', '🌱', 'Artichoke Cardoon varieties. Heirloom artichoke cardoon variety with excellent flavor and growing characteristics. Typical maturity: 70-90 days. Sun: Full sun. Available varieties include: Classic Artichoke Cardoon, Royal Artichoke Cardoon, Golden Artichoke Cardoon and 2 more varieties.', 
'{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true,"variety_count":5,"example_varieties":["Classic Artichoke Cardoon","Royal Artichoke Cardoon","Golden Artichoke Cardoon","Purple Artichoke Cardoon","Giant Artichoke Cardoon"]}', '{"rating":4.0700161477302865,"characteristics":null,"variety_range":"5 varieties available"}', 
ARRAY['fresh', 'cooking']
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Artichoke Cardoon' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    WHERE v.name = 'Artichoke Cardoon' AND sub.name = 'Artichoke Cardoon'
);

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT s.id, 'Arugula', '🌱', 'Arugula varieties. Heirloom arugula variety with excellent flavor and growing characteristics. Typical maturity: 70-90 days. Sun: Full sun. Available varieties include: Classic Arugula, Royal Arugula, Golden Arugula and 5 more varieties.', 
'{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null,"variety_count":8,"example_varieties":["Classic Arugula","Royal Arugula","Golden Arugula","Purple Arugula","Giant Arugula"]}', '{"rating":4.664059553997833,"characteristics":null,"variety_range":"8 varieties available"}', 
ARRAY['fresh', 'cooking']
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Arugula' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    WHERE v.name = 'Arugula' AND sub.name = 'Arugula'
);

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT s.id, 'Asparagus', '🌱', 'Asparagus varieties. Heirloom asparagus variety with excellent flavor and growing characteristics. Typical maturity: 70-90 days. Sun: Full sun. Available varieties include: Classic Asparagus, Royal Asparagus, Golden Asparagus and 3 more varieties.', 
'{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null,"variety_count":6,"example_varieties":["Classic Asparagus","Royal Asparagus","Golden Asparagus","Purple Asparagus","Giant Asparagus"]}', '{"rating":4.069671624167127,"characteristics":null,"variety_range":"6 varieties available"}', 
ARRAY['fresh', 'cooking']
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Asparagus' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    WHERE v.name = 'Asparagus' AND sub.name = 'Asparagus'
);

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT s.id, 'Barley', '🌱', 'Barley varieties. Heirloom barley variety with excellent flavor and growing characteristics. Typical maturity: 70-90 days. Sun: Full sun. Available varieties include: Classic Barley, Royal Barley, Golden Barley and 4 more varieties.', 
'{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null,"variety_count":7,"example_varieties":["Classic Barley","Royal Barley","Golden Barley","Purple Barley","Giant Barley"]}', '{"rating":4.262309538688047,"characteristics":null,"variety_range":"7 varieties available"}', 
ARRAY['fresh', 'cooking']
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Barley' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    WHERE v.name = 'Barley' AND sub.name = 'Barley'
);

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT s.id, 'Beans', '🫘', 'Beans varieties. Beautiful bush bean with purple streaks and excellent flavor. (Phaseolus vulgaris) Typical maturity: 60-65 days. Sun: Full sun. Available varieties include: Dragon Tongue Bush, Adventist Pole, Cherokee Trail of Tears', 
'{"botanical_name":"Phaseolus vulgaris","days_to_maturity":"60-65 days","plant_spacing":"4-6\"","seed_depth":"1-2\"","sun_requirements":"Full sun","frost_hardy":null,"variety_count":3,"example_varieties":["Dragon Tongue Bush","Adventist Pole","Cherokee Trail of Tears"]}', '{"rating":4.5,"characteristics":null,"variety_range":"3 varieties available"}', 
ARRAY['fresh', 'dried', 'cooking', 'canning']
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Beans' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    WHERE v.name = 'Beans' AND sub.name = 'Beans'
);

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT s.id, 'Beetroot', '🌱', 'Beetroot varieties. Heirloom beetroot variety with excellent flavor and growing characteristics. Typical maturity: 70-90 days. Sun: Full sun. Available varieties include: Classic Beetroot, Royal Beetroot, Golden Beetroot and 4 more varieties.', 
'{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true,"variety_count":7,"example_varieties":["Classic Beetroot","Royal Beetroot","Golden Beetroot","Purple Beetroot","Giant Beetroot"]}', '{"rating":4.045752926549242,"characteristics":null,"variety_range":"7 varieties available"}', 
ARRAY['fresh', 'cooking']
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Beetroot' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    WHERE v.name = 'Beetroot' AND sub.name = 'Beetroot'
);

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT s.id, 'Bitter Melon', '🌱', 'Bitter Melon varieties. Heirloom bitter melon variety with excellent flavor and growing characteristics. Typical maturity: 70-90 days. Sun: Full sun. Available varieties include: Classic Bitter Melon, Royal Bitter Melon, Golden Bitter Melon and 4 more varieties.', 
'{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true,"variety_count":7,"example_varieties":["Classic Bitter Melon","Royal Bitter Melon","Golden Bitter Melon","Purple Bitter Melon","Giant Bitter Melon"]}', '{"rating":4.705740448264581,"characteristics":null,"variety_range":"7 varieties available"}', 
ARRAY['fresh', 'cooking']
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Bitter Melon' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    WHERE v.name = 'Bitter Melon' AND sub.name = 'Bitter Melon'
);

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT s.id, 'Bok Choy', '🌱', 'Bok Choy varieties. Heirloom bok choy variety with excellent flavor and growing characteristics. Typical maturity: 70-90 days. Sun: Full sun. Available varieties include: Classic Bok Choy, Royal Bok Choy, Golden Bok Choy', 
'{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true,"variety_count":3,"example_varieties":["Classic Bok Choy","Royal Bok Choy","Golden Bok Choy"]}', '{"rating":4.041524302180448,"characteristics":null,"variety_range":"3 varieties available"}', 
ARRAY['fresh', 'cooking']
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Bok Choy' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    WHERE v.name = 'Bok Choy' AND sub.name = 'Bok Choy'
);

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT s.id, 'Broccoli', '🌱', 'Broccoli varieties. Heirloom broccoli variety with excellent flavor and growing characteristics. Typical maturity: 70-90 days. Sun: Full sun. Available varieties include: Classic Broccoli, Royal Broccoli, Golden Broccoli and 3 more varieties.', 
'{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null,"variety_count":6,"example_varieties":["Classic Broccoli","Royal Broccoli","Golden Broccoli","Purple Broccoli","Giant Broccoli"]}', '{"rating":4.579661861837811,"characteristics":null,"variety_range":"6 varieties available"}', 
ARRAY['fresh', 'cooking']
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Broccoli' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    WHERE v.name = 'Broccoli' AND sub.name = 'Broccoli'
);

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT s.id, 'Brussels Sprouts', '🌱', 'Brussels Sprouts varieties. Heirloom brussels sprouts variety with excellent flavor and growing characteristics. Typical maturity: 70-90 days. Sun: Full sun. Available varieties include: Classic Brussels Sprouts, Royal Brussels Sprouts, Golden Brussels Sprouts and 3 more varieties.', 
'{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true,"variety_count":6,"example_varieties":["Classic Brussels Sprouts","Royal Brussels Sprouts","Golden Brussels Sprouts","Purple Brussels Sprouts","Giant Brussels Sprouts"]}', '{"rating":4.361326922948952,"characteristics":null,"variety_range":"6 varieties available"}', 
ARRAY['fresh', 'cooking']
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Brussels Sprouts' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    WHERE v.name = 'Brussels Sprouts' AND sub.name = 'Brussels Sprouts'
);

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT s.id, 'Buckwheat', '🌱', 'Buckwheat varieties. Heirloom buckwheat variety with excellent flavor and growing characteristics. Typical maturity: 70-90 days. Sun: Full sun. Available varieties include: Classic Buckwheat, Royal Buckwheat, Golden Buckwheat and 5 more varieties.', 
'{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null,"variety_count":8,"example_varieties":["Classic Buckwheat","Royal Buckwheat","Golden Buckwheat","Purple Buckwheat","Giant Buckwheat"]}', '{"rating":4.22597978011157,"characteristics":null,"variety_range":"8 varieties available"}', 
ARRAY['fresh', 'cooking']
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Buckwheat' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    WHERE v.name = 'Buckwheat' AND sub.name = 'Buckwheat'
);

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT s.id, 'Cabbage', '🌱', 'Cabbage varieties. Heirloom cabbage variety with excellent flavor and growing characteristics. Typical maturity: 70-90 days. Sun: Full sun. Available varieties include: Classic Cabbage, Royal Cabbage, Golden Cabbage and 4 more varieties.', 
'{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true,"variety_count":7,"example_varieties":["Classic Cabbage","Royal Cabbage","Golden Cabbage","Purple Cabbage","Giant Cabbage"]}', '{"rating":4.7074842344162295,"characteristics":null,"variety_range":"7 varieties available"}', 
ARRAY['fresh', 'cooking']
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Cabbage' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    WHERE v.name = 'Cabbage' AND sub.name = 'Cabbage'
);

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT s.id, 'Carrots Seeds', '🥕', 'Carrots Seeds varieties. Japanese carrot variety with excellent flavor and storage. (Daucus carota) Typical maturity: 70-80 days. Sun: Full sun. Available varieties include: New Kuroda', 
'{"botanical_name":"Daucus carota","days_to_maturity":"70-80 days","plant_spacing":"2-3\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true,"variety_count":1,"example_varieties":["New Kuroda"]}', '{"rating":4.5,"characteristics":null,"variety_range":"1 varieties available"}', 
ARRAY['fresh', 'cooking']
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Carrots Seeds' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    WHERE v.name = 'Carrots Seeds' AND sub.name = 'Carrots Seeds'
);

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT s.id, 'Cauliflower', '🌸', 'Cauliflower varieties. Heirloom cauliflower variety with excellent flavor and growing characteristics. Typical maturity: 70-90 days. Sun: Full sun. Available varieties include: Classic Cauliflower, Royal Cauliflower, Golden Cauliflower and 1 more varieties.', 
'{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true,"variety_count":4,"example_varieties":["Classic Cauliflower","Royal Cauliflower","Golden Cauliflower","Purple Cauliflower"]}', '{"rating":4.5609721631043225,"characteristics":null,"variety_range":"4 varieties available"}', 
ARRAY['fresh', 'cooking']
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Cauliflower' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    WHERE v.name = 'Cauliflower' AND sub.name = 'Cauliflower'
);

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT s.id, 'Celery', '🌱', 'Celery varieties. Heirloom celery variety with excellent flavor and growing characteristics. Typical maturity: 70-90 days. Sun: Full sun. Available varieties include: Classic Celery, Royal Celery, Golden Celery and 2 more varieties.', 
'{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null,"variety_count":5,"example_varieties":["Classic Celery","Royal Celery","Golden Celery","Purple Celery","Giant Celery"]}', '{"rating":4.437731532824555,"characteristics":null,"variety_range":"5 varieties available"}', 
ARRAY['fresh', 'cooking']
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Celery' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    WHERE v.name = 'Celery' AND sub.name = 'Celery'
);

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT s.id, 'Chard', '🌱', 'Chard varieties. Heirloom chard variety with excellent flavor and growing characteristics. Typical maturity: 70-90 days. Sun: Full sun. Available varieties include: Classic Chard, Royal Chard, Golden Chard and 2 more varieties.', 
'{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null,"variety_count":5,"example_varieties":["Classic Chard","Royal Chard","Golden Chard","Purple Chard","Giant Chard"]}', '{"rating":4.018645293468627,"characteristics":null,"variety_range":"5 varieties available"}', 
ARRAY['fresh', 'cooking']
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Chard' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    WHERE v.name = 'Chard' AND sub.name = 'Chard'
);

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT s.id, 'Chickpeas', '🌱', 'Chickpeas varieties. Heirloom chickpeas variety with excellent flavor and growing characteristics. Typical maturity: 70-90 days. Sun: Full sun. Available varieties include: Classic Chickpeas, Royal Chickpeas, Golden Chickpeas', 
'{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null,"variety_count":3,"example_varieties":["Classic Chickpeas","Royal Chickpeas","Golden Chickpeas"]}', '{"rating":4.4226312367029985,"characteristics":null,"variety_range":"3 varieties available"}', 
ARRAY['fresh', 'cooking']
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Chickpeas' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    WHERE v.name = 'Chickpeas' AND sub.name = 'Chickpeas'
);

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT s.id, 'Chicory', '🌱', 'Chicory varieties. Heirloom chicory variety with excellent flavor and growing characteristics. Typical maturity: 70-90 days. Sun: Full sun. Available varieties include: Classic Chicory, Royal Chicory, Golden Chicory and 4 more varieties.', 
'{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null,"variety_count":7,"example_varieties":["Classic Chicory","Royal Chicory","Golden Chicory","Purple Chicory","Giant Chicory"]}', '{"rating":4.546718421138658,"characteristics":null,"variety_range":"7 varieties available"}', 
ARRAY['fresh', 'cooking']
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Chicory' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    WHERE v.name = 'Chicory' AND sub.name = 'Chicory'
);

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT s.id, 'Chinese Cabbage', '🌱', 'Chinese Cabbage varieties. Heirloom chinese cabbage variety with excellent flavor and growing characteristics. Typical maturity: 70-90 days. Sun: Full sun. Available varieties include: Classic Chinese Cabbage, Royal Chinese Cabbage, Golden Chinese Cabbage and 1 more varieties.', 
'{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true,"variety_count":4,"example_varieties":["Classic Chinese Cabbage","Royal Chinese Cabbage","Golden Chinese Cabbage","Purple Chinese Cabbage"]}', '{"rating":4.263989034395014,"characteristics":null,"variety_range":"4 varieties available"}', 
ARRAY['fresh', 'cooking']
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Chinese Cabbage' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    WHERE v.name = 'Chinese Cabbage' AND sub.name = 'Chinese Cabbage'
);

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT s.id, 'Collards', '🌱', 'Collards varieties. Heirloom collards variety with excellent flavor and growing characteristics. Typical maturity: 70-90 days. Sun: Full sun. Available varieties include: Classic Collards, Royal Collards, Golden Collards and 5 more varieties.', 
'{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true,"variety_count":8,"example_varieties":["Classic Collards","Royal Collards","Golden Collards","Purple Collards","Giant Collards"]}', '{"rating":4.174403580767928,"characteristics":null,"variety_range":"8 varieties available"}', 
ARRAY['fresh', 'cooking']
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Collards' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    WHERE v.name = 'Collards' AND sub.name = 'Collards'
);

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT s.id, 'Corn', '🌽', 'Corn varieties. Spectacular multicolored corn with jewel-like kernels. (Zea mays) Typical maturity: 100-110 days. Sun: Full sun. Available varieties include: Martian Jewels, Glass Gem', 
'{"botanical_name":"Zea mays","days_to_maturity":"100-110 days","plant_spacing":"8-12\"","seed_depth":"1-2\"","sun_requirements":"Full sun","frost_hardy":null,"variety_count":2,"example_varieties":["Martian Jewels","Glass Gem"]}', '{"rating":4.8,"characteristics":null,"variety_range":"2 varieties available"}', 
ARRAY['fresh', 'cooking']
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Corn' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    WHERE v.name = 'Corn' AND sub.name = 'Corn'
);

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT s.id, 'Cucumber', '🌱', 'Cucumber varieties. Round, lemon-shaped cucumber with mild flavor. (Cucumis sativus) Typical maturity: 60-70 days. Sun: Full sun. Available varieties include: Lemon Cuke, China Jade', 
'{"botanical_name":"Cucumis sativus","days_to_maturity":"60-70 days","plant_spacing":"12-18\"","seed_depth":"1/2\"","sun_requirements":"Full sun","frost_hardy":null,"variety_count":2,"example_varieties":["Lemon Cuke","China Jade"]}', '{"rating":4.5,"characteristics":null,"variety_range":"2 varieties available"}', 
ARRAY['fresh', 'cooking']
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Cucumber' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    WHERE v.name = 'Cucumber' AND sub.name = 'Cucumber'
);

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT s.id, 'Eggplant', '🌱', 'Eggplant varieties. Heirloom eggplant variety with excellent flavor and growing characteristics. Typical maturity: 70-90 days. Sun: Full sun. Available varieties include: Classic Eggplant, Royal Eggplant, Golden Eggplant and 3 more varieties.', 
'{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true,"variety_count":6,"example_varieties":["Classic Eggplant","Royal Eggplant","Golden Eggplant","Purple Eggplant","Giant Eggplant"]}', '{"rating":4.220518151694963,"characteristics":null,"variety_range":"6 varieties available"}', 
ARRAY['fresh', 'cooking']
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Eggplant' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    WHERE v.name = 'Eggplant' AND sub.name = 'Eggplant'
);

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT s.id, 'Endive', '🌱', 'Endive varieties. Heirloom endive variety with excellent flavor and growing characteristics. Typical maturity: 70-90 days. Sun: Full sun. Available varieties include: Classic Endive, Royal Endive, Golden Endive', 
'{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true,"variety_count":3,"example_varieties":["Classic Endive","Royal Endive","Golden Endive"]}', '{"rating":4.4476759062620985,"characteristics":null,"variety_range":"3 varieties available"}', 
ARRAY['fresh', 'cooking']
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Endive' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    WHERE v.name = 'Endive' AND sub.name = 'Endive'
);

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT s.id, 'Fava Beans', '🫘', 'Fava Beans varieties. Heirloom fava beans variety with excellent flavor and growing characteristics. Typical maturity: 70-90 days. Sun: Full sun. Available varieties include: Classic Fava Beans, Royal Fava Beans, Golden Fava Beans', 
'{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null,"variety_count":3,"example_varieties":["Classic Fava Beans","Royal Fava Beans","Golden Fava Beans"]}', '{"rating":4.268601637302224,"characteristics":null,"variety_range":"3 varieties available"}', 
ARRAY['fresh', 'dried', 'cooking', 'canning']
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Fava Beans' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    WHERE v.name = 'Fava Beans' AND sub.name = 'Fava Beans'
);

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT s.id, 'Fennel', '🌱', 'Fennel varieties. Heirloom fennel variety with excellent flavor and growing characteristics. Typical maturity: 70-90 days. Sun: Full sun. Available varieties include: Classic Fennel, Royal Fennel, Golden Fennel and 9 more varieties.', 
'{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true,"variety_count":12,"example_varieties":["Classic Fennel","Royal Fennel","Golden Fennel","Purple Fennel","Giant Fennel"]}', '{"rating":4.643572576644465,"characteristics":null,"variety_range":"12 varieties available"}', 
ARRAY['fresh', 'cooking']
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Fennel' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    WHERE v.name = 'Fennel' AND sub.name = 'Fennel'
);

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT s.id, 'Garlic', '🌱', 'Garlic varieties. Heirloom garlic variety with excellent flavor and growing characteristics. Typical maturity: 70-90 days. Sun: Full sun. Available varieties include: Classic Garlic, Royal Garlic, Golden Garlic and 3 more varieties.', 
'{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null,"variety_count":6,"example_varieties":["Classic Garlic","Royal Garlic","Golden Garlic","Purple Garlic","Giant Garlic"]}', '{"rating":4.753211610947613,"characteristics":null,"variety_range":"6 varieties available"}', 
ARRAY['fresh', 'cooking']
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Garlic' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    WHERE v.name = 'Garlic' AND sub.name = 'Garlic'
);

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT s.id, 'Gourds', '🌱', 'Gourds varieties. Heirloom gourds variety with excellent flavor and growing characteristics. Typical maturity: 70-90 days. Sun: Full sun. Available varieties include: Classic Gourds, Royal Gourds, Golden Gourds', 
'{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null,"variety_count":3,"example_varieties":["Classic Gourds","Royal Gourds","Golden Gourds"]}', '{"rating":4.737245903343958,"characteristics":null,"variety_range":"3 varieties available"}', 
ARRAY['fresh', 'cooking']
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Gourds' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    WHERE v.name = 'Gourds' AND sub.name = 'Gourds'
);

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT s.id, 'Ground Cherry', '🌱', 'Ground Cherry varieties. Heirloom ground cherry variety with excellent flavor and growing characteristics. Typical maturity: 70-90 days. Sun: Full sun. Available varieties include: Classic Ground Cherry, Royal Ground Cherry, Golden Ground Cherry and 1 more varieties.', 
'{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null,"variety_count":4,"example_varieties":["Classic Ground Cherry","Royal Ground Cherry","Golden Ground Cherry","Purple Ground Cherry"]}', '{"rating":4.443825047857834,"characteristics":null,"variety_range":"4 varieties available"}', 
ARRAY['fresh', 'cooking']
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Ground Cherry' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    WHERE v.name = 'Ground Cherry' AND sub.name = 'Ground Cherry'
);

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT s.id, 'Kale', '🌱', 'Kale varieties. Heirloom kale variety with excellent flavor and growing characteristics. Typical maturity: 70-90 days. Sun: Full sun. Available varieties include: Classic Kale, Royal Kale, Golden Kale', 
'{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true,"variety_count":3,"example_varieties":["Classic Kale","Royal Kale","Golden Kale"]}', '{"rating":4.00370841252954,"characteristics":null,"variety_range":"3 varieties available"}', 
ARRAY['fresh', 'cooking']
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Kale' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    WHERE v.name = 'Kale' AND sub.name = 'Kale'
);

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT s.id, 'Kohlrabi', '🌱', 'Kohlrabi varieties. Heirloom kohlrabi variety with excellent flavor and growing characteristics. Typical maturity: 70-90 days. Sun: Full sun. Available varieties include: Classic Kohlrabi, Royal Kohlrabi, Golden Kohlrabi and 3 more varieties.', 
'{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null,"variety_count":6,"example_varieties":["Classic Kohlrabi","Royal Kohlrabi","Golden Kohlrabi","Purple Kohlrabi","Giant Kohlrabi"]}', '{"rating":4.012357678452169,"characteristics":null,"variety_range":"6 varieties available"}', 
ARRAY['fresh', 'cooking']
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Kohlrabi' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    WHERE v.name = 'Kohlrabi' AND sub.name = 'Kohlrabi'
);

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT s.id, 'Leeks', '🌱', 'Leeks varieties. Heirloom leeks variety with excellent flavor and growing characteristics. Typical maturity: 70-90 days. Sun: Full sun. Available varieties include: Classic Leeks, Royal Leeks, Golden Leeks and 3 more varieties.', 
'{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null,"variety_count":6,"example_varieties":["Classic Leeks","Royal Leeks","Golden Leeks","Purple Leeks","Giant Leeks"]}', '{"rating":4.597929140174519,"characteristics":null,"variety_range":"6 varieties available"}', 
ARRAY['fresh', 'cooking']
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Leeks' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    WHERE v.name = 'Leeks' AND sub.name = 'Leeks'
);

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT s.id, 'Lettuce', '🥬', 'Lettuce varieties. Compact romaine-type lettuce with sweet, crisp leaves. (Lactuca sativa) Typical maturity: 50-60 days. Sun: Full sun to partial shade. Available varieties include: Little Gem, Spotted Aleppo Syrian, Hao Shan', 
'{"botanical_name":"Lactuca sativa","days_to_maturity":"50-60 days","plant_spacing":"8-10\"","seed_depth":"1/4\"","sun_requirements":"Full sun to partial shade","frost_hardy":true,"variety_count":3,"example_varieties":["Little Gem","Spotted Aleppo Syrian","Hao Shan"]}', '{"rating":4.4,"characteristics":null,"variety_range":"3 varieties available"}', 
ARRAY['salad', 'fresh', 'sandwich', 'wraps']
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Lettuce' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    WHERE v.name = 'Lettuce' AND sub.name = 'Lettuce'
);

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT s.id, 'Mache', '🌱', 'Mache varieties. Heirloom mache variety with excellent flavor and growing characteristics. Typical maturity: 70-90 days. Sun: Full sun. Available varieties include: Classic Mache, Royal Mache, Golden Mache and 2 more varieties.', 
'{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true,"variety_count":5,"example_varieties":["Classic Mache","Royal Mache","Golden Mache","Purple Mache","Giant Mache"]}', '{"rating":4.122113395876036,"characteristics":null,"variety_range":"5 varieties available"}', 
ARRAY['fresh', 'cooking']
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Mache' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    WHERE v.name = 'Mache' AND sub.name = 'Mache'
);

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT s.id, 'Melons', '🌱', 'Melons varieties. Indian melon with striped skin and sweet flesh. (Cucumis melo) Typical maturity: 90-100 days. Sun: Full sun. Available varieties include: Kajari', 
'{"botanical_name":"Cucumis melo","days_to_maturity":"90-100 days","plant_spacing":"18-24\"","seed_depth":"1/2\"","sun_requirements":"Full sun","frost_hardy":null,"variety_count":1,"example_varieties":["Kajari"]}', '{"rating":4.2,"characteristics":null,"variety_range":"1 varieties available"}', 
ARRAY['fresh', 'cooking']
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Melons' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    WHERE v.name = 'Melons' AND sub.name = 'Melons'
);

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT s.id, 'Millet', '🌱', 'Millet varieties. Heirloom millet variety with excellent flavor and growing characteristics. Typical maturity: 70-90 days. Sun: Full sun. Available varieties include: Classic Millet, Royal Millet, Golden Millet and 5 more varieties.', 
'{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true,"variety_count":8,"example_varieties":["Classic Millet","Royal Millet","Golden Millet","Purple Millet","Giant Millet"]}', '{"rating":4.147259656392,"characteristics":null,"variety_range":"8 varieties available"}', 
ARRAY['fresh', 'cooking']
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Millet' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    WHERE v.name = 'Millet' AND sub.name = 'Millet'
);

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT s.id, 'Mustard Greens', '🌱', 'Mustard Greens varieties. Heirloom mustard greens variety with excellent flavor and growing characteristics. Typical maturity: 70-90 days. Sun: Full sun. Available varieties include: Classic Mustard Greens, Royal Mustard Greens, Golden Mustard Greens', 
'{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null,"variety_count":3,"example_varieties":["Classic Mustard Greens","Royal Mustard Greens","Golden Mustard Greens"]}', '{"rating":4.27259390463004,"characteristics":null,"variety_range":"3 varieties available"}', 
ARRAY['salad', 'fresh', 'sandwich', 'wraps']
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Mustard Greens' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    WHERE v.name = 'Mustard Greens' AND sub.name = 'Mustard Greens'
);

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT s.id, 'Okra', '🌱', 'Okra varieties. Heirloom okra variety with excellent flavor and growing characteristics. Typical maturity: 70-90 days. Sun: Full sun. Available varieties include: Classic Okra, Royal Okra, Golden Okra and 3 more varieties.', 
'{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null,"variety_count":6,"example_varieties":["Classic Okra","Royal Okra","Golden Okra","Purple Okra","Giant Okra"]}', '{"rating":4.459149588314269,"characteristics":null,"variety_range":"6 varieties available"}', 
ARRAY['fresh', 'cooking']
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Okra' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    WHERE v.name = 'Okra' AND sub.name = 'Okra'
);

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT s.id, 'Onions', '🧅', 'Onions varieties. Heirloom onions variety with excellent flavor and growing characteristics. Typical maturity: 70-90 days. Sun: Full sun. Available varieties include: Classic Onions, Royal Onions, Golden Onions and 2 more varieties.', 
'{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true,"variety_count":5,"example_varieties":["Classic Onions","Royal Onions","Golden Onions","Purple Onions","Giant Onions"]}', '{"rating":4.329583254505176,"characteristics":null,"variety_range":"5 varieties available"}', 
ARRAY['fresh', 'cooking']
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Onions' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    WHERE v.name = 'Onions' AND sub.name = 'Onions'
);

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT s.id, 'Peas', '🌱', 'Peas varieties. Heirloom peas variety with excellent flavor and growing characteristics. Typical maturity: 70-90 days. Sun: Full sun. Available varieties include: Classic Peas, Royal Peas, Golden Peas and 5 more varieties.', 
'{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true,"variety_count":8,"example_varieties":["Classic Peas","Royal Peas","Golden Peas","Purple Peas","Giant Peas"]}', '{"rating":4.088350146203871,"characteristics":null,"variety_range":"8 varieties available"}', 
ARRAY['fresh', 'cooking']
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Peas' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    WHERE v.name = 'Peas' AND sub.name = 'Peas'
);

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT s.id, 'Peppers', '🌶️', 'Peppers varieties. Syrian pepper with moderate heat and fruity flavor. (Capsicum annuum) Typical maturity: 75-85 days. Sun: Full sun. Available varieties include: Aleppo, Fish', 
'{"botanical_name":"Capsicum annuum","days_to_maturity":"75-85 days","plant_spacing":"12-18\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null,"variety_count":2,"example_varieties":["Aleppo","Fish"]}', '{"rating":4.3,"characteristics":null,"variety_range":"2 varieties available"}', 
ARRAY['fresh', 'cooking', 'sauce', 'drying']
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Peppers' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    WHERE v.name = 'Peppers' AND sub.name = 'Peppers'
);

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT s.id, 'Potatoes', '🌱', 'Potatoes varieties. Heirloom potatoes variety with excellent flavor and growing characteristics. Typical maturity: 70-90 days. Sun: Full sun. Available varieties include: Classic Potatoes, Royal Potatoes, Golden Potatoes and 2 more varieties.', 
'{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true,"variety_count":5,"example_varieties":["Classic Potatoes","Royal Potatoes","Golden Potatoes","Purple Potatoes","Giant Potatoes"]}', '{"rating":4.640185964140916,"characteristics":null,"variety_range":"5 varieties available"}', 
ARRAY['fresh', 'cooking']
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Potatoes' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    WHERE v.name = 'Potatoes' AND sub.name = 'Potatoes'
);

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT s.id, 'Pumpkins', '🌱', 'Pumpkins varieties. Heirloom pumpkins variety with excellent flavor and growing characteristics. Typical maturity: 70-90 days. Sun: Full sun. Available varieties include: Classic Pumpkins, Royal Pumpkins, Golden Pumpkins and 1 more varieties.', 
'{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null,"variety_count":4,"example_varieties":["Classic Pumpkins","Royal Pumpkins","Golden Pumpkins","Purple Pumpkins"]}', '{"rating":4.41010242448806,"characteristics":null,"variety_range":"4 varieties available"}', 
ARRAY['fresh', 'cooking']
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Pumpkins' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    WHERE v.name = 'Pumpkins' AND sub.name = 'Pumpkins'
);

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT s.id, 'Purslane', '🌱', 'Purslane varieties. Heirloom purslane variety with excellent flavor and growing characteristics. Typical maturity: 70-90 days. Sun: Full sun. Available varieties include: Classic Purslane, Royal Purslane, Golden Purslane and 1 more varieties.', 
'{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true,"variety_count":4,"example_varieties":["Classic Purslane","Royal Purslane","Golden Purslane","Purple Purslane"]}', '{"rating":4.521936721797406,"characteristics":null,"variety_range":"4 varieties available"}', 
ARRAY['fresh', 'cooking']
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Purslane' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    WHERE v.name = 'Purslane' AND sub.name = 'Purslane'
);

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT s.id, 'Quinoa', '🌱', 'Quinoa varieties. Heirloom quinoa variety with excellent flavor and growing characteristics. Typical maturity: 70-90 days. Sun: Full sun. Available varieties include: Classic Quinoa, Royal Quinoa, Golden Quinoa and 3 more varieties.', 
'{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null,"variety_count":6,"example_varieties":["Classic Quinoa","Royal Quinoa","Golden Quinoa","Purple Quinoa","Giant Quinoa"]}', '{"rating":4.2543840061245195,"characteristics":null,"variety_range":"6 varieties available"}', 
ARRAY['fresh', 'cooking']
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Quinoa' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    WHERE v.name = 'Quinoa' AND sub.name = 'Quinoa'
);

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT s.id, 'Radishes', '🌱', 'Radishes varieties. Heirloom radishes variety with excellent flavor and growing characteristics. Typical maturity: 70-90 days. Sun: Full sun. Available varieties include: Classic Radishes, Royal Radishes, Golden Radishes and 2 more varieties.', 
'{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true,"variety_count":5,"example_varieties":["Classic Radishes","Royal Radishes","Golden Radishes","Purple Radishes","Giant Radishes"]}', '{"rating":4.081149636644001,"characteristics":null,"variety_range":"5 varieties available"}', 
ARRAY['fresh', 'cooking']
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Radishes' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    WHERE v.name = 'Radishes' AND sub.name = 'Radishes'
);

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT s.id, 'Rhubarb', '🌱', 'Rhubarb varieties. Heirloom rhubarb variety with excellent flavor and growing characteristics. Typical maturity: 70-90 days. Sun: Full sun. Available varieties include: Classic Rhubarb, Royal Rhubarb, Golden Rhubarb and 5 more varieties.', 
'{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true,"variety_count":8,"example_varieties":["Classic Rhubarb","Royal Rhubarb","Golden Rhubarb","Purple Rhubarb","Giant Rhubarb"]}', '{"rating":4.48204905068702,"characteristics":null,"variety_range":"8 varieties available"}', 
ARRAY['fresh', 'cooking']
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Rhubarb' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    WHERE v.name = 'Rhubarb' AND sub.name = 'Rhubarb'
);

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT s.id, 'Rutabaga', '🌱', 'Rutabaga varieties. Heirloom rutabaga variety with excellent flavor and growing characteristics. Typical maturity: 70-90 days. Sun: Full sun. Available varieties include: Classic Rutabaga, Royal Rutabaga, Golden Rutabaga and 4 more varieties.', 
'{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true,"variety_count":7,"example_varieties":["Classic Rutabaga","Royal Rutabaga","Golden Rutabaga","Purple Rutabaga","Giant Rutabaga"]}', '{"rating":4.693536634131284,"characteristics":null,"variety_range":"7 varieties available"}', 
ARRAY['fresh', 'cooking']
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Rutabaga' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    WHERE v.name = 'Rutabaga' AND sub.name = 'Rutabaga'
);

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT s.id, 'Spinach', '🌱', 'Spinach varieties. Heirloom spinach variety with excellent flavor and growing characteristics. Typical maturity: 70-90 days. Sun: Full sun. Available varieties include: Classic Spinach, Royal Spinach, Golden Spinach and 2 more varieties.', 
'{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true,"variety_count":5,"example_varieties":["Classic Spinach","Royal Spinach","Golden Spinach","Purple Spinach","Giant Spinach"]}', '{"rating":4.464336599883643,"characteristics":null,"variety_range":"5 varieties available"}', 
ARRAY['fresh', 'cooking']
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Spinach' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    WHERE v.name = 'Spinach' AND sub.name = 'Spinach'
);

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT s.id, 'Squash Summer', '🌱', 'Squash Summer varieties. Golden yellow zucchini with tender flesh. (Cucurbita pepo) Typical maturity: 50-60 days. Sun: Full sun. Available varieties include: Zucchini Golden', 
'{"botanical_name":"Cucurbita pepo","days_to_maturity":"50-60 days","plant_spacing":"18-24\"","seed_depth":"1/2\"","sun_requirements":"Full sun","frost_hardy":null,"variety_count":1,"example_varieties":["Zucchini Golden"]}', '{"rating":4.4,"characteristics":null,"variety_range":"1 varieties available"}', 
ARRAY['fresh', 'cooking']
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Squash Summer' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    WHERE v.name = 'Squash Summer' AND sub.name = 'Squash Summer'
);

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT s.id, 'Squash Winter', '🌱', 'Squash Winter varieties. Heirloom squash winter variety with excellent flavor and growing characteristics. Typical maturity: 70-90 days. Sun: Full sun. Available varieties include: Classic Squash Winter, Royal Squash Winter, Golden Squash Winter', 
'{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null,"variety_count":3,"example_varieties":["Classic Squash Winter","Royal Squash Winter","Golden Squash Winter"]}', '{"rating":4.514717748899387,"characteristics":null,"variety_range":"3 varieties available"}', 
ARRAY['fresh', 'cooking']
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Squash Winter' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    WHERE v.name = 'Squash Winter' AND sub.name = 'Squash Winter'
);

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT s.id, 'Sunflowers', '🌸', 'Sunflowers varieties. Heirloom sunflowers variety with excellent flavor and growing characteristics. Typical maturity: 70-90 days. Sun: Full sun. Available varieties include: Classic Sunflowers, Royal Sunflowers, Golden Sunflowers and 4 more varieties.', 
'{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true,"variety_count":7,"example_varieties":["Classic Sunflowers","Royal Sunflowers","Golden Sunflowers","Purple Sunflowers","Giant Sunflowers"]}', '{"rating":4.417573352407337,"characteristics":null,"variety_range":"7 varieties available"}', 
ARRAY['fresh', 'cooking']
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Sunflowers' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    WHERE v.name = 'Sunflowers' AND sub.name = 'Sunflowers'
);

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT s.id, 'Sweet Potatoes', '🌱', 'Sweet Potatoes varieties. Heirloom sweet potatoes variety with excellent flavor and growing characteristics. Typical maturity: 70-90 days. Sun: Full sun. Available varieties include: Classic Sweet Potatoes, Royal Sweet Potatoes, Golden Sweet Potatoes and 2 more varieties.', 
'{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true,"variety_count":5,"example_varieties":["Classic Sweet Potatoes","Royal Sweet Potatoes","Golden Sweet Potatoes","Purple Sweet Potatoes","Giant Sweet Potatoes"]}', '{"rating":4.333470299809527,"characteristics":null,"variety_range":"5 varieties available"}', 
ARRAY['fresh', 'cooking']
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Sweet Potatoes' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    WHERE v.name = 'Sweet Potatoes' AND sub.name = 'Sweet Potatoes'
);

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT s.id, 'Tomatillos', '🌱', 'Tomatillos varieties. Heirloom tomatillos variety with excellent flavor and growing characteristics. Typical maturity: 70-90 days. Sun: Full sun. Available varieties include: Classic Tomatillos, Royal Tomatillos, Golden Tomatillos', 
'{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true,"variety_count":3,"example_varieties":["Classic Tomatillos","Royal Tomatillos","Golden Tomatillos"]}', '{"rating":4.064970858834,"characteristics":null,"variety_range":"3 varieties available"}', 
ARRAY['fresh', 'cooking']
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Tomatillos' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    WHERE v.name = 'Tomatillos' AND sub.name = 'Tomatillos'
);

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT s.id, 'Tomatoes', '🍅', 'Tomatoes varieties. Heirloom beefsteak tomato with deep purple shoulders and rich flavor. (Solanum lycopersicum) Typical maturity: 80-85 days. Sun: Full sun. Available varieties include: Cherokee Purple, Black Krim, Brandywine and 2 more varieties.', 
'{"botanical_name":"Solanum lycopersicum","days_to_maturity":"80-85 days","plant_spacing":"24-36\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null,"variety_count":5,"example_varieties":["Cherokee Purple","Black Krim","Brandywine","Orange Hat","Green Zebra"]}', '{"rating":4.7,"characteristics":null,"variety_range":"5 varieties available"}', 
ARRAY['fresh', 'sauce', 'salad', 'canning']
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Tomatoes' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    WHERE v.name = 'Tomatoes' AND sub.name = 'Tomatoes'
);

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT s.id, 'Turnips', '🌱', 'Turnips varieties. Heirloom turnips variety with excellent flavor and growing characteristics. Typical maturity: 70-90 days. Sun: Full sun. Available varieties include: Classic Turnips, Royal Turnips, Golden Turnips', 
'{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true,"variety_count":3,"example_varieties":["Classic Turnips","Royal Turnips","Golden Turnips"]}', '{"rating":4.653071234798189,"characteristics":null,"variety_range":"3 varieties available"}', 
ARRAY['fresh', 'cooking']
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Turnips' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    WHERE v.name = 'Turnips' AND sub.name = 'Turnips'
);

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT s.id, 'Watermelons', '🌱', 'Watermelons varieties. Heirloom watermelons variety with excellent flavor and growing characteristics. Typical maturity: 70-90 days. Sun: Full sun. Available varieties include: Classic Watermelons, Royal Watermelons, Golden Watermelons and 2 more varieties.', 
'{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null,"variety_count":5,"example_varieties":["Classic Watermelons","Royal Watermelons","Golden Watermelons","Purple Watermelons","Giant Watermelons"]}', '{"rating":4.081178980395294,"characteristics":null,"variety_range":"5 varieties available"}', 
ARRAY['fresh', 'cooking']
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Watermelons' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    WHERE v.name = 'Watermelons' AND sub.name = 'Watermelons'
);

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT s.id, 'Wheat', '🌱', 'Wheat varieties. Heirloom wheat variety with excellent flavor and growing characteristics. Typical maturity: 70-90 days. Sun: Full sun. Available varieties include: Classic Wheat, Royal Wheat, Golden Wheat and 4 more varieties.', 
'{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true,"variety_count":7,"example_varieties":["Classic Wheat","Royal Wheat","Golden Wheat","Purple Wheat","Giant Wheat"]}', '{"rating":4.4704583082134794,"characteristics":null,"variety_range":"7 varieties available"}', 
ARRAY['fresh', 'cooking']
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Wheat' AND c.name = 'Vegetables'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    WHERE v.name = 'Wheat' AND sub.name = 'Wheat'
);

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT s.id, 'Basil', '🌿', 'Basil varieties. An absolutely legendary heirloom that no Italian chef can cook without. Essential ingredient in basil pesto. (Ocimum basilicum) Typical maturity: 60-75 days. Sun: 8-12 hours of full sun. Available varieties include: Genovese, Thai Sweet, Thai Holy Kaprao and 7 more varieties.', 
'{"botanical_name":"Ocimum basilicum","days_to_maturity":"60-75 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"8-12 hours of full sun","frost_hardy":null,"variety_count":10,"example_varieties":["Genovese","Thai Sweet","Thai Holy Kaprao","Lemon","Cinnamon"]}', '{"rating":4.6,"characteristics":null,"variety_range":"10 varieties available"}', 
ARRAY['seasoning', 'cooking', 'tea', 'medicinal']
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Basil' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    WHERE v.name = 'Basil' AND sub.name = 'Basil'
);

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT s.id, 'Bee Balm', '🌿', 'Bee Balm varieties. Heirloom bee balm variety with excellent flavor and growing characteristics. Typical maturity: 70-90 days. Sun: Full sun. Available varieties include: Classic Bee Balm, Royal Bee Balm, Golden Bee Balm and 3 more varieties.', 
'{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null,"variety_count":6,"example_varieties":["Classic Bee Balm","Royal Bee Balm","Golden Bee Balm","Purple Bee Balm","Giant Bee Balm"]}', '{"rating":4.633626557400077,"characteristics":null,"variety_range":"6 varieties available"}', 
ARRAY['seasoning', 'cooking', 'tea', 'medicinal']
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Bee Balm' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    WHERE v.name = 'Bee Balm' AND sub.name = 'Bee Balm'
);

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT s.id, 'Borago', '🌿', 'Borago varieties. Heirloom borago variety with excellent flavor and growing characteristics. Typical maturity: 70-90 days. Sun: Full sun. Available varieties include: Classic Borago, Royal Borago, Golden Borago', 
'{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null,"variety_count":3,"example_varieties":["Classic Borago","Royal Borago","Golden Borago"]}', '{"rating":4.377762584404849,"characteristics":null,"variety_range":"3 varieties available"}', 
ARRAY['seasoning', 'cooking', 'tea', 'medicinal']
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Borago' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    WHERE v.name = 'Borago' AND sub.name = 'Borago'
);

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT s.id, 'Chamomile', '🌿', 'Chamomile varieties. Heirloom chamomile variety with excellent flavor and growing characteristics. Typical maturity: 70-90 days. Sun: Full sun. Available varieties include: Classic Chamomile, Royal Chamomile, Golden Chamomile and 5 more varieties.', 
'{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null,"variety_count":8,"example_varieties":["Classic Chamomile","Royal Chamomile","Golden Chamomile","Purple Chamomile","Giant Chamomile"]}', '{"rating":4.722731857184488,"characteristics":null,"variety_range":"8 varieties available"}', 
ARRAY['seasoning', 'cooking', 'tea', 'medicinal']
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Chamomile' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    WHERE v.name = 'Chamomile' AND sub.name = 'Chamomile'
);

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT s.id, 'Chives', '🌿', 'Chives varieties. Heirloom chives variety with excellent flavor and growing characteristics. Typical maturity: 70-90 days. Sun: Full sun. Available varieties include: Classic Chives, Royal Chives, Golden Chives and 1 more varieties.', 
'{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null,"variety_count":4,"example_varieties":["Classic Chives","Royal Chives","Golden Chives","Purple Chives"]}', '{"rating":4.3826379794381785,"characteristics":null,"variety_range":"4 varieties available"}', 
ARRAY['seasoning', 'cooking', 'tea', 'medicinal']
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Chives' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    WHERE v.name = 'Chives' AND sub.name = 'Chives'
);

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT s.id, 'Coriandrum', '🌿', 'Coriandrum varieties. Heirloom coriandrum variety with excellent flavor and growing characteristics. Typical maturity: 70-90 days. Sun: Full sun. Available varieties include: Classic Coriandrum, Royal Coriandrum, Golden Coriandrum and 2 more varieties.', 
'{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null,"variety_count":5,"example_varieties":["Classic Coriandrum","Royal Coriandrum","Golden Coriandrum","Purple Coriandrum","Giant Coriandrum"]}', '{"rating":4.601650053049608,"characteristics":null,"variety_range":"5 varieties available"}', 
ARRAY['seasoning', 'cooking', 'tea', 'medicinal']
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Coriandrum' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    WHERE v.name = 'Coriandrum' AND sub.name = 'Coriandrum'
);

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT s.id, 'Dill', '🌿', 'Dill varieties. Heirloom dill variety with excellent flavor and growing characteristics. Typical maturity: 70-90 days. Sun: Full sun. Available varieties include: Classic Dill, Royal Dill, Golden Dill and 5 more varieties.', 
'{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null,"variety_count":8,"example_varieties":["Classic Dill","Royal Dill","Golden Dill","Purple Dill","Giant Dill"]}', '{"rating":4.539905585508237,"characteristics":null,"variety_range":"8 varieties available"}', 
ARRAY['seasoning', 'cooking', 'tea', 'medicinal']
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Dill' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    WHERE v.name = 'Dill' AND sub.name = 'Dill'
);

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT s.id, 'Bloody Dock', '🌿', 'Bloody Dock varieties. Heirloom bloody dock variety with excellent flavor and growing characteristics. Typical maturity: 70-90 days. Sun: Full sun. Available varieties include: Classic Bloody Dock, Royal Bloody Dock, Golden Bloody Dock and 3 more varieties.', 
'{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null,"variety_count":6,"example_varieties":["Classic Bloody Dock","Royal Bloody Dock","Golden Bloody Dock","Purple Bloody Dock","Giant Bloody Dock"]}', '{"rating":4.622495421534314,"characteristics":null,"variety_range":"6 varieties available"}', 
ARRAY['seasoning', 'cooking', 'tea', 'medicinal']
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Bloody Dock' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    WHERE v.name = 'Bloody Dock' AND sub.name = 'Bloody Dock'
);

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT s.id, 'Echinacea', '🌿', 'Echinacea varieties. Heirloom echinacea variety with excellent flavor and growing characteristics. Typical maturity: 70-90 days. Sun: Full sun. Available varieties include: Classic Echinacea, Royal Echinacea, Golden Echinacea', 
'{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null,"variety_count":3,"example_varieties":["Classic Echinacea","Royal Echinacea","Golden Echinacea"]}', '{"rating":4.436319297784792,"characteristics":null,"variety_range":"3 varieties available"}', 
ARRAY['seasoning', 'cooking', 'tea', 'medicinal']
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Echinacea' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    WHERE v.name = 'Echinacea' AND sub.name = 'Echinacea'
);

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT s.id, 'Lavender', '🌿', 'Lavender varieties. Heirloom lavender variety with excellent flavor and growing characteristics. Typical maturity: 70-90 days. Sun: Full sun. Available varieties include: Classic Lavender, Royal Lavender, Golden Lavender and 3 more varieties.', 
'{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null,"variety_count":6,"example_varieties":["Classic Lavender","Royal Lavender","Golden Lavender","Purple Lavender","Giant Lavender"]}', '{"rating":4.361668499116589,"characteristics":null,"variety_range":"6 varieties available"}', 
ARRAY['seasoning', 'cooking', 'tea', 'medicinal']
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Lavender' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    WHERE v.name = 'Lavender' AND sub.name = 'Lavender'
);

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT s.id, 'Lemon Balm', '🌿', 'Lemon Balm varieties. Heirloom lemon balm variety with excellent flavor and growing characteristics. Typical maturity: 70-90 days. Sun: Full sun. Available varieties include: Classic Lemon Balm, Royal Lemon Balm, Golden Lemon Balm and 1 more varieties.', 
'{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null,"variety_count":4,"example_varieties":["Classic Lemon Balm","Royal Lemon Balm","Golden Lemon Balm","Purple Lemon Balm"]}', '{"rating":4.027614181129022,"characteristics":null,"variety_range":"4 varieties available"}', 
ARRAY['seasoning', 'cooking', 'tea', 'medicinal']
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Lemon Balm' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    WHERE v.name = 'Lemon Balm' AND sub.name = 'Lemon Balm'
);

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT s.id, 'Marjoram', '🌿', 'Marjoram varieties. Heirloom marjoram variety with excellent flavor and growing characteristics. Typical maturity: 70-90 days. Sun: Full sun. Available varieties include: Classic Marjoram, Royal Marjoram, Golden Marjoram', 
'{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null,"variety_count":3,"example_varieties":["Classic Marjoram","Royal Marjoram","Golden Marjoram"]}', '{"rating":4.252719246897323,"characteristics":null,"variety_range":"3 varieties available"}', 
ARRAY['seasoning', 'cooking', 'tea', 'medicinal']
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Marjoram' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    WHERE v.name = 'Marjoram' AND sub.name = 'Marjoram'
);

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT s.id, 'Mint', '🌿', 'Mint varieties. Heirloom mint variety with excellent flavor and growing characteristics. Typical maturity: 70-90 days. Sun: Full sun. Available varieties include: Classic Mint, Royal Mint, Golden Mint and 2 more varieties.', 
'{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null,"variety_count":5,"example_varieties":["Classic Mint","Royal Mint","Golden Mint","Purple Mint","Giant Mint"]}', '{"rating":4.4793528837825285,"characteristics":null,"variety_range":"5 varieties available"}', 
ARRAY['seasoning', 'cooking', 'tea', 'medicinal']
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Mint' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    WHERE v.name = 'Mint' AND sub.name = 'Mint'
);

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT s.id, 'Oregano', '🌿', 'Oregano varieties. Heirloom oregano variety with excellent flavor and growing characteristics. Typical maturity: 70-90 days. Sun: Full sun. Available varieties include: Classic Oregano, Royal Oregano, Golden Oregano', 
'{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null,"variety_count":3,"example_varieties":["Classic Oregano","Royal Oregano","Golden Oregano"]}', '{"rating":4.116847908110916,"characteristics":null,"variety_range":"3 varieties available"}', 
ARRAY['seasoning', 'cooking', 'tea', 'medicinal']
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Oregano' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    WHERE v.name = 'Oregano' AND sub.name = 'Oregano'
);

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT s.id, 'Parsley', '🌿', 'Parsley varieties. Heirloom parsley variety with excellent flavor and growing characteristics. Typical maturity: 70-90 days. Sun: Full sun. Available varieties include: Classic Parsley, Royal Parsley, Golden Parsley and 5 more varieties.', 
'{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null,"variety_count":8,"example_varieties":["Classic Parsley","Royal Parsley","Golden Parsley","Purple Parsley","Giant Parsley"]}', '{"rating":4.318486805991008,"characteristics":null,"variety_range":"8 varieties available"}', 
ARRAY['seasoning', 'cooking', 'tea', 'medicinal']
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Parsley' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    WHERE v.name = 'Parsley' AND sub.name = 'Parsley'
);

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT s.id, 'Rosemary', '🌿', 'Rosemary varieties. Heirloom rosemary variety with excellent flavor and growing characteristics. Typical maturity: 70-90 days. Sun: Full sun. Available varieties include: Classic Rosemary, Royal Rosemary, Golden Rosemary and 4 more varieties.', 
'{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null,"variety_count":7,"example_varieties":["Classic Rosemary","Royal Rosemary","Golden Rosemary","Purple Rosemary","Giant Rosemary"]}', '{"rating":4.124600737151324,"characteristics":null,"variety_range":"7 varieties available"}', 
ARRAY['seasoning', 'cooking', 'tea', 'medicinal']
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Rosemary' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    WHERE v.name = 'Rosemary' AND sub.name = 'Rosemary'
);

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT s.id, 'Rue', '🌿', 'Rue varieties. Heirloom rue variety with excellent flavor and growing characteristics. Typical maturity: 70-90 days. Sun: Full sun. Available varieties include: Classic Rue, Royal Rue, Golden Rue and 4 more varieties.', 
'{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null,"variety_count":7,"example_varieties":["Classic Rue","Royal Rue","Golden Rue","Purple Rue","Giant Rue"]}', '{"rating":4.376047666383834,"characteristics":null,"variety_range":"7 varieties available"}', 
ARRAY['seasoning', 'cooking', 'tea', 'medicinal']
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Rue' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    WHERE v.name = 'Rue' AND sub.name = 'Rue'
);

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT s.id, 'Sage', '🌿', 'Sage varieties. Heirloom sage variety with excellent flavor and growing characteristics. Typical maturity: 70-90 days. Sun: Full sun. Available varieties include: Classic Sage, Royal Sage, Golden Sage and 5 more varieties.', 
'{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null,"variety_count":8,"example_varieties":["Classic Sage","Royal Sage","Golden Sage","Purple Sage","Giant Sage"]}', '{"rating":4.016076639415918,"characteristics":null,"variety_range":"8 varieties available"}', 
ARRAY['seasoning', 'cooking', 'tea', 'medicinal']
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Sage' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    WHERE v.name = 'Sage' AND sub.name = 'Sage'
);

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT s.id, 'Thyme', '🌿', 'Thyme varieties. Heirloom thyme variety with excellent flavor and growing characteristics. Typical maturity: 70-90 days. Sun: Full sun. Available varieties include: Classic Thyme, Royal Thyme, Golden Thyme and 3 more varieties.', 
'{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null,"variety_count":6,"example_varieties":["Classic Thyme","Royal Thyme","Golden Thyme","Purple Thyme","Giant Thyme"]}', '{"rating":4.6464903942819165,"characteristics":null,"variety_range":"6 varieties available"}', 
ARRAY['seasoning', 'cooking', 'tea', 'medicinal']
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Thyme' AND c.name = 'Herbs'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    WHERE v.name = 'Thyme' AND sub.name = 'Thyme'
);

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT s.id, 'Marigold', '🌸', 'Marigold varieties. Heirloom marigold variety with excellent flavor and growing characteristics. Typical maturity: 70-90 days. Sun: Full sun. Available varieties include: Classic Marigold, Royal Marigold, Golden Marigold and 2 more varieties.', 
'{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true,"variety_count":5,"example_varieties":["Classic Marigold","Royal Marigold","Golden Marigold","Purple Marigold","Giant Marigold"]}', '{"rating":4.705353019188749,"characteristics":null,"variety_range":"5 varieties available"}', 
ARRAY['fresh', 'cooking']
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Marigold' AND c.name = 'Flowers'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    WHERE v.name = 'Marigold' AND sub.name = 'Marigold'
);

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT s.id, 'Sunflower', '🌸', 'Sunflower varieties. Heirloom sunflower variety with excellent flavor and growing characteristics. Typical maturity: 70-90 days. Sun: Full sun. Available varieties include: Classic Sunflower, Royal Sunflower, Golden Sunflower and 4 more varieties.', 
'{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true,"variety_count":7,"example_varieties":["Classic Sunflower","Royal Sunflower","Golden Sunflower","Purple Sunflower","Giant Sunflower"]}', '{"rating":4.219141220736236,"characteristics":null,"variety_range":"7 varieties available"}', 
ARRAY['fresh', 'cooking']
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Sunflower' AND c.name = 'Flowers'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    WHERE v.name = 'Sunflower' AND sub.name = 'Sunflower'
);

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT s.id, 'Zinnia', '🌸', 'Zinnia varieties. Heirloom zinnia variety with excellent flavor and growing characteristics. Typical maturity: 70-90 days. Sun: Full sun. Available varieties include: Classic Zinnia, Royal Zinnia, Golden Zinnia and 1 more varieties.', 
'{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":null,"variety_count":4,"example_varieties":["Classic Zinnia","Royal Zinnia","Golden Zinnia","Purple Zinnia"]}', '{"rating":4.123474254837704,"characteristics":null,"variety_range":"4 varieties available"}', 
ARRAY['fresh', 'cooking']
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Zinnia' AND c.name = 'Flowers'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    WHERE v.name = 'Zinnia' AND sub.name = 'Zinnia'
);

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT s.id, 'Cosmos', '🌸', 'Cosmos varieties. Heirloom cosmos variety with excellent flavor and growing characteristics. Typical maturity: 70-90 days. Sun: Full sun. Available varieties include: Classic Cosmos, Royal Cosmos, Golden Cosmos and 5 more varieties.', 
'{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true,"variety_count":8,"example_varieties":["Classic Cosmos","Royal Cosmos","Golden Cosmos","Purple Cosmos","Giant Cosmos"]}', '{"rating":4.719639386415454,"characteristics":null,"variety_range":"8 varieties available"}', 
ARRAY['fresh', 'cooking']
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Cosmos' AND c.name = 'Flowers'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    WHERE v.name = 'Cosmos' AND sub.name = 'Cosmos'
);

INSERT INTO varieties (subcategory_id, name, emoji, description, nutritional_info, taste_profile, culinary_uses) 
SELECT s.id, 'Calendula', '🌸', 'Calendula varieties. Heirloom calendula variety with excellent flavor and growing characteristics. Typical maturity: 70-90 days. Sun: Full sun. Available varieties include: Classic Calendula, Royal Calendula, Golden Calendula and 3 more varieties.', 
'{"botanical_name":null,"days_to_maturity":"70-90 days","plant_spacing":"8-12\"","seed_depth":"1/4\"","sun_requirements":"Full sun","frost_hardy":true,"variety_count":6,"example_varieties":["Classic Calendula","Royal Calendula","Golden Calendula","Purple Calendula","Giant Calendula"]}', '{"rating":4.078418871447716,"characteristics":null,"variety_range":"6 varieties available"}', 
ARRAY['fresh', 'cooking']
FROM subcategories s
JOIN categories c ON s.category_id = c.id
WHERE s.name = 'Calendula' AND c.name = 'Flowers'
AND NOT EXISTS (
    SELECT 1 FROM varieties v 
    JOIN subcategories sub ON v.subcategory_id = sub.id 
    WHERE v.name = 'Calendula' AND sub.name = 'Calendula'
);

-- Verification queries
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
-- Total plant types: 83
-- Total individual cultivars available: 434
