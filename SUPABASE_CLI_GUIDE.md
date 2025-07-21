# Supabase CLI Guide for Farm Dashboard

## 🚀 Quick Setup

The Supabase CLI is now installed! Here's how to use it effectively for your farm dashboard project.

## 📋 Essential Commands

### 1. Login to Supabase

```bash
supabase login
```

This will open your browser to authenticate with your Supabase account.

### 2. Link Your Project

```bash
supabase link --project-ref bhjprqqpyutuaalfnyng
```

This connects your local project to your Supabase project.

### 3. Initialize Local Development

```bash
supabase init
```

Creates a `supabase/` folder with configuration files.

## 🛠️ Key Features

### Database Management

#### Generate Types (Super Useful!)

```bash
supabase gen types typescript --local > types/supabase.ts
```

Automatically generates TypeScript types from your database schema.

#### Run Migrations

```bash
supabase db push
```

Push local schema changes to your remote database.

#### Pull Remote Schema

```bash
supabase db pull
```

Pull the current remote schema to your local project.

#### Reset Database

```bash
supabase db reset
```

Reset your local database to match migrations.

### Local Development

#### Start Local Supabase

```bash
supabase start
```

Starts a local Supabase instance with:

- PostgreSQL database
- Auth server
- API server
- Storage server
- Dashboard

#### Stop Local Supabase

```bash
supabase stop
```

#### View Logs

```bash
supabase logs
```

### Database Seeding

#### Seed Database

```bash
supabase db seed
```

Runs seed files from `supabase/seed.sql`

### Edge Functions

#### Create New Function

```bash
supabase functions new my-function
```

#### Deploy Function

```bash
supabase functions deploy my-function
```

#### Serve Functions Locally

```bash
supabase functions serve
```

### Storage

#### List Buckets

```bash
supabase storage ls
```

#### Create Bucket

```bash
supabase storage mb my-bucket
```

## 📁 Project Structure After Init

After running `supabase init`, you'll get:

```
supabase/
├── config.toml          # Project configuration
├── seed.sql            # Database seed data
├── migrations/         # Database migrations
├── functions/          # Edge functions
└── tests/             # Database tests
```

## 🎯 Recommended Workflow for Your Farm Dashboard

### 1. Initial Setup

```bash
# Login and link your project
supabase login
supabase link --project-ref bhjprqqpyutuaalfnyng

# Initialize the project
supabase init

# Pull existing schema
supabase db pull
```

### 2. Generate TypeScript Types

```bash
# Create types directory
mkdir -p types

# Generate types from your database
supabase gen types typescript --project-id bhjprqqpyutuaalfnyng > types/supabase.ts
```

### 3. Set Up Local Development

```bash
# Start local Supabase (optional but recommended)
supabase start

# This gives you:
# - Local database at postgresql://postgres:postgres@localhost:54322/postgres
# - Local API at http://localhost:54321
# - Local Dashboard at http://localhost:54323
```

### 4. Create Migrations for Schema Changes

```bash
# Create a new migration
supabase migration new add_new_feature

# Edit the generated SQL file in supabase/migrations/
# Then apply it
supabase db push
```

### 5. Seed Your Database

```bash
# Move your existing seed data to supabase/seed.sql
# Then run:
supabase db seed
```

## 🔥 Power Features for Your Project

### 1. Auto-Generate TypeScript Types

Instead of manually defining interfaces, let Supabase generate them:

```bash
supabase gen types typescript --project-id bhjprqqpyutuaalfnyng > types/database.types.ts
```

Then use them in your code:

```typescript
import { Database } from './types/database.types'

type Farm = Database['public']['Tables']['farms']['Row']
type Product = Database['public']['Tables']['products']['Row']
```

### 2. Database Migrations

Create version-controlled schema changes:

```bash
# Create migration
supabase migration new add_subscription_bundles

# Edit the generated file
# Apply to remote
supabase db push
```

### 3. Edge Functions for Server Logic

Create serverless functions for complex business logic:

```bash
supabase functions new process-order
supabase functions new send-notifications
supabase functions new calculate-delivery-routes
```

### 4. Local Testing Environment

Test everything locally before deploying:

```bash
supabase start  # Start local instance
pnpm dev       # Start your Next.js app
```

Your app will use the local Supabase instance automatically.

### 5. Database Branching

Create isolated environments for features:

```bash
supabase branches create feature-branch
supabase branches switch feature-branch
```

## 🚀 Quick Start for Your Farm Dashboard

Let's set this up right now:

```bash
# 1. Login and link
supabase login
supabase link --project-ref bhjprqqpyutuaalfnyng

# 2. Initialize and pull schema
supabase init
supabase db pull

# 3. Generate TypeScript types
mkdir -p types
supabase gen types typescript --project-id bhjprqqpyutuaalfnyng > types/supabase.ts

# 4. Move your seed data
cp scripts/02-seed-data.sql supabase/seed.sql

# 5. Start local development (optional)
supabase start
```

## 🎯 Next Steps

1. **Type Safety**: Update your API routes to use generated types
2. **Migrations**: Convert your SQL scripts to migrations
3. **Local Development**: Use local Supabase for development
4. **Edge Functions**: Move complex logic to edge functions
5. **Testing**: Add database tests

## 📚 Useful Commands Reference

| Command                                         | Description                 |
| ----------------------------------------------- | --------------------------- |
| `supabase --help`                               | Show all available commands |
| `supabase status`                               | Show project status         |
| `supabase projects list`                        | List your projects          |
| `supabase gen types typescript --project-id ID` | Generate TypeScript types   |
| `supabase db diff`                              | Show schema differences     |
| `supabase db dump`                              | Export database             |
| `supabase secrets list`                         | List environment secrets    |
| `supabase storage ls`                           | List storage buckets        |

## 🔗 Useful Links

- [Supabase CLI Documentation](https://supabase.com/docs/reference/cli)
- [Local Development](https://supabase.com/docs/guides/cli/local-development)
- [Database Migrations](https://supabase.com/docs/guides/cli/local-development#database-migrations)
- [Edge Functions](https://supabase.com/docs/guides/functions)

---

_The Supabase CLI makes development much easier by providing local development, type generation, migrations, and more!_
