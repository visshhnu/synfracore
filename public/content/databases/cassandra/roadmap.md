# Cassandra — Learning Roadmap

## Estimated Time to Job-Ready
**6-9 weeks** of consistent learning (2-3 hours/day) — Cassandra's CQL syntax looks deceptively SQL-like, but the actual learning curve is almost entirely in the query-first data modeling mindset, which takes real practice to internalize since it's the opposite of how relational schema design works.

## Phase 1: Foundation (Week 1-2)

- Core architecture: the masterless ring, consistent hashing, virtual nodes (vnodes), and why "any node can coordinate any request" is fundamentally different from a primary/replica relational setup
- Basic CQL: `CREATE KEYSPACE`/`CREATE TABLE`, `INSERT`/`UPDATE`/`DELETE`, and the hard rule that a query must include the partition key
- Install Cassandra via Docker and get comfortable with `cqlsh`

**Checkpoint:** can you explain, without looking it up, why `SELECT * FROM table WHERE non_partition_column = 'x'` either fails or requires `ALLOW FILTERING` — and why `ALLOW FILTERING` is dangerous in production? This is the single most fundamental Cassandra-specific constraint, and it drives almost everything else about how schemas are designed.

## Phase 2: Query-First Data Modeling (Week 3-4)

- The core discipline: design one table per query pattern, not one table per entity — this is the opposite instinct from relational normalization, and it takes real repetition to internalize
- Partition and clustering key selection: partition key determines which node owns the data, clustering key determines sort order within a partition
- Bucketing to avoid unbounded/hot partitions (e.g. `(sensor_id, date)` instead of `sensor_id` alone for time-series data)
- Complete Portfolio Project 1 (query-driven schema design)

**Checkpoint:** given a new query requirement ("get a user's 10 most recent orders"), can you design the table for it directly, without first drawing an ER diagram? If you find yourself thinking in terms of foreign keys and joins, that's the relational instinct working against you here — Cassandra has neither.

## Phase 3: Consistency, Replication, and Time-Series (Week 5-6)

- Consistency levels (`ONE`, `QUORUM`, `LOCAL_QUORUM`, `ALL`) for both reads and writes, and the `R + W > RF` rule for strong consistency
- `NetworkTopologyStrategy` for multi-datacenter replication, and why `LOCAL_QUORUM` matters for geo-distributed, low-latency writes
- TTL and compaction strategies (`SizeTieredCompactionStrategy`, `LeveledCompactionStrategy`, `TimeWindowCompactionStrategy`) — know which fits which workload, not just the names
- Complete Portfolio Project 2 (time-series ingestion with TTL/compaction tuning)

**Checkpoint:** can you explain a real scenario where `CONSISTENCY ONE` on both read and write would return stale data, and why switching both to `QUORUM` fixes it? This exact reasoning is one of the most commonly tested practical Cassandra skills in interviews.

## Phase 4: Operations and Interview Readiness (Week 7-9)

- `nodetool` fundamentals: `status`, `ring`, `repair`, `compactionstats`, `tpstats` — know what each actually tells you, not just that they exist
- Lightweight transactions (LWT) via Paxos — know when they're appropriate (uniqueness checks, optimistic locking) and why they're expensive enough to use sparingly, not as a default
- Tombstones: what they are, why they accumulate, and why `gc_grace_seconds` and deletion patterns matter operationally
- Complete Portfolio Project 3 (multi-node cluster with real consistency-level tradeoffs) — this is the single highest-value exercise for demonstrating genuine distributed-systems understanding, not just CQL syntax
- Review this course's Interview Q&A material, particularly the write-path/read-path and CAP-theorem questions

## Common Pitfalls Specific to Cassandra (Not Generic Study Advice)

- **Designing schemas the relational way first, then trying to translate them** — this produces tables that need joins Cassandra doesn't have; the fix is designing from queries directly, not normalizing first and denormalizing later
- **Treating materialized views as a default solution for secondary access patterns** — they carry known production consistency caveats; a manually maintained second table (write to both from the application) is generally the more reliable default
- **Using `ALLOW FILTERING` to make a query "just work"** — it silently turns a targeted query into a full cluster scan, which is fine on a toy dataset and a real production incident at scale
- **Forgetting that `DELETE` writes a tombstone, not an immediate removal** — high-frequency deletes on the same partition are a well-known way to degrade read performance over time

## Getting Your First Cassandra-Heavy Role

1. **Portfolio:** the 3 projects in this course's Projects section, each demonstrating a different core Cassandra skill (query-first modeling, time-series/TTL tuning, real multi-node consistency tradeoffs)
2. **Resume:** be specific — "redesigned a schema from entity-based to query-first modeling, eliminating a full-cluster ALLOW FILTERING scan" is far stronger than "experience with Cassandra"
3. **Know the ecosystem context:** Cassandra roles cluster around large-scale, write-heavy, geo-distributed systems (the companies in this course's Overview — Netflix, Discord, Apple, Uber) — familiarity with why an organization reaches for Cassandra specifically (versus a relational database or another NoSQL option) is often as relevant as CQL fluency
4. **Certifications, if pursuing one:** see this course's own Certification Guide for DataStax's current offerings and pricing caveats
