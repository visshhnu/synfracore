# SQL — Fundamentals

## Data Types and Table Design

```sql
-- Common types (PostgreSQL)
INTEGER, BIGINT              -- Whole numbers
NUMERIC(10,2)                -- Exact decimal (use for money!)
TEXT, VARCHAR(255)           -- Strings (TEXT is preferred in Postgres)
BOOLEAN                      -- true/false
DATE, TIMESTAMP, TIMESTAMPTZ -- Dates (always use TIMESTAMPTZ in production)
UUID                         -- Use gen_random_uuid() for PKs
JSONB                        -- Structured JSON with indexing

-- Good table design
CREATE TABLE orders (
    id          UUID        DEFAULT gen_random_uuid() PRIMARY KEY,
    user_id     UUID        NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    total       NUMERIC(12,2) NOT NULL CHECK (total >= 0),
    status      TEXT        NOT NULL DEFAULT 'pending'
                            CHECK (status IN ('pending','paid','shipped','delivered','cancelled')),
    metadata    JSONB       DEFAULT '{}',
    created_at  TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at  TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- Index on frequently queried columns
CREATE INDEX idx_orders_user_id   ON orders(user_id);
CREATE INDEX idx_orders_status    ON orders(status) WHERE status = 'pending';
CREATE INDEX idx_orders_created   ON orders(created_at DESC);
```

## Filtering and Sorting

```sql
-- Comparison operators
WHERE price > 100
WHERE status != 'cancelled'
WHERE created_at >= '2024-01-01'
WHERE email ILIKE '%@gmail.com'    -- Case-insensitive LIKE

-- NULL handling
WHERE deleted_at IS NULL           -- Rows not soft-deleted
WHERE metadata IS NOT NULL
COALESCE(phone, 'N/A')             -- Replace NULL with default

-- IN and BETWEEN
WHERE status IN ('pending', 'processing')
WHERE price BETWEEN 10 AND 100
WHERE id IN (SELECT user_id FROM admins)  -- Subquery

-- Pattern matching
WHERE name LIKE 'Ali%'             -- Starts with Ali
WHERE email LIKE '%@example.com'   -- Ends with domain
WHERE description ILIKE '%urgent%' -- Contains, case-insensitive

-- Sorting
ORDER BY created_at DESC           -- Newest first
ORDER BY last_name ASC, first_name ASC  -- Multiple columns
ORDER BY total DESC NULLS LAST     -- NULLs at end
```

## Joins Explained

```sql
-- INNER JOIN — only rows that match in BOTH tables
SELECT o.id, u.name, o.total
FROM orders o
JOIN users u ON o.user_id = u.id;
-- Result: only orders that have a matching user

-- LEFT JOIN — all orders, match user if exists
SELECT o.id, u.name, o.total
FROM orders o
LEFT JOIN users u ON o.user_id = u.id;
-- Result: all orders; user columns NULL if no match

-- Find orders with NO matching user (orphaned data)
SELECT o.id FROM orders o
LEFT JOIN users u ON o.user_id = u.id
WHERE u.id IS NULL;

-- Self join — find employees and their managers
SELECT e.name AS employee, m.name AS manager
FROM employees e
LEFT JOIN employees m ON e.manager_id = m.id;

-- Multiple joins
SELECT o.id, u.name, p.title AS product, oi.quantity, oi.price
FROM orders o
JOIN users u        ON o.user_id = u.id
JOIN order_items oi ON oi.order_id = o.id
JOIN products p     ON oi.product_id = p.id
WHERE o.status = 'paid';
```

## Subqueries and CTEs

```sql
-- Subquery in WHERE
SELECT name, salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

-- Subquery in FROM
SELECT dept, avg_salary
FROM (
    SELECT department AS dept, AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department
) dept_stats
WHERE avg_salary > 80000;

-- CTE — cleaner, reusable, readable
WITH high_value_customers AS (
    SELECT user_id, SUM(total) AS lifetime_value
    FROM orders WHERE status = 'paid'
    GROUP BY user_id
    HAVING SUM(total) > 10000
),
customer_details AS (
    SELECT u.id, u.name, u.email, h.lifetime_value
    FROM users u
    JOIN high_value_customers h ON u.id = h.user_id
)
SELECT * FROM customer_details
ORDER BY lifetime_value DESC;
```
