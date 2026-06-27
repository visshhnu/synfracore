# MongoDB Troubleshooting Guide

## Issue 1: Replica set primary election issues

**Symptom:** Application cannot write. `db.isMaster()` shows no primary. Log shows election messages.

**Debug steps:**
```javascript
// Connect to any replica set member
rs.status()           // see state of all members
rs.conf()             // see replica set configuration
db.adminCommand({replSetGetStatus: 1})

// Check if member can see others
rs.status().members.forEach(m => print(m.name, m.stateStr, m.health))
```

**Root cause:** Split brain (network partition), PRIMARY crashed and no quorum, or RS members not reachable on port 27017.

**Fix:**
```javascript
// Force primary election if stuck (emergency, use carefully)
cfg = rs.conf()
cfg.members[0].priority = 10   // boost priority for preferred primary
rs.reconfig(cfg)               // triggers new election

// If member shows REMOVED: add it back
rs.add("hostname:27017")

// If stuck in RECOVERING: force full sync
// Stop mongod on member, delete data dir, restart — it will resync
```

---

## Issue 2: Write concern errors — writes not acknowledged

**Symptom:** `WriteConcernError: waiting for replication timed out`. Data may not be durable.

**Root cause:** Too-strict write concern, replica lag too high, or replicas not reachable.

**Debug steps:**
```javascript
// Check replication lag
rs.status().members.forEach(m => {
  if (m.optimeDate) print(m.name, m.stateStr, "lag:", 
    (new Date() - m.optimeDate)/1000 + "s");
})
```

**Fix:**
```javascript
// Reduce write concern for lower-durability, higher-performance workloads
db.collection.insertOne(doc, { writeConcern: { w: 1 } })   // primary ack only
db.collection.insertOne(doc, { writeConcern: { w: "majority", wtimeout: 5000 } }) // 5s timeout

// Or change default at collection/db level
db.runCommand({ collMod: "orders", writeConcern: { w: 1 } })
```

---

## Issue 3: Index not being used — COLLSCAN on large collection

**Symptom:** Query takes 10+ seconds on million-document collection. `explain()` shows COLLSCAN.

**Debug steps:**
```javascript
// Check query plan
db.orders.find({ status: "pending" }).explain("executionStats")
// Look for: winningPlan.stage == "COLLSCAN" (bad) vs "IXSCAN" (good)
// Check: executionStats.totalDocsExamined vs nReturned (ratio should be close to 1)

// List all indexes
db.orders.getIndexes()

// Check index usage stats
db.orders.aggregate([{ $indexStats: {} }])
```

**Fix:**
```javascript
// Create index (background to not block reads)
db.orders.createIndex({ status: 1 }, { background: true })

// Compound index for multi-field queries
db.orders.createIndex({ status: 1, createdAt: -1 })

// Drop unused indexes (they slow writes)
db.orders.dropIndex("old_index_name")
```

---

## Issue 4: Memory usage — WiredTiger cache full

**Symptom:** MongoDB slows down. `mongostat` shows `faults` increasing. OS memory nearly full.

**Debug steps:**
```javascript
db.serverStatus().wiredTiger.cache
// Look for: "bytes currently in the cache" vs "maximum bytes configured"
// Look for: "pages read into cache" (high = cache misses)
```

**Fix:**
```bash
# Increase cache size (default = 50% of RAM - 1GB)
# In mongod.conf:
storage:
  wiredTiger:
    engineConfig:
      cacheSizeGB: 4   # set to ~50-60% of available RAM

# Or set via parameter
mongod --wiredTigerCacheSizeGB 4
```

---

## Issue 5: Schema validation failures

**Symptom:** `Document failed validation` errors. Inserts/updates rejected unexpectedly after schema changes.

**Debug steps:**
```javascript
// Check current validation rules
db.getCollectionInfos({name: "orders"})[0].options.validator

// Test if a document would pass validation
db.runCommand({
  create: "test_validation",
  validator: { $jsonSchema: { ... } }  // copy your schema here
})
```

**Fix:**
```javascript
// Temporarily switch to warn mode (allows writes but logs failures)
db.runCommand({
  collMod: "orders",
  validationLevel: "moderate",  // only validates existing docs, not updates
  validationAction: "warn"      // warn instead of error
})

// Update schema to match new fields
db.runCommand({
  collMod: "orders",
  validator: {
    $jsonSchema: {
      bsonType: "object",
      required: ["customerId", "status"],
      properties: {
        customerId: { bsonType: "string" },
        status: { enum: ["pending", "completed", "cancelled"] },
        metadata: { bsonType: "object" }  // new optional field
      }
    }
  },
  validationLevel: "strict",
  validationAction: "error"
})
```
