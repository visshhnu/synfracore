# SQL — Cheatsheet

```sql
-- ── SELECT ───────────────────────────────────────────────
SELECT name, price FROM products;
SELECT DISTINCT category FROM products;
SELECT * FROM products ORDER BY price DESC LIMIT 10;
SELECT name, price, price * 1.18 AS price_with_gst FROM products;

-- ── WHERE ─────────────────────────────────────────────────
WHERE price > 1000 AND category = 'Electronics'
WHERE price BETWEEN 500 AND 5000
WHERE name LIKE '%phone%'         -- Contains
WHERE name LIKE 'Sam%'            -- Starts with
WHERE status IN ('active','pending')
WHERE email IS NOT NULL
WHERE email IS NULL

-- ── AGGREGATE ─────────────────────────────────────────────
SELECT COUNT(*), SUM(total), AVG(total), MIN(total), MAX(total) FROM orders;
SELECT category, COUNT(*) as cnt, SUM(price) as revenue
FROM products GROUP BY category;
SELECT category, COUNT(*) FROM products GROUP BY category HAVING COUNT(*) > 5;

-- ── JOINS ─────────────────────────────────────────────────
-- INNER: only matching rows
SELECT u.name, o.total FROM users u INNER JOIN orders o ON u.id = o.user_id;
-- LEFT: all left rows, NULL for unmatched right
SELECT u.name, o.total FROM users u LEFT JOIN orders o ON u.id = o.user_id;
-- Self join
SELECT a.name AS emp, b.name AS mgr FROM employees a JOIN employees b ON a.manager_id = b.id;

-- ── SUBQUERIES ────────────────────────────────────────────
SELECT * FROM products WHERE price > (SELECT AVG(price) FROM products);
SELECT * FROM users WHERE id IN (SELECT DISTINCT user_id FROM orders WHERE total > 1000);
-- EXISTS
SELECT * FROM users u WHERE EXISTS (SELECT 1 FROM orders o WHERE o.user_id = u.id);

-- ── CTEs (Common Table Expressions) ──────────────────────
WITH high_value_customers AS (
    SELECT user_id, SUM(total) as lifetime_value
    FROM orders GROUP BY user_id HAVING SUM(total) > 50000
)
SELECT u.name, h.lifetime_value FROM users u JOIN high_value_customers h ON u.id = h.user_id;

-- ── WINDOW FUNCTIONS ──────────────────────────────────────
ROW_NUMBER() OVER (PARTITION BY dept ORDER BY salary DESC)
RANK() OVER (ORDER BY score DESC)         -- Gaps in rank (1,2,2,4)
DENSE_RANK() OVER (ORDER BY score DESC)   -- No gaps (1,2,2,3)
SUM(sales) OVER (PARTITION BY region ORDER BY month)  -- Running total
LAG(sales, 1) OVER (ORDER BY month)       -- Previous row
LEAD(sales, 1) OVER (ORDER BY month)      -- Next row
AVG(sales) OVER (ORDER BY month ROWS BETWEEN 6 PRECEDING AND CURRENT ROW)  -- 7-day moving avg

-- ── DDL ───────────────────────────────────────────────────
CREATE TABLE users (
    id   BIGSERIAL PRIMARY KEY,
    email VARCHAR(255) UNIQUE NOT NULL,
    created_at TIMESTAMPTZ DEFAULT NOW()
);
ALTER TABLE users ADD COLUMN phone VARCHAR(20);
DROP TABLE IF EXISTS old_table;
CREATE INDEX idx_users_email ON users(email);

-- ── DML ───────────────────────────────────────────────────
INSERT INTO users (email, name) VALUES ('alice@example.com', 'Alice');
INSERT INTO users (email, name) VALUES ('bob@example.com','Bob'), ('charlie@example.com','Charlie');
UPDATE users SET name = 'Alice Smith' WHERE email = 'alice@example.com';
DELETE FROM users WHERE created_at < NOW() - INTERVAL '1 year';

-- ── UPSERT (PostgreSQL) ───────────────────────────────────
INSERT INTO users (email, name) VALUES ('alice@example.com', 'Alice New')
ON CONFLICT (email) DO UPDATE SET name = EXCLUDED.name, updated_at = NOW();

-- ── EXPLAIN / PERFORMANCE ─────────────────────────────────
EXPLAIN SELECT * FROM orders WHERE user_id = 5;
EXPLAIN ANALYZE SELECT * FROM orders WHERE user_id = 5;
-- Look for: Seq Scan (bad for large tables), Index Scan (good), Rows (estimate accuracy)
```
