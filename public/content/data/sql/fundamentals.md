# SQL Fundamentals

## Basic Queries

\`\`\`sql
-- SELECT: retrieve data
SELECT * FROM customers;                    -- All columns
SELECT name, email FROM customers;          -- Specific columns
SELECT DISTINCT country FROM customers;     -- Unique values

-- WHERE: filter rows
SELECT * FROM orders WHERE status = 'active';
SELECT * FROM products WHERE price > 100;
SELECT * FROM users WHERE created_at >= '2024-01-01';

-- Operators
-- =, !=, <, >, <=, >=
-- LIKE (pattern matching): % = wildcard, _ = single char
SELECT * FROM users WHERE email LIKE '%@gmail.com';
SELECT * FROM products WHERE name LIKE 'App%';

-- IN, NOT IN
SELECT * FROM orders WHERE status IN ('pending', 'processing');
SELECT * FROM products WHERE category_id NOT IN (5, 6);

-- BETWEEN
SELECT * FROM orders WHERE total BETWEEN 100 AND 500;

-- IS NULL / IS NOT NULL
SELECT * FROM users WHERE deleted_at IS NULL;

-- AND, OR, NOT
SELECT * FROM products 
WHERE price > 50 AND category = 'electronics' AND stock > 0;

-- ORDER BY
SELECT * FROM products ORDER BY price DESC;
SELECT * FROM users ORDER BY last_name ASC, first_name ASC;

-- LIMIT / OFFSET (pagination)
SELECT * FROM products ORDER BY created_at DESC LIMIT 20;
SELECT * FROM products ORDER BY created_at DESC LIMIT 20 OFFSET 40;  -- Page 3
\`\`\`

## Aggregate Functions

\`\`\`sql
-- Basic aggregates
SELECT COUNT(*) FROM orders;                    -- Total rows
SELECT COUNT(DISTINCT customer_id) FROM orders; -- Unique customers
SELECT SUM(total) FROM orders;                  -- Total revenue
SELECT AVG(total) FROM orders;                  -- Average order
SELECT MIN(price), MAX(price) FROM products;    -- Min/max

-- GROUP BY: aggregate per group
SELECT 
    category,
    COUNT(*) AS product_count,
    AVG(price) AS avg_price,
    SUM(stock) AS total_stock
FROM products
GROUP BY category
ORDER BY product_count DESC;

-- HAVING: filter on aggregated results (like WHERE but for groups)
SELECT 
    customer_id,
    COUNT(*) AS order_count,
    SUM(total) AS total_spent
FROM orders
GROUP BY customer_id
HAVING total_spent > 1000         -- Only high-value customers
ORDER BY total_spent DESC;
\`\`\`

## JOINs

\`\`\`sql
-- INNER JOIN: only matching rows from both tables
SELECT 
    o.id AS order_id,
    c.name AS customer_name,
    o.total,
    o.created_at
FROM orders o
INNER JOIN customers c ON o.customer_id = c.id;

-- LEFT JOIN: all rows from left table, matching from right
SELECT 
    c.name,
    COUNT(o.id) AS order_count
FROM customers c
LEFT JOIN orders o ON c.id = o.customer_id
GROUP BY c.id, c.name;
-- Customers with 0 orders will show count = 0

-- Multiple JOINs
SELECT 
    o.id,
    c.name AS customer,
    p.name AS product,
    oi.quantity,
    oi.price
FROM orders o
JOIN customers c ON o.customer_id = c.id
JOIN order_items oi ON o.id = oi.order_id
JOIN products p ON oi.product_id = p.id
WHERE o.status = 'completed'
ORDER BY o.created_at DESC;
\`\`\`

## Window Functions (Advanced)

\`\`\`sql
-- ROW_NUMBER: rank rows within partition
SELECT 
    customer_id,
    order_id,
    total,
    ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY total DESC) AS rank_by_total
FROM orders;

-- Running total
SELECT 
    order_date,
    daily_revenue,
    SUM(daily_revenue) OVER (ORDER BY order_date) AS running_total
FROM daily_sales;

-- LAG/LEAD: access previous/next row
SELECT 
    month,
    revenue,
    LAG(revenue) OVER (ORDER BY month) AS prev_month_revenue,
    revenue - LAG(revenue) OVER (ORDER BY month) AS month_over_month_change
FROM monthly_revenue;

-- NTILE: divide into buckets
SELECT 
    customer_id,
    total_spent,
    NTILE(4) OVER (ORDER BY total_spent) AS quartile
FROM customer_spending;
\`\`\`

## CTEs and Subqueries

\`\`\`sql
-- CTE (Common Table Expression) - more readable than subqueries
WITH high_value_customers AS (
    SELECT 
        customer_id,
        SUM(total) AS lifetime_value
    FROM orders
    WHERE status = 'completed'
    GROUP BY customer_id
    HAVING lifetime_value > 5000
),
customer_details AS (
    SELECT c.*, hvc.lifetime_value
    FROM customers c
    JOIN high_value_customers hvc ON c.id = hvc.customer_id
)
SELECT 
    name,
    email,
    lifetime_value,
    country
FROM customer_details
ORDER BY lifetime_value DESC;
\`\`\`

## DDL — Creating Tables

\`\`\`sql
CREATE TABLE users (
    id          SERIAL PRIMARY KEY,
    email       VARCHAR(255) UNIQUE NOT NULL,
    name        VARCHAR(100) NOT NULL,
    role        VARCHAR(50) DEFAULT 'user',
    created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted_at  TIMESTAMP NULL
);

CREATE TABLE orders (
    id          SERIAL PRIMARY KEY,
    customer_id INTEGER NOT NULL REFERENCES users(id),
    status      VARCHAR(50) DEFAULT 'pending',
    total       DECIMAL(10,2) NOT NULL,
    created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Index for performance
CREATE INDEX idx_orders_customer_id ON orders(customer_id);
CREATE INDEX idx_orders_status ON orders(status);
CREATE INDEX idx_users_email ON users(email);
\`\`\`