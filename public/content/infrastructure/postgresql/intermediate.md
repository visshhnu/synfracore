# PostgreSQL Intermediate Topics

## MVCC and VACUUM

PostgreSQL uses MVCC (Multi-Version Concurrency Control): readers never block writers.

Each row has `xmin` (inserted by transaction) and `xmax` (deleted/updated by transaction). Old versions accumulate — VACUUM cleans them.

```sql
-- Check autovacuum health
SELECT schemaname, tablename, n_live_tup, n_dead_tup,
       last_autovacuum, last_autoanalyze
FROM pg_stat_user_tables
ORDER BY n_dead_tup DESC;

-- Manual vacuum (reclaim dead rows, update statistics)
VACUUM ANALYZE orders;

-- VACUUM FULL (rewrites table — avoid in production, use pg_repack)
-- Use only during maintenance window — locks table

-- Prevent transaction ID wraparound (critical!)
-- autovacuum handles this, but monitor age
SELECT datname, age(datfrozenxid) as xid_age FROM pg_database;
-- If age > 1.5 billion → emergency VACUUM FREEZE
```

## Advanced Queries

```sql
-- Recursive CTE (tree traversal)
WITH RECURSIVE tree AS (
  SELECT id, name, parent_id, 0 AS depth
  FROM categories WHERE parent_id IS NULL
  UNION ALL
  SELECT c.id, c.name, c.parent_id, t.depth + 1
  FROM categories c JOIN tree t ON c.parent_id = t.id
)
SELECT * FROM tree ORDER BY depth, name;

-- Lateral join (correlated subquery per row)
SELECT u.name, recent.title
FROM users u
CROSS JOIN LATERAL (
  SELECT title FROM articles WHERE user_id = u.id
  ORDER BY created_at DESC LIMIT 3
) recent;

-- Arrays
SELECT ARRAY[1,2,3] || ARRAY[4,5];             -- [1,2,3,4,5]
SELECT unnest(ARRAY['a','b','c']);              -- Expand to rows
SELECT array_agg(name ORDER BY name) FROM users;  -- Aggregate to array

-- JSONB operations
SELECT data || '{"active": true}'::jsonb;       -- Merge JSONB
SELECT data - 'password';                       -- Remove key
SELECT jsonb_each(data) FROM products LIMIT 5;  -- Expand to rows
SELECT jsonb_array_elements(data->'items') FROM orders;  -- Expand array
```

## Roles and Permissions

```sql
-- Create roles
CREATE ROLE readonly;
GRANT CONNECT ON DATABASE mydb TO readonly;
GRANT USAGE ON SCHEMA public TO readonly;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO readonly;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT ON TABLES TO readonly;

-- Create users and assign roles
CREATE USER alice WITH PASSWORD 'secret';
GRANT readonly TO alice;

-- Row-level security
ALTER TABLE orders ENABLE ROW LEVEL SECURITY;
CREATE POLICY user_orders ON orders
  USING (user_id = current_user::INT);  -- Each user sees only their rows
```

## Connection Pooling with PgBouncer

```ini
# pgbouncer.ini
[databases]
mydb = host=localhost dbname=mydb

[pgbouncer]
pool_mode = transaction          # transaction or session
max_client_conn = 1000           # Total frontend connections
default_pool_size = 25           # Backend connections per DB/user
min_pool_size = 5
server_idle_timeout = 600
```

**Why PgBouncer?** PostgreSQL creates a new process per connection (~5MB RAM each). 1000 connections = 5GB RAM just for connection overhead. PgBouncer multiplexes many client connections into few server connections.

## Revision Notes
```
MVCC: each row has xmin/xmax version stamps. Old versions cleaned by VACUUM.
AUTOVACUUM: runs automatically — never disable. Monitor n_dead_tup.
VACUUM FULL: rewrites table (locks). Use pg_repack for live repack.

RECURSIVE CTE: WITH RECURSIVE + base case UNION ALL recursive case
LATERAL: correlated subquery that runs per row (like FOR EACH)
ARRAYS: unnest(), array_agg(), || (concat), @> (contains)
JSONB: || (merge), - (remove key), @> (contains), jsonb_each()

ROLES: separate privileges from users. GRANT role TO user.
RLS: row-level security — users see only their rows

PGBOUNCER: connection pooling. Transaction mode = most efficient.
1000 clients → 25 real DB connections. Massive RAM saving.
```
