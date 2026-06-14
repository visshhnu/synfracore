# MySQL — Intermediate

## Core Operations at Scale

At the intermediate level, you move from basic CRUD to understanding how MySQL works under the hood and writing efficient queries.

## SQL Joins and Aggregations\n```sql\n-- INNER JOIN: only matching rows\nSELECT u.name, o.total FROM users u\nINNER JOIN orders o ON u.id = o.user_id;\n\n-- LEFT JOIN: all users, NULL if no orders\nSELECT u.name, COUNT(o.id) as order_count\nFROM users u LEFT JOIN orders o ON u.id = o.user_id\nGROUP BY u.id, u.name\nHAVING COUNT(o.id) > 5\nORDER BY order_count DESC;\n\n-- Subquery\nSELECT * FROM products\nWHERE price > (SELECT AVG(price) FROM products);\n\n-- Window function\nSELECT name, price,\n    RANK() OVER (PARTITION BY category ORDER BY price DESC) as price_rank\nFROM products;\n```\n\n## Indexing Strategy\n```sql\n-- Always index foreign keys\nCREATE INDEX idx_orders_user_id ON orders(user_id);\n\n-- Composite index: column order matters\n-- Good for WHERE status = X AND created_at > Y\nCREATE INDEX idx_orders_status_date ON orders(status, created_at);\n\n-- Check if index is used\nEXPLAIN SELECT * FROM orders WHERE user_id = 5;\n-- Look for: type=ref (index used) vs type=ALL (full scan — bad)\n```









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
