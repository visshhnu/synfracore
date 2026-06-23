# System Design Interview Questions

## Core Concepts

**Q: How to approach a system design interview.**

Framework (45-minute interview):
1. **Clarify requirements** (5 min): Functional (what system does) + Non-functional (scale, latency, availability)
2. **Estimate scale** (3 min): Users, QPS (queries per second), storage needed
3. **High-level design** (10 min): Core components, APIs
4. **Deep dive** (20 min): Database design, scalability, bottlenecks
5. **Wrap up** (5 min): Failures, monitoring, future improvements

**Scale estimation example (URL shortener):**
```
100M URLs created per day = 1,157 writes/second
10:1 read:write ratio = 11,570 reads/second
URL metadata: ~500 bytes × 100M × 365 × 5 years = ~91TB
```

---

**Q: Design a URL shortener (like bit.ly).**

**Requirements:**
- Given a long URL, generate short URL (e.g., short.ly/abc123)
- Redirect short URL to long URL
- Scale: 100M new URLs/day, 10B redirects/day

**Core design:**
```
Client → API Gateway → URL Service → Database
                    → Cache (Redis) ← [read path]

Short URL generation:
1. Generate unique ID (e.g., auto-increment or UUID)
2. Encode to base62 (a-zA-Z0-9) → 7 chars = 62^7 = 3.5 trillion combinations
3. Store: short_id → long_url in database

Read path (latency critical):
1. Check Redis cache (sub-millisecond)
2. If miss → Database → cache result
3. Return 301 (permanent) or 302 (temporary) redirect

Database: single table
  short_id | long_url | user_id | created_at | clicks

Scale: Shard by short_id. Redis cache reduces DB reads by ~90%.
```

---

**Q: Design Instagram's feed (news feed).**

**Two approaches:**

**Push (fanout on write):**
- When user posts → immediately push to all followers' feeds
- Storage: pre-computed feed per user
- Read: O(1) — feed already ready
- Problem: celebrity with 10M followers → 10M writes per post

**Pull (fanout on read):**
- When user requests feed → pull posts from followed users
- Sort by time, merge, paginate
- Problem: slow for active users following thousands

**Hybrid (Instagram's approach):**
- Regular users: push (fast reads)
- Celebrities (>1M followers): pull at read time
- Cache user feeds in Redis (last 500 posts)

---

**Q: Explain key system design concepts.**

**Horizontal vs Vertical Scaling:**
- Vertical (scale up): bigger server (more CPU/RAM). Simple but has limits, single point of failure.
- Horizontal (scale out): more servers. Complex (distributed) but unlimited scale.

**Load Balancer**: Distributes traffic across server pool. Health checks, algorithms (round-robin, least-connections, IP hash).

**CDN (Content Delivery Network)**: Cache static assets (images, CSS, JS) at edge locations globally. Reduces latency, offloads origin.

**Database sharding**: Partition data across multiple DBs. Shard by user_id (consistent hashing). Challenge: cross-shard queries, rebalancing.

**CAP Theorem**: Distributed system can guarantee only 2 of 3:
- **C**onsistency: every read gets latest write
- **A**vailability: every request gets a response
- **P**artition tolerance: works despite network failures
Real choice: CP (consistent, might reject requests) vs AP (available, might return stale data). Partition tolerance is mandatory in distributed systems.

**Message Queue** (Kafka, SQS): Decouple producers from consumers. Async processing. Buffer spikes. Retry failed tasks.

---

**Q: Design a distributed rate limiter.**

```
Algorithm: Token bucket
- Each user gets N tokens per second
- Each request consumes 1 token
- Excess requests rejected (HTTP 429)

Implementation with Redis:
1. For each request from user X:
   a. Redis: INCR rate:X:timestamp  (increment counter for current second)
   b. Set TTL = 1 second (auto-expire)
   c. If count > limit → reject
2. Redis single-threaded → atomic operations

Distributed challenge: requests hit different servers
Solution: Centralised Redis (all servers check same counter)
Or: Sliding window log (more accurate, more storage)

Headers to return:
X-RateLimit-Limit: 100
X-RateLimit-Remaining: 45  
X-RateLimit-Reset: 1702000060  (Unix timestamp of reset)
```

## Revision Notes
```
SYSTEM DESIGN FRAMEWORK:
1. Clarify (functional + non-functional) 2. Estimate (QPS, storage)
3. High-level 4. Deep dive (DB, scale) 5. Wrap-up (failures, monitoring)

SCALE MATH: 1M req/day ÷ 86400 = ~12 req/sec | 1KB × 1B = 1TB

URL SHORTENER: base62 encoding (7 chars = 62^7) | Redis cache | 301/302 redirect
NEWS FEED: Push (pre-compute) vs Pull (at read) vs Hybrid (push regular, pull celebrities)

KEY CONCEPTS:
Horizontal scale > vertical (no limits, fault tolerant)
Load balancer: round-robin, least-conn, IP hash
CDN: cache static assets at edge
Sharding: shard by user_id with consistent hashing
CAP: choose CP or AP (P is mandatory)
Message queue: async, decouple, buffer spikes

RATE LIMITING: Token bucket + Redis INCR + TTL
Headers: X-RateLimit-Limit / Remaining / Reset
```
