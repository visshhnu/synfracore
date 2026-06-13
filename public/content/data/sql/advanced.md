# SQL — Advanced Topics

## Recursive Queries and Graphs

```sql
-- Find all paths in a graph (network topology, dependencies)
WITH RECURSIVE paths AS (
    -- Start from each node
    SELECT source, target, 
           ARRAY[source, target] AS path,
           1 AS depth
    FROM edges

    UNION ALL

    -- Extend path
    SELECT p.source, e.target,
           p.path || e.target,
           p.depth + 1
    FROM paths p
    JOIN edges e ON p.target = e.source
    WHERE e.target <> ALL(p.path)  -- Prevent cycles
      AND p.depth < 10
)
SELECT source, target, path, depth
FROM paths
WHERE target = 'destination_node';

-- Topological sort (for dependency resolution)
WITH RECURSIVE sorted AS (
    SELECT id, name, 0 AS level
    FROM tasks
    WHERE NOT EXISTS (
        SELECT 1 FROM dependencies WHERE depends_on = tasks.id
    )
    UNION ALL
    SELECT t.id, t.name, s.level + 1
    FROM tasks t
    JOIN dependencies d ON d.task_id = t.id
    JOIN sorted s ON s.id = d.depends_on
)
SELECT DISTINCT ON (id) id, name, MAX(level) OVER (PARTITION BY id) AS min_level
FROM sorted ORDER BY id, level DESC;
```

## Performance at Scale

```sql
-- Partial aggregation (push down to partition level)
-- Instead of scanning billions of rows, scan partitions
SELECT DATE_TRUNC('day', created_at) AS day, SUM(amount) AS daily_total
FROM orders
WHERE created_at >= NOW() - INTERVAL '30 days'
  AND status = 'completed'
GROUP BY 1
ORDER BY 1;

-- Partition pruning: only scans last 30 days partitions
-- Requires: PARTITION BY RANGE (created_at) with monthly partitions

-- Covering index (all needed columns in index — no table lookup)
CREATE INDEX idx_orders_user_covering ON orders(user_id, status)
INCLUDE (id, total, created_at);

-- This query uses index only scan:
SELECT id, total, created_at
FROM orders
WHERE user_id = $1 AND status = 'pending';

-- BRIN index for append-only time-series (tiny, fast for range scans)
CREATE INDEX idx_logs_time ON logs USING BRIN (created_at)
WITH (pages_per_range = 128);

-- Explain plan reading guide
EXPLAIN (ANALYZE, BUFFERS, FORMAT TEXT) SELECT ...;
-- -> Seq Scan (bad for large tables, fine for small)
-- -> Index Scan (good: uses index, then fetches rows)
-- -> Index Only Scan (best: all data in index, no heap fetch)
-- -> Bitmap Heap Scan (good for range queries, many rows)
-- -> Hash Join / Merge Join / Nested Loop (join strategies)
-- Buffers: hit=N (from cache), read=N (from disk)
```

## SQL Cheatsheet

```sql
-- ── WINDOW FUNCTIONS ─────────────────────────────────────
ROW_NUMBER() OVER (PARTITION BY dept ORDER BY salary DESC)
RANK() / DENSE_RANK()
NTILE(4) OVER (ORDER BY salary)          -- Quartile
SUM(n) OVER (PARTITION BY dept ORDER BY date ROWS UNBOUNDED PRECEDING)
AVG(n) OVER (ORDER BY date ROWS 6 PRECEDING)  -- 7-day moving avg
LAG(n,1,0) / LEAD(n,1,0) OVER (ORDER BY date)
FIRST_VALUE(n) / LAST_VALUE(n) OVER (ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)

-- ── CTE PATTERNS ─────────────────────────────────────────
WITH data AS (...),
     aggregated AS (SELECT ... FROM data GROUP BY ...),
     ranked AS (SELECT *, RANK() OVER (...) AS r FROM aggregated)
SELECT * FROM ranked WHERE r <= 10;

-- Recursive CTE
WITH RECURSIVE tree AS (
    SELECT id, name, parent_id, 0 AS depth FROM nodes WHERE parent_id IS NULL
    UNION ALL
    SELECT n.id, n.name, n.parent_id, t.depth+1 FROM nodes n JOIN tree t ON n.parent_id=t.id
)

-- ── CONDITIONAL AGGREGATION ───────────────────────────────
COUNT(*) FILTER (WHERE status='paid')       -- PostgreSQL
SUM(CASE WHEN region='N' THEN sales END)    -- Standard SQL
AVG(CASE WHEN active THEN score END)
COUNT(DISTINCT CASE WHEN year=2024 THEN user_id END)

-- ── ADVANCED JOINS ────────────────────────────────────────
-- LATERAL (correlated subquery in FROM)
FROM users u, LATERAL (
    SELECT * FROM orders WHERE user_id=u.id ORDER BY created_at DESC LIMIT 3
) recent_orders

-- Self-join
FROM employees e LEFT JOIN employees m ON e.manager_id=m.id

-- Semi/anti join
WHERE EXISTS (SELECT 1 FROM orders WHERE user_id=u.id)
WHERE NOT EXISTS (SELECT 1 FROM orders WHERE user_id=u.id AND status='paid')

-- ── UPSERT PATTERNS ───────────────────────────────────────
INSERT INTO t (id,val) VALUES ($1,$2)
ON CONFLICT (id) DO UPDATE SET val=EXCLUDED.val, updated_at=NOW();

-- ── DATE OPERATIONS ───────────────────────────────────────
DATE_TRUNC('month', created_at)
EXTRACT(dow FROM created_at)          -- 0=Sunday
NOW() - INTERVAL '30 days'
GENERATE_SERIES(start, end, step)
AGE(timestamp1, timestamp2)
```
