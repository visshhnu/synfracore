# MySQL Intermediate Topics

## InnoDB Storage Engine

InnoDB is MySQL's default and recommended storage engine. Key features:

- **ACID transactions**: BEGIN/COMMIT/ROLLBACK with full support
- **Row-level locking**: Better concurrency than table-level locks
- **Foreign keys**: Enforced referential integrity
- **MVCC**: Readers don't block writers (consistent read snapshots)
- **Crash recovery**: Redo log ensures durability after crash

```sql
-- Check engine
SHOW TABLE STATUS LIKE 'orders';   -- Engine column shows InnoDB
SHOW ENGINE INNODB STATUS;         -- Internal state, deadlock info

-- InnoDB buffer pool (most important tuning parameter)
-- Set to 70-80% of available RAM
SET GLOBAL innodb_buffer_pool_size = 4*1024*1024*1024;  -- 4GB

-- Check buffer pool hit rate (should be > 99%)
SHOW STATUS LIKE 'Innodb_buffer_pool_read%';
```

## Indexing Strategy

```sql
-- Composite index: leftmost prefix rule
CREATE INDEX idx_user_status_date ON orders(user_id, status, created_at);

-- Supports these WHERE clauses:
-- WHERE user_id = ?
-- WHERE user_id = ? AND status = ?
-- WHERE user_id = ? AND status = ? AND created_at > ?

-- Does NOT efficiently support:
-- WHERE status = ?                  (missing user_id prefix)
-- WHERE user_id = ? AND created_at > ?  (missing status in middle)

-- Index selectivity: high cardinality = better index candidate
SELECT COUNT(DISTINCT status)/COUNT(*) FROM orders;    -- low (bad index candidate)
SELECT COUNT(DISTINCT user_id)/COUNT(*) FROM orders;   -- high (good index candidate)

-- Covering index for frequent queries
CREATE INDEX idx_list ON orders(user_id, status, amount, created_at);
-- Avoids accessing table data entirely for:
SELECT amount, created_at FROM orders WHERE user_id=1 AND status='paid';
```

## Locking and Deadlocks

```sql
-- Row locks (InnoDB default)
SELECT * FROM accounts WHERE id = 1 FOR UPDATE;  -- Exclusive lock
SELECT * FROM accounts WHERE id = 1 LOCK IN SHARE MODE;  -- Shared lock

-- Deadlock detection (automatic): MySQL auto-rolls back smaller transaction
-- Investigate deadlocks
SHOW ENGINE INNODB STATUS;   -- Look for LATEST DETECTED DEADLOCK section

-- Prevent deadlocks:
-- 1. Always access tables/rows in same order across transactions
-- 2. Keep transactions short
-- 3. Use SELECT ... FOR UPDATE only when needed
-- 4. Add indexes (avoid gap locks from range scans)
```

## JSON Data Type (MySQL 5.7+)

```sql
CREATE TABLE events (
    id INT PRIMARY KEY,
    data JSON
);

INSERT INTO events VALUES (1, '{"type":"click","user":123,"page":"/home"}');

-- Query JSON
SELECT data->>'$.type' FROM events WHERE id = 1;         -- "click"
SELECT data->'$.user' FROM events;                        -- 123 (integer)
SELECT * FROM events WHERE data->>'$.type' = 'click';

-- Index virtual column from JSON
ALTER TABLE events ADD COLUMN event_type VARCHAR(50)
    GENERATED ALWAYS AS (data->>'$.type') STORED;
CREATE INDEX idx_event_type ON events(event_type);
```

## Revision Notes
```
INNODB: row-level locking, MVCC, ACID, crash recovery
Buffer pool: 70-80% RAM. Hit rate > 99% = good.

COMPOSITE INDEX RULE: leftmost prefix must be present in WHERE clause
Cardinality: high cardinality cols make better index candidates
Covering index: all SELECT cols in index = index-only scan

DEADLOCK: MySQL auto-detects and rolls back. Check INNODB STATUS.
Prevention: consistent lock order, short transactions, add indexes

JSON: data->>'$.field' extracts as string, ->'$.field' as JSON
Index JSON fields via GENERATED ALWAYS AS virtual columns
```
