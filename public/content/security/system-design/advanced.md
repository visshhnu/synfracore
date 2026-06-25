# System Design Advanced Concepts

## Large-Scale System Architecture

### Microservices at Scale
**Challenges:**
- Service discovery and load balancing
- Distributed tracing (Jaeger, Zipkin)
- Circuit breakers (Hystrix, resilience4j)
- Saga pattern for distributed transactions
- API versioning and backward compatibility

**Service Mesh (Istio/Linkerd):**
Sidecar proxy handles service-to-service communication, observability, security.

### Event-Driven Architecture
Services communicate via events. Decoupled but complex.

**Event Streaming Patterns:**
- **Event Sourcing**: State derived from event log
- **CQRS**: Separate read/write models, often with event sourcing
- **Outbox Pattern**: Atomically write to DB and event queue

## Distributed Data Patterns

### Data Consistency Models
- **Strong Consistency**: All reads see latest write. Requires coordination. Slow.
- **Eventual Consistency**: Reads may see stale data, eventually consistent.
- **Read-Your-Own-Writes**: User always sees their own writes.
- **Monotonic Read**: User doesn't read older data than previously read.
- **Causal Consistency**: Causally related operations ordered correctly.

### Vector Clocks
Track causality in distributed systems. Each node has a vector of counters. Used to detect conflicts in Dynamo-style systems.

### CRDTs (Conflict-free Replicated Data Types)
Data structures that can be merged without conflicts. Used in distributed systems without coordination. Examples: G-Counter, PN-Counter, LWW-Element-Set.

## High-Performance Systems

### Zero-Copy I/O
Avoid copying data between kernel and user space. `sendfile()` syscall transfers data directly from file to socket. Used in Kafka, Nginx.

### Connection Pooling
Reuse connections to database, services. Reduces connection establishment overhead. HikariCP, PgBouncer.

### Async I/O and Event Loop
Non-blocking I/O with event loop (Node.js, nginx). Single thread handles thousands of connections.

## Reliability Engineering

### Chaos Engineering
Deliberately inject failures to test system resilience. Netflix Chaos Monkey.

**Principles:**
1. Define steady state
2. Hypothesize steady state holds after chaos
3. Introduce real-world events (latency, crashes)
4. Disprove hypothesis

### Circuit Breaker Pattern
Monitor failures. If failures exceed threshold, "open" circuit and fast-fail. After timeout, allow limited requests (half-open). Close if successful.

States: Closed → Open → Half-Open → Closed

### Bulkhead Pattern
Isolate system components. If one fails, others continue. Like bulkheads in a ship. Thread pool isolation.

### Retry with Backoff
Retry failed operations with exponential backoff and jitter to avoid thundering herd.
```
wait = min(cap, base * 2^attempt) + jitter
```

## Real-World System Examples

### URL Shortener
- Unique short code generation: base62 encoding of auto-increment ID
- Redirect: HTTP 301 (cached by browser) vs 302 (tracked each time)
- Scale: Redis for hot URLs, DB for all mappings
- Rate limiting on creation

### News Feed (Twitter/Facebook)
- **Fan-out on write**: When user posts, push to all followers' feeds. Fast read, slow write.
- **Fan-out on read**: Compute feed at read time. Slow read, fast write.
- **Hybrid**: Fan-out on write for normal users, on read for celebrities with millions of followers.

### Distributed Cache (Redis Cluster)
- Consistent hashing across 16384 hash slots
- Cluster can have master-replica pairs per slot range
- Gossip protocol for cluster state

### Rate Limiter Service
- Redis INCR + EXPIRE for counter
- Lua scripts for atomic check-and-increment
- Sliding window with sorted sets

## Observability

### Three Pillars
- **Metrics**: Quantitative measurements over time (Prometheus + Grafana)
- **Logs**: Discrete events with context (ELK Stack, Loki)
- **Traces**: Request path across services (Jaeger, Zipkin, OpenTelemetry)

### SLO / SLA / SLI
- **SLI**: Service Level Indicator — actual measurement (latency p99, error rate)
- **SLO**: Service Level Objective — target (p99 < 200ms, error rate < 0.1%)
- **SLA**: Service Level Agreement — contract with consequences for breach

### Error Budget
100% - SLO = Error budget. Team can use budget for risky deploys. If budget exhausted, freeze features, focus on reliability.
