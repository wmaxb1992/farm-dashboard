/**
 * Enhanced Baker Creek Real Data Scraper
 * 
 * This script scrapes actual product data from Baker Creek's website
 * to build a comprehensive database of their seed catalog.
 * 
 * Features:
 * - Scrapes real product listings from all categories
 * - Extracts detailed product information (descriptions, prices, growing info)
 * - Organizes data into the 4-level botanical hierarchy
 * - Handles rate limiting and respectful scraping
 * - Generates comprehensive JSON data files
 */

const axios = require('axios');
const cheerio = require('cheerio');
const fs = require('fs');
const path = require('path');

// Configuration
const CONFIG = {
  baseUrl: 'https://www.rareseeds.com',
  delay: 2000, // 2 seconds between requests (respectful scraping)
  retries: 3,
  timeout: 10000,
  userAgent: 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'
};

// Main category mappings based on Baker Creek's structure
const MAIN_CATEGORIES = {
  'vegetables': {
    name: 'Vegetables',
    url: '/store/plants-seeds/vegetable-seeds',
    description: 'Heirloom vegetable seeds for delicious and nutritious crops'
  },
  'flowers': {
    name: 'Flowers',
    url: '/store/plants-seeds/flowers',
    description: 'Beautiful heirloom flower seeds for gardens and landscapes'
  },
  'herbs': {
    name: 'Herbs',
    url: '/store/plants-seeds/herbs',
    description: 'Aromatic and culinary herb seeds for cooking and medicinal use'
  }
};

// Sleep function for rate limiting
const sleep = (ms) => new Promise(resolve => setTimeout(resolve, ms));

// Enhanced HTTP client with retry logic
async function fetchWithRetry(url, options = {}) {
  const fullUrl = url.startsWith('http') ? url : `${CONFIG.baseUrl}${url}`;
  
  for (let i = 0; i < CONFIG.retries; i++) {
    try {
      console.log(`Fetching: ${fullUrl} (attempt ${i + 1})`);
      
      const response = await axios.get(fullUrl, {
        timeout: CONFIG.timeout,
        headers: {
          'User-Agent': CONFIG.userAgent,
          'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8',
          'Accept-Language': 'en-US,en;q=0.5',
          'Accept-Encoding': 'gzip, deflate, br',
          'DNT': '1',
          'Connection': 'keep-alive',
          'Upgrade-Insecure-Requests': '1'
        },
        ...options
      });
      
      return response.data;
    } catch (error) {
      console.log(`Attempt ${i + 1} failed for ${fullUrl}:`, error.message);
      if (i === CONFIG.retries - 1) throw error;
      await sleep(CONFIG.delay * (i + 1)); // Exponential backoff
    }
  }
}

// Extract subcategories from a category page
async function extractSubcategories(categoryUrl) {
  try {
    const html = await fetchWithRetry(categoryUrl);
    const $ = cheerio.load(html);
    
    const subcategories = [];
    
    // Look for category links - Baker Creek uses different patterns
    // Try multiple selectors to catch their category structure
    const categorySelectors = [
      '.category-item a',
      '.category-link',
      '.subcategory-item a',
      'a[href*="/store/plants-seeds/"]',
      '.category-grid a'
    ];
    
    for (const selector of categorySelectors) {
      $(selector).each((index, element) => {
        const $link = $(element);
        const href = $link.attr('href');
        const name = $link.text().trim();
        
        if (href && name && href.includes('/store/plants-seeds/')) {
          // Extract subcategory name from URL or text
          const urlParts = href.split('/');
          const subcategorySlug = urlParts[urlParts.length - 1];
          
          if (subcategorySlug && !subcategories.find(sub => sub.slug === subcategorySlug)) {
            subcategories.push({
              name: name.replace(/\s+Seeds?$/i, ''), // Remove "Seeds" suffix
              slug: subcategorySlug,
              url: href,
              description: `${name} varieties from Baker Creek's heirloom collection`
            });
          }
        }
      });
    }
    
    return subcategories;
  } catch (error) {
    console.error(`Error extracting subcategories from ${categoryUrl}:`, error.message);
    return [];
  }
}

