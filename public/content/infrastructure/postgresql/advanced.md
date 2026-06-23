# PostgreSQL Advanced Topics

## Replication

```bash
# postgresql.conf (primary)
wal_level = replica
max_wal_senders = 10
wal_keep_size = 1GB

# pg_hba.conf (allow replica connection)
host replication replicator replica-ip/32 md5

# Create replication user
CREATE ROLE replicator REPLICATION LOGIN PASSWORD 'secret';

# Standby server: pg_basebackup
pg_basebackup -h primary-host -U replicator -D /var/lib/postgresql/data -P -R
# -R creates recovery.conf / standby.signal automatically
```

**Streaming replication**: WAL records streamed to standby in real-time.
**Logical replication**: Replicate specific tables or rows (not whole cluster).
```sql
-- Logical replication
CREATE PUBLICATION my_pub FOR TABLE orders, users;
-- On subscriber:
CREATE SUBSCRIPTION my_sub
  CONNECTION 'host=primary dbname=mydb user=replicator'
  PUBLICATION my_pub;
```

**Patroni**: Automatic failover for PostgreSQL (recommended for HA).

## Partitioning

```sql
-- Declarative partitioning (PG 10+)
CREATE TABLE orders (
    id BIGINT, user_id INT, created_at TIMESTAMPTZ, amount NUMERIC
) PARTITION BY RANGE (created_at);

CREATE TABLE orders_2024_q1 PARTITION OF orders
  FOR VALUES FROM ('2024-01-01') TO ('2024-04-01');
CREATE TABLE orders_2024_q2 PARTITION OF orders
  FOR VALUES FROM ('2024-04-01') TO ('2024-07-01');

-- Query only scans relevant partition (partition pruning)
SELECT * FROM orders WHERE created_at >= '2024-01-01' AND created_at < '2024-04-01';

-- List partitioning
CREATE TABLE users (id INT, country TEXT) PARTITION BY LIST (country);
CREATE TABLE users_india   PARTITION OF users FOR VALUES IN ('IN');
CREATE TABLE users_us      PARTITION OF users FOR VALUES IN ('US');

-- Hash partitioning (even distribution)
CREATE TABLE events (id BIGINT, data JSONB) PARTITION BY HASH (id);
CREATE TABLE events_0 PARTITION OF events FOR VALUES WITH (MODULUS 4, REMAINDER 0);
```

## Advanced Indexing

```sql
-- Bloom filter index (multiple equality conditions)
CREATE EXTENSION bloom;
CREATE INDEX idx_bloom ON users USING BLOOM(name, city, age);

-- BRIN index (large tables, sequential data)
CREATE INDEX idx_brin ON logs USING BRIN(created_at);
-- ~0.01% size of B-tree, only useful for sequential columns

-- Partial index with expression (advanced example)
CREATE INDEX idx_recent_active ON orders(user_id, created_at DESC)
  WHERE status = 'pending' AND created_at > NOW() - INTERVAL '30 days';

-- Concurrent index build (no table lock)
CREATE INDEX CONCURRENTLY idx_email ON users(email);
```

## Performance Tuning

```bash
# Key postgresql.conf parameters
shared_buffers = 25%          # RAM for PostgreSQL buffer cache
effective_cache_size = 75%    # Estimate of OS cache (query planner hint)
work_mem = 64MB               # Per sort/hash operation (set carefully — multiplied by connections)
maintenance_work_mem = 512MB  # For VACUUM, CREATE INDEX
wal_buffers = 64MB
checkpoint_completion_target = 0.9
random_page_cost = 1.1        # For SSDs (default 4 is for spinning disk)
```

```sql
-- pg_stat_statements: find slow queries
SELECT query, calls, mean_exec_time, total_exec_time
FROM pg_stat_statements
ORDER BY mean_exec_time DESC LIMIT 10;

-- Active connections and blocking queries
SELECT pid, now() - query_start as duration, query, state
FROM pg_stat_activity
WHERE state != 'idle' ORDER BY duration DESC;

-- Kill blocking query
SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE pid = 12345;

-- Table/index bloat
SELECT schemaname, tablename, n_dead_tup, last_autovacuum
FROM pg_stat_user_tables WHERE n_dead_tup > 10000;
```

## Revision Notes
```
REPLICATION:
Streaming: WAL records sent to standby in real-time
Logical: replicate specific tables/rows (cross-version, cross-platform)
Patroni: automatic failover + leader election (recommended for HA)

PARTITIONING: RANGE (dates), LIST (categories), HASH (even distribution)
Partition pruning: WHERE on partition key → only scans relevant partition

ADVANCED INDEXES:
CONCURRENTLY: build without table lock (use in production)
BRIN: tiny index for sequential columns (logs, time-series)
Partial + expression indexes: very targeted, very fast

KEY TUNING:
shared_buffers: 25% RAM | work_mem: careful (per-sort, multiplied by connections)
random_page_cost=1.1 for SSDs | pg_stat_statements for slow query analysis
```
