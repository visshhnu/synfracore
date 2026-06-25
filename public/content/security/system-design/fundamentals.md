# System Design Fundamentals

## What is System Design?
Designing large-scale distributed systems that are reliable, scalable, and maintainable. Involves making architectural decisions with trade-offs.

## Core Principles

### Scalability
System's ability to handle increased load.
- **Vertical Scaling**: More powerful hardware (CPU, RAM). Simpler but limited.
- **Horizontal Scaling**: Add more machines. More complex but theoretically unlimited.

### Reliability
System continues to work correctly even when faults occur.
- **Fault Tolerance**: Continue operating when components fail
- **Redundancy**: Duplicate critical components
- **MTTR / MTBF**: Mean Time to Repair / Mean Time Between Failures

### Availability
Fraction of time system is operational.
- 99.9% = 8.7 hours downtime/year ("three nines")
- 99.99% = 52 minutes downtime/year ("four nines")
- 99.999% = 5 minutes downtime/year ("five nines")

### Maintainability
Ease of operating, modifying, and extending the system.

## Key Components

### Load Balancers
Distribute traffic across multiple servers.
- **Round Robin**: Each request to next server in cycle.
- **Least Connections**: Route to server with fewest active connections.
- **IP Hash**: Same client always to same server (session affinity).
- **Weighted**: Servers with more capacity get more requests.
Types: Layer 4 (TCP/IP) vs Layer 7 (HTTP, content-aware).

### Caching
Store frequently accessed data in fast storage.
- **Client-side**: Browser cache.
- **CDN**: Content Delivery Network for static assets.
- **Reverse proxy cache**: Nginx, Varnish.
- **Application cache**: Redis, Memcached.
- **Database cache**: Query result cache.

Cache eviction policies: LRU, LFU, FIFO, TTL.

### Databases
- **RDBMS**: Structured data, ACID, complex queries. PostgreSQL, MySQL.
- **NoSQL Document**: JSON documents, flexible schema. MongoDB.
- **NoSQL KV**: Simple key-value, fast. Redis, DynamoDB.
- **NoSQL Wide Column**: Sparse data, time-series. Cassandra, HBase.
- **Search**: Full-text search. Elasticsearch.

### Message Queues
Async communication between services.
- Decouple producers and consumers
- Buffer load spikes
- Enable retry and DLQ (Dead Letter Queue)
Examples: Kafka, RabbitMQ, SQS.

## CAP Theorem
Distributed system can only guarantee 2 of 3:
- **Consistency**: All nodes see same data
- **Availability**: Every request gets a response
- **Partition Tolerance**: Works despite network splits

Network partitions are inevitable → choose CP or AP.

## Estimation
Back-of-envelope calculations are critical in system design.
- 1 byte = 8 bits
- 1MB = 10^6 bytes, 1GB = 10^9 bytes, 1TB = 10^12 bytes
- Read from RAM: ~0.1 μs | Read from SSD: ~100 μs | Read from HDD: ~10 ms
- Network within datacenter: ~0.5 ms | Cross-continent: ~150 ms

## Common Patterns

### CQRS (Command Query Responsibility Segregation)
Separate read and write models. Write to primary, read from replicas optimized for queries.

### Event Sourcing
Store sequence of events instead of current state. Replay events to reconstruct state.

### API Gateway
Single entry point for microservices. Handles auth, rate limiting, routing, logging.

### Microservices
Application as suite of small, independently deployable services. Each service owns its data.
Trade-offs: operational complexity vs independent scaling and deployment.
