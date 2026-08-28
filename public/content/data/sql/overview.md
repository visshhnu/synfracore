# SQL Overview

**Before you start:** no prior database experience is required — the concept of a table (rows and columns, like a spreadsheet) is the only assumption.

## What is SQL?

SQL (Structured Query Language) is the standard language for managing and querying relational databases. It is used in MySQL, PostgreSQL, SQLite, SQL Server, Oracle, and BigQuery — making it the most widely used data language in the world.

## Why This Exists (The Hook)

A spreadsheet works fine until two people need to update the same data at once, or the dataset grows past a few hundred thousand rows, or you need to guarantee that a bank transfer either fully completes or doesn't happen at all — never half. SQL and relational databases exist to solve exactly those problems: many people can query and update the same data concurrently, at a scale spreadsheets can't handle, with guarantees (transactions) that a multi-step operation either fully succeeds or fully rolls back.

**Analogy** — Think of a relational database like a well-organized filing cabinet system, not a single giant folder. Instead of dumping every fact into one massive sheet (a customer's name repeated on every one of their orders), a relational database keeps a `customers` table and a separate `orders` table, linked by a `customer_id` — like keeping one master client file and a separate folder of transaction slips that reference the client by ID, rather than rewriting the client's full address on every single slip. A `JOIN` is what temporarily pulls the linked folders together when you actually need to see both at once.

**Try it (2 minutes)** — Reason through why `WHERE` and `HAVING` are both "filter" clauses but can't be swapped for each other, without looking anything up: `WHERE` filters individual rows before grouping happens; `HAVING` filters entire groups after `GROUP BY` has already aggregated them. If you wanted "only departments with more than 5 employees" (a fact about a whole group, not about any single employee row), why would `WHERE COUNT(*) > 5` fail, while `HAVING COUNT(*) > 5` works?

## Core SQL Categories

```conceptgrid
{
  "boxes": [
    { "title": "DDL", "description": "Data Definition -- CREATE, ALTER, DROP: defines table structure", "color": "blue" },
    { "title": "DML", "description": "Data Manipulation -- INSERT, UPDATE, DELETE: changes the data", "color": "purple" },
    { "title": "DQL", "description": "Data Query -- SELECT: retrieves data", "color": "green" },
    { "title": "DCL / TCL", "description": "Permissions (GRANT/REVOKE) and transactions (COMMIT/ROLLBACK)", "color": "amber" }
  ]
}
```

```
DDL (Data Definition Language): structure
  CREATE TABLE users (id INT PRIMARY KEY, name VARCHAR(100));
  ALTER TABLE users ADD COLUMN email VARCHAR(255);
  DROP TABLE users;
  TRUNCATE TABLE users;  -- delete all rows, keep structure

DML (Data Manipulation Language): data
  INSERT INTO users (name, email) VALUES ('Alice', 'alice@example.com');
  UPDATE users SET email = 'new@example.com' WHERE id = 1;
  DELETE FROM users WHERE id = 1;

DQL (Data Query Language): retrieve
  SELECT name, email FROM users WHERE active = 1 ORDER BY name;

DCL (Data Control Language): permissions
  GRANT SELECT ON users TO analyst_role;
  REVOKE INSERT ON users FROM intern_role;

TCL (Transaction Control Language): transactions
  BEGIN; UPDATE accounts SET balance = balance - 100 WHERE id = 1;
  UPDATE accounts SET balance = balance + 100 WHERE id = 2; COMMIT;
  ROLLBACK;  -- undo if error
```

## Essential Query Patterns

```sql
-- Joins
SELECT u.name, o.total
FROM users u
INNER JOIN orders o ON u.id = o.user_id  -- only matching rows
LEFT JOIN orders o ON u.id = o.user_id   -- all users, NULL if no order
WHERE o.created_at >= '2025-01-01'
ORDER BY o.total DESC LIMIT 10;

-- Aggregations
SELECT department, COUNT(*) as headcount, AVG(salary) as avg_salary
FROM employees
GROUP BY department
HAVING COUNT(*) > 5  -- filter after grouping (WHERE is before)
ORDER BY avg_salary DESC;

-- Subquery
SELECT name FROM users
WHERE id IN (SELECT user_id FROM orders WHERE total > 1000);

-- CTE (cleaner than subquery)
WITH high_value_customers AS (
  SELECT user_id FROM orders GROUP BY user_id HAVING SUM(total) > 10000
)
SELECT u.name, u.email
FROM users u JOIN high_value_customers hvc ON u.id = hvc.user_id;

-- Window functions
SELECT name, salary,
  RANK() OVER (PARTITION BY department ORDER BY salary DESC) as dept_rank,
  salary - AVG(salary) OVER (PARTITION BY department) as vs_dept_avg
FROM employees;
```

## Study Resources
- **Mode SQL Tutorial** (mode.com/sql-tutorial) — free, interactive, real data
- **SQLZoo** (sqlzoo.net) — browser-based SQL practice
- **PostgreSQL documentation** — best free SQL reference, covers advanced features
- **Leetcode SQL problems** — 200+ SQL interview problems with solutions
