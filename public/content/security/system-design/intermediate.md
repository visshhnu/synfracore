# System Design Intermediate Concepts

## Database Design

### Sharding
Horizontal partitioning across multiple database nodes.
- **Hash Sharding**: shard = hash(key) % num_shards. Even distribution but hard to add shards.
- **Range Sharding**: Ranges of keys to shards. Easy range queries, hotspot risk.
- **Directory Sharding**: Lookup table maps keys to shards. Flexible but lookup overhead.

**Consistent Hashing**: Place nodes on a ring. Keys map to nearest clockwise node. Adding/removing nodes only rebalances ~1/N of keys.

### Database Replication
- **Master-Replica (Primary-Secondary)**: Writes to primary, reads from replicas. Replication lag.
- **Multi-Master**: Writes to any node, conflict resolution needed.
- **Synchronous vs Asynchronous**: Sync = no data loss but slower. Async = faster but replication lag.

### Read Replicas
Scale read throughput by routing read queries to replicas. Common for read-heavy workloads.

## Caching Strategies

### Cache-Aside (Lazy Loading)
```
Read: check cache → miss → read DB → populate cache
Write: update DB → invalidate cache (or update)
```
Data only in cache when needed. Cache miss is expensive.

### Write-Through
Write to cache and DB simultaneously. Always consistent but slower writes.

### Write-Behind (Write-Back)
Write to cache, async write to DB. Faster writes, risk of data loss.

### Cache Invalidation Strategies
- **TTL**: Expire after fixed time. Simple, eventual consistency.
- **Event-based**: Invalidate on write events. Complex but immediate.
- **Versioning**: Include version in cache key.

## Rate Limiting

### Algorithms
- **Token Bucket**: Fixed capacity bucket fills at constant rate. Allows bursts.
- **Leaky Bucket**: Requests processed at fixed rate. Smooths traffic.
- **Fixed Window Counter**: Count requests in fixed time window.
- **Sliding Window**: More accurate, count over rolling window.

### Implementation
Typically in Redis with atomic operations (INCR + EXPIRE). Can be per-user, per-IP, or global.

## Content Delivery Network (CDN)

### How CDNs Work
Static content (images, JS, CSS, videos) served from edge servers close to users. Origin server only hit on cache miss.

**Benefits:**
- Reduced latency (geography)
- Reduced origin load
- DDoS protection (distributed absorption)
- Better availability

**Cache invalidation:** TTL-based or explicit purge API.

## Message Queues — Deep Dive

### Kafka Architecture
- **Topic**: Category of messages
- **Partition**: Topic subdivided for parallelism
- **Producer**: Writes to topic
- **Consumer Group**: Multiple consumers, each partition consumed by one
- **Offset**: Position of consumer in partition
- **Retention**: Messages kept for configurable time (default 7 days)

### Queue vs Stream
- **Queue** (RabbitMQ): Message consumed and removed. Work distribution.
- **Stream** (Kafka): Message retained, multiple consumers can replay. Event log.

## Distributed Coordination

### Consensus — Raft
Raft is a consensus algorithm for distributed systems.
1. **Leader election**: Nodes vote for a leader.
2. **Log replication**: Leader replicates entries to followers.
3. **Commit**: Once majority acknowledges, entry is committed.

Used in: etcd, Consul, CockroachDB.

### Distributed Locks
Prevent concurrent modifications across services.
- Redis + SET NX (Redlock for multi-node)
- ZooKeeper ephemeral nodes
- Database-level: SELECT FOR UPDATE

## Service Discovery

### Client-Side
Client queries registry (Consul, Eureka) and load balances itself.

### Server-Side
Client goes through load balancer which queries registry.

### DNS-Based
Services registered as DNS SRV records. Caching can cause stale data.

## API Design

### REST Principles
- Stateless, uniform interface, resource-based URLs
- HTTP methods: GET (read), POST (create), PUT/PATCH (update), DELETE

### GraphQL vs REST
- REST: Multiple endpoints, over/under-fetching issues
- GraphQL: Single endpoint, client specifies needed fields, good for complex data graphs

### gRPC
Protocol Buffers (binary), HTTP/2, bidirectional streaming. Efficient for service-to-service.
