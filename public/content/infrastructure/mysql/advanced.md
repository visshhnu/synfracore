# MySQL — Advanced

## Production Architecture and Performance

At the advanced level, you understand MySQL internals, high-availability patterns, and production operations.

## Replication\nMySQL supports primary-replica replication (asynchronous by default):\n```sql\n-- On primary\nCREATE USER 'replicator'@'%' IDENTIFIED BY 'password';\nGRANT REPLICATION SLAVE ON *.* TO 'replicator'@'%';\nSHOW MASTER STATUS;\n\n-- On replica (my.cnf)\n[mysqld]\nserver-id = 2\nrelay-log = relay-log\nread_only = 1\n\n-- MySQL\nCHANGE MASTER TO\n    MASTER_HOST='primary-host',\n    MASTER_USER='replicator',\n    MASTER_LOG_FILE='mysql-bin.000001',\n    MASTER_LOG_POS=154;\nSTART SLAVE;\nSHOW SLAVE STATUS\\G\n```\n\n## InnoDB Internals\n- Buffer Pool: caches table and index data in memory (set to 70-80% of RAM)\n- Redo log: write-ahead log for crash recovery\n- Undo log: enables MVCC (readers don't block writers)\n- Deadlock detection: MySQL auto-detects and kills one transaction\n\n```sql\n-- Check buffer pool hit rate (should be > 99%)\nSHOW STATUS LIKE 'Innodb_buffer_pool_read%';\n\n-- Find slow queries\nSHOW VARIABLES LIKE 'slow_query_log%';\nSET GLOBAL slow_query_log = 1;\nSET GLOBAL long_query_time = 1;  -- Log queries > 1 second\n\n-- Kill blocking queries\nSHOW PROCESSLIST;\nKILL QUERY 123;\n```









## Production Checklist
- ✅ Replication configured (primary + at least 1 replica)
- ✅ Automated backups with tested restore
- ✅ Monitoring: connections, query time, replication lag
- ✅ Alerting: disk space, CPU, slow queries
- ✅ Connection pooling configured
- ✅ Regular maintenance scheduled (VACUUM, ANALYZE, REPAIR)