// Extract product listings from a subcategory page
async function extractProducts(subcategoryUrl) {
  try {
    const html = await fetchWithRetry(subcategoryUrl);
    const $ = cheerio.load(html);
    
    const products = [];
    
    // Look for product links
    const productSelectors = [
      '.product-item a',
      '.product-link',
      'a[href*="/"][href*="-seeds"]',
      '.product-grid a'
    ];
    
    for (const selector of productSelectors) {
      $(selector).each((index, element) => {
        const $link = $(element);
        const href = $link.attr('href');
        const name = $link.text().trim() || $link.find('img').attr('alt') || '';
        
        if (href && name && !href.includes('/store/plants-seeds/')) {
          // This looks like a product page
          const productSlug = href.split('/').pop();
          
          if (productSlug && !products.find(p => p.slug === productSlug)) {
            products.push({
              name: name.replace(/\s+Seeds?$/i, ''), // Remove "Seeds" suffix
              slug: productSlug,
              url: href,
              description: `${name} - heirloom variety from Baker Creek`
            });
          }
        }
      });
    }
    
    return products;
  } catch (error) {
    console.error(`Error extracting products from ${subcategoryUrl}:`, error.message);
    return [];
  }
}

// Extract detailed product information
async function extractProductDetails(productUrl) {
  try {
    const html = await fetchWithRetry(productUrl);
    const $ = cheerio.load(html);
    
    // Extract product details
    const title = $('h1').first().text().trim() || 'Unknown Product';
    const price = $('.price').first().text().trim() || '$0.00';
    const sku = $('[data-sku]').attr('data-sku') || $('.sku').text().trim() || '';
    const description = $('.description').first().text().trim() || 
                       $('[data-role="description"]').first().text().trim() || 
                       $('.product-description').first().text().trim() || '';
    
    // Extract growing information
    const growingInfo = {};
    $('.growing-info li, .product-specs li').each((index, element) => {
      const text = $(element).text().trim();
      if (text.includes('days')) growingInfo.daysToMaturity = text;
      if (text.includes('height')) growingInfo.height = text;
      if (text.includes('spacing')) growingInfo.spacing = text;
      if (text.includes('sun')) growingInfo.sunRequirement = text;
    });
    
    // Extract botanical information if available
    const botanicalName = $('[data-botanical], .botanical-name').text().trim() || '';
    
    return {
      title,
      price,
      sku,
      description,
      botanicalName,
      growingInfo,
      url: productUrl
    };
  } catch (error) {
    console.error(`Error extracting product details from ${productUrl}:`, error.message);
    return null;
  }
}

// Main scraping function
async function scrapeCategory(categoryKey, categoryInfo) {
  console.log(`\n=== Scraping ${categoryInfo.name} Category ===`);
  
  const categoryData = {
    name: categoryInfo.name,
    slug: categoryKey,
    description: categoryInfo.description,
    subcategories: []
  };
  
  try {
    // Get subcategories
    const subcategories = await extractSubcategories(categoryInfo.url);
    console.log(`Found ${subcategories.length} subcategories in ${categoryInfo.name}`);
    
    for (const subcategory of subcategories.slice(0, 10)) { // Limit for testing
      console.log(`\nScraping subcategory: ${subcategory.name}`);
      
      const subcategoryData = {
        name: subcategory.name,
        slug: subcategory.slug,
        description: subcategory.description,
        varieties: []
      };
      
      await sleep(CONFIG.delay);
      
      // Get products for this subcategory
      const products = await extractProducts(subcategory.url);
      console.log(`Found ${products.length} products in ${subcategory.name}`);
      
      for (const product of products.slice(0, 5)) { // Limit for testing
        console.log(`  Processing product: ${product.name}`);
        
        await sleep(CONFIG.delay);
        
        const productDetails = await extractProductDetails(product.url);
        if (productDetails) {
          // Create variety and cultivar structure
          const variety = {
            name: product.name,
            slug: product.slug,
            description: product.description,
            cultivars: [{
              name: productDetails.title,
              slug: `${product.slug}-standard`,
              description: productDetails.description,
              botanicalName: productDetails.botanicalName,
              price: productDetails.price,
              sku: productDetails.sku,
              growingInfo: productDetails.growingInfo,
              source: 'Baker Creek Heirloom Seeds',
              url: productDetails.url
            }]
          };
          
          subcategoryData.varieties.push(variety);
        }
      }
      
      categoryData.subcategories.push(subcategoryData);
    }
    
    return categoryData;
  } catch (error) {
    console.error(`Error scraping category ${categoryInfo.name}:`, error.message);
    return categoryData;
  }
}

