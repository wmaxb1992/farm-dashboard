-- Check if tables exist in the database
SELECT table_name 
FROM information_schema.tables 
WHERE table_schema = 'public' 
ORDER BY table_name;

-- If no tables, let's check the current database
SELECT current_database();

-- Check if we have the right permissions
SELECT current_user;
