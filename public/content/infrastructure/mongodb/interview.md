# MongoDB — Interview Questions

**What is MongoDB and when would you use it?**


MongoDB is a NoSQL document database storing JSON-like documents. Use it for: flexible schema (user profiles, product catalogs), rapid iteration (schema changes without migrations), hierarchical data (embedded documents), horizontal scaling. Do NOT use for: complex transactions across multiple collections, data with many relationships (SQL is better), analytics with complex aggregations (use BigQuery or Snowflake).



**How does indexing work and what happens without one?**


MongoDB uses B-tree indexes. Without an index, queries do a collection scan — check every document. Create indexes with db.collection.createIndex(). Types: single field, compound (up to 32 fields), multikey (arrays), text (full-text search), geospatial. Use explain() to see if index is used: db.users.find({email: "alice@test.com"}).explain("executionStats") — look for IXSCAN vs COLLSCAN. One important rule: a query can only use one index (compound indexes help cover multiple conditions).



**How do you handle database performance issues in production?**
Start with metrics: identify which queries are slow using slow query log or `SHOW PROCESSLIST` (MySQL), `pg_stat_statements` (PostgreSQL), `db.currentOp()` (MongoDB). Run EXPLAIN on the slow query — look for full table scans. Add appropriate indexes. If queries are already indexed, check for: N+1 query patterns (loop making individual DB calls), missing connection pool (too many connections), lock contention (transactions blocking each other), insufficient RAM (data not fitting in buffer pool/cache). Scale reads with read replicas. Consider caching hot data in Redis.

**What is ACID and does MongoDB support it?**
ACID = Atomicity (transaction is all-or-nothing), Consistency (data always valid per schema rules), Isolation (concurrent transactions don't interfere), Durability (committed data survives crashes).


MongoDB supports multi-document ACID transactions since v4.0 (replica sets) and v4.2 (sharded clusters). Single-document operations are always atomic. For most cases, embedding related data in one document avoids the need for multi-document transactions.


