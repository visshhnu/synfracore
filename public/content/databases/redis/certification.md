# Redis Certification Guide

## Certifications Available

| Cert | Provider | Cost | Format |
|------|----------|------|--------|
| **Redis Certified Developer** | Redis | $200 | MCQ + practical |
| **Redis Certified Administrator** | Redis | $200 | MCQ + practical |
| **Redis University free courses** | Redis | Free | Self-paced with badges |

Redis University at university.redis.com offers free learning paths and paid certification exams.

---

## Core Commands by Data Type

```bash
# STRINGS
SET session:abc token123 EX 3600    # with TTL
GET session:abc
INCR page:views                      # atomic counter
MSET k1 v1 k2 v2 && MGET k1 k2

# LISTS (queue/stack)
RPUSH queue job1 job2    # enqueue right
LPOP queue               # dequeue left
BLPOP queue 10           # blocking pop (10s timeout)
LRANGE list 0 -1         # all elements

# HASHES (objects)
HSET user:1 name Alice age 30 city Mumbai
HGET user:1 name
HGETALL user:1
HINCRBY user:1 age 1

# SETS (unique, unordered)
SADD tags:post:1 redis nosql cache
SMEMBERS tags:post:1
SINTER set1 set2    # intersection
SUNION set1 set2    # union

# SORTED SETS (ranked / leaderboard)
ZADD leaderboard 1500 alice 1200 bob 900 carol
ZRANK leaderboard alice             # 0-based rank ascending
ZREVRANK leaderboard alice          # 0-based rank descending
ZRANGE leaderboard 0 9 WITHSCORES  # top 10

# EXPIRY
TTL key           # -1=no expiry  -2=key missing  N=seconds left
EXPIRE key 3600   # set TTL
PERSIST key       # remove TTL

# DISTRIBUTED LOCK
SET lock:resource client-token NX EX 30
# NX = only set if not exists | EX 30 = auto-expire after 30s
# Returns OK (lock acquired) or nil (already locked)
```

---

## Architecture Concepts

```
PERSISTENCE:
  RDB: point-in-time snapshots (BGSAVE) — fast restart, possible data loss
  AOF: append every write command — near-zero data loss, larger files
  Recommended: enable BOTH (RDB for fast restart, AOF for durability)

HIGH AVAILABILITY:
  Sentinel: 3+ sentinel processes monitor master + replicas
    Auto-promotes replica on master failure
    Quorum = majority must agree (typically 2 of 3 sentinels)
  Cluster: partitions keyspace into 16,384 hash slots across nodes
    Each master owns a range, has at least 1 replica
    Automatic resharding when nodes are added or removed

EVICTION POLICIES (when maxmemory limit is reached):
  allkeys-lru:   evict any key by LRU — best for pure cache
  volatile-lru:  evict only TTL-bearing keys by LRU
  allkeys-lfu:   evict by least frequently used (Redis 4.0+)
  noeviction:    return OOM error — use when Redis is a data store

TRANSACTIONS:
  MULTI/EXEC:  queue commands then execute atomically
  WATCH key:   optimistic lock — abort EXEC if key changed
  EVAL script: Lua runs atomically, no command interleaving

COMMON USE CASES:
  Cache:       SET key value EX ttl
  Session:     HSET session:id field value EX ttl
  Rate limit:  INCR counter + EXPIRE (sliding window)
  Job queue:   RPUSH + BLPOP (producer/consumer pattern)
  Pub/Sub:     PUBLISH channel msg + SUBSCRIBE channel
  Leaderboard: ZADD + ZRANGE with scores
```

---

## Study Resources

- **Redis University** (university.redis.com) — free courses and certification prep
- **Redis Docs** (redis.io/docs) — full command reference and architecture guides
- **TryRedis** (try.redis.io) — interactive browser-based playground
- **Redis Insight** — free GUI tool for exploring and profiling Redis data

## Revision Notes
```
DATA TYPES: String | List | Hash | Set | Sorted Set | Stream | Bitmap | HyperLogLog
COMMANDS:   SET/GET/INCR | LPUSH/RPUSH/LPOP | HSET/HGETALL | SADD/SMEMBERS | ZADD/ZRANGE
PERSISTENCE: RDB (snapshots, fast restore) + AOF (write log, durable) — use both
HA: Sentinel (automatic failover) | Cluster (sharding + HA, 16384 hash slots)
EVICTION: allkeys-lru for caches | noeviction for persistent data stores
LOCK: SET key token NX EX 30 — atomic set-if-not-exists with auto-expiry
```
