# Farm Dashboard API Documentation

Welcome to the Farm Dashboard API! This document provides comprehensive information about all available endpoints.

## Setup Status

✅ **Current Status**: Database fully configured and operational

- ✅ Tables created successfully in Supabase
- ✅ Sample data seeded across all tables
- ✅ API endpoints fully functional and returning data
- ✅ Row Level Security (RLS) policies configured
- ✅ Service role permissions working correctly

## Base URL

```
http://localhost:3001/api  # (Note: Currently running on port 3001)
```

## Authentication

Currently, the API uses Supabase's built-in authentication system. Make sure your environment variables are properly configured.

---

## 🧪 System Endpoints

### Test Database Connection

Check if the Supabase database is connected and all tables exist.

**GET** `/api/test-connection`

#### Response

```json
{
  "success": true,
  "message": "Successfully connected to Supabase!",
  "timestamp": "2025-01-10T19:15:54.034Z",
  "supabaseUrl": "https://your-project.supabase.co",
  "connection": {
    "connected": true,
    "tablesFound": 8,
    "totalTables": 8
  },
  "tables": {
    "expected": ["categories", "subcategories", "varieties", "farms", "users", "products", "orders", "order_items"],
    "existing": ["categories", "subcategories", "varieties", "farms", "users", "products", "orders", "order_items"],
    "missing": [],
    "tableTests": [...]
  },
  "recommendations": ["All expected tables are present in your database!"]
}
```

---

## 📂 Categories

### Get All Categories

Retrieve all categories with their subcategories and varieties.

**GET** `/api/categories`

#### Response

```json
{
  "categories": [
    {
      "id": "uuid",
      "name": "Vegetables",
      "image": "image_url",
      "created_at": "2025-01-01T00:00:00Z",
      "updated_at": "2025-01-01T00:00:00Z",
      "subcategories": [
        {
          "id": "uuid",
          "category_id": "uuid",
          "name": "Leafy Greens",
          "image": "image_url",
          "varieties": [
            {
              "id": "uuid",
              "subcategory_id": "uuid",
              "name": "Spinach",
              "emoji": "🍃",
              "description": "Fresh leafy green...",
              "nutritional_info": {},
              "taste_profile": {},
              "culinary_uses": ["salads", "cooking"]
            }
          ]
        }
      ]
    }
  ]
}
```

---

## 🚜 Farms

### Get All Farms

Retrieve all farms in the system.

**GET** `/api/farms`

#### Response

```json
{
  "farms": [
    {
      "id": "uuid",
      "name": "Green Valley Farm",
      "description": "Organic farm specializing in...",
      "logo": "logo_url",
      "cover_image": "cover_url",
      "owner_name": "John Doe",
      "email": "john@greenvalley.com",
      "phone": "+1234567890",
      "website": "https://greenvalley.com",
      "address": "123 Farm Road, Valley City",
      "location_coordinates": "POINT(-123.456 45.678)",
      "rating": 4.5,
      "certifications": ["Organic", "Non-GMO"],
      "specialties": ["Vegetables", "Herbs"],
      "delivery_zones": ["Downtown", "Suburbs"],
      "created_at": "2025-01-01T00:00:00Z",
      "updated_at": "2025-01-01T00:00:00Z"
    }
  ]
}
```

### Create New Farm

Add a new farm to the system.

**POST** `/api/farms`

#### Request Body

```json
{
  "name": "New Farm Name",
  "description": "Farm description",
  "owner_name": "Owner Name",
  "email": "owner@farm.com",
  "phone": "+1234567890",
  "website": "https://farm.com",
  "address": "Farm address",
  "certifications": ["Organic"],
  "specialties": ["Vegetables"],
  "delivery_zones": ["Area1", "Area2"]
}
```

#### Response

```json
{
  "farm": {
    "id": "new_uuid",
    "name": "New Farm Name"
    // ... other farm fields
  }
}
```

### Get Specific Farm

Retrieve details of a specific farm.

**GET** `/api/farms/[id]`

#### Path Parameters

- `id` (string, required): Farm UUID

#### Response

```json
{
  "farm": {
    "id": "uuid",
    "name": "Green Valley Farm"
    // ... all farm fields
  }
}
```

### Update Farm

Update an existing farm's information.

**PUT** `/api/farms/[id]`

#### Path Parameters

- `id` (string, required): Farm UUID

#### Request Body

```json
{
  "name": "Updated Farm Name",
  "description": "Updated description"
  // ... other updatable fields
}
```

---

## 🥬 Products

### Get Products

Retrieve products with optional filtering.

