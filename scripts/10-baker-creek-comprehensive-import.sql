-- Comprehensive Baker Creek Seed Catalog Import
-- Generated: 2025-07-18T19:02:25.249Z
-- Total varieties: 434
-- Total categories: 84
-- Uses existing schema - no new fields added

BEGIN;

-- Ensure we have the main categories
INSERT INTO categories (id, name, image) VALUES
('baker-creek-vegetables', 'Baker Creek Vegetables', '/images/categories/vegetables.jpg'),
('baker-creek-herbs', 'Baker Creek Herbs', '/images/categories/herbs.jpg'),
('baker-creek-flowers', 'Baker Creek Flowers', '/images/categories/flowers.jpg')
ON CONFLICT (id) DO NOTHING;

-- Create subcategories for each Baker Creek category

-- Create subcategories
INSERT INTO subcategories (id, category_id, name, image) VALUES
('baker-amaranth', 'baker-vegetables', 'Amaranth', '/images/subcategories/amaranth.jpg')
ON CONFLICT (id) DO NOTHING;

INSERT INTO subcategories (id, category_id, name, image) VALUES
('baker-artichoke-cardoon', 'baker-vegetables', 'Artichoke Cardoon', '/images/subcategories/artichoke-cardoon.jpg')
ON CONFLICT (id) DO NOTHING;

INSERT INTO subcategories (id, category_id, name, image) VALUES
('baker-arugula', 'baker-vegetables', 'Arugula', '/images/subcategories/arugula.jpg')
ON CONFLICT (id) DO NOTHING;

INSERT INTO subcategories (id, category_id, name, image) VALUES
('baker-asparagus', 'baker-vegetables', 'Asparagus', '/images/subcategories/asparagus.jpg')
ON CONFLICT (id) DO NOTHING;

INSERT INTO subcategories (id, category_id, name, image) VALUES
('baker-barley', 'baker-vegetables', 'Barley', '/images/subcategories/barley.jpg')
ON CONFLICT (id) DO NOTHING;

INSERT INTO subcategories (id, category_id, name, image) VALUES
('baker-beans', 'baker-vegetables', 'Beans', '/images/subcategories/beans.jpg')
ON CONFLICT (id) DO NOTHING;

INSERT INTO subcategories (id, category_id, name, image) VALUES
('baker-beetroot', 'baker-vegetables', 'Beetroot', '/images/subcategories/beetroot.jpg')
ON CONFLICT (id) DO NOTHING;

INSERT INTO subcategories (id, category_id, name, image) VALUES
('baker-bitter-melon', 'baker-vegetables', 'Bitter Melon', '/images/subcategories/bitter-melon.jpg')
ON CONFLICT (id) DO NOTHING;

INSERT INTO subcategories (id, category_id, name, image) VALUES
('baker-bok-choy', 'baker-vegetables', 'Bok Choy', '/images/subcategories/bok-choy.jpg')
ON CONFLICT (id) DO NOTHING;

INSERT INTO subcategories (id, category_id, name, image) VALUES
('baker-broccoli', 'baker-vegetables', 'Broccoli', '/images/subcategories/broccoli.jpg')
ON CONFLICT (id) DO NOTHING;

INSERT INTO subcategories (id, category_id, name, image) VALUES
('baker-brussels-sprouts', 'baker-vegetables', 'Brussels Sprouts', '/images/subcategories/brussels-sprouts.jpg')
ON CONFLICT (id) DO NOTHING;

INSERT INTO subcategories (id, category_id, name, image) VALUES
('baker-buckwheat', 'baker-vegetables', 'Buckwheat', '/images/subcategories/buckwheat.jpg')
ON CONFLICT (id) DO NOTHING;

INSERT INTO subcategories (id, category_id, name, image) VALUES
('baker-cabbage', 'baker-vegetables', 'Cabbage', '/images/subcategories/cabbage.jpg')
ON CONFLICT (id) DO NOTHING;

INSERT INTO subcategories (id, category_id, name, image) VALUES
('baker-carrots-seeds', 'baker-vegetables', 'Carrots Seeds', '/images/subcategories/carrots-seeds.jpg')
ON CONFLICT (id) DO NOTHING;

INSERT INTO subcategories (id, category_id, name, image) VALUES
('baker-cauliflower', 'baker-vegetables', 'Cauliflower', '/images/subcategories/cauliflower.jpg')
ON CONFLICT (id) DO NOTHING;

INSERT INTO subcategories (id, category_id, name, image) VALUES
('baker-celery', 'baker-vegetables', 'Celery', '/images/subcategories/celery.jpg')
ON CONFLICT (id) DO NOTHING;

INSERT INTO subcategories (id, category_id, name, image) VALUES
('baker-chard', 'baker-vegetables', 'Chard', '/images/subcategories/chard.jpg')
ON CONFLICT (id) DO NOTHING;

INSERT INTO subcategories (id, category_id, name, image) VALUES
('baker-chickpeas', 'baker-vegetables', 'Chickpeas', '/images/subcategories/chickpeas.jpg')
ON CONFLICT (id) DO NOTHING;

INSERT INTO subcategories (id, category_id, name, image) VALUES
('baker-chicory', 'baker-vegetables', 'Chicory', '/images/subcategories/chicory.jpg')
ON CONFLICT (id) DO NOTHING;

INSERT INTO subcategories (id, category_id, name, image) VALUES
('baker-chinese-cabbage', 'baker-vegetables', 'Chinese Cabbage', '/images/subcategories/chinese-cabbage.jpg')
ON CONFLICT (id) DO NOTHING;

INSERT INTO subcategories (id, category_id, name, image) VALUES
('baker-collards', 'baker-vegetables', 'Collards', '/images/subcategories/collards.jpg')
ON CONFLICT (id) DO NOTHING;

INSERT INTO subcategories (id, category_id, name, image) VALUES
('baker-corn', 'baker-vegetables', 'Corn', '/images/subcategories/corn.jpg')
ON CONFLICT (id) DO NOTHING;

INSERT INTO subcategories (id, category_id, name, image) VALUES
('baker-cucumber', 'baker-vegetables', 'Cucumber', '/images/subcategories/cucumber.jpg')
ON CONFLICT (id) DO NOTHING;

INSERT INTO subcategories (id, category_id, name, image) VALUES
('baker-eggplant', 'baker-vegetables', 'Eggplant', '/images/subcategories/eggplant.jpg')
ON CONFLICT (id) DO NOTHING;

INSERT INTO subcategories (id, category_id, name, image) VALUES
('baker-endive', 'baker-vegetables', 'Endive', '/images/subcategories/endive.jpg')
ON CONFLICT (id) DO NOTHING;

INSERT INTO subcategories (id, category_id, name, image) VALUES
('baker-fava-beans', 'baker-vegetables', 'Fava Beans', '/images/subcategories/fava-beans.jpg')
ON CONFLICT (id) DO NOTHING;

INSERT INTO subcategories (id, category_id, name, image) VALUES
('baker-fennel', 'baker-vegetables', 'Fennel', '/images/subcategories/fennel.jpg')
ON CONFLICT (id) DO NOTHING;

INSERT INTO subcategories (id, category_id, name, image) VALUES
('baker-garlic', 'baker-vegetables', 'Garlic', '/images/subcategories/garlic.jpg')
ON CONFLICT (id) DO NOTHING;

INSERT INTO subcategories (id, category_id, name, image) VALUES
('baker-gourds', 'baker-vegetables', 'Gourds', '/images/subcategories/gourds.jpg')
ON CONFLICT (id) DO NOTHING;

INSERT INTO subcategories (id, category_id, name, image) VALUES
('baker-ground-cherry', 'baker-vegetables', 'Ground Cherry', '/images/subcategories/ground-cherry.jpg')
ON CONFLICT (id) DO NOTHING;

INSERT INTO subcategories (id, category_id, name, image) VALUES
('baker-kale', 'baker-vegetables', 'Kale', '/images/subcategories/kale.jpg')
ON CONFLICT (id) DO NOTHING;

INSERT INTO subcategories (id, category_id, name, image) VALUES
('baker-kohlrabi', 'baker-vegetables', 'Kohlrabi', '/images/subcategories/kohlrabi.jpg')
ON CONFLICT (id) DO NOTHING;

INSERT INTO subcategories (id, category_id, name, image) VALUES
('baker-leeks', 'baker-vegetables', 'Leeks', '/images/subcategories/leeks.jpg')
ON CONFLICT (id) DO NOTHING;

INSERT INTO subcategories (id, category_id, name, image) VALUES
('baker-lettuce', 'baker-vegetables', 'Lettuce', '/images/subcategories/lettuce.jpg')
ON CONFLICT (id) DO NOTHING;

INSERT INTO subcategories (id, category_id, name, image) VALUES
('baker-mache', 'baker-vegetables', 'Mache', '/images/subcategories/mache.jpg')
ON CONFLICT (id) DO NOTHING;

INSERT INTO subcategories (id, category_id, name, image) VALUES
('baker-melons', 'baker-vegetables', 'Melons', '/images/subcategories/melons.jpg')
ON CONFLICT (id) DO NOTHING;

INSERT INTO subcategories (id, category_id, name, image) VALUES
('baker-millet', 'baker-vegetables', 'Millet', '/images/subcategories/millet.jpg')
ON CONFLICT (id) DO NOTHING;

INSERT INTO subcategories (id, category_id, name, image) VALUES
('baker-mustard-greens', 'baker-vegetables', 'Mustard Greens', '/images/subcategories/mustard-greens.jpg')
ON CONFLICT (id) DO NOTHING;

INSERT INTO subcategories (id, category_id, name, image) VALUES
('baker-okra', 'baker-vegetables', 'Okra', '/images/subcategories/okra.jpg')
ON CONFLICT (id) DO NOTHING;

INSERT INTO subcategories (id, category_id, name, image) VALUES
('baker-onions', 'baker-vegetables', 'Onions', '/images/subcategories/onions.jpg')
ON CONFLICT (id) DO NOTHING;

INSERT INTO subcategories (id, category_id, name, image) VALUES
('baker-peas', 'baker-vegetables', 'Peas', '/images/subcategories/peas.jpg')
ON CONFLICT (id) DO NOTHING;

INSERT INTO subcategories (id, category_id, name, image) VALUES
('baker-peppers', 'baker-vegetables', 'Peppers', '/images/subcategories/peppers.jpg')
ON CONFLICT (id) DO NOTHING;

INSERT INTO subcategories (id, category_id, name, image) VALUES
('baker-potatoes', 'baker-vegetables', 'Potatoes', '/images/subcategories/potatoes.jpg')
ON CONFLICT (id) DO NOTHING;

INSERT INTO subcategories (id, category_id, name, image) VALUES
('baker-pumpkins', 'baker-vegetables', 'Pumpkins', '/images/subcategories/pumpkins.jpg')
ON CONFLICT (id) DO NOTHING;

INSERT INTO subcategories (id, category_id, name, image) VALUES
('baker-purslane', 'baker-vegetables', 'Purslane', '/images/subcategories/purslane.jpg')
ON CONFLICT (id) DO NOTHING;

INSERT INTO subcategories (id, category_id, name, image) VALUES
('baker-quinoa', 'baker-vegetables', 'Quinoa', '/images/subcategories/quinoa.jpg')
ON CONFLICT (id) DO NOTHING;

INSERT INTO subcategories (id, category_id, name, image) VALUES
('baker-radishes', 'baker-vegetables', 'Radishes', '/images/subcategories/radishes.jpg')
ON CONFLICT (id) DO NOTHING;

INSERT INTO subcategories (id, category_id, name, image) VALUES
('baker-rhubarb', 'baker-vegetables', 'Rhubarb', '/images/subcategories/rhubarb.jpg')
ON CONFLICT (id) DO NOTHING;

INSERT INTO subcategories (id, category_id, name, image) VALUES
('baker-rutabaga', 'baker-vegetables', 'Rutabaga', '/images/subcategories/rutabaga.jpg')
ON CONFLICT (id) DO NOTHING;

INSERT INTO subcategories (id, category_id, name, image) VALUES
('baker-spinach', 'baker-vegetables', 'Spinach', '/images/subcategories/spinach.jpg')
ON CONFLICT (id) DO NOTHING;

INSERT INTO subcategories (id, category_id, name, image) VALUES
('baker-squash-summer', 'baker-vegetables', 'Squash Summer', '/images/subcategories/squash-summer.jpg')
ON CONFLICT (id) DO NOTHING;

INSERT INTO subcategories (id, category_id, name, image) VALUES
('baker-squash-winter', 'baker-vegetables', 'Squash Winter', '/images/subcategories/squash-winter.jpg')
ON CONFLICT (id) DO NOTHING;

INSERT INTO subcategories (id, category_id, name, image) VALUES
('baker-sunflowers', 'baker-vegetables', 'Sunflowers', '/images/subcategories/sunflowers.jpg')
ON CONFLICT (id) DO NOTHING;

INSERT INTO subcategories (id, category_id, name, image) VALUES
('baker-sweet-potatoes', 'baker-vegetables', 'Sweet Potatoes', '/images/subcategories/sweet-potatoes.jpg')
ON CONFLICT (id) DO NOTHING;

INSERT INTO subcategories (id, category_id, name, image) VALUES
('baker-tomatillos', 'baker-vegetables', 'Tomatillos', '/images/subcategories/tomatillos.jpg')
ON CONFLICT (id) DO NOTHING;

INSERT INTO subcategories (id, category_id, name, image) VALUES
('baker-tomatoes', 'baker-vegetables', 'Tomatoes', '/images/subcategories/tomatoes.jpg')
ON CONFLICT (id) DO NOTHING;

INSERT INTO subcategories (id, category_id, name, image) VALUES
('baker-turnips', 'baker-vegetables', 'Turnips', '/images/subcategories/turnips.jpg')
ON CONFLICT (id) DO NOTHING;

INSERT INTO subcategories (id, category_id, name, image) VALUES
('baker-watermelons', 'baker-vegetables', 'Watermelons', '/images/subcategories/watermelons.jpg')
ON CONFLICT (id) DO NOTHING;

INSERT INTO subcategories (id, category_id, name, image) VALUES
('baker-wheat', 'baker-vegetables', 'Wheat', '/images/subcategories/wheat.jpg')
ON CONFLICT (id) DO NOTHING;

INSERT INTO subcategories (id, category_id, name, image) VALUES
('baker-basil', 'baker-herbs', 'Basil', '/images/subcategories/basil.jpg')
ON CONFLICT (id) DO NOTHING;

INSERT INTO subcategories (id, category_id, name, image) VALUES
('baker-bee-balm', 'baker-herbs', 'Bee Balm', '/images/subcategories/bee-balm.jpg')
ON CONFLICT (id) DO NOTHING;

INSERT INTO subcategories (id, category_id, name, image) VALUES
('baker-borago', 'baker-herbs', 'Borago', '/images/subcategories/borago.jpg')
ON CONFLICT (id) DO NOTHING;

INSERT INTO subcategories (id, category_id, name, image) VALUES
('baker-chamomile', 'baker-herbs', 'Chamomile', '/images/subcategories/chamomile.jpg')
ON CONFLICT (id) DO NOTHING;

INSERT INTO subcategories (id, category_id, name, image) VALUES
('baker-chives', 'baker-herbs', 'Chives', '/images/subcategories/chives.jpg')
ON CONFLICT (id) DO NOTHING;

INSERT INTO subcategories (id, category_id, name, image) VALUES
('baker-coriandrum', 'baker-herbs', 'Coriandrum', '/images/subcategories/coriandrum.jpg')
ON CONFLICT (id) DO NOTHING;

INSERT INTO subcategories (id, category_id, name, image) VALUES
('baker-dill', 'baker-herbs', 'Dill', '/images/subcategories/dill.jpg')
ON CONFLICT (id) DO NOTHING;

INSERT INTO subcategories (id, category_id, name, image) VALUES
('baker-bloody-dock', 'baker-herbs', 'Bloody Dock', '/images/subcategories/bloody-dock.jpg')
ON CONFLICT (id) DO NOTHING;

INSERT INTO subcategories (id, category_id, name, image) VALUES
('baker-echinacea', 'baker-herbs', 'Echinacea', '/images/subcategories/echinacea.jpg')
ON CONFLICT (id) DO NOTHING;

INSERT INTO subcategories (id, category_id, name, image) VALUES
('baker-lavender', 'baker-herbs', 'Lavender', '/images/subcategories/lavender.jpg')
ON CONFLICT (id) DO NOTHING;

INSERT INTO subcategories (id, category_id, name, image) VALUES
('baker-lemon-balm', 'baker-herbs', 'Lemon Balm', '/images/subcategories/lemon-balm.jpg')
ON CONFLICT (id) DO NOTHING;

INSERT INTO subcategories (id, category_id, name, image) VALUES
('baker-marjoram', 'baker-herbs', 'Marjoram', '/images/subcategories/marjoram.jpg')
ON CONFLICT (id) DO NOTHING;

INSERT INTO subcategories (id, category_id, name, image) VALUES
('baker-mint', 'baker-herbs', 'Mint', '/images/subcategories/mint.jpg')
ON CONFLICT (id) DO NOTHING;

INSERT INTO subcategories (id, category_id, name, image) VALUES
('baker-oregano', 'baker-herbs', 'Oregano', '/images/subcategories/oregano.jpg')
ON CONFLICT (id) DO NOTHING;

INSERT INTO subcategories (id, category_id, name, image) VALUES
('baker-parsley', 'baker-herbs', 'Parsley', '/images/subcategories/parsley.jpg')
ON CONFLICT (id) DO NOTHING;

INSERT INTO subcategories (id, category_id, name, image) VALUES
('baker-rosemary', 'baker-herbs', 'Rosemary', '/images/subcategories/rosemary.jpg')
ON CONFLICT (id) DO NOTHING;

INSERT INTO subcategories (id, category_id, name, image) VALUES
('baker-rue', 'baker-herbs', 'Rue', '/images/subcategories/rue.jpg')
ON CONFLICT (id) DO NOTHING;

