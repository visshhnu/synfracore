# Database Performance Tuning — Quick Reference

## Query plan reading — key terms

| Term | Meaning |
|---|---|
| Seq Scan | Full table scan — usually means a missing/unusable index |
| Index Scan | Uses an index, then fetches the row from the table |
| Index Only Scan | Satisfies the query entirely from the index — no table fetch needed |
| Bitmap Heap Scan | Good for range queries matching a moderate row count |
| Nested Loop | Fine if the inner side is small; bad if it's large |
| Hash Join | Generally fine for large datasets |
| `Rows Removed by Filter` | High value = the index/scan found far more rows than needed — a red flag |

## Finding slow queries

```sql
-- PostgreSQL — top queries by average execution time
SELECT query, calls, round(total_exec_time::numeric / calls, 2) AS avg_ms
FROM pg_stat_statements ORDER BY avg_ms DESC LIMIT 20;

-- MySQL — enable slow query log
SET GLOBAL slow_query_log = 'ON';
SET GLOBAL long_query_time = 1;
```

## Index diagnostics

```sql
-- Tables with heavy sequential scanning (candidates for a new index)
SELECT relname, seq_scan, seq_tup_read
FROM pg_stat_user_tables WHERE seq_scan > 100 ORDER BY seq_tup_read DESC;

-- Unused indexes (wasted write cost, candidates for removal)
SELECT indexrelname, idx_scan, pg_size_pretty(pg_relation_size(indexrelid))
FROM pg_stat_user_indexes WHERE idx_scan < 10 ORDER BY pg_relation_size(indexrelid) DESC;

-- Create an index without locking writes
CREATE INDEX CONCURRENTLY idx_name ON table_name(column_name);

-- Refresh planner statistics after a large data change
ANALYZE table_name;
```

## Bloat / autovacuum diagnostics

```sql
-- Dead tuple ratio per table
SELECT relname, n_live_tup, n_dead_tup,
       round(n_dead_tup::numeric / NULLIF(n_live_tup + n_dead_tup, 0) * 100, 1) AS dead_pct
FROM pg_stat_user_tables ORDER BY dead_pct DESC;
```

## Lock/deadlock diagnostics

```sql
-- Currently blocked queries and what's blocking them
SELECT blocked_locks.pid AS blocked_pid, blocking_locks.pid AS blocking_pid,
       blocked_activity.query AS blocked_query
FROM pg_catalog.pg_locks blocked_locks
JOIN pg_catalog.pg_stat_activity blocked_activity ON blocked_activity.pid = blocked_locks.pid
JOIN pg_catalog.pg_locks blocking_locks ON blocking_locks.locktype = blocked_locks.locktype
    AND blocking_locks.pid != blocked_locks.pid
JOIN pg_catalog.pg_stat_activity blocking_activity ON blocking_activity.pid = blocking_locks.pid
WHERE NOT blocked_locks.granted;
```

## Query rewrite patterns

```sql
-- Correlated subquery (slow) → JOIN + GROUP BY (fast)
-- IN (subquery) (can be slow) → EXISTS (stops at first match)
-- LIKE '%term%' (can't use index) → full-text search (to_tsvector/to_tsquery)
```

## Key postgresql.conf settings

```ini
shared_buffers = 25%           # of total RAM
effective_cache_size = 75%     # of total RAM
work_mem = 64MB                # per sort/hash op, per connection
maintenance_work_mem = 512MB   # for VACUUM, CREATE INDEX
random_page_cost = 1.1         # for SSD (default 4.0 assumes spinning disk)
max_connections = 200          # use PgBouncer beyond this
autovacuum_vacuum_scale_factor = 0.05   # lower for high-write tables (default 0.2)
```

## The tuning hierarchy

```
1. Schema design       (hardest to change later)
2. Query optimization  (EXPLAIN ANALYZE first, always)
3. Index strategy      (usually the highest-impact quick win)
4. Configuration       (memory, connections, autovacuum)
5. Hardware/infra      (last resort, not the first instinct)
```
