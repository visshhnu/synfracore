# Redis — Interview Questions

**What is Redis and when would you use it?**

Redis is an in-memory data structure store used as a database, cache, and message broker. Use it for: caching (session data, API responses), real-time leaderboards (sorted sets), job queues (lists), rate limiting (counters with TTL), pub/sub messaging. Do NOT use as primary database for large datasets — RAM is expensive. Always pair with a persistent database.




**How does indexing work and what happens without one?**

Redis does not use traditional indexes because all data is accessed by key in O(1). For secondary access patterns, you manually maintain index structures. Example: if you need to look up users by email, store a hash mapping email→user_id alongside the main user:id hash. Sorted sets function as indexes for range queries: ZRANGEBYSCORE leaderboard 1000 2000 finds all users with scores between 1000 and 2000 in O(log N + M).




**How do you handle database performance issues in production?**
Start with metrics: identify which queries are slow using slow query log or `SHOW PROCESSLIST` (MySQL), `pg_stat_statements` (PostgreSQL), `db.currentOp()` (MongoDB). Run EXPLAIN on the slow query — look for full table scans. Add appropriate indexes. If queries are already indexed, check for: N+1 query patterns (loop making individual DB calls), missing connection pool (too many connections), lock contention (transactions blocking each other), insufficient RAM (data not fitting in buffer pool/cache). Scale reads with read replicas. Consider caching hot data in Redis.

**What is ACID and does Redis support it?**
ACID = Atomicity (transaction is all-or-nothing), Consistency (data always valid per schema rules), Isolation (concurrent transactions don't interfere), Durability (committed data survives crashes).

Redis is not ACID compliant by default. Individual commands are atomic. MULTI/EXEC provides transaction-like behavior but without rollback on failure. Lua scripts are atomic. For true ACID, use a relational database and Redis only for caching.



