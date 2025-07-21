-- Insert mock data for testing

-- Insert categories
INSERT INTO categories (id, name, image) VALUES
('550e8400-e29b-41d4-a716-446655440001', 'Vegetables', '/images/categories/vegetables.jpg'),
('550e8400-e29b-41d4-a716-446655440002', 'Fruits', '/images/categories/fruits.jpg'),
('550e8400-e29b-41d4-a716-446655440003', 'Herbs', '/images/categories/herbs.jpg'),
('550e8400-e29b-41d4-a716-446655440004', 'Leafy Greens', '/images/categories/leafy-greens.jpg'),
('550e8400-e29b-41d4-a716-446655440005', 'Root Vegetables', '/images/categories/root-vegetables.jpg');

-- Insert subcategories
INSERT INTO subcategories (id, category_id, name, image) VALUES
-- Vegetables subcategories
('650e8400-e29b-41d4-a716-446655440001', '550e8400-e29b-41d4-a716-446655440001', 'Tomatoes', '/images/subcategories/tomatoes.jpg'),
('650e8400-e29b-41d4-a716-446655440002', '550e8400-e29b-41d4-a716-446655440001', 'Peppers', '/images/subcategories/peppers.jpg'),
('650e8400-e29b-41d4-a716-446655440003', '550e8400-e29b-41d4-a716-446655440001', 'Squash', '/images/subcategories/squash.jpg'),
-- Fruits subcategories
('650e8400-e29b-41d4-a716-446655440004', '550e8400-e29b-41d4-a716-446655440002', 'Berries', '/images/subcategories/berries.jpg'),
('650e8400-e29b-41d4-a716-446655440005', '550e8400-e29b-41d4-a716-446655440002', 'Stone Fruits', '/images/subcategories/stone-fruits.jpg'),
-- Herbs subcategories
('650e8400-e29b-41d4-a716-446655440006', '550e8400-e29b-41d4-a716-446655440003', 'Culinary Herbs', '/images/subcategories/culinary-herbs.jpg'),
-- Leafy Greens subcategories
('650e8400-e29b-41d4-a716-446655440007', '550e8400-e29b-41d4-a716-446655440004', 'Lettuce', '/images/subcategories/lettuce.jpg'),
('650e8400-e29b-41d4-a716-446655440008', '550e8400-e29b-41d4-a716-446655440004', 'Spinach', '/images/subcategories/spinach.jpg'),
-- Root Vegetables subcategories
('650e8400-e29b-41d4-a716-446655440009', '550e8400-e29b-41d4-a716-446655440005', 'Carrots', '/images/subcategories/carrots.jpg');

-- Insert varieties
INSERT INTO varieties (id, subcategory_id, name, emoji, description, card_image, nutritional_info, taste_profile, culinary_uses) VALUES
-- Tomato varieties
('750e8400-e29b-41d4-a716-446655440001', '650e8400-e29b-41d4-a716-446655440001', 'Cherry', '🍅', 'Small, sweet tomatoes perfect for snacking', '/images/varieties/cherry-tomatoes.jpg', 
 '{"calories": 18, "vitamin_c": "21mg", "potassium": "237mg"}', 
 '{"sweetness": 8, "acidity": 6, "umami": 4}', 
 ARRAY['salads', 'snacking', 'pasta', 'pizza']),
('750e8400-e29b-41d4-a716-446655440002', '650e8400-e29b-41d4-a716-446655440001', 'Roma', '🍅', 'Meaty tomatoes ideal for sauces and cooking', '/images/varieties/roma-tomatoes.jpg',
 '{"calories": 18, "vitamin_c": "21mg", "potassium": "237mg"}',
 '{"sweetness": 6, "acidity": 7, "umami": 6}',
 ARRAY['sauces', 'cooking', 'canning']),
('750e8400-e29b-41d4-a716-446655440003', '650e8400-e29b-41d4-a716-446655440001', 'Heirloom', '🍅', 'Traditional varieties with exceptional flavor', '/images/varieties/heirloom-tomatoes.jpg',
 '{"calories": 18, "vitamin_c": "21mg", "potassium": "237mg"}',
 '{"sweetness": 9, "acidity": 5, "umami": 8}',
 ARRAY['fresh eating', 'salads', 'sandwiches']),
-- Herb varieties
('750e8400-e29b-41d4-a716-446655440004', '650e8400-e29b-41d4-a716-446655440006', 'Sweet Basil', '🌿', 'Classic Italian basil with sweet, aromatic flavor', '/images/varieties/sweet-basil.jpg',
 '{"calories": 22, "vitamin_k": "414mcg", "iron": "3.2mg"}',
 '{"sweetness": 7, "spiciness": 2, "aromatic": 9}',
 ARRAY['pasta', 'pizza', 'pesto', 'salads']),
