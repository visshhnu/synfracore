# Database Performance Tuning — Advanced

## Lock contention and deadlocks: diagnosing beyond "it's slow"

A query that's technically fast on its own but frequently blocked waiting for a lock held by another transaction produces the same user-visible symptom as a genuinely slow query — but the fix is completely different, and misdiagnosing one as the other wastes real investigation time:

```sql
-- PostgreSQL: find current lock waits and what's blocking them
SELECT blocked_locks.pid AS blocked_pid,
       blocking_locks.pid AS blocking_pid,
       blocked_activity.query AS blocked_query,
       blocking_activity.query AS blocking_query
FROM pg_catalog.pg_locks blocked_locks
JOIN pg_catalog.pg_stat_activity blocked_activity ON blocked_activity.pid = blocked_locks.pid
JOIN pg_catalog.pg_locks blocking_locks ON blocking_locks.locktype = blocked_locks.locktype
    AND blocking_locks.pid != blocked_locks.pid
JOIN pg_catalog.pg_stat_activity blocking_activity ON blocking_activity.pid = blocking_locks.pid
WHERE NOT blocked_locks.granted;
```
A genuine **deadlock** (two transactions each waiting on a lock the other holds) is automatically detected and one transaction is forcibly rolled back by the database — the application needs to catch that specific error and retry, which is a normal, expected part of designing for concurrent writes, not a bug to eliminate entirely. What's worth actively minimizing is lock contention that isn't a true deadlock but still causes real queueing delay — commonly fixed by keeping transactions as short as possible (don't hold a transaction open across a slow external API call, for instance) and acquiring locks on multiple rows in a **consistent order** across every code path that touches them, which is specifically what prevents the circular-wait condition that causes deadlocks in the first place.

## Bloat and autovacuum tuning at real scale

PostgreSQL's MVCC (Multi-Version Concurrency Control) model means an `UPDATE` doesn't overwrite a row in place — it writes a new row version and marks the old one dead, to be reclaimed later by `VACUUM`. Under a high-write workload, if autovacuum can't keep up with the rate dead rows are created, **table and index bloat** accumulates — the table physically grows far beyond its logical row count, and every query (even an indexed one) has to read through more physical pages than the actual data requires:

```sql
-- Check bloat — a large gap between actual size and what row count would suggest
SELECT schemaname, relname,
       n_live_tup, n_dead_tup,
       round(n_dead_tup::numeric / NULLIF(n_live_tup + n_dead_tup, 0) * 100, 1) AS dead_pct
FROM pg_stat_user_tables
WHERE n_dead_tup > 10000
ORDER BY dead_pct DESC;
```
```ini
# postgresql.conf — tuning autovacuum for a high-write table
autovacuum_vacuum_scale_factor = 0.05   # default 0.2 is too infrequent for high-write tables
autovacuum_vacuum_cost_limit = 2000     # default 200 throttles autovacuum too aggressively
```
A high-write table using PostgreSQL's default autovacuum settings (tuned conservatively for a generic, low-write workload) is a genuinely common source of silent, gradually-worsening performance degradation — the fix isn't disabling autovacuum's throttling entirely (which can starve other workloads of I/O), it's tuning the scale factor and cost limit specifically for that table's actual write volume, often via a per-table `ALTER TABLE ... SET (autovacuum_vacuum_scale_factor = ...)` rather than a single global setting applied uniformly across very differently-loaded tables.

## OLTP vs. OLAP: fundamentally different tuning priorities

Applying OLTP (transactional) tuning instincts to an OLAP (analytical) workload, or vice versa, is a real and common mistake, because the two have genuinely different performance profiles:

| | OLTP | OLAP |
|---|---|---|
| Query pattern | Many small, fast queries (single-row lookups, small updates) | Few large, complex queries (aggregations across millions of rows) |
| Index priority | Narrow, highly selective indexes on lookup columns | Fewer indexes; often relies on columnar storage/scanning instead |
| Write pattern | Frequent, small, concurrent writes | Bulk/batch loads, infrequent |
| Common bottleneck | Lock contention, connection exhaustion | Sequential scan throughput, join order, memory for sort/hash operations |

A data warehouse workload (OLAP) genuinely benefits from a columnar storage engine (Redshift, ClickHouse, BigQuery, or PostgreSQL with a columnar extension) specifically because scanning and aggregating a few columns across billions of rows is fundamentally faster when the storage layout groups data by column rather than by row — applying that same columnar approach to an OLTP workload with frequent single-row lookups and updates would be a poor fit in the opposite direction. Recognizing which category a given workload actually falls into — and, for a genuinely mixed workload, whether it needs to be split into a separate OLTP system and OLAP data warehouse rather than tuned as one system trying to serve both patterns well — is a foundational architectural decision, not a tuning detail to adjust later.

## Sharding: the last resort, and why it's treated that way

Sharding — splitting a dataset across multiple independent database instances, each holding a subset of the data — is genuinely the most powerful scaling technique available, and also genuinely the most operationally expensive: every query that needs to span shards becomes significantly more complex (cross-shard joins, distributed transactions, or application-level query fan-out and result merging), and rebalancing data as shards grow unevenly is a real, ongoing operational burden. This is why the tuning hierarchy from the Fundamentals tab explicitly places infrastructure-level changes last — a well-chosen index, a fixed N+1 query, or a properly tuned autovacuum setting routinely delivers a larger, cheaper performance win than sharding would, and sharding is worth reaching for specifically once those lower-cost options are genuinely exhausted and a single database instance's write throughput or storage capacity is the confirmed, remaining bottleneck — not as an early architectural default.
