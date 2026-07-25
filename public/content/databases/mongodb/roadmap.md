# MongoDB — Learning Roadmap

## Estimated Time to Job-Ready
**5-7 weeks** of consistent learning (2-3 hours/day) — MongoDB's core CRUD syntax is genuinely quick to pick up if you're already comfortable with JSON; most of the real learning curve is in schema design judgment and the aggregation pipeline, not basic syntax.

## Phase 1: Foundation (Week 1-2)

- Core concepts: document, collection, `_id`, BSON vs. JSON, and how MongoDB's flexible schema differs from a relational table's fixed columns
- Basic CRUD: `insertOne`/`insertMany`, `find` with query operators, `updateOne`/`updateMany`, `deleteOne`/`deleteMany`
- Install MongoDB (Docker is fastest — use a current `mongo` image) and get comfortable with `mongosh`, the modern shell

**Checkpoint:** given a document with nested fields and an array, can you write a query using dot notation to filter on a nested field, and an array operator to check if the array contains a specific value? If not, spend more time here — this exact pattern shows up constantly in real MongoDB work.

## Phase 2: Schema Design and Indexing (Week 2-3)

- Embedding vs. referencing — understand this as a genuine tradeoff (read performance vs. update flexibility and document size limits), not a rule to apply mechanically
- Common schema patterns: bucket pattern for time-series data, computed pattern for pre-calculated aggregates, extended reference for frequently-read fields
- Indexing: single-field, compound (leftmost-prefix rule), TTL, text, sparse
- Complete Portfolio Project 1 (schema design) from this course's Projects section

**Checkpoint:** can you explain, using a real example, when you'd choose to embed vs. reference — not just recite the rule, but justify a specific decision for a specific piece of data? This judgment call is what real interviews actually probe for, more than syntax recall.

## Phase 3: Aggregation Pipeline (Week 3-5)

This is MongoDB's most powerful and most commonly under-practiced feature — worth dedicating real time to.

- Core stages: `$match`, `$group`, `$sort`, `$limit`, `$project`
- Joining data: `$lookup` and `$unwind`
- Advanced stages: `$facet` for parallel aggregations, `$bucket` for histograms, `$addFields` for computed values mid-pipeline
- Complete Portfolio Project 2 (aggregation analytics)

**Checkpoint:** given a raw dataset and a business question ("revenue by category per month, with the top customer per category"), can you sketch the pipeline stages needed, in order, without looking up syntax for each one? This exact kind of question is extremely common in MongoDB-focused technical interviews.

## Phase 4: Replication, Transactions, and Interview Readiness (Week 5-7)

- Replica sets: primary/secondary/arbiter, oplog, write concern, read preference
- Multi-document transactions (available since 4.0) — know both how to use them and why MongoDB's own guidance favors single-document atomicity via schema design where possible
- Sharding concepts: shard keys, hashed vs. range sharding, avoiding hotspots
- Complete Portfolio Project 3 (replica set failover) — this is the single highest-value exercise for demonstrating genuine operational understanding, not just query-writing skill
- Review this course's Interview Q&A material, particularly the CAP theorem question and the embed-vs-reference framing

## Common Pitfalls Specific to MongoDB (Not Generic Study Advice)

- **Treating "MongoDB doesn't support ACID/transactions" as still true** — this hasn't been accurate since MongoDB 4.0 (2018); if you find older material or your own assumptions repeating this claim, it's worth actively correcting
- **Applying embed-vs-reference as a rigid rule rather than a genuine tradeoff** — the "right" answer depends on actual read/write patterns and data size, not a one-size-fits-all guideline
- **Never practicing the aggregation pipeline beyond `$match`/`$group`** — this is consistently where real interview and real-job difficulty concentrates; basic CRUD alone won't prepare you for it
- **Using outdated commands from older tutorials** — `db.isMaster()` is deprecated in favor of `db.hello()`, and the `background: true` index-creation option has been a no-op for some time; a lot of older material still uses both *(needs verification — confirm the exact version where `background` became a no-op before citing a specific number)*

## Getting Your First MongoDB-Heavy Role

1. **Portfolio:** the 3 projects in this course's Projects section, each demonstrating a different layer (schema design judgment, aggregation depth, operational/replication understanding)
2. **Resume:** be specific — "designed a schema with justified embed/reference tradeoffs for a catalog serving 100K+ products" is stronger than "experience with MongoDB"
3. **Certifications, if pursuing one:** MongoDB Associate Developer or Associate DBA — see this course's own Certification Guide for current pricing and format *(needs verification — confirm current pricing/discount terms on MongoDB's own certification page)*
4. **Practice the aggregation pipeline specifically** — it's consistently the single most differentiating skill between someone who's done basic MongoDB tutorials and someone who can actually use it in a real analytical or reporting context
