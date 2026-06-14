# Redis -- Portfolio Projects

---

## Project 1: Caching Layer for a REST API

**Level:** Beginner | **Time:** 1-2 days | **GitHub:** `redis-api-cache`

Implement cache-aside pattern -- reduce database load by 80% for read-heavy APIs.

```python
import redis, json, time
from functools import wraps

r = redis.Redis(host="localhost", decode_responses=True)

def cache(ttl: int = 300):
    def decorator(func):
        @wraps(func)
        def wrapper(*args, **kwargs):
            key = f"cache:{func.__name__}:{args}:{kwargs}"
            cached = r.get(key)
            if cached:
                print(f"Cache HIT: {key}")
                return json.loads(cached)
            print(f"Cache MISS: {key}")
            result = func(*args, **kwargs)
            r.setex(key, ttl, json.dumps(result))
            return result
        return wrapper
    return decorator

@cache(ttl=60)
def get_product(product_id: int):
    time.sleep(0.1)  # Simulates DB query
    return {"id": product_id, "name": "Product", "price": 999}

# Benchmark
import timeit
print("First call:", timeit.timeit(lambda: get_product(1), number=1), "s")  # ~0.1s DB
print("Cached call:", timeit.timeit(lambda: get_product(1), number=1), "s")  # <0.001s Redis
```

**Steps:** Redis via Docker, cache-aside pattern, measure hit rate, cache invalidation on updates

---

## Project 2: Rate Limiter with Lua Scripts

**Level:** Intermediate | **Time:** 1 day | **GitHub:** `redis-rate-limiter`

Atomic rate limiting using Lua -- thread-safe, no race conditions.

```lua
-- rate_limit.lua
local key    = KEYS[1]
local limit  = tonumber(ARGV[1])
local window = tonumber(ARGV[2])

local current = tonumber(redis.call("GET", key) or "0")
if current + 1 > limit then
    return 0  -- Rate limited
end

redis.call("INCR", key)
if current == 0 then
    redis.call("EXPIRE", key, window)
end
return 1  -- Allowed
```

**Steps:** Lua script, sliding window algorithm, test with concurrent requests, integrate with FastAPI

---

## Project 3: Real-Time Leaderboard with Sorted Sets

**Level:** Advanced | **Time:** 2 days | **GitHub:** `redis-leaderboard`

Gaming leaderboard updating in real-time -- millions of users, sub-millisecond queries.

```python
import redis
r = redis.Redis(decode_responses=True)

# Update player score
r.zadd("leaderboard", {"player:alice": 1500})

# Get top 10 with scores
top10 = r.zrange("leaderboard", 0, 9, withscores=True, rev=True)

# Player rank (1-indexed)
rank = r.zrevrank("leaderboard", "player:alice") + 1
```

**Steps:** Populate with 1M players, benchmark ZADD/ZRANGE operations, add expiring scores for weekly leaderboard

---

## Portfolio Checklist
- [ ] Benchmark documented: before cache vs with cache (response time)
- [ ] Cache invalidation strategy documented and implemented
- [ ] Rate limiter tested under concurrent load
- [ ] Redis persistence configured (RDB or AOF)
