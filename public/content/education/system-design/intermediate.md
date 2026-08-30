# System Design — Intermediate

## Consistent Hashing — the actual mechanism

```
Problem it solves: with plain hash(key) % N sharding, adding or
removing a server (N changes) reshuffles almost every key's
target server — a genuinely disruptive, expensive rebalance
across the whole cluster for a one-server change.

Consistent hashing: map both servers and keys onto a hash ring
(a circular space, e.g. 0 to 2^32-1). A key belongs to the first
server found walking clockwise from the key's hash position.

  Ring:  ...--[Server A]--(keys here go to B)--[Server B]--...

Adding a new server only affects the keys between it and the
previous server on the ring — everything else stays put. This is
the entire point: a cluster resize now only remaps a small
fraction of keys instead of nearly all of them.

Virtual nodes: instead of placing each physical server once on
the ring, place it at many points (e.g. 100-200 virtual nodes
per physical server) — this fixes consistent hashing's real
weakness (a single physical server placement can land in an
unlucky spot and get an unfairly large or small key range) by
averaging out load across many points per server, which is what
every real system using consistent hashing (DynamoDB, Cassandra)
actually does — plain single-point consistent hashing is a
teaching simplification, not what production systems run.
```

## CAP Theorem — applied to real design choices

```
CAP: during a network Partition, choose Consistency or Availability
(you always get Partition tolerance in a real distributed system,
since network partitions happen regardless of preference).

CP choice example: a bank balance service. A read during a
partition either returns the confirmed-correct balance or an
error — it must NOT return a stale balance that could let someone
overdraw based on wrong information. Availability is sacrificed
for correctness here because the cost of being wrong is high.

AP choice example: a social media "like" counter. A read during
a partition returns whatever count is locally available, possibly
slightly stale — showing "142 likes" instead of the true "143"
for a few seconds is a non-issue, and refusing to serve the page
at all (choosing consistency) would be a far worse user experience
for something this low-stakes.

The actual design skill being tested: correctly identifying which
side of CAP a given feature should choose, based on the real cost
of being wrong — not memorizing that "Cassandra is AP" as a fact
about a whole database engine (most real databases let you tune
this per-operation, as covered further on the Advanced tab).
```

## Design: Rate Limiter

```
Requirements:
  - Limit each user/API key to N requests per time window
  - Distributed (works across many API server instances, not
    just one process's local memory)
  - Low latency — checking the limit must not meaningfully slow
    down every request

Algorithm choice — Sliding Window Counter (a practical middle
ground):
  Fixed window (simplest): count resets every window boundary —
    but allows 2x burst right at the boundary (e.g. 100 requests
    at 11:59:59, another 100 at 12:00:01 — 200 in 2 seconds
    against a "100/minute" limit).
  Sliding window log: track every request's exact timestamp —
    perfectly accurate, but memory grows with request volume.
  Sliding window counter: weight the previous window's count by
    how much of it still overlaps the current sliding window —
    close approximation to the log approach at fixed-window's
    memory cost, which is why it's the common real-world choice.

Design:
  Client → API Gateway → Rate Limiter check (Redis) → API Servers
  Redis stores: key = "ratelimit:{user_id}:{window}",
    value = request count, with a TTL matching the window size —
    an INCR + TTL-on-first-increment is enough for the fixed-
    window version, and Redis's atomicity means no race condition
    between concurrent requests from the same user checking and
    incrementing the same counter.
  On limit exceeded: return HTTP 429 with a Retry-After header,
    not just a bare rejection — this lets a well-behaved client
    back off correctly instead of retrying immediately and adding
    more load to an already-limited endpoint.
```

## Sharding Strategies

```
Range-based: shard by key range (e.g. user_id 1-1M on shard 1,
  1M-2M on shard 2) — simple, supports efficient range queries,
  but can create hot shards if certain ranges get disproportionate
  traffic (e.g. newest users, who are usually the most active,
  all landing on the newest, single shard).

Hash-based: shard by hash(key) % N — distributes load evenly,
  but loses range-query efficiency (a range query now has to hit
  every shard, since consecutive keys are scattered across all
  of them by design).

Directory-based: a separate lookup service maps each key to its
  shard explicitly — most flexible (can rebalance individual
  keys without a formula constraint), but that lookup service is
  now a new dependency and potential bottleneck/single point of
  failure that the other two strategies don't need at all.

Real systems often combine these — e.g. consistent hashing
(covered above) is itself a refinement of hash-based sharding
specifically to make rebalancing cheaper than a plain hash % N
scheme would allow.
```

## Transition to Advanced

You're ready for advanced System Design topics when you can:
- Explain consistent hashing with virtual nodes well enough to say exactly which keys move when a server is added, not just that "fewer keys move"
- Pick CP vs AP for a *specific* feature and justify it by the real cost of being wrong, not by reciting a database's marketed label
- Design a rate limiter's Redis schema correctly, including why atomicity matters for the increment-and-check step
