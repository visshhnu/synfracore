# MySQL — Fundamentals

## Setup and Connection

```bash
# Docker — quickest setup
docker run -d --name mysql \
    -e MYSQL_ROOT_PASSWORD=rootpass \
    -e MYSQL_DATABASE=myapp \
    -e MYSQL_USER=appuser \
    -e MYSQL_PASSWORD=apppass \
    -p 3306:3306 \
    mysql:8.0

# Connect
mysql -h 127.0.0.1 -u appuser -p myapp
mysql -u root -p  # then type password

# Useful commands inside MySQL
SHOW DATABASES;
USE myapp;
SHOW TABLES;
DESCRIBE users;
SHOW CREATE TABLE users\G    # \G = vertical output
SHOW PROCESSLIST;            # Running queries
SHOW STATUS LIKE 'Threads%';
```

## MySQL-Specific Features

```sql
-- AUTO_INCREMENT (MySQL's SERIAL equivalent)
CREATE TABLE users (
    id         BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    email      VARCHAR(255) NOT NULL,
    username   VARCHAR(50) NOT NULL,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    UNIQUE KEY uk_email (email),
    INDEX idx_username (username)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ENUM type (MySQL-specific, avoid in portable SQL)
CREATE TABLE orders (
    id     BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    status ENUM('pending','processing','shipped','delivered','cancelled') DEFAULT 'pending'
);

-- JSON column (MySQL 5.7.8+)
CREATE TABLE products (
    id         BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name       VARCHAR(255) NOT NULL,
    attributes JSON
);

INSERT INTO products (name, attributes)
VALUES ('Laptop', '{"brand":"Dell","ram":16,"storage":512}');

-- Query JSON
SELECT name, JSON_EXTRACT(attributes, '$.brand') AS brand
FROM products;
-- Or using ->> shorthand (unquoted)
SELECT name, attributes->>'$.brand' AS brand FROM products;
```

## InnoDB Storage Engine

```sql
-- InnoDB is default and required for:
-- - ACID transactions
-- - Foreign keys
-- - Row-level locking (vs table-level in MyISAM)

-- Transactions
START TRANSACTION;
UPDATE accounts SET balance = balance - 100 WHERE id = 1;
UPDATE accounts SET balance = balance + 100 WHERE id = 2;
COMMIT;
-- On error:
ROLLBACK;

-- Savepoints
START TRANSACTION;
UPDATE inventory SET qty = qty - 1 WHERE product_id = 5;
SAVEPOINT after_inventory;
INSERT INTO order_items (order_id, product_id, qty) VALUES (100, 5, 1);
-- If order item insert fails:
ROLLBACK TO after_inventory;
COMMIT;

-- Isolation levels
SET SESSION TRANSACTION ISOLATION LEVEL READ COMMITTED;
-- READ UNCOMMITTED: dirty reads allowed (never use)
-- READ COMMITTED:   no dirty reads (PostgreSQL default)
-- REPEATABLE READ:  no dirty or non-repeatable reads (MySQL default)
-- SERIALIZABLE:     strictest, slowest
```

## Performance Tuning

```sql
-- EXPLAIN — understand query execution
EXPLAIN SELECT * FROM orders WHERE user_id = 1 AND status = 'pending';
EXPLAIN FORMAT=JSON SELECT ...\G  -- Detailed JSON output

-- Key fields in EXPLAIN:
-- type: system > const > ref > range > index > ALL (ALL = bad, full scan)
-- key: which index is used (NULL = no index used)
-- rows: estimated rows to examine
-- Extra: "Using index" = good, "Using filesort" = possible issue

-- Slow query log
SET GLOBAL slow_query_log = 1;
SET GLOBAL long_query_time = 1;   -- Log queries > 1 second
SET GLOBAL slow_query_log_file = '/var/log/mysql/slow.log';

-- pt-query-digest to analyze slow log
pt-query-digest /var/log/mysql/slow.log | head -100

-- Index hints
SELECT * FROM orders FORCE INDEX (idx_user_status)
WHERE user_id = 1 AND status = 'pending';
```

## Replication Setup

```ini
# Master (primary) my.cnf
[mysqld]
server-id = 1
log-bin = mysql-bin
binlog-format = ROW
binlog-do-db = myapp

# Replica my.cnf
[mysqld]
server-id = 2
relay-log = relay-bin
read-only = 1
```

```sql
-- On master: create replication user
CREATE USER 'replicator'@'%' IDENTIFIED BY 'repl_password';
GRANT REPLICATION SLAVE ON *.* TO 'replicator'@'%';
SHOW MASTER STATUS;  -- Note File and Position

-- On replica: configure and start
CHANGE MASTER TO
    MASTER_HOST='master_host',
    MASTER_USER='replicator',
    MASTER_PASSWORD='repl_password',
    MASTER_LOG_FILE='mysql-bin.000001',  -- from SHOW MASTER STATUS
    MASTER_LOG_POS=154;
START SLAVE;
SHOW SLAVE STATUS\G  -- Check Seconds_Behind_Master = 0
```
