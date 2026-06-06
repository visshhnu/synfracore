# Cassandra — Distributed Wide-Column Database

Apache Cassandra is designed for massive scale with zero downtime. Used by Apple (tens of petabytes), Netflix, Uber, and Instagram, Cassandra handles millions of writes per second across globally distributed data centers.

## What Makes Cassandra Different

```
Traditional RDBMS:            Cassandra:
Single master                  Peer-to-peer (no master)
Vertical scaling               Horizontal scaling (add nodes)
JOINS supported                No JOINs — denormalized design
Schema first                   Query-driven design
Strong consistency             Tunable consistency
Struggles at >1TB             Petabyte-scale native
```

**Cassandra's core promise:** Linear scalability + no single point of failure + tunable consistency.

**Write always succeeds** — Cassandra is optimized for writes. A write goes to the commit log (sequential, fast) then to a MemTable (in-memory). Eventually flushed to SSTable on disk. This makes Cassandra extremely write-efficient.

## When to Use Cassandra

✅ **Good for:**
- Time-series data (IoT sensors, metrics, events)
- Write-heavy workloads (logging, tracking, activity feeds)
- Global multi-datacenter replication
- When you need > 1TB and linear scalability
- Append-only data patterns

❌ **Not good for:**
- Complex queries with ad-hoc WHERE clauses
- Data that requires JOINs
- Transactions across multiple rows/tables
- When you need ad-hoc analytics (use Spark instead)

## Core Concepts

```
Keyspace        = Database (defines replication)
Table           = Column family
Row             = Identified by partition key
Partition Key   = Determines which node stores the data
Clustering Key  = Sorts data within a partition
Primary Key     = Partition Key + Clustering Keys
```

## CQL — Cassandra Query Language

```sql
-- Create keyspace
CREATE KEYSPACE myapp
WITH replication = {
    'class': 'NetworkTopologyStrategy',
    'us-east-1': 3,    -- 3 replicas in us-east-1
    'eu-west-1': 2     -- 2 replicas in eu-west-1
};

USE myapp;

-- Design based on QUERIES, not entities
-- Query: "Get all events for a user, ordered by time"
CREATE TABLE user_events (
    user_id     UUID,
    event_time  TIMESTAMP,
    event_type  TEXT,
    data        MAP<TEXT, TEXT>,
    PRIMARY KEY (user_id, event_time)   -- user_id = partition, event_time = clustering
) WITH CLUSTERING ORDER BY (event_time DESC);

-- Query: "Get last 100 events for user X"
SELECT * FROM user_events
WHERE user_id = 550e8400-e29b-41d4-a716-446655440000
LIMIT 100;

-- Time-series: IoT sensor readings
CREATE TABLE sensor_readings (
    sensor_id   TEXT,
    date        DATE,       -- Bucket by day (prevents unbounded partitions)
    ts          TIMESTAMP,
    temperature DOUBLE,
    humidity    DOUBLE,
    PRIMARY KEY ((sensor_id, date), ts)  -- Compound partition key
) WITH CLUSTERING ORDER BY (ts DESC);

-- Insert
INSERT INTO sensor_readings (sensor_id, date, ts, temperature, humidity)
VALUES ('sensor_001', '2024-01-15', toTimestamp(now()), 22.5, 65.0);

-- Query: last readings today
SELECT * FROM sensor_readings
WHERE sensor_id = 'sensor_001'
AND date = '2024-01-15'
LIMIT 100;
```

## Consistency Levels

```
Write consistency levels:
ANY         → Write to at least 1 node (or hinted handoff)
ONE         → Write acknowledged by 1 replica
QUORUM      → Write acknowledged by majority (RF/2 + 1)
LOCAL_QUORUM→ Quorum within local datacenter only
ALL         → Write acknowledged by ALL replicas (slowest)

Read consistency levels:
ONE         → Read from 1 replica (fastest, may be stale)
QUORUM      → Read from majority (consistent + fast)
LOCAL_QUORUM→ Quorum in local DC
ALL         → Read from all replicas (slowest)

Strong consistency formula:
R + W > RF  → where R=read replicas, W=write replicas, RF=replication factor
QUORUM + QUORUM > RF = strong consistency
```

## Python with Cassandra

```python
from cassandra.cluster import Cluster
from cassandra.auth import PlainTextAuthProvider
from cassandra.policies import DCAwareRoundRobinPolicy
import uuid
from datetime import datetime

auth_provider = PlainTextAuthProvider(username='cassandra', password='password')
cluster = Cluster(
    ['localhost'],
    auth_provider=auth_provider,
    load_balancing_policy=DCAwareRoundRobinPolicy(local_dc='us-east-1'),
    port=9042
)
session = cluster.connect('myapp')

# Prepared statements (compile once, execute many — prevents injection)
insert_stmt = session.prepare("""
    INSERT INTO user_events (user_id, event_time, event_type, data)
    VALUES (?, ?, ?, ?)
""")

session.execute(insert_stmt, [
    uuid.uuid4(),
    datetime.utcnow(),
    'page_view',
    {'page': '/home', 'referrer': 'google.com'}
])

# Async execution for high throughput
from cassandra import ConsistencyLevel
from cassandra.query import SimpleStatement

stmt = SimpleStatement(
    "INSERT INTO user_events (user_id, event_time, event_type) VALUES (%s, %s, %s)",
    consistency_level=ConsistencyLevel.LOCAL_QUORUM
)

futures = []
for event in events_batch:
    future = session.execute_async(stmt, event)
    futures.append(future)

# Wait for all to complete
for future in futures:
    future.result()

cluster.shutdown()
```

## Interview Questions

**How does Cassandra achieve high availability without a master?**
Cassandra uses a peer-to-peer ring topology. Data is distributed using consistent hashing — each node is responsible for a range of tokens (hash values). When a write comes in, it's routed to the coordinator node which forwards to the appropriate replica nodes based on the partition key hash. With replication factor 3, data exists on 3 nodes. If one node fails, the others still serve requests. No master means no single point of failure — any node can coordinate any request.

**What is the tombstone problem in Cassandra?**
When you delete data in Cassandra, it doesn't immediately remove it — it writes a tombstone (a deletion marker). During reads, Cassandra must scan and filter tombstones. If you delete millions of rows but they haven't been compacted away, queries become slow because they scan all tombstones. Solution: design schemas to avoid frequent deletes, use TTL instead of explicit deletes, tune `gc_grace_seconds` appropriately, and ensure compaction runs regularly. Time-series data that's logically "deleted" by moving past a date should use TTL from the start.
