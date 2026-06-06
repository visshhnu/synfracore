# Redis — In-Memory Data Store

Redis is the most widely used caching and in-memory data structure store in production systems. It's at the heart of almost every high-scale web application — session management, caching, rate limiting, leaderboards, pub/sub messaging, and more.

## What is Redis?

Redis (Remote Dictionary Server) is an open-source, in-memory key-value store that persists data to disk. It supports rich data structures: strings, lists, sets, sorted sets, hashes, streams, bitmaps, and HyperLogLog.

**Why Redis is everywhere:**
- Microsecond latency (sub-millisecond reads)
- Atomic operations on complex data structures
- Built-in expiration (TTL) — perfect for caching
- Pub/sub for real-time messaging
- Single-threaded (no locking needed for most operations)
- Cluster mode for horizontal scaling

## Installation & Connection

```bash
# Docker (recommended for dev)
docker run -d --name redis -p 6379:6379 redis:7-alpine

# Ubuntu
sudo apt install redis-server
sudo systemctl enable --now redis

# Connect
redis-cli
redis-cli -h hostname -p 6379 -a password
redis-cli -u "redis://:password@hostname:6379/0"

# Test connection
redis-cli ping    # Returns: PONG
redis-cli info server | grep redis_version
```

## Core Data Structures

### Strings — Most Basic
```bash
SET user:1:name "Alice"
GET user:1:name          # "Alice"
SET counter 0
INCR counter             # 1 (atomic increment)
INCRBY counter 10        # 11
DECR counter             # 10

# With expiration (TTL)
SET session:abc123 "user_data" EX 3600    # Expires in 1 hour
SET token:xyz "jwt_token" PX 900000       # Expires in 900 seconds
TTL session:abc123                         # Check remaining TTL
PERSIST session:abc123                     # Remove expiration

# SETNX — Set if Not eXists (distributed locking pattern)
SET lock:resource "worker_id" NX EX 30    # Acquire lock
```

### Hashes — Objects
```bash
HSET user:1 name "Alice" email "alice@example.com" age 30
HGET user:1 name           # "Alice"
HMGET user:1 name email    # ["Alice", "alice@example.com"]
HGETALL user:1             # All fields
HKEYS user:1               # ["name", "email", "age"]
HINCRBY user:1 age 1       # Atomic increment of field
HDEL user:1 age            # Delete field
HEXISTS user:1 email       # 1 (true)
```

### Lists — Queues & Stacks
```bash
# Push to list
LPUSH jobs "job1" "job2"   # Push to front: [job2, job1]
RPUSH jobs "job3"          # Push to back:  [job2, job1, job3]

# Pop from list
LPOP jobs                  # job2 (from front)
RPOP jobs                  # job3 (from back)

# Blocking pop (wait for item — message queue pattern)
BLPOP jobs 30              # Block up to 30 seconds waiting for item

# Range
LRANGE jobs 0 -1           # All items
LLEN jobs                  # Length

# Trim (keep only recent N items)
RPUSH notifications "msg1" "msg2" "msg3"
LTRIM notifications 0 99   # Keep only last 100
```

### Sets — Unique Collections
```bash
SADD online_users "alice" "bob" "charlie"
SISMEMBER online_users "alice"    # 1 (true)
SMEMBERS online_users             # {alice, bob, charlie}
SCARD online_users                # 3 (count)
SREM online_users "bob"           # Remove member

# Set operations (social features)
SADD user:1:following "bob" "charlie"
SADD user:2:following "alice" "charlie"
SINTER user:1:following user:2:following   # Common: {charlie}
SUNION user:1:following user:2:following   # All: {bob, charlie, alice}
SDIFF user:1:following user:2:following    # Only in user:1: {bob}
```

### Sorted Sets — Leaderboards & Rankings
```bash
ZADD leaderboard 1500 "alice"
ZADD leaderboard 2000 "bob"
ZADD leaderboard 1800 "charlie"

ZRANK leaderboard "alice"      # 0 (rank, 0-based, ascending)
ZREVRANK leaderboard "alice"   # 2 (rank, 0-based, descending = #3)
ZSCORE leaderboard "bob"       # 2000 (score)

ZINCRBY leaderboard 100 "alice"   # alice now has 1600

# Range by rank (top 10)
ZREVRANGE leaderboard 0 9 WITHSCORES

# Range by score
ZRANGEBYSCORE leaderboard 1500 2000 WITHSCORES

# Use case: rate limiting with sliding window
ZADD rate:user:1 1703000000 "req1"
ZADD rate:user:1 1703000001 "req2"
ZREMRANGEBYSCORE rate:user:1 0 [current_time - 60]  # Remove old
ZCARD rate:user:1  # Count requests in last 60 seconds
```

## Production Patterns

### Caching with Cache-Aside Pattern

