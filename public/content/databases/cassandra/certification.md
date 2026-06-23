# Apache Cassandra Certification Guide

## Certifications Available

| Cert | Provider | Cost | Format |
|------|----------|------|--------|
| **DataStax Certified Cassandra Developer** | DataStax | $200 | MCQ |
| **DataStax Certified Cassandra Administrator** | DataStax | $200 | MCQ |

DataStax Academy at academy.datastax.com — free courses and paid certification exams.

---

## Core CQL Topics

```sql
-- KEYSPACE (database equivalent)
CREATE KEYSPACE myapp WITH replication = {
  'class': 'NetworkTopologyStrategy',
  'dc1': 3
};
USE myapp;

-- TABLE design: always model for your queries
CREATE TABLE user_events (
  user_id  UUID,
  evt_time TIMESTAMP,
  type     TEXT,
  payload  TEXT,
  PRIMARY KEY ((user_id), evt_time)
) WITH CLUSTERING ORDER BY (evt_time DESC)
  AND default_time_to_live = 7776000;  -- 90 days TTL

-- INSERT with optional per-row TTL
INSERT INTO user_events (user_id, evt_time, type)
VALUES (uuid(), toTimestamp(now()), 'login')
USING TTL 86400;

-- QUERY: partition key MUST be in WHERE clause
SELECT * FROM user_events
WHERE user_id = 123e4567-e89b-12d3-a456-426614174000;

-- Range query on clustering column (allowed)
SELECT * FROM user_events
WHERE user_id = ? AND evt_time >= '2024-01-01' AND evt_time < '2024-02-01';

-- NEVER use ALLOW FILTERING in production — it scans the entire cluster
-- SELECT * FROM user_events WHERE type = 'error' ALLOW FILTERING; -- DANGEROUS

-- LIGHTWEIGHT TRANSACTIONS (uses Paxos, expensive — use sparingly)
INSERT INTO users (email, name) VALUES ('a@b.com', 'Alice') IF NOT EXISTS;
UPDATE users SET name = 'Bob' WHERE email = 'a@b.com' IF name = 'Alice';
```

```bash
# nodetool operations
nodetool status            # ring status and node health
nodetool info              # local node details (heap, load)
nodetool ring              # token ring and data distribution
nodetool repair keyspace   # anti-entropy repair to sync replicas
nodetool flush keyspace    # flush memtable to SSTables on disk
nodetool compactionstats   # running compaction progress
nodetool tpstats           # thread pool stats (check for saturation)
```

---

## Data Modelling Rules

```
RULE 1 — Model for queries, not entities
  Every distinct query pattern needs its own table (denormalise freely)

RULE 2 — Partition key routes data to a specific node
  Always include in WHERE clause | choose high-cardinality values
  Avoid monotonic partition keys (timestamp alone -> hotspot on latest node)

RULE 3 — Clustering columns define ordering within a partition
  Range queries allowed on clustering columns
  ORDER BY direction must match CLUSTERING ORDER definition

RULE 4 — Keep partitions bounded
  Target under 100 MB per partition (ideally under 10 MB)
  Use time-bucketing for time-series: (user_id, year_month) as partition key

ANTI-PATTERNS TO AVOID:
  ALLOW FILTERING  — full cluster scatter-gather, never in production
  High-cardinality secondary index — expensive scatter reads on every node
  Large IN on partition key — do parallel targeted single-partition reads instead
  Unbounded list/set/map — max 65535 elements
```

---

## Study Resources

- **DataStax Academy** (academy.datastax.com) — free courses and paid cert exams
- **Astra DB** (astra.datastax.com) — free managed Cassandra for hands-on practice
- **Cassandra Docs** (cassandra.apache.org/doc) — official reference
- **Cassandra: The Definitive Guide** (O'Reilly, 3rd edition)

## Revision Notes
```
CASSANDRA: wide-column store, AP (available + partition tolerant), masterless ring
PRIMARY KEY: (partition_key) routes to node; clustering columns sort within partition

CONSISTENCY: ONE (fast, low durability) | QUORUM (balanced) | ALL (strong, slow)
Strong consistency = write QUORUM + read QUORUM ensures at least 1 node overlap

COMPACTION STRATEGIES:
  STCS: write-heavy workloads, merges similar-size SSTables
  LCS: read-heavy random access, leveled structure, 10x more I/O than STCS
  TWCS: time-series data, merges within time windows, best for logs and IoT

REPLICATION: SimpleStrategy (single DC) | NetworkTopologyStrategy (multi-DC)
CAP: Cassandra is AP — always available, eventually consistent by default
```
