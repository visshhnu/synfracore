# Redis — Interview Questions

**What is Redis and what makes it different from other databases?**
Redis is an in-memory data structure store — data lives primarily in RAM, making reads and writes at microsecond speed (vs milliseconds for disk databases). Unlike simple key-value stores, Redis supports rich data structures: strings, hashes, lists, sets, sorted sets, streams, bitmaps, and HyperLogLogs. It supports optional persistence (RDB snapshots and AOF logging), pub/sub messaging, Lua scripting, and transactions. The speed tradeoff: data size is limited by available RAM, and durability guarantees are weaker than disk-based databases.

**What are the Redis eviction policies?**
When Redis reaches maxmemory, it needs to evict keys. Policies: `allkeys-lru` removes the least recently used key across all keys — best for cache use cases. `volatile-lru` only evicts keys with TTL set. `allkeys-lfu` removes the least frequently used — better for skewed access patterns. `volatile-ttl` removes the key with the shortest remaining TTL. `noeviction` returns error when memory full — use when data loss is unacceptable. For pure caching: `allkeys-lru` or `allkeys-lfu`. For mixed cache/persistent: `volatile-lru`.

**How do you implement a distributed lock with Redis?**
Use SET with NX (only if not exists) and EX (expiry): `SET lock:resource <unique_value> NX PX 30000` — this atomically acquires a lock with 30-second TTL, preventing deadlock if the holder crashes. The unique value (UUID) is critical — use it to verify ownership before releasing, preventing a slow process from releasing a lock it no longer owns. Release atomically with a Lua script that checks value matches before DEL. In Python: `redis-py` has `lock()` method. In production: use Redlock algorithm for multi-instance Redis deployments.

**What is Redis Sentinel vs Redis Cluster?**
Sentinel provides high availability for a single Redis instance: monitors a master + replicas, promotes a replica to master on failure, notifies clients of the new master address. Suitable for datasets that fit on one node. Redis Cluster provides horizontal scaling by sharding data across multiple master nodes using consistent hashing (16384 hash slots). Each master can have replicas. Cluster handles both HA and scaling but adds complexity — multi-key operations only work if keys are on the same shard (use hash tags `{user:123}:field` to ensure colocation). Use Sentinel if data fits on one node; Cluster when you need to shard.

**What is Redis pipelining and when should you use it?**
Pipelining sends multiple commands to Redis without waiting for individual responses — batches round-trips. Without pipelining, N commands = N network round trips (each ~1ms over LAN = 1000ms total). With pipelining, N commands = 1 round trip. Use when you need to execute many independent commands (bulk imports, cache warming, stats updates). Don't pipeline when you need the result of one command to determine the next command. Different from transactions (MULTI/EXEC) — pipelining is a client-side optimization; transactions are server-side atomicity guarantees.
