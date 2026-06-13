# MySQL — Advanced

## Vitess — MySQL at Scale

```yaml
# Vitess: horizontal sharding layer on top of MySQL
# Used by YouTube, Slack, GitHub, Square

# Key components:
# VTTablet: sits beside each MySQL instance
# VTGate: query router (your app connects here, not to MySQL)
# VTctld: admin interface
# VTOrc: orchestrator for HA

# Keyspace = logical database
# Shard = physical MySQL instance
# Vindexes = shard keys (how data is distributed)

# Unsharded keyspace (single shard, like normal MySQL)
# Good for: small tables, lookup tables

# Sharded keyspace
# customer → shard 0 (customers 1-500k)
# customer → shard 1 (customers 500k-1M)

# Schema changes with Vitess (online, non-blocking)
vtctlclient ApplySchema \
    --sql "ALTER TABLE orders ADD COLUMN promo_code VARCHAR(50)" \
    myapp_keyspace
```

## ProxySQL (Connection Pooling + Query Routing)

```sql
-- ProxySQL: smart MySQL proxy
-- Connection pooling, query caching, read/write split, firewall

-- Route reads to replicas automatically
-- In admin interface:
INSERT INTO mysql_query_rules
    (rule_id, active, match_pattern, destination_hostgroup, apply)
VALUES
    (1, 1, '^SELECT',   20, 1),  -- SELECTs → hostgroup 20 (replicas)
    (2, 1, '.*',        10, 1);  -- Everything else → hostgroup 10 (primary)

-- Query caching
INSERT INTO mysql_query_rules (rule_id, active, match_pattern, cache_ttl)
VALUES (3, 1, '^SELECT count\(\*\) FROM products', 60000);  -- Cache 1 minute
```

## MySQL Cheatsheet

```sql
-- ── COMMON OPERATIONS ─────────────────────────────────────
SHOW FULL PROCESSLIST;                          -- Running queries
KILL QUERY 1234;                                -- Kill a query
SHOW ENGINE INNODB STATUS\G                     -- InnoDB internals

-- ── INDEX MANAGEMENT ──────────────────────────────────────
SHOW INDEX FROM tablename;
ALTER TABLE t ADD INDEX idx_name (col1, col2);
ALTER TABLE t ADD UNIQUE INDEX idx_uniq (col);
ALTER TABLE t DROP INDEX idx_name;
ANALYZE TABLE t;                                -- Update statistics
OPTIMIZE TABLE t;                               -- Defragment (locks table!)

-- ── BACKUP ────────────────────────────────────────────────
mysqldump -u root -p mydb > backup.sql
mysqldump -u root -p --single-transaction mydb > backup.sql  # InnoDB hot backup
mysql -u root -p mydb < backup.sql
# For large databases: use Percona XtraBackup (hot, incremental)

-- ── PERFORMANCE ───────────────────────────────────────────
SELECT * FROM information_schema.INNODB_METRICS WHERE STATUS = 'enabled';
SELECT * FROM performance_schema.events_statements_summary_by_digest
ORDER BY sum_timer_wait DESC LIMIT 10;
SHOW STATUS LIKE 'Innodb_buffer_pool_read_requests';
SHOW STATUS LIKE 'Innodb_buffer_pool_reads';
-- Hit ratio = (read_requests - reads) / read_requests * 100 (aim for > 99%)

-- ── VARIABLES ─────────────────────────────────────────────
SHOW VARIABLES LIKE 'innodb_buffer_pool_size';  -- Should be 70-80% of RAM
SHOW VARIABLES LIKE 'max_connections';          -- Default 151, use ProxySQL
SHOW VARIABLES LIKE 'innodb_io_capacity';       -- Set higher for SSDs (2000+)
SET GLOBAL innodb_buffer_pool_size = 8*1024*1024*1024;  -- 8GB (requires restart on old versions)
```
