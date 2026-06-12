# Cassandra — Fundamentals

## When to Use Cassandra

```
Cassandra excels at:
  ✅ Massive write throughput (millions/second)
  ✅ Linear horizontal scalability
  ✅ Time-series data (IoT, logs, metrics, events)
  ✅ Geo-distributed, always-on applications
  ✅ No single point of failure

Not suitable for:
  ❌ Complex queries, JOINs, aggregations
  ❌ Strong ACID transactions across rows
  ❌ Ad-hoc queries (must know access patterns)
  ❌ Small datasets (overhead not justified)

Real-world uses: Netflix (viewing history), Instagram (direct messages),
Discord (messages), Apple (iCloud), Uber (trip data)
```

## Data Modeling (Access Pattern First)

```sql
-- Cassandra: design tables for your queries, not normalized like SQL

-- User messages (query: "get messages in a conversation, newest first")
CREATE TABLE messages_by_conversation (
    conversation_id UUID,
    message_time    TIMESTAMP,
    message_id      UUID,
    sender_id       UUID,
    content         TEXT,
    PRIMARY KEY (conversation_id, message_time, message_id)
) WITH CLUSTERING ORDER BY (message_time DESC);

-- Time-series sensor data
CREATE TABLE sensor_readings (
    sensor_id   TEXT,
    date        DATE,
    reading_time TIMESTAMP,
    value       FLOAT,
    PRIMARY KEY ((sensor_id, date), reading_time)
) WITH CLUSTERING ORDER BY (reading_time DESC);
-- Composite partition key (sensor_id, date) prevents hot partitions

-- User events (query: "get user events in last 30 days")
CREATE TABLE user_events (
    user_id    UUID,
    event_time TIMESTAMP,
    event_type TEXT,
    data       MAP<TEXT, TEXT>,
    PRIMARY KEY (user_id, event_time)
) WITH CLUSTERING ORDER BY (event_time DESC)
  AND default_time_to_live = 2592000;  -- auto-delete after 30 days
```

## CRUD Operations

```python
from cassandra.cluster import Cluster
from cassandra.query import SimpleStatement
import uuid
from datetime import datetime

cluster = Cluster(['localhost'])
session = cluster.connect('myapp')

# Prepared statements (compile once, execute many — always use this)
insert_stmt = session.prepare("""
    INSERT INTO messages_by_conversation 
    (conversation_id, message_time, message_id, sender_id, content)
    VALUES (?, ?, ?, ?, ?)
""")

# Insert
session.execute(insert_stmt, [
    uuid.UUID('550e8400-e29b-41d4-a716-446655440000'),
    datetime.now(),
    uuid.uuid4(),
    uuid.UUID('660e8400-e29b-41d4-a716-446655440000'),
    'Hello!'
])

# Query with paging
rows = session.execute("""
    SELECT * FROM messages_by_conversation
    WHERE conversation_id = %s
    AND message_time > %s
    LIMIT 50
""", [conv_id, one_week_ago])

# Batch (for related updates — same partition is efficient)
from cassandra.query import BatchStatement
batch = BatchStatement()
batch.add(insert_stmt, [conv_id, datetime.now(), uuid.uuid4(), user_id, 'msg1'])
batch.add(insert_stmt, [conv_id, datetime.now(), uuid.uuid4(), user_id, 'msg2'])
session.execute(batch)
```

## Consistency Levels

```
Write consistency levels:
  ONE:      Write to 1 replica (fastest, least durable)
  QUORUM:   Write to majority of replicas (balanced)
  ALL:      Write to all replicas (most durable, slowest)
  LOCAL_QUORUM: Quorum within local datacenter (geo-distributed)

Read consistency levels:
  ONE:      Read from 1 replica (fastest, may read stale)
  QUORUM:   Read from majority (consistent if write was QUORUM)
  ALL:      Read from all replicas

Strong consistency: Write QUORUM + Read QUORUM
  (W + R > replication_factor ensures reading written data)

For time-series IoT data: Write ONE, Read ONE (speed > consistency)
For financial data: Write QUORUM, Read QUORUM (or use stronger)
```
