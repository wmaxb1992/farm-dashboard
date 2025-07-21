-- Add batch-level pricing and inventory management system

-- Harvest batches table for batch-level tracking
CREATE TABLE harvest_batches (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    farm_id UUID REFERENCES farms(id) ON DELETE CASCADE,
    variety_id UUID REFERENCES varieties(id) ON DELETE RESTRICT,
    batch_number VARCHAR(50) NOT NULL,
    harvest_date DATE NOT NULL,
    quantity_harvested DECIMAL(10,2) NOT NULL,
    unit VARCHAR(20) NOT NULL DEFAULT 'lbs',
    quality_grade VARCHAR(20) DEFAULT 'A' CHECK (quality_grade IN ('A', 'B', 'C')),
    organic BOOLEAN DEFAULT FALSE,
    location_in_farm VARCHAR(255),
    harvest_notes TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    UNIQUE(farm_id, batch_number)
);

-- Batch pricing table for dynamic pricing per batch
CREATE TABLE batch_pricing (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    batch_id UUID REFERENCES harvest_batches(id) ON DELETE CASCADE,
    base_price DECIMAL(10,2) NOT NULL,
    current_price DECIMAL(10,2) NOT NULL,
    discount_percentage DECIMAL(5,2) DEFAULT 0,
    discount_reason VARCHAR(100),
    price_per_unit DECIMAL(10,2) NOT NULL,
    minimum_order_quantity DECIMAL(10,2) DEFAULT 1,
    bulk_discount_threshold DECIMAL(10,2),
    bulk_discount_percentage DECIMAL(5,2),
    auto_discount_enabled BOOLEAN DEFAULT TRUE,
    age_discount_start_days INTEGER DEFAULT 3,
    age_discount_percentage_per_day DECIMAL(5,2) DEFAULT 2.0,
    grade_discount_b DECIMAL(5,2) DEFAULT 15.0,
    grade_discount_c DECIMAL(5,2) DEFAULT 30.0,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Batch inventory tracking for real-time status
CREATE TABLE batch_inventory (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    batch_id UUID REFERENCES harvest_batches(id) ON DELETE CASCADE,
    quantity_available DECIMAL(10,2) NOT NULL DEFAULT 0,
    quantity_reserved DECIMAL(10,2) NOT NULL DEFAULT 0,
    quantity_sold DECIMAL(10,2) NOT NULL DEFAULT 0,
    quantity_expired DECIMAL(10,2) NOT NULL DEFAULT 0,
    quantity_damaged DECIMAL(10,2) NOT NULL DEFAULT 0,
    last_updated TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    UNIQUE(batch_id)
);

-- Market pricing data for price recommendations
CREATE TABLE market_pricing (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    variety_id UUID REFERENCES varieties(id) ON DELETE CASCADE,
    region VARCHAR(100) NOT NULL,
    average_price DECIMAL(10,2) NOT NULL,
    price_range_low DECIMAL(10,2),
    price_range_high DECIMAL(10,2),
    unit VARCHAR(20) NOT NULL DEFAULT 'lbs',
    quality_grade VARCHAR(20) DEFAULT 'A',
    sample_size INTEGER DEFAULT 1,
    data_source VARCHAR(100),
    last_updated TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Update products table to reference batches instead of direct inventory
ALTER TABLE products ADD COLUMN batch_id UUID REFERENCES harvest_batches(id);
ALTER TABLE products ADD COLUMN is_batch_product BOOLEAN DEFAULT TRUE;

-- Create a view for current batch prices with auto-discounting
CREATE OR REPLACE VIEW batch_current_pricing AS
SELECT 
    bp.*,
    hb.harvest_date,
    hb.quality_grade,
    hb.farm_id,
    hb.variety_id,
    -- Calculate age in days
    EXTRACT(DAY FROM NOW() - hb.harvest_date) as age_days,
    -- Calculate automatic age discount
    CASE 
        WHEN bp.auto_discount_enabled AND EXTRACT(DAY FROM NOW() - hb.harvest_date) > bp.age_discount_start_days
        THEN LEAST(
            bp.discount_percentage + 
            (EXTRACT(DAY FROM NOW() - hb.harvest_date) - bp.age_discount_start_days) * bp.age_discount_percentage_per_day,
            50.0  -- Cap at 50% discount
        )
        ELSE bp.discount_percentage
    END as calculated_discount_percentage,
    -- Calculate quality grade discount
    CASE 
        WHEN hb.quality_grade = 'B' THEN bp.grade_discount_b
        WHEN hb.quality_grade = 'C' THEN bp.grade_discount_c
        ELSE 0
    END as grade_discount_percentage,
    -- Calculate final price with all discounts
    bp.base_price * (1 - 
        (CASE 
            WHEN bp.auto_discount_enabled AND EXTRACT(DAY FROM NOW() - hb.harvest_date) > bp.age_discount_start_days
            THEN LEAST(
                bp.discount_percentage + 
                (EXTRACT(DAY FROM NOW() - hb.harvest_date) - bp.age_discount_start_days) * bp.age_discount_percentage_per_day +
                CASE 
                    WHEN hb.quality_grade = 'B' THEN bp.grade_discount_b
                    WHEN hb.quality_grade = 'C' THEN bp.grade_discount_c
                    ELSE 0
                END,
                60.0  -- Cap total discount at 60%
            )
            ELSE bp.discount_percentage + 
                CASE 
                    WHEN hb.quality_grade = 'B' THEN bp.grade_discount_b
                    WHEN hb.quality_grade = 'C' THEN bp.grade_discount_c
                    ELSE 0
                END
        END) / 100.0
    ) as final_price
FROM batch_pricing bp
JOIN harvest_batches hb ON bp.batch_id = hb.id;

-- Create a view for inventory status by batch
CREATE OR REPLACE VIEW batch_inventory_status AS
SELECT 
    hb.*,
    bi.quantity_available,
    bi.quantity_reserved,
    bi.quantity_sold,
    bi.quantity_expired,
    bi.quantity_damaged,
    (bi.quantity_available + bi.quantity_reserved + bi.quantity_sold + bi.quantity_expired + bi.quantity_damaged) as total_accounted,
    (hb.quantity_harvested - (bi.quantity_available + bi.quantity_reserved + bi.quantity_sold + bi.quantity_expired + bi.quantity_damaged)) as quantity_unaccounted,
    CASE 
        WHEN bi.quantity_available > 0 THEN 'available'
        WHEN bi.quantity_reserved > 0 THEN 'reserved_only'
        WHEN bi.quantity_available = 0 AND bi.quantity_reserved = 0 THEN 'sold_out'
        ELSE 'unknown'
    END as status,
    -- Freshness score based on age and quality
    GREATEST(0, LEAST(100, 
        100 - (EXTRACT(DAY FROM NOW() - hb.harvest_date) * 5) -
        CASE 
            WHEN hb.quality_grade = 'B' THEN 15
            WHEN hb.quality_grade = 'C' THEN 30
            ELSE 0
        END
    )) as freshness_score
FROM harvest_batches hb
LEFT JOIN batch_inventory bi ON hb.id = bi.batch_id;

-- Function to get price recommendations for a variety in a region
CREATE OR REPLACE FUNCTION get_price_recommendations(
    p_variety_id UUID,
    p_region VARCHAR DEFAULT 'default',
    p_quality_grade VARCHAR DEFAULT 'A'
)
RETURNS TABLE (
    recommended_price DECIMAL(10,2),
    market_average DECIMAL(10,2),
    price_range_low DECIMAL(10,2),
    price_range_high DECIMAL(10,2),
    confidence_level VARCHAR(20)
) AS $$
BEGIN
    RETURN QUERY
    SELECT 
        mp.average_price as recommended_price,
        mp.average_price as market_average,
        mp.price_range_low,
        mp.price_range_high,
        CASE 
            WHEN mp.sample_size >= 10 THEN 'high'
            WHEN mp.sample_size >= 5 THEN 'medium'
            ELSE 'low'
        END as confidence_level
    FROM market_pricing mp
    WHERE mp.variety_id = p_variety_id 
        AND mp.region = p_region
        AND mp.quality_grade = p_quality_grade
        AND mp.last_updated > NOW() - INTERVAL '30 days'
    ORDER BY mp.last_updated DESC
    LIMIT 1;
END;
$$ LANGUAGE plpgsql;

-- Function to automatically update batch pricing based on age and quality
CREATE OR REPLACE FUNCTION update_batch_pricing()
RETURNS TRIGGER AS $$
BEGIN
    -- Update current_price in batch_pricing when auto_discount_enabled
    UPDATE batch_pricing bp
    SET 
        current_price = bp.base_price * (1 - 
            (CASE 
                WHEN bp.auto_discount_enabled AND EXTRACT(DAY FROM NOW() - hb.harvest_date) > bp.age_discount_start_days
                THEN LEAST(
                    bp.discount_percentage + 
                    (EXTRACT(DAY FROM NOW() - hb.harvest_date) - bp.age_discount_start_days) * bp.age_discount_percentage_per_day +
                    CASE 
                        WHEN hb.quality_grade = 'B' THEN bp.grade_discount_b
                        WHEN hb.quality_grade = 'C' THEN bp.grade_discount_c
                        ELSE 0
                    END,
                    60.0
                )
                ELSE bp.discount_percentage + 
                    CASE 
                        WHEN hb.quality_grade = 'B' THEN bp.grade_discount_b
                        WHEN hb.quality_grade = 'C' THEN bp.grade_discount_c
                        ELSE 0
                    END
            END) / 100.0
        ),
        updated_at = NOW()
    FROM harvest_batches hb
    WHERE bp.batch_id = hb.id;
    
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

-- Create trigger to update pricing daily
CREATE OR REPLACE FUNCTION trigger_update_batch_pricing()
RETURNS TRIGGER AS $$
BEGIN
    PERFORM update_batch_pricing();
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

-- Indexes for performance
CREATE INDEX idx_harvest_batches_farm_id ON harvest_batches(farm_id);
CREATE INDEX idx_harvest_batches_variety_id ON harvest_batches(variety_id);
CREATE INDEX idx_harvest_batches_harvest_date ON harvest_batches(harvest_date);
CREATE INDEX idx_batch_pricing_batch_id ON batch_pricing(batch_id);
CREATE INDEX idx_batch_inventory_batch_id ON batch_inventory(batch_id);
CREATE INDEX idx_market_pricing_variety_region ON market_pricing(variety_id, region);
CREATE INDEX idx_market_pricing_last_updated ON market_pricing(last_updated);

-- Insert some sample market pricing data
INSERT INTO market_pricing (variety_id, region, average_price, price_range_low, price_range_high, unit, quality_grade, sample_size, data_source) VALUES
-- These will need to be updated with actual variety IDs from your master produce database
('00000000-0000-0000-0000-000000000001', 'California', 4.50, 3.50, 5.50, 'lbs', 'A', 15, 'USDA Market News'),
('00000000-0000-0000-0000-000000000001', 'California', 3.50, 2.75, 4.25, 'lbs', 'B', 12, 'USDA Market News'),
('00000000-0000-0000-0000-000000000002', 'California', 6.00, 5.00, 7.00, 'lbs', 'A', 20, 'USDA Market News');
