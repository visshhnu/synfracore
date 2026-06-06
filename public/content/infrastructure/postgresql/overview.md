# PostgreSQL — The World's Most Advanced Open Source Database

PostgreSQL (Postgres) is the #1 choice for serious backend development. It's ACID-compliant, feature-rich, and handles everything from small apps to petabyte-scale data warehouses. Understanding Postgres deeply separates good engineers from great ones.

## Why PostgreSQL?

- **ACID compliant** — every transaction is atomic, consistent, isolated, durable
- **Extensible** — custom data types, functions, operators, index methods
- **JSON support** — full document store capabilities alongside relational
- **Advanced indexing** — B-tree, Hash, GIN, GiST, BRIN, partial, expression
- **Window functions** — powerful analytics without leaving SQL
- **Full-text search** — built-in, no Elasticsearch needed for basic use
- **Replication** — streaming replication, logical replication, Patroni HA

## Installation & Connection

```bash
# Ubuntu/Debian
sudo apt install postgresql postgresql-contrib
sudo systemctl enable --now postgresql

# Connect as postgres superuser
sudo -u postgres psql

# Create database and user
sudo -u postgres createdb myapp
sudo -u postgres createuser --interactive myapp_user

# Connect to specific database
psql -h localhost -U myapp_user -d myapp
psql "postgresql://myapp_user:password@localhost:5432/myapp"

# Docker (fastest for dev)
docker run -d \
  --name postgres \
  -e POSTGRES_PASSWORD=devpassword \
  -e POSTGRES_DB=myapp \
  -p 5432:5432 \
  postgres:16-alpine
```

## Core SQL Operations

```sql
-- Create table with modern best practices
CREATE TABLE users (
    id          BIGSERIAL PRIMARY KEY,
    email       VARCHAR(255) UNIQUE NOT NULL,
    username    VARCHAR(50) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    full_name   VARCHAR(100),
    role        VARCHAR(20) DEFAULT 'user' CHECK (role IN ('user','admin','moderator')),
    is_active   BOOLEAN DEFAULT TRUE,
    metadata    JSONB DEFAULT '{}',
    created_at  TIMESTAMPTZ DEFAULT NOW(),
    updated_at  TIMESTAMPTZ DEFAULT NOW(),
    deleted_at  TIMESTAMPTZ NULL
);

-- Create table with foreign keys
CREATE TABLE posts (
    id          BIGSERIAL PRIMARY KEY,
    user_id     BIGINT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    title       VARCHAR(500) NOT NULL,
    content     TEXT,
    tags        TEXT[] DEFAULT '{}',
    view_count  INTEGER DEFAULT 0,
    published_at TIMESTAMPTZ,
    created_at  TIMESTAMPTZ DEFAULT NOW()
);

-- Create indexes (critical for performance)
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_posts_user_id ON posts(user_id);
CREATE INDEX idx_posts_created_at ON posts(created_at DESC);
CREATE INDEX idx_posts_tags ON posts USING GIN(tags);           -- Array search
CREATE INDEX idx_users_metadata ON users USING GIN(metadata);   -- JSONB search
CREATE INDEX idx_posts_active ON posts(created_at) WHERE deleted_at IS NULL;  -- Partial

-- Update trigger for updated_at
CREATE OR REPLACE FUNCTION update_updated_at()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER users_updated_at
    BEFORE UPDATE ON users
    FOR EACH ROW EXECUTE FUNCTION update_updated_at();
```

## Advanced Queries

```sql
-- Window functions
SELECT
    user_id,
    title,
    view_count,
    RANK() OVER (PARTITION BY user_id ORDER BY view_count DESC) as rank_by_user,
    SUM(view_count) OVER (PARTITION BY user_id) as user_total_views,
    AVG(view_count) OVER (ORDER BY created_at ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) as 7day_avg
FROM posts;

-- CTE with recursive (org chart, tree structures)
WITH RECURSIVE org_chart AS (
    SELECT id, name, manager_id, 0 as depth, name::text as path
    FROM employees WHERE manager_id IS NULL
    UNION ALL
    SELECT e.id, e.name, e.manager_id, oc.depth + 1,
           oc.path || ' > ' || e.name
    FROM employees e
    JOIN org_chart oc ON e.manager_id = oc.id
)
SELECT * FROM org_chart ORDER BY path;

-- JSONB queries
SELECT * FROM users WHERE metadata @> '{"plan": "premium"}';
SELECT * FROM users WHERE metadata ? 'phone_number';
SELECT metadata->>'city' as city, COUNT(*) FROM users GROUP BY city;
UPDATE users SET metadata = metadata || '{"verified": true}' WHERE id = 1;

-- Array operations
SELECT * FROM posts WHERE 'kubernetes' = ANY(tags);
SELECT * FROM posts WHERE tags @> ARRAY['docker', 'kubernetes'];
SELECT * FROM posts WHERE tags && ARRAY['python', 'golang'];  -- overlap

-- Full text search
SELECT title, ts_rank(to_tsvector('english', content), query) as rank
FROM posts,
     plainto_tsquery('english', 'kubernetes deployment') query
WHERE to_tsvector('english', content) @@ query
ORDER BY rank DESC;

-- Upsert (INSERT ... ON CONFLICT)
INSERT INTO users (email, username, full_name)
VALUES ('alice@example.com', 'alice', 'Alice Smith')
ON CONFLICT (email) DO UPDATE
SET full_name = EXCLUDED.full_name,
    updated_at = NOW();

-- Lateral join (row-level subquery)
SELECT u.username, recent.title, recent.created_at
FROM users u
CROSS JOIN LATERAL (
    SELECT title, created_at
    FROM posts
    WHERE user_id = u.id
    ORDER BY created_at DESC
    LIMIT 3
) recent;
```

