# MongoDB — Flexible Document Database

MongoDB stores data as JSON-like documents instead of rows and tables. Each document can have a different structure, making it ideal for evolving schemas, nested data, and applications that don't fit the relational model.

## Document vs Row

```
SQL Row (rigid — all rows must have same columns):
| id | name  | email           | phone       |
| 1  | Alice | alice@email.com | +91-9876543 |
| 2  | Bob   | bob@email.com   | NULL        |

MongoDB Document (flexible — each document can differ):
{
  "_id": "507f1f77bcf86cd799439011",
  "name": "Alice",
  "email": "alice@example.com",
  "phone": "+91-9876543",
  "address": {                     ← Nested object (no JOIN needed)
    "city": "Bangalore",
    "state": "Karnataka"
  },
  "tags": ["admin", "developer"],  ← Arrays built-in
  "preferences": {
    "theme": "dark",
    "notifications": true
  }
}
```

## When to Use MongoDB

**Good fit:**
- Product catalogs (each product has different attributes)
- User profiles (flexible preferences, nested data)
- Content management (blog posts, articles, mixed media)
- Event logs and activity feeds
- Real-time analytics with complex nested queries
- Rapid prototyping where schema changes frequently

**Not a good fit:**
- Complex relationships with many-to-many joins across many collections
- Reporting with ad-hoc aggregations across many unrelated fields
- When your data is naturally tabular and structured
- Situations demanding strict, rigid schema enforcement at the database layer

**A note on financial transactions:** it's a common but outdated claim that MongoDB "can't do ACID" and is therefore unsuitable for financial data — MongoDB has supported multi-document ACID transactions since version 4.0 (2018, single replica set) and 4.2 (sharded clusters). Financial systems still often lean toward relational databases, but the real reasons are usually schema rigidity/constraints being a good fit for regulated data, mature reporting/JOIN tooling, and organizational familiarity — not a technical ACID limitation that no longer exists. MongoDB's own material even recommends single-document atomicity (via schema design) over multi-document transactions where possible, due to the performance cost of the latter — but "not possible at all" is simply inaccurate.

## Quick Start

```javascript
// Connect
const { MongoClient } = require('mongodb');
const client = new MongoClient('mongodb://localhost:27017');
await client.connect();
const db = client.db('myapp');
const users = db.collection('users');

// Insert
await users.insertOne({ name: 'Alice', email: 'alice@example.com', age: 30 });
await users.insertMany([
    { name: 'Bob', email: 'bob@example.com', age: 25 },
    { name: 'Charlie', email: 'charlie@example.com', age: 35 }
]);

// Find
const user = await users.findOne({ email: 'alice@example.com' });
const all = await users.find({ age: { $gte: 25 } }).toArray();

// Update
await users.updateOne({ email: 'alice@example.com' }, { $set: { age: 31 } });

// Delete
await users.deleteOne({ email: 'bob@example.com' });
```

## More Aggregation Stages

```javascript
// $bucket — histogram / range grouping
db.products.aggregate([
    { $bucket: {
        groupBy: "$price",
        boundaries: [0, 50, 100, 200, 500, 1000],
        default: "1000+",
        output: { count: { $sum: 1 }, products: { $push: "$name" } }
    }}
])
```

## Computed Pattern — Pre-Calculate Aggregates

```javascript
// Update stats on every write, avoid expensive aggregations on read
{
    _id: "product_123",
    name: "Laptop",
    stats: {
        totalReviews: 1523,
        averageRating: 4.3,
        ratingDistribution: { "5": 800, "4": 400, "3": 200, "2": 80, "1": 43 },
        lastUpdated: ISODate("...")
    }
}
```

## Python with PyMongo

```python
from pymongo import MongoClient, InsertOne, UpdateOne, DeleteOne
from pymongo.errors import DuplicateKeyError

client = MongoClient("mongodb://admin:password@localhost:27017")
db = client.myapp

try:
    result = db.users.insert_one({"email": "alice@example.com", "name": "Alice"})
    print(f"Inserted: {result.inserted_id}")
except DuplicateKeyError:
    print("Email already exists")

# Bulk operations — efficient for many writes at once
operations = [
    InsertOne({"email": "new@example.com", "name": "New User"}),
    UpdateOne({"email": "alice@example.com"}, {"$set": {"age": 31}}),
    DeleteOne({"email": "old@example.com"})
]
result = db.users.bulk_write(operations, ordered=False)
```

## Interview Questions

**What is the CAP theorem and where does MongoDB sit?**
CAP theorem states a distributed system can guarantee at most two of three: Consistency, Availability, Partition tolerance. MongoDB prioritizes Consistency and Partition tolerance (CP). With default write concern `w:1`, a write is acknowledged when the primary confirms it — replicas may briefly lag. With `w:majority`, writes require acknowledgment from most replica set members, ensuring stronger consistency at the cost of slightly higher latency. MongoDB sacrifices some availability (during network partitions, the minority partition becomes read-only) to maintain consistency.

**Explain the aggregation pipeline vs. MapReduce.**
The aggregation pipeline processes documents through sequential stages — each stage transforms the data and passes it to the next. It's native, highly optimized, and runs entirely in the database engine. MapReduce in MongoDB uses JavaScript functions running in a separate interpreter — much slower, harder to debug, and effectively legacy at this point in favor of the aggregation pipeline. Always use the aggregation pipeline — the only historical reason MapReduce existed was for complex logic that pipeline stages couldn't express, and the aggregation pipeline's `$function` and `$accumulator` stages now cover those cases too.
