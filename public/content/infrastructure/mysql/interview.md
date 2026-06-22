# MySQL Interview Questions

## Core Concepts

**Q: Explain MySQL storage engines — InnoDB vs MyISAM.**

**InnoDB** (default since MySQL 5.5):
- **ACID transactions**: Full support (BEGIN, COMMIT, ROLLBACK)
- **Row-level locking**: Better concurrency for write-heavy workloads
- **Foreign keys**: Referential integrity enforced
- **Crash recovery**: Redo/undo logs for durability
- **MVCC** (Multi-Version Concurrency Control): Readers don't block writers

**MyISAM** (legacy):
- No transactions, no foreign keys
- Table-level locking (poor concurrency)
- Faster for read-only workloads (SELECT COUNT(*) is instant — stored separately)
- Used in: older apps, MySQL Full-Text Search (before InnoDB supported it)

**Always use InnoDB** for new applications.

---

**Q: MySQL indexing — types and strategies.**

**B-Tree index** (default): Good for equality, range, ORDER BY.
```sql
CREATE INDEX idx_email ON users(email);
CREATE INDEX idx_user_date ON orders(user_id, created_at);  -- Compound

-- Covering index: index contains all queried columns (no table lookup)
CREATE INDEX idx_cover ON users(email, name, age);
SELECT email, name, age FROM users WHERE email = 'alice@example.com';
-- Only reads index, not table rows
```

**EXPLAIN** to diagnose queries:
```sql
EXPLAIN SELECT * FROM orders WHERE user_id = 123 AND status = 'pending';
-- Look for:
-- type: ALL (full scan, bad) → range/ref/eq_ref/const (good)
-- key: which index used | rows: estimated rows scanned
-- Extra: "Using filesort" (sort not using index), "Using index" (covering)
```

**Index guidelines:**
- Index WHERE clause columns (especially high-cardinality ones)
- Compound index order: equality first, then range (col1 = ?, col2 BETWEEN a AND b)
- Don't index every column — writes become slower
- `SHOW INDEX FROM table` — see existing indexes

---

**Q: ACID properties in MySQL.**

**Atomicity**: Transaction completes fully or not at all. No partial updates.
```sql
BEGIN;
UPDATE accounts SET balance = balance - 100 WHERE id = 1;
UPDATE accounts SET balance = balance + 100 WHERE id = 2;
COMMIT;  -- Both succeed or both rolled back
```

**Consistency**: Data satisfies constraints after each transaction (foreign keys, CHECK, NOT NULL).

**Isolation**: Transactions don't interfere with each other.

**Isolation levels:**
| Level | Dirty Read | Non-repeatable Read | Phantom Read |
|---|---|---|---|
| READ UNCOMMITTED | ✓ possible | ✓ | ✓ |
| READ COMMITTED | ✗ prevented | ✓ possible | ✓ |
| REPEATABLE READ (default) | ✗ | ✗ prevented | ✗ (InnoDB) |
| SERIALIZABLE | ✗ | ✗ | ✗ prevented |

**Durability**: Committed transactions survive crashes (redo log, fsync).

---

**Q: MySQL replication — how does it work?**

```
Primary (binlog writes)
  ├── Replica 1 (IO thread reads binlog → relay log → SQL thread applies)
  └── Replica 2
```

**Binary log formats:**
- `STATEMENT`: Logs SQL statements. Smaller, but non-deterministic functions (NOW(), UUID()) can differ.
- `ROW`: Logs actual row changes. Larger but accurate. **Recommended.**
- `MIXED`: Statement by default, row for non-deterministic.

**GTID (Global Transaction ID)**: Unique ID for each transaction across all servers. Makes failover and replica synchronisation easier.

**Semi-synchronous replication**: Primary waits for at least one replica to acknowledge receipt of binlog before committing. Reduces data loss risk (RPO improvement).

---

**Q: Query optimisation tips.**

```sql
-- 1. Use specific columns, not SELECT *
SELECT id, name FROM users WHERE status = 'active';

-- 2. Avoid functions on indexed columns (index not used)
-- Bad:  WHERE YEAR(created_at) = 2024
-- Good: WHERE created_at >= '2024-01-01' AND created_at < '2025-01-01'

-- 3. Use LIMIT for large result sets
SELECT * FROM logs ORDER BY created_at DESC LIMIT 100;

-- 4. Avoid N+1 queries — use JOIN
-- Bad: SELECT user for each order
-- Good: SELECT o.*, u.name FROM orders o JOIN users u ON o.user_id = u.id

-- 5. Connection pooling (avoid new connection per query)
-- Use ProxySQL, MaxScale, or application-level pooling

-- 6. ANALYZE TABLE updates index statistics (helps query planner)
ANALYZE TABLE orders;

-- 7. Partition large tables
ALTER TABLE logs PARTITION BY RANGE (YEAR(created_at)) (
  PARTITION p2022 VALUES LESS THAN (2023),
  PARTITION p2023 VALUES LESS THAN (2024),
  PARTITION p2024 VALUES LESS THAN (2025)
);
```

## Revision Notes
```
INNODB: ACID, row locking, foreign keys, MVCC, crash recovery — always use this
MYISAM: legacy, no transactions, table locking — avoid

INDEXING:
B-Tree: equality, range, ORDER BY | Covering index: all cols in index
EXPLAIN: type=ALL (bad), key=?, rows=? | Extra: "Using filesort" (add index for sort)
Compound: equality first, range last | High cardinality columns

ACID:
Atomicity: all-or-nothing | Consistency: constraints maintained
Isolation: REPEATABLE READ (default) — prevents dirty + non-repeatable reads
Durability: redo log + fsync

ISOLATION LEVELS (ascending protection):
READ UNCOMMITTED → READ COMMITTED → REPEATABLE READ → SERIALIZABLE

REPLICATION: Primary binlog → Replica IO thread → relay log → SQL thread
ROW format recommended | GTID for easier failover
Semi-sync: primary waits for replica acknowledgement

QUERY OPT: specific columns, no functions on indexed cols, LIMIT, JOINs not N+1
ANALYZE TABLE updates statistics | Partitioning for huge tables
```
