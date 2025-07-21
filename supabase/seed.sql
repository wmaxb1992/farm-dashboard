-- Seed data for farm dashboard

-- Insert sample categories
INSERT INTO categories (id, name, image) VALUES
('550e8400-e29b-41d4-a716-446655440001', 'Vegetables', '/images/categories/vegetables.jpg'),
('550e8400-e29b-41d4-a716-446655440002', 'Fruits', '/images/categories/fruits.jpg'),
('550e8400-e29b-41d4-a716-446655440003', 'Herbs', '/images/categories/herbs.jpg');

-- Insert sample subcategories
INSERT INTO subcategories (id, category_id, name, image) VALUES
('660e8400-e29b-41d4-a716-446655440001', '550e8400-e29b-41d4-a716-446655440001', 'Leafy Greens', '/images/subcategories/leafy-greens.jpg'),
('660e8400-e29b-41d4-a716-446655440002', '550e8400-e29b-41d4-a716-446655440001', 'Root Vegetables', '/images/subcategories/root-vegetables.jpg'),
('660e8400-e29b-41d4-a716-446655440003', '550e8400-e29b-41d4-a716-446655440002', 'Berries', '/images/subcategories/berries.jpg'),
('660e8400-e29b-41d4-a716-446655440004', '550e8400-e29b-41d4-a716-446655440003', 'Cooking Herbs', '/images/subcategories/cooking-herbs.jpg');

-- Insert sample varieties
INSERT INTO varieties (id, subcategory_id, name, emoji, description, culinary_uses) VALUES
('770e8400-e29b-41d4-a716-446655440001', '660e8400-e29b-41d4-a716-446655440001', 'Spinach', '🍃', 'Fresh baby spinach leaves', ARRAY['salads', 'smoothies', 'cooking']),
('770e8400-e29b-41d4-a716-446655440002', '660e8400-e29b-41d4-a716-446655440001', 'Lettuce', '🥬', 'Crisp romaine lettuce', ARRAY['salads', 'wraps']),
('770e8400-e29b-41d4-a716-446655440003', '660e8400-e29b-41d4-a716-446655440002', 'Carrots', '🥕', 'Fresh orange carrots', ARRAY['cooking', 'snacking', 'juicing']),
('770e8400-e29b-41d4-a716-446655440004', '660e8400-e29b-41d4-a716-446655440003', 'Strawberries', '🍓', 'Sweet red strawberries', ARRAY['desserts', 'snacking']),
('770e8400-e29b-41d4-a716-446655440005', '660e8400-e29b-41d4-a716-446655440004', 'Basil', '🌿', 'Fresh basil leaves', ARRAY['cooking', 'seasoning']);

-- Insert sample farms
INSERT INTO farms (id, name, description, owner_name, email, phone, address, rating, certifications, specialties, delivery_zones) VALUES
('850e8400-e29b-41d4-a716-446655440001', 'Green Valley Farm', 'Family-owned organic farm specializing in fresh vegetables and herbs', 'John Doe', 'john@greenvalley.com', '(555) 123-4567', '123 Farm Road, Valley City, CA', 4.8, 
ARRAY['Organic', 'Non-GMO'], ARRAY['Heirloom Tomatoes', 'Fresh Herbs'], ARRAY['Valley City', 'Riverside']),

('850e8400-e29b-41d4-a716-446655440002', 'Berry Patch Farm', 'Specialized berry farm with sustainable practices', 'Jane Smith', 'jane@berrypatch.com', '(555) 234-5678', '456 Berry Lane, Hilltown, CA', 4.6,
ARRAY['Sustainable', 'Pesticide-Free'], ARRAY['Strawberries', 'Blueberries'], ARRAY['Hilltown', 'Greenville']),

('850e8400-e29b-41d4-a716-446655440003', 'Sunshine Organic', 'Large organic farm with diverse crops', 'Mike Johnson', 'mike@sunshine.com', '(555) 345-6789', '789 Sunshine Ave, Farmdale, CA', 4.7,
ARRAY['Organic', 'Fair Trade'], ARRAY['Mixed Vegetables', 'Seasonal Fruits'], ARRAY['Farmdale', 'Central City']);

