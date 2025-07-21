# Duplicate Prevention in Baker Creek Import

## ✅ Comprehensive Duplicate Prevention Measures

The updated import script (`13-baker-creek-clean-import.sql`) now includes multiple layers of duplicate prevention:

### 1. **Farm Level**
```sql
ON CONFLICT (email) DO UPDATE SET
    name = EXCLUDED.name,
    -- ... other fields
```
- Uses the `email` unique constraint to prevent duplicate farms
- If farm exists, updates the information instead of creating duplicate

### 2. **Category Level**
```sql
WHERE NOT EXISTS (SELECT 1 FROM categories WHERE name = 'Vegetables')
```
- Checks if category already exists before inserting
- Prevents duplicate "Vegetables", "Herbs", "Flowers" categories

### 3. **Subcategory Level**
```sql
AND NOT EXISTS (SELECT 1 FROM subcategories s JOIN categories c ON s.category_id = c.id 
                WHERE s.name = 'Tomatoes' AND c.name = 'Vegetables')
```
- Prevents duplicate subcategories within the same category
- Ensures "Tomatoes" subcategory only exists once under "Vegetables"

### 4. **Variety Level**
```sql
AND NOT EXISTS (SELECT 1 FROM varieties v JOIN subcategories s ON v.subcategory_id = s.id 
                WHERE v.name = 'Tomatoes' AND s.name = 'Tomatoes')
```
- Prevents duplicate varieties within the same subcategory
- Ensures each variety exists only once per subcategory

### 5. **Product Level (Most Important)**
```sql
WHERE NOT EXISTS (
    SELECT 1 FROM products p 
    WHERE p.name = products_data.name 
    AND p.farm_id = tf.farm_id 
    AND p.variety_id = tv.variety_id
)
```
- **Prevents duplicate products** based on:
  - Same product name
  - Same farm 
  - Same variety
- This is the most critical check for preventing duplicate products

## 🛡️ Safety Benefits

1. **Idempotent Script** - You can run the script multiple times safely
2. **No Duplicate Data** - Prevents cluttering your database with duplicates
3. **Data Integrity** - Maintains clean relationships between entities
4. **Performance** - Avoids unnecessary duplicate storage

## 🔄 Re-running the Script

You can now safely run the import script multiple times:
- First run: Creates all new data
- Subsequent runs: Only adds new varieties that don't exist yet
- Existing data: Remains unchanged (no duplicates created)

## 📊 What Gets Checked

- ✅ **Farms**: By email address (Baker Creek Heirloom Seeds)
- ✅ **Categories**: By name (Vegetables, Herbs, Flowers)
- ✅ **Subcategories**: By name + category (Tomatoes under Vegetables)
- ✅ **Varieties**: By name + subcategory (Tomatoes variety under Tomatoes subcategory)
- ✅ **Products**: By name + farm + variety (Cherokee Purple from Baker Creek under Tomatoes)

This ensures your database stays clean and organized, even if you run the import multiple times!
