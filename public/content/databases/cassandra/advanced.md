# Cassandra — Advanced

## Compaction Strategies

```sql
-- SizeTieredCompactionStrategy (STCS) - default
-- Good for: write-heavy, infrequent reads
-- Merges same-sized SSTables when there are 4+ of them
ALTER TABLE events WITH compaction = {
    'class': 'SizeTieredCompactionStrategy',
    'min_threshold': 4,
    'max_threshold': 32
};

-- LeveledCompactionStrategy (LCS) - read-optimized
-- Maintains 10x size ratio between levels
-- Good for: read-heavy, many small updates
-- Trade-off: more I/O for compaction
ALTER TABLE user_profiles WITH compaction = {
    'class': 'LeveledCompactionStrategy',
    'sstable_size_in_mb': 160
};

-- TimeWindowCompactionStrategy (TWCS) - time-series data
-- Compacts data within same time window together
-- Perfect for time-series + TTL combination
ALTER TABLE metrics WITH compaction = {
    'class': 'TimeWindowCompactionStrategy',
    'compaction_window_unit': 'HOURS',
    'compaction_window_size': 1
} AND default_time_to_live = 86400;  -- Keep 24 hours
```

## Cassandra Cheatsheet

```bash
# ── CQLSH COMMANDS ────────────────────────────────────────
cqlsh localhost 9042
DESCRIBE KEYSPACES;
USE myapp;
DESCRIBE TABLES;
DESCRIBE TABLE users;
TRACING ON;              -- Show query execution details
EXPAND ON;               -- Vertical output (like MySQL \G)

# ── NODETOOL ──────────────────────────────────────────────
nodetool status          # Cluster health (UN=Up Normal, DN=Down)
nodetool ring            # Token distribution
nodetool info            # Node stats
nodetool tpstats         # Thread pool statistics
nodetool cfstats myapp.users  # Table statistics
nodetool flush           # Flush memtables to disk
nodetool repair          # Anti-entropy repair (run weekly)
nodetool compactionstats # In-progress compactions
nodetool tablestats myapp.events  # Size, partition stats
```

```sql
-- ── CQL QUICK REFERENCE ───────────────────────────────────
-- Create keyspace
CREATE KEYSPACE app WITH replication = {'class': 'NetworkTopologyStrategy', 'dc1': 3};

-- Table operations
ALTER TABLE t ADD new_col TEXT;
ALTER TABLE t WITH gc_grace_seconds = 86400;
DROP TABLE IF EXISTS t;
TRUNCATE t;

-- Batch (limited use — same partition only for performance)
BEGIN BATCH
  INSERT INTO t (id, name) VALUES (1, 'a');
  UPDATE t SET name = 'b' WHERE id = 2;
APPLY BATCH;

-- TTL per row
INSERT INTO cache (key, value) VALUES ('k', 'v') USING TTL 3600;
SELECT TTL(value) FROM cache WHERE key = 'k';

-- Tracing query performance
TRACING ON;
SELECT * FROM users WHERE id = uuid();
-- Shows each stage: parsing, coordinators, replicas, latency
```
