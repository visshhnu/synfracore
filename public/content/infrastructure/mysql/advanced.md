# MySQL Advanced Topics

## Replication Setup

```bash
# Master config (my.cnf)
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
-- On Master: create replication user
CREATE USER 'repl'@'%' IDENTIFIED BY 'password';
GRANT REPLICATION SLAVE ON *.* TO 'repl'@'%';
SHOW MASTER STATUS;   -- Note: File and Position

-- On Replica
CHANGE MASTER TO
  MASTER_HOST='master-host',
  MASTER_USER='repl',
  MASTER_PASSWORD='password',
  MASTER_LOG_FILE='mysql-bin.000001',
  MASTER_LOG_POS=154;
START SLAVE;
SHOW SLAVE STATUS\G   -- Check Seconds_Behind_Master
```

GTID-based replication (recommended): unique transaction ID across cluster.
```sql
-- my.cnf
gtid_mode = ON
enforce_gtid_consistency = ON

-- Replica setup (simpler with GTID)
CHANGE MASTER TO MASTER_AUTO_POSITION = 1;
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

-- Only scans relevant partition
SELECT * FROM orders WHERE created_at BETWEEN '2024-01-01' AND '2024-12-31';

-- Manage partitions
ALTER TABLE orders ADD PARTITION (PARTITION p2025 VALUES LESS THAN (2026));
ALTER TABLE orders DROP PARTITION p2022;
```

## Query Optimisation

```sql
-- Use indexes effectively
-- BAD:  WHERE YEAR(created_at) = 2024     (function prevents index)
-- GOOD: WHERE created_at >= '2024-01-01' AND created_at < '2025-01-01'

-- BAD:  WHERE name LIKE '%alice%'          (leading wildcard = full scan)
-- GOOD: WHERE name LIKE 'alice%'           (uses index)
-- OR use fulltext index for contains search

-- Covering index (all needed columns in index)
CREATE INDEX idx_cover ON orders(user_id, status, amount);
SELECT user_id, status, amount FROM orders WHERE user_id = 123;
-- Above uses index-only scan (no table access)

-- JOIN optimization
-- Index foreign keys on child table
CREATE INDEX idx_order_user ON orders(user_id);  -- Critical for JOINs

-- EXPLAIN output key fields
-- type: system > const > eq_ref > ref > range > index > ALL
-- key: index used | rows: estimated rows | Extra: Using index (good)
```

## ProxySQL — Connection Pooling

```bash
# ProxySQL routes traffic, pools connections, does read/write splitting
# Read queries → replicas | Write queries → primary

# Admin interface
mysql -u admin -padmin -h 127.0.0.1 -P6032

# Route SELECTs to replicas
INSERT INTO mysql_query_rules(rule_id, active, match_pattern, destination_hostgroup)
VALUES (1, 1, '^SELECT', 2);  -- hostgroup 2 = replicas
LOAD MYSQL QUERY RULES TO RUNTIME;
```

## Revision Notes
```
REPLICATION: ROW format recommended. GTID for easier failover.
  Master: log_bin=ON | Replica: read_only=ON | SHOW SLAVE STATUS check lag

PARTITIONING: RANGE (dates), LIST (categories), HASH (even distribution)
  Prune partitions for time-series → massive read performance gain

QUERY OPT:
  No functions on indexed cols | Leading wildcard = no index
  Covering index = index-only scan (fastest reads)
  EXPLAIN: ALL = bad, const/ref = good

PROXYSQL: connection pooling + read/write splitting
  SELECTs → replicas | writes → primary
  Dramatically reduces connection overhead for many short-lived connections
```
