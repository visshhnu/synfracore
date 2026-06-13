# System Design — Intermediate

## Design: Twitter/Feed System

```
Core Features:
  - Post tweet (280 chars, optional media)
  - Follow/unfollow users
  - Home timeline (tweets from followed users)
  - User timeline (user's own tweets)

Scale:
  300M monthly users, 100M daily active
  500M tweets/day = 5,800/sec writes
  Timeline reads = 10× writes = 58,000/sec

Two approaches for timeline generation:

PUSH (Fan-out on write):
  When user A tweets → push to all followers' timeline cache
  Fast reads (O(1) cache lookup)
  Expensive writes for users with millions of followers (celebrities)
  
PULL (Fan-out on read):
  When user loads timeline → pull tweets from all followed accounts
  Slow reads (merge N sorted lists)
  Simple writes

Twitter's actual solution: HYBRID
  Regular users (< 1M followers): fan-out on write
  Celebrities (> 1M followers): fan-out on read
  Twitter uses Redis for timeline cache, Cassandra for long-term storage

Components:
  Tweet Service: Create/delete tweets, media upload to S3
  User Service: Profiles, follow/unfollow relationships
  Timeline Service: Generate and cache timelines
  Search Service: Elasticsearch for tweet search
  Notification Service: Push notifications for mentions/likes
```

## Design: Rate Limiter

```python
# Algorithms:

# 1. Token Bucket: tokens added at fixed rate, consumed per request
class TokenBucket:
    def __init__(self, capacity, rate):
        self.tokens = capacity
        self.capacity = capacity
        self.rate = rate     # tokens per second
        self.last_time = time.time()
    
    def allow(self):
        now = time.time()
        self.tokens = min(
            self.capacity,
            self.tokens + (now - self.last_time) * self.rate
        )
        self.last_time = now
        if self.tokens >= 1:
            self.tokens -= 1
            return True
        return False

# 2. Sliding Window Counter (Redis-based, distributed)
def is_allowed(user_id, limit=100, window=60):
    key = f"ratelimit:{user_id}"
    now = time.time()
    
    pipe = redis.pipeline()
    pipe.zremrangebyscore(key, 0, now - window)  # Remove old
    pipe.zcard(key)                               # Count current
    pipe.zadd(key, {str(now): now})               # Add this request
    pipe.expire(key, window)
    
    _, count, _, _ = pipe.execute()
    return count < limit

# 3. Fixed Window Counter (simpler but has boundary issue)
def is_allowed_fixed(user_id, limit=100):
    key = f"rl:{user_id}:{int(time.time()) // 60}"  # Per-minute key
    count = redis.incr(key)
    redis.expire(key, 60)
    return count <= limit
```

## CAP Theorem and Consistency

```
CAP Theorem: In a distributed system, you can only guarantee 2 of 3:
  Consistency:   All nodes see same data at same time
  Availability:  Every request gets a response
  Partition Tolerance: System works despite network failures

Real systems:
  CP (consistent + partition tolerant):
    HBase, MongoDB, ZooKeeper, etcd
    Returns error rather than stale data
    
  AP (available + partition tolerant):
    Cassandra, DynamoDB, CouchDB
    Returns potentially stale data rather than error
    
  CA (consistent + available): Only possible without partitions
    Single-server PostgreSQL, MySQL (not distributed)

PACELC (extends CAP):
  Even without partitions: latency vs consistency trade-off
  Cassandra: PA + EL (available + eventual consistency, low latency)
  HBase: PC + EC (consistent even at cost of latency)
```
