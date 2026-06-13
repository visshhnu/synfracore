# System Design — Advanced

## Design: YouTube/Video Platform

```
Requirements:
  - Upload video (up to 10GB)
  - Stream video (adaptive bitrate)
  - Search videos
  - Recommendations

Upload pipeline:
  Client → Upload Service → S3 (raw video)
  → Transcoding Service (converts to multiple resolutions: 360p, 720p, 1080p, 4K)
  → CDN (distribute to edge servers near users)
  → Metadata DB (video info, thumbnails, search index)

Transcoding:
  Worker queue (SQS/Kafka) pulls raw videos
  FFmpeg transcodes to HLS/DASH format (chunks of a few seconds each)
  Multiple resolutions transcoded in parallel
  Adaptive bitrate: client selects quality based on network speed

Streaming:
  Not a single large file transfer
  HLS: .m3u8 playlist file + .ts segment files (2-10 seconds each)
  Client downloads playlist → requests segments as needed
  CDN serves 99% of traffic (not origin servers)

Storage:
  Video files: S3/GCS (petabytes of object storage)
  Metadata: PostgreSQL (video info) + Elasticsearch (search)
  View counts: Redis (real-time increment) → batch write to DB
  Recommendations: ML pipeline on viewing history
```

## Design: Distributed Cache

```
Why distributed cache (Redis Cluster vs single Redis):
  Single Redis: ~10GB memory limit (practical), ~100K ops/sec
  Cluster: shard across N nodes, N × capacity, N × throughput

Consistent hashing:
  Hash ring with N virtual nodes per server
  Adding/removing a server only rehashes ~1/N keys (not all keys)
  Prevents thundering herd on server changes

Cache patterns:
  Cache aside:   App checks cache → miss → load DB → write cache
  Write through: Write to cache AND DB synchronously
  Write behind:  Write to cache → async write to DB (risk: data loss)
  Read through:  Cache sits in front of DB, handles loading itself

Cache problems:
  Cache stampede: Many requests hit DB on cache miss (add jitter to TTL)
  Thundering herd: Server restarts, all requests miss (warm up cache)
  Cache penetration: Query non-existent keys (Bloom filter check)
  Hot key: One key gets millions of requests → replicate hot keys
```

## System Design Cheatsheet + Interview

```
# ── SCALE ESTIMATES ───────────────────────────────────────
1M users daily, 10 actions each = 10M daily = 115 req/sec
To handle 10K req/sec → ~10 servers (each handles ~1K)
1TB/day of data → ~10 servers with 1TB SSD, or S3

# ── DATABASE SELECTION ────────────────────────────────────
SQL:     User accounts, orders, financial data (ACID needed)
NoSQL:   User sessions, clickstream, IoT data, content
Cache:   Session data, computed results, rate limiting
Search:  Full-text search, autocomplete, faceted filtering
Graph:   Social network, recommendations, fraud detection

# ── COMMON BOTTLENECKS & SOLUTIONS ───────────────────────
DB writes too slow:
  → Write to queue, batch writes, async processing
  → Read replicas for reads, primary for writes
  → Partition/shard database

API latency too high:
  → Add Redis caching layer (TTL 5-60 min)
  → CDN for static content
  → Async processing for slow operations

Single server → scale out:
  → Load balancer + stateless servers
  → Session storage in Redis (not in-memory)
  → Sticky sessions if stateful

# ── INTERVIEW QUESTIONS ───────────────────────────────────
Q: How do you scale a SQL database?
A: Vertical scaling (bigger machine), read replicas (distribute reads),
   caching (reduce DB load), connection pooling, sharding (horizontal).
   Sharding: route by user_id hash to shard 1-N. Complexity: cross-shard queries.

Q: SQL vs NoSQL for a social network?
A: Both! User profiles/auth → PostgreSQL (ACID, relations).
   Posts/timeline → Cassandra (write-heavy, partition by user_id).
   Relationships graph → Neo4j or DynamoDB adjacency list.
   Sessions → Redis. Don't choose one DB for everything.
```
