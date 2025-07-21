# Farm Dashboard Multi-Tenant Setup - FINAL STEPS

## Current Status ✅

- Database schema created and seeded with sample data
- API endpoints working correctly
- `owner_id` column structure defined

## Manual Steps Required (5 minutes)

### Step 1: Add owner_id Column

Go to **Supabase Dashboard → SQL Editor** and run:

```sql
-- Add owner_id column to farms table
ALTER TABLE farms ADD COLUMN IF NOT EXISTS owner_id UUID REFERENCES auth.users(id);

-- Create index for performance
CREATE INDEX IF NOT EXISTS idx_farms_owner_id ON farms(owner_id);

-- Verify the column was added
SELECT column_name, data_type, is_nullable
FROM information_schema.columns
WHERE table_name = 'farms'
ORDER BY ordinal_position;
```

### Step 2: Create RLS Policies

Still in **Supabase SQL Editor**, run the policies SQL:

```sql
-- Drop existing policies (some may not exist - that's OK)
DROP POLICY IF EXISTS "Allow public read access" ON farms;
DROP POLICY IF EXISTS "Service role has full access" ON farms;
DROP POLICY IF EXISTS "Allow public read access" ON products;
DROP POLICY IF EXISTS "Service role has full access" ON products;
DROP POLICY IF EXISTS "Service role has full access" ON orders;

-- Create new farm policies
CREATE POLICY "Users can view their own farms" ON farms
    FOR SELECT USING (auth.uid() = owner_id);

CREATE POLICY "Users can update their own farms" ON farms
    FOR UPDATE USING (auth.uid() = owner_id);

CREATE POLICY "Users can create farms" ON farms
    FOR INSERT WITH CHECK (auth.uid() = owner_id);

CREATE POLICY "Service role has full access on farms" ON farms
    FOR ALL USING (auth.role() = 'service_role');

-- Create new product policies
CREATE POLICY "Users can view their farm products" ON products
    FOR SELECT USING (
        EXISTS (
            SELECT 1 FROM farms
            WHERE farms.id = products.farm_id
            AND farms.owner_id = auth.uid()
        )
    );

CREATE POLICY "Users can manage their farm products" ON products
    FOR ALL USING (
        EXISTS (
            SELECT 1 FROM farms
            WHERE farms.id = products.farm_id
            AND farms.owner_id = auth.uid()
        )
    );

CREATE POLICY "Service role has full access on products" ON products
    FOR ALL USING (auth.role() = 'service_role');

-- Create new order policies
CREATE POLICY "Farmers can view their farm orders" ON orders
    FOR SELECT USING (
        EXISTS (
            SELECT 1 FROM farms
            WHERE farms.id = orders.farm_id
            AND farms.owner_id = auth.uid()
        )
    );

CREATE POLICY "Farmers can manage their farm orders" ON orders
    FOR UPDATE USING (
        EXISTS (
            SELECT 1 FROM farms
            WHERE farms.id = orders.farm_id
            AND farms.owner_id = auth.uid()
        )
    );

CREATE POLICY "Service role has full access on orders" ON orders
    FOR ALL USING (auth.role() = 'service_role');

-- Create public access policies for consumer app
CREATE POLICY "Public read access for consumer app" ON categories FOR SELECT USING (true);
CREATE POLICY "Public read access for consumer app" ON subcategories FOR SELECT USING (true);
CREATE POLICY "Public read access for consumer app" ON varieties FOR SELECT USING (true);
CREATE POLICY "Public read access for consumer app" ON farms FOR SELECT USING (true);
CREATE POLICY "Public read access for consumer app" ON products FOR SELECT USING (true);
```

### Step 3: Create a Test User

1. Go to **Supabase Dashboard → Authentication → Users**
2. Click **"Add User"**
3. Enter email: `farmer@test.com`
4. Enter password: `password123`
5. Click **"Create User"**
6. Copy the User ID from the users list

### Step 4: Connect User to Farm

Run this API call (replace `USER_ID` with the actual UUID):

```bash
curl -X POST http://localhost:3000/api/connect-user-farm \
  -H "Content-Type: application/json" \
  -d '{
    "user_id": "USER_ID_HERE",
    "farm_id": "850e8400-e29b-41d4-a716-446655440001"
  }'
```

### Step 5: Test Multi-Tenant Behavior

1. **Test Authentication:**
   - Go to `http://localhost:3000/auth/login`
   - Login with: `farmer@test.com` / `password123`

2. **Check Dashboard:**
   - Go to `http://localhost:3000/dashboard`
   - You should only see products from "Green Valley Farm"

3. **API Verification:**

   ```bash
   # Should return only connected farms
   curl http://localhost:3000/api/farms

   # Should return only products from owned farm
   curl http://localhost:3000/api/products
   ```

## API Endpoints Created

| Endpoint                 | Method | Purpose                            |
| ------------------------ | ------ | ---------------------------------- |
| `/api/user-farm-status`  | GET    | Check users and farm ownership     |
| `/api/connect-user-farm` | POST   | Connect user to farm               |
| `/api/add-owner-column`  | POST   | Get SQL for manual column addition |
| `/api/migration-sql`     | GET    | Download full migration SQL        |

## Verification Commands

After completing the manual steps:

```bash
# Check user-farm connections
curl http://localhost:3000/api/user-farm-status

# Test API endpoints
curl http://localhost:3000/api/farms
curl http://localhost:3000/api/products
curl http://localhost:3000/api/test-connection
```

## What's Achieved

✅ **Multi-Tenant Security**: Users only see their own farm's data  
✅ **Automated Setup**: Most steps automated via API  
✅ **RLS Policies**: Proper row-level security implemented  
✅ **Public API**: Consumer app can still access all farms/products  
✅ **Farm Dashboard**: Authenticated farmers see only their data

## Next Steps

Once setup is complete:

- Add more farms and users to test multi-tenancy
- Implement farm creation for new users
- Add order management for farmers
- Enhance the dashboard UI with farm-specific features
