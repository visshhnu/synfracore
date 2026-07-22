# MySQL — Intermediate

## Performance Schema and Query Analysis

```sql
-- Enable slow query log
SET GLOBAL slow_query_log = 1;
SET GLOBAL long_query_time = 1;          -- Log queries > 1 second
SET GLOBAL log_queries_not_using_indexes = 1;
SHOW VARIABLES LIKE 'slow_query_log_file';

-- EXPLAIN and EXPLAIN ANALYZE
EXPLAIN SELECT u.name, COUNT(o.id)
FROM users u
LEFT JOIN orders o ON u.id = o.user_id
WHERE u.created_at > '2024-01-01'
GROUP BY u.id;

-- Key fields in output:
-- type: ALL (full scan)→range→ref→eq_ref→const (best)
-- key: NULL means no index used
-- rows: estimated rows examined
-- Extra: "Using filesort" or "Using temporary" = slow

-- pt-query-digest (Percona Toolkit) for slow log analysis
pt-query-digest /var/log/mysql/slow.log | head -50
```

## Modern MySQL Features (window functions, CTEs, JSON — standard since 8.0)

```sql
-- Window functions
SELECT
    name,
    department,
    salary,
    RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS dept_rank,
    SUM(salary) OVER (PARTITION BY department) AS dept_total
FROM employees;

-- CTEs
WITH monthly_revenue AS (
    SELECT DATE_FORMAT(created_at, '%Y-%m') AS month, SUM(total) AS revenue
    FROM orders
    WHERE status = 'completed'
    GROUP BY 1
)
SELECT month, revenue, LAG(revenue) OVER (ORDER BY month) AS prev_month
FROM monthly_revenue;

-- JSON functions
SELECT
    JSON_EXTRACT(metadata, '$.plan') AS plan,
    JSON_EXTRACT(metadata, '$.features[0]') AS first_feature
FROM users
WHERE JSON_CONTAINS(metadata, '"enterprise"', '$.tags');

-- Generated columns
ALTER TABLE orders
ADD COLUMN total_with_gst DECIMAL(10,2) AS (total * 1.18) STORED;

-- Check constraints
ALTER TABLE products
ADD CONSTRAINT chk_price CHECK (price > 0 AND price < 1000000);
```

## Indexing Strategy — Selectivity and the Leftmost-Prefix Rule

```sql
-- Composite index: leftmost prefix rule
CREATE INDEX idx_user_status_date ON orders(user_id, status, created_at);

-- Supports these WHERE clauses:
-- WHERE user_id = ?
-- WHERE user_id = ? AND status = ?
-- WHERE user_id = ? AND status = ? AND created_at > ?

-- Does NOT efficiently support (missing the leftmost column):
-- WHERE status = ?
-- WHERE user_id = ? AND created_at > ?   (skips status in the middle)

-- Index selectivity: high cardinality = better index candidate
SELECT COUNT(DISTINCT status)/COUNT(*) FROM orders;    -- low (bad index candidate)
SELECT COUNT(DISTINCT user_id)/COUNT(*) FROM orders;    -- high (good index candidate)
```

## Locking and Deadlocks

```sql
-- Row locks (InnoDB default)
SELECT * FROM accounts WHERE id = 1 FOR UPDATE;          -- Exclusive lock
SELECT * FROM accounts WHERE id = 1 LOCK IN SHARE MODE;  -- Shared lock

-- Deadlock detection is automatic: MySQL auto-rolls back the smaller transaction
SHOW ENGINE INNODB STATUS;   -- Look for LATEST DETECTED DEADLOCK section

-- Prevent deadlocks:
-- 1. Always access tables/rows in the SAME order across transactions
-- 2. Keep transactions short
-- 3. Use SELECT ... FOR UPDATE only when actually needed
-- 4. Add indexes (avoids gap locks caused by unindexed range scans)
```

## Replication Types

```sql
-- Row-based replication (recommended):
-- Replicates exact data changes
-- SET GLOBAL binlog_format = 'ROW';

-- Statement-based (legacy):
-- Replicates SQL statements (dangerous with non-deterministic functions)

-- GTID (Global Transaction IDs) - modern approach
-- Simplifies replication setup, automatic position tracking
-- my.cnf: gtid_mode=ON, enforce_gtid_consistency=ON

-- Check replication health — SHOW SLAVE STATUS was removed in the 8.4 LTS
-- release; use SHOW REPLICA STATUS (renamed starting 8.0.23)
SHOW REPLICA STATUS\G
-- Key fields:
-- Replica_IO_Running: Yes
-- Replica_SQL_Running: Yes
-- Seconds_Behind_Source: 0 (or low)
-- Last_Error: (should be empty)

-- Simulate replication lag detection
SELECT TIMESTAMPDIFF(SECOND,
    MAX(ts), NOW()) AS seconds_behind
FROM heartbeat;  -- With pt-heartbeat
```
