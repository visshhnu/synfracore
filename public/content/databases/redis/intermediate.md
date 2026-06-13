# Redis — Intermediate

## Pipelining and Transactions

```python
import redis

r = redis.Redis(host='localhost', decode_responses=True)

# Pipelining — batch commands, single round trip
pipe = r.pipeline(transaction=False)  # False = pipelining only
for i in range(1000):
    pipe.hset(f"user:{i}", mapping={"score": i, "level": i // 10})
pipe.execute()  # Send all 1000 commands in ONE network call
# 1000 individual calls: ~1000ms @ 1ms each
# With pipelining: ~2ms (one round trip)

# Transactions (MULTI/EXEC) — atomic execution
pipe = r.pipeline(transaction=True)  # True = MULTI/EXEC
pipe.multi()
pipe.incr("counter")
pipe.set("last_update", "2024-01-15")
pipe.expire("last_update", 3600)
results = pipe.execute()  # All or nothing
# Note: transactions don't have rollback — they just guarantee atomicity

# Watch + Optimistic Locking
def increment_version(key):
    with r.pipeline() as pipe:
        while True:
            try:
                pipe.watch(key)            # Watch for changes
                current = int(pipe.get(key) or 0)
                pipe.multi()
                pipe.set(key, current + 1)
                pipe.execute()             # Fails if key changed since watch
                return current + 1
            except redis.WatchError:
                continue                    # Retry if key was modified
```

## Lua Scripting

```python
# Lua scripts run atomically in Redis
# No other commands execute between script steps

# Rate limiter using Lua (atomic check-and-increment)
RATE_LIMIT_SCRIPT = """
local key = KEYS[1]
local limit = tonumber(ARGV[1])
local window = tonumber(ARGV[2])

local current = tonumber(redis.call('GET', key) or "0")
if current + 1 > limit then
    return 0  -- Rate limited
end

redis.call('INCR', key)
if current == 0 then
    redis.call('EXPIRE', key, window)
end
return 1  -- Allowed
"""

rate_limiter = r.register_script(RATE_LIMIT_SCRIPT)

def check_rate_limit(user_id: str, limit: int = 100, window: int = 60) -> bool:
    result = rate_limiter(keys=[f"rl:{user_id}"], args=[limit, window])
    return bool(result)

# Leaderboard with atomic rank calculation
GET_RANK_SCRIPT = """
local score = redis.call('ZSCORE', KEYS[1], ARGV[1])
if not score then return nil end
local rank = redis.call('ZREVRANK', KEYS[1], ARGV[1])
local total = redis.call('ZCARD', KEYS[1])
return {rank + 1, score, total}  -- 1-based rank, score, total players
"""
```

## Redis Streams

```python
# Redis Streams — durable, consumer group message queues
# Like Kafka but simpler, built into Redis

# Producer: add messages
message_id = r.xadd('orders', {
    'order_id': 'ord-123',
    'user_id': 'usr-456',
    'total': '99.99',
    'status': 'pending'
})

# Consumer group: multiple workers share the stream
r.xgroup_create('orders', 'processors', id='0', mkstream=True)

# Worker: read and acknowledge messages
def process_orders():
    while True:
        messages = r.xreadgroup(
            groupname='processors',
            consumername='worker-1',
            streams={'orders': '>'},  # '>' = new undelivered messages
            count=10,
            block=5000  # Wait up to 5 seconds for messages
        )

        for stream, msgs in (messages or []):
            for msg_id, data in msgs:
                try:
                    process_order(data)
                    r.xack('orders', 'processors', msg_id)  # Mark done
                except Exception as e:
                    print(f"Failed: {e}")
                    # Message stays in PEL (Pending Entry List)
                    # Will be redelivered after xclaim timeout

# Check pending (unacknowledged) messages
pending = r.xpending('orders', 'processors')
print(f"Pending: {pending['pending']}")
```
