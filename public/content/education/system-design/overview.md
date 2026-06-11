# System Design — Complete Guide for Interviews & GATE

System design interviews separate senior from junior engineers. You're asked to design real systems (WhatsApp, YouTube, Uber, Amazon) — the skill is breaking a vague problem into concrete components that work at scale.

## How to Approach Any System Design Question

```
Step 1 — Clarify Requirements (5 min)
  Functional:  What does the system DO?
  Non-functional: Scale? Latency? Availability? Consistency?
  
  Ask:
  → How many users? DAU/MAU?
  → Read-heavy or write-heavy?
  → Globally distributed or single region?
  → Strong consistency required or eventual OK?
  → What's the SLA? 99.9%? 99.99%?

Step 2 — Capacity Estimation (3 min)
  Traffic: QPS, peak QPS
  Storage: data per user × users × retention
  Bandwidth: request size × QPS

Step 3 — High-Level Design (10 min)
  Draw boxes: clients, load balancer, servers, DB, cache
  Identify main data flows

Step 4 — Deep Dive (15 min)
  Choose 2-3 interesting components and go deep
  Database schema, caching strategy, consistency model

Step 5 — Trade-offs (5 min)
  What did you sacrifice? Why is this the right call?
```

## Core Concepts

### Horizontal vs Vertical Scaling
```
Vertical (Scale Up): Bigger machine
  ✅ Simple, no code changes, low latency
  ❌ Hardware limit, single point of failure, expensive
  Use when: Database, early stage, stateful apps

Horizontal (Scale Out): More machines
  ✅ Theoretically unlimited, fault tolerant, cheaper
  ❌ Complex (state management, consistency, networking)
  Use when: Stateless services, large web apps

Load Balancer: Routes traffic across horizontal machines
  Round Robin: Equal distribution
  Least Connections: Route to least busy server
  IP Hash: Same client always hits same server (session affinity)
  Health Checks: Remove unhealthy servers automatically
```

### Caching
```
Why cache? Database is slow (disk I/O). Cache is fast (RAM).
Cache hit ratio: % of requests served from cache

Caching layers:
  CDN: Static files near user (images, JS, CSS)
  Server cache: Application-level in-memory (Redis, Memcached)
  DB cache: Query result cache, buffer pool

Cache eviction policies:
  LRU (Least Recently Used): Remove least recently accessed
  LFU (Least Frequently Used): Remove least accessed overall
  TTL: Expire after time period

Cache patterns:
  Cache-aside (Lazy loading):
    Read: Check cache → if miss, read DB → write to cache
    Write: Write to DB, invalidate cache
    ✅ Only cache what's needed  ❌ Cache miss penalty

  Write-through:
    Write to cache AND DB synchronously
    ✅ Cache always consistent  ❌ Write latency

  Write-behind (Write-back):
    Write to cache, async write to DB
    ✅ Fast writes  ❌ Data loss risk

Cache stampede (thundering herd):
  Many requests miss at same time, flood DB
  Fix: Mutex lock on cache miss, probabilistic early expiry

Redis vs Memcached:
  Redis: Data structures (lists, sets, sorted sets), persistence, pub/sub
  Memcached: Simple key-value, multi-threading, simpler
  Choose Redis for most use cases
```

### Database Design

```
SQL vs NoSQL decision:

Choose SQL (PostgreSQL, MySQL) when:
  → Need ACID transactions (payments, banking)
  → Complex queries with JOINs
  → Schema is stable and well-defined
  → Medium scale (up to ~10M records without sharding)

Choose NoSQL when:
  → Massive scale (Google, Facebook scale)
  → Flexible/changing schema
  → Key-value lookups only
  → Geographically distributed with eventual consistency OK

NoSQL types:
  Document (MongoDB): JSON-like, flexible schema, good for user profiles
  Key-Value (Redis, DynamoDB): Fast lookups, sessions, caching
  Wide-column (Cassandra): Time series, activity feeds, write-heavy
  Graph (Neo4j): Social networks, recommendation engines

Database indexing:
  B-Tree index: Range queries, ORDER BY, default index
  Hash index: Exact match only, faster than B-tree for equality
  Composite index: Multiple columns, column order matters
  Covering index: All query columns in index, no table lookup

Sharding (horizontal partitioning):
  Hash sharding: Hash(user_id) % num_shards
  Range sharding: User A-M on shard 1, N-Z on shard 2
  Directory sharding: Lookup table tells which shard
  
  Problems: Cross-shard JOINs, resharding, hotspots
  Consistent hashing: Minimizes resharding impact

Replication:
  Master-Slave: Writes to master, reads from slaves
  Multi-Master: Writes to multiple, conflict resolution needed
  
CAP Theorem: Choose 2 of 3:
  Consistency: All reads see most recent write
  Availability: System always responds
  Partition Tolerance: Works despite network failures
  
  In practice: Network failures happen (P is given)
  → CP: Bank transfers, financial systems (sacrifice availability)
  → AP: Social feeds, product catalog (sacrifice consistency)
```

