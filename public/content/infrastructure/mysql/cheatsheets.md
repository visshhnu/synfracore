# MySQL Quick Reference

## Connection & Admin
```bash
mysql -u root -p                          # Local connect
mysql -h host -u user -p dbname           # Remote connect
mysqladmin -u root -p status              # Server status
mysqldump -u root -p mydb > backup.sql    # Backup
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
SHOW CREATE TABLE users;                  -- Full create statement
SHOW INDEX FROM users;                    -- Index info
SHOW PROCESSLIST;                         -- Active queries
KILL 42;                                  -- Kill query by ID
```

## Essential Queries
```sql
-- CRUD
INSERT INTO users (name, email) VALUES ('Alice', 'a@b.com');
INSERT INTO users (name) VALUES ('Bob'), ('Carol');       -- Multi-row
SELECT * FROM users WHERE active = 1 ORDER BY name LIMIT 10;
UPDATE users SET active = 0 WHERE last_login < '2023-01-01';
DELETE FROM users WHERE id = 42;
TRUNCATE TABLE logs;                      -- Fast delete all rows

-- JOINs
SELECT u.name, COUNT(o.id) as orders
FROM users u LEFT JOIN orders o ON u.id = o.user_id
GROUP BY u.id HAVING orders > 5;

-- Subquery
SELECT * FROM products WHERE price > (SELECT AVG(price) FROM products);

-- UPSERT
INSERT INTO counters (key, val) VALUES ('hits', 1)
ON DUPLICATE KEY UPDATE val = val + 1;
```

## Indexes
```sql
CREATE INDEX idx_email ON users(email);
CREATE UNIQUE INDEX idx_unique_email ON users(email);
CREATE INDEX idx_composite ON orders(user_id, created_at);  -- Most specific first
DROP INDEX idx_email ON users;
EXPLAIN SELECT * FROM users WHERE email = 'a@b.com';        -- Check index use
EXPLAIN FORMAT=JSON SELECT ...;                              -- Detailed plan
```

## Performance & Monitoring
```sql
SHOW STATUS LIKE 'Slow_queries';
SHOW VARIABLES LIKE 'slow_query_log%';
SET GLOBAL slow_query_log = 1;
SET GLOBAL long_query_time = 0.5;
SHOW ENGINE INNODB STATUS;                -- InnoDB internals
ANALYZE TABLE orders;                     -- Update statistics
OPTIMIZE TABLE logs;                      -- Defragment table
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

## Revision Notes
```
SHOW PROCESSLIST: find slow/blocking queries | KILL to terminate
EXPLAIN: type=ALL bad (full scan) | type=ref/eq_ref/const good
LEFT JOIN: all from left, NULLs where no match
ON DUPLICATE KEY UPDATE: atomic upsert (no race condition)
ANALYZE TABLE: refresh stats for query planner
InnoDB: row-level locking, ACID, foreign keys (always use InnoDB)
```
