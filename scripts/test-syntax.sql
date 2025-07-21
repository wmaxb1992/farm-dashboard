-- Test script to verify SQL syntax
-- This is a minimal test

BEGIN;

-- Create main categories
INSERT INTO categories (name, image) 
SELECT 'Test Category', '/images/categories/test.jpg'
WHERE NOT EXISTS (SELECT 1 FROM categories WHERE name = 'Test Category');

-- Clean up test
DELETE FROM categories WHERE name = 'Test Category';

ROLLBACK;

-- Test completed successfully
