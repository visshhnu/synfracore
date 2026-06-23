# MongoDB Certification Guide

## Certifications Available

| Cert | Provider | Cost | Format |
|------|----------|------|--------|
| **MongoDB Associate Developer (Python/JS/Java)** | MongoDB | Free exam | MCQ + practical |
| **MongoDB Associate DBA** | MongoDB | Free exam | MCQ + practical |
| **MongoDB Atlas Developer** | MongoDB | Free | Course + badge |

MongoDB University at learn.mongodb.com — free courses and free certification exams.

---

## Core Topics

```javascript
// CRUD
db.users.insertOne({ name: "Alice", age: 30, city: "Mumbai" })
db.users.insertMany([{ name: "Bob" }, { name: "Carol" }])

db.users.findOne({ name: "Alice" })
db.users.find({ age: { $gte: 25, $lt: 40 } }).sort({ name: 1 }).limit(10)
db.users.find({ "address.city": "Mumbai" })          // nested field
db.users.find({ tags: "admin" })                     // array contains
db.users.find({}, { name: 1, email: 1, _id: 0 })     // projection

db.users.updateOne({ name: "Alice" }, { $set: { age: 31 }, $push: { tags: "vip" } })
db.users.updateMany({ active: false }, { $set: { archived: true } })

db.users.deleteOne({ name: "Alice" })
db.users.deleteMany({ lastLogin: { $lt: new Date("2023-01-01") } })

// QUERY OPERATORS (know these for the exam)
// Comparison: $eq $ne $gt $gte $lt $lte $in $nin
// Logical:    $or $and $not $nor
// Element:    $exists $type
// Array:      $elemMatch $size $all

// UPDATE OPERATORS (know these too)
// $set $unset $inc $push $pull $addToSet $rename $pop $each

// AGGREGATION PIPELINE
db.orders.aggregate([
  { $match:   { status: "completed" } },               // filter (use index here)
  { $group:   { _id: "$userId", total: { $sum: "$amount" }, count: { $sum: 1 } } },
  { $sort:    { total: -1 } },
  { $limit:   10 },
  { $lookup:  { from: "users", localField: "_id", foreignField: "_id", as: "user" } },
  { $unwind:  "$user" },
  { $project: { "user.name": 1, total: 1, count: 1 } }
])

// INDEXES
db.users.createIndex({ email: 1 }, { unique: true })
db.users.createIndex({ name: "text", bio: "text" })                  // full-text
db.users.createIndex({ createdAt: 1 }, { expireAfterSeconds: 86400 }) // TTL index
db.users.find({ email: "a@b.com" }).explain("executionStats")
// COLLSCAN = full collection scan (add an index!) | IXSCAN = index scan (good)
```

---

## Data Modelling Rules

```
EMBED WHEN:
  Data is always accessed together (post + author snippet)
  Relationship is 1:1 or 1:few (order + line items)
  Sub-documents are small and bounded

REFERENCE WHEN:
  Relationship is 1:many with many side growing large
  Many-to-many relationship
  Sub-document is independently updated at high frequency

COMMON SCHEMA PATTERNS:
  Extended reference: embed frequently read fields, keep reference for the rest
  Bucket: group time-series records into hourly/daily parent documents
  Subset: cache latest N items in parent (e.g. 10 most recent comments)
  Polymorphic: multiple shapes in one collection — add a "type" discriminator field
```

---

## Study Resources

- **MongoDB University** (learn.mongodb.com) — free courses and free certification exam
- **MongoDB Docs** (mongodb.com/docs) — official reference
- **MongoDB Atlas** — free 512 MB shared cluster for hands-on practice
- **Practical MongoDB Aggregations** — free ebook by Paul Done

## Revision Notes
```
DOCUMENT DB: JSON/BSON, schema-flexible, scales horizontally via sharding
CRUD: insertOne/Many | findOne/find | updateOne/Many | deleteOne/Many
UPDATE OPS: $set $inc $push $pull $addToSet — know these cold

AGGREGATION PIPELINE:
  $match (filter early, uses index) -> $group -> $sort -> $limit -> $lookup -> $project

INDEXES: single | compound (leftmost-prefix rule) | text | TTL | 2dsphere (geo)
REPLICA SET: PRIMARY (writes) + SECONDARYs (reads/HA) — minimum 3 members
SCHEMA DESIGN: embed for fast reads, reference for flexibility
```
