# PostgreSQL — Intermediate

## Core Operations at Scale

At the intermediate level, you move from basic CRUD to understanding how PostgreSQL works under the hood and writing efficient queries.







## Advanced SQL\n```sql\n-- CTEs (Common Table Expressions)\nWITH monthly_revenue AS (\n    SELECT DATE_TRUNC('month', created_at) AS month, SUM(total) AS revenue\n    FROM orders GROUP BY 1\n)\nSELECT month, revenue,\n    LAG(revenue) OVER (ORDER BY month) AS prev_month,\n    ROUND((revenue - LAG(revenue) OVER (ORDER BY month)) / \n          LAG(revenue) OVER (ORDER BY month) * 100, 1) AS growth_pct\nFROM monthly_revenue ORDER BY month;\n\n-- Partial indexes (index only rows that match condition)\nCREATE INDEX idx_active_users ON users(email) WHERE is_active = true;\n-- Only indexes active users — much smaller, faster\n\n-- EXPLAIN ANALYZE\nEXPLAIN ANALYZE\nSELECT * FROM orders WHERE user_id = 5 AND status = 'paid';\n-- Look for: Index Scan (good) vs Seq Scan (bad for large tables)\n-- Check: actual rows vs estimated rows (large difference = stale stats)\n```\n\n## Connection Pooling\n```python\n# PgBouncer or psycopg2 pool\nfrom psycopg2 import pool\nconnection_pool = pool.ThreadedConnectionPool(\n    minconn=5,\n    maxconn=20,\n    host="localhost", database="myapp", user="postgres", password="secret"\n)\nconn = connection_pool.getconn()\n# use conn...\nconnection_pool.putconn(conn)  # return to pool\n```



## Performance Checklist
- ✅ Indexes on all columns used in WHERE, JOIN, ORDER BY
- ✅ EXPLAIN your slow queries — never guess
- ✅ Use connection pooling in production
- ✅ Set appropriate timeouts
- ✅ Monitor: query time, connection count, cache hit rate
