# Redis Troubleshooting Guide

## Issue 1: Keys being evicted unexpectedly

**Symptom:** Cache misses are high. Keys disappear before their TTL expires. Application shows frequent cache misses.

**Debug steps:**
```bash
# Check eviction stats
redis-cli INFO stats | grep evicted_keys
redis-cli INFO memory | grep maxmemory

# Check eviction policy
redis-cli CONFIG GET maxmemory-policy

# Monitor evictions in real time
redis-cli MONITOR   # WARNING: performance impact

# Check memory usage per key type
redis-cli INFO keyspace
redis-cli OBJECT ENCODING <key>
```

**Fix:**
```bash
# Increase maxmemory
redis-cli CONFIG SET maxmemory 4gb

# Change eviction policy based on use case
redis-cli CONFIG SET maxmemory-policy allkeys-lru    # LRU for general cache
redis-cli CONFIG SET maxmemory-policy volatile-lru   # only evict keys with TTL
redis-cli CONFIG SET maxmemory-policy noeviction     # return errors, never evict (for durable data)

# Make change permanent in redis.conf:
# maxmemory 4gb
# maxmemory-policy allkeys-lru
```

**Prevention:** Always set TTL on cache keys. Monitor `used_memory` vs `maxmemory` ratio. Alert when > 80%.

---

## Issue 2: Memory fragmentation — Redis using more RAM than keyspace

**Symptom:** `redis-cli INFO memory` shows `mem_fragmentation_ratio > 1.5`. OS reports high RSS but `used_memory` is lower.

**Root cause:** Freed memory not returned to OS (jemalloc behavior), or many small key deletions leaving gaps.

**Debug steps:**
```bash
redis-cli INFO memory | grep -E "used_memory:|mem_fragmentation|allocator"
# fragmentation_ratio > 1.5 = problem
# fragmentation_ratio < 1.0 = memory being swapped (also a problem)
```

**Fix:**
```bash
# Redis 4.0+: active defragmentation
redis-cli CONFIG SET activedefrag yes
redis-cli CONFIG SET active-defrag-ignore-bytes 100mb   # start defrag above this
redis-cli CONFIG SET active-defrag-threshold-lower 10   # % fragmentation to trigger

# Or restart Redis during low-traffic window (memory compacts on restart)
# Data: if AOF enabled, it replays on startup
```

---

## Issue 3: Connection limit reached

**Symptom:** `ERR max number of clients reached`. New connections rejected.

**Debug steps:**
```bash
redis-cli INFO clients | grep connected_clients
redis-cli INFO clients | grep maxclients
redis-cli CLIENT LIST | wc -l
redis-cli CLIENT LIST | grep idle | head -20   # find idle connections
```

**Fix:**
```bash
# Increase max connections
redis-cli CONFIG SET maxclients 10000

# Close idle clients
redis-cli CLIENT NO-EVICT on    # Redis 7.2+
# Or kill specific client
redis-cli CLIENT KILL ID <id>

# Real fix: use connection pooling in app
# Node.js: ioredis with pool
# Python: redis-py with ConnectionPool(max_connections=50)
```

**Prevention:** Always use connection pools, never create new connection per request. Set `timeout 300` in redis.conf to close idle connections.

---

## Issue 4: Latency spikes — command takes 100ms+

**Symptom:** Occasional slow responses. `redis-cli --latency` shows spikes. Application timeouts.

**Root cause:** Blocking command (KEYS *, SMEMBERS on huge set), SAVE/BGSAVE triggering fork, AOF rewrite, or TCP buffer exhaustion.

**Debug steps:**
```bash
# Check slow log
redis-cli SLOWLOG GET 10    # last 10 slow commands
redis-cli SLOWLOG LEN       # total count

# Set threshold (microseconds) to log commands slower than 10ms
redis-cli CONFIG SET slowlog-log-slower-than 10000

# Check latency history
redis-cli --latency-history -i 1   # sample every 1 second
```

**Fix:**
```bash
# Never use KEYS * in production — use SCAN instead
redis-cli SCAN 0 MATCH prefix:* COUNT 100   # iterates safely

# Disable blocking SAVE if latency critical
redis-cli CONFIG SET save ""                 # disable RDB saves
redis-cli CONFIG SET appendfsync everysec   # async AOF (instead of always)

# Increase TCP backlog for burst traffic
sysctl net.core.somaxconn=512
```

---

## Issue 5: Redis persistence issues — data loss after restart

**Symptom:** After Redis restart, keys are gone. AOF enabled but replay fails. RDB file corrupted.

**Debug steps:**
```bash
# Check persistence settings
redis-cli CONFIG GET save
redis-cli CONFIG GET appendonly

# Check last successful save
redis-cli LASTSAVE   # returns Unix timestamp
redis-cli INFO persistence | grep -E "aof_|rdb_"

# Verify RDB file integrity
redis-check-rdb /var/lib/redis/dump.rdb

# Verify AOF file
redis-check-aof /var/lib/redis/appendonly.aof
```

**Fix:**
```bash
# Enable AOF for durability (survives restart without data loss)
redis-cli CONFIG SET appendonly yes
redis-cli CONFIG SET appendfsync everysec   # good balance

# If AOF corrupted: fix it
redis-check-aof --fix /var/lib/redis/appendonly.aof

# If RDB only and data lost: restore from S3 backup
aws s3 cp s3://my-bucket/redis-backup.rdb /var/lib/redis/dump.rdb
systemctl restart redis
```

**Prevention:** Enable both RDB (point-in-time snapshots) and AOF. Back up RDB to S3 hourly. Test restore procedure monthly.
