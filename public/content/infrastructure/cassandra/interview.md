# Cassandra — Interview Questions

**What is Cassandra and when would you use it?**




Cassandra is a distributed NoSQL wide-column store built for massive scale and high availability. Use it for: write-heavy workloads (IoT sensor data, event logs), time-series data, global distribution (multi-region active-active), when you need linear scalability (add nodes, get proportional capacity). Trade-off: no JOINs, no transactions across partitions, schema design must match query patterns upfront.

**How does indexing work and what happens without one?**




Cassandra uses a different approach: the primary key IS the main data structure. The partition key hash determines which node stores the data (essentially a distributed hash table). Secondary indexes exist but are generally avoided for high-cardinality columns. Instead, Cassandra practitioners create separate tables for each query pattern — data duplication is intentional. Materialized views automate this pattern but have performance implications. The golden rule: one table per query pattern.

**How do you handle database performance issues in production?**
Start with metrics: identify which queries are slow using slow query log or `SHOW PROCESSLIST` (MySQL), `pg_stat_statements` (PostgreSQL), `db.currentOp()` (MongoDB). Run EXPLAIN on the slow query — look for full table scans. Add appropriate indexes. If queries are already indexed, check for: N+1 query patterns (loop making individual DB calls), missing connection pool (too many connections), lock contention (transactions blocking each other), insufficient RAM (data not fitting in buffer pool/cache). Scale reads with read replicas. Consider caching hot data in Redis.

**What is ACID and does Cassandra support it?**
ACID = Atomicity (transaction is all-or-nothing), Consistency (data always valid per schema rules), Isolation (concurrent transactions don't interfere), Durability (committed data survives crashes).




Cassandra is NOT ACID compliant. It is AP (Available + Partition Tolerant) in the CAP theorem. Individual partition-level operations are atomic. Lightweight transactions (IF NOT EXISTS) provide linearizability but at high performance cost. Choose Cassandra when availability and scale matter more than strict consistency.
