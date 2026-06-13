# SQL — Intermediate

## Window Functions

```sql
-- Window functions compute across related rows WITHOUT collapsing them

-- Running total per customer
SELECT
    customer_id,
    order_date,
    amount,
    SUM(amount) OVER (
        PARTITION BY customer_id
        ORDER BY order_date
        ROWS UNBOUNDED PRECEDING
    ) AS running_total
FROM orders;

-- Rank products by revenue within each category
SELECT
    category,
    product_name,
    revenue,
    RANK()       OVER (PARTITION BY category ORDER BY revenue DESC) AS rank,
    DENSE_RANK() OVER (PARTITION BY category ORDER BY revenue DESC) AS dense_rank,
    ROW_NUMBER() OVER (PARTITION BY category ORDER BY revenue DESC) AS row_num,
    ROUND(revenue / SUM(revenue) OVER (PARTITION BY category) * 100, 1) AS pct_of_category
FROM product_sales;

-- Month-over-month growth
SELECT
    month,
    revenue,
    LAG(revenue)  OVER (ORDER BY month)                    AS prev_month,
    LEAD(revenue) OVER (ORDER BY month)                    AS next_month,
    ROUND((revenue - LAG(revenue) OVER (ORDER BY month)) /
          NULLIF(LAG(revenue) OVER (ORDER BY month), 0) * 100, 1) AS mom_growth_pct,
    AVG(revenue)  OVER (ORDER BY month ROWS 2 PRECEDING)   AS rolling_3mo_avg
FROM monthly_revenue;

-- Get first and last order per customer
SELECT DISTINCT
    customer_id,
    FIRST_VALUE(order_id)  OVER (PARTITION BY customer_id ORDER BY order_date) AS first_order,
    LAST_VALUE(order_id)   OVER (
        PARTITION BY customer_id ORDER BY order_date
        ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
    ) AS last_order,
    COUNT(*) OVER (PARTITION BY customer_id) AS total_orders
FROM orders;
```

## Advanced CTEs

```sql
-- Recursive CTE — hierarchical data, org charts, trees
WITH RECURSIVE org_tree AS (
    -- Base case: top-level (CEO has no manager)
    SELECT id, name, manager_id, 0 AS depth, name AS path
    FROM employees
    WHERE manager_id IS NULL

    UNION ALL

    -- Recursive: add each person's direct reports
    SELECT e.id, e.name, e.manager_id, t.depth + 1, t.path || ' > ' || e.name
    FROM employees e
    INNER JOIN org_tree t ON e.manager_id = t.id
    WHERE t.depth < 10   -- Prevent infinite loops
)
SELECT depth, path, name
FROM org_tree
ORDER BY path;

-- Date series — fill in missing dates
WITH date_series AS (
    SELECT generate_series(
        '2024-01-01'::date,
        '2024-12-31'::date,
        '1 day'::interval
    )::date AS day
)
SELECT
    d.day,
    COALESCE(SUM(o.total), 0) AS daily_revenue,
    COUNT(o.id) AS order_count
FROM date_series d
LEFT JOIN orders o ON o.created_at::date = d.day
GROUP BY d.day
ORDER BY d.day;
```

## Performance Patterns

```sql
-- Use EXPLAIN ANALYZE to see execution plan
EXPLAIN ANALYZE
SELECT u.name, COUNT(o.id)
FROM users u
LEFT JOIN orders o ON u.id = o.user_id
WHERE u.created_at > NOW() - INTERVAL '30 days'
GROUP BY u.id, u.name;

-- Key things to look for:
-- Seq Scan  → no index used (bad on large tables)
-- Index Scan → using index (good)
-- Hash Join vs Nested Loop → Hash better for large sets
-- cost=0.00..XXX → higher = slower
-- rows=XXX (actual) vs estimated → large diff = stale stats

-- Covering index — all columns in query are in the index
CREATE INDEX idx_orders_covering ON orders(user_id, status)
    INCLUDE (total, created_at);
-- Query below uses index only, no table lookup:
SELECT user_id, status, total, created_at
FROM orders
WHERE user_id = $1 AND status = 'pending';

-- Partial index — only index subset of rows
CREATE INDEX idx_active_sessions ON sessions(user_id)
WHERE expires_at > NOW();
-- Only sessions that are not yet expired — much smaller index

-- Avoid full table scans on filtered queries
-- BAD: function on indexed column prevents index use
WHERE LOWER(email) = 'alice@example.com'
-- GOOD: index on expression
CREATE INDEX idx_email_lower ON users(LOWER(email));
WHERE LOWER(email) = 'alice@example.com'
```