// Save data to JSON files
async function saveData(data, filename) {
  const dataDir = path.join(__dirname, '..', 'baker-creek-data');
  if (!fs.existsSync(dataDir)) {
    fs.mkdirSync(dataDir, { recursive: true });
  }
  
  const filePath = path.join(dataDir, filename);
  fs.writeFileSync(filePath, JSON.stringify(data, null, 2));
  console.log(`Data saved to ${filePath}`);
}

// Generate summary statistics
function generateSummary(allData) {
  const summary = {
    totalCategories: allData.length,
    totalSubcategories: 0,
    totalVarieties: 0,
    totalCultivars: 0,
    categoryBreakdown: {}
  };
  
  allData.forEach(category => {
    summary.totalSubcategories += category.subcategories.length;
    
    let categoryVarieties = 0;
    let categoryCultivars = 0;
    
    category.subcategories.forEach(subcategory => {
      categoryVarieties += subcategory.varieties.length;
      subcategory.varieties.forEach(variety => {
        categoryCultivars += variety.cultivars.length;
      });
    });
    
    summary.totalVarieties += categoryVarieties;
    summary.totalCultivars += categoryCultivars;
    
    summary.categoryBreakdown[category.name] = {
      subcategories: category.subcategories.length,
      varieties: categoryVarieties,
      cultivars: categoryCultivars
    };
  });
  
  return summary;
}

// Main execution
async function main() {
  console.log('🌱 Baker Creek Real Data Scraper Starting...');
  console.log(`Rate limiting: ${CONFIG.delay}ms between requests`);
  console.log(`Timeout: ${CONFIG.timeout}ms per request`);
  console.log(`Retries: ${CONFIG.retries} attempts per request\n`);
  
  const allData = [];
  
  try {
    // Scrape each main category
    for (const [categoryKey, categoryInfo] of Object.entries(MAIN_CATEGORIES)) {
      const categoryData = await scrapeCategory(categoryKey, categoryInfo);
      allData.push(categoryData);
      
      // Save individual category data
      await saveData(categoryData, `${categoryKey}.json`);
      
      // Longer delay between categories
      await sleep(CONFIG.delay * 2);
    }
    
    // Save complete dataset
    await saveData(allData, 'baker-creek-complete.json');
    
    // Generate and save summary
    const summary = generateSummary(allData);
    await saveData(summary, 'scraping-summary.json');
    
    console.log('\n=== Scraping Complete ===');
    console.log(`Total Categories: ${summary.totalCategories}`);
    console.log(`Total Subcategories: ${summary.totalSubcategories}`);
    console.log(`Total Varieties: ${summary.totalVarieties}`);
    console.log(`Total Cultivars: ${summary.totalCultivars}`);
    
    console.log('\nCategory Breakdown:');
    Object.entries(summary.categoryBreakdown).forEach(([name, stats]) => {
      console.log(`  ${name}: ${stats.subcategories} subcategories, ${stats.varieties} varieties, ${stats.cultivars} cultivars`);
    });
    
  } catch (error) {
    console.error('Scraping failed:', error.message);
    process.exit(1);
  }
}

// Run the scraper
if (require.main === module) {
  main();
}

module.exports = {
  scrapeCategory,
  extractSubcategories,
  extractProducts,
  extractProductDetails,
  fetchWithRetry
};
