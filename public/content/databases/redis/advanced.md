# Redis — Advanced

## Redis Cluster

```python
from redis.cluster import RedisCluster

# Connect to Redis Cluster (shards data across nodes automatically)
rc = RedisCluster(
    host="redis-cluster.example.com",
    port=6379,
    password="secret",
    decode_responses=True,
    skip_full_coverage_check=True
)

# Hash tags — force keys to same shard for multi-key operations
# Keys with {same-tag} hash the same way
rc.set("{user:123}:session", "data1")
rc.set("{user:123}:preferences", "data2")
rc.set("{user:123}:cart", "data3")
# All on same shard → MGET, pipeline, and transactions work

# Operations that DON'T work across shards:
# - MSET/MGET with different hash slots
# - Transactions touching multiple shards
# - SUNION/SINTER across shards
```

## KeyDB and Dragonfly (Redis Alternatives)

```bash
# KeyDB — multi-threaded Redis fork, higher throughput on multi-core hardware
# Drop-in replacement, same protocol
docker run -p 6379:6379 eqalpha/keydb
# Same client code, same commands

# Dragonfly — modern Redis replacement, uses all CPU cores
docker run -p 6379:6379 docker.dragonflydb.io/dragonflydb/dragonfly
# Compatible with Redis clients and protocol
# *(needs verification — both projects publish specific throughput multiplier
# claims (e.g. "5-10x", "25x") in their own benchmarks; these are highly
# workload- and hardware-dependent, so verify against your own workload
# rather than treating a vendor benchmark number as universal)*
```

## Production Configuration

```ini
# redis.conf — production hardening

# Memory
maxmemory 8gb
maxmemory-policy allkeys-lru   # Evict LRU keys when full (for cache)
# Options: allkeys-lru, allkeys-lfu, volatile-lru, volatile-ttl, noeviction

# Persistence
appendonly yes                  # AOF for durability
appendfsync everysec            # Sync every second (balanced)
save 900 1                      # RDB snapshot: 1 change in 900s
save 300 10
save 60 10000
# Both AOF + RDB = best recovery options

# Security
requirepass "strong-random-password-here"
rename-command FLUSHALL ""     # Disable dangerous commands
rename-command FLUSHDB ""
rename-command CONFIG "CONFIG_RENAMED_XXXX"

# Network
bind 10.0.0.1 127.0.0.1        # Only listen on internal interfaces
protected-mode yes
tcp-backlog 511

# Performance
tcp-keepalive 300
hz 10                           # Background tasks frequency
lazyfree-lazy-eviction yes      # Non-blocking eviction
lazyfree-lazy-expire yes        # Non-blocking TTL expiry
io-threads 4                    # (Redis 6+) Parallel I/O
```
