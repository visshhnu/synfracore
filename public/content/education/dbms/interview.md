# Database Management Systems (DBMS) Interview Questions

## Core Concepts

**Q: ACID properties — explain each.**

**A — Atomicity**: Transaction is all-or-nothing. If any part fails, entire transaction rolls back. No partial updates.
```sql
BEGIN;
UPDATE accounts SET balance = balance - 100 WHERE id = 1;  -- Debit
UPDATE accounts SET balance = balance + 100 WHERE id = 2;  -- Credit
-- If second UPDATE fails, first is rolled back. No money lost.
COMMIT;
```

**C — Consistency**: Database transitions from one valid state to another valid state. All constraints, rules, and cascades satisfied.

**I — Isolation**: Concurrent transactions don't interfere. Result same as if executed serially. Implemented via locks or MVCC.

**D — Durability**: Committed transactions persist even after power failure. Achieved via write-ahead logging (WAL), fsync to disk.

---

**Q: Normalisation — 1NF, 2NF, 3NF, BCNF.**

**Goal**: Eliminate data redundancy, prevent update anomalies.

**1NF (First Normal Form)**:
- No repeating groups or arrays in columns
- Each column has atomic (indivisible) values
- All rows unique (primary key exists)

**2NF**: 1NF + no partial dependency (every non-key attribute depends on the WHOLE primary key, not part of it). Only relevant for composite keys.

**3NF**: 2NF + no transitive dependency (non-key attribute depends on another non-key attribute).
```
Employee: EmpID, Name, DeptID, DeptName, DeptLocation
Violation: DeptName depends on DeptID (not EmpID) → transitive
Fix: Split → Employee(EmpID, Name, DeptID) + Department(DeptID, DeptName, DeptLocation)
```

**BCNF**: 3NF + every determinant is a candidate key. Stronger than 3NF.

**Denormalisation**: Intentionally add redundancy for performance (fewer JOINs). Analytics/OLAP systems often denormalised (star schema).

---

**Q: Indexes — types and when to use.**

**B-Tree index** (default): Good for equality, range queries, ORDER BY.
```sql
CREATE INDEX idx_email ON users(email);
CREATE INDEX idx_order_date ON orders(user_id, created_at);  -- Composite

-- Covering index: all needed columns in index (no table lookup)
CREATE INDEX idx_cover ON orders(user_id, status, amount);
SELECT user_id, status, amount FROM orders WHERE user_id = 123;  -- Index-only scan
```

**When to add index:**
- Frequently queried columns (WHERE, JOIN, ORDER BY)
- High cardinality columns (email, ID — not boolean)
- Foreign key columns (JOINs benefit greatly)

**When NOT to:**
- Rarely queried columns
- Small tables
- Write-heavy columns (every write must update index)

**EXPLAIN**: Always check execution plan before/after adding index.

---

**Q: Transactions — isolation levels.**

```
READ UNCOMMITTED: can read dirty (uncommitted) data from other transactions
READ COMMITTED:   only reads committed data (default in most DBs)
REPEATABLE READ:  same query returns same results within transaction (default MySQL/InnoDB)
SERIALIZABLE:     complete isolation, transactions appear sequential
```

**Concurrency problems:**
- **Dirty read**: Read uncommitted change that gets rolled back
- **Non-repeatable read**: Same query returns different results (another committed update)
- **Phantom read**: New rows appear in repeated range queries (another committed insert)

**MVCC** (Multi-Version Concurrency Control): Maintain multiple versions of rows. Readers see consistent snapshot without blocking writers.

---

**Q: SQL joins deep dive.**

```sql
-- INNER JOIN: matching rows from both tables
SELECT u.name, o.amount
FROM users u INNER JOIN orders o ON u.id = o.user_id;

-- LEFT JOIN: all from left, matching from right (NULL if no match)
SELECT u.name, COUNT(o.id) as order_count
FROM users u LEFT JOIN orders o ON u.id = o.user_id
GROUP BY u.id, u.name;  -- Includes users with 0 orders

-- SELF JOIN: table joined with itself
SELECT e.name as employee, m.name as manager
FROM employees e LEFT JOIN employees m ON e.manager_id = m.id;

-- CROSS JOIN: cartesian product (every combination)
-- FULL OUTER JOIN: all rows from both, NULL where no match

-- Subquery vs JOIN:
-- Correlated subquery: references outer query (runs once per row - slow)
-- Better: JOIN or IN with subquery
SELECT * FROM orders WHERE user_id IN (
    SELECT id FROM users WHERE country = 'India'
);
-- Even better as JOIN for large datasets
```

## Revision Notes
```
ACID:
Atomicity: all-or-nothing | Consistency: valid state to valid state
Isolation: concurrent txns don't interfere | Durability: committed = permanent (WAL)

NORMALISATION:
1NF: atomic values, no repeating groups
2NF: no partial dependency (non-key → whole PK)
3NF: no transitive dependency (non-key → non-key)
BCNF: every determinant is a candidate key

INDEXES: B-Tree (default, equality+range) | Hash (equality only) | Composite (column order!)
Add for: high-cardinality WHERE/JOIN/ORDER BY columns
Covering index: all needed columns → index-only scan

ISOLATION LEVELS (ascending protection):
READ UNCOMMITTED → READ COMMITTED → REPEATABLE READ → SERIALIZABLE
Problems: dirty read → non-repeatable read → phantom read

MVCC: multiple row versions, readers don't block writers (PostgreSQL, InnoDB)

JOINS: INNER(matching) LEFT(all left) RIGHT(all right) FULL OUTER(all both) CROSS(cartesian)
Self join: employee-manager hierarchy
```
