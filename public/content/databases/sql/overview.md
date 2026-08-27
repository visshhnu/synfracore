# SQL — The Language of Data

**Before you start:** no prior programming or database experience is assumed. If you've ever used a spreadsheet, you already have the right mental model to start.

Think of a spreadsheet with one sheet called "Users" (columns: id, name, email) and another called "Orders" (columns: id, user_id, total) — where an order's `user_id` column points back to a row in Users, the same way a spreadsheet formula might reference another sheet. A **relational database** is exactly this idea, formalized: a collection of **tables** (like sheets — each a grid of **rows**, one per record, and **columns**, one per field), where tables can be linked to each other through shared values (a **relation**), and a **query** is simply a request — "find me the rows that match these conditions." SQL (Structured Query Language) is the standard language for writing those requests.

SQL (Structured Query Language) is the universal language for relational databases. Whether you use PostgreSQL, MySQL, SQLite, SQL Server, or BigQuery — SQL is the same core language. It's the most important skill for any backend engineer, data analyst, or DevOps engineer working with data.

## What SQL Does

```
CREATE  — define tables, indexes, constraints
INSERT  — add new rows
SELECT  — query and retrieve data
UPDATE  — modify existing rows
DELETE  — remove rows
JOIN    — combine data from multiple tables
GROUP BY — aggregate and summarize data
```

## Your First Queries

Every table needs a way to uniquely identify each row — a **primary key** (below, `id`) is the column guaranteed never to repeat, so any other table can reference a specific row unambiguously (that's exactly what Orders' `user_id` does — it's a **foreign key**, a column that points to another table's primary key).

```sql
-- Create a table (PostgreSQL — BIGSERIAL and TIMESTAMPTZ are PostgreSQL-
-- specific types; see the Fundamentals tab for the MySQL/SQL Server
-- equivalents of auto-incrementing IDs)
CREATE TABLE users (
    id         BIGSERIAL PRIMARY KEY,
    email      TEXT UNIQUE NOT NULL,
    name       TEXT NOT NULL,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Insert data
INSERT INTO users (email, name) VALUES ('alice@example.com', 'Alice');
INSERT INTO users (email, name) VALUES ('bob@example.com', 'Bob');

-- Query data
SELECT * FROM users;                             -- All columns, all rows
SELECT name, email FROM users;                   -- Specific columns
SELECT * FROM users WHERE name = 'Alice';        -- Filter rows
SELECT * FROM users ORDER BY created_at DESC;    -- Sort
SELECT * FROM users LIMIT 10;                    -- Pagination
SELECT * FROM users WHERE id > 100 LIMIT 10;    -- Keyset pagination (faster)

-- Update
UPDATE users SET name = 'Alice Smith' WHERE id = 1;

-- Delete
DELETE FROM users WHERE id = 1;
```

## The Most Important Query: JOIN

A JOIN combines rows from two tables based on a matching column (like the `user_id` foreign key linking Orders back to Users). Which rows survive depends on which JOIN type you use:

```flow
{
  "title": "JOIN Types — Which Rows Survive",
  "layout": "flow",
  "steps": [
    { "label": "INNER JOIN", "sublabel": "Only rows matching in BOTH tables", "color": "blue" },
    { "label": "LEFT JOIN", "sublabel": "All of the left table, matched or not", "color": "green" },
    { "label": "RIGHT JOIN", "sublabel": "All of the right table, matched or not", "color": "purple" },
    { "label": "FULL OUTER JOIN", "sublabel": "Everything from both, matched or not", "color": "amber" }
  ]
}
```

```sql
-- Tables
-- users: id, name, email
-- orders: id, user_id, total, status, created_at

-- Get all orders with customer name (INNER JOIN)
SELECT u.name, o.total, o.status, o.created_at
FROM orders o
INNER JOIN users u ON o.user_id = u.id
WHERE o.status = 'pending'
ORDER BY o.created_at DESC;

-- All users, even those with no orders (LEFT JOIN)
SELECT u.name, COUNT(o.id) AS order_count, COALESCE(SUM(o.total), 0) AS total_spent
FROM users u
LEFT JOIN orders o ON u.id = o.user_id
GROUP BY u.id, u.name
ORDER BY total_spent DESC;
```

## Aggregation

SQL clauses are *written* in the order `SELECT...FROM...WHERE...GROUP BY...HAVING...ORDER BY`, but the database actually *evaluates* them in a different order — this is why `HAVING` can filter on an aggregate like `COUNT(*)` while `WHERE` can't: `WHERE` runs before grouping even happens.

```flow
{
  "title": "How SQL Actually Executes a Query (not the order you write it in)",
  "layout": "flow",
  "steps": [
    { "label": "FROM / JOIN", "sublabel": "Gather the rows", "color": "blue" },
    { "label": "WHERE", "sublabel": "Filter individual rows", "color": "purple" },
    { "label": "GROUP BY", "sublabel": "Bucket rows together", "color": "green" },
    { "label": "HAVING", "sublabel": "Filter the groups", "color": "amber" },
    { "label": "SELECT / ORDER BY", "sublabel": "Pick columns, sort", "color": "slate" }
  ]
}
```

```sql
-- COUNT, SUM, AVG, MIN, MAX
SELECT
    status,
    COUNT(*)           AS order_count,
    SUM(total)         AS revenue,
    AVG(total)         AS avg_order,
    MIN(created_at)    AS first_order,
    MAX(created_at)    AS last_order
FROM orders
WHERE created_at >= NOW() - INTERVAL '30 days'   -- PostgreSQL; MySQL: NOW() - INTERVAL 30 DAY (no quotes)
GROUP BY status
HAVING COUNT(*) > 5        -- Filter groups (not rows)
ORDER BY revenue DESC;
```

## Why SQL Still Matters

| Use Case | SQL Tool |
|---|---|
| Application database | PostgreSQL, MySQL |
| Analytics and BI | BigQuery, Redshift, Snowflake |
| Data pipelines | dbt (transforms data with SQL) |
| Log analysis | Athena, ClickHouse |
| Machine learning | SQL in Spark, BigQuery ML |
| Kubernetes | kubectl uses label selectors inspired by SQL |

SQL has existed since 1974 and remains the most important data skill. Master it once, use it everywhere.
