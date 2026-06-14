# PostgreSQL — Advanced

## Production Architecture and Performance

At the advanced level, you understand PostgreSQL internals, high-availability patterns, and production operations.







## Vacuum and Maintenance\n```sql\n-- VACUUM: reclaim space from dead tuples\nVACUUM ANALYZE orders;       -- Reclaim space + update statistics\nVACUUM FULL orders;          -- Rewrite table (locks, use sparingly)\n\n-- Autovacuum: runs automatically, tune it\nALTER TABLE orders SET (\n    autovacuum_vacuum_scale_factor = 0.01,  -- Vacuum when 1% of rows are dead\n    autovacuum_analyze_scale_factor = 0.005\n);\n\n-- Monitor bloat\nSELECT relname, n_dead_tup, n_live_tup,\n       round(n_dead_tup::numeric / NULLIF(n_live_tup, 0) * 100, 1) AS dead_ratio\nFROM pg_stat_user_tables\nORDER BY n_dead_tup DESC;\n\n-- pg_stat_statements: find slow queries\nCREATE EXTENSION pg_stat_statements;\nSELECT query, calls, total_exec_time/calls AS avg_ms\nFROM pg_stat_statements\nORDER BY avg_ms DESC LIMIT 20;\n```\n\n## Streaming Replication\n```sql\n-- postgresql.conf (primary)\nwal_level = replica\nmax_wal_senders = 3\nwal_keep_size = 1GB\n\n-- pg_hba.conf (primary)\nhost replication replicator replica-host/32 md5\n\n-- Start replica\npg_basebackup -h primary-host -U replicator -D /var/lib/postgresql/data -P -R\n-- The -R flag writes standby.signal and primary_conninfo automatically\n```



## Production Checklist
- ✅ Replication configured (primary + at least 1 replica)
- ✅ Automated backups with tested restore
- ✅ Monitoring: connections, query time, replication lag
- ✅ Alerting: disk space, CPU, slow queries
- ✅ Connection pooling configured
- ✅ Regular maintenance scheduled (VACUUM, ANALYZE, REPAIR)