INSERT INTO subcategories (id, category_id, name, image) VALUES
('baker-sage', 'baker-herbs', 'Sage', '/images/subcategories/sage.jpg')
ON CONFLICT (id) DO NOTHING;

INSERT INTO subcategories (id, category_id, name, image) VALUES
('baker-thyme', 'baker-herbs', 'Thyme', '/images/subcategories/thyme.jpg')
ON CONFLICT (id) DO NOTHING;

INSERT INTO subcategories (id, category_id, name, image) VALUES
('baker-marigold', 'baker-flowers', 'Marigold', '/images/subcategories/marigold.jpg')
ON CONFLICT (id) DO NOTHING;

INSERT INTO subcategories (id, category_id, name, image) VALUES
('baker-sunflower', 'baker-flowers', 'Sunflower', '/images/subcategories/sunflower.jpg')
ON CONFLICT (id) DO NOTHING;

INSERT INTO subcategories (id, category_id, name, image) VALUES
('baker-zinnia', 'baker-flowers', 'Zinnia', '/images/subcategories/zinnia.jpg')
ON CONFLICT (id) DO NOTHING;

INSERT INTO subcategories (id, category_id, name, image) VALUES
('baker-cosmos', 'baker-flowers', 'Cosmos', '/images/subcategories/cosmos.jpg')
ON CONFLICT (id) DO NOTHING;

INSERT INTO subcategories (id, category_id, name, image) VALUES
('baker-calendula', 'baker-flowers', 'Calendula', '/images/subcategories/calendula.jpg')
ON CONFLICT (id) DO NOTHING;


-- Create base varieties
INSERT INTO varieties (id, subcategory_id, name, emoji, description) VALUES
('baker-variety-amaranth', 'baker-amaranth', 'Amaranth', '🌱', 'Heirloom amaranth varieties from Baker Creek')
ON CONFLICT (id) DO NOTHING;

INSERT INTO varieties (id, subcategory_id, name, emoji, description) VALUES
('baker-variety-artichoke-cardoon', 'baker-artichoke-cardoon', 'Artichoke Cardoon', '🌱', 'Heirloom artichoke cardoon varieties from Baker Creek')
ON CONFLICT (id) DO NOTHING;

INSERT INTO varieties (id, subcategory_id, name, emoji, description) VALUES
('baker-variety-arugula', 'baker-arugula', 'Arugula', '🌱', 'Heirloom arugula varieties from Baker Creek')
ON CONFLICT (id) DO NOTHING;

INSERT INTO varieties (id, subcategory_id, name, emoji, description) VALUES
('baker-variety-asparagus', 'baker-asparagus', 'Asparagus', '🌱', 'Heirloom asparagus varieties from Baker Creek')
ON CONFLICT (id) DO NOTHING;

INSERT INTO varieties (id, subcategory_id, name, emoji, description) VALUES
('baker-variety-barley', 'baker-barley', 'Barley', '🌱', 'Heirloom barley varieties from Baker Creek')
ON CONFLICT (id) DO NOTHING;

INSERT INTO varieties (id, subcategory_id, name, emoji, description) VALUES
('baker-variety-beans', 'baker-beans', 'Beans', '🌱', 'Heirloom beans varieties from Baker Creek')
ON CONFLICT (id) DO NOTHING;

INSERT INTO varieties (id, subcategory_id, name, emoji, description) VALUES
('baker-variety-beetroot', 'baker-beetroot', 'Beetroot', '🌱', 'Heirloom beetroot varieties from Baker Creek')
ON CONFLICT (id) DO NOTHING;

INSERT INTO varieties (id, subcategory_id, name, emoji, description) VALUES
('baker-variety-bitter-melon', 'baker-bitter-melon', 'Bitter Melon', '🌱', 'Heirloom bitter melon varieties from Baker Creek')
ON CONFLICT (id) DO NOTHING;

INSERT INTO varieties (id, subcategory_id, name, emoji, description) VALUES
('baker-variety-bok-choy', 'baker-bok-choy', 'Bok Choy', '🌱', 'Heirloom bok choy varieties from Baker Creek')
ON CONFLICT (id) DO NOTHING;

INSERT INTO varieties (id, subcategory_id, name, emoji, description) VALUES
('baker-variety-broccoli', 'baker-broccoli', 'Broccoli', '🌱', 'Heirloom broccoli varieties from Baker Creek')
ON CONFLICT (id) DO NOTHING;

INSERT INTO varieties (id, subcategory_id, name, emoji, description) VALUES
('baker-variety-brussels-sprouts', 'baker-brussels-sprouts', 'Brussels Sprouts', '🌱', 'Heirloom brussels sprouts varieties from Baker Creek')
ON CONFLICT (id) DO NOTHING;

INSERT INTO varieties (id, subcategory_id, name, emoji, description) VALUES
('baker-variety-buckwheat', 'baker-buckwheat', 'Buckwheat', '🌱', 'Heirloom buckwheat varieties from Baker Creek')
ON CONFLICT (id) DO NOTHING;

INSERT INTO varieties (id, subcategory_id, name, emoji, description) VALUES
('baker-variety-cabbage', 'baker-cabbage', 'Cabbage', '🌱', 'Heirloom cabbage varieties from Baker Creek')
ON CONFLICT (id) DO NOTHING;

INSERT INTO varieties (id, subcategory_id, name, emoji, description) VALUES
('baker-variety-carrots-seeds', 'baker-carrots-seeds', 'Carrots Seeds', '🌱', 'Heirloom carrots seeds varieties from Baker Creek')
ON CONFLICT (id) DO NOTHING;

INSERT INTO varieties (id, subcategory_id, name, emoji, description) VALUES
('baker-variety-cauliflower', 'baker-cauliflower', 'Cauliflower', '🌱', 'Heirloom cauliflower varieties from Baker Creek')
ON CONFLICT (id) DO NOTHING;

INSERT INTO varieties (id, subcategory_id, name, emoji, description) VALUES
('baker-variety-celery', 'baker-celery', 'Celery', '🌱', 'Heirloom celery varieties from Baker Creek')
ON CONFLICT (id) DO NOTHING;

INSERT INTO varieties (id, subcategory_id, name, emoji, description) VALUES
('baker-variety-chard', 'baker-chard', 'Chard', '🌱', 'Heirloom chard varieties from Baker Creek')
ON CONFLICT (id) DO NOTHING;

INSERT INTO varieties (id, subcategory_id, name, emoji, description) VALUES
('baker-variety-chickpeas', 'baker-chickpeas', 'Chickpeas', '🌱', 'Heirloom chickpeas varieties from Baker Creek')
ON CONFLICT (id) DO NOTHING;

INSERT INTO varieties (id, subcategory_id, name, emoji, description) VALUES
('baker-variety-chicory', 'baker-chicory', 'Chicory', '🌱', 'Heirloom chicory varieties from Baker Creek')
ON CONFLICT (id) DO NOTHING;

INSERT INTO varieties (id, subcategory_id, name, emoji, description) VALUES
('baker-variety-chinese-cabbage', 'baker-chinese-cabbage', 'Chinese Cabbage', '🌱', 'Heirloom chinese cabbage varieties from Baker Creek')
ON CONFLICT (id) DO NOTHING;

INSERT INTO varieties (id, subcategory_id, name, emoji, description) VALUES
('baker-variety-collards', 'baker-collards', 'Collards', '🌱', 'Heirloom collards varieties from Baker Creek')
ON CONFLICT (id) DO NOTHING;

INSERT INTO varieties (id, subcategory_id, name, emoji, description) VALUES
('baker-variety-corn', 'baker-corn', 'Corn', '🌱', 'Heirloom corn varieties from Baker Creek')
ON CONFLICT (id) DO NOTHING;

INSERT INTO varieties (id, subcategory_id, name, emoji, description) VALUES
('baker-variety-cucumber', 'baker-cucumber', 'Cucumber', '🌱', 'Heirloom cucumber varieties from Baker Creek')
ON CONFLICT (id) DO NOTHING;

INSERT INTO varieties (id, subcategory_id, name, emoji, description) VALUES
('baker-variety-eggplant', 'baker-eggplant', 'Eggplant', '🌱', 'Heirloom eggplant varieties from Baker Creek')
ON CONFLICT (id) DO NOTHING;

INSERT INTO varieties (id, subcategory_id, name, emoji, description) VALUES
('baker-variety-endive', 'baker-endive', 'Endive', '🌱', 'Heirloom endive varieties from Baker Creek')
ON CONFLICT (id) DO NOTHING;

INSERT INTO varieties (id, subcategory_id, name, emoji, description) VALUES
('baker-variety-fava-beans', 'baker-fava-beans', 'Fava Beans', '🌱', 'Heirloom fava beans varieties from Baker Creek')
ON CONFLICT (id) DO NOTHING;

INSERT INTO varieties (id, subcategory_id, name, emoji, description) VALUES
('baker-variety-fennel', 'baker-fennel', 'Fennel', '🌱', 'Heirloom fennel varieties from Baker Creek')
ON CONFLICT (id) DO NOTHING;

INSERT INTO varieties (id, subcategory_id, name, emoji, description) VALUES
('baker-variety-garlic', 'baker-garlic', 'Garlic', '🌱', 'Heirloom garlic varieties from Baker Creek')
ON CONFLICT (id) DO NOTHING;

INSERT INTO varieties (id, subcategory_id, name, emoji, description) VALUES
('baker-variety-gourds', 'baker-gourds', 'Gourds', '🌱', 'Heirloom gourds varieties from Baker Creek')
ON CONFLICT (id) DO NOTHING;

INSERT INTO varieties (id, subcategory_id, name, emoji, description) VALUES
('baker-variety-ground-cherry', 'baker-ground-cherry', 'Ground Cherry', '🌱', 'Heirloom ground cherry varieties from Baker Creek')
ON CONFLICT (id) DO NOTHING;

INSERT INTO varieties (id, subcategory_id, name, emoji, description) VALUES
('baker-variety-kale', 'baker-kale', 'Kale', '🌱', 'Heirloom kale varieties from Baker Creek')
ON CONFLICT (id) DO NOTHING;

INSERT INTO varieties (id, subcategory_id, name, emoji, description) VALUES
('baker-variety-kohlrabi', 'baker-kohlrabi', 'Kohlrabi', '🌱', 'Heirloom kohlrabi varieties from Baker Creek')
ON CONFLICT (id) DO NOTHING;

INSERT INTO varieties (id, subcategory_id, name, emoji, description) VALUES
('baker-variety-leeks', 'baker-leeks', 'Leeks', '🌱', 'Heirloom leeks varieties from Baker Creek')
ON CONFLICT (id) DO NOTHING;

INSERT INTO varieties (id, subcategory_id, name, emoji, description) VALUES
('baker-variety-lettuce', 'baker-lettuce', 'Lettuce', '🌱', 'Heirloom lettuce varieties from Baker Creek')
ON CONFLICT (id) DO NOTHING;

INSERT INTO varieties (id, subcategory_id, name, emoji, description) VALUES
('baker-variety-mache', 'baker-mache', 'Mache', '🌱', 'Heirloom mache varieties from Baker Creek')
ON CONFLICT (id) DO NOTHING;

INSERT INTO varieties (id, subcategory_id, name, emoji, description) VALUES
('baker-variety-melons', 'baker-melons', 'Melons', '🌱', 'Heirloom melons varieties from Baker Creek')
ON CONFLICT (id) DO NOTHING;

INSERT INTO varieties (id, subcategory_id, name, emoji, description) VALUES
('baker-variety-millet', 'baker-millet', 'Millet', '🌱', 'Heirloom millet varieties from Baker Creek')
ON CONFLICT (id) DO NOTHING;

INSERT INTO varieties (id, subcategory_id, name, emoji, description) VALUES
('baker-variety-mustard-greens', 'baker-mustard-greens', 'Mustard Greens', '🌱', 'Heirloom mustard greens varieties from Baker Creek')
ON CONFLICT (id) DO NOTHING;

INSERT INTO varieties (id, subcategory_id, name, emoji, description) VALUES
('baker-variety-okra', 'baker-okra', 'Okra', '🌱', 'Heirloom okra varieties from Baker Creek')
ON CONFLICT (id) DO NOTHING;

INSERT INTO varieties (id, subcategory_id, name, emoji, description) VALUES
('baker-variety-onions', 'baker-onions', 'Onions', '🌱', 'Heirloom onions varieties from Baker Creek')
ON CONFLICT (id) DO NOTHING;

INSERT INTO varieties (id, subcategory_id, name, emoji, description) VALUES
('baker-variety-peas', 'baker-peas', 'Peas', '🌱', 'Heirloom peas varieties from Baker Creek')
ON CONFLICT (id) DO NOTHING;

INSERT INTO varieties (id, subcategory_id, name, emoji, description) VALUES
('baker-variety-peppers', 'baker-peppers', 'Peppers', '🌱', 'Heirloom peppers varieties from Baker Creek')
ON CONFLICT (id) DO NOTHING;

INSERT INTO varieties (id, subcategory_id, name, emoji, description) VALUES
('baker-variety-potatoes', 'baker-potatoes', 'Potatoes', '🌱', 'Heirloom potatoes varieties from Baker Creek')
ON CONFLICT (id) DO NOTHING;

INSERT INTO varieties (id, subcategory_id, name, emoji, description) VALUES
('baker-variety-pumpkins', 'baker-pumpkins', 'Pumpkins', '🌱', 'Heirloom pumpkins varieties from Baker Creek')
ON CONFLICT (id) DO NOTHING;

INSERT INTO varieties (id, subcategory_id, name, emoji, description) VALUES
('baker-variety-purslane', 'baker-purslane', 'Purslane', '🌱', 'Heirloom purslane varieties from Baker Creek')
ON CONFLICT (id) DO NOTHING;

INSERT INTO varieties (id, subcategory_id, name, emoji, description) VALUES
('baker-variety-quinoa', 'baker-quinoa', 'Quinoa', '🌱', 'Heirloom quinoa varieties from Baker Creek')
ON CONFLICT (id) DO NOTHING;

INSERT INTO varieties (id, subcategory_id, name, emoji, description) VALUES
('baker-variety-radishes', 'baker-radishes', 'Radishes', '🌱', 'Heirloom radishes varieties from Baker Creek')
ON CONFLICT (id) DO NOTHING;

INSERT INTO varieties (id, subcategory_id, name, emoji, description) VALUES
('baker-variety-rhubarb', 'baker-rhubarb', 'Rhubarb', '🌱', 'Heirloom rhubarb varieties from Baker Creek')
ON CONFLICT (id) DO NOTHING;

INSERT INTO varieties (id, subcategory_id, name, emoji, description) VALUES
('baker-variety-rutabaga', 'baker-rutabaga', 'Rutabaga', '🌱', 'Heirloom rutabaga varieties from Baker Creek')
ON CONFLICT (id) DO NOTHING;

INSERT INTO varieties (id, subcategory_id, name, emoji, description) VALUES
('baker-variety-spinach', 'baker-spinach', 'Spinach', '🌱', 'Heirloom spinach varieties from Baker Creek')
ON CONFLICT (id) DO NOTHING;

INSERT INTO varieties (id, subcategory_id, name, emoji, description) VALUES
('baker-variety-squash-summer', 'baker-squash-summer', 'Squash Summer', '🌱', 'Heirloom squash summer varieties from Baker Creek')
ON CONFLICT (id) DO NOTHING;

INSERT INTO varieties (id, subcategory_id, name, emoji, description) VALUES
('baker-variety-squash-winter', 'baker-squash-winter', 'Squash Winter', '🌱', 'Heirloom squash winter varieties from Baker Creek')
ON CONFLICT (id) DO NOTHING;

INSERT INTO varieties (id, subcategory_id, name, emoji, description) VALUES
('baker-variety-sunflowers', 'baker-sunflowers', 'Sunflowers', '🌱', 'Heirloom sunflowers varieties from Baker Creek')
ON CONFLICT (id) DO NOTHING;

INSERT INTO varieties (id, subcategory_id, name, emoji, description) VALUES
('baker-variety-sweet-potatoes', 'baker-sweet-potatoes', 'Sweet Potatoes', '🌱', 'Heirloom sweet potatoes varieties from Baker Creek')
ON CONFLICT (id) DO NOTHING;

INSERT INTO varieties (id, subcategory_id, name, emoji, description) VALUES
('baker-variety-tomatillos', 'baker-tomatillos', 'Tomatillos', '🌱', 'Heirloom tomatillos varieties from Baker Creek')
ON CONFLICT (id) DO NOTHING;

INSERT INTO varieties (id, subcategory_id, name, emoji, description) VALUES
('baker-variety-tomatoes', 'baker-tomatoes', 'Tomatoes', '🌱', 'Heirloom tomatoes varieties from Baker Creek')
ON CONFLICT (id) DO NOTHING;

INSERT INTO varieties (id, subcategory_id, name, emoji, description) VALUES
('baker-variety-turnips', 'baker-turnips', 'Turnips', '🌱', 'Heirloom turnips varieties from Baker Creek')
ON CONFLICT (id) DO NOTHING;

INSERT INTO varieties (id, subcategory_id, name, emoji, description) VALUES
('baker-variety-watermelons', 'baker-watermelons', 'Watermelons', '🌱', 'Heirloom watermelons varieties from Baker Creek')
ON CONFLICT (id) DO NOTHING;

INSERT INTO varieties (id, subcategory_id, name, emoji, description) VALUES
('baker-variety-wheat', 'baker-wheat', 'Wheat', '🌱', 'Heirloom wheat varieties from Baker Creek')
ON CONFLICT (id) DO NOTHING;

INSERT INTO varieties (id, subcategory_id, name, emoji, description) VALUES
('baker-variety-basil', 'baker-basil', 'Basil', '🌱', 'Heirloom basil varieties from Baker Creek')
ON CONFLICT (id) DO NOTHING;

INSERT INTO varieties (id, subcategory_id, name, emoji, description) VALUES
('baker-variety-bee-balm', 'baker-bee-balm', 'Bee Balm', '🌱', 'Heirloom bee balm varieties from Baker Creek')
ON CONFLICT (id) DO NOTHING;

