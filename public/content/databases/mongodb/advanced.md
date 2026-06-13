# MongoDB — Advanced

## Atlas Search (Full-Text Search)

```javascript
// MongoDB Atlas Search — Lucene-powered full-text search
// Configure via Atlas UI: cluster → Search → Create Index

// Search index definition
{
  "mappings": {
    "dynamic": false,
    "fields": {
      "title":       { "type": "string", "analyzer": "lucene.standard" },
      "content":     { "type": "string", "analyzer": "lucene.english" },
      "tags":        { "type": "string" },
      "category":    { "type": "stringFacet" },
      "publishedAt": { "type": "date" },
      "rating":      { "type": "number" }
    }
  }
}

// Full-text search with facets
const results = await db.collection('articles').aggregate([
    { $search: {
        index: 'articles-search',
        compound: {
            must: [{
                text: {
                    query: 'kubernetes deployment helm',
                    path: ['title', 'content'],
                    fuzzy: { maxEdits: 1 }  // Typo tolerance
                }
            }],
            filter: [{
                range: {
                    path: 'publishedAt',
                    gte: new Date('2024-01-01')
                }
            }]
        },
        highlight: {
            path: ['title', 'content']
        }
    }},
    { $addFields: {
        score: { $meta: 'searchScore' },
        highlights: { $meta: 'searchHighlights' }
    }},
    { $match: { score: { $gt: 0.5 } }},
    { $limit: 10 }
]).toArray();
```

## Sharding

```javascript
// Sharding — distribute data across multiple servers
// Required when single server can't handle the load

// Enable sharding for a database
use admin
db.adminCommand({ enableSharding: 'myapp' })

// Shard a collection — choose shard key carefully!
// Hashed sharding: even distribution, good for write-heavy
db.adminCommand({
    shardCollection: 'myapp.events',
    key: { userId: 'hashed' }  // Even distribution
})

// Range sharding: supports range queries efficiently
db.adminCommand({
    shardCollection: 'myapp.timeseries',
    key: { deviceId: 1, timestamp: 1 }  // Compound for time queries
})

// Bad shard keys (cause hot spots):
// - Low cardinality (_id as sequential integer → all writes to one shard)
// - Monotonically increasing (createdAt → newest data on one shard)
// - Too specific (userId where 90% of traffic is 10 users)
```

## MongoDB Cheatsheet

```javascript
// ── QUERY OPERATORS ───────────────────────────────────────
{ age: { $gt: 18, $lte: 65 } }    // Range
{ status: { $in: ['a', 'b'] } }   // In array
{ name: { $regex: /^Ali/i } }     // Regex
{ tags: { $all: ['js', 'node'] } } // Array contains all
{ 'address.city': 'Bangalore' }    // Nested field
{ field: { $exists: true } }       // Field exists
{ field: null }                    // Field is null OR doesn't exist
{ field: { $type: 'string' } }     // Type check

// ── UPDATE OPERATORS ──────────────────────────────────────
{ $set:   { name: 'New' } }        // Set field
{ $unset: { field: '' } }          // Remove field
{ $inc:   { count: 1 } }           // Increment
{ $push:  { tags: 'new-tag' } }    // Append to array
{ $pull:  { tags: 'old-tag' } }    // Remove from array
{ $addToSet: { tags: 'unique' } }  // Add if not exists
{ $currentDate: { updatedAt: true } } // Set to now

// ── ARRAY QUERIES ─────────────────────────────────────────
{ tags: 'python' }                  // Array contains 'python'
{ 'items.price': { $gt: 100 } }    // Any array element matches
{ items: { $elemMatch: { price: { $gt: 100 }, qty: { $gt: 5 } } } }

// ── INDEXES ───────────────────────────────────────────────
db.col.createIndex({ field: 1 })            // Ascending
db.col.createIndex({ field: -1 })           // Descending
db.col.createIndex({ field: 1 }, { unique: true })
db.col.createIndex({ field: 1 }, { sparse: true })  // Skip nulls
db.col.createIndex({ field: 1 }, { expireAfterSeconds: 3600 })  // TTL
db.col.createIndex({ title: 'text', body: 'text' })  // Text search
db.col.getIndexes()
db.col.explain("executionStats").find({ field: 'val' })
```
