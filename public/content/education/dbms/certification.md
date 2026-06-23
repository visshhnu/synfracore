# Database Management Systems Certification Guide

## Certifications Available

| Cert | Provider | Cost | Format |
|------|----------|------|--------|
| **Oracle SQL Associate (1Z0-071)** | Oracle | $245 | MCQ, 90 min |
| **Microsoft DP-900** | Microsoft | $165 | MCQ |
| **GATE CS** | IIT/IISc | Rs.1,800 | MCQ + NAT, 3 hrs |
| **NPTEL DBMS MOOC** | NPTEL | Free | Proctored exam |

---

## Core Topics

```sql
-- NORMALIZATION
-- 1NF: atomic values, no repeating groups, has a primary key
-- 2NF: 1NF + no partial dependency (every non-key attr depends on whole PK)
-- 3NF: 2NF + no transitive dependency (non-key attr depends only on PK)
-- BCNF: 3NF + every determinant is a candidate key

-- FUNCTIONAL DEPENDENCIES
-- A -> B means A determines B (knowing A tells you B)
-- Candidate key: minimal set of attributes that uniquely identifies a row
-- Super key: any set of attributes that includes a candidate key

-- SQL JOINS
SELECT e.name, d.dept_name, e.salary
FROM employees e
INNER JOIN departments d ON e.dept_id = d.id;       -- only matching rows

SELECT e.name, d.dept_name
FROM employees e
LEFT JOIN departments d ON e.dept_id = d.id;        -- all employees, NULL if no dept

SELECT e.name, d.dept_name
FROM employees e
FULL OUTER JOIN departments d ON e.dept_id = d.id;  -- all from both sides

-- AGGREGATE AND GROUP BY
SELECT dept_id, COUNT(*) AS headcount, AVG(salary) AS avg_sal, MAX(salary) AS max_sal
FROM employees
GROUP BY dept_id
HAVING AVG(salary) > 80000;  -- HAVING filters groups; WHERE filters rows

-- SUBQUERIES
SELECT * FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);  -- scalar subquery

SELECT * FROM employees e
WHERE EXISTS (SELECT 1 FROM departments d WHERE d.id = e.dept_id AND d.active = 1);

-- WINDOW FUNCTIONS
SELECT name, salary,
  RANK() OVER (PARTITION BY dept_id ORDER BY salary DESC) AS dept_rank,
  SUM(salary) OVER (PARTITION BY dept_id) AS dept_total,
  LAG(salary) OVER (ORDER BY hire_date) AS prev_salary
FROM employees;

-- INDEXES
CREATE INDEX idx_emp_dept ON employees(dept_id);         -- B+ tree (default)
CREATE UNIQUE INDEX idx_email ON users(email);
CREATE INDEX idx_name_prefix ON users(name(10));         -- prefix index

EXPLAIN SELECT * FROM employees WHERE dept_id = 5;       -- check index usage
```

---

## ACID and Transactions

```
ACID PROPERTIES:
  Atomicity:    transaction is all-or-nothing (COMMIT or ROLLBACK)
  Consistency:  DB moves from one valid state to another (constraints hold)
  Isolation:    concurrent transactions do not see each other's uncommitted work
  Durability:   committed changes survive failures (written to disk / WAL)

ISOLATION LEVELS (weakest to strongest):
  Read Uncommitted: can read dirty (uncommitted) data — fastest, least safe
  Read Committed:   only reads committed data — PostgreSQL/Oracle default
  Repeatable Read:  same read returns same result within transaction — MySQL default
  Serializable:     transactions appear to execute one at a time — slowest, safest

CONCURRENCY PROBLEMS:
  Dirty read:          read uncommitted data that gets rolled back
  Non-repeatable read: same row gives different value on two reads in same txn
  Phantom read:        same query returns different rows on two reads in same txn
  Lost update:         two transactions overwrite each other's changes

CONCURRENCY CONTROL:
  2PL (Two-Phase Locking): growing phase (acquire locks) + shrinking phase (release)
  MVCC: keep multiple row versions — readers never block writers
  Optimistic locking: detect conflict at commit (version number or timestamp)
```

---

## Study Resources

- **Database System Concepts** (Silberschatz/Korth) — standard university textbook
- **GFG DBMS** (geeksforgeeks.org/dbms) — free, GATE-oriented notes
- **PostgreSQL Tutorial** (postgresqltutorial.com) — hands-on SQL practice
- **NPTEL DBMS MOOC** (nptel.ac.in) — free IIT course with certification exam

## Revision Notes
```
NORMALIZATION: 1NF (atomic, PK) -> 2NF (no partial dep) -> 3NF (no transitive) -> BCNF
ACID: Atomicity (all or nothing) | Consistency (constraints) | Isolation | Durability
JOINS: INNER (matching) | LEFT (all left) | RIGHT (all right) | FULL OUTER (all)
ISOLATION LEVELS: RC (default PG) < RR (default MySQL) < Serializable (safest)

INDEXING: B+ tree (range + equality) | Hash (equality only, no range)
  Clustered: data physically ordered by index (one per table)
  Non-clustered: separate structure with pointers to data rows

GATE FOCUS: normalization (draw FDs), ER diagrams, relational algebra, SQL, ACID
```