## Performance Tuning

```sql
-- EXPLAIN ANALYZE — understand query plans
EXPLAIN (ANALYZE, BUFFERS, FORMAT TEXT)
SELECT * FROM posts WHERE user_id = 42 ORDER BY created_at DESC LIMIT 20;

-- Key things to look for:
-- Seq Scan on large table → needs index
-- Nested Loop with many iterations → may need hash join
-- Buffers: hit vs read → hit=from cache (fast), read=from disk (slow)
-- actual time → total execution time
-- rows → actual vs estimated (big mismatch = stale statistics)

-- Update statistics (run after bulk loads)
ANALYZE posts;
VACUUM ANALYZE posts;  -- Also reclaims dead tuples

-- Check table and index sizes
SELECT
    schemaname,
    tablename,
    pg_size_pretty(pg_total_relation_size(relid)) as total_size,
    pg_size_pretty(pg_relation_size(relid)) as table_size,
    pg_size_pretty(pg_total_relation_size(relid) - pg_relation_size(relid)) as index_size
FROM pg_catalog.pg_statio_user_tables
ORDER BY pg_total_relation_size(relid) DESC;

-- Find slow queries (requires pg_stat_statements)
SELECT query, calls, mean_exec_time, total_exec_time
FROM pg_stat_statements
ORDER BY mean_exec_time DESC
LIMIT 20;

-- Find missing indexes (sequential scans on large tables)
SELECT schemaname, tablename, seq_scan, seq_tup_read,
       idx_scan, idx_tup_fetch
FROM pg_stat_user_tables
WHERE seq_scan > 0
ORDER BY seq_tup_read DESC;
```

## Connection Pooling with PgBouncer

```ini
# pgbouncer.ini
[databases]
myapp = host=127.0.0.1 port=5432 dbname=myapp

[pgbouncer]
listen_port = 6432
listen_addr = *
auth_type = md5
auth_file = /etc/pgbouncer/userlist.txt
pool_mode = transaction         # Best for web apps
max_client_conn = 1000
default_pool_size = 25
min_pool_size = 5
server_idle_timeout = 600
```

```python
# Python with asyncpg (fastest async driver)
import asyncpg
import asyncio

async def main():
    pool = await asyncpg.create_pool(
        "postgresql://user:pass@localhost/myapp",
        min_size=5,
        max_size=20
    )

    # Fetch records
    users = await pool.fetch(
        "SELECT id, email FROM users WHERE is_active = $1 LIMIT $2",
        True, 100
    )

    # Execute with transaction
    async with pool.acquire() as conn:
        async with conn.transaction():
            await conn.execute(
                "INSERT INTO posts(user_id, title) VALUES($1, $2)",
                42, "My Post"
            )
            await conn.execute(
                "UPDATE users SET updated_at = NOW() WHERE id = $1", 42
            )
    await pool.close()
```

## Replication & High Availability

```bash
# Streaming replication setup (Primary)
# postgresql.conf on primary
wal_level = replica
max_wal_senders = 10
hot_standby = on

# pg_hba.conf on primary
host replication replicator 10.0.0.0/24 md5

# Create replication user
CREATE USER replicator REPLICATION LOGIN PASSWORD 'replpass';

# Standby setup
pg_basebackup -h primary -U replicator -D /var/lib/postgresql/data \
  --wal-method=stream --checkpoint=fast

# recovery.conf (Postgres < 12) or postgresql.conf (>= 12)
primary_conninfo = 'host=primary port=5432 user=replicator password=replpass'
hot_standby = on
```

## Interview Questions

**What is MVCC and why does Postgres use it?**
MVCC (Multi-Version Concurrency Control) allows Postgres to handle concurrent transactions without locking rows for reads. When you update a row, Postgres creates a new version of the row rather than modifying it in place — the old version remains for transactions that started before the update. This means readers never block writers and writers never block readers. The trade-off: dead tuples accumulate and must be reclaimed by VACUUM. This is why running VACUUM regularly is critical for Postgres health.

**What is the difference between VACUUM and VACUUM FULL?**
VACUUM marks dead tuples as reusable space but doesn't return it to the OS — the table file stays the same size but can be reused by future inserts. It's fast and non-blocking. VACUUM FULL rewrites the entire table to a new file, physically reclaiming space and returning it to the OS — but it acquires an exclusive lock, blocking all reads and writes. Use regular VACUUM (automated via autovacuum) for routine maintenance. Use VACUUM FULL only when you've deleted a large portion of a table and need to reclaim disk space — and schedule it during maintenance windows.

**How would you optimize a slow JOIN query?**
Step 1: EXPLAIN ANALYZE to see the actual query plan — check for sequential scans on large tables. Step 2: Ensure join columns are indexed on both sides. Step 3: Check if statistics are current (ANALYZE). Step 4: Consider partial indexes if you always filter by a specific condition. Step 5: Look at the join type — nested loop (good for small datasets), hash join (good for large unsorted data), merge join (good for pre-sorted data). Step 6: For very large joins, consider materialized CTEs or temporary tables to break the query into steps.
