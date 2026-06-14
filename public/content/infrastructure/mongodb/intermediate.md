# MongoDB — Intermediate

## Core Operations at Scale

At the intermediate level, you move from basic CRUD to understanding how MongoDB works under the hood and writing efficient queries.





## Aggregation Pipeline\n```javascript\n// Count orders by status\ndb.orders.aggregate([\n    { $match: { created_at: { $gte: new Date("2024-01-01") } } },\n    { $group: {\n        _id: "$status",\n        count: { $sum: 1 },\n        total_revenue: { $sum: "$amount" }\n    }},\n    { $sort: { count: -1 } }\n])\n\n// Lookup (JOIN equivalent)\ndb.orders.aggregate([\n    { $lookup: {\n        from: "users",\n        localField: "user_id",\n        foreignField: "_id",\n        as: "user"\n    }},\n    { $unwind: "$user" },\n    { $project: { "user.name": 1, amount: 1, status: 1 } }\n])\n\n// Indexes\ndb.orders.createIndex({ user_id: 1, created_at: -1 })\ndb.users.createIndex({ email: 1 }, { unique: true })\ndb.products.createIndex({ name: "text", description: "text" })  // Text search\n\n// Explain a query\ndb.orders.find({ status: "pending" }).explain("executionStats")\n// Look for: IXSCAN (good) vs COLLSCAN (bad — no index)\n```





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
