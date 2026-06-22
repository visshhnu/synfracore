# MongoDB Interview Questions

## Core Concepts

**Q: What is MongoDB? When to choose it over relational DB?**

MongoDB is a document-oriented NoSQL database. Data stored as JSON-like BSON documents in collections (not tables). Schema-flexible — documents in same collection can have different fields.

**Choose MongoDB when:**
- Data is hierarchical/nested (documents with embedded sub-documents)
- Schema changes frequently during development
- Need to store varied document structures
- Horizontal scaling (sharding) is a requirement
- Working with JSON natively (APIs, web apps)

**Choose RDBMS when:**
- Complex relationships and JOINs are frequent
- ACID transactions across multiple collections needed (MongoDB 4.0+ supports, but complex)
- Strict schema enforcement required
- Data is naturally tabular and relational

---

**Q: MongoDB query operations — CRUD and aggregation.**

```javascript
// INSERT
db.users.insertOne({ name: "Alice", age: 30, tags: ["admin", "user"] })
db.users.insertMany([{ name: "Bob" }, { name: "Charlie" }])

// FIND (SELECT)
db.users.findOne({ name: "Alice" })
db.users.find({ age: { $gte: 25 } }).sort({ name: 1 }).limit(10)
db.users.find({ tags: "admin" })  // Array contains value
db.users.find({ "address.city": "Mumbai" })  // Nested field

// UPDATE
db.users.updateOne({ name: "Alice" }, { $set: { age: 31 } })
db.users.updateMany({ age: { $lt: 18 } }, { $set: { minor: true } })
db.users.findOneAndUpdate({ name: "Alice" }, { $inc: { loginCount: 1 } }, { returnDocument: "after" })

// DELETE
db.users.deleteOne({ name: "Alice" })
db.users.deleteMany({ status: "inactive" })

// AGGREGATION PIPELINE
db.orders.aggregate([
  { $match: { status: "completed" } },            // Filter
  { $group: { _id: "$userId", total: { $sum: "$amount" } } },  // Group + sum
  { $sort: { total: -1 } },                       // Sort descending
  { $limit: 10 },                                 // Top 10
  { $lookup: {                                    // JOIN with users collection
      from: "users",
      localField: "_id",
      foreignField: "_id",
      as: "user"
  }}
])
```

---

**Q: MongoDB indexing strategies.**

```javascript
// Single field index
db.users.createIndex({ email: 1 })  // 1=ascending, -1=descending

// Compound index (order matters for queries)
db.orders.createIndex({ userId: 1, createdAt: -1 })
// Supports: { userId } and { userId, createdAt } queries
// Does NOT support: { createdAt } alone efficiently

// Unique index
db.users.createIndex({ email: 1 }, { unique: true })

// Sparse index (only documents with field)
db.users.createIndex({ phone: 1 }, { sparse: true })

// TTL index (auto-delete documents after expiry)
db.sessions.createIndex({ createdAt: 1 }, { expireAfterSeconds: 3600 })

// Text index (full-text search)
db.articles.createIndex({ title: "text", body: "text" })
db.articles.find({ $text: { $search: "MongoDB tutorial" } })

// Covered query: index contains all fields needed (no document fetch)
// Explain plan
db.users.find({ email: "alice@example.com" }).explain("executionStats")
// Look for: "IXSCAN" (good) vs "COLLSCAN" (full table scan — add index)
```

---

**Q: Replication in MongoDB.**

**Replica Set**: Group of mongod processes maintaining same data. Minimum 3 nodes.

```
Primary (reads + writes)
  ├── Secondary 1 (replica, can serve reads)
  ├── Secondary 2 (replica)
  └── Arbiter (vote only, no data)
```

- Primary receives all writes, replicates via oplog (operation log)
- Secondaries tail oplog, apply operations asynchronously
- **Automatic failover**: If primary unreachable, secondaries elect new primary (needs majority vote)
- **Read preference**: `primary` (default), `secondary` (lower latency, may be stale), `nearest`

**Write concern**: How many nodes must acknowledge write.
```javascript
db.orders.insertOne(doc, { writeConcern: { w: "majority", j: true } })
// w: "majority" → quorum must acknowledge
// j: true → write must be journaled (durable)
```

---

**Q: MongoDB sharding for horizontal scale.**

Sharding splits data across multiple shards for high-throughput, large datasets.

**Shard key**: Field(s) that determine which shard a document belongs to.
```javascript
sh.shardCollection("mydb.orders", { userId: 1 })
// All orders from same userId go to same shard
// Good: most queries filter by userId
// Bad if: single userId has millions of orders (hotspot)
```

**Shard key choices:**
- High cardinality (many distinct values)
- Even distribution (no hotspots)
- Aligns with query patterns

**Hashed sharding**: `{ userId: "hashed" }` — even distribution, but range queries scatter across all shards.
**Ranged sharding**: `{ createdAt: 1 }` — good for range queries, but monotonically increasing key creates hotspot on last shard.

## Revision Notes
```
MONGODB: Document DB, BSON, flexible schema, horizontal scaling

QUERY OPERATORS:
$eq/$ne/$gt/$lt/$gte/$lte/$in/$nin: comparison
$and/$or/$not: logical | $exists/$type: element
$set/$inc/$push/$pull/$addToSet: update operators

AGGREGATION PIPELINE STAGES:
$match (filter) → $group → $sort → $limit/$skip → $lookup (join) → $project (reshape)

INDEXING:
Single: {field: 1/-1} | Compound: order matters, ESR rule
Unique: enforce uniqueness | TTL: auto-expiry | Text: full-text search
Use explain() to check IXSCAN vs COLLSCAN

REPLICA SET: Primary + Secondaries + optional Arbiter (3 nodes minimum)
Writes to primary → replicates via oplog → secondaries
Write concern: {w: "majority"} for durability

SHARDING: Distribute across shards via shard key
Good shard key: high cardinality, even distribution, aligns with queries
Avoid monotonic keys (hotspot) | Hashed sharding: even but no range queries
```
