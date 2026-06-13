# Redis — Cheatsheet

```bash
# ── CONNECTION ────────────────────────────────────────────
redis-cli                                    # Connect local
redis-cli -h host -p 6379 -a password
redis-cli -u redis://:password@host:6379

# ── KEYS ──────────────────────────────────────────────────
KEYS pattern         # List keys (don't use in prod!)
SCAN 0 MATCH user:* COUNT 100  # Safe iteration
EXISTS key
TYPE key             # string/list/set/zset/hash/stream
TTL key              # -2=gone, -1=no expiry, N=seconds left
EXPIRE key 3600
PERSIST key          # Remove TTL
RENAME key newkey
DEL key1 key2

# ── STRINGS ───────────────────────────────────────────────
SET k v EX 3600 NX   # Set with expiry, only if not exists
GET k
GETSET k newval      # Get old, set new (atomic)
INCR k / INCRBY k 5 / INCRBYFLOAT k 1.5
MSET k1 v1 k2 v2 / MGET k1 k2
SETNX k v            # Set if not exists (lock pattern)
GETDEL k             # Get and delete

# ── HASHES ────────────────────────────────────────────────
HSET hash f1 v1 f2 v2
HGET hash field / HMGET hash f1 f2
HGETALL hash
HDEL hash field
HINCRBY hash field 1
HEXISTS hash field
HKEYS hash / HVALS hash / HLEN hash

# ── LISTS ─────────────────────────────────────────────────
LPUSH list v1 v2 / RPUSH list v1 v2
LPOP list / RPOP list
LPOP list 3          # Pop 3 elements (Redis 6.2+)
BLPOP list 0         # Blocking pop (0=wait forever)
BRPOP list 5         # Block 5 seconds
LRANGE list 0 -1     # All elements
LLEN list
LINDEX list 0        # Element at index
LSET list 0 newval
LINSERT list BEFORE pivot newval

# ── SETS ──────────────────────────────────────────────────
SADD set v1 v2 v3
SMEMBERS set
SISMEMBER set val    # O(1) membership check
SCARD set           # Count
SPOP set            # Remove and return random
SRANDMEMBER set 3   # Get 3 random without removing
SUNION s1 s2 / SINTER s1 s2 / SDIFF s1 s2
SUNIONSTORE dest s1 s2

# ── SORTED SETS ───────────────────────────────────────────
ZADD zset 100 member
ZADD zset NX 100 member   # Add only if not exists
ZSCORE zset member
ZRANK zset member / ZREVRANK zset member
ZINCRBY zset 50 member
ZRANGE zset 0 -1 WITHSCORES
ZRANGE zset 0 9 REV WITHSCORES  # Top 10
ZRANGEBYSCORE zset 100 500
ZRANGEBYLEX zset "[a" "[z"
ZCARD zset / ZCOUNT zset 100 500
ZREM zset member

# ── PUB/SUB ───────────────────────────────────────────────
SUBSCRIBE channel
PSUBSCRIBE user:*          # Pattern subscribe
PUBLISH channel message
UNSUBSCRIBE channel

# ── SERVER ────────────────────────────────────────────────
INFO all / INFO memory / INFO keyspace / INFO replication
CONFIG GET maxmemory / CONFIG SET maxmemory 4gb
DBSIZE               # Number of keys
FLUSHDB              # Delete all keys in current DB (careful!)
BGSAVE               # Background RDB snapshot
BGREWRITEAOF         # Rewrite AOF file
DEBUG SLEEP 0        # Ping test
SLOWLOG GET 10       # Last 10 slow commands
MONITOR              # Watch all commands (debug only)
```
