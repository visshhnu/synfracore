# Apache Cassandra Interview Questions

## Common Questions and Answers

**Q: What is Apache Cassandra and when would you choose it?**

A: Cassandra is a distributed, NoSQL, wide-column store database designed for high availability and linear horizontal scalability. Choose Cassandra when you need: write-heavy workloads at massive scale (millions of writes per second), geo-distributed deployments requiring multi-region active-active, time-series or IoT data, and when you can tolerate eventual consistency in exchange for availability and partition tolerance (AP in CAP theorem).

---

**Q: Explain Cassandra's data model: keyspace, table, partition key, clustering key.**

A: A keyspace is the top-level container (like a database in SQL). Tables contain rows of data. The primary key has two parts: the partition key (one or more columns) determines which node stores the data using consistent hashing. The clustering key (optional, one or more columns) determines the sort order of rows within a partition. All rows with the same partition key are stored together on the same node, making reads efficient when you query by partition key.

---

**Q: What is the difference between consistency level ONE, QUORUM, and ALL?**

A: These control how many replicas must acknowledge a read or write before it is considered successful. ONE: only one replica must respond — fastest but may return stale data. QUORUM: majority of replicas (RF/2 + 1) must respond — balances consistency and availability. ALL: all replicas must respond — strongest consistency but fails if any replica is down. For strong consistency, use QUORUM for both reads and writes (R + W > RF).

---

**Q: How does Cassandra achieve high write throughput?**

A: Cassandra uses a log-structured merge-tree (LSM tree) approach: writes go to an in-memory structure (Memtable) and are immediately appended to a CommitLog (for durability). Memtables are periodically flushed to immutable on-disk SSTables. This avoids random disk writes — everything is sequential I/O, which is very fast. Compaction periodically merges SSTables and removes tombstones (deleted data markers).

---

**Q: What is a tombstone in Cassandra and why is it a concern?**

A: A tombstone is a deletion marker. When you delete data in Cassandra, it is not immediately removed — a tombstone is written so the deletion can propagate to all replicas. Tombstones are problematic because: (1) they accumulate over time and slow down reads (Cassandra must read through them), (2) if GC grace period (default 10 days) passes and a replica misses the deletion, the tombstone is purged but the data can resurrect. Best practice: avoid high-cardinality deletes, set TTL instead of deleting, and monitor tombstone warnings.

---

**Q: What is Cassandra's approach to multi-datacenter replication?**

A: Cassandra supports NetworkTopologyStrategy for multi-datacenter replication. You specify the replication factor per datacenter (e.g., RF=3 in US-East, RF=3 in EU-West). Each datacenter replicates independently. Applications can write to LOCAL_QUORUM (quorum within the local DC) for low latency while data replicates asynchronously to other DCs. This enables active-active multi-region deployments where any region can serve reads and writes.

---

## Technical Quick Reference
```
WRITE PATH: Client → Coordinator node → CommitLog + Memtable → ACK → (async flush to SSTable)
READ PATH: Check Memtable → Row cache → Bloom filter → SSTable key cache → SSTable

CAP: AP database (Available + Partition tolerant; configurable consistency)
Replication: consistent hashing ring; virtual nodes (vnodes) for even distribution
Compaction strategies: STCS (write-heavy), LCS (read-heavy), TWCS (time-series)

CQL DATA TYPES:
  text/varchar | int/bigint/smallint | float/double/decimal
  boolean | timestamp/date/time | uuid/timeuuid | blob
  list<type> | set<type> | map<key,value> | tuple | frozen<type>

ANTI-PATTERNS:
  SELECT * without partition key filter — full cluster scan
  Unbounded partitions (ever-growing list/set within one partition)
  Too many secondary indexes (use materialized views instead)
  Batch statements for performance (use only for atomicity on same partition)
```
