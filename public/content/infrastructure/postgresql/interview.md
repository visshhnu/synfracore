# PostgreSQL — Interview Questions

**What is PostgreSQL and when would you use it?**



PostgreSQL is an advanced open-source RDBMS known for standards compliance, extensibility, and reliability. Use it for: complex queries with JOINs, ACID transactions, JSON/JSONB storage (hybrid SQL/NoSQL), full-text search, geospatial data (PostGIS extension), time-series (TimescaleDB). PostgreSQL vs MySQL: PostgreSQL is more feature-rich and standards-compliant; MySQL has slightly simpler replication setup. Both are production-grade.


**How does indexing work and what happens without one?**



PostgreSQL uses B-tree indexes by default. Also supports: GiST (geometric data), GIN (array, JSONB, full-text), BRIN (time-series append-only), Hash (equality only). Partial indexes index only rows matching a condition — smaller and faster: CREATE INDEX idx_active ON users(email) WHERE is_active=true. EXPLAIN ANALYZE shows actual execution plan and whether indexes are used. Rule: index selectivity matters — an index on a boolean column (true/false) is rarely useful because it returns 50% of rows anyway.


**How do you handle database performance issues in production?**
Start with metrics: identify which queries are slow using slow query log or `SHOW PROCESSLIST` (MySQL), `pg_stat_statements` (PostgreSQL), `db.currentOp()` (MongoDB). Run EXPLAIN on the slow query — look for full table scans. Add appropriate indexes. If queries are already indexed, check for: N+1 query patterns (loop making individual DB calls), missing connection pool (too many connections), lock contention (transactions blocking each other), insufficient RAM (data not fitting in buffer pool/cache). Scale reads with read replicas. Consider caching hot data in Redis.

**What is ACID and does PostgreSQL support it?**
ACID = Atomicity (transaction is all-or-nothing), Consistency (data always valid per schema rules), Isolation (concurrent transactions don't interfere), Durability (committed data survives crashes).



PostgreSQL is one of the most ACID-compliant databases available. It implements MVCC (Multi-Version Concurrency Control) — readers never block writers, writers never block readers. Supports full ACID including SERIALIZABLE isolation level.

