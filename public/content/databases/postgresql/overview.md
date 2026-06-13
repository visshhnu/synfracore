# PostgreSQL — The World's Most Advanced Open Source Database

PostgreSQL (Postgres) is the go-to database for serious applications. Used by Apple, Instagram, Spotify, GitHub, and millions of production systems worldwide. It combines the reliability of an enterprise database with the flexibility of a modern data platform.

## Why PostgreSQL Over MySQL?

| Feature | PostgreSQL | MySQL |
|---|---|---|
| **JSON support** | JSONB — indexed, fast | Basic JSON |
| **Full text search** | Built-in, powerful | Basic |
| **Advanced indexes** | GIN, GiST, BRIN, partial, expression | B-tree mostly |
| **Window functions** | Full support | Limited |
| **ACID compliance** | Strongest | Good (InnoDB) |
| **Extensibility** | Extensions (PostGIS, pg_vector, TimescaleDB) | Limited |
| **Concurrency** | MVCC, no read locks | Good |
| **Standards compliance** | Excellent | Moderate |

## Connect and Explore

```bash
# Connect
psql -h localhost -U postgres -d myapp
psql "postgresql://user:pass@localhost:5432/myapp"

# Essential psql commands
\l          -- List databases
\c mydb     -- Connect to database
\dt         -- List tables
\d users    -- Describe table structure
\di         -- List indexes
\timing     -- Toggle query timing
\x          -- Toggle expanded output (good for wide tables)
\e          -- Open editor
\q          -- Quit
```

## What Makes PostgreSQL Special

```sql
-- 1. JSONB — JSON with full indexing and operators
SELECT * FROM users WHERE metadata @> '{"plan": "enterprise"}';
SELECT metadata->'address'->>'city' FROM users WHERE id = 1;

-- 2. Arrays — native array columns
SELECT * FROM posts WHERE 'kubernetes' = ANY(tags);
SELECT unnest(tags) AS tag, COUNT(*) FROM posts GROUP BY 1;

-- 3. Full-text search — no external tool needed
SELECT title FROM articles
WHERE to_tsvector('english', title || ' ' || body)
   @@ plainto_tsquery('english', 'kubernetes deployment helm');

-- 4. Generated columns — computed from other columns
ALTER TABLE orders ADD COLUMN total_with_tax NUMERIC
    GENERATED ALWAYS AS (total * 1.18) STORED;

-- 5. Table inheritance
CREATE TABLE measurements (city TEXT, temp NUMERIC, taken TIMESTAMPTZ);
CREATE TABLE measurements_2024 () INHERITS (measurements);
```

## Essential Configuration

```bash
# Key postgresql.conf settings for production
max_connections = 100          # Use PgBouncer to manage connections
shared_buffers = 4GB           # 25% of RAM
effective_cache_size = 12GB    # 75% of RAM (hint to planner)
work_mem = 64MB                # Per sort/hash, be careful (n queries × work_mem)
wal_buffers = 64MB
checkpoint_completion_target = 0.9
random_page_cost = 1.1         # Set to 1.1 for SSDs (default 4.0 for HDD)
log_min_duration_statement = 1000  # Log queries > 1 second
```
