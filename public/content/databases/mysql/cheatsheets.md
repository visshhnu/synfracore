# MySQL — Cheatsheet

```sql
-- ── CONNECT ───────────────────────────────────────────────
mysql -h host -u user -p database
mysql -u root -p

-- ── DATABASE / TABLE ──────────────────────────────────────
SHOW DATABASES;
USE myapp;
SHOW TABLES;
SHOW CREATE TABLE users\G
DESCRIBE users;
SHOW INDEX FROM users;

-- ── CRUD ──────────────────────────────────────────────────
INSERT INTO t (c1,c2) VALUES (v1,v2);
INSERT INTO t (c1,c2) VALUES (v1,v2)
    ON DUPLICATE KEY UPDATE c2 = VALUES(c2);  -- Upsert (MySQL-specific)
SELECT * FROM t WHERE col = 'val' LIMIT 20;
UPDATE t SET col = val WHERE condition;
DELETE FROM t WHERE condition;
REPLACE INTO t (c1,c2) VALUES (v1,v2);  -- Delete+insert if exists
TRUNCATE t;                              -- Fast delete all

-- ── INDEXES ───────────────────────────────────────────────
ALTER TABLE t ADD INDEX idx_name (col);
ALTER TABLE t ADD UNIQUE INDEX idx_uniq (col1, col2);
ALTER TABLE t ADD FULLTEXT INDEX idx_ft (col);
ALTER TABLE t DROP INDEX idx_name;
ANALYZE TABLE t;  -- Update statistics

-- ── PERFORMANCE ───────────────────────────────────────────
EXPLAIN SELECT ...;
EXPLAIN FORMAT=JSON SELECT ...\G
SHOW FULL PROCESSLIST;
SHOW ENGINE INNODB STATUS\G
SHOW STATUS LIKE 'Innodb_buffer_pool%';
KILL QUERY pid;

-- ── VARIABLES ─────────────────────────────────────────────
SHOW VARIABLES LIKE 'innodb_buffer_pool_size';
SHOW VARIABLES LIKE 'max_connections';
SHOW VARIABLES LIKE 'slow_query_log%';
SET GLOBAL slow_query_log = 1;
SET GLOBAL long_query_time = 1;

-- ── USERS ─────────────────────────────────────────────────
CREATE USER 'app'@'%' IDENTIFIED BY 'password';
GRANT SELECT, INSERT, UPDATE, DELETE ON myapp.* TO 'app'@'%';
GRANT ALL PRIVILEGES ON myapp.* TO 'admin'@'localhost';
FLUSH PRIVILEGES;
SHOW GRANTS FOR 'app'@'%';
DROP USER 'old_user'@'%';

-- ── BACKUP ────────────────────────────────────────────────
-- mysqldump -u root -p --single-transaction mydb > backup.sql
-- mysql -u root -p mydb < backup.sql

-- ── REPLICATION ───────────────────────────────────────────
SHOW SLAVE STATUS\G     -- Check replica health
SHOW MASTER STATUS;     -- Check primary binlog position
STOP SLAVE;
START SLAVE;
RESET SLAVE ALL;        -- Remove replication config
```
