# System Design Interview Questions

## Common Interview Questions

**Q: Design a URL shortener (like bit.ly)**
- **Storage**: ~500M URLs, 500 bytes each → 250GB. Use MySQL or DynamoDB.
- **Short code**: Base62 encode auto-increment ID (6 chars = 62^6 = 56B URLs).
- **Redirect**: Cache hot URLs in Redis. HTTP 302 for analytics.
- **Scale**: Read-heavy. Multiple app servers, Redis cluster for hot URLs.

**Q: Design a rate limiter**
- Sliding window counter in Redis using sorted sets (timestamps as scores).
- Per-user and global limits. Return 429 when exceeded.
- Distributed: single Redis cluster or Redis Cluster with consistent hashing.
- Lua scripts for atomic check-and-increment.

**Q: Design a distributed cache**
- Consistent hashing for key distribution.
- Replication for availability (primary-replica per node).
- Eviction: LRU or TTL-based.
- Cache-aside pattern; application manages cache population.
- Thundering herd: mutex/lock on cache miss for popular keys.

**Q: Design Twitter's feed**
- Fan-out on write for normal users (push posts to follower feeds).
- Fan-out on read for celebrities (compute on request).
- Redis sorted sets for feed storage, ranked by timestamp.
- Kafka for async fan-out processing.

**Q: Design a notification system**
- User device tokens stored in DB (one-to-many: user to devices).
- Notification service creates event, publishes to Kafka.
- Workers for each channel: Push (APNs/FCM), Email (SES), SMS (Twilio).
- Delivery tracking, retry on failure, DLQ for failed notifications.

**Q: Design a key-value store**
- API: get(key), put(key, value), delete(key).
- In-memory hash table for hot data, persistence via WAL + snapshots.
- Consistent hashing for distribution across nodes.
- Gossip protocol for cluster state.
- Quorum reads/writes for consistency.

## Design Framework (RADIO)
1. **Requirements**: Functional and non-functional (scale, latency, consistency)
2. **API Design**: Define interfaces
3. **Data Model**: Schema, storage choices
4. **Interface**: High-level components diagram
5. **Optimization**: Identify and solve bottlenecks

## Key Questions to Ask
- Scale: How many users? Read vs write ratio?
- Consistency vs Availability trade-off?
- Latency requirements (p99 SLO)?
- Global vs single region?
- Is data loss acceptable?

## Scaling Checklist
- [ ] Load balancer in front of app servers
- [ ] Horizontal scaling of app layer (stateless)
- [ ] Cache layer (Redis) for hot data
- [ ] Read replicas for DB read scaling
- [ ] CDN for static assets
- [ ] Message queue for async processing
- [ ] Database sharding if needed
- [ ] Rate limiting at API gateway
- [ ] Monitoring and alerting

## Common Mistakes to Avoid
- Starting with implementation details, not requirements
- Ignoring failure scenarios
- Single point of failure
- Not discussing trade-offs
- Over-engineering from the start
- Forgetting about data consistency issues in distributed setup
