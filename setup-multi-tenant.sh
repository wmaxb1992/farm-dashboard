#!/bin/bash

# Farm Dashboard Multi-Tenant Setup Script
# Run this after executing the SQL migration in Supabase Dashboard

echo "🚜 Farm Dashboard Multi-Tenant Setup"
echo "======================================"

# Check if the migration was applied
echo "1. Checking if migration was applied..."
response=$(curl -s http://localhost:3000/api/user-farm-status)

if echo "$response" | grep -q "owner_id does not exist"; then
    echo "❌ Migration not applied yet!"
    echo ""
    echo "Please run this SQL in Supabase Dashboard SQL Editor first:"
    echo ""
    echo "ALTER TABLE farms ADD COLUMN IF NOT EXISTS owner_id UUID REFERENCES auth.users(id);"
    echo "CREATE INDEX IF NOT EXISTS idx_farms_owner_id ON farms(owner_id);"
    echo ""
    echo "Then run the full migration SQL from /api/migration-sql"
    exit 1
fi

echo "✅ Database structure looks good!"

# Get user and farm status
echo ""
echo "2. Getting current users and farms..."
curl -s http://localhost:3000/api/user-farm-status | jq '.'

echo ""
echo "3. Setup Instructions:"
echo ""
echo "   a) Go to Supabase Dashboard → Authentication → Users"
echo "   b) Create a new user with email: farmer@test.com"
echo "   c) Copy the User ID"
echo "   d) Run: curl -X POST http://localhost:3000/api/connect-user-farm \\"
echo "            -H 'Content-Type: application/json' \\"
echo "            -d '{\"user_id\":\"USER_ID\",\"farm_id\":\"850e8400-e29b-41d4-a716-446655440001\"}'"
echo ""
echo "4. Then test the dashboard at http://localhost:3000/auth/login"
echo ""
echo "🎉 Almost done! Complete the manual steps above."
