# Database Performance Tuning — Notes

## Core mental model

- Always measure with `EXPLAIN ANALYZE` before and after a change — never assume an index or config change helped without confirming it against the actual plan and execution time.
- The tuning hierarchy matters in order: schema → query optimization → indexes → configuration → hardware. Reaching for a bigger instance before checking for a missing index or an N+1 query is a common, expensive shortcut that masks the real problem.
- Every index speeds up reads and slows down writes — index strategy is a deliberate tradeoff based on real query patterns, not "add indexes everywhere."

## Indexing specifics

- Composite indexes only help queries filtering on a left-to-right prefix of their columns — column order is a real design decision, not arbitrary. Equality-filtered, high-selectivity columns first; range-filtered columns last.
- A covering index (`INCLUDE`) lets a query be satisfied entirely from the index (`Index Only Scan`), avoiding the extra heap-fetch step — worth it for genuinely hot queries, not applied by default everywhere.
- An index existing doesn't guarantee it's used — low selectivity, a function/type mismatch on the filtered column, or stale planner statistics (`ANALYZE` needed after a bulk change) can all cause a Seq Scan despite an index being present.

## The N+1 query problem

- The most common real-world performance bug — invisible in development with small datasets, severe in production at real data volume.
- Fixed via eager loading (`joinedload` or equivalent) — turns N+1 queries into a small, fixed number regardless of row count.

## Scaling techniques, roughly in order of operational cost

- Read replicas — real read-scaling, but async replication means replica reads can be stale; route just-written data reads back to the primary specifically.
- Query caching — valuable for expensive, infrequently-changing, frequently-requested queries; introduces deliberate staleness via TTL, wrong for anything needing immediate consistency (balances, inventory at checkout).
- Partitioning — worth it once table/index size itself (not just query selectivity) is the bottleneck; enables partition pruning and per-partition maintenance.
- Sharding — the most powerful and most operationally expensive option; genuinely the last resort, reserved for when lower-cost options are exhausted and a single instance's throughput/capacity is the confirmed remaining bottleneck.

## Locking and deadlocks

- A true deadlock is automatically detected and one transaction is rolled back — the application catching and retrying that specific error is expected, normal design, not a bug.
- What's actually worth eliminating is the underlying cause: inconsistent lock ordering across code paths that touch the same rows. Fix: always lock/update in a consistent order (e.g. by primary key ascending).
- Keep transactions short — never hold one open across a slow external call.

## Bloat and OLTP/OLAP

- MVCC means UPDATEs create new row versions; autovacuum reclaims dead ones. A high-write table on default (conservative) autovacuum settings is a common source of silent, gradually-worsening bloat — tune per-table, not just globally.
- OLTP (many small fast queries, narrow selective indexes, lock contention as the typical bottleneck) and OLAP (few large aggregation queries, columnar storage, sort/hash memory as the typical bottleneck) need fundamentally different tuning approaches — recognizing which one a workload actually is (or whether it needs to be split into two systems) is architectural, not a later tuning detail.

## Connection pooling

- Every connection costs real server-side resources even when idle — "just open more connections" doesn't scale past a real, hard `max_connections` ceiling.
- Connection pool exhaustion is rarely fixed correctly by raising the limit — check for actual connection leaks first, and check whether pool-size-per-replica × replica-count exceeds the database's real limit.
