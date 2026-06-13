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

## MySQL 8.0 Features

```sql
-- Window functions (MySQL 8.0+)
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

-- Check constraints (MySQL 8.0.16+)
ALTER TABLE products
ADD CONSTRAINT chk_price CHECK (price > 0 AND price < 1000000);
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

-- Check replication health
SHOW SLAVE STATUS\G
-- Key fields:
-- Slave_IO_Running: Yes
-- Slave_SQL_Running: Yes
-- Seconds_Behind_Master: 0 (or low)
-- Last_Error: (should be empty)

-- Simulate replication lag detection
SELECT TIMESTAMPDIFF(SECOND,
    MAX(ts), NOW()) AS seconds_behind
FROM heartbeat;  -- With pt-heartbeat
```
