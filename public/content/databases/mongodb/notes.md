# MongoDB — Revision Notes

Condensed reference for quick review. Consolidated from this course's fundamentals, intermediate, advanced, interview, and certification material, with corrections folded in from a senior-instructor review pass.

---

## Core Concepts

```
Document:   JSON-like record (BSON) — most flexible data unit
Collection: group of documents (like a SQL table, but no fixed schema)
Database:   container for collections
_id:        every document has a unique _id (ObjectId by default)

RDBMS → MongoDB mapping:
  Table → Collection | Row → Document | Column → Field
  JOIN → $lookup (aggregation) | Transaction → Multi-document transaction (4.0+)

Strengths: flexible schema, horizontal scaling (sharding), nested documents
Weaknesses: no JOINs by design (use $lookup or embed instead) | eventual
  consistency on secondary reads (see Replication section)
```

## CORRECTED: ACID / Transactions Claim

```
OUTDATED CLAIM to actively unlearn: "MongoDB doesn't support ACID /
multi-document transactions." This has been WRONG since MongoDB 4.0
(2018, replica sets) / 4.2 (sharded clusters). Single-document ops have
ALWAYS been atomic, no special config needed.

What IS true: MongoDB's own guidance recommends single-document
atomicity via schema design OVER multi-document transactions WHERE
POSSIBLE, due to real performance/coordination overhead cost —
this is a DESIGN RECOMMENDATION, not a technical limitation.

session.withTransaction(async () => { ... })  — Node.js driver pattern,
auto-commits on success, auto-aborts on thrown error.
```

## Version Status

