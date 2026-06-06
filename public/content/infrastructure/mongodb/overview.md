# MongoDB — Document Database

MongoDB is the world's most popular NoSQL database. It stores data as flexible JSON-like documents instead of rows in tables — making it ideal for applications with evolving schemas, hierarchical data, or varying document structures.

## When to Use MongoDB vs PostgreSQL

| Use MongoDB when | Use PostgreSQL when |
|-----------------|---------------------|
| Schema changes frequently | Schema is stable and well-defined |
| Storing hierarchical/nested data | Complex JOINs across many tables |
| Horizontal scaling from day 1 | ACID transactions across multiple collections |
| Catalog, CMS, user profiles | Financial, accounting, inventory |
| Real-time analytics on documents | Reporting with complex aggregations |
| Variable document structure | Strict data integrity requirements |

## Core Concepts

```
RDBMS          MongoDB
────────────────────────
Database    → Database
Table       → Collection
Row         → Document (BSON/JSON)
Column      → Field
Index       → Index
JOIN        → $lookup (aggregation)
Transaction → Multi-document transaction (4.0+)
```

## Installation & Connection

```bash
# Docker
docker run -d \
  --name mongodb \
  -e MONGO_INITDB_ROOT_USERNAME=admin \
  -e MONGO_INITDB_ROOT_PASSWORD=password \
  -p 27017:27017 \
  mongo:7

# Connect with mongosh
mongosh "mongodb://admin:password@localhost:27017"
mongosh "mongodb+srv://cluster.mongodb.net/mydb" --username admin

# Show databases
show dbs
use myapp        # Switch to database (creates if not exists)
show collections
```

## CRUD Operations

```javascript
// INSERT
db.users.insertOne({
    email: "alice@example.com",
    name: "Alice Smith",
    age: 30,
    address: {
        city: "Bangalore",
        country: "India"
    },
    skills: ["Python", "Kubernetes", "AWS"],
    createdAt: new Date()
})

db.users.insertMany([
    { email: "bob@example.com", name: "Bob", age: 25 },
    { email: "charlie@example.com", name: "Charlie", age: 35 }
])

// FIND
db.users.findOne({ email: "alice@example.com" })

db.users.find({ age: { $gte: 25, $lte: 35 } })

db.users.find(
    { "address.city": "Bangalore" },
    { name: 1, email: 1, _id: 0 }    // Projection: include name, email; exclude _id
)

// Query operators
db.users.find({ skills: { $in: ["Python", "Java"] } })
db.users.find({ skills: { $all: ["Python", "Kubernetes"] } })
db.users.find({ age: { $exists: true, $ne: null } })
db.users.find({ $or: [{ age: { $lt: 25 } }, { age: { $gt: 50 } }] })
db.users.find({ name: { $regex: /^Alice/i } })

// Sort, skip, limit
db.users.find().sort({ age: -1 }).skip(10).limit(10)

// UPDATE
db.users.updateOne(
    { email: "alice@example.com" },
    {
        $set: { "address.city": "Mumbai" },
        $push: { skills: "Terraform" },
        $inc: { loginCount: 1 }
    }
)

db.users.updateMany(
    { age: { $lt: 18 } },
    { $set: { isMinor: true } }
)

// Upsert (insert if not found)
db.users.updateOne(
    { email: "dave@example.com" },
    { $setOnInsert: { name: "Dave", createdAt: new Date() } },
    { upsert: true }
)

// DELETE
db.users.deleteOne({ email: "alice@example.com" })
db.users.deleteMany({ isActive: false })
```

## Aggregation Pipeline

The aggregation pipeline is MongoDB's most powerful feature for data processing.

```javascript
// Sales analysis example
db.orders.aggregate([
    // Stage 1: Filter
    { $match: {
        status: "completed",
        createdAt: { $gte: new Date("2024-01-01") }
    }},

    // Stage 2: Add computed field
    { $addFields: {
        totalAmount: { $multiply: ["$price", "$quantity"] },
        month: { $month: "$createdAt" }
    }},

    // Stage 3: Group by month and category
    { $group: {
        _id: { month: "$month", category: "$category" },
        totalRevenue: { $sum: "$totalAmount" },
        orderCount: { $sum: 1 },
        avgOrderValue: { $avg: "$totalAmount" }
    }},

    // Stage 4: Sort by revenue descending
    { $sort: { totalRevenue: -1 } },

    // Stage 5: Project final shape
    { $project: {
        month: "$_id.month",
        category: "$_id.category",
        totalRevenue: { $round: ["$totalRevenue", 2] },
        orderCount: 1,
        avgOrderValue: { $round: ["$avgOrderValue", 2] },
        _id: 0
    }},

    // Stage 6: Limit
    { $limit: 20 }
])

// $lookup — JOIN with another collection
db.orders.aggregate([
    { $match: { userId: ObjectId("...") } },
    { $lookup: {
        from: "users",
        localField: "userId",
        foreignField: "_id",
        as: "user"
    }},
    { $unwind: "$user" },
    { $project: {
        "user.email": 1,
        "user.name": 1,
        totalAmount: 1,
        status: 1
    }}
])

// $bucket — histogram / range grouping
db.products.aggregate([
    { $bucket: {
        groupBy: "$price",
        boundaries: [0, 50, 100, 200, 500, 1000],
        default: "1000+",
        output: {
            count: { $sum: 1 },
            products: { $push: "$name" }
        }
    }}
])
```

