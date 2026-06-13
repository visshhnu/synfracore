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
- Financial transactions (need ACID across multiple documents)
- Complex relationships with many-to-many joins
- Reporting with ad-hoc aggregations across many fields
- When your data is naturally tabular and structured

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
