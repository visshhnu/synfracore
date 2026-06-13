# System Design — Fundamentals

## The Framework

```
For any system design interview:
1. Clarify requirements (5 min)
   - Functional: what it does
   - Non-functional: scale, latency, availability
2. Estimate scale (5 min)
   - Users, QPS, data size, read/write ratio
3. High-level design (10 min)
   - Components, APIs, data flow
4. Deep dive (20 min)
   - Database schema, scaling bottlenecks, trade-offs
5. Wrap up (5 min)
   - Bottlenecks, monitoring, future improvements
```

## Key Numbers to Know

```
Latency:
  L1 cache: 1ns        L2 cache: 10ns        RAM: 100ns
  SSD:      100µs      HDD:      10ms         Network (same DC): 1ms
  Network (across world): 100-150ms

Throughput:
  Single server:   ~10K requests/sec
  Single DB:       ~10K queries/sec (read), ~1K (write)
  Kafka:           ~1M messages/sec
  Redis:           ~100K ops/sec

Scale:
  1B users × 1 action/day = 10K requests/sec
  1 photo (1MB) × 1B photos = 1 Petabyte
  1 tweet (280 bytes) × 500M tweets/day = 140GB/day
```

## Core Components

```
Load Balancer:   Distribute traffic across servers
  Layer 4: TCP/IP (faster, no HTTP understanding)
  Layer 7: HTTP (content-based routing, SSL termination)

CDN:            Serve static content from edge servers close to users
  Cache: images, JS, CSS, video — anything that doesn't change per user
  Examples: CloudFront, Akamai, Cloudflare

Database:
  SQL:          ACID, complex queries, strong consistency
  NoSQL:        Scale, flexibility, eventual consistency
  Cache (Redis): In-memory, microsecond reads, limited size

Message Queue:  Async communication, decouple services
  Kafka:        High throughput, persistent, replay
  SQS:          Managed, simple, at-least-once delivery
  RabbitMQ:     Complex routing, acknowledgments

Object Storage: Files, images, videos, backups
  S3, GCS, Azure Blob: cheap, durable, globally accessible
```

## Design: URL Shortener (bit.ly)

```
Requirements:
  - Shorten URL: POST /api/v1/shorten → returns short URL
  - Redirect: GET /{code} → redirect to original URL
  - Scale: 100M URLs created/day, 10B redirects/day

Scale:
  Writes: 100M/day = 1,160/sec
  Reads:  10B/day = 116,000/sec → 100:1 read/write ratio

Design:
  Client → Load Balancer → API Servers
  API Servers → Cache (Redis) → Database (MySQL/Cassandra)

Short code generation:
  Base62 (a-z, A-Z, 0-9) encoding
  7 characters = 62^7 = 3.5 trillion unique URLs
  Approach: hash(original_url)[:7] or auto-increment + base62

Database schema:
  urls: id (bigint), short_code (varchar 7, indexed), original_url (text),
        created_at, expire_at, user_id, click_count

Redirect flow:
  GET /abc1234
  1. Check Redis cache (cache_key = "url:abc1234")
  2. Cache miss → query MySQL WHERE short_code = 'abc1234'
  3. Cache result in Redis (TTL 24h)
  4. Return 301 (permanent) or 302 (temporary) redirect
```
