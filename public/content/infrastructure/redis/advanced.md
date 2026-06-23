# Redis Advanced Topics

## Sentinel — High Availability

```bash
# Minimum 3 Sentinel nodes for production quorum
# sentinel.conf
sentinel monitor mymaster 127.0.0.1 6379 2  # quorum=2
sentinel down-after-milliseconds mymaster 5000
sentinel failover-timeout mymaster 60000

# Start sentinel
redis-sentinel /etc/redis/sentinel.conf

# Check status
redis-cli -p 26379 sentinel masters
redis-cli -p 26379 sentinel get-master-addr-by-name mymaster
redis-cli -p 26379 sentinel failover mymaster  # Force failover
```

## Redis Cluster — Sharding

```bash
# Create 3 primary + 3 replica cluster
redis-cli --cluster create \
  127.0.0.1:7000 127.0.0.1:7001 127.0.0.1:7002 \
  127.0.0.1:7003 127.0.0.1:7004 127.0.0.1:7005 \
  --cluster-replicas 1

# Check cluster health
redis-cli -c -p 7000 cluster info
redis-cli -c -p 7000 cluster nodes
redis-cli cluster keyslot mykey        # Which slot

# Hash tags: force same slot
# {user:123}:session and {user:123}:profile -> same slot
MSET '{user:123}:session' token '{user:123}:profile' data
```

16,384 hash slots distributed across nodes via CRC16.
Multi-key ops only work when all keys share same slot — use hash tags.

## Memory Optimisation

```bash
# Check memory
redis-cli info memory | grep used_memory_human
redis-cli object encoding mykey        # Internal encoding
redis-cli memory usage mykey           # Bytes for one key
redis-cli --bigkeys                    # Find large keys

# Eviction policies (when maxmemory reached)
# allkeys-lru  — cache use case (evict any key, LRU order)
# volatile-lru — only evict keys WITH TTL
# allkeys-lfu  — by least frequently used (Redis 4.0+)
# noeviction   — return error (protect data, default)
redis-cli config set maxmemory-policy allkeys-lru
redis-cli config set maxmemory 4gb

# Compact encoding thresholds (keep small = use ziplist/listpack)
redis-cli config set hash-max-listpack-entries 128
redis-cli config set zset-max-listpack-entries 128
```

## Persistence Configuration

```bash
# RDB snapshots
redis-cli config set save '3600 1 300 100 60 10000'
redis-cli config set rdbcompression yes

# AOF (Append Only File)
redis-cli config set appendonly yes
redis-cli config set appendfsync everysec   # Best balance
redis-cli config set auto-aof-rewrite-percentage 100
redis-cli config set auto-aof-rewrite-min-size 64mb

# Check persistence
redis-cli info persistence
redis-cli lastsave                          # Last RDB timestamp
redis-cli bgsave                            # Trigger RDB save
redis-cli bgrewriteaof                      # Rewrite AOF
```

## Lua Scripting and Pipeline

```python
import redis

r = redis.Redis()

# Pipeline: batch commands, one round trip (1000x faster for bulk)
pipe = r.pipeline()
for i in range(1000):
    pipe.set(f'key:{i}', i)
pipe.execute()

# Lua script: atomic, no interleaving
release_lock = r.register_script(
    """
    if redis.call('get', KEYS[1]) == ARGV[1] then
        return redis.call('del', KEYS[1])
    end
    return 0
    """
)
release_lock(keys=['lock:resource'], args=['my-token'])
```

## Production Checklist

```
SECURITY:
  requirepass / ACL for authentication
  bind to specific IP (not 0.0.0.0)
  TLS for external connections
  rename-command FLUSHALL '' (disable in prod)

HA:
  3+ Sentinel nodes (quorum = 2)
  Replica on separate AZ/rack
  Or: Redis Cluster for sharding + HA

PERSISTENCE:
  AOF everysec + RDB for backup
  Test restore quarterly
  Backup to S3 automatically

PERFORMANCE:
  echo never > /sys/kernel/mm/transparent_hugepage/enabled
  vm.overcommit_memory = 1 (for BGSAVE fork)
  Pipeline for bulk ops
  SCAN not KEYS in production

MONITORING:
  Alert: memory > 80%, rejected_connections > 0
  slowlog-log-slower-than 10000 (10ms)
```

## Revision Notes
```
SENTINEL: 3+ nodes, quorum=2, auto-failover for single master
CLUSTER: 16384 slots, hash tags {key} for multi-key ops
EVICTION: allkeys-lru (cache) | noeviction (data store)
PIPELINE: batch = single round trip = massive speedup
LUA: atomic scripts, use for CAS operations
PERSISTENCE: RDB (backup) + AOF everysec (minimal data loss)
```
