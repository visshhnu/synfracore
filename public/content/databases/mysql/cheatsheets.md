# MySQL — Cheatsheet

## Connection & Admin

```bash
mysql -u root -p                          # Local connect
mysql -h host -u user -p dbname           # Remote connect
mysqladmin -u root -p status              # Server status
mysqldump -u root -p mydb > backup.sql    # Backup
mysqldump -u root -p --single-transaction mydb > backup.sql  # InnoDB hot backup
mysql -u root -p mydb < backup.sql        # Restore
mysqlcheck -u root -p --all-databases     # Check all tables
```

## Database & Table Operations

```sql
SHOW DATABASES;
CREATE DATABASE mydb CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE mydb;
SHOW TABLES;
DESCRIBE users;                           -- Column info
SHOW CREATE TABLE users\G                 -- Full create statement, vertical output
SHOW INDEX FROM users;                    -- Index info
SHOW PROCESSLIST;                         -- Active queries
SHOW FULL PROCESSLIST;                    -- Includes full (untruncated) query text
KILL QUERY 42;                            -- Kill a running query, keep the connection
KILL 42;                                  -- Kill the query AND the connection
```

## Essential Queries

```sql
-- CRUD
INSERT INTO users (name, email) VALUES ('Alice', 'a@b.com');
INSERT INTO users (name) VALUES ('Bob'), ('Carol');       -- Multi-row insert
SELECT * FROM users WHERE active = 1 ORDER BY name LIMIT 10;
UPDATE users SET active = 0 WHERE last_login < '2023-01-01';
DELETE FROM users WHERE id = 42;
TRUNCATE TABLE logs;                      -- Fast delete all rows

-- JOINs
SELECT u.name, COUNT(o.id) AS orders
FROM users u LEFT JOIN orders o ON u.id = o.user_id
GROUP BY u.id HAVING orders > 5;

-- Subquery
SELECT * FROM products WHERE price > (SELECT AVG(price) FROM products);

-- UPSERT (MySQL-specific) — `key` is a reserved word in MySQL, so it must
-- be backtick-quoted whenever it's used as a column name
INSERT INTO counters (`key`, val) VALUES ('hits', 1)
ON DUPLICATE KEY UPDATE val = val + 1;
```

## Indexes

```sql
CREATE INDEX idx_email ON users(email);
CREATE UNIQUE INDEX idx_unique_email ON users(email);
CREATE INDEX idx_composite ON orders(user_id, created_at);  -- Most selective column first
CREATE FULLTEXT INDEX idx_ft ON posts(title, body);
DROP INDEX idx_email ON users;
ANALYZE TABLE t;                          -- Update statistics
EXPLAIN SELECT * FROM users WHERE email = 'a@b.com';        -- Check index use
EXPLAIN FORMAT=JSON SELECT ...\G                              -- Detailed plan
```

## Performance & Monitoring

```sql
SHOW STATUS LIKE 'Slow_queries';
SHOW VARIABLES LIKE 'slow_query_log%';
SET GLOBAL slow_query_log = 1;
SET GLOBAL long_query_time = 0.5;
SHOW ENGINE INNODB STATUS\G                -- InnoDB internals, deadlock info
SELECT * FROM performance_schema.events_statements_summary_by_digest
ORDER BY sum_timer_wait DESC LIMIT 10;
SHOW STATUS LIKE 'Innodb_buffer_pool_read%';
OPTIMIZE TABLE logs;                      -- Defragment table (locks it!)
```

## Variables

```sql
SHOW VARIABLES LIKE 'innodb_buffer_pool_size';  -- Should be 70-80% of RAM
SHOW VARIABLES LIKE 'max_connections';          -- Default 151, consider ProxySQL
SHOW VARIABLES LIKE 'innodb_io_capacity';       -- Set higher for SSDs (2000+)
SET GLOBAL innodb_buffer_pool_size = 8*1024*1024*1024;  -- 8GB (requires restart on older setups)
```

## Users & Grants

```sql
CREATE USER 'app'@'%' IDENTIFIED BY 'password';
GRANT SELECT, INSERT, UPDATE, DELETE ON myapp.* TO 'app'@'%';
GRANT ALL PRIVILEGES ON myapp.* TO 'admin'@'localhost';
FLUSH PRIVILEGES;
SHOW GRANTS FOR 'app'@'%';
DROP USER 'old_user'@'%';
```

## Transactions

```sql
START TRANSACTION;
UPDATE accounts SET bal = bal - 100 WHERE id = 1;
UPDATE accounts SET bal = bal + 100 WHERE id = 2;
COMMIT;   -- or ROLLBACK;

SET autocommit = 0;                       -- Disable auto-commit
SAVEPOINT sp1;                            -- Named savepoint
ROLLBACK TO sp1;                          -- Roll back to savepoint
```

## Replication (current terminology)

`SHOW SLAVE STATUS`, `SHOW MASTER STATUS`, `STOP/START SLAVE`, and `RESET SLAVE` were deprecated starting in MySQL 8.0.23 and removed entirely in the 8.4 LTS release — use the current commands below; a lot of tutorials online still show the old ones.

```sql
SHOW REPLICA STATUS\G      -- check replica health
SHOW BINARY LOG STATUS;    -- check source binlog position
STOP REPLICA;
START REPLICA;
RESET REPLICA ALL;         -- remove replication config
```

## Revision Notes

```
SHOW PROCESSLIST: find slow/blocking queries | KILL QUERY to terminate just the query
EXPLAIN: type=ALL bad (full scan) | type=ref/eq_ref/const good
LEFT JOIN: all from left, NULLs where no match
ON DUPLICATE KEY UPDATE: atomic upsert (no race condition) — quote reserved
  words like `key` if used as a column name
ANALYZE TABLE: refresh stats for query planner
InnoDB: row-level locking, ACID, foreign keys (always use InnoDB)
Replication terminology: MASTER/SLAVE removed in MySQL 8.4 — use
  SOURCE/REPLICA in all new work
```
