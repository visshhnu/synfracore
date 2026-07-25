# Redis — Learning Roadmap

## Estimated Time to Job-Ready
**5-7 weeks** of consistent learning (2-3 hours/day) — Redis's core commands are genuinely quick to pick up; most of the real learning curve is in choosing the right data structure and pattern for a given problem, plus the operational side (persistence, HA, cluster) that a pure caching mental model tends to skip.

## Phase 1: Foundation (Week 1-2)

- Core data structures: String, Hash, List, Set, Sorted Set — and matching each to the use case it's actually built for (a Sorted Set for a leaderboard, not a List you'd have to manually sort)
- TTL/expiry commands (`EXPIRE`, `TTL`, `PERSIST`) and why "always set a TTL on cache keys" is a real operational habit, not just a suggestion
- Install Redis via Docker and get comfortable with `redis-cli`

**Checkpoint:** given a requirement to store user session data that should expire automatically, can you write the command and explain why `SET key value EX seconds` is preferable to setting the value and expiry as two separate commands?

## Phase 2: Caching and Rate-Limiting Patterns (Week 2-4)

- Cache-aside (lazy loading): the standard pattern, and what cache invalidation actually requires on writes
- The real difference between a fixed-window rate limiter (`INCR` + `EXPIRE`, simple but allows bursts at window boundaries) and a true sliding window (sorted-set or Lua-based) — a lot of tutorials show fixed-window code while calling it "sliding window," which is worth being able to spot
- The correct atomic distributed-lock pattern (`SET key value NX PX milliseconds` in one command) versus the unsafe version (`SETNX` followed by a separate `EXPIRE`, which has a crash-window race condition)
- Complete Portfolio Project 1 (caching layer) and Project 2 (rate limiter)

**Checkpoint:** can you explain why `SETNX` followed by a separate `EXPIRE` call is not a safe distributed lock, even though it looks like it should work? This is a genuinely common mistake worth being able to diagnose, not just avoid by memorized rule.

## Phase 3: Lua Scripting, Pub/Sub, and Streams (Week 4-5)

- Lua scripting for atomic multi-step operations (`EVAL`) — why "no other commands execute between script steps" is the actual guarantee that makes this useful for rate limiting and similar check-and-act patterns
- Pub/Sub for real-time messaging, and its key limitation: no persistence — a subscriber that's offline when a message is published simply misses it
- Redis Streams as the durable, consumer-group alternative when Pub/Sub's fire-and-forget behavior isn't sufficient
- Complete Portfolio Project 3 (real-time leaderboard with Sorted Sets)

**Checkpoint:** given a requirement where a message must be reliably delivered even if the consumer is temporarily offline, can you explain why Pub/Sub is the wrong tool and Streams (with consumer groups and acknowledgment) is the right one?

## Phase 4: Persistence, HA, and Interview Readiness (Week 5-7)

- RDB (point-in-time snapshots) vs. AOF (write-log) persistence, and why production commonly enables both
- Sentinel (automatic failover for a single master) vs. Cluster (sharding across 16,384 hash slots) — know which problem each solves
- Eviction policies (`allkeys-lru`, `volatile-lru`, `noeviction`, etc.) and choosing the right one based on whether Redis is being used as a pure cache or a durable data store
- Review this course's Interview Q&A material, particularly the persistence, replication, and rate-limiting questions

## Common Pitfalls Specific to Redis (Not Generic Study Advice)

- **Using bare `SETNX` for a distributed lock without an expiry** — a crashed lock holder before release means the lock is held forever; use the atomic `SET key value NX PX ms` form instead
- **Calling a fixed-window rate limiter "sliding window"** — the two behave differently at window boundaries (a fixed window allows a burst right at the boundary that a true sliding window would catch); know which one you've actually built
- **Treating vendor throughput-multiplier claims (for forks like KeyDB or alternatives like Dragonfly) as universal** — these are workload- and hardware-dependent benchmark numbers, not guaranteed results for your own workload
- **Forgetting Pub/Sub has no persistence** — a common source of "why did my subscriber miss messages" confusion when a consumer was briefly disconnected

## Getting Your First Redis-Heavy Role

1. **Portfolio:** the 3 projects in this course's Projects section, each demonstrating a different core skill (cache-aside with measured hit-rate improvement, atomic Lua-based rate limiting, a real Sorted-Set leaderboard at meaningful scale)
2. **Resume:** be specific — "implemented a cache-aside layer reducing average API response time from 120ms to 8ms on cache hits" is far stronger than "experience with Redis"
3. **Know the ecosystem context:** Redis shows up constantly as infrastructure glue (caching, sessions, queues, rate limiting, pub/sub) across almost every kind of backend role — being able to explain which specific problem each Redis pattern solves is often more relevant in interviews than command memorization
4. **Certifications, if pursuing one:** see this course's own Certification Guide for Redis University's current offerings and pricing caveats