-- Spinach varieties
('750e8400-e29b-41d4-a716-446655440005', '650e8400-e29b-41d4-a716-446655440008', 'Baby Spinach', '🥬', 'Tender young spinach leaves', '/images/varieties/baby-spinach.jpg',
 '{"calories": 23, "iron": "2.7mg", "folate": "194mcg"}',
 '{"bitterness": 2, "earthiness": 4, "tenderness": 9}',
 ARRAY['salads', 'smoothies', 'sautéing']),
-- Carrot varieties
('750e8400-e29b-41d4-a716-446655440006', '650e8400-e29b-41d4-a716-446655440009', 'Rainbow Mix', '🥕', 'Colorful mix of purple, orange, and yellow carrots', '/images/varieties/rainbow-carrots.jpg',
 '{"calories": 41, "beta_carotene": "8285mcg", "fiber": "2.8g"}',
 '{"sweetness": 8, "earthiness": 6, "crunch": 9}',
 ARRAY['roasting', 'raw snacking', 'juicing']);

-- Insert sample farms
INSERT INTO farms (id, name, description, logo, cover_image, owner_name, email, phone, website, address, certifications, specialties, delivery_zones) VALUES
('850e8400-e29b-41d4-a716-446655440001', 'Green Valley Farm', 'Family-owned organic farm specializing in fresh vegetables and herbs. We have been serving our community with the highest quality produce for over 20 years.', 
 '/images/farms/green-valley-logo.jpg', '/images/farms/green-valley-cover.jpg', 
 'John Doe', 'john@greenvalleyfarm.com', '(555) 123-4567', 'www.greenvalleyfarm.com',
 '123 Farm Road, Valley City, CA 12345',
 ARRAY['Organic', 'Non-GMO', 'Sustainable'],
 ARRAY['Heirloom Tomatoes', 'Fresh Herbs', 'Leafy Greens'],
 ARRAY['Valley City', 'Riverside', 'Mountain View']),
('850e8400-e29b-41d4-a716-446655440002', 'Sunrise Organic Farm', 'Certified organic farm focused on sustainable growing practices and premium quality produce.',
 '/images/farms/sunrise-logo.jpg', '/images/farms/sunrise-cover.jpg',
 'Maria Garcia', 'maria@sunriseorganic.com', '(555) 987-6543', 'www.sunriseorganic.com',
 '456 Sunrise Lane, Organic Valley, CA 12346',
 ARRAY['Organic', 'Biodynamic', 'Fair Trade'],
 ARRAY['Root Vegetables', 'Seasonal Fruits', 'Microgreens'],
 ARRAY['Organic Valley', 'Green Hills', 'Sunset District']);

-- Insert sample users (customers)
INSERT INTO users (id, name, email, phone) VALUES
('950e8400-e29b-41d4-a716-446655440001', 'Sarah Johnson', 'sarah@email.com', '(555) 111-2222'),
('950e8400-e29b-41d4-a716-446655440002', 'Mike Chen', 'mike@email.com', '(555) 333-4444'),
('950e8400-e29b-41d4-a716-446655440003', 'Emma Davis', 'emma@email.com', '(555) 555-6666'),
('950e8400-e29b-41d4-a716-446655440004', 'Tom Wilson', 'tom@email.com', '(555) 777-8888');

-- Insert user addresses
INSERT INTO user_addresses (user_id, address_line_1, city, state, zip_code, is_default) VALUES
('950e8400-e29b-41d4-a716-446655440001', '123 Main St', 'Valley City', 'CA', '12345', true),
('950e8400-e29b-41d4-a716-446655440002', '456 Oak Ave', 'Valley City', 'CA', '12345', true),
('950e8400-e29b-41d4-a716-446655440003', '789 Pine St', 'Valley City', 'CA', '12345', true),
('950e8400-e29b-41d4-a716-446655440004', '321 Elm Dr', 'Valley City', 'CA', '12345', true);

