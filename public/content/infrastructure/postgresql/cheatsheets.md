# PostgreSQL Quick Reference

## Connection & Admin
```bash
psql -U postgres -d mydb               # Local connect
psql "postgresql://user:pass@host/db"  # URI connect
pg_dump mydb > backup.sql              # Backup
pg_dump -Fc mydb > backup.dump         # Custom format (compressed)
pg_restore -d mydb backup.dump         # Restore from custom format
psql -c "SELECT version();"            # One-shot query
```

## psql Commands
```sql
\l                    -- List databases
\c dbname             -- Connect to database
\dt                   -- List tables
\d tablename          -- Describe table
\di                   -- List indexes
\du                   -- List roles/users
\timing               -- Show query timing
\x                    -- Expanded output (vertical)
\e                    -- Open editor for query
\i file.sql           -- Execute SQL file
\q                    -- Quit
```

## Essential SQL
```sql
-- Create
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    email VARCHAR(255) UNIQUE NOT NULL,
    name TEXT,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Insert
INSERT INTO users (email, name) VALUES ('a@b.com', 'Alice')
  RETURNING id, created_at;                        -- Return inserted values

-- Upsert
INSERT INTO users (email, name) VALUES ('a@b.com', 'Alice')
  ON CONFLICT (email) DO UPDATE SET name = EXCLUDED.name;

-- Window functions
SELECT name, salary,
  RANK() OVER (PARTITION BY dept ORDER BY salary DESC) as rank,
  SUM(salary) OVER (PARTITION BY dept) as dept_total
FROM employees;

-- CTE
WITH top_customers AS (
  SELECT user_id, SUM(amount) as total FROM orders GROUP BY user_id
  ORDER BY total DESC LIMIT 100
)
SELECT u.name, tc.total FROM users u JOIN top_customers tc ON u.id = tc.user_id;

-- JSONB
SELECT data->>'name' FROM products WHERE data->'price' > '100';
SELECT * FROM products WHERE data @> '{"category": "laptop"}';
```

## Indexes
```sql
CREATE INDEX idx_email ON users(email);
CREATE UNIQUE INDEX idx_unique_email ON users(email);
CREATE INDEX idx_active ON users(email) WHERE active = true;  -- Partial
CREATE INDEX idx_lower ON users(lower(email));                 -- Expression
CREATE INDEX idx_data ON events USING GIN(metadata);          -- JSONB/Array
CREATE INDEX idx_name ON users USING GIN(name gin_trgm_ops);  -- Fuzzy search
EXPLAIN ANALYZE SELECT * FROM users WHERE email = 'a@b.com';
-- Look for: Index Scan (good) vs Seq Scan (add index)
```

## Maintenance
```sql
VACUUM ANALYZE users;               -- Reclaim space + update stats
VACUUM FULL users;                  -- Full rewrite (locks table)
REINDEX TABLE users;                -- Rebuild all indexes
SELECT * FROM pg_stat_user_tables;  -- Table stats (bloat, autovacuum)
SELECT * FROM pg_stat_statements ORDER BY total_exec_time DESC LIMIT 10;
-- Find slowest queries (requires pg_stat_statements extension)
```

## Revision Notes
```
\d table: describe | \dt: list tables | \timing: show execution time
RETURNING: get auto-generated values after INSERT/UPDATE
ON CONFLICT: upsert (insert or update on duplicate key)
WINDOW: RANK/SUM/LAG OVER (PARTITION BY ... ORDER BY ...)
CTE: WITH clause for named subqueries
PARTIAL INDEX: WHERE clause = smaller, faster index
GIN: for JSONB (@>), arrays, full-text search
EXPLAIN ANALYZE: actual run time + row counts (not just estimates)
```
