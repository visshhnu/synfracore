# MongoDB — Cheatsheet

```bash
# ── CONNECT ───────────────────────────────────────────────
mongosh                                     # Local
mongosh "mongodb://user:pass@host:27017/db"
mongosh "mongodb+srv://user:pass@cluster.mongodb.net/db"  # Atlas

# ── DB / COLLECTION ───────────────────────────────────────
show dbs
use myapp
show collections
db.createCollection("users")
db.users.drop()
db.dropDatabase()
```

```javascript
// ── CRUD ──────────────────────────────────────────────────
// Insert
db.users.insertOne({ name: "Alice", age: 30 })
db.users.insertMany([{ name: "Bob" }, { name: "Charlie" }])

// Find
db.users.findOne({ email: "alice@example.com" })
db.users.find({ age: { $gte: 25 } }).limit(10).sort({ name: 1 })
db.users.find({}, { name: 1, email: 1, _id: 0 })  // Projection
db.users.countDocuments({ status: "active" })
db.users.distinct("city")

// Update
db.users.updateOne({ _id: id }, { $set: { age: 31 }, $currentDate: { updatedAt: true } })
db.users.updateMany({ status: "inactive" }, { $set: { archived: true } })
db.users.findOneAndUpdate({ _id: id }, { $inc: { loginCount: 1 } }, { returnDocument: "after" })
db.users.replaceOne({ _id: id }, { name: "New Doc" })  // Full replacement

// Delete
db.users.deleteOne({ _id: id })
db.users.deleteMany({ createdAt: { $lt: new Date("2020-01-01") } })

// Upsert
db.users.updateOne({ email: "x@example.com" }, { $set: { name: "X" } }, { upsert: true })

// ── QUERY OPERATORS ───────────────────────────────────────
{ field: { $eq: val } }       // Equal (same as { field: val })
{ field: { $ne: val } }       // Not equal
{ field: { $gt: val } }       // Greater than
{ field: { $gte: val } }      // >=
{ field: { $lt: val } }       // <
{ field: { $lte: val } }      // <=
{ field: { $in: [a,b,c] } }  // In array
{ field: { $nin: [a,b] } }   // Not in array
{ field: { $exists: true } }  // Field exists
{ field: { $type: "string" } }// Type check
{ $and: [{cond1}, {cond2}] }  // AND
{ $or:  [{cond1}, {cond2}] }  // OR
{ $not: { field: val } }       // NOT
{ field: { $regex: /pattern/i } }  // Regex

// ── ARRAY OPERATORS ────────────────────────────────────────
{ tags: "python" }                      // Array contains
{ tags: { $all: ["python","devops"] } } // Contains all
{ tags: { $size: 3 } }                  // Array size
{ "scores.0": { $gt: 90 } }            // First element
{ scores: { $elemMatch: { $gt: 90, $lt: 100 } } }  // Any element matches

// ── INDEXES ───────────────────────────────────────────────
db.col.createIndex({ field: 1 })                    // Ascending
db.col.createIndex({ field: 1 }, { unique: true })
db.col.createIndex({ a: 1, b: -1 })                // Compound
db.col.createIndex({ field: "text" })               // Text search
db.col.createIndex({ loc: "2dsphere" })            // Geospatial
db.col.createIndex({ createdAt: 1 }, { expireAfterSeconds: 3600 })  // TTL
db.col.getIndexes()
db.col.dropIndex("index_name")
db.col.explain("executionStats").find({ field: "val" })
```
