# Cassandra Quick Reference

## Connection & Admin
```bash
cqlsh                                        # Local connect
cqlsh host 9042 -u cassandra -p cassandra    # Remote connect
nodetool status                              # Cluster node status
nodetool info                                # Local node info
nodetool ring                                # Token ring view
nodetool tpstats                             # Thread pool stats
nodetool compactionstats                     # Compaction progress
nodetool flush keyspace table                # Flush memtable to disk
nodetool repair                              # Anti-entropy repair
```

## CQL Basics
```sql
-- Keyspaces
CREATE KEYSPACE myapp WITH replication = {
  'class': 'NetworkTopologyStrategy',
  'datacenter1': 3
};
USE myapp;
DESCRIBE KEYSPACES;
DESCRIBE TABLES;
DESCRIBE TABLE users;

-- Create table
CREATE TABLE user_events (
    user_id UUID,
    event_time TIMESTAMP,
    event_type TEXT,
    data TEXT,
    PRIMARY KEY ((user_id), event_time)
) WITH CLUSTERING ORDER BY (event_time DESC);

-- CRUD
INSERT INTO user_events (user_id, event_time, event_type)
  VALUES (uuid(), toTimestamp(now()), 'login') USING TTL 86400;

SELECT * FROM user_events WHERE user_id = ? AND event_time > ?;
-- MUST filter by partition key (user_id)

UPDATE user_events SET data = 'new' 
  WHERE user_id = ? AND event_time = ?;

DELETE FROM user_events WHERE user_id = ? AND event_time = ?;
```

## Data Types
```sql
UUID, TIMEUUID, TEXT, VARCHAR, INT, BIGINT, FLOAT, DOUBLE,
BOOLEAN, TIMESTAMP, DATE, TIME, BLOB, INET,
LIST<TEXT>, SET<INT>, MAP<TEXT,INT>, FROZEN<type>

-- Collections
CREATE TABLE users (
  id UUID PRIMARY KEY,
  emails LIST<TEXT>,
  tags   SET<TEXT>,
  meta   MAP<TEXT, TEXT>
);

UPDATE users SET emails = emails + ['new@b.com'] WHERE id = ?;
UPDATE users SET tags = tags - {'old_tag'} WHERE id = ?;
```

## Consistency Levels
```sql
CONSISTENCY ONE;        -- Fastest, least safe
CONSISTENCY QUORUM;     -- Balanced (most common)
CONSISTENCY ALL;        -- Strongest, least available
CONSISTENCY LOCAL_QUORUM;  -- Multi-DC: quorum in local DC only
CONSISTENCY LOCAL_ONE;     -- Multi-DC: one node in local DC

-- Strong consistency: Write QUORUM + Read QUORUM
-- At least one node overlap guaranteed
```

## Revision Notes
```
PRIMARY KEY: (partition_key) + clustering_columns
Partition key: determines which node stores data (MUST be in WHERE)
Clustering: sort order within partition

CONSISTENCY: ONE (fast) | QUORUM (balanced) | ALL (strong)
Strong consistency: Write QUORUM + Read QUORUM

AVOID:
ALLOW FILTERING: full cluster scan (never in production)
Unbounded queries: always provide partition key
Large partitions: > 100MB is problematic

NODETOOL:
status: node up/down | ring: token ranges
repair: sync replica data | compactionstats: background work
```