-- Insert sample products
INSERT INTO products (id, name, farm_id, variety_id, price, stock, freshness, harvest_date, organic, in_season, delivery_days, images) VALUES
('a50e8400-e29b-41d4-a716-446655440001', 'Organic Cherry Tomatoes', '850e8400-e29b-41d4-a716-446655440001', '750e8400-e29b-41d4-a716-446655440001', 4.99, 25, 95, '2024-01-10', true, true, ARRAY['Monday', 'Wednesday', 'Friday'], ARRAY['/images/products/cherry-tomatoes-1.jpg', '/images/products/cherry-tomatoes-2.jpg']),
('a50e8400-e29b-41d4-a716-446655440002', 'Fresh Sweet Basil', '850e8400-e29b-41d4-a716-446655440001', '750e8400-e29b-41d4-a716-446655440004', 2.50, 15, 88, '2024-01-12', true, true, ARRAY['Tuesday', 'Thursday', 'Saturday'], ARRAY['/images/products/basil-1.jpg']),
('a50e8400-e29b-41d4-a716-446655440003', 'Baby Spinach', '850e8400-e29b-41d4-a716-446655440001', '750e8400-e29b-41d4-a716-446655440005', 3.75, 8, 92, '2024-01-11', false, true, ARRAY['Monday', 'Wednesday', 'Friday'], ARRAY['/images/products/spinach-1.jpg']),
('a50e8400-e29b-41d4-a716-446655440004', 'Rainbow Carrots', '850e8400-e29b-41d4-a716-446655440001', '750e8400-e29b-41d4-a716-446655440006', 3.25, 20, 90, '2024-01-09', true, true, ARRAY['Tuesday', 'Thursday', 'Saturday'], ARRAY['/images/products/carrots-1.jpg']),
('a50e8400-e29b-41d4-a716-446655440005', 'Heirloom Tomatoes', '850e8400-e29b-41d4-a716-446655440002', '750e8400-e29b-41d4-a716-446655440003', 6.99, 12, 93, '2024-01-10', true, true, ARRAY['Monday', 'Wednesday', 'Friday'], ARRAY['/images/products/heirloom-tomatoes-1.jpg']);

-- Insert sample orders
INSERT INTO orders (id, order_number, user_id, farm_id, status, subtotal, tax, delivery_fee, total, delivery_address, delivery_date, notes) VALUES
('b50e8400-e29b-41d4-a716-446655440001', 'ORD-001', '950e8400-e29b-41d4-a716-446655440001', '850e8400-e29b-41d4-a716-446655440001', 'pending', 12.48, 1.00, 2.50, 15.98, 
 '{"address": "123 Main St, Valley City, CA 12345", "instructions": "Leave at front door"}', '2024-01-17', 'Please handle with care'),
('b50e8400-e29b-41d4-a716-446655440002', 'ORD-002', '950e8400-e29b-41d4-a716-446655440002', '850e8400-e29b-41d4-a716-446655440001', 'confirmed', 17.75, 1.42, 2.50, 21.67,
 '{"address": "456 Oak Ave, Valley City, CA 12345", "instructions": "Ring doorbell"}', '2024-01-16', NULL),
('b50e8400-e29b-41d4-a716-446655440003', 'ORD-003', '950e8400-e29b-41d4-a716-446655440003', '850e8400-e29b-41d4-a716-446655440001', 'delivered', 9.99, 0.80, 2.50, 13.29,
 '{"address": "789 Pine St, Valley City, CA 12345", "instructions": ""}', '2024-01-15', NULL),
('b50e8400-e29b-41d4-a716-446655440004', 'ORD-004', '950e8400-e29b-41d4-a716-446655440004', '850e8400-e29b-41d4-a716-446655440001', 'pending', 13.00, 1.04, 2.50, 16.54,
 '{"address": "321 Elm Dr, Valley City, CA 12345", "instructions": "Call when arriving"}', '2024-01-18', NULL);

-- Insert order items
INSERT INTO order_items (order_id, product_id, quantity, unit_price, total_price) VALUES
-- Order 1 items
('b50e8400-e29b-41d4-a716-446655440001', 'a50e8400-e29b-41d4-a716-446655440001', 2, 4.99, 9.98),
('b50e8400-e29b-41d4-a716-446655440001', 'a50e8400-e29b-41d4-a716-446655440002', 1, 2.50, 2.50),
-- Order 2 items
('b50e8400-e29b-41d4-a716-446655440002', 'a50e8400-e29b-41d4-a716-446655440003', 3, 3.75, 11.25),
('b50e8400-e29b-41d4-a716-446655440002', 'a50e8400-e29b-41d4-a716-446655440004', 2, 3.25, 6.50),
-- Order 3 items
('b50e8400-e29b-41d4-a716-446655440003', 'a50e8400-e29b-41d4-a716-446655440001', 1, 4.99, 4.99),
('b50e8400-e29b-41d4-a716-446655440003', 'a50e8400-e29b-41d4-a716-446655440002', 2, 2.50, 5.00),
-- Order 4 items
('b50e8400-e29b-41d4-a716-446655440004', 'a50e8400-e29b-41d4-a716-446655440004', 4, 3.25, 13.00);
