# Redis — In-Memory Data Structure Store

Redis stores data in RAM, making it 100-1000× faster than disk databases. It's the Swiss Army knife of backend infrastructure — used as a cache, message queue, session store, rate limiter, leaderboard, and pub/sub system.

## What Redis Is Used For

| Use Case | Redis Feature | Example |
|---|---|---|
| **Caching** | String/Hash | Cache API responses, user sessions |
| **Session Store** | String + TTL | Web session storage |
| **Rate Limiting** | Incr + TTL | 100 requests/minute per user |
| **Leaderboards** | Sorted Set | Game rankings by score |
| **Message Queue** | List (BRPOP) | Job queues, task workers |
| **Pub/Sub** | Pub/Sub | Real-time notifications |
| **Distributed Lock** | SET NX PX | Prevent duplicate processing |
| **Counting** | Incr | Page views, analytics counters |

## Quick Start

```bash
# Start Redis
docker run -d --name redis -p 6379:6379 redis:7-alpine

# Connect
redis-cli
redis-cli -h host -p 6379 -a password

# Basic operations
SET name "Alice"
GET name          # "Alice"
DEL name
EXISTS name       # 0 or 1
TTL name          # -2=gone, -1=no expiry, N=seconds left
EXPIRE name 3600  # Set expiry
PERSIST name      # Remove expiry
KEYS user:*       # Pattern match (careful in production!)
SCAN 0 MATCH user:* COUNT 100  # Safe alternative to KEYS
```

## Data Structures

```bash
# Strings — simplest, most versatile
SET counter 0
INCR counter           # Atomic increment → 1
INCRBY counter 5       # → 6
MSET k1 v1 k2 v2      # Multiple set
MGET k1 k2             # Multiple get

# Hashes — object storage
HSET user:1 name "Alice" email "alice@example.com" age 30
HGET user:1 name
HGETALL user:1
HINCRBY user:1 age 1   # Atomic increment on hash field

# Lists — queues and stacks
LPUSH queue task1 task2  # Push to left
RPUSH queue task3        # Push to right
LPOP queue               # Pop from left (FIFO with RPUSH+LPOP)
BRPOP queue 0            # Blocking pop — wait until item available
LRANGE queue 0 -1        # Get all items

# Sets — unique collections
SADD tags python devops k8s
SMEMBERS tags
SISMEMBER tags python    # Check membership O(1)
SUNION tags1 tags2       # Union
SINTER tags1 tags2       # Intersection

# Sorted Sets — scored ranking
ZADD leaderboard 1500 alice 1200 bob 1800 charlie
ZRANGE leaderboard 0 -1 WITHSCORES REV  # Top to bottom
ZRANK leaderboard alice  # 0-based rank
ZINCRBY leaderboard 100 alice  # Add to score
```
