# MySQL — Interview Questions

**What is MySQL and when would you use it?**
MySQL is an open-source relational database (RDBMS) that stores data in tables with rows and columns. Use it for: transactional applications (e-commerce, banking), structured data with relationships, applications requiring ACID compliance, read-heavy workloads with proper indexing. Do NOT use for: massive write throughput (Cassandra is better), flexible/unstructured data (MongoDB), caching (Redis), full-text search (Elasticsearch).





**How does indexing work and what happens without one?**
An index in MySQL is a B+ tree data structure that allows the database to find rows in O(log n) instead of O(n). Without an index on a searched column, MySQL does a full table scan — reads every row. On a 10 million row table, a full scan reads ~10 million rows; an index scan reads ~23 rows (log base 2 of 10M ≈ 23). Rule of thumb: index every column in WHERE, JOIN ON, and ORDER BY clauses. Downside: indexes slow down INSERT/UPDATE/DELETE (index must be updated too). Composite indexes: column order matters — leftmost columns can be used independently.





**How do you handle database performance issues in production?**
Start with metrics: identify which queries are slow using slow query log or `SHOW PROCESSLIST` (MySQL), `pg_stat_statements` (PostgreSQL), `db.currentOp()` (MongoDB). Run EXPLAIN on the slow query — look for full table scans. Add appropriate indexes. If queries are already indexed, check for: N+1 query patterns (loop making individual DB calls), missing connection pool (too many connections), lock contention (transactions blocking each other), insufficient RAM (data not fitting in buffer pool/cache). Scale reads with read replicas. Consider caching hot data in Redis.

**What is ACID and does MySQL support it?**
ACID = Atomicity (transaction is all-or-nothing), Consistency (data always valid per schema rules), Isolation (concurrent transactions don't interfere), Durability (committed data survives crashes).
MySQL InnoDB storage engine is fully ACID compliant. MyISAM (older engine) is not — avoid it.




