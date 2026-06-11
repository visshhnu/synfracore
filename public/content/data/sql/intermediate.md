# SQL — Intermediate

## Window Functions

```sql
-- ROW_NUMBER, RANK, DENSE_RANK
SELECT
    employee_id,
    department,
    salary,
    ROW_NUMBER() OVER (PARTITION BY department ORDER BY salary DESC) AS row_num,
    RANK()       OVER (PARTITION BY department ORDER BY salary DESC) AS rank,
    DENSE_RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS dense_rank
FROM employees;
-- RANK skips numbers after ties (1,2,2,4)
-- DENSE_RANK does not skip (1,2,2,3)

-- Running totals and moving averages
SELECT
    order_date,
    daily_revenue,
    SUM(daily_revenue) OVER (ORDER BY order_date) AS cumulative_revenue,
    AVG(daily_revenue) OVER (
        ORDER BY order_date
        ROWS BETWEEN 6 PRECEDING AND CURRENT ROW  -- 7-day moving average
    ) AS moving_avg_7d,
    LAG(daily_revenue, 1) OVER (ORDER BY order_date) AS prev_day,
    daily_revenue - LAG(daily_revenue, 1) OVER (ORDER BY order_date) AS day_over_day
FROM daily_sales;

-- First/Last value in group
SELECT
    user_id,
    event_type,
    event_time,
    FIRST_VALUE(event_type) OVER (
        PARTITION BY user_id ORDER BY event_time
    ) AS first_event,
    LAST_VALUE(event_type) OVER (
        PARTITION BY user_id ORDER BY event_time
        ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
    ) AS last_event
FROM user_events;
```

## CTEs and Recursive Queries

```sql
-- Basic CTE
WITH active_users AS (
    SELECT user_id, email
    FROM users
    WHERE last_login > NOW() - INTERVAL '30 days'
),
user_revenue AS (
    SELECT user_id, SUM(amount) AS total
    FROM orders
    WHERE status = 'completed'
    GROUP BY user_id
)
SELECT u.email, COALESCE(r.total, 0) AS lifetime_revenue
FROM active_users u
LEFT JOIN user_revenue r USING (user_id)
ORDER BY lifetime_revenue DESC;

-- Recursive CTE — tree structures, org charts, paths
WITH RECURSIVE org_chart AS (
    -- Base case: top-level employees (no manager)
    SELECT id, name, manager_id, 1 AS level, ARRAY[name] AS path
    FROM employees
    WHERE manager_id IS NULL

    UNION ALL

    -- Recursive case: employees with managers
    SELECT e.id, e.name, e.manager_id, oc.level + 1, oc.path || e.name
    FROM employees e
    JOIN org_chart oc ON e.manager_id = oc.id
    WHERE oc.level < 10  -- Prevent infinite loops
)
SELECT level, path, name
FROM org_chart
ORDER BY path;
```

## Advanced JOINs

```sql
-- Self-join — employees and their managers
SELECT e.name AS employee, m.name AS manager
FROM employees e
LEFT JOIN employees m ON e.manager_id = m.id;

-- LATERAL join — correlated subquery with FROM
SELECT u.id, u.name, recent_orders.order_count, recent_orders.total
FROM users u
CROSS JOIN LATERAL (
    SELECT COUNT(*) AS order_count, SUM(amount) AS total
    FROM orders o
    WHERE o.user_id = u.id
      AND o.created_at > NOW() - INTERVAL '30 days'
) AS recent_orders
WHERE recent_orders.order_count > 0;

-- EXCEPT and INTERSECT
-- Users who placed orders but never left a review
SELECT user_id FROM orders
EXCEPT
SELECT user_id FROM reviews;

-- Users who both ordered AND reviewed
SELECT user_id FROM orders
INTERSECT
SELECT user_id FROM reviews;
```

## Subqueries

```sql
-- Correlated subquery (runs once per row — can be slow on large tables)
SELECT name, salary
FROM employees e
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
    WHERE department = e.department  -- correlates with outer query
);

-- EXISTS (often faster than IN for large datasets)
SELECT * FROM users u
WHERE EXISTS (
    SELECT 1 FROM orders o
    WHERE o.user_id = u.id
      AND o.total > 1000
);

-- ALL / ANY
SELECT name FROM products
WHERE price > ALL (
    SELECT price FROM products WHERE category = 'budget'
);
```

## Aggregations

```sql
-- FILTER clause (PostgreSQL, SQLite — cleaner than CASE)
SELECT
    COUNT(*) AS total_orders,
    COUNT(*) FILTER (WHERE status = 'completed') AS completed,
    COUNT(*) FILTER (WHERE status = 'refunded') AS refunded,
    SUM(amount) FILTER (WHERE status = 'completed') AS completed_revenue
FROM orders;

-- GROUPING SETS — multiple GROUP BY in one query
SELECT
    COALESCE(region, 'ALL') AS region,
    COALESCE(product, 'ALL') AS product,
    SUM(sales) AS total_sales
FROM sales_data
GROUP BY GROUPING SETS (
    (region, product),  -- by region and product
    (region),           -- by region only
    (product),          -- by product only
    ()                  -- grand total
);

-- ROLLUP — hierarchical totals
SELECT year, quarter, month, SUM(revenue)
FROM sales
GROUP BY ROLLUP (year, quarter, month);
-- Generates: monthly, quarterly, yearly, and grand total rows
```