### Message Queues
```
Why queues? Decouple producers from consumers, handle spikes, async processing

Kafka: High throughput, durable, replay, pub/sub, stream processing
  Topics → Partitions → Offsets
  Producers → Brokers → Consumer Groups
  Use for: Event streaming, log aggregation, audit trails

RabbitMQ: Message broker, routing, complex delivery guarantees
  Use for: Task queues, microservice communication

SQS (AWS): Managed, at-least-once delivery, simple
  Use for: Background jobs, thumbnailing, email sending

Pattern: User uploads video
  1. API receives upload → stores to S3 → sends message to queue
  2. Worker reads from queue → transcodes video → updates DB
  3. User polls for status (or websocket notification)
```

## Designing Real Systems

### Design a URL Shortener (bit.ly)
```
Requirements:
  Functional: Shorten URL, redirect to original, analytics?
  Non-functional: 100M URLs, 10M redirects/day (read-heavy)

API:
  POST /shorten { url: "https://..." } → { short: "abc123" }
  GET /{code} → redirect 301/302

DB schema:
  urls: id | short_code | original_url | user_id | created_at | clicks

Short code generation:
  Option 1: Base62 encode auto-increment ID (0-9, a-z, A-Z)
    ID 1 → "1", ID 12345678 → "pVj"
    7 chars = 62⁷ = 3.5 trillion URLs
  Option 2: MD5 hash of URL, take first 7 chars (collision risk)
  Option 3: UUID (too long)

Why 301 vs 302?
  301 Permanent: Browser caches, no more requests to our server
  302 Temporary: Every visit hits our server (needed for analytics)

Scale:
  Cache: short_code → original_url in Redis (80% hit rate = 80% less DB reads)
  DB: Read replicas for redirects, master for writes
  CDN: Not applicable (redirects can't be cached by CDN meaningfully)
```

### Design a WhatsApp-like Chat
```
Requirements:
  1:1 messaging, group chats, online status, read receipts, media

Core challenge: Real-time message delivery

WebSocket vs HTTP polling:
  Polling: Client asks "new messages?" every 5s → wasteful
  Long polling: Hold request until message → better but complex
  WebSocket: Persistent bidirectional connection → best for chat

Message flow:
  User A sends → Server → WebSocket → User B
  If User B offline: Server stores message → delivers when B connects

DB schema:
  messages: id | conversation_id | sender_id | content | type | timestamp
  conversations: id | type (1:1/group) | last_message_id
  participants: conversation_id | user_id | last_seen_at

Fan-out problem (group messages):
  Group of 100 people: one message → 99 notifications
  Fan-out on write: Write 99 entries when message sent (fast read)
  Fan-out on read: Store once, compute on read (slow read)
  Hybrid: Fan-out on write for small groups, on read for huge groups

Media storage:
  Never store in DB! Always S3 or equivalent
  Message stores S3 URL
  Generate presigned URL for download

Online presence:
  Heartbeat: Send "I'm alive" every 30s
  Cache user_id → last_seen in Redis (TTL 60s)
  Subscribe to user's status channel via pub/sub
```

### Design YouTube
```
Requirements:
  Upload video, stream video, search, recommendations
  1B DAU, 500 hours uploaded per minute

Upload flow:
  1. Client uploads to upload service → stores raw in S3
  2. Queue message → transcoding workers
  3. Transcode to multiple resolutions (360p, 720p, 1080p, 4K)
  4. Store in CDN-backed S3
  5. Update metadata DB, notify user

Streaming:
  Adaptive Bitrate Streaming (ABR): 
    Player detects bandwidth → switches quality automatically
    HLS (HTTP Live Streaming): Splits video into small .ts segments
    DASH: Similar, MPEG standard
  CDN: Video files cached at edge, close to users

Search:
  Elasticsearch for video titles, descriptions, tags
  Invert index: keyword → [video_ids]

Recommendations:
  Collaborative filtering: Users similar to you liked X
  Content-based: Videos similar to what you watched
  ML pipeline: Train model offline → serve predictions
  Cache recommendations (change every few hours, not real-time)

Scale numbers:
  500 hours/min upload → ~30K videos/min
  1B DAU × 1 video/day = 1B video views/day = ~11K QPS
  Storage: 500 hrs/min × 60min × 24hr × 365 = massive
  CDN offloads 90%+ of video bandwidth
```

## Key Trade-offs to Know

```
Consistency vs Availability (CAP):
  Financial: Consistent (lose availability during partition)
  Social feed: Available (eventual consistency OK)

Latency vs Throughput:
  More caching → lower latency, higher throughput
  More DB reads → higher latency, lower throughput  

SQL vs NoSQL:
  SQL: ACID, flexible queries, easier development
  NoSQL: Scale, performance, flexible schema

Monolith vs Microservices:
  Monolith: Simple, fast development, easy debugging
  Microservices: Independent scaling, technology freedom, team autonomy
  Start monolith, extract services when bottlenecks appear
```
