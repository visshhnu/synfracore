# Cassandra Intermediate Topics

## Data Modelling Rules

**Rule 1: Model for your queries, not your data.**
Unlike SQL (normalise first, query later), Cassandra requires designing tables around specific query patterns.

```sql
-- Query: "Get all events for user X in last 24 hours"
CREATE TABLE events_by_user (
    user_id UUID,
    event_time TIMESTAMP,
    event_type TEXT,
    details TEXT,
    PRIMARY KEY ((user_id), event_time)
) WITH CLUSTERING ORDER BY (event_time DESC);

-- Query: "Get all events of type X across all users (last hour)"
-- Needs a SEPARATE table!
CREATE TABLE events_by_type (
    event_type TEXT,
    event_time TIMESTAMP,
    user_id UUID,
    details TEXT,
    PRIMARY KEY ((event_type), event_time)
) WITH CLUSTERING ORDER BY (event_time DESC);
-- Denormalise: store same data in multiple tables for different queries
```

**Rule 2: Control partition size.**
- Target: 10MB or less per partition, max 100MB
- Time-bucket if unbounded growth: `PRIMARY KEY ((user_id, DATE(event_time)), event_time)`
- Check: `nodetool cfstats keyspace.table` for partition sizes

**Rule 3: Avoid anti-patterns.**
```sql
-- NEVER: ALLOW FILTERING (full cluster scan)
SELECT * FROM events WHERE event_type = 'login' ALLOW FILTERING; -- BAD

-- NEVER: Secondary index on high-cardinality column
CREATE INDEX ON users(email);  -- BAD if millions of users

-- NEVER: IN with large lists on partition key
SELECT * FROM users WHERE user_id IN (uuid1, uuid2, ... uuid10000); -- BAD
-- Better: multiple parallel queries, each with one partition key
```

## Time Series Pattern

```sql
-- Time-bucketed table (prevent unbounded partition growth)
CREATE TABLE sensor_readings (
    device_id TEXT,
    time_bucket TEXT,          -- 'YYYY-MM-DD-HH' (hourly buckets)
    reading_time TIMESTAMP,
    value DOUBLE,
    PRIMARY KEY ((device_id, time_bucket), reading_time)
) WITH CLUSTERING ORDER BY (reading_time DESC)
  AND compaction = {
    'class': 'TimeWindowCompactionStrategy',
    'compaction_window_unit': 'HOURS',
    'compaction_window_size': '1'
  };

-- Query with bucket
SELECT * FROM sensor_readings
WHERE device_id = 'sensor1' AND time_bucket = '2024-01-15-10';
```

## Lightweight Transactions (LWT)

```sql
-- Compare-and-swap (CAS) — use sparingly (expensive, needs PAXOS)
INSERT INTO users (id, email) VALUES (uuid(), 'alice@b.com') IF NOT EXISTS;

UPDATE users SET email = 'new@b.com' WHERE id = ?
  IF email = 'old@b.com';   -- Only update if current value matches

-- LWT use cases: registration (prevent duplicate email), 
-- optimistic locking, leader election
-- Cost: ~4x slower than regular write (PAXOS consensus)
```

## Compaction Strategies

```sql
-- STCS (Size-Tiered): default. Merge SSTables of similar size.
-- Good for write-heavy, bad for reads (many SSTables to scan)
WITH compaction = {'class': 'SizeTieredCompactionStrategy'}

-- LCS (Leveled): merge into levels. Better reads, more I/O.
-- Good for read-heavy, random reads
WITH compaction = {'class': 'LeveledCompactionStrategy', 'sstable_size_in_mb': 160}

-- TWCS (Time Window): merge within time windows. Best for time-series.
-- Expired data cleaned up cleanly
WITH compaction = {'class': 'TimeWindowCompactionStrategy',
  'compaction_window_unit': 'HOURS', 'compaction_window_size': 1}
```

## Revision Notes
```
DATA MODELLING:
One query = one table. Denormalise aggressively.
Partition key in every WHERE clause — no exceptions.
Time-bucket for unbounded time-series partitions.

PARTITION SIZE: target < 10MB. Use time buckets if growing unboundedly.

ANTI-PATTERNS:
ALLOW FILTERING: cluster-wide scan, never in prod
High-cardinality secondary index: scatter-gather, slow
Large IN on partition key: better to do parallel targeted queries

LWT: IF NOT EXISTS / IF condition — CAS via PAXOS (expensive, ~4x slower)
Use for: unique constraints, optimistic locking

COMPACTION:
STCS: write-heavy | LCS: read-heavy random | TWCS: time-series (best for logs/IoT)
```
