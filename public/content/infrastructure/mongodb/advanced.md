# MongoDB Advanced Topics

## Replica Set Configuration

```javascript
// Initiate replica set (run on primary)
rs.initiate({
  _id: "myReplicaSet",
  members: [
    { _id: 0, host: "mongo1:27017", priority: 2 },  // Primary preference
    { _id: 1, host: "mongo2:27017" },
    { _id: 2, host: "mongo3:27017", arbiterOnly: true }  // Vote only
  ]
})

rs.status()           // Check replica set status
rs.isMaster()         // Who is primary?
rs.printReplicationInfo()  // Oplog stats
rs.stepDown()         // Step down current primary (force election)
```

**Write Concern**: How many nodes must acknowledge before returning success.
```javascript
db.orders.insertOne(doc, { writeConcern: { w: "majority", j: true } })
// w: "majority" → quorum must acknowledge
// j: true       → write must be journaled on receiving nodes
```

**Read Preference**:
```javascript
db.orders.find().readPref("secondary")          // Read from replica
db.orders.find().readPref("nearest")            // Lowest latency node
```

## Sharding

```javascript
// Enable sharding
sh.enableSharding("mydb")

// Shard a collection
sh.shardCollection("mydb.orders", { userId: 1 })  // Range sharding
sh.shardCollection("mydb.logs",   { _id: "hashed" })  // Hash sharding

// Check sharding status
sh.status()
db.orders.getShardDistribution()

// Hashed sharding: even distribution, no hotspots, range queries scatter
// Range sharding: range queries efficient, risk of hotspot on monotonic keys
```

**Choosing a shard key:**
- High cardinality (many unique values)
- Even write distribution (avoid monotonic keys like timestamps for range sharding)
- Query pattern alignment (queries should include shard key)

## Change Streams (Real-time Events)

```javascript
// Watch for changes to a collection
const changeStream = db.orders.watch([
  { $match: { "operationType": { $in: ["insert", "update"] } } }
])

changeStream.on("change", (change) => {
  console.log("Change detected:", change.operationType, change.fullDocument)
})

// Use cases: real-time notifications, audit logs, cache invalidation
// Requires replica set or sharded cluster (not standalone)
```

## Atlas Search (Full-text)

```javascript
// Create search index via Atlas UI or API
// Query with $search aggregation stage
db.products.aggregate([{
  $search: {
    index: "default",
    text: {
      query: "laptop gaming",
      path: ["name", "description"],
      fuzzy: { maxEdits: 1 }    // Typo tolerance
    }
  }
}, {
  $limit: 10
}, {
  $project: { name: 1, score: { $meta: "searchScore" } }
}])
```

## Production Checklist

```
SECURITY:
  Enable auth: security.authorization: enabled
  Use TLS: net.tls.mode: requireTLS
  Role-based access: least privilege per user
  Disable direct mongod access: use VPN or private subnet

PERFORMANCE:
  WiredTiger cache: 50% of RAM (default)
  Index all query fields: run explain() on production queries
  Avoid large documents (> 1MB) and deeply nested documents
  Use projection to return only needed fields

HA:
  Minimum 3 replica set members (PSA or PSS)
  Monitor replication lag: rs.printReplicationInfo()
  Test failover: rs.stepDown()

MONITORING:
  MongoDB Atlas: built-in dashboards
  mongostat: ops/sec, connections, memory
  mongotop: time per collection
  Profiler: db.setProfilingLevel(1, {slowms: 100})
```

## Revision Notes
```
REPLICA SET: 3+ members (Primary + Secondary + Arbiter = PSA minimum)
Write concern: "majority" for durability | j:true for journaling
Read preference: primary (default) | secondary | nearest

SHARDING:
Hashed: even distribution, range queries scatter across shards
Range: efficient range queries, risk of hotspot on monotonic keys
Choose high-cardinality key aligned with query patterns

CHANGE STREAMS: real-time collection watching → notifications, audit, cache
ATLAS SEARCH: $search aggregation stage for full-text with fuzzy matching

PROFILER: db.setProfilingLevel(1, {slowms:100}) to catch slow queries
```