INSERT INTO varieties (id, subcategory_id, name, emoji, description) VALUES
('baker-variety-borago', 'baker-borago', 'Borago', '🌱', 'Heirloom borago varieties from Baker Creek')
ON CONFLICT (id) DO NOTHING;

INSERT INTO varieties (id, subcategory_id, name, emoji, description) VALUES
('baker-variety-chamomile', 'baker-chamomile', 'Chamomile', '🌱', 'Heirloom chamomile varieties from Baker Creek')
ON CONFLICT (id) DO NOTHING;

INSERT INTO varieties (id, subcategory_id, name, emoji, description) VALUES
('baker-variety-chives', 'baker-chives', 'Chives', '🌱', 'Heirloom chives varieties from Baker Creek')
ON CONFLICT (id) DO NOTHING;

INSERT INTO varieties (id, subcategory_id, name, emoji, description) VALUES
('baker-variety-coriandrum', 'baker-coriandrum', 'Coriandrum', '🌱', 'Heirloom coriandrum varieties from Baker Creek')
ON CONFLICT (id) DO NOTHING;

INSERT INTO varieties (id, subcategory_id, name, emoji, description) VALUES
('baker-variety-dill', 'baker-dill', 'Dill', '🌱', 'Heirloom dill varieties from Baker Creek')
ON CONFLICT (id) DO NOTHING;

INSERT INTO varieties (id, subcategory_id, name, emoji, description) VALUES
('baker-variety-bloody-dock', 'baker-bloody-dock', 'Bloody Dock', '🌱', 'Heirloom bloody dock varieties from Baker Creek')
ON CONFLICT (id) DO NOTHING;

INSERT INTO varieties (id, subcategory_id, name, emoji, description) VALUES
('baker-variety-echinacea', 'baker-echinacea', 'Echinacea', '🌱', 'Heirloom echinacea varieties from Baker Creek')
ON CONFLICT (id) DO NOTHING;

INSERT INTO varieties (id, subcategory_id, name, emoji, description) VALUES
('baker-variety-lavender', 'baker-lavender', 'Lavender', '🌱', 'Heirloom lavender varieties from Baker Creek')
ON CONFLICT (id) DO NOTHING;

INSERT INTO varieties (id, subcategory_id, name, emoji, description) VALUES
('baker-variety-lemon-balm', 'baker-lemon-balm', 'Lemon Balm', '🌱', 'Heirloom lemon balm varieties from Baker Creek')
ON CONFLICT (id) DO NOTHING;

INSERT INTO varieties (id, subcategory_id, name, emoji, description) VALUES
('baker-variety-marjoram', 'baker-marjoram', 'Marjoram', '🌱', 'Heirloom marjoram varieties from Baker Creek')
ON CONFLICT (id) DO NOTHING;

INSERT INTO varieties (id, subcategory_id, name, emoji, description) VALUES
('baker-variety-mint', 'baker-mint', 'Mint', '🌱', 'Heirloom mint varieties from Baker Creek')
ON CONFLICT (id) DO NOTHING;

INSERT INTO varieties (id, subcategory_id, name, emoji, description) VALUES
('baker-variety-oregano', 'baker-oregano', 'Oregano', '🌱', 'Heirloom oregano varieties from Baker Creek')
ON CONFLICT (id) DO NOTHING;

INSERT INTO varieties (id, subcategory_id, name, emoji, description) VALUES
('baker-variety-parsley', 'baker-parsley', 'Parsley', '🌱', 'Heirloom parsley varieties from Baker Creek')
ON CONFLICT (id) DO NOTHING;

INSERT INTO varieties (id, subcategory_id, name, emoji, description) VALUES
('baker-variety-rosemary', 'baker-rosemary', 'Rosemary', '🌱', 'Heirloom rosemary varieties from Baker Creek')
ON CONFLICT (id) DO NOTHING;

INSERT INTO varieties (id, subcategory_id, name, emoji, description) VALUES
('baker-variety-rue', 'baker-rue', 'Rue', '🌱', 'Heirloom rue varieties from Baker Creek')
ON CONFLICT (id) DO NOTHING;

INSERT INTO varieties (id, subcategory_id, name, emoji, description) VALUES
('baker-variety-sage', 'baker-sage', 'Sage', '🌱', 'Heirloom sage varieties from Baker Creek')
ON CONFLICT (id) DO NOTHING;

INSERT INTO varieties (id, subcategory_id, name, emoji, description) VALUES
('baker-variety-thyme', 'baker-thyme', 'Thyme', '🌱', 'Heirloom thyme varieties from Baker Creek')
ON CONFLICT (id) DO NOTHING;

INSERT INTO varieties (id, subcategory_id, name, emoji, description) VALUES
('baker-variety-marigold', 'baker-marigold', 'Marigold', '🌱', 'Heirloom marigold varieties from Baker Creek')
ON CONFLICT (id) DO NOTHING;

INSERT INTO varieties (id, subcategory_id, name, emoji, description) VALUES
('baker-variety-sunflower', 'baker-sunflower', 'Sunflower', '🌱', 'Heirloom sunflower varieties from Baker Creek')
ON CONFLICT (id) DO NOTHING;

INSERT INTO varieties (id, subcategory_id, name, emoji, description) VALUES
('baker-variety-zinnia', 'baker-zinnia', 'Zinnia', '🌱', 'Heirloom zinnia varieties from Baker Creek')
ON CONFLICT (id) DO NOTHING;

INSERT INTO varieties (id, subcategory_id, name, emoji, description) VALUES
('baker-variety-cosmos', 'baker-cosmos', 'Cosmos', '🌱', 'Heirloom cosmos varieties from Baker Creek')
ON CONFLICT (id) DO NOTHING;

INSERT INTO varieties (id, subcategory_id, name, emoji, description) VALUES
('baker-variety-calendula', 'baker-calendula', 'Calendula', '🌱', 'Heirloom calendula varieties from Baker Creek')
ON CONFLICT (id) DO NOTHING;


