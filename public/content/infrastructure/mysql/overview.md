# MySQL — The World's Most Popular Open Source Database

MySQL powers billions of websites and applications — WordPress, Facebook (at its core), Twitter, YouTube, and millions more. It's the most deployed relational database in the world and a fundamental skill for any backend or DevOps engineer.

## MySQL vs PostgreSQL — When to Choose Which

| MySQL | PostgreSQL |
|-------|------------|
| Simpler setup, widely hosted | More feature-rich, advanced SQL |
| Faster simple read queries | Better for complex queries |
| Better replication ecosystem | Better ACID compliance |
| Most shared hosting support | Better for large datasets |
| Widely known, more resources | JSON, arrays, custom types |

**Rule of thumb:** MySQL for web apps, WordPress, high-read workloads. PostgreSQL for complex queries, analytics, custom data types.

## Installation & Setup

```bash
# Docker (recommended)
docker run -d \
  --name mysql \
  -e MYSQL_ROOT_PASSWORD=rootpass \
  -e MYSQL_DATABASE=myapp \
  -e MYSQL_USER=appuser \
  -e MYSQL_PASSWORD=apppass \
  -p 3306:3306 \
  mysql:8.0

# Ubuntu
sudo apt install mysql-server
sudo mysql_secure_installation

# Connect
mysql -u root -p
mysql -h hostname -u appuser -p myapp
mysql -u root -p -e "SHOW DATABASES;"
```

## Core SQL

```sql
-- Create database and tables
CREATE DATABASE myapp CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE myapp;

CREATE TABLE users (
    id          BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    email       VARCHAR(255) NOT NULL,
    username    VARCHAR(50) NOT NULL,
    password    VARCHAR(255) NOT NULL,
    full_name   VARCHAR(100),
    is_active   TINYINT(1) DEFAULT 1,
    created_at  DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at  DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    UNIQUE KEY uk_email (email),
    UNIQUE KEY uk_username (username),
    INDEX idx_created_at (created_at)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Auto-update timestamp trigger (alternative to ON UPDATE)
DELIMITER //
CREATE TRIGGER before_user_update
BEFORE UPDATE ON users
FOR EACH ROW
BEGIN
    SET NEW.updated_at = NOW();
END//
DELIMITER ;

-- Common queries
SELECT u.id, u.email, COUNT(p.id) as post_count
FROM users u
LEFT JOIN posts p ON u.id = p.user_id
WHERE u.is_active = 1
GROUP BY u.id, u.email
HAVING post_count > 5
ORDER BY post_count DESC
LIMIT 20;

-- EXPLAIN — check query performance
EXPLAIN SELECT * FROM users WHERE email = 'alice@example.com';
EXPLAIN FORMAT=JSON SELECT * FROM users WHERE is_active = 1;
-- Look for: type=ref or type=const (good), type=ALL (bad, full table scan)
```

## Indexes Deep Dive

```sql
-- Types of indexes
CREATE INDEX idx_name ON users(email);                   -- B-tree (default)
CREATE UNIQUE INDEX uk_email ON users(email);            -- Unique
CREATE FULLTEXT INDEX ft_content ON posts(title, body);  -- Full text
CREATE INDEX idx_composite ON orders(user_id, status, created_at);  -- Composite

-- Composite index rule: leftmost prefix
-- Index (a, b, c) helps: WHERE a=1, WHERE a=1 AND b=2, WHERE a=1 AND b=2 AND c=3
-- Does NOT help: WHERE b=2, WHERE c=3, WHERE b=2 AND c=3

-- Covering index (all needed columns in index = no table lookup)
CREATE INDEX idx_covering ON posts(user_id, created_at, title, status);
-- This query uses covering index (no table access needed):
SELECT title, created_at, status FROM posts WHERE user_id = 42;

-- Partial index (MySQL 8.0+: filtered with WHERE in generated column)
-- For large tables, consider using generated columns

-- Check index usage
SHOW INDEX FROM users;
SELECT * FROM information_schema.STATISTICS WHERE TABLE_NAME = 'users';
```

## Performance Tuning

