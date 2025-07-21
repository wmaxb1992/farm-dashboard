--- Search Indexing Setup for Master Catalog
-- This script creates indexes to enable fast searching of varieties

BEGIN;

-- 1. Full-text search index on variety names and descriptions
-- This enables searching like: "WHERE to_tsvector('english', name || ' ' || description) @@ plainto_tsquery('english', 'tomato cherry')"
CREATE INDEX IF NOT EXISTS idx_varieties_fulltext 
ON varieties USING gin(to_tsvector('english', name || ' ' || coalesce(description, '')));

-- 2. Regular indexes for common search patterns
-- Index on variety name for exact/prefix matches
CREATE INDEX IF NOT EXISTS idx_varieties_name 
ON varieties (name);

-- Case-insensitive search on variety name
CREATE INDEX IF NOT EXISTS idx_varieties_name_lower 
ON varieties (lower(name));

-- Index on subcategory for filtering by plant type
CREATE INDEX IF NOT EXISTS idx_varieties_subcategory 
ON varieties (subcategory_id);

-- Combined index for category + subcategory filtering
CREATE INDEX IF NOT EXISTS idx_varieties_category_subcategory 
ON varieties (subcategory_id) 
INCLUDE (name, description, card_image);

-- 3. JSONB indexes for searching Baker Creek metadata
-- Search within nutritional_info (days_to_maturity, spacing, etc.)
CREATE INDEX IF NOT EXISTS idx_varieties_nutritional_gin 
ON varieties USING gin(nutritional_info);

-- Search within taste_profile (height, water requirements, etc.)
CREATE INDEX IF NOT EXISTS idx_varieties_taste_gin 
ON varieties USING gin(taste_profile);

-- 4. Composite indexes for common query patterns
-- Index for searching within a specific category
CREATE INDEX IF NOT EXISTS idx_varieties_with_category 
ON varieties (subcategory_id, name)
INCLUDE (description, card_image, nutritional_info);

-- 5. Create search helper view for easier querying
CREATE OR REPLACE VIEW varieties_search AS
SELECT 
    v.id,
    v.name,
    v.description,
    v.card_image,
    v.nutritional_info,
    v.taste_profile,
    s.name as subcategory_name,
    c.name as category_name,
    -- Create searchable text combining all relevant fields
    v.name || ' ' || 
    coalesce(v.description, '') || ' ' || 
    s.name || ' ' || 
    c.name || ' ' ||
    coalesce(v.nutritional_info->>'days_to_maturity', '') || ' ' ||
    coalesce(v.nutritional_info->>'spacing', '') || ' ' ||
    coalesce(v.nutritional_info->>'sun_requirements', '') || ' ' ||
    coalesce(v.taste_profile->>'height', '') || ' ' ||
    coalesce(v.taste_profile->>'water_requirements', '') as search_text,
    -- Create search vector for full-text search
    to_tsvector('english', 
        v.name || ' ' || 
        coalesce(v.description, '') || ' ' || 
        s.name || ' ' || 
        c.name || ' ' ||
        coalesce(v.nutritional_info->>'days_to_maturity', '') || ' ' ||
        coalesce(v.nutritional_info->>'spacing', '') || ' ' ||
        coalesce(v.nutritional_info->>'sun_requirements', '')
    ) as search_vector
FROM varieties v
JOIN subcategories s ON v.subcategory_id = s.id
JOIN categories c ON s.category_id = c.id;

-- 6. Create search functions for easy use
CREATE OR REPLACE FUNCTION search_varieties(search_term TEXT, category_filter TEXT DEFAULT NULL)
RETURNS TABLE (
    id UUID,
    name TEXT,
    description TEXT,
    card_image TEXT,
    subcategory_name TEXT,
    category_name TEXT,
    nutritional_info JSONB,
    taste_profile JSONB,
    rank REAL
) AS $$
BEGIN
    RETURN QUERY
    SELECT 
        vs.id,
        vs.name::TEXT,
        vs.description::TEXT,
        vs.card_image::TEXT,
        vs.subcategory_name::TEXT,
        vs.category_name::TEXT,
        vs.nutritional_info,
        vs.taste_profile,
        ts_rank(vs.search_vector, plainto_tsquery('english', search_term)) as rank
    FROM varieties_search vs
    WHERE vs.search_vector @@ plainto_tsquery('english', search_term)
    AND (category_filter IS NULL OR vs.category_name = category_filter)
    ORDER BY rank DESC, vs.name;
END;
$$ LANGUAGE plpgsql;

-- 7. Create autocomplete function for search suggestions
CREATE OR REPLACE FUNCTION get_variety_suggestions(search_term TEXT, limit_count INTEGER DEFAULT 10)
RETURNS TABLE (
    name TEXT,
    category_name TEXT,
    subcategory_name TEXT
) AS $$
BEGIN
    RETURN QUERY
    SELECT DISTINCT
        vs.name::TEXT,
        vs.category_name::TEXT,
        vs.subcategory_name::TEXT
    FROM varieties_search vs
    WHERE vs.name ILIKE search_term || '%'
    ORDER BY vs.name::TEXT
    LIMIT limit_count;
END;
$$ LANGUAGE plpgsql;

COMMIT;

-- Test the search functionality
SELECT 'Search Setup Complete' as status;

-- Example searches to test:
-- 1. Full-text search: SELECT * FROM search_varieties('tomato cherry');
-- 2. Category filter: SELECT * FROM search_varieties('pepper', 'Vegetables');
-- 3. Autocomplete: SELECT * FROM get_variety_suggestions('tom');
-- 4. Direct search: SELECT * FROM varieties_search WHERE search_vector @@ plainto_tsquery('english', 'basil italian');

-- Show some sample searches
SELECT 'Sample Search Results' as info;

-- Search for tomatoes
SELECT name, subcategory_name, category_name
FROM search_varieties('tomato') 
LIMIT 5;

-- Search for herbs
SELECT name, subcategory_name, category_name
FROM search_varieties('herb', 'Herbs') 
LIMIT 5;

-- Autocomplete for 'bas'
SELECT * FROM get_variety_suggestions('bas', 5);
