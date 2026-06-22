# SQL Interview Questions

## Core Concepts

**Q: Explain JOINs — types and when to use each.**

```sql
-- INNER JOIN: only matching rows from both tables
SELECT o.id, u.name FROM orders o
INNER JOIN users u ON o.user_id = u.id;

-- LEFT JOIN: all rows from left, matching from right (NULLs for no match)
SELECT u.name, COUNT(o.id) as order_count FROM users u
LEFT JOIN orders o ON u.id = o.user_id
GROUP BY u.name;  -- Includes users with 0 orders

-- RIGHT JOIN: all from right, matching from left (rarely used, use LEFT instead)
-- FULL OUTER JOIN: all rows from both, NULLs where no match
-- CROSS JOIN: cartesian product (all combinations)
```

---

**Q: Window functions.**

```sql
-- ROW_NUMBER, RANK, DENSE_RANK
SELECT name, salary,
  RANK() OVER (PARTITION BY dept ORDER BY salary DESC) as rank_in_dept,
  SUM(salary) OVER (PARTITION BY dept) as dept_total,
  LAG(salary) OVER (ORDER BY hire_date) as prev_hire_salary
FROM employees;
```

---

**Q: CTEs vs subqueries vs temp tables.**

```sql
-- CTE (WITH): readable, named, can reference multiple times
WITH high_value AS (
    SELECT user_id FROM orders GROUP BY user_id HAVING SUM(amount) > 1000
)
SELECT u.name FROM users u JOIN high_value h ON u.id = h.user_id;

-- Subquery: inline, single-use
-- Temp table: materialised, can index, for complex multi-step queries
```

---

**Q: Indexing strategy.**

```sql
-- Composite index: column order matters. Equality first, range last.
CREATE INDEX idx_orders ON orders(user_id, status, created_at);
-- Supports: WHERE user_id = ? AND status = ?
-- Supports: WHERE user_id = ? AND status = ? AND created_at > ?
-- NOT: WHERE status = ? (missing user_id prefix)

-- Covering index: all queried columns in index (no table lookup)
-- Partial index: index with WHERE condition (smaller, faster)
CREATE INDEX idx_active ON users(email) WHERE active = true;
```

---

**Q: Query optimisation checklist.**

1. `EXPLAIN ANALYZE` — identify full table scans
2. Add indexes on JOIN/WHERE/ORDER BY columns (high cardinality)
3. Avoid functions on indexed columns (`WHERE YEAR(date) = 2024` breaks index)
4. Use specific columns, not `SELECT *`
5. `LIMIT` for large result sets
6. Avoid N+1: use JOIN instead of loop queries
7. Update statistics: `ANALYZE table`
8. Connection pooling (PgBouncer, ProxySQL)

## Revision Notes
```
JOINS: INNER(matching only) LEFT(all left + NULLs) FULL OUTER(all both sides)
WINDOW FUNCTIONS: OVER(PARTITION BY dept ORDER BY salary)
ROW_NUMBER | RANK | DENSE_RANK | SUM/AVG (running) | LAG/LEAD

CTE: WITH clause, readable, reusable in query
INDEX: composite = equality cols first, range last | covering = all cols in index
EXPLAIN: look for Seq Scan -> add index | "Using filesort" -> add ORDER BY index

OPTIMISATION:
No functions on indexed cols | Specific cols not SELECT * | JOINs not N+1
ANALYZE for fresh statistics | Connection pooling for high concurrency
```
