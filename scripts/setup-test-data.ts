import { db } from '../src/lib/db/client'
import { farms, varieties, plantings, batches, batchPricing } from '../src/lib/db/schema'

async function setupTestData() {
  try {
    console.log('Setting up test data...')

    // Create a test farm
    const [farm] = await db.insert(farms).values({
      name: 'Test Farm',
      description: 'A test farm for development',
      address: '123 Farm Road',
      phone: '555-0123',
      email: 'test@farm.com',
    }).returning()

    console.log('Created farm:', farm.id)

    // Create a test variety
    const [variety] = await db.insert(varieties).values({
      name: 'Roma Tomato',
      description: 'Classic paste tomato',
      categoryId: null, // We'll skip categories for now
    }).returning()

    console.log('Created variety:', variety.id)

    // Create a test planting
    const [planting] = await db.insert(plantings).values({
      farmId: farm.id,
      varietyId: variety.id,
      plantingDate: new Date('2024-01-01'),
      expectedHarvestDate: new Date('2024-06-01'),
      plantsCount: 100,
      location: 'Field A',
      notes: 'Test planting',
    }).returning()

    console.log('Created planting:', planting.id)

    // Create a test batch
    const [batch] = await db.insert(batches).values({
      batchNumber: 'BATCH-001',
      plantingId: planting.id,
      harvestDate: new Date('2024-06-15'),
      quantity: '50.5',
      qualityGrade: 'A',
      storageLocation: 'Warehouse A',
      expiryDate: new Date('2024-07-15'),
    }).returning()

    console.log('Created batch:', batch.id)

    // Create test pricing
    const [pricing] = await db.insert(batchPricing).values({
      batchId: batch.id,
      currentPrice: '8.50',
      marketPrice: '9.00',
      recommendedPrice: '8.75',
    }).returning()

    console.log('Created pricing:', pricing.id)

    console.log('Test data setup complete!')
  } catch (error) {
    console.error('Error setting up test data:', error)
  }
}

setupTestData()