## Indexing

```javascript
// Single field
db.users.createIndex({ email: 1 })          // Ascending
db.users.createIndex({ age: -1 })           // Descending

// Unique index
db.users.createIndex({ email: 1 }, { unique: true })

// Compound index
db.orders.createIndex({ userId: 1, createdAt: -1 })

// Text index (full-text search)
db.products.createIndex({ name: "text", description: "text" })
db.products.find({ $text: { $search: "wireless headphones" } })

// TTL index (auto-expire documents)
db.sessions.createIndex({ createdAt: 1 }, { expireAfterSeconds: 3600 })

// Sparse index (only index documents where field exists)
db.users.createIndex({ phone: 1 }, { sparse: true })

// Partial index (index only documents matching filter)
db.orders.createIndex(
    { userId: 1, amount: -1 },
    { partialFilterExpression: { status: "active" } }
)

// View all indexes
db.users.getIndexes()

// Explain query plan
db.users.find({ email: "alice@example.com" }).explain("executionStats")
// Look for: IXSCAN (good) vs COLLSCAN (bad — means no index used)
```

## Schema Design Patterns

```javascript
// Pattern 1: Embedding (denormalization) — for data read together
{
    _id: ObjectId(),
    title: "How to use Kubernetes",
    author: {
        name: "Alice",
        email: "alice@example.com",   // Embedded — fast reads, but updates need multiple docs
        avatar: "https://..."
    },
    comments: [
        { user: "Bob", text: "Great article!", date: new Date() }
    ]
}

// Pattern 2: Referencing (normalization) — for large/frequently updated data
{
    _id: ObjectId(),
    title: "How to use Kubernetes",
    authorId: ObjectId("..."),   // Reference — normalized, consistent
    commentIds: [ObjectId("..."), ObjectId("...")]
}

// Pattern 3: Bucket pattern — for time-series data
// Instead of one document per measurement (millions of docs):
{
    sensor_id: "temp_sensor_1",
    start: ISODate("2024-01-01T00:00:00"),
    end: ISODate("2024-01-01T00:59:59"),
    measurements: [
        { timestamp: ISODate("..."), temp: 22.5 },
        { timestamp: ISODate("..."), temp: 23.1 },
        // ... up to 60 readings
    ],
    count: 60,
    min_temp: 21.8,
    max_temp: 24.2
}

// Pattern 4: Computed pattern — pre-calculate aggregates
{
    _id: "product_123",
    name: "Laptop",
    stats: {
        totalReviews: 1523,
        averageRating: 4.3,
        ratingDistribution: { "5": 800, "4": 400, "3": 200, "2": 80, "1": 43 },
        lastUpdated: ISODate("...")
    }
    // Update stats on every review write — avoid expensive aggregations on read
}
```

## Python with PyMongo

```python
from pymongo import MongoClient, ASCENDING, DESCENDING
from pymongo.errors import DuplicateKeyError

client = MongoClient("mongodb://admin:password@localhost:27017")
db = client.myapp

# Insert with error handling
try:
    result = db.users.insert_one({
        "email": "alice@example.com",
        "name": "Alice"
    })
    print(f"Inserted: {result.inserted_id}")
except DuplicateKeyError:
    print("Email already exists")

# Bulk operations (efficient for many writes)
from pymongo import InsertOne, UpdateOne, DeleteOne

operations = [
    InsertOne({"email": "new@example.com", "name": "New User"}),
    UpdateOne({"email": "alice@example.com"}, {"$set": {"age": 31}}),
    DeleteOne({"email": "old@example.com"})
]
result = db.users.bulk_write(operations, ordered=False)

# Aggregation
pipeline = [
    {"$match": {"status": "active"}},
    {"$group": {"_id": "$category", "count": {"$sum": 1}}},
    {"$sort": {"count": -1}}
]
results = list(db.products.aggregate(pipeline))
```

## Interview Questions

**What is the CAP theorem and where does MongoDB sit?**
CAP theorem states a distributed system can guarantee at most two of three: Consistency, Availability, Partition tolerance. MongoDB prioritizes Consistency and Partition tolerance (CP). With default write concern `w:1`, a write is acknowledged when the primary confirms it — replicas may briefly lag. With `w:majority`, writes require acknowledgment from most replica set members, ensuring stronger consistency at the cost of slightly higher latency. MongoDB sacrifices some availability (during network partitions, the minority partition becomes read-only) to maintain consistency.

**Explain the aggregation pipeline vs MapReduce.**
The aggregation pipeline processes documents through sequential stages — each stage transforms the data and passes it to the next. It's native, highly optimized, and runs entirely in the database engine. MapReduce in MongoDB uses JavaScript functions running in a separate interpreter — much slower, harder to debug, and deprecated in favor of the aggregation pipeline. Always use the aggregation pipeline. The only reason MapReduce existed was for complex logic that SQL-like pipelines couldn't express — the aggregation pipeline with `$function` and `$accumulator` stages now covers those cases.
