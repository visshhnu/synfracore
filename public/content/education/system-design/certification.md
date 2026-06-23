# System Design Certification Guide

## Certifications / Resources Available

| Resource | Provider | Cost | Format |
|----------|----------|------|--------|
| **System Design Interview Vol 1 & 2** | Alex Xu | $30 ea | Books |
| **Grokking System Design Interview** | DesignGurus | $79 | Self-paced |
| **AWS Solutions Architect Associate** | AWS | $150 | MCQ — covers distributed design |
| **Google Cloud Architect** | Google | $200 | MCQ + case study |

No single "system design" certification — it is tested in senior engineering interviews.

---

## Core Design Components

```
SCALABILITY BUILDING BLOCKS:

Load Balancer:
  Round-robin, least connections, IP hash
  L4 (TCP) for raw performance | L7 (HTTP) for content-based routing
  Examples: AWS ALB, Nginx, HAProxy

CDN (Content Delivery Network):
  Cache static assets (images, JS, CSS) close to users
  Edge caches: Cloudflare, CloudFront, Fastly
  Reduces origin load, improves latency globally

Cache Layer (Redis / Memcached):
  Cache-aside: app checks cache, on miss reads DB and populates cache
  Write-through: write to cache AND DB simultaneously
  Write-back: write to cache, async flush to DB (faster writes, data loss risk)
  TTL and eviction: LRU most common eviction policy

Database Layer:
  SQL: strong consistency, ACID, joins, complex queries (PostgreSQL, MySQL)
  NoSQL: horizontal scale, flexible schema (DynamoDB, MongoDB, Cassandra)
  Read replicas: scale reads independently from writes
  Sharding: partition data by user_id hash or range across multiple DB nodes
  Connection pooling: PgBouncer, RDS Proxy — limit DB connection overhead

Message Queue / Event Streaming:
  Decouple producers from consumers (async processing)
  Kafka: distributed, durable, high-throughput, replay events
  SQS: managed, simple queue, at-least-once delivery
  Use cases: order processing, notifications, audit log, fanout

Object Storage:
  S3 for user-uploaded files, images, backups, static websites
  CDN in front for low-latency reads

API Gateway:
  Rate limiting, authentication, request routing, aggregation
  Examples: AWS API Gateway, Kong, Nginx
```

---

## CAP Theorem and Distributed Concepts

```
CAP THEOREM (pick 2 of 3 during network partition):
  Consistency:         all nodes see the same data at the same time
  Availability:        every request gets a response (may not be latest)
  Partition tolerance: system works despite network failures between nodes

  CP systems: HBase, ZooKeeper, PostgreSQL (single node)
  AP systems: Cassandra, DynamoDB, CouchDB
  Practical: all distributed systems tolerate partitions, choose C vs A tradeoff

CONSISTENCY MODELS:
  Strong:      read always returns latest write (expensive, distributed locks)
  Eventual:    all replicas converge eventually (Cassandra, DNS)
  Read-your-writes: writer always sees their own latest write

RATE LIMITING ALGORITHMS:
  Fixed window:   simple, allows burst at boundary reset
  Sliding window: smooth and accurate, higher memory use
  Token bucket:   allows controlled burst, practical choice (Nginx, Kong)
  Leaky bucket:   constant output rate, absorbs bursts

ESTIMATION (back-of-envelope):
  100M users, 10% DAU = 10M DAU
  10M DAU, 10 reads/user/day = 100M reads/day = ~1,200 reads/sec
  1M writes/day = ~12 writes/sec
  1 KB per write * 1M writes/day = 1 GB/day storage
```

---

## Study Resources

- **System Design Interview Vol 1 & 2** (Alex Xu) — best-selling books, clear diagrams
- **ByteByteGo** (blog.bytebytego.com) — free newsletter from Alex Xu
- **High Scalability** (highscalability.com) — real-world architecture case studies
- **Grokking the System Design Interview** (designgurus.io) — structured practice

## Revision Notes
```
SCALE: horizontal (more nodes) preferred over vertical (bigger node)
CACHE: cache-aside is most common | Redis for session, rate limit, leaderboard
DB: SQL for ACID | NoSQL for scale and flexibility | read replicas for read scale
QUEUE: decouple services | Kafka for durability + replay | SQS for simplicity
CDN: static assets | API caching | edge compute

CAP: CP (ZooKeeper, HBase) | AP (Cassandra, DynamoDB) — always partition-tolerant
BACK-OF-ENVELOPE: estimate QPS, storage, bandwidth before designing
TRADEOFFS: consistency vs availability | latency vs throughput | cost vs performance
```