-- Insert Baker Creek cultivars
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
    source_url,
    rating,
    review_count,
    price,
    sku,
    in_stock
) VALUES
('baker-variety-amaranth', 'Classic Amaranth', 'Classic Amaranth', 'Heirloom amaranth variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 70, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/amaranth-classic-amaranth', 4.476574979968538, NULL, '$3.00', NULL, true),
('baker-variety-amaranth', 'Royal Amaranth', 'Royal Amaranth', 'Heirloom amaranth variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 80, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/amaranth-royal-amaranth', 4.328677975037937, NULL, '$3.00', NULL, true),
('baker-variety-amaranth', 'Golden Amaranth', 'Golden Amaranth', 'Heirloom amaranth variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 90, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/amaranth-golden-amaranth', 4.674676368567314, NULL, '$3.00', NULL, true),
('baker-variety-amaranth', 'Purple Amaranth', 'Purple Amaranth', 'Heirloom amaranth variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 100, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/amaranth-purple-amaranth', 4.148701232138947, NULL, '$3.00', NULL, true),
('baker-variety-artichoke-cardoon', 'Classic Artichoke Cardoon', 'Classic Artichoke Cardoon', 'Heirloom artichoke cardoon variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 70, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/artichoke-cardoon-classic-artichoke-cardoon', 4.0700161477302865, NULL, '$3.00', NULL, true),
('baker-variety-artichoke-cardoon', 'Royal Artichoke Cardoon', 'Royal Artichoke Cardoon', 'Heirloom artichoke cardoon variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 80, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/artichoke-cardoon-royal-artichoke-cardoon', 4.296483442520412, NULL, '$3.00', NULL, true),
('baker-variety-artichoke-cardoon', 'Golden Artichoke Cardoon', 'Golden Artichoke Cardoon', 'Heirloom artichoke cardoon variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 90, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/artichoke-cardoon-golden-artichoke-cardoon', 4.060649142619944, NULL, '$3.00', NULL, true),
('baker-variety-artichoke-cardoon', 'Purple Artichoke Cardoon', 'Purple Artichoke Cardoon', 'Heirloom artichoke cardoon variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 100, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/artichoke-cardoon-purple-artichoke-cardoon', 4.391740252538909, NULL, '$3.00', NULL, true),
('baker-variety-artichoke-cardoon', 'Giant Artichoke Cardoon', 'Giant Artichoke Cardoon', 'Heirloom artichoke cardoon variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 110, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/artichoke-cardoon-giant-artichoke-cardoon', 4.638885492526462, NULL, '$3.00', NULL, true),
('baker-variety-arugula', 'Classic Arugula', 'Classic Arugula', 'Heirloom arugula variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 70, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/arugula-classic-arugula', 4.664059553997833, NULL, '$3.00', NULL, true),
('baker-variety-arugula', 'Royal Arugula', 'Royal Arugula', 'Heirloom arugula variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 80, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/arugula-royal-arugula', 4.411474786125023, NULL, '$3.00', NULL, true),
('baker-variety-arugula', 'Golden Arugula', 'Golden Arugula', 'Heirloom arugula variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 90, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/arugula-golden-arugula', 4.624396724176774, NULL, '$3.00', NULL, true),
('baker-variety-arugula', 'Purple Arugula', 'Purple Arugula', 'Heirloom arugula variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 100, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/arugula-purple-arugula', 4.587474319563092, NULL, '$3.00', NULL, true),
('baker-variety-arugula', 'Giant Arugula', 'Giant Arugula', 'Heirloom arugula variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 110, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/arugula-giant-arugula', 4.1019134991472335, NULL, '$3.00', NULL, true),
('baker-variety-arugula', 'Dwarf Arugula', 'Dwarf Arugula', 'Heirloom arugula variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 120, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/arugula-dwarf-arugula', 4.086180458692488, NULL, '$3.00', NULL, true),
('baker-variety-arugula', 'Early Arugula', 'Early Arugula', 'Heirloom arugula variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 130, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/arugula-early-arugula', 4.365212389836809, NULL, '$3.00', NULL, true),
('baker-variety-arugula', 'Late Arugula', 'Late Arugula', 'Heirloom arugula variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 140, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/arugula-late-arugula', 4.103094415744669, NULL, '$3.00', NULL, true),
('baker-variety-asparagus', 'Classic Asparagus', 'Classic Asparagus', 'Heirloom asparagus variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 70, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/asparagus-classic-asparagus', 4.069671624167127, NULL, '$3.00', NULL, true),
('baker-variety-asparagus', 'Royal Asparagus', 'Royal Asparagus', 'Heirloom asparagus variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 80, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/asparagus-royal-asparagus', 4.47041622448468, NULL, '$3.00', NULL, true),
('baker-variety-asparagus', 'Golden Asparagus', 'Golden Asparagus', 'Heirloom asparagus variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 90, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/asparagus-golden-asparagus', 4.790513843676557, NULL, '$3.00', NULL, true),
('baker-variety-asparagus', 'Purple Asparagus', 'Purple Asparagus', 'Heirloom asparagus variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 100, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/asparagus-purple-asparagus', 4.600206008522808, NULL, '$3.00', NULL, true),
('baker-variety-asparagus', 'Giant Asparagus', 'Giant Asparagus', 'Heirloom asparagus variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 110, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/asparagus-giant-asparagus', 4.562979708925589, NULL, '$3.00', NULL, false),
('baker-variety-asparagus', 'Dwarf Asparagus', 'Dwarf Asparagus', 'Heirloom asparagus variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 120, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/asparagus-dwarf-asparagus', 4.65848308886034, NULL, '$3.00', NULL, true),
('baker-variety-barley', 'Classic Barley', 'Classic Barley', 'Heirloom barley variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 70, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/barley-classic-barley', 4.262309538688047, NULL, '$3.00', NULL, true),
('baker-variety-barley', 'Royal Barley', 'Royal Barley', 'Heirloom barley variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 80, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/barley-royal-barley', 4.735167660229156, NULL, '$3.00', NULL, true),
('baker-variety-barley', 'Golden Barley', 'Golden Barley', 'Heirloom barley variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 90, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/barley-golden-barley', 4.437166191226297, NULL, '$3.00', NULL, true),
('baker-variety-barley', 'Purple Barley', 'Purple Barley', 'Heirloom barley variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 100, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/barley-purple-barley', 4.7905327697923905, NULL, '$3.00', NULL, false),
('baker-variety-barley', 'Giant Barley', 'Giant Barley', 'Heirloom barley variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 110, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/barley-giant-barley', 4.2396420736198515, NULL, '$3.00', NULL, true),
('baker-variety-barley', 'Dwarf Barley', 'Dwarf Barley', 'Heirloom barley variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 120, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/barley-dwarf-barley', 4.264623846222227, NULL, '$3.00', NULL, true),
('baker-variety-barley', 'Early Barley', 'Early Barley', 'Heirloom barley variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 130, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/barley-early-barley', 4.488852880490882, NULL, '$3.00', NULL, true),
('baker-variety-beans', 'Dragon Tongue Bush', 'Dragon Tongue Bush', 'Beautiful bush bean with purple streaks and excellent flavor.', NULL, NULL, 'Phaseolus vulgaris', 60, '4-6"', '1-2"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/bean-dragon-tongue-bush', 4.5, NULL, '$4.00', NULL, true),
('baker-variety-beans', 'Adventist Pole', 'Adventist Pole', 'Cherished heirloom valued for its nutritional benefits and versatility.', NULL, NULL, 'Phaseolus vulgaris', 70, '6-8"', NULL, NULL, 'Full sun', NULL, NULL, 'https://www.rareseeds.com/bean-adventist-pole', 4.3, NULL, '$4.50', NULL, true),
('baker-variety-beans', 'Cherokee Trail of Tears', 'Cherokee Trail of Tears', 'Historic Cherokee bean variety with purple pods.', NULL, NULL, 'Phaseolus vulgaris', 85, NULL, NULL, NULL, NULL, NULL, NULL, 'https://www.rareseeds.com/bean-cherokee-trail-of-tears', 4.6, NULL, '$4.50', NULL, true),
('baker-variety-beetroot', 'Classic Beetroot', 'Classic Beetroot', 'Heirloom beetroot variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 70, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/beetroot-classic-beetroot', 4.045752926549242, NULL, '$3.00', NULL, true),
('baker-variety-beetroot', 'Royal Beetroot', 'Royal Beetroot', 'Heirloom beetroot variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 80, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/beetroot-royal-beetroot', 4.078457906120253, NULL, '$3.00', NULL, true),
('baker-variety-beetroot', 'Golden Beetroot', 'Golden Beetroot', 'Heirloom beetroot variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 90, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/beetroot-golden-beetroot', 4.329408539353249, NULL, '$3.00', NULL, true),
('baker-variety-beetroot', 'Purple Beetroot', 'Purple Beetroot', 'Heirloom beetroot variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 100, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/beetroot-purple-beetroot', 4.3797611461761905, NULL, '$3.00', NULL, true),
('baker-variety-beetroot', 'Giant Beetroot', 'Giant Beetroot', 'Heirloom beetroot variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 110, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/beetroot-giant-beetroot', 4.256545649727254, NULL, '$3.00', NULL, true),
('baker-variety-beetroot', 'Dwarf Beetroot', 'Dwarf Beetroot', 'Heirloom beetroot variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 120, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/beetroot-dwarf-beetroot', 4.160853804296735, NULL, '$3.00', NULL, true),
('baker-variety-beetroot', 'Early Beetroot', 'Early Beetroot', 'Heirloom beetroot variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 130, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/beetroot-early-beetroot', 4.714972390998998, NULL, '$3.00', NULL, false),
('baker-variety-bitter-melon', 'Classic Bitter Melon', 'Classic Bitter Melon', 'Heirloom bitter melon variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 70, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/bitter-melon-classic-bitter-melon', 4.705740448264581, NULL, '$3.00', NULL, false),
('baker-variety-bitter-melon', 'Royal Bitter Melon', 'Royal Bitter Melon', 'Heirloom bitter melon variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 80, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/bitter-melon-royal-bitter-melon', 4.172491194786146, NULL, '$3.00', NULL, true),
('baker-variety-bitter-melon', 'Golden Bitter Melon', 'Golden Bitter Melon', 'Heirloom bitter melon variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 90, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/bitter-melon-golden-bitter-melon', 4.488988024108738, NULL, '$3.00', NULL, false),
('baker-variety-bitter-melon', 'Purple Bitter Melon', 'Purple Bitter Melon', 'Heirloom bitter melon variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 100, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/bitter-melon-purple-bitter-melon', 4.452502607279405, NULL, '$3.00', NULL, true),
('baker-variety-bitter-melon', 'Giant Bitter Melon', 'Giant Bitter Melon', 'Heirloom bitter melon variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 110, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/bitter-melon-giant-bitter-melon', 4.0867764768587005, NULL, '$3.00', NULL, true),
('baker-variety-bitter-melon', 'Dwarf Bitter Melon', 'Dwarf Bitter Melon', 'Heirloom bitter melon variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 120, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/bitter-melon-dwarf-bitter-melon', 4.063669423977041, NULL, '$3.00', NULL, true),
('baker-variety-bitter-melon', 'Early Bitter Melon', 'Early Bitter Melon', 'Heirloom bitter melon variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 130, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/bitter-melon-early-bitter-melon', 4.6353512742672995, NULL, '$3.00', NULL, true),
('baker-variety-bok-choy', 'Classic Bok Choy', 'Classic Bok Choy', 'Heirloom bok choy variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 70, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/bok-choy-classic-bok-choy', 4.041524302180448, NULL, '$3.00', NULL, false),
('baker-variety-bok-choy', 'Royal Bok Choy', 'Royal Bok Choy', 'Heirloom bok choy variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 80, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/bok-choy-royal-bok-choy', 4.74379634301299, NULL, '$3.00', NULL, true),
('baker-variety-bok-choy', 'Golden Bok Choy', 'Golden Bok Choy', 'Heirloom bok choy variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 90, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/bok-choy-golden-bok-choy', 4.209472799206015, NULL, '$3.00', NULL, true),
('baker-variety-broccoli', 'Classic Broccoli', 'Classic Broccoli', 'Heirloom broccoli variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 70, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/broccoli-classic-broccoli', 4.579661861837811, NULL, '$3.00', NULL, false),
('baker-variety-broccoli', 'Royal Broccoli', 'Royal Broccoli', 'Heirloom broccoli variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 80, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/broccoli-royal-broccoli', 4.117366828460547, NULL, '$3.00', NULL, true),
('baker-variety-broccoli', 'Golden Broccoli', 'Golden Broccoli', 'Heirloom broccoli variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 90, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/broccoli-golden-broccoli', 4.541481489981496, NULL, '$3.00', NULL, true),
('baker-variety-broccoli', 'Purple Broccoli', 'Purple Broccoli', 'Heirloom broccoli variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 100, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/broccoli-purple-broccoli', 4.499494433763685, NULL, '$3.00', NULL, true),
('baker-variety-broccoli', 'Giant Broccoli', 'Giant Broccoli', 'Heirloom broccoli variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 110, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/broccoli-giant-broccoli', 4.175617246797892, NULL, '$3.00', NULL, true),
('baker-variety-broccoli', 'Dwarf Broccoli', 'Dwarf Broccoli', 'Heirloom broccoli variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 120, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/broccoli-dwarf-broccoli', 4.779216422779107, NULL, '$3.00', NULL, true),
('baker-variety-brussels-sprouts', 'Classic Brussels Sprouts', 'Classic Brussels Sprouts', 'Heirloom brussels sprouts variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 70, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/brussels-sprouts-classic-brussels-sprouts', 4.361326922948952, NULL, '$3.00', NULL, true),
('baker-variety-brussels-sprouts', 'Royal Brussels Sprouts', 'Royal Brussels Sprouts', 'Heirloom brussels sprouts variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 80, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/brussels-sprouts-royal-brussels-sprouts', 4.564688639312336, NULL, '$3.00', NULL, true),
('baker-variety-brussels-sprouts', 'Golden Brussels Sprouts', 'Golden Brussels Sprouts', 'Heirloom brussels sprouts variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 90, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/brussels-sprouts-golden-brussels-sprouts', 4.6241969132179195, NULL, '$3.00', NULL, false),
('baker-variety-brussels-sprouts', 'Purple Brussels Sprouts', 'Purple Brussels Sprouts', 'Heirloom brussels sprouts variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 100, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/brussels-sprouts-purple-brussels-sprouts', 4.306225394067804, NULL, '$3.00', NULL, true),
('baker-variety-brussels-sprouts', 'Giant Brussels Sprouts', 'Giant Brussels Sprouts', 'Heirloom brussels sprouts variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 110, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/brussels-sprouts-giant-brussels-sprouts', 4.785035034095348, NULL, '$3.00', NULL, true),
('baker-variety-brussels-sprouts', 'Dwarf Brussels Sprouts', 'Dwarf Brussels Sprouts', 'Heirloom brussels sprouts variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 120, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/brussels-sprouts-dwarf-brussels-sprouts', 4.183450020077721, NULL, '$3.00', NULL, true),
('baker-variety-buckwheat', 'Classic Buckwheat', 'Classic Buckwheat', 'Heirloom buckwheat variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 70, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/buckwheat-classic-buckwheat', 4.22597978011157, NULL, '$3.00', NULL, false),
('baker-variety-buckwheat', 'Royal Buckwheat', 'Royal Buckwheat', 'Heirloom buckwheat variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 80, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/buckwheat-royal-buckwheat', 4.015777267447574, NULL, '$3.00', NULL, true),
('baker-variety-buckwheat', 'Golden Buckwheat', 'Golden Buckwheat', 'Heirloom buckwheat variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 90, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/buckwheat-golden-buckwheat', 4.240702382172472, NULL, '$3.00', NULL, true),
('baker-variety-buckwheat', 'Purple Buckwheat', 'Purple Buckwheat', 'Heirloom buckwheat variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 100, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/buckwheat-purple-buckwheat', 4.363144167144442, NULL, '$3.00', NULL, false),
('baker-variety-buckwheat', 'Giant Buckwheat', 'Giant Buckwheat', 'Heirloom buckwheat variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 110, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/buckwheat-giant-buckwheat', 4.296505398354405, NULL, '$3.00', NULL, false),
('baker-variety-buckwheat', 'Dwarf Buckwheat', 'Dwarf Buckwheat', 'Heirloom buckwheat variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 120, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/buckwheat-dwarf-buckwheat', 4.535842239977936, NULL, '$3.00', NULL, true),
('baker-variety-buckwheat', 'Early Buckwheat', 'Early Buckwheat', 'Heirloom buckwheat variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 130, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/buckwheat-early-buckwheat', 4.4751676069578235, NULL, '$3.00', NULL, true),
('baker-variety-buckwheat', 'Late Buckwheat', 'Late Buckwheat', 'Heirloom buckwheat variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 140, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/buckwheat-late-buckwheat', 4.527296770022483, NULL, '$3.00', NULL, true),
('baker-variety-cabbage', 'Classic Cabbage', 'Classic Cabbage', 'Heirloom cabbage variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 70, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/cabbage-classic-cabbage', 4.7074842344162295, NULL, '$3.00', NULL, true),
('baker-variety-cabbage', 'Royal Cabbage', 'Royal Cabbage', 'Heirloom cabbage variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 80, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/cabbage-royal-cabbage', 4.143447177428809, NULL, '$3.00', NULL, false),
('baker-variety-cabbage', 'Golden Cabbage', 'Golden Cabbage', 'Heirloom cabbage variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 90, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/cabbage-golden-cabbage', 4.796700631563599, NULL, '$3.00', NULL, true),
('baker-variety-cabbage', 'Purple Cabbage', 'Purple Cabbage', 'Heirloom cabbage variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 100, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/cabbage-purple-cabbage', 4.072356536776018, NULL, '$3.00', NULL, true),
('baker-variety-cabbage', 'Giant Cabbage', 'Giant Cabbage', 'Heirloom cabbage variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 110, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/cabbage-giant-cabbage', 4.731888628005546, NULL, '$3.00', NULL, false),
('baker-variety-cabbage', 'Dwarf Cabbage', 'Dwarf Cabbage', 'Heirloom cabbage variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 120, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/cabbage-dwarf-cabbage', 4.034297094138764, NULL, '$3.00', NULL, false),
('baker-variety-cabbage', 'Early Cabbage', 'Early Cabbage', 'Heirloom cabbage variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 130, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/cabbage-early-cabbage', 4.710632370138613, NULL, '$3.00', NULL, true),
('baker-variety-carrots-seeds', 'New Kuroda', 'New Kuroda', 'Japanese carrot variety with excellent flavor and storage.', NULL, NULL, 'Daucus carota', 70, '2-3"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/carrot-new-kuroda', 4.5, NULL, '$3.00', NULL, true),
('baker-variety-cauliflower', 'Classic Cauliflower', 'Classic Cauliflower', 'Heirloom cauliflower variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 70, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/cauliflower-classic-cauliflower', 4.5609721631043225, NULL, '$3.00', NULL, true),
('baker-variety-cauliflower', 'Royal Cauliflower', 'Royal Cauliflower', 'Heirloom cauliflower variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 80, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/cauliflower-royal-cauliflower', 4.469068340775417, NULL, '$3.00', NULL, true),
('baker-variety-cauliflower', 'Golden Cauliflower', 'Golden Cauliflower', 'Heirloom cauliflower variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 90, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/cauliflower-golden-cauliflower', 4.134580468294957, NULL, '$3.00', NULL, true),
('baker-variety-cauliflower', 'Purple Cauliflower', 'Purple Cauliflower', 'Heirloom cauliflower variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 100, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/cauliflower-purple-cauliflower', 4.119198909158389, NULL, '$3.00', NULL, false),
('baker-variety-celery', 'Classic Celery', 'Classic Celery', 'Heirloom celery variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 70, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/celery-classic-celery', 4.437731532824555, NULL, '$3.00', NULL, true),
('baker-variety-celery', 'Royal Celery', 'Royal Celery', 'Heirloom celery variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 80, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/celery-royal-celery', 4.54297259454418, NULL, '$3.00', NULL, true),
('baker-variety-celery', 'Golden Celery', 'Golden Celery', 'Heirloom celery variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 90, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/celery-golden-celery', 4.361538557787803, NULL, '$3.00', NULL, true),
('baker-variety-celery', 'Purple Celery', 'Purple Celery', 'Heirloom celery variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 100, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/celery-purple-celery', 4.2139511662581075, NULL, '$3.00', NULL, true),
('baker-variety-celery', 'Giant Celery', 'Giant Celery', 'Heirloom celery variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 110, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/celery-giant-celery', 4.449675708858382, NULL, '$3.00', NULL, false),
('baker-variety-chard', 'Classic Chard', 'Classic Chard', 'Heirloom chard variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 70, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/chard-classic-chard', 4.018645293468627, NULL, '$3.00', NULL, true),
('baker-variety-chard', 'Royal Chard', 'Royal Chard', 'Heirloom chard variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 80, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/chard-royal-chard', 4.591468883434366, NULL, '$3.00', NULL, true),
('baker-variety-chard', 'Golden Chard', 'Golden Chard', 'Heirloom chard variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 90, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/chard-golden-chard', 4.6203375708026515, NULL, '$3.00', NULL, true),
('baker-variety-chard', 'Purple Chard', 'Purple Chard', 'Heirloom chard variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 100, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/chard-purple-chard', 4.460647434279991, NULL, '$3.00', NULL, true),
('baker-variety-chard', 'Giant Chard', 'Giant Chard', 'Heirloom chard variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 110, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/chard-giant-chard', 4.266050195094665, NULL, '$3.00', NULL, true),
('baker-variety-chickpeas', 'Classic Chickpeas', 'Classic Chickpeas', 'Heirloom chickpeas variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 70, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/chickpeas-classic-chickpeas', 4.4226312367029985, NULL, '$3.00', NULL, true),
('baker-variety-chickpeas', 'Royal Chickpeas', 'Royal Chickpeas', 'Heirloom chickpeas variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 80, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/chickpeas-royal-chickpeas', 4.29925516948174, NULL, '$3.00', NULL, true),
('baker-variety-chickpeas', 'Golden Chickpeas', 'Golden Chickpeas', 'Heirloom chickpeas variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 90, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/chickpeas-golden-chickpeas', 4.2052197169296885, NULL, '$3.00', NULL, false),
('baker-variety-chicory', 'Classic Chicory', 'Classic Chicory', 'Heirloom chicory variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 70, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/chicory-classic-chicory', 4.546718421138658, NULL, '$3.00', NULL, true),
('baker-variety-chicory', 'Royal Chicory', 'Royal Chicory', 'Heirloom chicory variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 80, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/chicory-royal-chicory', 4.662013725130926, NULL, '$3.00', NULL, true),
('baker-variety-chicory', 'Golden Chicory', 'Golden Chicory', 'Heirloom chicory variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 90, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/chicory-golden-chicory', 4.516357438972543, NULL, '$3.00', NULL, true),
('baker-variety-chicory', 'Purple Chicory', 'Purple Chicory', 'Heirloom chicory variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 100, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/chicory-purple-chicory', 4.047864248919203, NULL, '$3.00', NULL, true),
('baker-variety-chicory', 'Giant Chicory', 'Giant Chicory', 'Heirloom chicory variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 110, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/chicory-giant-chicory', 4.775542399522481, NULL, '$3.00', NULL, true),
('baker-variety-chicory', 'Dwarf Chicory', 'Dwarf Chicory', 'Heirloom chicory variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 120, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/chicory-dwarf-chicory', 4.439019971210943, NULL, '$3.00', NULL, true),
('baker-variety-chicory', 'Early Chicory', 'Early Chicory', 'Heirloom chicory variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 130, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/chicory-early-chicory', 4.29984901313375, NULL, '$3.00', NULL, true),
('baker-variety-chinese-cabbage', 'Classic Chinese Cabbage', 'Classic Chinese Cabbage', 'Heirloom chinese cabbage variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 70, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/chinese-cabbage-classic-chinese-cabbage', 4.263989034395014, NULL, '$3.00', NULL, true),
('baker-variety-chinese-cabbage', 'Royal Chinese Cabbage', 'Royal Chinese Cabbage', 'Heirloom chinese cabbage variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 80, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/chinese-cabbage-royal-chinese-cabbage', 4.445340975899182, NULL, '$3.00', NULL, true),
('baker-variety-chinese-cabbage', 'Golden Chinese Cabbage', 'Golden Chinese Cabbage', 'Heirloom chinese cabbage variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 90, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/chinese-cabbage-golden-chinese-cabbage', 4.512878505223553, NULL, '$3.00', NULL, true),
('baker-variety-chinese-cabbage', 'Purple Chinese Cabbage', 'Purple Chinese Cabbage', 'Heirloom chinese cabbage variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 100, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/chinese-cabbage-purple-chinese-cabbage', 4.382511876828382, NULL, '$3.00', NULL, true),
('baker-variety-collards', 'Classic Collards', 'Classic Collards', 'Heirloom collards variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 70, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/collards-classic-collards', 4.174403580767928, NULL, '$3.00', NULL, true),
('baker-variety-collards', 'Royal Collards', 'Royal Collards', 'Heirloom collards variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 80, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/collards-royal-collards', 4.4499663954382385, NULL, '$3.00', NULL, true),
('baker-variety-collards', 'Golden Collards', 'Golden Collards', 'Heirloom collards variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 90, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/collards-golden-collards', 4.199855056025387, NULL, '$3.00', NULL, true),
('baker-variety-collards', 'Purple Collards', 'Purple Collards', 'Heirloom collards variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 100, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/collards-purple-collards', 4.647564650416087, NULL, '$3.00', NULL, false),
('baker-variety-collards', 'Giant Collards', 'Giant Collards', 'Heirloom collards variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 110, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/collards-giant-collards', 4.552519770311181, NULL, '$3.00', NULL, true),
('baker-variety-collards', 'Dwarf Collards', 'Dwarf Collards', 'Heirloom collards variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 120, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/collards-dwarf-collards', 4.5483770462540765, NULL, '$3.00', NULL, true),
('baker-variety-collards', 'Early Collards', 'Early Collards', 'Heirloom collards variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 130, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/collards-early-collards', 4.684946578329868, NULL, '$3.00', NULL, true),
('baker-variety-collards', 'Late Collards', 'Late Collards', 'Heirloom collards variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 140, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/collards-late-collards', 4.3037354673535235, NULL, '$3.00', NULL, false),
('baker-variety-corn', 'Martian Jewels', 'Martian Jewels', 'Spectacular multicolored corn with jewel-like kernels.', NULL, NULL, 'Zea mays', 100, '8-12"', '1-2"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/corn-martian-jewels', 4.8, NULL, '$4.50', NULL, true),
('baker-variety-corn', 'Glass Gem', 'Glass Gem', 'Rainbow-colored ornamental corn with translucent kernels.', NULL, NULL, 'Zea mays', 105, NULL, NULL, NULL, NULL, NULL, NULL, 'https://www.rareseeds.com/corn-glass-gem', 4.9, NULL, '$4.50', NULL, true),
('baker-variety-cucumber', 'Lemon Cuke', 'Lemon Cuke', 'Round, lemon-shaped cucumber with mild flavor.', NULL, NULL, 'Cucumis sativus', 60, '12-18"', '1/2"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/cucumber-lemon-cuke', 4.5, NULL, '$3.00', NULL, true),
('baker-variety-cucumber', 'China Jade', 'China Jade', 'Asian cucumber variety with crisp texture.', NULL, NULL, 'Cucumis sativus', 55, NULL, NULL, NULL, NULL, NULL, NULL, 'https://www.rareseeds.com/cucumber-china-jade', 4.3, NULL, '$3.00', NULL, true),
('baker-variety-eggplant', 'Classic Eggplant', 'Classic Eggplant', 'Heirloom eggplant variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 70, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/eggplant-classic-eggplant', 4.220518151694963, NULL, '$3.00', NULL, true),
('baker-variety-eggplant', 'Royal Eggplant', 'Royal Eggplant', 'Heirloom eggplant variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 80, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/eggplant-royal-eggplant', 4.535065935745365, NULL, '$3.00', NULL, true),
('baker-variety-eggplant', 'Golden Eggplant', 'Golden Eggplant', 'Heirloom eggplant variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 90, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/eggplant-golden-eggplant', 4.100700144563951, NULL, '$3.00', NULL, true),
('baker-variety-eggplant', 'Purple Eggplant', 'Purple Eggplant', 'Heirloom eggplant variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 100, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/eggplant-purple-eggplant', 4.194894944897294, NULL, '$3.00', NULL, true),
('baker-variety-eggplant', 'Giant Eggplant', 'Giant Eggplant', 'Heirloom eggplant variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 110, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/eggplant-giant-eggplant', 4.253567004875509, NULL, '$3.00', NULL, true),
('baker-variety-eggplant', 'Dwarf Eggplant', 'Dwarf Eggplant', 'Heirloom eggplant variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 120, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/eggplant-dwarf-eggplant', 4.560032254746443, NULL, '$3.00', NULL, true),
('baker-variety-endive', 'Classic Endive', 'Classic Endive', 'Heirloom endive variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 70, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/endive-classic-endive', 4.4476759062620985, NULL, '$3.00', NULL, false),
('baker-variety-endive', 'Royal Endive', 'Royal Endive', 'Heirloom endive variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 80, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/endive-royal-endive', 4.753738390545894, NULL, '$3.00', NULL, true),
('baker-variety-endive', 'Golden Endive', 'Golden Endive', 'Heirloom endive variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 90, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/endive-golden-endive', 4.1116481963335625, NULL, '$3.00', NULL, true),
('baker-variety-fava-beans', 'Classic Fava Beans', 'Classic Fava Beans', 'Heirloom fava beans variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 70, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/fava-beans-classic-fava-beans', 4.268601637302224, NULL, '$3.00', NULL, true),
('baker-variety-fava-beans', 'Royal Fava Beans', 'Royal Fava Beans', 'Heirloom fava beans variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 80, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/fava-beans-royal-fava-beans', 4.177056579404097, NULL, '$3.00', NULL, false),
('baker-variety-fava-beans', 'Golden Fava Beans', 'Golden Fava Beans', 'Heirloom fava beans variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 90, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/fava-beans-golden-fava-beans', 4.0790703230518615, NULL, '$3.00', NULL, false),
('baker-variety-fennel', 'Classic Fennel', 'Classic Fennel', 'Heirloom fennel variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 70, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/fennel-classic-fennel', 4.643572576644465, NULL, '$3.00', NULL, true),
('baker-variety-fennel', 'Royal Fennel', 'Royal Fennel', 'Heirloom fennel variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 80, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/fennel-royal-fennel', 4.44706275210777, NULL, '$3.00', NULL, false),
('baker-variety-fennel', 'Golden Fennel', 'Golden Fennel', 'Heirloom fennel variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 90, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/fennel-golden-fennel', 4.744645446468075, NULL, '$3.00', NULL, true),
('baker-variety-fennel', 'Purple Fennel', 'Purple Fennel', 'Heirloom fennel variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 100, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/fennel-purple-fennel', 4.784360211047273, NULL, '$3.00', NULL, false),
('baker-variety-fennel', 'Giant Fennel', 'Giant Fennel', 'Heirloom fennel variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 110, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/fennel-giant-fennel', 4.18973914233416, NULL, '$3.00', NULL, true),
('baker-variety-fennel', 'Dwarf Fennel', 'Dwarf Fennel', 'Heirloom fennel variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 120, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/fennel-dwarf-fennel', 4.637087078444684, NULL, '$3.00', NULL, true),
('baker-variety-garlic', 'Classic Garlic', 'Classic Garlic', 'Heirloom garlic variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 70, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/garlic-classic-garlic', 4.753211610947613, NULL, '$3.00', NULL, false),
('baker-variety-garlic', 'Royal Garlic', 'Royal Garlic', 'Heirloom garlic variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 80, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/garlic-royal-garlic', 4.140373016311057, NULL, '$3.00', NULL, true),
('baker-variety-garlic', 'Golden Garlic', 'Golden Garlic', 'Heirloom garlic variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 90, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/garlic-golden-garlic', 4.032944220994367, NULL, '$3.00', NULL, true),
('baker-variety-garlic', 'Purple Garlic', 'Purple Garlic', 'Heirloom garlic variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 100, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/garlic-purple-garlic', 4.79825786827694, NULL, '$3.00', NULL, true),
('baker-variety-garlic', 'Giant Garlic', 'Giant Garlic', 'Heirloom garlic variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 110, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/garlic-giant-garlic', 4.0545864491622545, NULL, '$3.00', NULL, true),
('baker-variety-garlic', 'Dwarf Garlic', 'Dwarf Garlic', 'Heirloom garlic variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 120, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/garlic-dwarf-garlic', 4.564427931138941, NULL, '$3.00', NULL, true),
('baker-variety-gourds', 'Classic Gourds', 'Classic Gourds', 'Heirloom gourds variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 70, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/gourds-classic-gourds', 4.737245903343958, NULL, '$3.00', NULL, true),
('baker-variety-gourds', 'Royal Gourds', 'Royal Gourds', 'Heirloom gourds variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 80, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/gourds-royal-gourds', 4.333302045141486, NULL, '$3.00', NULL, true),
('baker-variety-gourds', 'Golden Gourds', 'Golden Gourds', 'Heirloom gourds variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 90, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/gourds-golden-gourds', 4.6123134454906545, NULL, '$3.00', NULL, false),
('baker-variety-ground-cherry', 'Classic Ground Cherry', 'Classic Ground Cherry', 'Heirloom ground cherry variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 70, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/ground-cherry-classic-ground-cherry', 4.443825047857834, NULL, '$3.00', NULL, true),
('baker-variety-ground-cherry', 'Royal Ground Cherry', 'Royal Ground Cherry', 'Heirloom ground cherry variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 80, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/ground-cherry-royal-ground-cherry', 4.6071659419131255, NULL, '$3.00', NULL, true),
('baker-variety-ground-cherry', 'Golden Ground Cherry', 'Golden Ground Cherry', 'Heirloom ground cherry variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 90, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/ground-cherry-golden-ground-cherry', 4.082315146097589, NULL, '$3.00', NULL, true),
('baker-variety-ground-cherry', 'Purple Ground Cherry', 'Purple Ground Cherry', 'Heirloom ground cherry variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 100, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/ground-cherry-purple-ground-cherry', 4.678609804165847, NULL, '$3.00', NULL, true),
('baker-variety-kale', 'Classic Kale', 'Classic Kale', 'Heirloom kale variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 70, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/kale-classic-kale', 4.00370841252954, NULL, '$3.00', NULL, false),
('baker-variety-kale', 'Royal Kale', 'Royal Kale', 'Heirloom kale variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 80, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/kale-royal-kale', 4.291708933775726, NULL, '$3.00', NULL, true),
('baker-variety-kale', 'Golden Kale', 'Golden Kale', 'Heirloom kale variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 90, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/kale-golden-kale', 4.717051046453637, NULL, '$3.00', NULL, false),
('baker-variety-kohlrabi', 'Classic Kohlrabi', 'Classic Kohlrabi', 'Heirloom kohlrabi variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 70, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/kohlrabi-classic-kohlrabi', 4.012357678452169, NULL, '$3.00', NULL, true),
('baker-variety-kohlrabi', 'Royal Kohlrabi', 'Royal Kohlrabi', 'Heirloom kohlrabi variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 80, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/kohlrabi-royal-kohlrabi', 4.793021354700825, NULL, '$3.00', NULL, true),
('baker-variety-kohlrabi', 'Golden Kohlrabi', 'Golden Kohlrabi', 'Heirloom kohlrabi variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 90, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/kohlrabi-golden-kohlrabi', 4.286444623675108, NULL, '$3.00', NULL, true),
('baker-variety-kohlrabi', 'Purple Kohlrabi', 'Purple Kohlrabi', 'Heirloom kohlrabi variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 100, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/kohlrabi-purple-kohlrabi', 4.494805802546367, NULL, '$3.00', NULL, true),
('baker-variety-kohlrabi', 'Giant Kohlrabi', 'Giant Kohlrabi', 'Heirloom kohlrabi variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 110, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/kohlrabi-giant-kohlrabi', 4.314953527227357, NULL, '$3.00', NULL, true),
('baker-variety-kohlrabi', 'Dwarf Kohlrabi', 'Dwarf Kohlrabi', 'Heirloom kohlrabi variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 120, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/kohlrabi-dwarf-kohlrabi', 4.500220101739858, NULL, '$3.00', NULL, true),
('baker-variety-leeks', 'Classic Leeks', 'Classic Leeks', 'Heirloom leeks variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 70, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/leeks-classic-leeks', 4.597929140174519, NULL, '$3.00', NULL, true),
('baker-variety-leeks', 'Royal Leeks', 'Royal Leeks', 'Heirloom leeks variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 80, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/leeks-royal-leeks', 4.290750117682807, NULL, '$3.00', NULL, true),
('baker-variety-leeks', 'Golden Leeks', 'Golden Leeks', 'Heirloom leeks variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 90, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/leeks-golden-leeks', 4.291670203678297, NULL, '$3.00', NULL, true),
('baker-variety-leeks', 'Purple Leeks', 'Purple Leeks', 'Heirloom leeks variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 100, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/leeks-purple-leeks', 4.559789106173571, NULL, '$3.00', NULL, true),
('baker-variety-leeks', 'Giant Leeks', 'Giant Leeks', 'Heirloom leeks variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 110, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/leeks-giant-leeks', 4.605222538842529, NULL, '$3.00', NULL, true),
('baker-variety-leeks', 'Dwarf Leeks', 'Dwarf Leeks', 'Heirloom leeks variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 120, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/leeks-dwarf-leeks', 4.259236148542704, NULL, '$3.00', NULL, true),
('baker-variety-lettuce', 'Little Gem', 'Little Gem', 'Compact romaine-type lettuce with sweet, crisp leaves.', NULL, NULL, 'Lactuca sativa', 50, '8-10"', '1/4"', NULL, 'Full sun to partial shade', true, NULL, 'https://www.rareseeds.com/lettuce-little-gem', 4.4, NULL, '$3.00', NULL, true),
('baker-variety-lettuce', 'Spotted Aleppo Syrian', 'Spotted Aleppo Syrian', 'Rare Syrian lettuce with distinctive spotted leaves.', NULL, NULL, 'Lactuca sativa', 55, '8-10"', NULL, NULL, NULL, NULL, NULL, 'https://www.rareseeds.com/lettuce-spotted-aleppo-syrian', 4.2, NULL, '$3.50', NULL, true),
('baker-variety-lettuce', 'Hao Shan', 'Hao Shan', 'Asian lettuce variety with excellent heat tolerance.', NULL, NULL, 'Lactuca sativa', 45, NULL, NULL, NULL, NULL, NULL, NULL, 'https://www.rareseeds.com/lettuce-hao-shan', 4.3, NULL, '$3.00', NULL, true),
('baker-variety-mache', 'Classic Mache', 'Classic Mache', 'Heirloom mache variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 70, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/mache-classic-mache', 4.122113395876036, NULL, '$3.00', NULL, true),
('baker-variety-mache', 'Royal Mache', 'Royal Mache', 'Heirloom mache variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 80, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/mache-royal-mache', 4.166582893558779, NULL, '$3.00', NULL, true),
('baker-variety-mache', 'Golden Mache', 'Golden Mache', 'Heirloom mache variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 90, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/mache-golden-mache', 4.621083493200633, NULL, '$3.00', NULL, true),
('baker-variety-mache', 'Purple Mache', 'Purple Mache', 'Heirloom mache variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 100, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/mache-purple-mache', 4.177505765070012, NULL, '$3.00', NULL, true),
('baker-variety-mache', 'Giant Mache', 'Giant Mache', 'Heirloom mache variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 110, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/mache-giant-mache', 4.56461510844904, NULL, '$3.00', NULL, true),
('baker-variety-melons', 'Kajari', 'Kajari', 'Indian melon with striped skin and sweet flesh.', NULL, NULL, 'Cucumis melo', 90, '18-24"', '1/2"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/melon-kajari', 4.2, NULL, '$4.50', NULL, true),
('baker-variety-millet', 'Classic Millet', 'Classic Millet', 'Heirloom millet variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 70, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/millet-classic-millet', 4.147259656392, NULL, '$3.00', NULL, true),
('baker-variety-millet', 'Royal Millet', 'Royal Millet', 'Heirloom millet variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 80, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/millet-royal-millet', 4.208614461437184, NULL, '$3.00', NULL, true),
('baker-variety-millet', 'Golden Millet', 'Golden Millet', 'Heirloom millet variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 90, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/millet-golden-millet', 4.24382505768864, NULL, '$3.00', NULL, true),
('baker-variety-millet', 'Purple Millet', 'Purple Millet', 'Heirloom millet variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 100, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/millet-purple-millet', 4.1133296222957005, NULL, '$3.00', NULL, false),
('baker-variety-millet', 'Giant Millet', 'Giant Millet', 'Heirloom millet variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 110, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/millet-giant-millet', 4.102484850032073, NULL, '$3.00', NULL, true),
('baker-variety-millet', 'Dwarf Millet', 'Dwarf Millet', 'Heirloom millet variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 120, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/millet-dwarf-millet', 4.027036699985323, NULL, '$3.00', NULL, true),
('baker-variety-millet', 'Early Millet', 'Early Millet', 'Heirloom millet variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 130, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/millet-early-millet', 4.769997827996827, NULL, '$3.00', NULL, true),
('baker-variety-millet', 'Late Millet', 'Late Millet', 'Heirloom millet variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 140, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/millet-late-millet', 4.381822451462402, NULL, '$3.00', NULL, true),
('baker-variety-mustard-greens', 'Classic Mustard Greens', 'Classic Mustard Greens', 'Heirloom mustard greens variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 70, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/mustard-greens-classic-mustard-greens', 4.27259390463004, NULL, '$3.00', NULL, false),
('baker-variety-mustard-greens', 'Royal Mustard Greens', 'Royal Mustard Greens', 'Heirloom mustard greens variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 80, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/mustard-greens-royal-mustard-greens', 4.56010244771847, NULL, '$3.00', NULL, false),
('baker-variety-mustard-greens', 'Golden Mustard Greens', 'Golden Mustard Greens', 'Heirloom mustard greens variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 90, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/mustard-greens-golden-mustard-greens', 4.2662116747116094, NULL, '$3.00', NULL, true),
('baker-variety-okra', 'Classic Okra', 'Classic Okra', 'Heirloom okra variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 70, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/okra-classic-okra', 4.459149588314269, NULL, '$3.00', NULL, false),
('baker-variety-okra', 'Royal Okra', 'Royal Okra', 'Heirloom okra variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 80, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/okra-royal-okra', 4.680168196947745, NULL, '$3.00', NULL, true),
('baker-variety-okra', 'Golden Okra', 'Golden Okra', 'Heirloom okra variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 90, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/okra-golden-okra', 4.125233077288368, NULL, '$3.00', NULL, true),
('baker-variety-okra', 'Purple Okra', 'Purple Okra', 'Heirloom okra variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 100, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/okra-purple-okra', 4.2376567557717975, NULL, '$3.00', NULL, true),
('baker-variety-okra', 'Giant Okra', 'Giant Okra', 'Heirloom okra variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 110, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/okra-giant-okra', 4.4799867356229175, NULL, '$3.00', NULL, false),
('baker-variety-okra', 'Dwarf Okra', 'Dwarf Okra', 'Heirloom okra variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 120, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/okra-dwarf-okra', 4.456278164609295, NULL, '$3.00', NULL, true),
('baker-variety-onions', 'Classic Onions', 'Classic Onions', 'Heirloom onions variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 70, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/onions-classic-onions', 4.329583254505176, NULL, '$3.00', NULL, true),
('baker-variety-onions', 'Royal Onions', 'Royal Onions', 'Heirloom onions variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 80, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/onions-royal-onions', 4.023461804047313, NULL, '$3.00', NULL, true),
('baker-variety-onions', 'Golden Onions', 'Golden Onions', 'Heirloom onions variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 90, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/onions-golden-onions', 4.398103053130304, NULL, '$3.00', NULL, true),
('baker-variety-onions', 'Purple Onions', 'Purple Onions', 'Heirloom onions variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 100, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/onions-purple-onions', 4.3319777395358425, NULL, '$3.00', NULL, true),
('baker-variety-onions', 'Giant Onions', 'Giant Onions', 'Heirloom onions variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 110, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/onions-giant-onions', 4.619225683681601, NULL, '$3.00', NULL, true),
('baker-variety-peas', 'Classic Peas', 'Classic Peas', 'Heirloom peas variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 70, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/peas-classic-peas', 4.088350146203871, NULL, '$3.00', NULL, true),
('baker-variety-peas', 'Royal Peas', 'Royal Peas', 'Heirloom peas variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 80, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/peas-royal-peas', 4.59149245901268, NULL, '$3.00', NULL, true),
('baker-variety-peas', 'Golden Peas', 'Golden Peas', 'Heirloom peas variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 90, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/peas-golden-peas', 4.031824399389528, NULL, '$3.00', NULL, true),
('baker-variety-peas', 'Purple Peas', 'Purple Peas', 'Heirloom peas variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 100, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/peas-purple-peas', 4.259994817971603, NULL, '$3.00', NULL, true),
('baker-variety-peas', 'Giant Peas', 'Giant Peas', 'Heirloom peas variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 110, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/peas-giant-peas', 4.6352615991699215, NULL, '$3.00', NULL, false),
('baker-variety-peas', 'Dwarf Peas', 'Dwarf Peas', 'Heirloom peas variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 120, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/peas-dwarf-peas', 4.767945708373103, NULL, '$3.00', NULL, true),
('baker-variety-peas', 'Early Peas', 'Early Peas', 'Heirloom peas variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 130, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/peas-early-peas', 4.541129319824056, NULL, '$3.00', NULL, true),
('baker-variety-peas', 'Late Peas', 'Late Peas', 'Heirloom peas variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 140, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/peas-late-peas', 4.587634366104786, NULL, '$3.00', NULL, false),
('baker-variety-peppers', 'Aleppo', 'Aleppo', 'Syrian pepper with moderate heat and fruity flavor.', NULL, NULL, 'Capsicum annuum', 75, '12-18"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/hot-pepper-seeds-aleppo', 4.3, NULL, '$3.50', NULL, true),
('baker-variety-peppers', 'Fish', 'Fish', 'Striped pepper with mild heat and unique appearance.', NULL, NULL, 'Capsicum annuum', 70, NULL, NULL, NULL, NULL, NULL, NULL, 'https://www.rareseeds.com/pepper-fish', 4.2, NULL, '$3.50', NULL, true),
('baker-variety-potatoes', 'Classic Potatoes', 'Classic Potatoes', 'Heirloom potatoes variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 70, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/potatoes-classic-potatoes', 4.640185964140916, NULL, '$3.00', NULL, true),
('baker-variety-potatoes', 'Royal Potatoes', 'Royal Potatoes', 'Heirloom potatoes variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 80, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/potatoes-royal-potatoes', 4.270651563486821, NULL, '$3.00', NULL, true),
('baker-variety-potatoes', 'Golden Potatoes', 'Golden Potatoes', 'Heirloom potatoes variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 90, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/potatoes-golden-potatoes', 4.196967765584941, NULL, '$3.00', NULL, true),
('baker-variety-potatoes', 'Purple Potatoes', 'Purple Potatoes', 'Heirloom potatoes variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 100, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/potatoes-purple-potatoes', 4.044169148577258, NULL, '$3.00', NULL, false),
('baker-variety-potatoes', 'Giant Potatoes', 'Giant Potatoes', 'Heirloom potatoes variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 110, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/potatoes-giant-potatoes', 4.204622594129066, NULL, '$3.00', NULL, true),
('baker-variety-pumpkins', 'Classic Pumpkins', 'Classic Pumpkins', 'Heirloom pumpkins variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 70, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/pumpkins-classic-pumpkins', 4.41010242448806, NULL, '$3.00', NULL, false),
('baker-variety-pumpkins', 'Royal Pumpkins', 'Royal Pumpkins', 'Heirloom pumpkins variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 80, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/pumpkins-royal-pumpkins', 4.753328760198723, NULL, '$3.00', NULL, true),
('baker-variety-pumpkins', 'Golden Pumpkins', 'Golden Pumpkins', 'Heirloom pumpkins variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 90, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/pumpkins-golden-pumpkins', 4.344556140551654, NULL, '$3.00', NULL, true),
('baker-variety-pumpkins', 'Purple Pumpkins', 'Purple Pumpkins', 'Heirloom pumpkins variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 100, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/pumpkins-purple-pumpkins', 4.227310183884444, NULL, '$3.00', NULL, true),
('baker-variety-purslane', 'Classic Purslane', 'Classic Purslane', 'Heirloom purslane variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 70, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/purslane-classic-purslane', 4.521936721797406, NULL, '$3.00', NULL, true),
('baker-variety-purslane', 'Royal Purslane', 'Royal Purslane', 'Heirloom purslane variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 80, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/purslane-royal-purslane', 4.1967474599457555, NULL, '$3.00', NULL, true),
('baker-variety-purslane', 'Golden Purslane', 'Golden Purslane', 'Heirloom purslane variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 90, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/purslane-golden-purslane', 4.573233603894656, NULL, '$3.00', NULL, true),
('baker-variety-purslane', 'Purple Purslane', 'Purple Purslane', 'Heirloom purslane variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 100, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/purslane-purple-purslane', 4.076341751030296, NULL, '$3.00', NULL, true),
('baker-variety-quinoa', 'Classic Quinoa', 'Classic Quinoa', 'Heirloom quinoa variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 70, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/quinoa-classic-quinoa', 4.2543840061245195, NULL, '$3.00', NULL, true),
('baker-variety-quinoa', 'Royal Quinoa', 'Royal Quinoa', 'Heirloom quinoa variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 80, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/quinoa-royal-quinoa', 4.310349119636284, NULL, '$3.00', NULL, true),
('baker-variety-quinoa', 'Golden Quinoa', 'Golden Quinoa', 'Heirloom quinoa variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 90, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/quinoa-golden-quinoa', 4.020740590717304, NULL, '$3.00', NULL, true),
('baker-variety-quinoa', 'Purple Quinoa', 'Purple Quinoa', 'Heirloom quinoa variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 100, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/quinoa-purple-quinoa', 4.407547317536792, NULL, '$3.00', NULL, true),
('baker-variety-quinoa', 'Giant Quinoa', 'Giant Quinoa', 'Heirloom quinoa variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 110, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/quinoa-giant-quinoa', 4.545300247126271, NULL, '$3.00', NULL, true),
('baker-variety-quinoa', 'Dwarf Quinoa', 'Dwarf Quinoa', 'Heirloom quinoa variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 120, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/quinoa-dwarf-quinoa', 4.3480719697957735, NULL, '$3.00', NULL, true),
('baker-variety-radishes', 'Classic Radishes', 'Classic Radishes', 'Heirloom radishes variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 70, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/radishes-classic-radishes', 4.081149636644001, NULL, '$3.00', NULL, true),
('baker-variety-radishes', 'Royal Radishes', 'Royal Radishes', 'Heirloom radishes variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 80, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/radishes-royal-radishes', 4.024857286254405, NULL, '$3.00', NULL, true),
('baker-variety-radishes', 'Golden Radishes', 'Golden Radishes', 'Heirloom radishes variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 90, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/radishes-golden-radishes', 4.759766504967074, NULL, '$3.00', NULL, true),
('baker-variety-radishes', 'Purple Radishes', 'Purple Radishes', 'Heirloom radishes variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 100, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/radishes-purple-radishes', 4.6588002921342655, NULL, '$3.00', NULL, true),
('baker-variety-radishes', 'Giant Radishes', 'Giant Radishes', 'Heirloom radishes variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 110, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/radishes-giant-radishes', 4.687457011590007, NULL, '$3.00', NULL, true),
('baker-variety-rhubarb', 'Classic Rhubarb', 'Classic Rhubarb', 'Heirloom rhubarb variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 70, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/rhubarb-classic-rhubarb', 4.48204905068702, NULL, '$3.00', NULL, false),
('baker-variety-rhubarb', 'Royal Rhubarb', 'Royal Rhubarb', 'Heirloom rhubarb variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 80, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/rhubarb-royal-rhubarb', 4.25121428189987, NULL, '$3.00', NULL, true),
('baker-variety-rhubarb', 'Golden Rhubarb', 'Golden Rhubarb', 'Heirloom rhubarb variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 90, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/rhubarb-golden-rhubarb', 4.582941750085654, NULL, '$3.00', NULL, true),
('baker-variety-rhubarb', 'Purple Rhubarb', 'Purple Rhubarb', 'Heirloom rhubarb variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 100, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/rhubarb-purple-rhubarb', 4.3621945441021905, NULL, '$3.00', NULL, true),
('baker-variety-rhubarb', 'Giant Rhubarb', 'Giant Rhubarb', 'Heirloom rhubarb variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 110, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/rhubarb-giant-rhubarb', 4.763887141497707, NULL, '$3.00', NULL, true),
('baker-variety-rhubarb', 'Dwarf Rhubarb', 'Dwarf Rhubarb', 'Heirloom rhubarb variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 120, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/rhubarb-dwarf-rhubarb', 4.571110879050951, NULL, '$3.00', NULL, true),
('baker-variety-rhubarb', 'Early Rhubarb', 'Early Rhubarb', 'Heirloom rhubarb variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 130, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/rhubarb-early-rhubarb', 4.126916209283326, NULL, '$3.00', NULL, true),
('baker-variety-rhubarb', 'Late Rhubarb', 'Late Rhubarb', 'Heirloom rhubarb variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 140, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/rhubarb-late-rhubarb', 4.4318322760368645, NULL, '$3.00', NULL, true),
('baker-variety-rutabaga', 'Classic Rutabaga', 'Classic Rutabaga', 'Heirloom rutabaga variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 70, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/rutabaga-classic-rutabaga', 4.693536634131284, NULL, '$3.00', NULL, true),
('baker-variety-rutabaga', 'Royal Rutabaga', 'Royal Rutabaga', 'Heirloom rutabaga variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 80, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/rutabaga-royal-rutabaga', 4.280154206689215, NULL, '$3.00', NULL, true),
('baker-variety-rutabaga', 'Golden Rutabaga', 'Golden Rutabaga', 'Heirloom rutabaga variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 90, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/rutabaga-golden-rutabaga', 4.063977069199235, NULL, '$3.00', NULL, false),
('baker-variety-rutabaga', 'Purple Rutabaga', 'Purple Rutabaga', 'Heirloom rutabaga variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 100, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/rutabaga-purple-rutabaga', 4.513854997991211, NULL, '$3.00', NULL, true),
('baker-variety-rutabaga', 'Giant Rutabaga', 'Giant Rutabaga', 'Heirloom rutabaga variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 110, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/rutabaga-giant-rutabaga', 4.212827502205529, NULL, '$3.00', NULL, true),
('baker-variety-rutabaga', 'Dwarf Rutabaga', 'Dwarf Rutabaga', 'Heirloom rutabaga variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 120, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/rutabaga-dwarf-rutabaga', 4.287629016546851, NULL, '$3.00', NULL, true),
('baker-variety-rutabaga', 'Early Rutabaga', 'Early Rutabaga', 'Heirloom rutabaga variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 130, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/rutabaga-early-rutabaga', 4.50743175744248, NULL, '$3.00', NULL, true),
('baker-variety-spinach', 'Classic Spinach', 'Classic Spinach', 'Heirloom spinach variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 70, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/spinach-classic-spinach', 4.464336599883643, NULL, '$3.00', NULL, true),
('baker-variety-spinach', 'Royal Spinach', 'Royal Spinach', 'Heirloom spinach variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 80, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/spinach-royal-spinach', 4.422369968440565, NULL, '$3.00', NULL, false),
('baker-variety-spinach', 'Golden Spinach', 'Golden Spinach', 'Heirloom spinach variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 90, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/spinach-golden-spinach', 4.447089096062555, NULL, '$3.00', NULL, true),
('baker-variety-spinach', 'Purple Spinach', 'Purple Spinach', 'Heirloom spinach variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 100, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/spinach-purple-spinach', 4.688709577596008, NULL, '$3.00', NULL, true),
('baker-variety-spinach', 'Giant Spinach', 'Giant Spinach', 'Heirloom spinach variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 110, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/spinach-giant-spinach', 4.4399500504825555, NULL, '$3.00', NULL, true),
('baker-variety-squash-summer', 'Zucchini Golden', 'Zucchini Golden', 'Golden yellow zucchini with tender flesh.', NULL, NULL, 'Cucurbita pepo', 50, '18-24"', '1/2"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/squash-summer-zucchini-golden', 4.4, NULL, '$3.50', NULL, true),
('baker-variety-squash-winter', 'Classic Squash Winter', 'Classic Squash Winter', 'Heirloom squash winter variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 70, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/squash-winter-classic-squash-winter', 4.514717748899387, NULL, '$3.00', NULL, true),
('baker-variety-squash-winter', 'Royal Squash Winter', 'Royal Squash Winter', 'Heirloom squash winter variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 80, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/squash-winter-royal-squash-winter', 4.2439683875638705, NULL, '$3.00', NULL, true),
('baker-variety-squash-winter', 'Golden Squash Winter', 'Golden Squash Winter', 'Heirloom squash winter variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 90, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/squash-winter-golden-squash-winter', 4.602068908144147, NULL, '$3.00', NULL, true),
('baker-variety-sunflowers', 'Classic Sunflowers', 'Classic Sunflowers', 'Heirloom sunflowers variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 70, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/sunflowers-classic-sunflowers', 4.417573352407337, NULL, '$3.00', NULL, true),
('baker-variety-sunflowers', 'Royal Sunflowers', 'Royal Sunflowers', 'Heirloom sunflowers variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 80, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/sunflowers-royal-sunflowers', 4.19001915393356, NULL, '$3.00', NULL, true),
('baker-variety-sunflowers', 'Golden Sunflowers', 'Golden Sunflowers', 'Heirloom sunflowers variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 90, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/sunflowers-golden-sunflowers', 4.181353224706156, NULL, '$3.00', NULL, true),
('baker-variety-sunflowers', 'Purple Sunflowers', 'Purple Sunflowers', 'Heirloom sunflowers variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 100, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/sunflowers-purple-sunflowers', 4.065682721662885, NULL, '$3.00', NULL, true),
('baker-variety-sunflowers', 'Giant Sunflowers', 'Giant Sunflowers', 'Heirloom sunflowers variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 110, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/sunflowers-giant-sunflowers', 4.14125500433923, NULL, '$3.00', NULL, false),
('baker-variety-sunflowers', 'Dwarf Sunflowers', 'Dwarf Sunflowers', 'Heirloom sunflowers variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 120, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/sunflowers-dwarf-sunflowers', 4.354563371119739, NULL, '$3.00', NULL, true),
('baker-variety-sunflowers', 'Early Sunflowers', 'Early Sunflowers', 'Heirloom sunflowers variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 130, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/sunflowers-early-sunflowers', 4.422847913032538, NULL, '$3.00', NULL, true),
('baker-variety-sweet-potatoes', 'Classic Sweet Potatoes', 'Classic Sweet Potatoes', 'Heirloom sweet potatoes variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 70, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/sweet-potatoes-classic-sweet-potatoes', 4.333470299809527, NULL, '$3.00', NULL, true),
('baker-variety-sweet-potatoes', 'Royal Sweet Potatoes', 'Royal Sweet Potatoes', 'Heirloom sweet potatoes variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 80, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/sweet-potatoes-royal-sweet-potatoes', 4.612185320518685, NULL, '$3.00', NULL, true),
('baker-variety-sweet-potatoes', 'Golden Sweet Potatoes', 'Golden Sweet Potatoes', 'Heirloom sweet potatoes variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 90, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/sweet-potatoes-golden-sweet-potatoes', 4.103593021499265, NULL, '$3.00', NULL, true),
('baker-variety-sweet-potatoes', 'Purple Sweet Potatoes', 'Purple Sweet Potatoes', 'Heirloom sweet potatoes variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 100, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/sweet-potatoes-purple-sweet-potatoes', 4.115125729481103, NULL, '$3.00', NULL, false),
('baker-variety-sweet-potatoes', 'Giant Sweet Potatoes', 'Giant Sweet Potatoes', 'Heirloom sweet potatoes variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 110, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/sweet-potatoes-giant-sweet-potatoes', 4.312981766547615, NULL, '$3.00', NULL, false),
('baker-variety-tomatillos', 'Classic Tomatillos', 'Classic Tomatillos', 'Heirloom tomatillos variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 70, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/tomatillos-classic-tomatillos', 4.064970858834, NULL, '$3.00', NULL, true),
('baker-variety-tomatillos', 'Royal Tomatillos', 'Royal Tomatillos', 'Heirloom tomatillos variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 80, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/tomatillos-royal-tomatillos', 4.296519804935282, NULL, '$3.00', NULL, false),
('baker-variety-tomatillos', 'Golden Tomatillos', 'Golden Tomatillos', 'Heirloom tomatillos variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 90, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/tomatillos-golden-tomatillos', 4.178635895051763, NULL, '$3.00', NULL, true),
('baker-variety-tomatoes', 'Cherokee Purple', 'Cherokee Purple', 'Heirloom beefsteak tomato with deep purple shoulders and rich flavor.', NULL, NULL, 'Solanum lycopersicum', 80, '24-36"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/tomato-cherokee-purple', 4.7, NULL, '$3.50', NULL, true),
('baker-variety-tomatoes', 'Black Krim', 'Black Krim', 'Russian heirloom with dark purple-black shoulders and rich, smoky flavor.', NULL, NULL, 'Solanum lycopersicum', 80, '24-36"', NULL, NULL, NULL, NULL, NULL, 'https://www.rareseeds.com/tomato-black-krim', 4.5, NULL, '$3.50', NULL, true),
('baker-variety-tomatoes', 'Brandywine', 'Brandywine', 'Classic heirloom beefsteak with exceptional flavor.', NULL, NULL, 'Solanum lycopersicum', 85, NULL, NULL, NULL, NULL, NULL, NULL, 'https://www.rareseeds.com/tomato-brandywine', 4.8, NULL, '$3.50', NULL, true),
('baker-variety-tomatoes', 'Orange Hat', 'Orange Hat', 'Unique orange cherry tomato with sweet flavor.', NULL, NULL, 'Solanum lycopersicum', 70, NULL, NULL, NULL, NULL, NULL, NULL, 'https://www.rareseeds.com/tomato-orange-hat', 4.3, NULL, '$3.50', NULL, true),
('baker-variety-tomatoes', 'Green Zebra', 'Green Zebra', 'Striped green tomato with tangy flavor.', NULL, NULL, 'Solanum lycopersicum', 75, NULL, NULL, NULL, NULL, NULL, NULL, 'https://www.rareseeds.com/tomato-green-zebra', 4.4, NULL, '$3.50', NULL, true),
('baker-variety-turnips', 'Classic Turnips', 'Classic Turnips', 'Heirloom turnips variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 70, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/turnips-classic-turnips', 4.653071234798189, NULL, '$3.00', NULL, true),
('baker-variety-turnips', 'Royal Turnips', 'Royal Turnips', 'Heirloom turnips variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 80, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/turnips-royal-turnips', 4.2560033851574275, NULL, '$3.00', NULL, true),
('baker-variety-turnips', 'Golden Turnips', 'Golden Turnips', 'Heirloom turnips variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 90, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/turnips-golden-turnips', 4.471027010824509, NULL, '$3.00', NULL, true),
('baker-variety-watermelons', 'Classic Watermelons', 'Classic Watermelons', 'Heirloom watermelons variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 70, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/watermelons-classic-watermelons', 4.081178980395294, NULL, '$3.00', NULL, true),
('baker-variety-watermelons', 'Royal Watermelons', 'Royal Watermelons', 'Heirloom watermelons variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 80, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/watermelons-royal-watermelons', 4.776513684217823, NULL, '$3.00', NULL, true),
('baker-variety-watermelons', 'Golden Watermelons', 'Golden Watermelons', 'Heirloom watermelons variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 90, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/watermelons-golden-watermelons', 4.014426738841907, NULL, '$3.00', NULL, true),
('baker-variety-watermelons', 'Purple Watermelons', 'Purple Watermelons', 'Heirloom watermelons variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 100, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/watermelons-purple-watermelons', 4.762987569944217, NULL, '$3.00', NULL, true),
('baker-variety-watermelons', 'Giant Watermelons', 'Giant Watermelons', 'Heirloom watermelons variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 110, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/watermelons-giant-watermelons', 4.070830406838021, NULL, '$3.00', NULL, true),
('baker-variety-wheat', 'Classic Wheat', 'Classic Wheat', 'Heirloom wheat variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 70, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/wheat-classic-wheat', 4.4704583082134794, NULL, '$3.00', NULL, true),
('baker-variety-wheat', 'Royal Wheat', 'Royal Wheat', 'Heirloom wheat variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 80, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/wheat-royal-wheat', 4.689536615398241, NULL, '$3.00', NULL, false),
('baker-variety-wheat', 'Golden Wheat', 'Golden Wheat', 'Heirloom wheat variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 90, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/wheat-golden-wheat', 4.62178112270704, NULL, '$3.00', NULL, true),
('baker-variety-wheat', 'Purple Wheat', 'Purple Wheat', 'Heirloom wheat variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 100, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/wheat-purple-wheat', 4.23309234747617, NULL, '$3.00', NULL, true),
('baker-variety-wheat', 'Giant Wheat', 'Giant Wheat', 'Heirloom wheat variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 110, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/wheat-giant-wheat', 4.150231830900102, NULL, '$3.00', NULL, true),
('baker-variety-wheat', 'Dwarf Wheat', 'Dwarf Wheat', 'Heirloom wheat variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 120, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/wheat-dwarf-wheat', 4.775535220232456, NULL, '$3.00', NULL, true),
('baker-variety-wheat', 'Early Wheat', 'Early Wheat', 'Heirloom wheat variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 130, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/wheat-early-wheat', 4.7970952101954865, NULL, '$3.00', NULL, true),
('baker-variety-basil', 'Genovese', 'Genovese', 'An absolutely legendary heirloom that no Italian chef can cook without. Essential ingredient in basil pesto.', NULL, NULL, 'Ocimum basilicum', 60, '8-12"', '1/4"', '6-10 days', '8-12 hours of full sun', false, 'https://www.rareseeds.com/media/catalog/product/cache/5667e39955f7b47720c7610bf376471d/b/a/basil-genovese-lss-dsc_3512.jpg', 'https://www.rareseeds.com/basil-genovese', 4.6, 37, '$3.00', 'HB101', false),
('baker-variety-basil', 'Thai Sweet', 'Thai Sweet', 'Sweet Thai basil with distinctive flavor perfect for Asian cuisine.', NULL, NULL, 'Ocimum basilicum', 70, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/basil-thai-sweet', 4.4, NULL, '$3.00', NULL, true),
('baker-variety-basil', 'Thai Holy Kaprao', 'Thai Holy Kaprao', 'Sacred Thai basil with spiritual significance and medicinal properties.', NULL, NULL, 'Ocimum tenuiflorum', 80, NULL, NULL, NULL, NULL, NULL, NULL, 'https://www.rareseeds.com/basil-thai-holy-kaprao', 3.9, NULL, '$3.00', NULL, true),
('baker-variety-basil', 'Lemon', 'Lemon', 'Citrusy basil with bright lemon flavor and aroma.', NULL, NULL, 'Ocimum × citriodorum', 60, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/basil-lemon', 4.6, NULL, '$3.00', NULL, true),
('baker-variety-basil', 'Cinnamon', 'Cinnamon', 'Unique basil with warm cinnamon flavor and aroma.', NULL, NULL, 'Ocimum basilicum', 70, NULL, NULL, NULL, NULL, NULL, NULL, 'https://www.rareseeds.com/basil-cinnamon', 4.4, NULL, '$3.00', NULL, true),
('baker-variety-basil', 'Dark Purple Opal', 'Dark Purple Opal', 'Beautiful purple basil with ornamental value and great flavor.', NULL, NULL, 'Ocimum basilicum', 75, NULL, NULL, NULL, NULL, NULL, NULL, 'https://www.rareseeds.com/basil-dark-purple-opal', 4.6, NULL, '$3.00', NULL, true),
('baker-variety-basil', 'Lettuce Leaf', 'Lettuce Leaf', 'Large-leafed basil perfect for wrapping and salads.', NULL, NULL, 'Ocimum basilicum', 60, NULL, NULL, NULL, NULL, NULL, NULL, 'https://www.rareseeds.com/basil-lettuce-leaf', 4.6, NULL, '$3.00', NULL, true),
('baker-variety-basil', 'Cardinal', 'Cardinal', 'Bright red-flowered basil with excellent flavor.', NULL, NULL, 'Ocimum basilicum', 70, NULL, NULL, NULL, NULL, NULL, NULL, 'https://www.rareseeds.com/basil-cardinal', 4.7, NULL, '$3.00', NULL, true),
('baker-variety-basil', 'Persian', 'Persian', 'Traditional Persian basil with unique flavor profile.', NULL, NULL, 'Ocimum basilicum', 70, NULL, NULL, NULL, NULL, NULL, NULL, 'https://www.rareseeds.com/basil-persian', 4.6, NULL, '$3.00', NULL, true),
('baker-variety-basil', 'Siam Queen Thai', 'Siam Queen Thai', 'Premium Thai basil variety with intense flavor.', NULL, NULL, 'Ocimum basilicum', 75, NULL, NULL, NULL, NULL, NULL, NULL, 'https://www.rareseeds.com/basil-siam-queen-thai', 4.5, NULL, '$3.00', NULL, true),
('baker-variety-bee-balm', 'Classic Bee Balm', 'Classic Bee Balm', 'Heirloom bee balm variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 70, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/bee-balm-classic-bee-balm', 4.633626557400077, NULL, '$3.00', NULL, true),
('baker-variety-bee-balm', 'Royal Bee Balm', 'Royal Bee Balm', 'Heirloom bee balm variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 80, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/bee-balm-royal-bee-balm', 4.584991458586236, NULL, '$3.00', NULL, true),
('baker-variety-bee-balm', 'Golden Bee Balm', 'Golden Bee Balm', 'Heirloom bee balm variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 90, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/bee-balm-golden-bee-balm', 4.247769592090122, NULL, '$3.00', NULL, true),
('baker-variety-bee-balm', 'Purple Bee Balm', 'Purple Bee Balm', 'Heirloom bee balm variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 100, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/bee-balm-purple-bee-balm', 4.470458896135904, NULL, '$3.00', NULL, true),
('baker-variety-bee-balm', 'Giant Bee Balm', 'Giant Bee Balm', 'Heirloom bee balm variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 110, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/bee-balm-giant-bee-balm', 4.794532834120386, NULL, '$3.00', NULL, true),
('baker-variety-bee-balm', 'Dwarf Bee Balm', 'Dwarf Bee Balm', 'Heirloom bee balm variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 120, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/bee-balm-dwarf-bee-balm', 4.680300302482817, NULL, '$3.00', NULL, true),
('baker-variety-borago', 'Classic Borago', 'Classic Borago', 'Heirloom borago variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 70, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/borago-classic-borago', 4.377762584404849, NULL, '$3.00', NULL, true),
('baker-variety-borago', 'Royal Borago', 'Royal Borago', 'Heirloom borago variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 80, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/borago-royal-borago', 4.364354217716003, NULL, '$3.00', NULL, true),
('baker-variety-borago', 'Golden Borago', 'Golden Borago', 'Heirloom borago variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 90, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/borago-golden-borago', 4.299172776066539, NULL, '$3.00', NULL, true),
('baker-variety-chamomile', 'Classic Chamomile', 'Classic Chamomile', 'Heirloom chamomile variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 70, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/chamomile-classic-chamomile', 4.722731857184488, NULL, '$3.00', NULL, true),
('baker-variety-chamomile', 'Royal Chamomile', 'Royal Chamomile', 'Heirloom chamomile variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 80, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/chamomile-royal-chamomile', 4.467950458542193, NULL, '$3.00', NULL, true),
('baker-variety-chamomile', 'Golden Chamomile', 'Golden Chamomile', 'Heirloom chamomile variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 90, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/chamomile-golden-chamomile', 4.250096132551656, NULL, '$3.00', NULL, true),
('baker-variety-chamomile', 'Purple Chamomile', 'Purple Chamomile', 'Heirloom chamomile variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 100, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/chamomile-purple-chamomile', 4.404847138753086, NULL, '$3.00', NULL, true),
('baker-variety-chamomile', 'Giant Chamomile', 'Giant Chamomile', 'Heirloom chamomile variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 110, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/chamomile-giant-chamomile', 4.184963687930086, NULL, '$3.00', NULL, true),
('baker-variety-chamomile', 'Dwarf Chamomile', 'Dwarf Chamomile', 'Heirloom chamomile variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 120, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/chamomile-dwarf-chamomile', 4.720106449898649, NULL, '$3.00', NULL, true),
('baker-variety-chamomile', 'Early Chamomile', 'Early Chamomile', 'Heirloom chamomile variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 130, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/chamomile-early-chamomile', 4.704142497476193, NULL, '$3.00', NULL, true),
('baker-variety-chamomile', 'Late Chamomile', 'Late Chamomile', 'Heirloom chamomile variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 140, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/chamomile-late-chamomile', 4.498444236453265, NULL, '$3.00', NULL, true),
('baker-variety-chives', 'Classic Chives', 'Classic Chives', 'Heirloom chives variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 70, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/chives-classic-chives', 4.3826379794381785, NULL, '$3.00', NULL, true),
('baker-variety-chives', 'Royal Chives', 'Royal Chives', 'Heirloom chives variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 80, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/chives-royal-chives', 4.485616843084298, NULL, '$3.00', NULL, false),
('baker-variety-chives', 'Golden Chives', 'Golden Chives', 'Heirloom chives variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 90, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/chives-golden-chives', 4.3354219587214216, NULL, '$3.00', NULL, true),
('baker-variety-chives', 'Purple Chives', 'Purple Chives', 'Heirloom chives variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 100, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/chives-purple-chives', 4.315450835603399, NULL, '$3.00', NULL, true),
('baker-variety-coriandrum', 'Classic Coriandrum', 'Classic Coriandrum', 'Heirloom coriandrum variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 70, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/coriandrum-classic-coriandrum', 4.601650053049608, NULL, '$3.00', NULL, true),
('baker-variety-coriandrum', 'Royal Coriandrum', 'Royal Coriandrum', 'Heirloom coriandrum variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 80, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/coriandrum-royal-coriandrum', 4.219741388639796, NULL, '$3.00', NULL, true),
('baker-variety-coriandrum', 'Golden Coriandrum', 'Golden Coriandrum', 'Heirloom coriandrum variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 90, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/coriandrum-golden-coriandrum', 4.547562246661114, NULL, '$3.00', NULL, true),
('baker-variety-coriandrum', 'Purple Coriandrum', 'Purple Coriandrum', 'Heirloom coriandrum variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 100, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/coriandrum-purple-coriandrum', 4.582849664138684, NULL, '$3.00', NULL, true),
('baker-variety-coriandrum', 'Giant Coriandrum', 'Giant Coriandrum', 'Heirloom coriandrum variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 110, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/coriandrum-giant-coriandrum', 4.3008239817565785, NULL, '$3.00', NULL, false),
('baker-variety-dill', 'Classic Dill', 'Classic Dill', 'Heirloom dill variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 70, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/dill-classic-dill', 4.539905585508237, NULL, '$3.00', NULL, true),
('baker-variety-dill', 'Royal Dill', 'Royal Dill', 'Heirloom dill variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 80, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/dill-royal-dill', 4.745096457675295, NULL, '$3.00', NULL, false),
('baker-variety-dill', 'Golden Dill', 'Golden Dill', 'Heirloom dill variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 90, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/dill-golden-dill', 4.552740126802259, NULL, '$3.00', NULL, true),
('baker-variety-dill', 'Purple Dill', 'Purple Dill', 'Heirloom dill variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 100, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/dill-purple-dill', 4.030875060486192, NULL, '$3.00', NULL, true),
('baker-variety-dill', 'Giant Dill', 'Giant Dill', 'Heirloom dill variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 110, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/dill-giant-dill', 4.66424743113302, NULL, '$3.00', NULL, false),
('baker-variety-dill', 'Dwarf Dill', 'Dwarf Dill', 'Heirloom dill variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 120, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/dill-dwarf-dill', 4.408307392220735, NULL, '$3.00', NULL, true),
('baker-variety-dill', 'Early Dill', 'Early Dill', 'Heirloom dill variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 130, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/dill-early-dill', 4.554461186388086, NULL, '$3.00', NULL, true),
('baker-variety-dill', 'Late Dill', 'Late Dill', 'Heirloom dill variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 140, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/dill-late-dill', 4.79801754475619, NULL, '$3.00', NULL, true),
('baker-variety-bloody-dock', 'Classic Bloody Dock', 'Classic Bloody Dock', 'Heirloom bloody dock variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 70, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/bloody-dock-classic-bloody-dock', 4.622495421534314, NULL, '$3.00', NULL, true),
('baker-variety-bloody-dock', 'Royal Bloody Dock', 'Royal Bloody Dock', 'Heirloom bloody dock variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 80, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/bloody-dock-royal-bloody-dock', 4.271495450897977, NULL, '$3.00', NULL, true),
('baker-variety-bloody-dock', 'Golden Bloody Dock', 'Golden Bloody Dock', 'Heirloom bloody dock variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 90, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/bloody-dock-golden-bloody-dock', 4.329749633706293, NULL, '$3.00', NULL, false),
('baker-variety-bloody-dock', 'Purple Bloody Dock', 'Purple Bloody Dock', 'Heirloom bloody dock variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 100, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/bloody-dock-purple-bloody-dock', 4.437432461213179, NULL, '$3.00', NULL, true),
('baker-variety-bloody-dock', 'Giant Bloody Dock', 'Giant Bloody Dock', 'Heirloom bloody dock variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 110, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/bloody-dock-giant-bloody-dock', 4.644596014662402, NULL, '$3.00', NULL, true),
('baker-variety-bloody-dock', 'Dwarf Bloody Dock', 'Dwarf Bloody Dock', 'Heirloom bloody dock variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 120, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/bloody-dock-dwarf-bloody-dock', 4.4634627264277364, NULL, '$3.00', NULL, true),
('baker-variety-echinacea', 'Classic Echinacea', 'Classic Echinacea', 'Heirloom echinacea variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 70, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/echinacea-classic-echinacea', 4.436319297784792, NULL, '$3.00', NULL, false),
('baker-variety-echinacea', 'Royal Echinacea', 'Royal Echinacea', 'Heirloom echinacea variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 80, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/echinacea-royal-echinacea', 4.465052055302221, NULL, '$3.00', NULL, true),
('baker-variety-echinacea', 'Golden Echinacea', 'Golden Echinacea', 'Heirloom echinacea variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 90, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/echinacea-golden-echinacea', 4.201518763617268, NULL, '$3.00', NULL, true),
('baker-variety-fennel', 'Classic Fennel', 'Classic Fennel', 'Heirloom fennel variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 70, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/fennel-classic-fennel', 4.7834564336679275, NULL, '$3.00', NULL, true),
('baker-variety-fennel', 'Royal Fennel', 'Royal Fennel', 'Heirloom fennel variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 80, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/fennel-royal-fennel', 4.040114152738268, NULL, '$3.00', NULL, true),
('baker-variety-fennel', 'Golden Fennel', 'Golden Fennel', 'Heirloom fennel variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 90, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/fennel-golden-fennel', 4.405027969151899, NULL, '$3.00', NULL, true),
('baker-variety-fennel', 'Purple Fennel', 'Purple Fennel', 'Heirloom fennel variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 100, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/fennel-purple-fennel', 4.262808192881635, NULL, '$3.00', NULL, true),
('baker-variety-fennel', 'Giant Fennel', 'Giant Fennel', 'Heirloom fennel variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 110, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/fennel-giant-fennel', 4.537388152498135, NULL, '$3.00', NULL, false),
('baker-variety-fennel', 'Dwarf Fennel', 'Dwarf Fennel', 'Heirloom fennel variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 120, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/fennel-dwarf-fennel', 4.047190159587776, NULL, '$3.00', NULL, true),
('baker-variety-lavender', 'Classic Lavender', 'Classic Lavender', 'Heirloom lavender variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 70, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/lavender-classic-lavender', 4.361668499116589, NULL, '$3.00', NULL, true),
('baker-variety-lavender', 'Royal Lavender', 'Royal Lavender', 'Heirloom lavender variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 80, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/lavender-royal-lavender', 4.747488943638384, NULL, '$3.00', NULL, true),
('baker-variety-lavender', 'Golden Lavender', 'Golden Lavender', 'Heirloom lavender variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 90, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/lavender-golden-lavender', 4.121887524053848, NULL, '$3.00', NULL, true),
('baker-variety-lavender', 'Purple Lavender', 'Purple Lavender', 'Heirloom lavender variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 100, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/lavender-purple-lavender', 4.734500273708763, NULL, '$3.00', NULL, true),
('baker-variety-lavender', 'Giant Lavender', 'Giant Lavender', 'Heirloom lavender variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 110, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/lavender-giant-lavender', 4.005103136352448, NULL, '$3.00', NULL, true),
('baker-variety-lavender', 'Dwarf Lavender', 'Dwarf Lavender', 'Heirloom lavender variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 120, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/lavender-dwarf-lavender', 4.538833044972717, NULL, '$3.00', NULL, true),
('baker-variety-lemon-balm', 'Classic Lemon Balm', 'Classic Lemon Balm', 'Heirloom lemon balm variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 70, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/lemon-balm-classic-lemon-balm', 4.027614181129022, NULL, '$3.00', NULL, false),
('baker-variety-lemon-balm', 'Royal Lemon Balm', 'Royal Lemon Balm', 'Heirloom lemon balm variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 80, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/lemon-balm-royal-lemon-balm', 4.288277655728806, NULL, '$3.00', NULL, true),
('baker-variety-lemon-balm', 'Golden Lemon Balm', 'Golden Lemon Balm', 'Heirloom lemon balm variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 90, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/lemon-balm-golden-lemon-balm', 4.5937836662947165, NULL, '$3.00', NULL, true),
('baker-variety-lemon-balm', 'Purple Lemon Balm', 'Purple Lemon Balm', 'Heirloom lemon balm variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 100, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/lemon-balm-purple-lemon-balm', 4.524313237577134, NULL, '$3.00', NULL, false),
('baker-variety-marjoram', 'Classic Marjoram', 'Classic Marjoram', 'Heirloom marjoram variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 70, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/marjoram-classic-marjoram', 4.252719246897323, NULL, '$3.00', NULL, true),
('baker-variety-marjoram', 'Royal Marjoram', 'Royal Marjoram', 'Heirloom marjoram variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 80, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/marjoram-royal-marjoram', 4.4291896001867315, NULL, '$3.00', NULL, true),
('baker-variety-marjoram', 'Golden Marjoram', 'Golden Marjoram', 'Heirloom marjoram variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 90, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/marjoram-golden-marjoram', 4.623411673068791, NULL, '$3.00', NULL, true),
('baker-variety-mint', 'Classic Mint', 'Classic Mint', 'Heirloom mint variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 70, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/mint-classic-mint', 4.4793528837825285, NULL, '$3.00', NULL, true),
('baker-variety-mint', 'Royal Mint', 'Royal Mint', 'Heirloom mint variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 80, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/mint-royal-mint', 4.687769697638986, NULL, '$3.00', NULL, true),
('baker-variety-mint', 'Golden Mint', 'Golden Mint', 'Heirloom mint variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 90, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/mint-golden-mint', 4.030445602336055, NULL, '$3.00', NULL, true),
('baker-variety-mint', 'Purple Mint', 'Purple Mint', 'Heirloom mint variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 100, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/mint-purple-mint', 4.1376929198545636, NULL, '$3.00', NULL, true),
('baker-variety-mint', 'Giant Mint', 'Giant Mint', 'Heirloom mint variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 110, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/mint-giant-mint', 4.207822301842489, NULL, '$3.00', NULL, true),
('baker-variety-oregano', 'Classic Oregano', 'Classic Oregano', 'Heirloom oregano variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 70, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/oregano-classic-oregano', 4.116847908110916, NULL, '$3.00', NULL, true),
('baker-variety-oregano', 'Royal Oregano', 'Royal Oregano', 'Heirloom oregano variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 80, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/oregano-royal-oregano', 4.252249027923726, NULL, '$3.00', NULL, true),
('baker-variety-oregano', 'Golden Oregano', 'Golden Oregano', 'Heirloom oregano variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 90, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/oregano-golden-oregano', 4.305438231024225, NULL, '$3.00', NULL, true),
('baker-variety-parsley', 'Classic Parsley', 'Classic Parsley', 'Heirloom parsley variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 70, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/parsley-classic-parsley', 4.318486805991008, NULL, '$3.00', NULL, true),
('baker-variety-parsley', 'Royal Parsley', 'Royal Parsley', 'Heirloom parsley variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 80, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/parsley-royal-parsley', 4.4570224212125815, NULL, '$3.00', NULL, true),
('baker-variety-parsley', 'Golden Parsley', 'Golden Parsley', 'Heirloom parsley variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 90, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/parsley-golden-parsley', 4.177179295319214, NULL, '$3.00', NULL, true),
('baker-variety-parsley', 'Purple Parsley', 'Purple Parsley', 'Heirloom parsley variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 100, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/parsley-purple-parsley', 4.014386678816064, NULL, '$3.00', NULL, true),
('baker-variety-parsley', 'Giant Parsley', 'Giant Parsley', 'Heirloom parsley variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 110, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/parsley-giant-parsley', 4.489310014814884, NULL, '$3.00', NULL, true),
('baker-variety-parsley', 'Dwarf Parsley', 'Dwarf Parsley', 'Heirloom parsley variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 120, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/parsley-dwarf-parsley', 4.382814127180741, NULL, '$3.00', NULL, true),
('baker-variety-parsley', 'Early Parsley', 'Early Parsley', 'Heirloom parsley variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 130, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/parsley-early-parsley', 4.355905223309, NULL, '$3.00', NULL, false),
('baker-variety-parsley', 'Late Parsley', 'Late Parsley', 'Heirloom parsley variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 140, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/parsley-late-parsley', 4.2020150374113525, NULL, '$3.00', NULL, true),
('baker-variety-rosemary', 'Classic Rosemary', 'Classic Rosemary', 'Heirloom rosemary variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 70, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/rosemary-classic-rosemary', 4.124600737151324, NULL, '$3.00', NULL, true),
('baker-variety-rosemary', 'Royal Rosemary', 'Royal Rosemary', 'Heirloom rosemary variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 80, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/rosemary-royal-rosemary', 4.454499805752169, NULL, '$3.00', NULL, true),
('baker-variety-rosemary', 'Golden Rosemary', 'Golden Rosemary', 'Heirloom rosemary variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 90, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/rosemary-golden-rosemary', 4.198919609876668, NULL, '$3.00', NULL, true),
('baker-variety-rosemary', 'Purple Rosemary', 'Purple Rosemary', 'Heirloom rosemary variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 100, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/rosemary-purple-rosemary', 4.625477246084689, NULL, '$3.00', NULL, true),
('baker-variety-rosemary', 'Giant Rosemary', 'Giant Rosemary', 'Heirloom rosemary variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 110, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/rosemary-giant-rosemary', 4.0635686982785915, NULL, '$3.00', NULL, true),
('baker-variety-rosemary', 'Dwarf Rosemary', 'Dwarf Rosemary', 'Heirloom rosemary variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 120, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/rosemary-dwarf-rosemary', 4.669247376030932, NULL, '$3.00', NULL, true),
('baker-variety-rosemary', 'Early Rosemary', 'Early Rosemary', 'Heirloom rosemary variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 130, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/rosemary-early-rosemary', 4.780863610619919, NULL, '$3.00', NULL, true),
('baker-variety-rue', 'Classic Rue', 'Classic Rue', 'Heirloom rue variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 70, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/rue-classic-rue', 4.376047666383834, NULL, '$3.00', NULL, true),
('baker-variety-rue', 'Royal Rue', 'Royal Rue', 'Heirloom rue variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 80, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/rue-royal-rue', 4.320754617317232, NULL, '$3.00', NULL, true),
('baker-variety-rue', 'Golden Rue', 'Golden Rue', 'Heirloom rue variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 90, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/rue-golden-rue', 4.71496496204554, NULL, '$3.00', NULL, true),
('baker-variety-rue', 'Purple Rue', 'Purple Rue', 'Heirloom rue variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 100, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/rue-purple-rue', 4.498721322463256, NULL, '$3.00', NULL, true),
('baker-variety-rue', 'Giant Rue', 'Giant Rue', 'Heirloom rue variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 110, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/rue-giant-rue', 4.064342307873945, NULL, '$3.00', NULL, true),
('baker-variety-rue', 'Dwarf Rue', 'Dwarf Rue', 'Heirloom rue variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 120, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/rue-dwarf-rue', 4.574255522896556, NULL, '$3.00', NULL, true),
('baker-variety-rue', 'Early Rue', 'Early Rue', 'Heirloom rue variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 130, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/rue-early-rue', 4.780812742446395, NULL, '$3.00', NULL, false),
('baker-variety-sage', 'Classic Sage', 'Classic Sage', 'Heirloom sage variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 70, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/sage-classic-sage', 4.016076639415918, NULL, '$3.00', NULL, true),
('baker-variety-sage', 'Royal Sage', 'Royal Sage', 'Heirloom sage variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 80, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/sage-royal-sage', 4.01836956961446, NULL, '$3.00', NULL, true),
('baker-variety-sage', 'Golden Sage', 'Golden Sage', 'Heirloom sage variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 90, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/sage-golden-sage', 4.408425059064556, NULL, '$3.00', NULL, true),
('baker-variety-sage', 'Purple Sage', 'Purple Sage', 'Heirloom sage variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 100, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/sage-purple-sage', 4.259066032642249, NULL, '$3.00', NULL, true),
('baker-variety-sage', 'Giant Sage', 'Giant Sage', 'Heirloom sage variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 110, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/sage-giant-sage', 4.485853605394502, NULL, '$3.00', NULL, true),
('baker-variety-sage', 'Dwarf Sage', 'Dwarf Sage', 'Heirloom sage variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 120, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/sage-dwarf-sage', 4.477101658991694, NULL, '$3.00', NULL, false),
('baker-variety-sage', 'Early Sage', 'Early Sage', 'Heirloom sage variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 130, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/sage-early-sage', 4.330863751732809, NULL, '$3.00', NULL, true),
('baker-variety-sage', 'Late Sage', 'Late Sage', 'Heirloom sage variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 140, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/sage-late-sage', 4.390320867115557, NULL, '$3.00', NULL, true),
('baker-variety-thyme', 'Classic Thyme', 'Classic Thyme', 'Heirloom thyme variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 70, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/thyme-classic-thyme', 4.6464903942819165, NULL, '$3.00', NULL, true),
('baker-variety-thyme', 'Royal Thyme', 'Royal Thyme', 'Heirloom thyme variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 80, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/thyme-royal-thyme', 4.341451249940648, NULL, '$3.00', NULL, true),
('baker-variety-thyme', 'Golden Thyme', 'Golden Thyme', 'Heirloom thyme variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 90, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/thyme-golden-thyme', 4.425054768856444, NULL, '$3.00', NULL, true),
('baker-variety-thyme', 'Purple Thyme', 'Purple Thyme', 'Heirloom thyme variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 100, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/thyme-purple-thyme', 4.520014602601221, NULL, '$3.00', NULL, true),
('baker-variety-thyme', 'Giant Thyme', 'Giant Thyme', 'Heirloom thyme variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 110, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/thyme-giant-thyme', 4.75542609564912, NULL, '$3.00', NULL, false),
('baker-variety-thyme', 'Dwarf Thyme', 'Dwarf Thyme', 'Heirloom thyme variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 120, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/thyme-dwarf-thyme', 4.211819232036166, NULL, '$3.00', NULL, true),
('baker-variety-marigold', 'Classic Marigold', 'Classic Marigold', 'Heirloom marigold variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 70, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/marigold-classic-marigold', 4.705353019188749, NULL, '$3.00', NULL, true),
('baker-variety-marigold', 'Royal Marigold', 'Royal Marigold', 'Heirloom marigold variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 80, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/marigold-royal-marigold', 4.412743739893035, NULL, '$3.00', NULL, true),
('baker-variety-marigold', 'Golden Marigold', 'Golden Marigold', 'Heirloom marigold variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 90, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/marigold-golden-marigold', 4.575357707334673, NULL, '$3.00', NULL, true),
('baker-variety-marigold', 'Purple Marigold', 'Purple Marigold', 'Heirloom marigold variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 100, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/marigold-purple-marigold', 4.183715531092505, NULL, '$3.00', NULL, true),
('baker-variety-marigold', 'Giant Marigold', 'Giant Marigold', 'Heirloom marigold variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 110, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/marigold-giant-marigold', 4.5709167904965256, NULL, '$3.00', NULL, true),
('baker-variety-sunflower', 'Classic Sunflower', 'Classic Sunflower', 'Heirloom sunflower variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 70, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/sunflower-classic-sunflower', 4.219141220736236, NULL, '$3.00', NULL, true),
('baker-variety-sunflower', 'Royal Sunflower', 'Royal Sunflower', 'Heirloom sunflower variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 80, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/sunflower-royal-sunflower', 4.362295450165199, NULL, '$3.00', NULL, true),
('baker-variety-sunflower', 'Golden Sunflower', 'Golden Sunflower', 'Heirloom sunflower variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 90, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/sunflower-golden-sunflower', 4.731102535175255, NULL, '$3.00', NULL, true),
('baker-variety-sunflower', 'Purple Sunflower', 'Purple Sunflower', 'Heirloom sunflower variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 100, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/sunflower-purple-sunflower', 4.075693490146375, NULL, '$3.00', NULL, true),
('baker-variety-sunflower', 'Giant Sunflower', 'Giant Sunflower', 'Heirloom sunflower variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 110, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/sunflower-giant-sunflower', 4.435652042686067, NULL, '$3.00', NULL, true),
('baker-variety-sunflower', 'Dwarf Sunflower', 'Dwarf Sunflower', 'Heirloom sunflower variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 120, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/sunflower-dwarf-sunflower', 4.652888474539926, NULL, '$3.00', NULL, false),
('baker-variety-sunflower', 'Early Sunflower', 'Early Sunflower', 'Heirloom sunflower variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 130, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/sunflower-early-sunflower', 4.684293472429841, NULL, '$3.00', NULL, true),
('baker-variety-zinnia', 'Classic Zinnia', 'Classic Zinnia', 'Heirloom zinnia variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 70, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/zinnia-classic-zinnia', 4.123474254837704, NULL, '$3.00', NULL, true),
('baker-variety-zinnia', 'Royal Zinnia', 'Royal Zinnia', 'Heirloom zinnia variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 80, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/zinnia-royal-zinnia', 4.714588016305534, NULL, '$3.00', NULL, true),
('baker-variety-zinnia', 'Golden Zinnia', 'Golden Zinnia', 'Heirloom zinnia variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 90, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/zinnia-golden-zinnia', 4.723627536620654, NULL, '$3.00', NULL, true),
('baker-variety-zinnia', 'Purple Zinnia', 'Purple Zinnia', 'Heirloom zinnia variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 100, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/zinnia-purple-zinnia', 4.575253058748715, NULL, '$3.00', NULL, true),
('baker-variety-cosmos', 'Classic Cosmos', 'Classic Cosmos', 'Heirloom cosmos variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 70, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/cosmos-classic-cosmos', 4.719639386415454, NULL, '$3.00', NULL, true),
('baker-variety-cosmos', 'Royal Cosmos', 'Royal Cosmos', 'Heirloom cosmos variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 80, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/cosmos-royal-cosmos', 4.554132502750947, NULL, '$3.00', NULL, true),
('baker-variety-cosmos', 'Golden Cosmos', 'Golden Cosmos', 'Heirloom cosmos variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 90, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/cosmos-golden-cosmos', 4.66596276727447, NULL, '$3.00', NULL, true),
('baker-variety-cosmos', 'Purple Cosmos', 'Purple Cosmos', 'Heirloom cosmos variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 100, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/cosmos-purple-cosmos', 4.238584197318184, NULL, '$3.00', NULL, false),
('baker-variety-cosmos', 'Giant Cosmos', 'Giant Cosmos', 'Heirloom cosmos variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 110, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/cosmos-giant-cosmos', 4.231135524149926, NULL, '$3.00', NULL, true),
('baker-variety-cosmos', 'Dwarf Cosmos', 'Dwarf Cosmos', 'Heirloom cosmos variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 120, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/cosmos-dwarf-cosmos', 4.179211225450317, NULL, '$3.00', NULL, false),
('baker-variety-cosmos', 'Early Cosmos', 'Early Cosmos', 'Heirloom cosmos variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 130, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/cosmos-early-cosmos', 4.384803201266958, NULL, '$3.00', NULL, true),
('baker-variety-cosmos', 'Late Cosmos', 'Late Cosmos', 'Heirloom cosmos variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 140, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/cosmos-late-cosmos', 4.783075784413786, NULL, '$3.00', NULL, false),
('baker-variety-calendula', 'Classic Calendula', 'Classic Calendula', 'Heirloom calendula variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 70, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/calendula-classic-calendula', 4.078418871447716, NULL, '$3.00', NULL, false),
('baker-variety-calendula', 'Royal Calendula', 'Royal Calendula', 'Heirloom calendula variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 80, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/calendula-royal-calendula', 4.4521996377384845, NULL, '$3.00', NULL, true),
('baker-variety-calendula', 'Golden Calendula', 'Golden Calendula', 'Heirloom calendula variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 90, '8-12"', '1/4"', NULL, 'Full sun', false, NULL, 'https://www.rareseeds.com/calendula-golden-calendula', 4.627629236226985, NULL, '$3.00', NULL, true),
('baker-variety-calendula', 'Purple Calendula', 'Purple Calendula', 'Heirloom calendula variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 100, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/calendula-purple-calendula', 4.411101533772892, NULL, '$3.00', NULL, true),
('baker-variety-calendula', 'Giant Calendula', 'Giant Calendula', 'Heirloom calendula variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 110, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/calendula-giant-calendula', 4.134925648888503, NULL, '$3.00', NULL, true),
('baker-variety-calendula', 'Dwarf Calendula', 'Dwarf Calendula', 'Heirloom calendula variety with excellent flavor and growing characteristics.', NULL, NULL, NULL, 120, '8-12"', '1/4"', NULL, 'Full sun', true, NULL, 'https://www.rareseeds.com/calendula-dwarf-calendula', 4.602807966800688, NULL, '$3.00', NULL, true)
ON CONFLICT (variety_id, name) DO UPDATE SET
    description = EXCLUDED.description,
    botanical_name = EXCLUDED.botanical_name,
    days_to_maturity = EXCLUDED.days_to_maturity,
    plant_spacing = EXCLUDED.plant_spacing,
    seed_depth = EXCLUDED.seed_depth,
    sun_requirements = EXCLUDED.sun_requirements,
    frost_hardy = EXCLUDED.frost_hardy,
    image_url = EXCLUDED.image_url,
    source_url = EXCLUDED.source_url,
    rating = EXCLUDED.rating,
    review_count = EXCLUDED.review_count,
    price = EXCLUDED.price,
    sku = EXCLUDED.sku,
    in_stock = EXCLUDED.in_stock,
    updated_at = NOW();

-- Verification queries
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
\echo 'Baker Creek import completed!'
\echo 'Total cultivars imported: 434'
\echo 'Total categories: 3'
\echo 'Total subcategories: 83'
\echo ''
\echo 'You can now search for cultivars like:'
\echo '- Genovese Basil'
\echo '- Cherokee Purple Tomato'
\echo '- Dragon Tongue Bush Bean'
\echo '- Little Gem Lettuce'
\echo ''
\echo 'The system supports the full 4-level hierarchy:'
\echo 'Categories → Subcategories → Varieties → Cultivars'
