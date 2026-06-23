# Redis Intermediate Topics

## Data Structure Selection

```
User session       → HASH (field per attribute, TTL on whole key)
Rate limiting      → STRING with INCR + EXPIRE
Job queue          → LIST (RPUSH enqueue, BLPOP dequeue)
Unique visitors    → SET (SADD user IDs, SCARD for count)
Leaderboard        → SORTED SET (ZADD score member)
Daily Active Users → BITMAP (SETBIT day user_id 1)
Approx uniq count  → HYPERLOGLOG (PFADD, PFCOUNT)
Real-time feed     → STREAMS (XADD, XREAD, consumer groups)
Pub/Sub events     → PUBLISH/SUBSCRIBE
```

## Cache-Aside Pattern

```python
import redis, json

r = redis.Redis(decode_responses=True)

def get_user(user_id):
    key = f'user:{user_id}'
    # 1. Check cache
    cached = r.get(key)
    if cached:
        return json.loads(cached)
    # 2. Cache miss: load from DB
    user = db.query('SELECT * FROM users WHERE id = %s', user_id)
    # 3. Cache with TTL
    r.setex(key, 300, json.dumps(user))  # 5 min
    return user

def update_user(user_id, data):
    db.update('users', user_id, data)
    r.delete(f'user:{user_id}')  # Invalidate cache
```

## Rate Limiting

```python
import time

def is_rate_limited(user_id, limit=100, window=60):
    key = f'rate:{user_id}:{int(time.time() // window)}'
    count = r.incr(key)
    if count == 1:
        r.expire(key, window)  # Set TTL on first request
    return count > limit

# Sliding window (more accurate)
def sliding_window_limit(user_id, limit=100, window=60):
    now = time.time()
    key = f'ratelimit:{user_id}'
    pipe = r.pipeline()
    pipe.zremrangebyscore(key, '-inf', now - window)
    pipe.zadd(key, {str(now): now})
    pipe.zcard(key)
    pipe.expire(key, window)
    results = pipe.execute()
    return results[2] > limit
```

## Distributed Lock

```python
import uuid

def acquire_lock(resource, ttl=30):
    token = str(uuid.uuid4())
    # SET NX EX: atomic set-if-not-exists with expiry
    if r.set(f'lock:{resource}', token, nx=True, ex=ttl):
        return token
    return None  # Lock already held

def release_lock(resource, token):
    # Lua: atomic check-and-delete (prevent releasing other owner's lock)
    script = """
    if redis.call('get', KEYS[1]) == ARGV[1] then
        return redis.call('del', KEYS[1])
    end
    return 0
    """
    return bool(r.eval(script, 1, f'lock:{resource}', token))

# Usage
token = acquire_lock('payment:order123')
if token:
    try: process_payment()
    finally: release_lock('payment:order123', token)
```

## Pub/Sub

```python
# Publisher
r.publish('notifications', json.dumps({'type': 'order', 'id': 123}))

# Subscriber (blocking)
pubsub = r.pubsub()
pubsub.subscribe('notifications')
for message in pubsub.listen():
    if message['type'] == 'message':
        data = json.loads(message['data'])
        handle_notification(data)
```

## Revision Notes
```
CACHE-ASIDE: most common pattern. Check → miss → DB → cache.
WRITE-THROUGH: always write cache + DB together.
TTL: always set expiry to prevent memory leaks.

RATE LIMIT: INCR + EXPIRE per window (simple, fixed window)
SLIDING WINDOW: ZADD timestamps + ZREMRANGEBYSCORE + ZCARD

DISTRIBUTED LOCK: SET NX EX → Lua script release
Key: use Lua for release so you only delete YOUR lock

PUB/SUB: fire-and-forget, no message persistence
STREAMS: persistent messages, consumer groups, replay (use for reliability)
```