**GET** `/api/products`

#### Query Parameters

- `farm_id` (string, optional): Filter by farm ID
- `category` (string, optional): Filter by category name ("all" for no filter)
- `search` (string, optional): Search products by name

#### Response

```json
{
  "products": [
    {
      "id": "uuid",
      "name": "Fresh Spinach",
      "farm_id": "farm_uuid",
      "variety_id": "variety_uuid",
      "price": 3.99,
      "stock": 50,
      "freshness": 95,
      "harvest_date": "2025-01-10",
      "pre_harvest": false,
      "organic": true,
      "in_season": true,
      "delivery_days": ["Monday", "Wednesday", "Friday"],
      "images": ["image1_url", "image2_url"],
      "created_at": "2025-01-01T00:00:00Z",
      "updated_at": "2025-01-01T00:00:00Z",
      "farm": {
        "id": "farm_uuid",
        "name": "Green Valley Farm"
        // ... farm details
      },
      "variety": {
        "id": "variety_uuid",
        "name": "Baby Spinach",
        "subcategory": {
          "id": "subcategory_uuid",
          "name": "Leafy Greens",
          "category": {
            "id": "category_uuid",
            "name": "Vegetables"
          }
        }
      }
    }
  ]
}
```

### Create Product

Add a new product to the system.

**POST** `/api/products`

#### Request Body

```json
{
  "name": "Product Name",
  "farm_id": "farm_uuid",
  "variety_id": "variety_uuid",
  "price": "3.99",
  "stock": "50",
  "freshness": 95,
  "harvest_date": "2025-01-10",
  "pre_harvest": false,
  "organic": true,
  "in_season": true,
  "delivery_days": ["Monday", "Wednesday"],
  "images": ["image_url"]
}
```

#### Response

```json
{
  "product": {
    "id": "new_uuid",
    "name": "Product Name"
    // ... product details with farm and variety info
  }
}
```

---

## 📦 Orders

### Get Orders

Retrieve orders with optional filtering.

**GET** `/api/orders`

#### Query Parameters

- `farm_id` (string, optional): Filter by farm ID
- `status` (string, optional): Filter by order status ("all" for no filter)
  - Valid statuses: `pending`, `confirmed`, `preparing`, `delivered`, `cancelled`

#### Response

```json
{
  "orders": [
    {
      "id": "uuid",
      "order_number": "ORD-123456",
      "user_id": "user_uuid",
      "farm_id": "farm_uuid",
      "status": "pending",
      "subtotal": 25.5,
      "tax": 2.55,
      "delivery_fee": 5.0,
      "total": 33.05,
      "delivery_address": {
        "street": "123 Main St",
        "city": "City",
        "state": "State",
        "zip": "12345"
      },
      "delivery_date": "2025-01-15",
      "notes": "Leave at front door",
      "created_at": "2025-01-01T00:00:00Z",
      "updated_at": "2025-01-01T00:00:00Z",
      "user": {
        "id": "user_uuid",
        "name": "Customer Name",
        "email": "customer@email.com",
        "phone": "+1234567890"
      },
      "order_items": [
        {
          "id": "item_uuid",
          "order_id": "order_uuid",
          "product_id": "product_uuid",
          "quantity": 2,
          "unit_price": 3.99,
          "total_price": 7.98,
          "product": {
            "id": "product_uuid",
            "name": "Fresh Spinach"
            // ... product details
          }
        }
      ]
    }
  ]
}
```

### Create Order

Create a new order with items.

**POST** `/api/orders`

#### Request Body

```json
{
  "user_id": "user_uuid",
  "farm_id": "farm_uuid",
  "subtotal": "25.50",
  "tax": "2.55",
  "delivery_fee": "5.00",
  "total": "33.05",
  "delivery_address": {
    "street": "123 Main St",
    "city": "City",
    "state": "State",
    "zip": "12345"
  },
  "delivery_date": "2025-01-15",
  "notes": "Special instructions",
  "items": [
    {
      "product_id": "product_uuid",
      "quantity": 2,
      "unit_price": "3.99",
      "total_price": "7.98"
    }
  ]
}
```

#### Response

```json
{
  "order": {
    "id": "new_order_uuid",
    "order_number": "ORD-123456",
    "status": "pending"
    // ... other order fields
  }
}
```

### Update Order Status

Update the status of an existing order.

**PUT** `/api/orders/[id]`

#### Path Parameters

- `id` (string, required): Order UUID

#### Request Body

```json
{
  "status": "confirmed"
}
```

#### Valid Status Values

- `pending`
- `confirmed`
- `preparing`
- `delivered`
- `cancelled`

