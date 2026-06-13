# Cassandra — Intermediate

## Data Modeling Patterns

```sql
-- Pattern 1: Time-series with bucket partitions
-- Problem: Single partition key for sensor → huge partition over time
-- Solution: Bucket by time period

CREATE TABLE iot_readings (
    device_id TEXT,
    bucket    TEXT,          -- 'YYYY-MM-DD-HH' = hourly buckets
    ts        TIMESTAMP,
    value     FLOAT,
    PRIMARY KEY ((device_id, bucket), ts)
) WITH CLUSTERING ORDER BY (ts DESC)
  AND default_time_to_live = 604800;  -- Auto-delete after 7 days

-- Insert with bucket
INSERT INTO iot_readings (device_id, bucket, ts, value)
VALUES ('device-001', '2024-01-15-14', '2024-01-15 14:30:00', 23.5);

-- Query last hour
SELECT * FROM iot_readings
WHERE device_id = 'device-001'
AND bucket = '2024-01-15-14';

-- Pattern 2: Materialized views for different access patterns
CREATE TABLE users_by_id (
    id    UUID PRIMARY KEY,
    name  TEXT,
    email TEXT,
    plan  TEXT
);

CREATE MATERIALIZED VIEW users_by_email AS
SELECT * FROM users_by_id
WHERE email IS NOT NULL AND id IS NOT NULL
PRIMARY KEY (email, id);

-- Now can look up by email without full scan
SELECT * FROM users_by_email WHERE email = 'alice@example.com';
```

## Lightweight Transactions (LWT)

```python
from cassandra.cluster import Cluster
from cassandra.query import SimpleStatement

session = Cluster(['localhost']).connect('myapp')

# Conditional INSERT — only if not exists
# Uses Paxos consensus — slower but prevents duplicates
result = session.execute("""
    INSERT INTO users (id, email, name, created_at)
    VALUES (%s, %s, %s, toTimestamp(now()))
    IF NOT EXISTS
""", (uuid.uuid4(), 'alice@example.com', 'Alice'))

if result.one().applied:
    print("User created")
else:
    print("Email already exists")

# Conditional UPDATE — optimistic locking
result = session.execute("""
    UPDATE inventory
    SET quantity = %s
    WHERE product_id = %s
    IF quantity = %s
""", (new_qty, product_id, expected_qty))

if not result.one().applied:
    raise Exception("Concurrent modification detected, retry")
```

## Multi-Datacenter Replication

```python
# NetworkTopologyStrategy — replicate across datacenters
session.execute("""
    CREATE KEYSPACE myapp WITH replication = {
        'class': 'NetworkTopologyStrategy',
        'us-east': 3,      -- 3 replicas in US East
        'eu-west': 3,      -- 3 replicas in EU West
        'ap-south': 2      -- 2 replicas in India
    }
""")

# LOCAL_QUORUM — quorum within local datacenter only (fast)
# Avoids cross-DC latency for majority of operations
from cassandra import ConsistencyLevel

stmt = SimpleStatement(
    "SELECT * FROM users WHERE id = %s",
    consistency_level=ConsistencyLevel.LOCAL_QUORUM
)
```