-- Insert sample users
INSERT INTO users (id, name, email, phone) VALUES
('950e8400-e29b-41d4-a716-446655440001', 'Alice Cooper', 'alice@email.com', '(555) 111-2222'),
('950e8400-e29b-41d4-a716-446655440002', 'Bob Wilson', 'bob@email.com', '(555) 333-4444'),
('950e8400-e29b-41d4-a716-446655440003', 'Carol Davis', 'carol@email.com', '(555) 555-6666');

-- Insert sample products
INSERT INTO products (id, name, farm_id, variety_id, price, stock, freshness, harvest_date, organic, in_season, delivery_days, images) VALUES
('a50e8400-e29b-41d4-a716-446655440001', 'Fresh Baby Spinach', '850e8400-e29b-41d4-a716-446655440001', '770e8400-e29b-41d4-a716-446655440001', 3.99, 50, 95, '2025-07-10', true, true, ARRAY['Monday', 'Wednesday', 'Friday'], ARRAY['/images/products/spinach.jpg']),

('a50e8400-e29b-41d4-a716-446655440002', 'Organic Romaine Lettuce', '850e8400-e29b-41d4-a716-446655440001', '770e8400-e29b-41d4-a716-446655440002', 2.99, 30, 90, '2025-07-09', true, true, ARRAY['Monday', 'Wednesday', 'Friday'], ARRAY['/images/products/lettuce.jpg']),

('a50e8400-e29b-41d4-a716-446655440003', 'Sweet Strawberries', '850e8400-e29b-41d4-a716-446655440002', '770e8400-e29b-41d4-a716-446655440004', 5.99, 25, 98, '2025-07-10', false, true, ARRAY['Tuesday', 'Thursday', 'Saturday'], ARRAY['/images/products/strawberries.jpg']),

('a50e8400-e29b-41d4-a716-446655440004', 'Fresh Carrots', '850e8400-e29b-41d4-a716-446655440003', '770e8400-e29b-41d4-a716-446655440003', 2.49, 40, 85, '2025-07-08', true, true, ARRAY['Monday', 'Wednesday', 'Friday'], ARRAY['/images/products/carrots.jpg']),

('a50e8400-e29b-41d4-a716-446655440005', 'Organic Basil', '850e8400-e29b-41d4-a716-446655440001', '770e8400-e29b-41d4-a716-446655440005', 4.49, 15, 100, '2025-07-10', true, true, ARRAY['Monday', 'Wednesday', 'Friday'], ARRAY['/images/products/basil.jpg']);

-- Insert sample orders
INSERT INTO orders (id, order_number, user_id, farm_id, status, subtotal, tax, delivery_fee, total, delivery_address, delivery_date, notes) VALUES
('b50e8400-e29b-41d4-a716-446655440001', 'ORD-000001', '950e8400-e29b-41d4-a716-446655440001', '850e8400-e29b-41d4-a716-446655440001', 'confirmed', 10.98, 0.88, 5.00, 16.86, 
'{"street": "123 Main St", "city": "Valley City", "state": "CA", "zip": "12345"}', '2025-07-12', 'Leave at front door'),

('b50e8400-e29b-41d4-a716-446655440002', 'ORD-000002', '950e8400-e29b-41d4-a716-446655440002', '850e8400-e29b-41d4-a716-446655440002', 'preparing', 5.99, 0.48, 5.00, 11.47, 
'{"street": "456 Oak Ave", "city": "Hilltown", "state": "CA", "zip": "23456"}', '2025-07-13', '');

-- Insert sample order items
INSERT INTO order_items (id, order_id, product_id, quantity, unit_price, total_price) VALUES
('c50e8400-e29b-41d4-a716-446655440001', 'b50e8400-e29b-41d4-a716-446655440001', 'a50e8400-e29b-41d4-a716-446655440001', 2, 3.99, 7.98),
('c50e8400-e29b-41d4-a716-446655440002', 'b50e8400-e29b-41d4-a716-446655440001', 'a50e8400-e29b-41d4-a716-446655440002', 1, 2.99, 2.99),
('c50e8400-e29b-41d4-a716-446655440003', 'b50e8400-e29b-41d4-a716-446655440002', 'a50e8400-e29b-41d4-a716-446655440003', 1, 5.99, 5.99);
