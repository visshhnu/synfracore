# MongoDB — Portfolio Projects

## Project 1: Schema Design — Embedding vs. Referencing, Justified

**Level:** Beginner-Intermediate | **Time:** 1-2 days

Design a MongoDB schema for a realistic application (a blogging platform, a small e-commerce catalog) that deliberately uses both embedding and referencing, and justify each choice.

### Steps

1. Pick a domain with at least 3 different relationship types (a 1:few relationship suited to embedding, a 1:many-large relationship suited to referencing, and a many:many relationship)
2. Design the schema, embedding where data is small/bounded/always-read-together, and referencing where data is large/shared/independently-updated
3. Seed realistic data volumes — including at least one collection with enough documents (tens of thousands) to make query performance actually matter
4. Write the core queries your application needs and confirm each one performs reasonably with `explain()`
5. Deliberately build one *bad* embedding decision (e.g., embedding unbounded comments in a blog post) and demonstrate what breaks as that array grows — connect this to MongoDB's 16MB document size limit
6. Write a README explaining each embed-vs-reference decision with your actual reasoning, not just the final schema

### Skills Demonstrated

- Real schema design tradeoffs, not just syntax
- Understanding document size limits as a genuine constraint, not trivia
- Query performance verification via `explain()`

### GitHub Repo Name

`mongodb-schema-design-project`

---

## Project 2: Aggregation Pipeline for Real Analytics

**Level:** Intermediate | **Time:** 2-3 days

Build a genuinely useful analytics pipeline against a realistic dataset (order data, event logs) using MongoDB's aggregation framework.

### Steps

1. Seed a realistic dataset (orders, users, products) with enough volume and variety to make aggregation results meaningful
2. Build a multi-stage pipeline computing something genuinely useful: revenue by month and category, top N customers by lifetime value, a faceted search combining multiple grouped counts in one query
3. Use `$lookup` to join across collections and `$facet` for parallel aggregations in a single pipeline
4. Compare performance of an equivalent query done via multiple round-trips in application code vs. a single aggregation pipeline, with real numbers
5. Add an index specifically to support your pipeline's `$match` stage and confirm via `explain()` that it's actually being used at that stage
6. Document each pipeline stage's purpose in your README, not just the final code

### Skills Demonstrated

- Real aggregation pipeline fluency across multiple stages
- Understanding why aggregation-in-database often beats application-side joining
- Index optimization specifically for aggregation pipelines

### GitHub Repo Name

`mongodb-aggregation-analytics`

---

## Project 3: Replica Set with Real Failover Testing

**Level:** Advanced | **Time:** 3-4 days

Stand up a genuine MongoDB replica set (Docker Compose is fine) and actually exercise failover, not just configure it.

### Steps

1. Configure a 3-node replica set (Primary-Secondary-Secondary is generally preferred over Primary-Secondary-Arbiter in production, since an Arbiter can't take over as primary — demonstrate you understand why)
2. Confirm replication works: write to the primary, confirm data appears on secondaries, check replication lag via `rs.printReplicationInfo()`
3. Set an appropriate write concern (`{ w: "majority", j: true }`) for a genuinely important write, and explain in your README what durability guarantee this actually provides
4. Deliberately trigger a failover (`rs.stepDown()`) while a write is in flight, and document what happens to that write — does it succeed, fail, or retry?
5. Set up a basic change stream watching for a specific event type, and demonstrate a real use case (cache invalidation, a notification trigger) reacting to it
6. Write up the full failover test as an incident-style report: what you did, what you observed, and what surprised you

### Skills Demonstrated

- Real, hands-on replica set operation and failover testing
- Understanding write concern as a genuine consistency/durability tradeoff, not just configuration syntax
- Change streams for real-time reactive patterns

### GitHub Repo Name

`mongodb-replica-set-failover-lab`

---

## Tips for Great MongoDB Projects

**Justify embed-vs-reference decisions with actual reasoning, not just following a rule mechanically.** "I embedded comments because there are usually only a few" is a real justification; "I embedded this because embedding is usually recommended" is not.

**Test failure modes, not just the happy path.** A replica set you've never actually failed over, or a write concern you've never tested under real network conditions, hasn't really been demonstrated — just configured.

**Show query performance evidence.** `explain()` output showing `IXSCAN` vs. `COLLSCAN`, before and after adding an index, is far more convincing in an interview than a claim that a query "should be fast."

## Portfolio Checklist

- [ ] At least one project demonstrates a genuine embed-vs-reference tradeoff, justified in writing
- [ ] At least one project includes real aggregation pipeline work beyond basic `$match`/`$group`
- [ ] At least one project involves actual replica set failover testing, not just configuration
- [ ] Each README explains reasoning, not just final code
- [ ] You can walk through any of these projects for 5+ minutes without notes
