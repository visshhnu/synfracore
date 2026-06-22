# Apache Cassandra Interview Questions

## Core Concepts

**Q: What is Cassandra? When to use it?**

Cassandra is a distributed NoSQL database designed for massive scale, high availability, and no single point of failure. Originally developed at Facebook for inbox search.

**When to use Cassandra:**
- Massive write throughput (millions of writes/second)
- Data that never needs complex joins or transactions
- Geo-distributed deployments (multi-region active-active)
- Time-series data (IoT, logs, metrics)
- High availability with no downtime requirement

**When NOT to use:**
- Complex queries with JOINs
- Multi-row ACID transactions
- Ad-hoc analytics (use BigQuery/Redshift instead)
- Data volume that fits in PostgreSQL comfortably

---

**Q: Cassandra architecture — the ring.**

```
All nodes are equal (no master). Data distributed across ring using consistent hashing.

Node 1 ─── Node 2
  |              |
Node 5       Node 3
       |   |
      Node 4

Each node owns a token range. Replica factor (RF=3) = 3 copies of each partition.
Coordinator node: receives client request, routes to correct replicas.
```

**No master = no single point of failure.** Any node can be coordinator. Any node can go down without data loss (with RF≥3).

---

**Q: Consistency levels.**

Cassandra lets you choose consistency vs availability trade-off per query.

| Level | Reads/Writes required | Use case |
|---|---|---|
| ONE | 1 replica | Fastest, lowest consistency |
| QUORUM | (RF/2)+1 replicas | Balanced (most common) |
| ALL | All replicas | Strongest, least available |
| LOCAL_QUORUM | Quorum in local DC | Multi-region |

**Strong consistency**: Write QUORUM + Read QUORUM = at least one overlap guaranteed.

---

**Q: CQL (Cassandra Query Language) and data modelling.**

```sql
-- Keyspace (like a database)
CREATE KEYSPACE my_app WITH replication = {
    'class': 'NetworkTopologyStrategy',
    'us-east': 3, 'eu-west': 3
};

-- Table: primary key = partition key + clustering columns
CREATE TABLE user_events (
    user_id UUID,
    event_time TIMESTAMP,
    event_type TEXT,
    data TEXT,
    PRIMARY KEY ((user_id), event_time)  -- user_id = partition key, event_time = clustering
) WITH CLUSTERING ORDER BY (event_time DESC);

-- Query: MUST filter by partition key
SELECT * FROM user_events WHERE user_id = ? AND event_time > ?;
-- Cannot: SELECT * WHERE event_type = 'purchase' (no index on event_type)
```

**Cassandra data modelling rule**: Design tables around your queries, not your data model. One table per query pattern.

---

**Q: Anti-patterns to avoid.**

1. **Too wide rows**: Millions of clustering columns per partition → partition size limit (100MB max, 10MB recommended)
2. **ALLOW FILTERING**: `SELECT * WHERE non-key-column = ?` — full scan, extremely slow
3. **Large partitions**: Single partition can't exceed node memory for hot reads
4. **Secondary indexes on high-cardinality columns**: Each query hits all nodes
5. **Deletes without TTL**: Tombstones accumulate → read performance degrades until compaction

## Revision Notes
```
CASSANDRA: Distributed NoSQL. No master. Consistent hashing ring.
Use for: massive writes, time-series, multi-region active-active, high availability
NOT for: joins, transactions, ad-hoc analytics

ARCHITECTURE: All nodes equal. Coordinator routes requests. RF=3 = 3 copies.
CONSISTENCY: ONE (fastest) | QUORUM (balanced) | ALL (strongest)
Strong consistency = Write QUORUM + Read QUORUM

DATA MODEL: Design for queries, not entities. One table per access pattern.
PRIMARY KEY: partition key (distribution) + clustering columns (sort order within partition)

AVOID: ALLOW FILTERING | large partitions | high-cardinality secondary indexes | accumulating tombstones
QUERY: must filter by partition key — cannot filter on non-key columns without index
```
