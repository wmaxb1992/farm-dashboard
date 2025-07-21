-- Create the database schema based on your original model

-- Categories table
CREATE TABLE categories (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    image TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Subcategories table
CREATE TABLE subcategories (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    category_id UUID REFERENCES categories(id) ON DELETE CASCADE,
    name VARCHAR(255) NOT NULL,
    image TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Varieties table
CREATE TABLE varieties (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    subcategory_id UUID REFERENCES subcategories(id) ON DELETE CASCADE,
    name VARCHAR(255) NOT NULL,
    emoji VARCHAR(10),
    description TEXT,
    card_image TEXT,
    nutritional_info JSONB,
    taste_profile JSONB,
    culinary_uses TEXT[],
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Farms table
CREATE TABLE farms (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    logo TEXT,
    cover_image TEXT,
    owner_name VARCHAR(255),
    email VARCHAR(255) UNIQUE NOT NULL,
    phone VARCHAR(50),
    website VARCHAR(255),
    address TEXT,
    location_coordinates POINT,
    rating DECIMAL(3,2) DEFAULT 0,
    certifications TEXT[],
    specialties TEXT[],
    delivery_zones TEXT[],
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Users table (customers)
CREATE TABLE users (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    phone VARCHAR(50),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- User addresses
CREATE TABLE user_addresses (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    user_id UUID REFERENCES users(id) ON DELETE CASCADE,
    address_line_1 VARCHAR(255) NOT NULL,
    address_line_2 VARCHAR(255),
    city VARCHAR(100) NOT NULL,
    state VARCHAR(100) NOT NULL,
    zip_code VARCHAR(20) NOT NULL,
    is_default BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Products table
CREATE TABLE products (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    farm_id UUID REFERENCES farms(id) ON DELETE CASCADE,
    variety_id UUID REFERENCES varieties(id),
    price DECIMAL(10,2) NOT NULL,
    stock INTEGER DEFAULT 0,
    freshness INTEGER CHECK (freshness >= 0 AND freshness <= 100),
    harvest_date DATE,
    pre_harvest BOOLEAN DEFAULT FALSE,
    organic BOOLEAN DEFAULT FALSE,
    in_season BOOLEAN DEFAULT TRUE,
    delivery_days TEXT[],
    images TEXT[],
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Orders table
CREATE TABLE orders (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    order_number VARCHAR(50) UNIQUE NOT NULL,
    user_id UUID REFERENCES users(id),
    farm_id UUID REFERENCES farms(id),
    status VARCHAR(50) DEFAULT 'pending' CHECK (status IN ('pending', 'confirmed', 'preparing', 'delivered', 'cancelled')),
    subtotal DECIMAL(10,2) NOT NULL,
    tax DECIMAL(10,2) DEFAULT 0,
    delivery_fee DECIMAL(10,2) DEFAULT 0,
    total DECIMAL(10,2) NOT NULL,
    delivery_address JSONB,
    delivery_date DATE,
    notes TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Order items table
CREATE TABLE order_items (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    order_id UUID REFERENCES orders(id) ON DELETE CASCADE,
    product_id UUID REFERENCES products(id),
    quantity INTEGER NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    total_price DECIMAL(10,2) NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Subscription bundles table
CREATE TABLE subscription_bundles (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(10,2) NOT NULL,
    weekly_price DECIMAL(10,2),
    monthly_price DECIMAL(10,2),
    discount_percentage DECIMAL(5,2) DEFAULT 0,
    farm_id UUID REFERENCES farms(id),
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Create indexes for better performance
CREATE INDEX idx_products_farm_id ON products(farm_id);
CREATE INDEX idx_products_variety_id ON products(variety_id);
CREATE INDEX idx_orders_farm_id ON orders(farm_id);
CREATE INDEX idx_orders_user_id ON orders(user_id);
CREATE INDEX idx_orders_status ON orders(status);
CREATE INDEX idx_order_items_order_id ON order_items(order_id);
CREATE INDEX idx_subcategories_category_id ON subcategories(category_id);
CREATE INDEX idx_varieties_subcategory_id ON varieties(subcategory_id);

-- Enable Row Level Security (RLS) on all tables
ALTER TABLE categories ENABLE ROW LEVEL SECURITY;
ALTER TABLE subcategories ENABLE ROW LEVEL SECURITY;
ALTER TABLE varieties ENABLE ROW LEVEL SECURITY;
ALTER TABLE farms ENABLE ROW LEVEL SECURITY;
ALTER TABLE users ENABLE ROW LEVEL SECURITY;
ALTER TABLE user_addresses ENABLE ROW LEVEL SECURITY;
ALTER TABLE products ENABLE ROW LEVEL SECURITY;
ALTER TABLE orders ENABLE ROW LEVEL SECURITY;
ALTER TABLE order_items ENABLE ROW LEVEL SECURITY;
ALTER TABLE subscription_bundles ENABLE ROW LEVEL SECURITY;

-- Create RLS policies to allow read access for everyone
CREATE POLICY "Allow public read access" ON categories FOR SELECT USING (true);
CREATE POLICY "Allow public read access" ON subcategories FOR SELECT USING (true);
CREATE POLICY "Allow public read access" ON varieties FOR SELECT USING (true);
CREATE POLICY "Allow public read access" ON farms FOR SELECT USING (true);
CREATE POLICY "Allow public read access" ON products FOR SELECT USING (true);
CREATE POLICY "Allow public read access" ON subscription_bundles FOR SELECT USING (true);

-- Create RLS policies for service role to have full access
CREATE POLICY "Service role has full access" ON categories FOR ALL USING (auth.role() = 'service_role');
CREATE POLICY "Service role has full access" ON subcategories FOR ALL USING (auth.role() = 'service_role');
CREATE POLICY "Service role has full access" ON varieties FOR ALL USING (auth.role() = 'service_role');
CREATE POLICY "Service role has full access" ON farms FOR ALL USING (auth.role() = 'service_role');
CREATE POLICY "Service role has full access" ON users FOR ALL USING (auth.role() = 'service_role');
CREATE POLICY "Service role has full access" ON user_addresses FOR ALL USING (auth.role() = 'service_role');
CREATE POLICY "Service role has full access" ON products FOR ALL USING (auth.role() = 'service_role');
CREATE POLICY "Service role has full access" ON orders FOR ALL USING (auth.role() = 'service_role');
CREATE POLICY "Service role has full access" ON order_items FOR ALL USING (auth.role() = 'service_role');
CREATE POLICY "Service role has full access" ON subscription_bundles FOR ALL USING (auth.role() = 'service_role');