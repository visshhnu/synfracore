# PostgreSQL Interview Questions

## Core Concepts

**Q: PostgreSQL vs MySQL — when to choose PostgreSQL?**

**Choose PostgreSQL when:**
- Complex queries: window functions, CTEs, lateral joins, recursive queries
- Advanced data types needed: JSONB, arrays, hstore, UUID, geometric types, custom types
- Full ACID compliance with strict standards (PostgreSQL is more standards-compliant)
- Full-text search built in (`tsvector`, `tsquery`)
- Extensibility: PostGIS for geospatial, pgvector for AI embeddings, TimescaleDB for time-series
- Write-heavy workloads (MVCC handles concurrent writes better than MySQL's approach)

---

**Q: Explain MVCC in PostgreSQL.**

MVCC (Multi-Version Concurrency Control): Readers never block writers, writers never block readers.

Each row has hidden columns: `xmin` (transaction that created it) and `xmax` (transaction that deleted it).
When a row is updated, old version kept for concurrent readers, new version created.

Old versions accumulate → `VACUUM` cleans them up.
`AUTOVACUUM`: runs automatically in background. Without it, table bloat and performance degradation.

```sql
-- Check autovacuum status
SELECT schemaname, tablename, last_autovacuum, last_autoanalyze 
FROM pg_stat_user_tables;

-- Manual VACUUM
VACUUM ANALYZE orders;   -- Reclaim space, update statistics
VACUUM FULL orders;      -- Full rewrite (locks table, reclaims disk space)
```

---

**Q: PostgreSQL indexing.**

```sql
-- B-Tree (default) — equality and range
CREATE INDEX idx_user_email ON users(email);

-- Partial index — only index rows matching condition
CREATE INDEX idx_active_users ON users(email) WHERE active = true;

-- Expression index — index on computed value
CREATE INDEX idx_lower_email ON users(lower(email));
SELECT * FROM users WHERE lower(email) = 'alice@example.com';

-- GIN index — for JSONB, arrays, full-text search
CREATE INDEX idx_tags ON products USING GIN(tags);  -- Array column
CREATE INDEX idx_data ON events USING GIN(metadata JSONB_PATH_OPS);

-- BRIN (Block Range Index) — for large tables with sequential data
CREATE INDEX idx_created ON logs USING BRIN(created_at);

-- pg_trgm — fuzzy search, LIKE queries
CREATE EXTENSION pg_trgm;
CREATE INDEX idx_trgm ON products USING GIN(name gin_trgm_ops);
SELECT * FROM products WHERE name LIKE '%laptop%';  -- Uses GIN trgm index
```

---

**Q: Window functions — explain with examples.**

```sql
-- ROW_NUMBER: rank within partition
SELECT 
  name, 
  department, 
  salary,
  ROW_NUMBER() OVER (PARTITION BY department ORDER BY salary DESC) as rank
FROM employees;

-- RANK vs DENSE_RANK
-- RANK: 1,2,2,4 (skips 3 after tie)  DENSE_RANK: 1,2,2,3 (no skip)

-- Running total
SELECT 
  order_date, 
  amount,
  SUM(amount) OVER (ORDER BY order_date) as running_total
FROM orders;

-- Moving average (last 7 days)
SELECT 
  date,
  revenue,
  AVG(revenue) OVER (ORDER BY date ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) as ma7
FROM daily_revenue;

-- LAG/LEAD — access previous/next row
SELECT 
  date, 
  revenue,
  LAG(revenue, 1) OVER (ORDER BY date) as prev_day_revenue,
  revenue - LAG(revenue, 1) OVER (ORDER BY date) as day_over_day_change
FROM daily_revenue;
```

---

**Q: PostgreSQL CTEs and recursive queries.**

```sql
-- CTE (WITH clause) — named subquery
WITH top_customers AS (
  SELECT user_id, SUM(amount) as total
  FROM orders
  WHERE status = 'completed'
  GROUP BY user_id
  ORDER BY total DESC
  LIMIT 100
)
SELECT u.name, tc.total
FROM users u
JOIN top_customers tc ON u.id = tc.user_id;

-- Recursive CTE — tree traversal (org chart, categories)
WITH RECURSIVE org_tree AS (
  -- Base case: top-level manager
  SELECT id, name, manager_id, 0 as depth
  FROM employees
  WHERE manager_id IS NULL
  
  UNION ALL
  
  -- Recursive case: employees who report to current level
  SELECT e.id, e.name, e.manager_id, ot.depth + 1
  FROM employees e
  JOIN org_tree ot ON e.manager_id = ot.id
)
SELECT * FROM org_tree ORDER BY depth, name;
```

---

**Q: EXPLAIN ANALYZE and query optimisation.**

```sql
EXPLAIN ANALYZE SELECT * FROM orders WHERE user_id = 123 AND status = 'pending';

-- Output shows:
-- Seq Scan → full table scan (add index)
-- Index Scan → using index (good)
-- Hash Join / Merge Join / Nested Loop → join strategy
-- actual time: real execution time
-- rows: estimated vs actual (large difference = stale statistics → ANALYZE)

-- Optimisation checklist:
-- 1. Identify slow queries: pg_stat_statements
SELECT query, mean_exec_time, calls 
FROM pg_stat_statements ORDER BY mean_exec_time DESC LIMIT 10;

-- 2. Add missing indexes for WHERE/JOIN/ORDER BY columns
-- 3. ANALYZE table to refresh statistics
-- 4. Use connection pooling (PgBouncer)
-- 5. Partition large tables
-- 6. Consider materialized views for expensive aggregations
```

## Revision Notes
```
PostgreSQL ADVANTAGES:
JSONB, arrays, window functions, CTEs, recursive queries, full-text search
PostGIS (geospatial) | pgvector (AI) | TimescaleDB (time-series)
More standards-compliant than MySQL

MVCC: Readers never block writers. Old row versions kept, cleaned by VACUUM.
AUTOVACUUM: runs automatically. Critical for performance — never disable.

INDEXES:
B-Tree: default, equality+range | Partial: WHERE condition
Expression: computed value | GIN: JSONB, arrays, full-text | BRIN: sequential large tables
pg_trgm: fuzzy/LIKE search

WINDOW FUNCTIONS:
OVER (PARTITION BY ... ORDER BY ...): per-group computation
ROW_NUMBER/RANK/DENSE_RANK: ranking | SUM/AVG OVER: running totals
LAG/LEAD: access previous/next row

RECURSIVE CTE: WITH RECURSIVE → base case UNION ALL recursive case
Use for: tree traversal, org charts, category hierarchies

EXPLAIN ANALYZE: Seq Scan (bad) → Index Scan (good)
pg_stat_statements: identify slow queries | ANALYZE: refresh statistics
PgBouncer: connection pooling
```
