// Import the MongoDB Node.js driver
const MongoClient = require('mongodb').MongoClient;

// Connection URL and database name
const url = 'mongodb://localhost:27017';
const dbName = 'inventory';

// Create a new MongoClient
const client = new MongoClient(url, { useUnifiedTopology: true });

// Function to connect to the database
async function connectDB() {
    try {
        await client.connect();
        console.log('Connected to MongoDB');
    } catch (err) {
        console.error('Error connecting to MongoDB:', err);
    }
}

// Function to close the database connection
function closeDB() {
    client.close();
    console.log('Disconnected from MongoDB');
}

// Create all the entities as collections
async function createEntities() {
    const db = client.db(dbName);

    // Create Categories collection
    await db.createCollection('categories');
    console.log('Categories collection created');

    // Create Items collection
    await db.createCollection('items');
    console.log('Items collection created');

    // Create Users collection
    await db.createCollection('users');
    console.log('Users collection created');

    // Create Orders collection
    await db.createCollection('orders');
    console.log('Orders collection created');
}

// Insert records into the entities
async function insertRecords() {
    const db = client.db(dbName);

    // Insert sample category
    await db.collection('categories').insertOne({ categoryName: 'Electronics' });

    // Insert sample item
    await db.collection('items').insertOne({
        itemName: 'Smartphone',
        price: 499.99,
        size: 'medium',
        category: 'Electronics',
    });

    // Insert sample user
    await db.collection('users').insertOne({ userType: 'admin' });
}

// Get records from two or more entities
async function getRecords() {
    const db = client.db(dbName);

    // Get items with their categories
    const itemsWithCategories = await db
        .collection('items')
        .aggregate([
            {
                $lookup: {
                    from: 'categories',
                    localField: 'category',
                    foreignField: 'categoryName',
                    as: 'categoryInfo',
                },
            },
        ])
        .toArray();

    console.log('Items with Categories:', itemsWithCategories);
}

// Update records in two or more entities
async function updateRecords() {
    const db = client.db(dbName);

    // Update an item and its category
    await db.collection('items').updateOne(
        { itemName: 'Smartphone' },
        {
            $set: {
                price: 549.99,
            },
        }
    );
}

// Delete records from two or more entities
async function deleteRecords() {
    const db = client.db(dbName);

    // Delete an item and its associated orders
    await db.collection('items').deleteOne({ itemName: 'Smartphone' });
    await db.collection('orders').deleteMany({ item: 'Smartphone' });
}

// Main function
async function main() {
    await connectDB();
    await createEntities();
    await insertRecords();
    await getRecords();
    await updateRecords();
    await deleteRecords();
    closeDB();
}

main();