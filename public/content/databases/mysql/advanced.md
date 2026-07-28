# MySQL — Advanced

## Replication Setup (current terminology)

MySQL renamed replication commands starting in 8.0.23, and the old master/slave syntax was removed entirely in the 8.4 LTS release — use the names below.

```ini
# Source (primary) config (my.cnf)
[mysqld]
server-id = 1
log_bin = /var/log/mysql/mysql-bin.log
binlog_format = ROW          # ROW recommended (vs STATEMENT, MIXED)
binlog_row_image = MINIMAL   # Only changed columns

# Replica config
[mysqld]
server-id = 2
relay_log = /var/log/mysql/mysql-relay-bin.log
read_only = 1                # Replicas should be read-only
```

```sql
-- On the source: create replication user
CREATE USER 'repl'@'%' IDENTIFIED BY 'password';
GRANT REPLICATION SLAVE ON *.* TO 'repl'@'%';   -- privilege name is unchanged
SHOW BINARY LOG STATUS;   -- note File and Position

-- On the replica
CHANGE REPLICATION SOURCE TO
  SOURCE_HOST='source-host',
  SOURCE_USER='repl',
  SOURCE_PASSWORD='password',
  SOURCE_LOG_FILE='mysql-bin.000001',
  SOURCE_LOG_POS=154;
START REPLICA;
SHOW REPLICA STATUS\G   -- check Seconds_Behind_Source
```

```sql
-- GTID-based replication (recommended — simpler than file/position tracking)
-- my.cnf: gtid_mode = ON, enforce_gtid_consistency = ON
CHANGE REPLICATION SOURCE TO SOURCE_AUTO_POSITION = 1;
```

## Partitioning

```sql
-- Range partition (time-series data)
CREATE TABLE orders (
    id INT, created_at DATE, amount DECIMAL(10,2)
)
PARTITION BY RANGE (YEAR(created_at)) (
    PARTITION p2022 VALUES LESS THAN (2023),
    PARTITION p2023 VALUES LESS THAN (2024),
    PARTITION p2024 VALUES LESS THAN (2025),
    PARTITION p_future VALUES LESS THAN MAXVALUE
);

-- Only scans the relevant partition
SELECT * FROM orders WHERE created_at BETWEEN '2024-01-01' AND '2024-12-31';

-- Manage partitions
ALTER TABLE orders ADD PARTITION (PARTITION p2025 VALUES LESS THAN (2026));
ALTER TABLE orders DROP PARTITION p2022;
```

## Query Optimization

```sql
-- Use indexes effectively
-- BAD:  WHERE YEAR(created_at) = 2024     (function prevents index use entirely)
-- GOOD: WHERE created_at >= '2024-01-01' AND created_at < '2025-01-01'

-- BAD:  WHERE name LIKE '%alice%'          (leading wildcard = full scan)
-- GOOD: WHERE name LIKE 'alice%'           (uses index)
-- OR use a fulltext index for genuine contains-search needs

-- Covering index (all needed columns in the index)
CREATE INDEX idx_cover ON orders(user_id, status, amount);
SELECT user_id, status, amount FROM orders WHERE user_id = 123;
-- Above uses an index-only scan — no table access needed

-- Index foreign keys on the child table — critical for JOIN performance
CREATE INDEX idx_order_user ON orders(user_id);
```

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
