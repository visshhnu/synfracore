# Cassandra — Intermediate

## Core Operations at Scale

At the intermediate level, you move from basic CRUD to understanding how Cassandra works under the hood and writing efficient queries.









## Data Modeling for Cassandra\n```cql\n-- Design for your queries — not normalized like SQL\n-- Query: "get all orders for user X, sorted by date"\nCREATE TABLE orders_by_user (\n    user_id UUID,\n    created_at TIMESTAMP,\n    order_id UUID,\n    status TEXT,\n    total DECIMAL,\n    PRIMARY KEY (user_id, created_at)  -- partition by user, cluster by date\n) WITH CLUSTERING ORDER BY (created_at DESC);\n\n-- Query: "get all orders with status=pending" (different access pattern = different table!)\nCREATE TABLE orders_by_status (\n    status TEXT,\n    created_at TIMESTAMP,\n    order_id UUID,\n    user_id UUID,\n    PRIMARY KEY (status, created_at)\n) WITH CLUSTERING ORDER BY (created_at DESC);\n\n-- Batch (atomic for same partition)\nBEGIN BATCH\n    INSERT INTO orders_by_user (user_id, created_at, order_id) VALUES (?, ?, ?);\n    INSERT INTO orders_by_status (status, created_at, order_id) VALUES (?, ?, ?);\nAPPLY BATCH;\n```

## Performance Checklist
- ✅ Indexes on all columns used in WHERE, JOIN, ORDER BY
- ✅ EXPLAIN your slow queries — never guess
- ✅ Use connection pooling in production
- ✅ Set appropriate timeouts
- ✅ Monitor: query time, connection count, cache hit rate

## Performance Monitoring

Track these metrics in production to spot issues early:
- Query response time (aim for < 10ms for cached, < 100ms for DB queries)
- Connection pool utilization (alert if > 80%)
- Cache hit rate (Redis: should be > 90%)
- Replication lag (should be < 1 second)
- Disk usage growth rate (project when you will run out)

## Next Steps

Complete the **Advanced** section to learn production architecture patterns including:
- High availability and automatic failover
- Horizontal scaling strategies
- Security hardening
- Backup and disaster recovery
