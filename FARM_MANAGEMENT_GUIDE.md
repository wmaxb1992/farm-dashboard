# Farm Management System - User Guide

## Overview

This farm management system provides a complete workflow for managing plantings, tracking growth stages, and handling harvests through to inventory management. The system follows a realistic farm lifecycle from planting to sales.

## Complete User Workflow

### 1. Product Catalog Setup

Before you can plant anything, you need to have products/varieties in your catalog.

**Location:** Dashboard → Products

- Add varieties you want to grow (e.g., "Roma Tomatoes", "Butterhead Lettuce")
- Specify variety details, organic options, etc.

### 2. Create Plantings

Once you have products in your catalog, you can create plantings.

**Location:** Dashboard → Plantings → "Add New Planting"

**Fields:**

- **What are you planting?** - Select from your product catalog
- **Planting Date** - When you planted or will plant
- **Expected Total Yield** - Total pounds you expect from this planting
- **Harvest Frequency** - How often you'll harvest (e.g., daily, weekly, one-time)
- **Location on Farm** - Where this is planted (e.g., "Greenhouse 1", "Field A")
- **Initial Growth Stage** - Current stage of the planting

### 3. Growth Stage Management

#### Growth Stages

1. **🌱 Seedling** - Just planted, seeds germinating or young plants
2. **🌿 Growing** - Plants are actively growing but not ready to harvest
3. **✅ Ready to Harvest** - Plants are mature and ready for harvest
4. **⏰ Finished** - All harvests complete, planting is done

#### Managing Stages

- Each planting card shows the current growth stage
- Use the dropdown on each planting to update the growth stage manually
- Filter plantings by stage using the filter buttons at the top
- Quick stats show counts for each stage

### 4. Harvest Workflow

#### When Ready to Harvest

1. **Update Growth Stage** to "Ready to Harvest" if not already
2. **Click "Harvest Now"** button on the planting card
3. **Record Harvest Details:**
   - Harvest date
   - Quantity harvested (in pounds)
   - Quality grade (A/B/C)
   - Optional notes
   - Choose whether to create an inventory batch

#### Partial vs. Full Harvests

- **Partial Harvest:** Harvest some of the crop, leaving the rest for later
  - The system automatically updates remaining yield
  - Planting stays "Ready to Harvest" if yield remains
- **Full Harvest:** Harvest all remaining crop
  - System automatically marks planting as "Finished"
  - No more harvests possible from this planting

### 5. Batch Creation and Inventory

#### Automatic Batch Creation

When you record a harvest with "Create inventory batch" checked:

- A new batch is automatically created in inventory
- Batch number format: `[CropName]-[Date]-[ID]`
- All harvested quantity becomes available inventory
- Quality grade and harvest date are tracked

#### Batch Management

**Location:** Dashboard → Batches

- View all inventory batches
- Track quantity available vs. sold
- Monitor freshness and expiration
- Set pricing for each batch

### 6. Sales and Order Management

#### Creating Orders

**Location:** Dashboard → Orders

- Create orders from available inventory batches
- System ensures you don't oversell available quantities
- Track order status and delivery

### 7. Pricing Strategy

**Location:** Dashboard → Pricing

- Set base prices for each variety
- Adjust pricing based on quality grades
- Factor in seasonal demand and market conditions

## Best Practices

### Planning Your Plantings

1. **Staggered Planting:** Plant small amounts every 1-2 weeks for continuous harvest
2. **Succession Planting:** Plan next plantings before current ones are finished
3. **Seasonal Planning:** Consider crop seasons and optimal planting times

### Growth Stage Updates

1. **Regular Monitoring:** Check and update growth stages weekly
2. **Accurate Timing:** Update to "Ready to Harvest" when crops are actually ready
3. **Document Notes:** Use the notes field during harvest to track observations

### Harvest Management

1. **Harvest Early Morning:** Best quality and longest shelf life
2. **Grade Consistently:** Use consistent quality standards (A/B/C)
3. **Track Everything:** Record all harvests, even small ones, for accurate data

### Inventory Best Practices

1. **First In, First Out (FIFO):** Sell older batches first
2. **Quality Monitoring:** Check batch quality regularly
3. **Price Adjustments:** Adjust prices based on freshness and demand

## Example Workflow: Lettuce Farm

### Week 1: Planning and Planting

1. **Add Product:** "Butterhead Lettuce" to product catalog
2. **Create Planting:**
   - Product: Butterhead Lettuce
   - Location: Greenhouse 1, Section A
   - Expected Yield: 25 lbs
   - Frequency: One-time harvest
   - Stage: Seedling

### Week 8: Growth Management

1. **Update Stage:** Seedling → Growing (plants established)
2. **Monitor Progress:** Check plants weekly

### Week 12: Harvest Ready

1. **Update Stage:** Growing → Ready to Harvest
2. **Plan Harvest:** Check weather, plan harvest day

### Week 12: Harvest Day

1. **Record Harvest:**
   - Date: Today
   - Quantity: 23 lbs (some loss expected)
   - Quality: A (premium quality)
   - Create batch: Yes
   - Notes: "Beautiful heads, great color"

2. **System Updates:**
   - Planting marked as "Finished" (full harvest)
   - Batch "Butterhead-2025-01-15-abc4" created
   - 23 lbs available in inventory

### Week 12-13: Sales

1. **Set Pricing:** $8/lb for Grade A butterhead
2. **Create Orders:** As customers place orders
3. **Monitor Freshness:** Track batch quality over time

## Tips for Success

### Data Accuracy

- **Consistent Units:** Always use pounds for weight
- **Accurate Dates:** Record actual dates, not planned dates
- **Regular Updates:** Update growth stages as soon as changes occur

### Planning Ahead

- **Overlap Plantings:** Start new plantings before old ones finish
- **Market Research:** Check pricing trends before planting
- **Capacity Planning:** Don't plant more than you can harvest and sell

### Quality Control

- **Standard Grading:** Develop clear quality standards
- **Harvest Timing:** Don't wait too long to harvest
- **Storage Conditions:** Maintain proper storage for batches

## Troubleshooting

### Common Issues

1. **Missing Products:** Can't create planting → Add varieties to product catalog first
2. **No Harvest Button:** Button only appears for "Ready to Harvest" stage
3. **Negative Remaining Yield:** Check harvest quantities for accuracy
4. **Batch Not Created:** Ensure "Create inventory batch" is checked during harvest

### Data Corrections

- **Wrong Growth Stage:** Simply select correct stage from dropdown
- **Harvest Mistakes:** Contact system administrator for harvest record corrections
- **Planting Errors:** Delete and recreate planting if recently created

This system provides complete traceability from planting to sale, helping you optimize your farm operations and maintain detailed records for business analysis.
