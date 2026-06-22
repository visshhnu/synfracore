# Redis Interview Questions

## Core Concepts

**Q: What is Redis? What makes it fast?**

Redis (Remote Dictionary Server) is an in-memory data structure store used as cache, message broker, and database.

**Why it's fast:**
- Data lives in RAM (microsecond reads, not milliseconds from disk)
- Single-threaded event loop (no lock contention)
- Efficient data structures (skip lists, hash tables, linked lists optimised at C level)
- Persistence is optional and asynchronous

**Common use cases:**
- Caching (session data, API responses, database query results)
- Rate limiting (incr + expire)
- Pub/Sub messaging
- Leaderboards (sorted sets)
- Queues / Job queues (Redis Lists, Redis Streams)
- Distributed locks

---

**Q: Redis data structures — when to use each?**

| Structure | Use Case | Example |
|---|---|---|
| **String** | Cache, counters, sessions | `SET user:123:session "token123" EX 3600` |
| **List** | Queue, timeline, activity feed | `LPUSH notifications "new message" | RPOP` |
| **Hash** | Object/row storage | `HSET user:123 name "Alice" age "30"` |
| **Set** | Unique items, tags, friends | `SADD user:123:friends "456" "789"` |
| **Sorted Set** | Leaderboard, priority queue | `ZADD leaderboard 1500 "player1"` |
| **Stream** | Event log, message queue | `XADD events "*" action "purchase"` |
| **Bitmap** | Feature flags, daily active users | `SETBIT users:active:2024-01-15 user_id 1` |
| **HyperLogLog** | Approximate unique count | `PFADD visitors "ip1" "ip2"` |

---

**Q: Redis persistence — RDB vs AOF.**

**RDB (Redis Database Backup)**: Point-in-time snapshots.
- Saves entire dataset to disk at configured intervals
- Compact binary format, fast to restore
- Data loss: up to last snapshot (minutes/hours)
- Good for: disaster recovery, backups, when some data loss is acceptable

**AOF (Append Only File)**: Logs every write command.
- `appendfsync everysec`: fsync every second (1 second data loss max)
- `appendfsync always`: fsync every write (no loss, very slow)
- `appendfsync no`: OS decides (fast, unpredictable loss)
- Larger files than RDB. Can be rewritten/compacted (`BGREWRITEAOF`).

**Best practice production**: Enable both. AOF for minimal data loss, RDB for fast recovery.

---

**Q: Redis replication and clustering.**

**Replication (Master-Replica)**:
```
redis.conf: replicaof master-host 6379
```
Async replication. Replica is read-only. If master fails, need manual failover or Sentinel.

**Redis Sentinel**: Monitors master/replicas, auto-failover, service discovery.
- Minimum 3 Sentinel nodes (quorum = 2)
- Promotes replica to master automatically on failure

**Redis Cluster**: Automatic sharding + HA for large datasets.
- Data split across 16384 hash slots
- Each shard has master + replicas
- Handles keys: `cluster keyslot mykey` → slot number → routed to correct node
- Limitation: multi-key operations only work if all keys in same slot (use hash tags `{user}:session` and `{user}:profile` forced to same slot)

---

**Q: Cache invalidation strategies.**

**TTL (Time-to-Live)**: Set expiry on keys. Simple but may serve stale data.
```bash
SET cache:user:123 "data" EX 300   # Expires in 5 minutes
```

**Cache-aside (lazy loading)**: App checks cache → miss → load from DB → write to cache.
```python
data = redis.get(key)
if not data:
    data = db.query(...)
    redis.setex(key, 300, data)
```

**Write-through**: Write to cache AND DB simultaneously. Always fresh. Higher write latency.

**Write-behind (write-back)**: Write to cache, asynchronously flush to DB. Fast writes, risk of data loss.

**Cache stampede / thundering herd**: Many concurrent cache misses → all query DB simultaneously.
Fix: Probabilistic early expiration, mutex lock, background refresh.

---

**Q: Rate limiting with Redis.**

```python
# Sliding window rate limiter: max 100 requests per minute
def is_allowed(user_id: str) -> bool:
    key = f"rate:{user_id}:{int(time.time() // 60)}"
    count = redis.incr(key)
    if count == 1:
        redis.expire(key, 60)
    return count <= 100

# Token bucket with Redis (more flexible)
# MULTI/EXEC for atomicity, or Lua scripts for CAS operations
```

**Distributed lock (Redlock):**
```python
# Simple single-node lock
lock_key = "lock:resource"
acquired = redis.set(lock_key, "owner-id", nx=True, ex=30)  # nx=only if not exists
if acquired:
    try:
        # Do critical section
        pass
    finally:
        # Release only if we own it (Lua script for atomicity)
        redis.delete(lock_key)
```

## Revision Notes
```
REDIS: In-memory, single-threaded, microsecond latency
Use cases: cache, rate limiting, pub/sub, leaderboard, queues, distributed locks

DATA STRUCTURES:
String: cache/counter | Hash: object fields | List: queue/timeline
Set: unique members | Sorted Set: leaderboard | Stream: event log
Bitmap: flags/DAU | HyperLogLog: approx unique count

PERSISTENCE:
RDB: snapshots (fast restore, more data loss) 
AOF: append every write (less data loss, larger files)
Best practice: both enabled

HA:
Sentinel: auto-failover for single master (3+ sentinels)
Cluster: sharding + HA (16384 hash slots, use hash tags for multi-key ops)

CACHE PATTERNS:
Cache-aside (lazy): check cache → miss → load DB → write cache
Write-through: write cache + DB together
TTL: simple expiry

RATE LIMITING: INCR + EXPIRE per time window
DISTRIBUTED LOCK: SET nx ex + Lua script for release
```
