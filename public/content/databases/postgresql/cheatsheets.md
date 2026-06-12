# PostgreSQL — Cheatsheet

## psql Commands

```bash
# Connect
psql -h host -U user -d database -p 5432
psql "postgresql://user:pass@host:5432/db"

# Inside psql
\l          List databases
\c db       Connect to database
\dt         List tables
\dt+        List tables with sizes
\d table    Describe table
\d+ table   Detailed table info
\di         List indexes
\df         List functions
\dv         List views
\dn         List schemas
\timing     Toggle query timing
\x          Toggle expanded output
\e          Open $EDITOR for query
\i file.sql Execute SQL file
\copy       Import/export CSV
\q          Quit
```

## Essential SQL Quick Reference

```sql
-- Upsert
INSERT INTO t (id, name) VALUES (1, 'Alice')
ON CONFLICT (id) DO UPDATE SET name = EXCLUDED.name;

-- RETURNING
INSERT INTO orders (user_id, total) VALUES (1, 99.99)
RETURNING id, created_at;

UPDATE users SET active = false WHERE last_login < NOW() - INTERVAL '90 days'
RETURNING id, email;

-- Window functions
SELECT *, 
  ROW_NUMBER() OVER (PARTITION BY dept ORDER BY salary DESC) AS rank,
  SUM(salary) OVER (PARTITION BY dept) AS dept_total,
  LAG(salary) OVER (ORDER BY hire_date) AS prev_salary
FROM employees;

-- CTE
WITH ranked AS (
  SELECT *, RANK() OVER (ORDER BY score DESC) AS rank
  FROM scores
)
SELECT * FROM ranked WHERE rank <= 10;

-- JSONB
SELECT data->>'name', data->'address'->>'city'
FROM records WHERE data @> '{"active": true}';

-- Array
SELECT * FROM posts WHERE 'python' = ANY(tags);
SELECT unnest(tags) AS tag, COUNT(*) FROM posts GROUP BY 1;

-- Full text
SELECT * FROM articles
WHERE to_tsvector('english', title || ' ' || body)
   @@ plainto_tsquery('english', 'kubernetes deployment');

-- Generate series
SELECT generate_series(1, 10);
SELECT generate_series(NOW()::date, NOW()::date + 7, '1 day'::interval);
```

## Index Types

```sql
-- B-tree (default) — equality, range, ORDER BY
CREATE INDEX idx ON orders (user_id, created_at DESC);

-- Partial — only index subset
CREATE INDEX idx_pending ON orders (user_id) WHERE status = 'pending';

-- GIN — arrays, JSONB, full-text
CREATE INDEX idx_tags ON posts USING GIN (tags);
CREATE INDEX idx_meta ON users USING GIN (metadata);
CREATE INDEX idx_fts ON articles USING GIN (
  to_tsvector('english', title || ' ' || body)
);

-- BRIN — very large time-series tables
CREATE INDEX idx_logs_time ON logs USING BRIN (created_at);

-- Expression index
CREATE INDEX idx_lower_email ON users (LOWER(email));
-- Now queries: WHERE LOWER(email) = 'alice@example.com' use index
```

## Performance Queries

```sql
-- Slow queries (requires pg_stat_statements)
SELECT query, calls, mean_exec_time::int AS avg_ms, total_exec_time::int AS total_ms
FROM pg_stat_statements ORDER BY mean_exec_time DESC LIMIT 20;

-- Table sizes
SELECT tablename,
  pg_size_pretty(pg_total_relation_size(tablename::regclass)) AS total,
  pg_size_pretty(pg_indexes_size(tablename::regclass)) AS indexes
FROM pg_tables WHERE schemaname = 'public'
ORDER BY pg_total_relation_size(tablename::regclass) DESC;

-- Unused indexes
SELECT indexname, idx_scan FROM pg_stat_user_indexes
WHERE idx_scan = 0 AND indexname NOT LIKE '%pkey%';

-- Cache hit ratio (should be > 99%)
SELECT sum(heap_blks_hit) / (sum(heap_blks_hit) + sum(heap_blks_read)) AS ratio
FROM pg_statio_user_tables;

-- Long running queries
SELECT pid, now() - query_start AS duration, query, state
FROM pg_stat_activity
WHERE state != 'idle' AND (now() - query_start) > interval '30 seconds'
ORDER BY duration DESC;

-- Kill a query
SELECT pg_terminate_backend(pid);
```