```
MongoDB 8.0: current major release since October 2024 (8.2/8.3 = recent
  Rapid Releases). 7.0 still supported but no longer the current
  default — this course's own installation material previously
  referenced mongo:7, corrected to mongo:8 throughout.
```
*(needs verification — confirm the current stable major version directly against MongoDB's own release/support pages before treating 8.0 as current; version numbers in study material go stale.)*

## CRUD Quick Reference

```javascript
insertOne({...}) / insertMany([...])
findOne({...}) / find({...}).toArray()
updateOne({filter}, {$set:{...}}) / updateMany(...)
deleteOne({...}) / deleteMany({...})
replaceOne({filter}, newDoc)  — REPLACES ENTIRE DOCUMENT except _id;
  any field not in newDoc is GONE afterward — real, easy data-loss risk
  if used where $set was actually intended

Upsert: { upsert: true } option — insert if no match, update if found
  Use $setOnInsert for fields that should ONLY be set on the insert path
```

## Query Operators

```
Comparison: $eq $ne $gt $gte $lt $lte $in $nin
Logical:    $and $or $not $nor
Element:    $exists $type
Array:      $elemMatch (any element matches ALL conditions) | $size |
            $all (contains all listed values)
Nested field: dot notation — "address.city": "Mumbai"
Array contains value: tags: "admin"  (implicit — no operator needed)
```

## Aggregation Pipeline

```
$match (filter — put FIRST when possible, can use an index; a $match
  placed AFTER $lookup/$unwind can no longer use an index on the
  original collection's fields at all)
$group (aggregate, by _id expression)
$sort → $limit/$skip
$lookup (JOIN) → $unwind (flatten resulting array)
$project (reshape/select fields)
$addFields (add computed fields mid-pipeline)
$facet (MULTIPLE aggregations in PARALLEL, one query — faceted search)
$bucket (histogram / range grouping)

Top-N-per-group pattern: $sort first (descending by the metric), THEN
  $group with $push: "$$ROOT" and $first — sorting BEFORE grouping is
  what makes $first grab the top item per group correctly.

$slice: ["$array", N] — take first N elements of an array field,
  commonly paired with the two-stage $group approach above for "top 3
  per category" style results.
```

## Indexing

```
Single: createIndex({field: 1})   Compound: createIndex({a:1, b:1, c:1})
Unique | Sparse (skip nulls) | TTL (expireAfterSeconds) | Text (full-text)
2dsphere (geospatial) | Partial (partialFilterExpression — index only
  documents matching a filter, smaller/faster than a full index)

LEFTMOST PREFIX RULE (compound indexes): index (a,b,c) supports queries
  on a alone, a+b, or a+b+c — but querying b alone, or a+c (skipping b),
  can't use the index as fully as a query matching the leftmost prefix.

Covering index: index contains every field a query needs → no document
  fetch at all — the fastest possible query shape.

explain("executionStats"): IXSCAN (good, index used) vs COLLSCAN (full
  scan). Check totalDocsExamined vs nReturned RATIO, not just which
  scan type appears — a COLLSCAN on a genuinely small collection, or a
  query returning most of the collection anyway, can be fine; the real
  signal is examining far more docs than are actually returned.

CORRECTED: { background: true } as a createIndex() option is OBSOLETE
  since MongoDB 4.2 — ALL index builds now use an optimized hybrid
  approach automatically (concurrent reads/writes allowed during the
  main build phase). The option is silently ignored on current
  versions, not an error, but including it suggests outdated knowledge.
```

## Schema Design Patterns

```
EMBED when: 1:1 or 1:FEW relationship, data always read together, sub-
  documents small AND BOUNDED (not open-ended growth)
REFERENCE when: 1:MANY with the many-side growing large, many:many,
  sub-document independently/frequently updated

REAL FAILURE MODE (see this course's Real World Scenarios): embedding
an UNBOUNDED array (e.g., comments on a post) works fine until a
specific document actually approaches MongoDB's 16MB HARD document
size limit — plan the referencing/bucket alternative BEFORE this
happens, don't assume "usually small" holds for every document forever.

Common patterns: Bucket (group time-series into hourly/daily parent
  docs — reduces per-reading document/index overhead at scale) |
  Computed (pre-calculate aggregates on write, avoid expensive read-
  time aggregation) | Extended reference (embed frequently-read fields,
  keep a reference for the rest) | Subset (cache latest N items in
  parent, e.g. 10 most recent comments) | Polymorphic (discriminator
  "type" field for multiple document shapes in one collection)

Schema flexibility ≠ "no schema needed" — real applications still need
deliberate, consistent structure; flexibility is about how EASILY that
structure can evolve, not about skipping design entirely. $jsonSchema
validator exists to add enforcement back in once a schema stabilizes.
```

## Replication

```
Replica Set: Primary (reads+writes) + Secondaries (replica, can serve
  reads) + optional Arbiter (vote only, NO data, can never become primary)
  Minimum 3 members for reliable automatic failover (majority vote needed)
  PSS (Primary + 2 full Secondaries) generally PREFERRED over PSA
  (...+Arbiter) in production — an Arbiter can't take over if a data
  node fails, so PSS gives more real redundancy for a similar cost.

Oplog: primary writes here, secondaries tail it and apply async
CORRECTED: db.isMaster() / rs.isMaster() DEPRECATED since MongoDB 5.0
  — use db.hello() / rs.hello() instead (old commands still work as
  deprecated aliases, but hello() is current)

Write concern: how many nodes must acknowledge before a write returns
  success. w:1 (primary only, DEFAULT) — fast, but a write can be LOST
  if primary crashes before replicating (see Real World Scenarios for
  the full failure mode). w:"majority" — quorum must acknowledge, real
  durability improvement at a real latency cost. j:true — journaled
  (durable to disk) on acknowledging nodes.
  USE w:"majority" + j:true SPECIFICALLY for operations representing
  real business state (orders, payments) — not uniformly for
  everything; a page-view counter doesn't need the same guarantee.

Read preference: primary (default) | secondary (lower latency, MAY BE
  STALE) | nearest
"Read your own writes" risk: reading from a secondary immediately after
  writing can show stale data if replication lag exists at that moment
  — route post-write reads to the primary, or use causal consistency
  sessions, for cases where this correctness matters.
```

## Sharding

```
Shard key selection — THREE criteria, all matter:
  High cardinality (many distinct values)
  Even write distribution (no hotspots)
  Aligns with actual query patterns

Hashed sharding: { field: "hashed" } — even distribution, but range
  queries on that field SCATTER across every shard (destroys ordering)
Range sharding: { field: 1 } — efficient range queries, but a
  MONOTONICALLY INCREASING key (createdAt, sequential _id) creates a
  PERMANENT hotspot — literally every new write targets the SAME
  shard regardless of total shard count. See this course's Real World
  Scenarios for the full failure mode this causes in practice.
Compound shard key ({ deviceId: 1, timestamp: 1 }) is often the actual
  answer for time-series-style data — distributes writes across the
  high-cardinality field while still supporting efficient range queries
  WITHIN each device's own timestamp ordering.
```

## CAP Theorem — MongoDB's Position

```
MongoDB prioritizes Consistency + Partition tolerance (CP), not
Availability, under a network partition.
w:1 → faster, weaker consistency guarantee (replica may lag)
w:"majority" → stronger consistency, real latency cost
During a partition: the MINORITY side becomes read-only (sacrifices
availability specifically to maintain consistency) rather than
allowing writes that couldn't be safely reconciled later.
```

## Certifications

```
MongoDB Associate Developer / Associate DBA: 53 questions, 75 min,
  online-proctored, $150 list price (50% discount after completing the
  official MongoDB University learning path — likely the source of
  "free exam" claims in older material, since free PREP existing
  alongside a real exam fee is easy to conflate). Does not expire, but
  tied to a specific major MongoDB version.
MongoDB Atlas Developer badge: genuinely free (course + badge, not a
  proctored exam) — this one specific certification's "free" claim
  is accurate.
```
*(needs verification — confirm current pricing, format, and domain weighting directly on MongoDB's own certification page before treating the numbers above as current.)*
