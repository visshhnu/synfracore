# PostgreSQL — Learning Roadmap

## Estimated Time to Job-Ready
**6-9 weeks** of consistent learning (2-3 hours/day), assuming basic SQL fluency already — PostgreSQL-specific material (JSONB, advanced indexing, MVCC internals) builds directly on standard SQL rather than re-teaching it.

## Phase 1: Foundation (Week 1-2)

- Install PostgreSQL (Docker is fastest) and get comfortable with `psql` — `\dt`, `\d tablename`, `\di`, `\x`, `\timing` are the commands you'll use daily
- Core data types, especially the ones PostgreSQL does better than most: `JSONB`, arrays, `NUMERIC` vs `FLOAT`, `TIMESTAMPTZ` vs `TIMESTAMP`
- Basic transactions: `BEGIN`, `COMMIT`, `ROLLBACK`, `SAVEPOINT`
- Understand MVCC at a conceptual level — readers never block writers and writers never block readers, because each transaction sees a consistent snapshot rather than acquiring read locks

**Checkpoint:** can you explain why `TIMESTAMPTZ` is almost always the right choice over plain `TIMESTAMP`, even for a single-timezone application? (`TIMESTAMP` silently drops timezone information, which becomes a real bug the moment the server, a client, or a future deployment region uses a different timezone.)

## Phase 2: Indexing, JSONB, and Query Performance (Week 3-4)

- `EXPLAIN` and `EXPLAIN ANALYZE` — the difference matters: `EXPLAIN` shows the planned execution, `EXPLAIN ANALYZE` actually runs the query and shows real timings alongside the plan
- Index types beyond B-tree: `GIN` (JSONB, full-text, arrays), `GiST` (geometric/range types, also used by PostGIS), `BRIN` (huge, naturally-ordered tables like time-series logs), partial indexes, expression indexes
- JSONB querying and indexing: `@>` containment, `->`/`->>` extraction, and when a `GIN` index on a JSONB column actually gets used vs. skipped
- Complete a hands-on project: design a schema using JSONB for a genuinely semi-structured field (e.g. product attributes), then measure query performance with and without a GIN index

**Checkpoint:** given a slow query with `EXPLAIN ANALYZE` showing a sequential scan on a large table, what's your first diagnostic question — is a usable index missing, or does one exist but the planner isn't choosing it (and why might that be)?

## Phase 3: MVCC, Vacuum, and Operational Reality (Week 5-6)

- **This is the single most distinctive PostgreSQL topic and the one most tutorials skip.** MVCC means `UPDATE`/`DELETE` don't actually remove old row versions immediately — they mark them dead, and `VACUUM` is what reclaims that space
- Autovacuum tuning — understand why a table with heavy `UPDATE` churn and default autovacuum settings can bloat significantly, and what symptoms that produces (slower queries, larger table size than the data justifies)
- Isolation levels and what PostgreSQL actually defaults to (`READ COMMITTED`) vs. what `SERIALIZABLE` guarantees and costs
- Backup/restore with `pg_dump`/`pg_restore`, and understand replication basics (streaming replication, WAL shipping) even if you don't set up a full cluster

**Checkpoint:** can you explain, in your own words, why a PostgreSQL table that's had millions of rows deleted might still be nearly the same size on disk until `VACUUM` (or `VACUUM FULL`) runs? If this is unclear, spend more time here — it's a real production issue people hit and a common interview topic specifically because it's PostgreSQL-distinctive (MySQL/InnoDB doesn't work this way).

## Phase 4: Extensions, Scaling, and Interview Readiness (Week 7-8)

- Know what at least one or two major extensions actually do and when they're warranted: PostGIS (geospatial), `pg_vector`/`pgvector` (embeddings/similarity search), `TimescaleDB` (time-series) — you don't need deep expertise in all of them, but you should recognize the problem each solves
- Connection pooling with PgBouncer — understand why PostgreSQL's per-connection process model makes a pooler more important here than in some other databases
- Table partitioning for large time-series or naturally-partitionable data
- Review this course's Interview Q&A material and practice explaining MVCC, isolation levels, and index type tradeoffs out loud, not just recognizing them when reading

## Common Pitfalls Specific to PostgreSQL (Not Generic Study Advice)

- **Ignoring autovacuum until bloat becomes a production problem** — the stronger habit is understanding vacuum behavior from the start, not treating it as an advanced/optional topic
- **Defaulting to B-tree indexes for everything** — a JSONB column needs a GIN index to be efficiently queryable; a B-tree index on it won't help most JSONB queries
- **Using `TIMESTAMP` instead of `TIMESTAMPTZ` by habit** — this is one of the most common "worked fine in dev, broke across timezones in production" bugs
- **Assuming `SELECT COUNT(*)` is cheap** — unlike MyISAM's stored row count, PostgreSQL (like InnoDB) has to actually count matching rows under MVCC, which can be slow on large tables

## Getting Your First PostgreSQL-Heavy Role

1. **Portfolio:** projects that specifically show PostgreSQL-distinctive skills (JSONB modeling, GIN/GiST indexing, understanding vacuum/bloat), not just generic CRUD that would look identical on any relational database
2. **Resume:** be specific — "diagnosed table bloat caused by autovacuum misconfiguration, reducing table size by 40% after manual VACUUM FULL" is far stronger than "experience with PostgreSQL"
3. **Know the ecosystem, not just the core database:** PgBouncer, and at least a passing familiarity with any extensions relevant to the roles you're targeting (PostGIS for location-heavy products, pgvector for AI/RAG-adjacent roles)
4. **Interview prep:** MVCC and isolation levels come up constantly in PostgreSQL-specific interviews precisely because they distinguish real experience from tutorial-level familiarity
