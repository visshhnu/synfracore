# Database Performance Tuning — Overview

**Before you start:** basic SQL and comfort writing JOIN queries are assumed — see the SQL Mastery course first if that's new. No prior performance-tuning experience is required.

## Why Performance Tuning?

A poorly performing database is the #1 cause of application latency. A query that takes 10 seconds instead of 10ms degrades the entire user experience. Performance tuning addresses the root causes systematically.

## Why This Exists (The Hook)

The same query can run in 10 milliseconds or 10 seconds depending entirely on whether the database has to scan every row or can jump straight to the ones that match — and the database engine won't tell you which one is happening unless you ask it to explain itself. Performance tuning exists because "it's slow" is a symptom with many possible causes (missing index, bad schema, misconfigured memory, an N+1 query pattern in application code), and guessing at the fix without first identifying the actual cause usually wastes effort on something that wasn't the real problem.

**Analogy** — Think of a slow query like a doctor's visit for chest pain. A bad doctor guesses — maybe it's stress, try relaxing — without ever running a test. A good doctor runs diagnostics first (an EKG, blood work) to see exactly what's happening before prescribing anything. `EXPLAIN ANALYZE` is the database's EKG: it shows you exactly what the query actually did — which tables were scanned in full, which indexes were used, where the time actually went — so the fix targets the real cause instead of a guess.

**Try it (2 minutes)** — Reason through why the tuning hierarchy below goes in that specific order, without running anything: fixing a bad schema design after millions of rows already exist requires a risky migration; adding the right index usually takes seconds and can be done live. If you found a slow query today, would it make more sense to first check whether an index is missing, or to first consider redesigning the table's schema? Now flip the question: why is schema design still listed *first* in the hierarchy, if index fixes are so much cheaper to apply later?

## The Tuning Hierarchy (Top to Bottom)

```flow
{
  "layout": "flow",
  "steps": [
    { "label": "Schema Design", "sublabel": "Hardest to change later -- get right upfront", "color": "blue" },
    { "label": "Query Optimization", "sublabel": "EXPLAIN ANALYZE -- always start here", "color": "purple" },
    { "label": "Index Strategy", "sublabel": "Most impactful quick win", "color": "amber" },
    { "label": "DB Configuration", "sublabel": "Memory, connections, autovacuum", "color": "green" },
    { "label": "Hardware", "sublabel": "Last resort", "color": "slate" }
  ]
}
```

```
1. Schema design (hardest to change later — get right upfront)
2. Query optimization (EXPLAIN ANALYZE — always start here)
3. Index strategy (most impactful quick win)
4. Database configuration (memory, connections, autovacuum)
5. Hardware / infrastructure (last resort)
```

---

## Step 1: Find the Slow Queries

```sql
-- PostgreSQL: Enable slow query logging
ALTER SYSTEM SET log_min_duration_statement = '1000';  -- log queries > 1s
SELECT pg_reload_conf();

-- Find worst queries using pg_stat_statements
SELECT query,
       calls,
       round(total_exec_time::numeric / calls, 2) AS avg_ms,
       round(total_exec_time::numeric, 2) AS total_ms,
       rows / calls AS avg_rows
FROM pg_stat_statements
ORDER BY avg_ms DESC
LIMIT 20;

-- MySQL: Enable slow query log
SET GLOBAL slow_query_log = 'ON';
SET GLOBAL long_query_time = 1;  -- seconds
-- Then check: /var/log/mysql/slow-query.log
```

---

## Step 2: EXPLAIN ANALYZE — Read the Query Plan

```sql
EXPLAIN (ANALYZE, BUFFERS, FORMAT TEXT)
SELECT o.order_id, c.name, SUM(oi.price)
FROM orders o
JOIN customers c ON o.customer_id = c.id
JOIN order_items oi ON o.order_id = oi.order_id
WHERE o.created_at > NOW() - INTERVAL '30 days'
GROUP BY o.order_id, c.name;
```

**What to look for:**