```python
import redis
import json
from typing import Optional, Any
import hashlib

r = redis.Redis(host='localhost', port=6379, decode_responses=True)

def cache_get(key: str) -> Optional[Any]:
    value = r.get(key)
    if value:
        return json.loads(value)
    return None

def cache_set(key: str, value: Any, ttl: int = 300):
    r.setex(key, ttl, json.dumps(value))

def get_user(user_id: int) -> dict:
    cache_key = f"user:{user_id}"

    # 1. Check cache
    cached = cache_get(cache_key)
    if cached:
        return cached

    # 2. Cache miss — fetch from DB
    user = db.query("SELECT * FROM users WHERE id = %s", user_id)

    # 3. Store in cache (5 minute TTL)
    cache_set(cache_key, user, ttl=300)

    return user

def invalidate_user(user_id: int):
    r.delete(f"user:{user_id}")
```

### Rate Limiting

```python
import time

def is_rate_limited(user_id: str, limit: int = 100, window: int = 60) -> bool:
    """Sliding window rate limiter using sorted sets."""
    key = f"rate:{user_id}"
    now = time.time()
    window_start = now - window

    pipe = r.pipeline()
    # Remove old requests outside window
    pipe.zremrangebyscore(key, 0, window_start)
    # Count requests in current window
    pipe.zcard(key)
    # Add current request
    pipe.zadd(key, {str(now): now})
    # Set expiry
    pipe.expire(key, window)
    results = pipe.execute()

    request_count = results[1]
    return request_count >= limit

# Usage
if is_rate_limited(user_id="user123", limit=100, window=60):
    return {"error": "Rate limit exceeded"}, 429
```

### Distributed Lock

```python
import uuid

def acquire_lock(lock_name: str, expire: int = 30) -> Optional[str]:
    """Returns lock token if acquired, None if already locked."""
    token = str(uuid.uuid4())
    acquired = r.set(f"lock:{lock_name}", token, nx=True, ex=expire)
    return token if acquired else None

def release_lock(lock_name: str, token: str) -> bool:
    """Only release if we own the lock (prevents accidental release)."""
    lua_script = """
    if redis.call("get", KEYS[1]) == ARGV[1] then
        return redis.call("del", KEYS[1])
    else
        return 0
    end
    """
    result = r.eval(lua_script, 1, f"lock:{lock_name}", token)
    return bool(result)

# Usage
token = acquire_lock("payment_processor")
if token:
    try:
        process_payment()
    finally:
        release_lock("payment_processor", token)
else:
    # Another process is running
    raise Exception("Lock not available")
```

### Pub/Sub — Real-time Messaging

```python
import redis
import threading

# Publisher
def publish_event(channel: str, event: dict):
    r.publish(channel, json.dumps(event))

publish_event("order_events", {"type": "order_created", "order_id": 123})

# Subscriber (runs in separate thread/process)
def subscribe_to_events():
    subscriber = redis.Redis().pubsub()
    subscriber.subscribe("order_events")

    for message in subscriber.listen():
        if message["type"] == "message":
            event = json.loads(message["data"])
            print(f"Received: {event}")
            process_event(event)

thread = threading.Thread(target=subscribe_to_events, daemon=True)
thread.start()
```

## Redis in Kubernetes

```yaml
# Redis deployment with persistence
apiVersion: apps/v1
kind: StatefulSet
metadata:
  name: redis
spec:
  serviceName: redis
  replicas: 1
  selector:
    matchLabels:
      app: redis
  template:
    spec:
      containers:
      - name: redis
        image: redis:7-alpine
        args: ["redis-server", "--appendonly", "yes",
               "--requirepass", "$(REDIS_PASSWORD)"]
        env:
        - name: REDIS_PASSWORD
          valueFrom:
            secretKeyRef:
              name: redis-secret
              key: password
        ports:
        - containerPort: 6379
        resources:
          requests:
            memory: "256Mi"
            cpu: "100m"
          limits:
            memory: "1Gi"
            cpu: "500m"
        volumeMounts:
        - name: data
          mountPath: /data
  volumeClaimTemplates:
  - metadata:
      name: data
    spec:
      accessModes: ["ReadWriteOnce"]
      resources:
        requests:
          storage: 10Gi
```

## Interview Questions

**What is the difference between Redis persistence options RDB and AOF?**
RDB (Redis Database) creates point-in-time snapshots of the dataset at specified intervals. Fast for recovery, compact file, but you lose data since the last snapshot if Redis crashes. AOF (Append Only File) logs every write operation — on restart, Redis replays the log to reconstruct state. Near-zero data loss but larger file and slower startup. Production recommendation: use both — AOF for durability, RDB for faster backup/restore. Most managed Redis services (ElastiCache, Redis Cloud) handle this automatically.

**How does Redis handle concurrency if it's single-threaded?**
Redis uses an event loop (like Node.js) — a single thread handles all client connections via I/O multiplexing. Because operations are atomic and execute in microseconds, no operation blocks another. The single-threaded model eliminates locking overhead entirely. Redis 6.0+ added multi-threaded I/O for network handling (reading/writing to sockets), but command execution is still single-threaded. This is why Redis is so fast — no mutex contention, no context switching for command execution.

**When would you use Redis Cluster?**
Redis Cluster shards data across multiple nodes automatically using hash slots (16,384 slots divided among nodes). Use it when: dataset exceeds single-node memory, you need horizontal write scaling, or you need fault tolerance with automatic failover. Each node handles a subset of keys. Multi-key operations (MGET, pipelines) only work when all keys are on the same node — use hash tags `{user:1}:profile` and `{user:1}:settings` to force keys to the same slot.
