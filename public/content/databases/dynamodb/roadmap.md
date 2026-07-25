# DynamoDB — Learning Roadmap

## Estimated Time to Job-Ready
**6-8 weeks** of consistent learning (2-3 hours/day) — DynamoDB's API surface is genuinely small; the real learning curve is almost entirely in access-pattern-first data modeling, which is a real mindset shift for anyone coming from relational database experience.

## Phase 1: Foundation (Week 1-2)

- Core concepts: table, item, attribute, partition key, sort key, and how DynamoDB's key-value/document model differs from a relational table
- Basic operations: `put_item`, `get_item`, `update_item`, `delete_item`, and the critical distinction between `query()` (targeted, uses keys) and `scan()` (reads everything — avoid in production)
- Capacity modes: on-demand (pay per request, no planning) vs. provisioned (RCU/WCU, cheaper for predictable traffic)

**Checkpoint:** can you explain why a high-cardinality partition key matters for avoiding "hot partitions," using a concrete bad example (like a status field with only 3 possible values) versus a good one (like a user ID)?

## Phase 2: Access-Pattern-First Data Modeling (Week 2-4)

- The core discipline: list every access pattern your application needs *before* designing any table structure — this is the opposite instinct from relational normalization
- Single-table design: key overloading with generic `PK`/`SK` attributes and prefixes (`USER#123`, `ORDER#456`) to serve multiple entity types and relationships from one table
- GSIs (new partition/sort key pairs, eventually consistent, addable after creation) vs. LSIs (same partition key, different sort key, must be defined at table creation, can be strongly consistent)
- Complete Portfolio Project 1 (single-table design from access patterns)

**Checkpoint:** given a new requirement ("look up an order by its ID alone, without knowing the customer"), can you identify whether your existing table design already serves this, or whether it needs a GSI — and explain why?

## Phase 3: Transactions, Streams, and Advanced Features (Week 4-6)

- `TransactWriteItems`/`TransactGetItems` for real cross-item atomicity (up to 100 items), and when they're actually warranted versus a single conditional `update_item`
- Conditional expressions for both business-rule enforcement (don't oversell inventory) and optimistic locking (version-based concurrent-update safety)
- DynamoDB Streams + Lambda for event-driven patterns: search sync, notifications, audit logging, cross-region replication
- Complete Portfolio Project 2 (transactional order flow)

**Checkpoint:** can you explain, using a real example, when you'd reach for `TransactWriteItems` versus a single `update_item` with a `ConditionExpression` — this exact judgment call is a common interview question, since transactions have real cost and shouldn't be a default reach.

## Phase 4: Global Tables, DAX, and Interview Readiness (Week 6-8)

- Global Tables: multi-region active-active replication, last-writer-wins conflict resolution, and what "eventually consistent globally" actually means in practice
- DAX (DynamoDB Accelerator): when a microsecond-latency read cache is actually warranted versus unnecessary complexity for the workload
- TTL for automatic item expiration, and its real ~48-hour deletion window (not instantaneous)
- Complete Portfolio Project 3 (event-driven Streams pipeline) — this is the highest-value exercise for demonstrating real production-pattern understanding, not just CRUD
- Review this course's Interview Q&A material, particularly the single-table design and capacity-mode tradeoff questions

## Common Pitfalls Specific to DynamoDB (Not Generic Study Advice)

- **Designing tables the relational way first, then trying to translate them** — this produces a schema that needs joins DynamoDB doesn't have; the fix is designing from access patterns directly
- **Reaching for `scan()` because it "just works" during development** — it's fine on a toy dataset and a genuine performance/cost problem at real scale; every production access pattern should resolve via `query()` or `get_item()`
- **Treating GSIs as a default rather than a specific-need addition** — every GSI adds its own RCU/WCU cost; add one because a genuine access pattern requires it, not defensively
- **Forgetting that on-demand pricing gets more expensive than provisioned at steady, predictable traffic** — on-demand is the right default for unpredictable/new workloads, not universally the "modern" choice

## Getting Your First DynamoDB-Heavy Role

1. **Portfolio:** the 3 projects in this course's Projects section, each demonstrating a different core skill (access-pattern-first modeling, real transactional atomicity, event-driven Streams architecture)
2. **Resume:** be specific — "redesigned a schema from entity-based to single-table access-pattern design, eliminating three separate scan() calls" is far stronger than "experience with DynamoDB"
3. **Know the AWS ecosystem context:** DynamoDB is heavily featured in AWS's own certifications (Database Specialty, Developer Associate) — familiarity with when DynamoDB is the right choice versus RDS/Aurora is often as relevant in interviews as CRUD/query syntax
4. **Certifications, if pursuing one:** see this course's own Certification Guide for current AWS exam pricing and format caveats
