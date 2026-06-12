# MongoDB — Fundamentals

## Core Concepts

```
Document:   JSON-like record (BSON format) — most flexible data unit
Collection: Group of documents (like a SQL table, but no fixed schema)
Database:   Container for collections
_id:        Every document has a unique _id (ObjectId by default)

Strengths:  Flexible schema, horizontal scaling, nested documents
Weaknesses: No joins (by design), eventual consistency on shards
```

## CRUD Operations

```javascript
// Connect
const { MongoClient } = require('mongodb');
const client = new MongoClient('mongodb://localhost:27017');
const db = client.db('myapp');
const users = db.collection('users');

// INSERT
await users.insertOne({
    name: 'Alice',
    email: 'alice@example.com',
    age: 30,
    address: { city: 'Bangalore', state: 'KA' },  // embedded document
    tags: ['admin', 'developer'],                   // array
    createdAt: new Date()
});

await users.insertMany([
    { name: 'Bob', email: 'bob@example.com', age: 25 },
    { name: 'Charlie', email: 'charlie@example.com', age: 35 }
]);

// FIND
const user = await users.findOne({ email: 'alice@example.com' });
const all = await users.find({}).toArray();

// Query operators
await users.find({
    age: { $gte: 25, $lte: 40 },          // range
    'address.city': 'Bangalore',            // dot notation for nested
    tags: { $in: ['admin', 'developer'] }, // array contains any
    name: { $regex: /^A/i }                // regex
}).toArray();

// Projection (select fields)
await users.find({}, {
    projection: { name: 1, email: 1, _id: 0 }  // include/exclude
}).toArray();

// UPDATE
await users.updateOne(
    { email: 'alice@example.com' },
    {
        $set: { age: 31, 'address.city': 'Mumbai' },
        $push: { tags: 'senior' },
        $currentDate: { updatedAt: true }
    }
);

await users.updateMany(
    { age: { $lt: 18 } },
    { $set: { status: 'minor' } }
);

// Upsert
await users.updateOne(
    { email: 'dave@example.com' },
    { $setOnInsert: { name: 'Dave', createdAt: new Date() }, $set: { lastLogin: new Date() } },
    { upsert: true }
);

// DELETE
await users.deleteOne({ email: 'bob@example.com' });
await users.deleteMany({ status: 'inactive', lastLogin: { $lt: new Date(Date.now() - 90*86400*1000) } });
```

## Aggregation Pipeline

```javascript
// Most powerful MongoDB feature — process documents in stages
const result = await orders.aggregate([
    // Stage 1: Filter
    { $match: {
        status: 'completed',
        createdAt: { $gte: new Date('2024-01-01') }
    }},

    // Stage 2: Join with users collection
    { $lookup: {
        from: 'users',
        localField: 'userId',
        foreignField: '_id',
        as: 'user'
    }},
    { $unwind: '$user' },

    // Stage 3: Group and aggregate
    { $group: {
        _id: '$user.city',
        totalRevenue: { $sum: '$amount' },
        orderCount: { $count: {} },
        avgOrderValue: { $avg: '$amount' }
    }},

    // Stage 4: Sort
    { $sort: { totalRevenue: -1 } },

    // Stage 5: Limit
    { $limit: 10 },

    // Stage 6: Reshape output
    { $project: {
        city: '$_id',
        totalRevenue: { $round: ['$totalRevenue', 2] },
        orderCount: 1,
        avgOrderValue: { $round: ['$avgOrderValue', 2] },
        _id: 0
    }}
]).toArray();
```

## Indexes

```javascript
// Single field
await users.createIndex({ email: 1 }, { unique: true });
await users.createIndex({ createdAt: -1 });  // Descending for recent-first queries

// Compound index
await orders.createIndex({ userId: 1, status: 1, createdAt: -1 });

// Text search
await posts.createIndex({ title: 'text', content: 'text' });
await posts.find({ $text: { $search: 'kubernetes deployment' } }).toArray();

// Sparse index (only indexes docs that have the field)
await users.createIndex({ deletedAt: 1 }, { sparse: true });

// TTL index (auto-delete documents after N seconds)
await sessions.createIndex({ createdAt: 1 }, { expireAfterSeconds: 3600 });

// Explain query — check if index is used
await users.find({ email: 'alice@example.com' }).explain('executionStats');
// Look for: "stage": "IXSCAN" (index scan) vs "COLLSCAN" (collection scan)
```

## Schema Design Patterns

```javascript
// EMBEDDING (preferred when data is accessed together)
// Blog post with comments embedded
{
    _id: ObjectId("..."),
    title: "Kubernetes Best Practices",
    content: "...",
    comments: [                     // Embedded — fetched with post
        { author: "Alice", text: "Great post!", date: new Date() },
        { author: "Bob", text: "Very helpful", date: new Date() }
    ]
}
// Good for: 1:few relationships, data always read together
// Bad for: 1:many (thousands of comments — document size limit 16MB)

// REFERENCING (for large or frequently updated sub-documents)
// Order references product IDs
{
    _id: ObjectId("..."),
    userId: ObjectId("user123"),    // Reference to users collection
    items: [
        { productId: ObjectId("prod456"), qty: 2, price: 99.99 },
        { productId: ObjectId("prod789"), qty: 1, price: 49.99 }
    ],
    total: 249.97
}
// Use $lookup to join when needed
```
