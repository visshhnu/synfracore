# System Design Cheatsheet

## Capacity Estimation Quick Reference
| Resource | Typical Numbers |
|---------|----------------|
| Daily active users (social app) | 100M-1B |
| Read:Write ratio | 10:1 to 100:1 |
| DB record size | 1-10KB average |
| Image/thumbnail | 200KB-1MB |
| QPS for 1M DAU | ~12 QPS |
| 1B requests/day | ~11,600 QPS |
| 1TB storage per day | ~11MB/s write |

## Storage Numbers
```
1KB  = 10^3 bytes    Characters: ~1,000
1MB  = 10^6 bytes    Photo: ~1MB
1GB  = 10^9 bytes    Movie: ~1-4GB
1TB  = 10^12 bytes   Large dataset
1PB  = 10^15 bytes   Exabyte-scale
```

## Latency Numbers
```
L1 cache hit:         ~1 ns
L2 cache hit:         ~5 ns
RAM access:           ~100 ns
SSD random read:      ~100 μs
Network same DC:      ~0.5 ms
SSD sequential read:  ~1 MB/ms
HDD seek:             ~10 ms
Cross-continent:      ~150 ms
```

## Common Components and Tools
| Need | Options |
|------|---------|
| Load Balancer | Nginx, HAProxy, AWS ALB |
| Cache | Redis, Memcached |
| Message Queue | Kafka, RabbitMQ, SQS |
| Search | Elasticsearch, Solr |
| Object Storage | S3, GCS |
| CDN | CloudFront, Cloudflare |
| Service Discovery | Consul, Kubernetes DNS |
| Distributed Tracing | Jaeger, Zipkin |
| Metrics | Prometheus + Grafana |

## Database Selection Guide
| Use Case | Database |
|---------|---------|
| General CRUD | PostgreSQL / MySQL |
| Caching / Sessions | Redis |
| Full-text search | Elasticsearch |
| Time-series | InfluxDB / TimescaleDB |
| Large-scale write | Cassandra |
| Graph data | Neo4j |
| Document store | MongoDB |
| Managed scale | DynamoDB |

## Availability Numbers
| Uptime | Downtime/year | Downtime/month |
|--------|--------------|----------------|
| 99% | 3.65 days | 7.3 hours |
| 99.9% | 8.76 hours | 43.8 minutes |
| 99.99% | 52.6 minutes | 4.4 minutes |
| 99.999% | 5.26 minutes | 26 seconds |

## API Design Quick Reference
- **GET /resources** — list
- **GET /resources/{id}** — get one
- **POST /resources** — create
- **PUT /resources/{id}** — replace
- **PATCH /resources/{id}** — partial update
- **DELETE /resources/{id}** — delete

HTTP Status Codes: 200 OK, 201 Created, 204 No Content, 400 Bad Request, 401 Unauthorized, 403 Forbidden, 404 Not Found, 409 Conflict, 429 Too Many Requests, 500 Server Error

## Common Trade-offs
| Choice A | vs | Choice B | When to choose A |
|---------|-----|---------|----------------|
| SQL | NoSQL | Schema, ACID needed |
| CP | AP | Data consistency critical |
| Fan-out write | Fan-out read | Read-heavy, low celeb ratio |
| Sync replication | Async | No data loss acceptable |
| Microservices | Monolith | Independent scaling needed |
