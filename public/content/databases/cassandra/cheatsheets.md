# Cassandra — Cheatsheet

```bash
# ── CQLSH ─────────────────────────────────────────────────
cqlsh localhost 9042
cqlsh -u cassandra -p cassandra

DESCRIBE KEYSPACES;
USE myapp;
DESCRIBE TABLES;
DESCRIBE TABLE users;
EXPAND ON;       -- Vertical output
TRACING ON;      -- Show execution details

# ── NODETOOL ──────────────────────────────────────────────
nodetool status          # UN=Up/Normal DN=Down/Normal
nodetool ring            # Token ring
nodetool info            # Node stats (load, uptime)
nodetool tpstats         # Thread pools (blocked=problem)
nodetool cfstats myapp.events   # Table stats
nodetool flush           # Flush memtables
nodetool repair          # Run anti-entropy repair
nodetool compactionstats # Compaction progress
nodetool tablestats myapp.users  # Size, partition info
nodetool getcompactionthroughput  # Check compaction rate
```

```sql
-- ── CQL REFERENCE ─────────────────────────────────────────
-- Create keyspace
CREATE KEYSPACE app WITH replication = {
    'class': 'NetworkTopologyStrategy', 'dc1': 3, 'dc2': 2
};

-- Create table (access pattern: get user by ID)
CREATE TABLE users (
    user_id UUID PRIMARY KEY,
    name TEXT,
    email TEXT,
    created_at TIMESTAMP
) WITH gc_grace_seconds = 86400;

-- Time-series table
CREATE TABLE events (
    device_id TEXT,
    day DATE,
    ts TIMESTAMP,
    value FLOAT,
    PRIMARY KEY ((device_id, day), ts)
) WITH CLUSTERING ORDER BY (ts DESC)
  AND default_time_to_live = 2592000;  -- 30 days

-- Insert
INSERT INTO users (user_id, name, email) VALUES (uuid(), 'Alice', 'a@example.com');
INSERT INTO users (user_id, name) VALUES (uuid(), 'Bob') USING TTL 3600;

-- Query (must use full partition key)
SELECT * FROM users WHERE user_id = some-uuid;
SELECT * FROM events WHERE device_id = 'dev-1' AND day = '2024-01-15' LIMIT 100;

-- Update
UPDATE users SET name = 'Alice Smith' WHERE user_id = some-uuid;
UPDATE users SET login_count = login_count + 1 WHERE user_id = some-uuid;

-- Conditional (LWT - slower!)
UPDATE users SET email = 'new@example.com'
WHERE user_id = some-uuid IF email = 'old@example.com';

-- Delete
DELETE FROM users WHERE user_id = some-uuid;
DELETE email FROM users WHERE user_id = some-uuid;  -- Delete single column

-- Batch (same partition = efficient)
BEGIN BATCH
    INSERT INTO t (k, c, v) VALUES (...);
    UPDATE t SET v = 1 WHERE k = ... AND c = ...;
APPLY BATCH;

-- Consistency levels
CONSISTENCY LOCAL_QUORUM;  -- Set for session
SELECT * FROM users WHERE user_id = ? USING CONSISTENCY LOCAL_ONE;

-- Allow filtering (dangerous - full scan!)
SELECT * FROM events WHERE value > 100 ALLOW FILTERING;
-- NEVER use in production on large tables
```