```sql
-- Slow query log
SET GLOBAL slow_query_log = 'ON';
SET GLOBAL long_query_time = 1;  -- Log queries > 1 second
SHOW VARIABLES LIKE 'slow_query_log_file';

-- Key configuration (my.cnf)
-- innodb_buffer_pool_size = 70% of RAM for dedicated DB server
-- innodb_log_file_size = 256M or larger
-- query_cache_size = 0 (query cache deprecated in MySQL 8.0)
-- max_connections = 500 (match your connection pool)
-- innodb_flush_log_at_trx_commit = 2 (sacrifice some durability for performance)

-- Check table sizes
SELECT
    table_name,
    ROUND(data_length/1024/1024, 2) as data_mb,
    ROUND(index_length/1024/1024, 2) as index_mb,
    ROUND((data_length + index_length)/1024/1024, 2) as total_mb
FROM information_schema.TABLES
WHERE table_schema = 'myapp'
ORDER BY total_mb DESC;

-- Find long-running queries
SHOW PROCESSLIST;
SELECT * FROM information_schema.PROCESSLIST
WHERE TIME > 10
ORDER BY TIME DESC;

-- Kill a query
KILL QUERY 12345;
```

## Replication

```bash
# Master/Primary configuration (my.cnf)
[mysqld]
server-id = 1
log_bin = /var/log/mysql/mysql-bin.log
binlog_do_db = myapp
binlog_format = ROW               # Most reliable for replication

# Replica configuration (my.cnf)
[mysqld]
server-id = 2
relay-log = /var/log/mysql/mysql-relay-bin.log
read_only = ON

# On Primary: create replication user
CREATE USER 'replica'@'%' IDENTIFIED BY 'replicapass';
GRANT REPLICATION SLAVE ON *.* TO 'replica'@'%';
SHOW MASTER STATUS;  # Note File and Position

# On Replica: configure and start replication
CHANGE REPLICATION SOURCE TO
  SOURCE_HOST='primary-host',
  SOURCE_USER='replica',
  SOURCE_PASSWORD='replicapass',
  SOURCE_LOG_FILE='mysql-bin.000001',
  SOURCE_LOG_POS=123;
START REPLICA;
SHOW REPLICA STATUS\G  # Check Seconds_Behind_Source
```

## Python with MySQL

```python
import mysql.connector
from mysql.connector import pooling

# Connection pool
config = {
    "host": "localhost",
    "user": "appuser",
    "password": "apppass",
    "database": "myapp",
    "pool_name": "mypool",
    "pool_size": 10,
    "connect_timeout": 10,
    "use_pure": True,
}

pool = mysql.connector.pooling.MySQLConnectionPool(**config)

def execute_query(query: str, params: tuple = (), fetchall: bool = False):
    conn = pool.get_connection()
    cursor = conn.cursor(dictionary=True)
    try:
        cursor.execute(query, params)
        if fetchall:
            return cursor.fetchall()
        conn.commit()
        return cursor.lastrowid
    except mysql.connector.Error as e:
        conn.rollback()
        raise
    finally:
        cursor.close()
        conn.close()

# Usage
users = execute_query(
    "SELECT id, email FROM users WHERE is_active = %s LIMIT %s",
    (1, 100),
    fetchall=True
)

user_id = execute_query(
    "INSERT INTO users (email, username, password) VALUES (%s, %s, %s)",
    ("alice@example.com", "alice", "hashed_pass")
)
```

## Interview Questions

**What is the difference between InnoDB and MyISAM?**
InnoDB is the default and recommended storage engine — it supports ACID transactions, row-level locking, foreign keys, and crash recovery via the redo log. MyISAM is older, doesn't support transactions or foreign keys, uses table-level locking (terrible for concurrent writes), but was slightly faster for read-heavy workloads without concurrent writes. MyISAM is essentially obsolete. Always use InnoDB unless you have a very specific read-only use case.

**What is a covering index?**
A covering index includes all columns needed by a query in the index itself, so MySQL can satisfy the query entirely from the index without accessing the actual table rows (no "table lookup"). Example: if you frequently run `SELECT user_id, created_at FROM orders WHERE status = 'completed'`, creating `INDEX idx_covering ON orders(status, user_id, created_at)` means MySQL reads only the index — much faster. You can verify with EXPLAIN — look for "Using index" in the Extra column.
