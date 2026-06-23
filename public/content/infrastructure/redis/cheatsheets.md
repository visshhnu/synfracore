# Redis Quick Reference

## Connection & Info
```bash
redis-cli                          # Local connect
redis-cli -h host -p 6379 -a pass  # Remote
redis-cli ping                     # Test connection
redis-cli info memory              # Memory stats
redis-cli info stats               # Request stats
redis-cli monitor                  # Watch live commands
redis-cli --bigkeys                # Find largest keys
redis-cli scan 0 match 'user:*' count 100  # Safe key scan
```

## Strings
```bash
SET key value EX 300       # Set with 300s TTL
SET key value NX           # Only if NOT exists
GET key                    # Get value
INCR counter               # Atomic increment
INCRBY counter 5           # Increment by 5
MSET k1 v1 k2 v2           # Set multiple
MGET k1 k2                 # Get multiple
TTL key                    # Time to live
PERSIST key                # Remove TTL
```

## Lists (Queue/Stack)
```bash
RPUSH queue item           # Enqueue (right)
LPOP queue                 # Dequeue (left)
LPUSH stack item           # Push (left)
LPOP stack                 # Pop (left)
LRANGE list 0 -1           # All elements
LLEN list                  # Length
BLPOP queue 10             # Blocking pop (10s timeout)
```

## Hashes
```bash
HSET user:1 name Alice age 30   # Set fields
HGET user:1 name               # Get one field
HGETALL user:1                 # All field-value pairs
HMGET user:1 name age          # Multiple fields
HINCRBY user:1 age 1           # Increment field
HDEL user:1 age                # Delete field
HEXISTS user:1 name            # Field exists?
```

## Sets
```bash
SADD tags 'redis' 'cache'      # Add members
SMEMBERS tags                  # Get all
SISMEMBER tags 'redis'         # Is member?
SCARD tags                     # Count
SREM tags 'cache'              # Remove
SUNION s1 s2                   # Union
SINTER s1 s2                   # Intersection
SDIFF s1 s2                    # Difference
```

## Sorted Sets (Leaderboard)
```bash
ZADD scores 1500 'Alice'       # Add with score
ZINCRBY scores 100 'Alice'     # Increment score
ZRANK scores 'Alice'           # Rank (0-based asc)
ZREVRANK scores 'Alice'        # Rank (desc)
ZSCORE scores 'Alice'          # Get score
ZRANGE scores 0 9 WITHSCORES   # Top 10 with scores
ZREVRANGE scores 0 9           # Top 10 descending
ZPOPMAX scores 1               # Remove highest
ZCARD scores                   # Count members
```

## Key Management
```bash
EXISTS key                     # Check if exists
DEL key1 key2                  # Delete keys
UNLINK key                     # Async delete
EXPIRE key 3600                # Set TTL (seconds)
TYPE key                       # string/list/hash/set/zset
RENAME key newkey              # Rename
SCAN 0 MATCH 'pattern' COUNT 100  # Safe iteration
```

## Transactions & Admin
```bash
MULTI                          # Start transaction
SET k1 v1 / INCR n            # Queue commands
EXEC                           # Execute all atomically
DISCARD                        # Abort transaction
WATCH key                      # Optimistic lock
FLUSHDB                        # Clear current DB (DANGER)
CONFIG SET maxmemory 2gb       # Set memory limit
CONFIG GET maxmemory-policy    # Get eviction policy
SLOWLOG GET 10                 # Last 10 slow commands
BGSAVE                         # Async save to disk
BGREWRITEAOF                   # Rewrite AOF
```

## Revision Notes
```
STRING: SET/GET/INCR — cache, counters, sessions
LIST:   RPUSH+LPOP=queue | LPUSH+LPOP=stack | BLPOP=blocking
HASH:   HSET/HGETALL — object storage (user profiles)
SET:    SADD/SMEMBERS — unique items, tags, friends
ZSET:   ZADD/ZRANGE — leaderboards, priority queues
SCAN not KEYS — KEYS blocks server on large DBs
MULTI/EXEC — transactions | WATCH — optimistic locking
```
