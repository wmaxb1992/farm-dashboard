# Farm Dashboard - Code Organization Guide

## 📁 Project Structure

```
farm-dashboard/
├── src/                          # Source code (new organized structure)
│   ├── components/
│   │   ├── features/            # Feature-specific components
│   │   │   └── plantings/       # Plantings feature components
│   │   │       ├── index.ts     # Barrel exports
│   │   │       └── plantings-table.tsx
│   │   └── ui/                  # Reusable UI components (shadcn/ui)
│   ├── types/                   # TypeScript type definitions
│   │   └── plantings.ts         # Plantings-related types
│   ├── lib/                     # Utility functions and configurations
│   │   ├── plantings-utils.ts   # Plantings-specific utilities
│   │   ├── supabase.ts          # Supabase client
│   │   └── utils.ts             # General utilities
│   └── hooks/                   # Custom React hooks
│
├── app/                         # Next.js App Router
│   ├── api/                     # API routes
│   ├── dashboard/               # Dashboard pages
│   └── auth/                    # Authentication pages
│
├── components/                  # Legacy components (to be migrated)
├── lib/                        # Legacy lib (to be migrated)
├── hooks/                      # Legacy hooks (to be migrated)
└── public/                     # Static assets
```

## 🛠️ Code Quality Tools

### ESLint Configuration

- **Strict TypeScript rules** with `@typescript-eslint`
- **React best practices** with `react-hooks` and `jsx-a11y`
- **Import organization** with automatic sorting and unused import removal
- **Code quality enforcement** with custom rules

### Prettier Configuration

- **Consistent formatting** across all files
- **Auto-format on save** in VS Code
- **2-space indentation** with single quotes
- **Trailing commas** for ES5 compatibility

### Available Scripts

```bash
# Development
npm run dev                    # Start development server
npm run build                  # Build for production
npm run start                  # Start production server

# Code Quality
npm run lint                   # Basic linting
npm run lint:fix              # Auto-fix lint issues
npm run lint:strict           # Strict linting with zero warnings
npm run format                # Format all files
npm run format:check          # Check formatting
npm run type-check            # TypeScript type checking
npm run organize-imports      # Remove unused imports

# Combined Quality Checks
npm run code-quality          # Format + lint + type-check (permissive)
npm run code-quality:strict   # Strict quality checks for CI/CD

# Maintenance
npm run clean                 # Clean build artifacts
npm run audit:security        # Security audit
```

## 📋 Best Practices

### 1. File Naming

- **Components**: PascalCase (`PlantingsTable.tsx`)
- **Utilities**: kebab-case (`plantings-utils.ts`)
- **Types**: kebab-case (`plantings.ts`)
- **Hooks**: camelCase starting with `use` (`useToast.ts`)

### 2. Import Organization

The ESLint config automatically organizes imports in this order:

1. **Built-in modules** (Node.js)
2. **External libraries** (npm packages)
3. **Internal modules** (your code with `@/`)
4. **Relative imports** (./components)
5. **Type imports** (separated)

Example:

```typescript
import React, { useState } from 'react'

import { Button } from '@/components/ui/button'
import { formatDate } from '@/lib/plantings-utils'
import type { Planting } from '@/types/plantings'

import './styles.css'
```

### 3. Component Structure

```typescript
// 1. Imports (auto-organized by ESLint)
import React from 'react'
import type { ComponentProps } from '@/types'

// 2. Types/Interfaces (component-specific)
interface ComponentState {
  loading: boolean
}

// 3. Component definition
export default function Component({ prop }: ComponentProps) {
  // 4. State and hooks
  const [state, setState] = useState<ComponentState>({ loading: false })

  // 5. Event handlers
  const handleClick = () => {
    // Implementation
  }

  // 6. Render logic
  return (
    <div>
      {/* JSX */}
    </div>
  )
}
```

### 4. Type Safety

- **Strict TypeScript** configuration
- **Proper typing** for all props and state
- **Type imports** separated from value imports
- **Enum types** for constants (e.g., `CropStatus`)

## 🚀 Migration Plan

### Phase 1: Component Organization ✅

- [x] Create `src/` structure
- [x] Move plantings table to feature-based structure
- [x] Create proper TypeScript types
- [x] Extract utility functions

### Phase 2: Gradual Migration (Next Steps)

- [ ] Move all components to `src/components/`
- [ ] Organize by features (orders, products, farms)
- [ ] Update all import paths
- [ ] Create barrel exports (`index.ts` files)

### Phase 3: Advanced Organization

- [ ] Add API layer with proper typing
- [ ] Implement custom hooks for data fetching
- [ ] Add error boundaries
- [ ] Create shared constants and configurations

## 🔧 VS Code Setup

The project includes optimized VS Code settings:

- **Format on save** with Prettier
- **Auto-fix ESLint** on save
- **Import organization** on save
- **TypeScript strict mode**
- **Tailwind CSS support**

## 📝 Contributing

1. **Before committing**: Run `npm run code-quality` to ensure quality
2. **For CI/CD**: Use `npm run code-quality:strict` for zero-warning builds
3. **Import organization**: Imports are auto-organized on save
4. **Type safety**: All components must be properly typed

## 🎯 Goals Achieved

- ✅ **Clean, maintainable code** with consistent formatting
- ✅ **Feature-based organization** for better scalability
- ✅ **Comprehensive linting** with auto-fixing
- ✅ **Type safety** with strict TypeScript
- ✅ **Import organization** with automatic sorting
- ✅ **Developer experience** with VS Code integration
