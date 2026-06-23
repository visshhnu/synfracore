# MongoDB Intermediate Topics

## Schema Design Patterns

**Embed vs Reference**:
```javascript
// EMBED (denormalise): when data is always accessed together
// Fast reads (single document), but duplication if shared
{
  _id: ObjectId("..."),
  name: "Alice",
  address: { street: "123 MG Road", city: "Bangalore", pin: "560001" },
  preferences: { theme: "dark", notifications: true }
}

// REFERENCE (normalise): when data is large, shared, or updated independently
{
  _id: ObjectId("..."),
  name: "Alice",
  departmentId: ObjectId("..."),   // Reference to departments collection
  managerId: ObjectId("...")
}
```

**Rules:**
- Embed: 1:1 or 1:few relationships, accessed together, not shared
- Reference: 1:many (large), many:many, frequently updated sub-documents

## Aggregation Patterns

```javascript
// Faceted search (counts per category)
db.products.aggregate([
  { $match: { inStock: true } },
  { $facet: {
      byCategory: [{ $group: { _id: "$category", count: { $sum: 1 } } }],
      byBrand:    [{ $group: { _id: "$brand",    count: { $sum: 1 } } }],
      priceRange: [{ $group: { _id: null,
          min: { $min: "$price" }, max: { $max: "$price" }
      }}]
  }}
])

// Bucket (histogram)
db.orders.aggregate([
  { $bucket: {
      groupBy: "$amount",
      boundaries: [0, 100, 500, 1000, 5000],
      default: "5000+",
      output: { count: { $sum: 1 }, total: { $sum: "$amount" } }
  }}
])

// Top N per group
db.orders.aggregate([
  { $sort: { amount: -1 } },
  { $group: {
      _id: "$userId",
      topOrder: { $first: "$$ROOT" },  // First doc per group after sort
      orderCount: { $sum: 1 }
  }}
])
```

## Transactions (Multi-document ACID)

```javascript
// Available since MongoDB 4.0 (replica sets), 4.2 (sharded)
const session = client.startSession()
session.startTransaction({
  readConcern: { level: "snapshot" },
  writeConcern: { w: "majority" }
})

try {
  const orders = client.db("shop").collection("orders")
  const inventory = client.db("shop").collection("inventory")
  
  await orders.insertOne({ userId: "123", items: ["A"] }, { session })
  await inventory.updateOne({ item: "A" }, { $inc: { qty: -1 } }, { session })
  
  await session.commitTransaction()
} catch (error) {
  await session.abortTransaction()
} finally {
  await session.endSession()
}
```

**Use sparingly**: MongoDB is designed for single-document atomicity. Multi-document transactions have performance cost — redesign schema to avoid if possible.

## Revision Notes
```
EMBED vs REFERENCE:
Embed: 1:1, 1:few, always accessed together, not shared
Reference: 1:many (large), many:many, frequently updated independently

AGGREGATION STAGES:
$match (filter) → $group (aggregate) → $sort → $limit
$lookup (join) → $unwind (flatten array) → $project (select fields)
$facet: multiple aggregations in parallel (faceted search)
$bucket: histogram grouping

TRANSACTIONS: available 4.0+ (replica set), 4.2+ (sharded cluster)
Performance cost — prefer single-document atomicity via schema design
Use for: financial operations, inventory, anything requiring atomic multi-doc update
```
