# PostgreSQL — Fundamentals

## Connect and Basic Operations

```bash
# Connect
psql -h localhost -U postgres -d mydb
psql "postgresql://user:pass@localhost:5432/mydb"

# Inside psql
\l          -- List databases
\c mydb     -- Connect to database
\dt         -- List tables
\d users    -- Describe table
\timing     -- Show query execution time
\x          -- Toggle expanded display
\e          -- Open editor for query
\q          -- Quit
```

## Data Types

```sql
-- Common types
INTEGER, BIGINT, SMALLINT          -- Whole numbers
NUMERIC(10,2), DECIMAL             -- Exact decimal (money)
REAL, DOUBLE PRECISION             -- Floating point
TEXT, VARCHAR(n), CHAR(n)          -- Strings
BOOLEAN                            -- true/false
DATE, TIME, TIMESTAMP, TIMESTAMPTZ -- Date/time
UUID                               -- Universally unique identifier
JSONB                              -- Binary JSON (indexed, fast)
ARRAY                              -- e.g., TEXT[], INTEGER[]
SERIAL, BIGSERIAL                  -- Auto-increment (legacy)

-- Modern: use IDENTITY instead of SERIAL
CREATE TABLE users (
    id          BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    email       TEXT NOT NULL UNIQUE,
    name        TEXT NOT NULL,
    created_at  TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    metadata    JSONB DEFAULT '{}',
    tags        TEXT[] DEFAULT '{}'
);
```

## Essential SQL Patterns

```sql
-- Upsert (INSERT or UPDATE)
INSERT INTO users (email, name)
VALUES ('alice@example.com', 'Alice')
ON CONFLICT (email)
DO UPDATE SET
    name = EXCLUDED.name,
    updated_at = NOW();

-- Returning inserted values
INSERT INTO orders (user_id, total)
VALUES (1, 99.99)
RETURNING id, created_at;

-- Window functions (don't need GROUP BY)
SELECT
    user_id,
    order_date,
    total,
    SUM(total) OVER (PARTITION BY user_id ORDER BY order_date) AS running_total,
    RANK() OVER (PARTITION BY user_id ORDER BY total DESC) AS rank_by_amount,
    LAG(total) OVER (PARTITION BY user_id ORDER BY order_date) AS prev_order_total
FROM orders;

-- CTE (Common Table Expression)
WITH monthly_revenue AS (
    SELECT
        DATE_TRUNC('month', created_at) AS month,
        SUM(total) AS revenue
    FROM orders
    WHERE created_at > NOW() - INTERVAL '12 months'
    GROUP BY 1
),
growth AS (
    SELECT
        month,
        revenue,
        LAG(revenue) OVER (ORDER BY month) AS prev_revenue
    FROM monthly_revenue
)
SELECT
    month,
    revenue,
    ROUND((revenue - prev_revenue) / prev_revenue * 100, 2) AS growth_pct
FROM growth;

-- JSONB queries
SELECT * FROM users
WHERE metadata @> '{"plan": "enterprise"}';  -- contains

SELECT metadata->'address'->>'city' AS city
FROM users
WHERE metadata ? 'address';  -- has key

-- Array operations
SELECT * FROM posts WHERE 'python' = ANY(tags);
SELECT * FROM posts WHERE tags @> ARRAY['python', 'devops'];
```

## Indexes

```sql
-- B-tree (default) — for equality and range queries
CREATE INDEX idx_orders_user_id ON orders(user_id);
CREATE INDEX idx_orders_created ON orders(created_at DESC);

-- Partial index — only index rows matching condition
CREATE INDEX idx_orders_pending ON orders(user_id)
WHERE status = 'pending';  -- Only indexes pending orders — much smaller

-- Composite index — order matters (leftmost prefix rule)
CREATE INDEX idx_orders_user_status ON orders(user_id, status);
-- Supports: WHERE user_id = 1
-- Supports: WHERE user_id = 1 AND status = 'pending'
-- Does NOT support: WHERE status = 'pending' alone

-- JSONB GIN index — for @>, ?, @? operators
CREATE INDEX idx_users_metadata ON users USING GIN (metadata);

-- Full-text search
CREATE INDEX idx_posts_search ON posts
USING GIN (to_tsvector('english', title || ' ' || body));

SELECT * FROM posts
WHERE to_tsvector('english', title || ' ' || body) @@ to_tsquery('english', 'devops & kubernetes');

-- Check index usage
EXPLAIN ANALYZE SELECT * FROM orders WHERE user_id = 1;
-- Look for "Index Scan" (good) vs "Seq Scan" (full table scan)
```

## Performance

```sql
-- Slow query log: find queries over 1 second
ALTER SYSTEM SET log_min_duration_statement = 1000;
SELECT pg_reload_conf();

-- See running queries
SELECT pid, now() - pg_stat_activity.query_start AS duration,
       query, state
FROM pg_stat_activity
WHERE (now() - pg_stat_activity.query_start) > interval '5 minutes';

-- Kill long-running query
SELECT pg_terminate_backend(pid);

-- Index usage stats
SELECT schemaname, tablename, indexname, idx_scan, idx_tup_read
FROM pg_stat_user_indexes
ORDER BY idx_scan DESC;

-- Unused indexes (candidates for removal)
SELECT indexname, idx_scan
FROM pg_stat_user_indexes
WHERE idx_scan = 0 AND indexname NOT LIKE '%pkey%';

-- Table sizes
SELECT tablename,
       pg_size_pretty(pg_total_relation_size(tablename::regclass)) AS total
FROM pg_tables
WHERE schemaname = 'public'
ORDER BY pg_total_relation_size(tablename::regclass) DESC;

-- VACUUM and ANALYZE (maintain performance)
VACUUM ANALYZE users;   -- Manual run
-- Or configure autovacuum (usually leave at defaults)
```

## Connection Pooling with PgBouncer

```ini
# pgbouncer.ini
[databases]
myapp = host=postgres port=5432 dbname=myapp

[pgbouncer]
listen_addr = 0.0.0.0
listen_port = 5432
auth_type = md5
auth_file = /etc/pgbouncer/userlist.txt
pool_mode = transaction   # transaction pooling (most efficient)
max_client_conn = 1000
default_pool_size = 20    # Connections to PostgreSQL
```
