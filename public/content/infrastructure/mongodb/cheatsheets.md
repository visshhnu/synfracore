# MongoDB Quick Reference

## Connection & Admin
```bash
mongosh                                    # Connect locally
mongosh "mongodb://user:pass@host:27017/db"  # URI connect
mongosh --tls --host host -u user -p       # TLS connect
mongodump --db mydb --out /backup/         # Backup
mongorestore --db mydb /backup/mydb/       # Restore
mongostat --host localhost                  # Real-time stats
mongotop --host localhost                   # Collection-level stats
```

## Database & Collection Ops
```javascript
show dbs                    // List databases
use mydb                    // Switch database
show collections            // List collections
db.stats()                  // DB stats
db.collection.stats()       // Collection stats
db.collection.drop()        // Drop collection
db.dropDatabase()           // Drop database
```

## CRUD Operations
```javascript
// Insert
db.users.insertOne({ name: "Alice", age: 30, city: "Mumbai" })
db.users.insertMany([{ name: "Bob" }, { name: "Carol" }])

// Find
db.users.findOne({ name: "Alice" })
db.users.find({ age: { $gte: 25 } }).sort({ name: 1 }).limit(10)
db.users.find({ tags: "admin" })              // Array contains
db.users.find({ "address.city": "Mumbai" })   // Nested field
db.users.find({}, { name: 1, email: 1, _id: 0 })  // Projection

// Update
db.users.updateOne({ name: "Alice" }, { $set: { age: 31 } })
db.users.updateOne({ name: "Alice" }, { $inc: { loginCount: 1 } })
db.users.updateMany({ active: false }, { $set: { archived: true } })
db.users.findOneAndUpdate({ name: "Alice" }, { $set: { age: 31 } },
  { returnDocument: "after" })

// Upsert
db.users.updateOne({ email: "a@b.com" }, { $set: { name: "Alice" } },
  { upsert: true })

// Delete
db.users.deleteOne({ name: "Alice" })
db.users.deleteMany({ active: false })
```

## Query Operators
```javascript
// Comparison
$eq, $ne, $gt, $gte, $lt, $lte
$in: { age: { $in: [25, 30, 35] } }
$nin: { status: { $nin: ["inactive", "banned"] } }

// Logical
$and: [{ age: { $gte: 18 } }, { active: true }]
$or:  [{ role: "admin" }, { role: "superuser" }]
$not: { age: { $not: { $lt: 18 } } }

// Element
$exists: { phone: { $exists: true } }
$type:   { age: { $type: "number" } }

// Array
$elemMatch: { scores: { $elemMatch: { $gte: 90 } } }
$size:      { tags: { $size: 3 } }
$all:       { tags: { $all: ["admin", "user"] } }
```

## Aggregation Pipeline
```javascript
db.orders.aggregate([
  { $match: { status: "completed" } },        // Filter first (use index)
  { $group: {
      _id: "$userId",
      total: { $sum: "$amount" },
      count: { $sum: 1 },
      avg:   { $avg: "$amount" }
  }},
  { $sort: { total: -1 } },                   // Sort descending
  { $limit: 10 },                             // Top 10
  { $lookup: {                                // LEFT JOIN
      from: "users",
      localField: "_id",
      foreignField: "_id",
      as: "user"
  }},
  { $unwind: "$user" },                       // Flatten array
  { $project: { "user.name": 1, total: 1 } } // Select fields
])
```

## Indexes
```javascript
db.users.createIndex({ email: 1 })            // Ascending
db.users.createIndex({ email: 1 }, { unique: true })
db.users.createIndex({ name: "text", bio: "text" })  // Text search
db.users.createIndex({ createdAt: 1 }, { expireAfterSeconds: 3600 }) // TTL
db.users.createIndex({ location: "2dsphere" })       // Geospatial
db.users.getIndexes()
db.users.dropIndex("email_1")
db.users.find({ email: "a@b.com" }).explain("executionStats")
// Look for: IXSCAN (good) vs COLLSCAN (bad — add index)
```

## Revision Notes
```
CRUD: insertOne/Many | findOne/find | updateOne/Many | deleteOne/Many
OPERATORS: $eq/$gt/$in/$and/$or/$exists/$elemMatch
AGGREGATION: $match(filter) → $group → $sort → $limit → $lookup(join)
INDEXES: createIndex({field:1}) | unique | text | TTL | 2dsphere
EXPLAIN: COLLSCAN = full scan (add index) | IXSCAN = uses index
```
