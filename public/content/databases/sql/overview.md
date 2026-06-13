# SQL — The Language of Data

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

```sql
-- Create a table
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
WHERE created_at >= NOW() - INTERVAL '30 days'
GROUP BY status
HAVING COUNT(*) > 5        -- Filter groups (not rows)
ORDER BY revenue DESC;
```

## Why SQL Still Matters in 2025

| Use Case | SQL Tool |
|---|---|
| Application database | PostgreSQL, MySQL |
| Analytics and BI | BigQuery, Redshift, Snowflake |
| Data pipelines | dbt (transforms data with SQL) |
| Log analysis | Athena, ClickHouse |
| Machine learning | SQL in Spark, BigQuery ML |
| Kubernetes | kubectl uses label selectors inspired by SQL |

SQL has existed since 1974 and remains the most important data skill. Master it once, use it everywhere.
