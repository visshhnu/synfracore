# Redis — Fundamentals

## Data Structures and Commands

```bash
# String — caching, counters, session store
SET user:123 '{"id":123,"name":"Alice"}' EX 3600   # expire in 1 hour
GET user:123
INCR page:views               # atomic counter
INCRBY cart:123:total 2599    # add amount
SETNX lock:resource 1         # set if not exists (distributed lock)
GETDEL temp:key               # get and delete atomically

# Hash — object fields (memory efficient vs JSON string)
HSET user:123 name "Alice" email "alice@example.com" plan "pro"
HGET user:123 name
HGETALL user:123
HMSET user:123 name "Alice" plan "enterprise"
HINCRBY user:123 login_count 1

# List — queues, activity feeds
LPUSH tasks "send-email:user123"   # push to front
RPUSH tasks "resize-image:456"     # push to back
LRANGE tasks 0 -1                  # get all
BRPOP tasks 0                      # blocking pop (worker queue)
LPOP tasks 5                       # pop 5 items (Redis 6.2+)

# Set — unique collections, tags
SADD user:123:tags "python" "devops" "kubernetes"
SMEMBERS user:123:tags
SISMEMBER user:123:tags "python"    # check membership
SINTERSTORE common:tags user:123:tags user:456:tags  # intersection

# Sorted Set — leaderboards, rate limiting
ZADD leaderboard 1500 "alice" 1200 "bob" 1800 "charlie"
ZRANGE leaderboard 0 -1 WITHSCORES REV    # top to bottom
ZRANK leaderboard "alice"                  # rank of player
ZINCRBY leaderboard 100 "alice"           # add to score
ZRANGEBYSCORE leaderboard 1000 2000       # score range
```

## Caching Patterns

```python
import redis
import json
from functools import wraps

r = redis.Redis(host='localhost', port=6379, decode_responses=True)

# Cache-aside pattern
def get_user(user_id: int) -> dict:
    cache_key = f"user:{user_id}"

    # Try cache first
    cached = r.get(cache_key)
    if cached:
        return json.loads(cached)

    # Cache miss — fetch from DB
    user = db.query(User).filter_by(id=user_id).first()
    if not user:
        return None

    # Store in cache for 1 hour
    r.setex(cache_key, 3600, json.dumps(user.to_dict()))
    return user.to_dict()

# Cache invalidation
def update_user(user_id: int, data: dict):
    db.query(User).filter_by(id=user_id).update(data)
    db.commit()
    r.delete(f"user:{user_id}")  # Invalidate cache

# Decorator for function caching
def cache(ttl=300, key_prefix=""):
    def decorator(func):
        @wraps(func)
        def wrapper(*args, **kwargs):
            cache_key = f"{key_prefix}:{func.__name__}:{args}:{kwargs}"
            result = r.get(cache_key)
            if result:
                return json.loads(result)
            result = func(*args, **kwargs)
            r.setex(cache_key, ttl, json.dumps(result))
            return result
        return wrapper
    return decorator

@cache(ttl=600, key_prefix="api")
def expensive_query(filters: dict) -> list:
    return db.execute_complex_query(filters)
```

## Rate Limiting

```python
def is_rate_limited(user_id: str, limit: int = 100, window: int = 60) -> bool:
    """Sliding window rate limiter using sorted sets."""
    key = f"ratelimit:{user_id}"
    now = time.time()
    window_start = now - window

    pipe = r.pipeline()
    # Remove old entries outside window
    pipe.zremrangebyscore(key, 0, window_start)
    # Count requests in window
    pipe.zcard(key)
    # Add current request
    pipe.zadd(key, {str(now): now})
    # Set expiry
    pipe.expire(key, window)
    results = pipe.execute()

    return results[1] >= limit  # True = rate limited

# Token bucket using Lua script (atomic)
RATE_LIMIT_SCRIPT = """
local key = KEYS[1]
local limit = tonumber(ARGV[1])
local window = tonumber(ARGV[2])
local current = tonumber(redis.call('GET', key) or "0")
if current + 1 > limit then
    return 0
end
redis.call('INCR', key)
redis.call('EXPIRE', key, window)
return 1
"""
```

## Pub/Sub

```python
# Publisher
import redis
r = redis.Redis()

r.publish('user-events', json.dumps({
    'type': 'user.registered',
    'user_id': 123,
    'timestamp': time.time()
}))

# Subscriber (in separate process)
def handle_event(message):
    data = json.loads(message['data'])
    if data['type'] == 'user.registered':
        send_welcome_email(data['user_id'])

pubsub = r.pubsub()
pubsub.subscribe(**{'user-events': handle_event})
pubsub.run_in_thread(sleep_time=0.001)
```

## Production Configuration

```redis
# redis.conf — production settings
maxmemory 4gb
maxmemory-policy allkeys-lru     # Evict least recently used when full
                                  # Options: allkeys-lru, volatile-lru, allkeys-lfu

# Persistence
appendonly yes                    # AOF persistence
appendfsync everysec              # Sync to disk every second (balance of speed/safety)
save 900 1                        # RDB snapshot: after 900s if 1 key changed
save 300 10                       # After 300s if 10 keys changed

# Security
requirepass "strong-password"
rename-command FLUSHALL ""        # Disable dangerous commands
rename-command CONFIG ""          # In production

# Replication
replicaof 10.0.0.1 6379          # Make this a replica
replica-read-only yes
```