```conceptgrid
{
  "boxes": [
    { "title": "Seq Scan", "description": "Sequential scan -- full table read, usually needs an index", "color": "red" },
    { "title": "Index Scan", "description": "Good -- for selective queries", "color": "green" },
    { "title": "Hash Join", "description": "OK for large datasets", "color": "blue" },
    { "title": "Nested Loop", "description": "Great if the inner side is small, bad if large", "color": "amber" }
  ]
}
```

```
Seq Scan → Sequential scan (full table read) → needs an index
Index Scan → Good for selective queries
Bitmap Heap Scan → Good for range queries
Hash Join → OK for large datasets
Nested Loop → Great if inner side is small, bad if large
Sort (cost=9999) → High sort cost — add ORDER BY index or reduce rows before sort

Buffers: shared hit=1000 read=50000 → reading 50K blocks from disk (bad)
vs shared hit=50000 read=0 → all in cache (good)
```

---

## Step 3: Index Optimization

```sql
-- Find missing indexes (tables with many sequential scans)
SELECT schemaname, tablename, seq_scan, seq_tup_read,
       idx_scan, idx_tup_fetch,
       seq_tup_read / NULLIF(seq_scan, 0) AS avg_seq_rows
FROM pg_stat_user_tables
WHERE seq_scan > 100
ORDER BY seq_tup_read DESC;

-- Find unused indexes (wasting write performance)
SELECT indexrelname, idx_scan, pg_size_pretty(pg_relation_size(indexrelid))
FROM pg_stat_user_indexes
WHERE idx_scan < 10
  AND indexrelname NOT LIKE 'pg_%'
ORDER BY pg_relation_size(indexrelid) DESC;

-- Create index without locking writes
CREATE INDEX CONCURRENTLY idx_orders_created ON orders(created_at DESC);
```

---

## Step 4: Query Rewriting Patterns

```sql
-- SLOW: Correlated subquery (runs once per row)
SELECT * FROM orders o
WHERE (SELECT COUNT(*) FROM order_items oi WHERE oi.order_id = o.order_id) > 5;

-- FAST: JOIN + GROUP BY
SELECT o.* FROM orders o
JOIN (SELECT order_id, COUNT(*) as item_count 
      FROM order_items GROUP BY order_id HAVING COUNT(*) > 5) big
ON o.order_id = big.order_id;

-- SLOW: IN with subquery (may scan full subquery per row)
SELECT * FROM customers WHERE id IN (SELECT customer_id FROM orders WHERE status = 'vip');

-- FAST: EXISTS (stops at first match)
SELECT * FROM customers c WHERE EXISTS (
    SELECT 1 FROM orders o WHERE o.customer_id = c.id AND o.status = 'vip'
);

-- SLOW: Wildcard at start (can't use index)
SELECT * FROM products WHERE name LIKE '%widget%';

-- FAST: Full-text search instead
SELECT * FROM products WHERE to_tsvector('english', name) @@ to_tsquery('widget');
```

---

## Step 5: Configuration Tuning (PostgreSQL)

```ini
# postgresql.conf — key settings

# Memory (tune to your server RAM)
shared_buffers = 25%           # of total RAM (e.g., 8GB server → 2GB)
effective_cache_size = 75%     # tell planner how much RAM is available for caching
work_mem = 64MB                # per sort/hash operation (per connection × ops!)
maintenance_work_mem = 512MB   # for VACUUM, CREATE INDEX

# Checkpoint (write performance)
checkpoint_completion_target = 0.9
wal_buffers = 64MB

# Connections
max_connections = 200          # use PgBouncer for >200 app connections

# Query planner
random_page_cost = 1.1         # for SSD (default 4.0 is for spinning disk)
effective_io_concurrency = 200 # for SSD (parallelism)
```

---

## N+1 Query Problem (Application Layer)

```python
# BAD: N+1 — 1 query for orders + N queries for each customer
orders = session.query(Order).all()
for order in orders:
    print(order.customer.name)  # 1 SQL per order!

# GOOD: Eager loading — 2 queries total
orders = session.query(Order).options(joinedload(Order.customer)).all()
for order in orders:
    print(order.customer.name)  # already loaded
```
