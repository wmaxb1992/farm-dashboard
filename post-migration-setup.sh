#!/bin/bash

echo "🎉 Post-Migration Setup Automation"
echo "=================================="

# Test if migration was successful
echo "📊 Testing migration status..."
response=$(curl -s http://localhost:3000/api/user-farm-status)

if echo "$response" | grep -q "owner_id does not exist"; then
    echo "❌ Migration not completed yet!"
    echo ""
    echo "Please run the SQL from CLI_MIGRATION_FINAL.md in Supabase Dashboard first."
    echo "Then run this script again."
    exit 1
fi

echo "✅ Migration detected!"

# Show current status
echo ""
echo "📋 Current user and farm status:"
echo "$response" | jq '.'

# Extract information for next steps
echo ""
echo "🔧 Next Steps:"
echo ""
echo "1. 📝 Create a user in Supabase Dashboard:"
echo "   → Go to Supabase Dashboard → Authentication → Users"
echo "   → Click 'Add User'"
echo "   → Email: farmer@test.com"
echo "   → Password: password123"
echo "   → Copy the User ID"
echo ""
echo "2. 🔗 Connect user to farm (replace USER_ID):"
echo "   curl -X POST http://localhost:3000/api/connect-user-farm \\"
echo "     -H 'Content-Type: application/json' \\"
echo "     -d '{\"user_id\":\"USER_ID_HERE\",\"farm_id\":\"850e8400-e29b-41d4-a716-446655440001\"}'"
echo ""
echo "3. 🧪 Test the setup:"
echo "   → Go to http://localhost:3000/auth/login"
echo "   → Login with farmer@test.com / password123"
echo "   → Check dashboard shows only owned farm's products"
echo ""
echo "🎯 API Test Commands:"
echo "curl http://localhost:3000/api/farms"
echo "curl http://localhost:3000/api/products"
echo "curl http://localhost:3000/api/test-connection"
echo ""
echo "🚜 Your multi-tenant farm dashboard is ready!"