#### Response

```json
{
  "order": {
    "id": "order_uuid",
    "status": "confirmed",
    "updated_at": "2025-01-10T19:30:00Z"
    // ... full order details with user and items
  }
}
```

---

## 📊 Data Models

### Farm

```typescript
interface Farm {
  id: string
  name: string
  description?: string
  logo?: string
  cover_image?: string
  owner_name?: string
  email: string
  phone?: string
  website?: string
  address?: string
  location_coordinates?: any
  rating: number
  certifications: string[]
  specialties: string[]
  delivery_zones: string[]
  created_at: string
  updated_at: string
}
```

### Product

```typescript
interface Product {
  id: string
  name: string
  farm_id: string
  variety_id?: string
  price: number
  stock: number
  freshness?: number
  harvest_date?: string
  pre_harvest: boolean
  organic: boolean
  in_season: boolean
  delivery_days: string[]
  images: string[]
  created_at: string
  updated_at: string
}
```

### Order

```typescript
interface Order {
  id: string
  order_number: string
  user_id?: string
  farm_id: string
  status: 'pending' | 'confirmed' | 'preparing' | 'delivered' | 'cancelled'
  subtotal: number
  tax: number
  delivery_fee: number
  total: number
  delivery_address?: any
  delivery_date?: string
  notes?: string
  created_at: string
  updated_at: string
}
```

---

## 🚨 Error Handling

All endpoints return consistent error responses:

```json
{
  "error": "Error message describing what went wrong"
}
```

### HTTP Status Codes

- `200` - Success
- `201` - Created
- `404` - Not Found
- `500` - Internal Server Error

---

## 🔧 Environment Setup

Make sure you have the following environment variables configured in your `.env.local`:

```bash
NEXT_PUBLIC_SUPABASE_URL=your_supabase_project_url
NEXT_PUBLIC_SUPABASE_ANON_KEY=your_supabase_anon_key
SUPABASE_SERVICE_ROLE_KEY=your_supabase_service_role_key
```

### Direct Database Connection (Advanced)

For direct database access (e.g., for database management tools, migrations, or advanced queries), you can connect using these PostgreSQL connection details:

```
Host: db.bhjprqqpyutuaalfnyng.supabase.co
Port: 5432
Database: postgres
User: postgres
Password: [Your database password from Supabase dashboard]
```

**Note:** The password is not included here for security reasons. You can find it in your Supabase project settings under "Database" → "Connection Pooling" or "Connection String".

### Connection String Format

```
postgresql://postgres:[PASSWORD]@db.bhjprqqpyutuaalfnyng.supabase.co:5432/postgres
```

**Security Warning:** Only use direct database connections in secure environments. For application code, always use the Supabase client with the provided API keys.

---

## 🔧 Supabase CLI

The Supabase CLI provides powerful development tools for your farm dashboard. Here are the most useful commands:

### Installation

```bash
brew install supabase/tap/supabase
```

### Quick Setup

```bash
# Login and link your project
supabase login
supabase link --project-ref bhjprqqpyutuaalfnyng

# Initialize project structure
supabase init

# Generate TypeScript types from your database
mkdir -p types
supabase gen types typescript --project-id bhjprqqpyutuaalfnyng > types/supabase.ts
```

### Local Development

```bash
# Start local Supabase instance
supabase start

# Your local URLs will be:
# Database: postgresql://postgres:postgres@localhost:54322/postgres
# API: http://localhost:54321
# Dashboard: http://localhost:54323
```

### Database Management

```bash
# Pull remote schema to local
supabase db pull

# Push local changes to remote
supabase db push

# Create new migration
supabase migration new add_feature_name

# Seed database
supabase db seed
```

For a complete guide, see `SUPABASE_CLI_GUIDE.md` in your project root.

---

## 📝 Testing

You can test all endpoints using tools like:

- **cURL**: `curl http://localhost:3000/api/test-connection`
- **Postman**: Import the endpoints and test them
- **Browser**: For GET endpoints, you can test directly in your browser

### Quick Test

```bash
# Test connection
curl http://localhost:3000/api/test-connection

# Get all farms
curl http://localhost:3000/api/farms

# Get all products
curl http://localhost:3000/api/products

# Get products for a specific farm
curl "http://localhost:3000/api/products?farm_id=your_farm_id"
```

---

## 📈 Coming Soon

Future API endpoints that may be added:

- User authentication endpoints
- User profile management
- Shopping cart management
- Payment processing
- Subscription management
- Analytics and reporting

---

_Last updated: July 10, 2025_
