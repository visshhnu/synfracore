# SQL — Cheatsheet

## Core SQL Quick Reference

```sql
-- ── BASICS ────────────────────────────────────────────────
SELECT col1, col2 FROM table WHERE condition ORDER BY col ASC/DESC LIMIT n;
SELECT DISTINCT col FROM table;
SELECT col AS alias FROM table;
SELECT COUNT(*), SUM(col), AVG(col), MIN(col), MAX(col) FROM table;

-- ── FILTERING ─────────────────────────────────────────────
WHERE col = 'value'
WHERE col != 'value'
WHERE col IN (1, 2, 3)
WHERE col NOT IN (SELECT ...)
WHERE col BETWEEN 10 AND 100      -- inclusive
WHERE col LIKE '%pattern%'        -- % = any chars, _ = one char
WHERE col IS NULL
WHERE col IS NOT NULL
WHERE cond1 AND cond2
WHERE cond1 OR cond2
WHERE NOT condition

-- ── GROUP BY / HAVING ──────────────────────────────────────
SELECT dept, COUNT(*), AVG(salary)
FROM employees
WHERE salary > 0           -- filter rows BEFORE grouping
GROUP BY dept
HAVING COUNT(*) > 5;       -- filter AFTER grouping (can use aggregates)

-- ── ORDER BY ──────────────────────────────────────────────
ORDER BY salary DESC                 -- highest first
ORDER BY dept ASC, salary DESC       -- multiple columns
ORDER BY 2 DESC                      -- by column position (avoid in production)

-- ── JOINS ─────────────────────────────────────────────────
-- INNER JOIN (most common)
SELECT e.name, d.name
FROM employees e
INNER JOIN departments d ON e.dept_id = d.id;

-- LEFT JOIN (all from left, nulls from right)
SELECT e.name, d.name
FROM employees e
LEFT JOIN departments d ON e.dept_id = d.id;

-- Self join
SELECT e.name AS employee, m.name AS manager
FROM employees e
JOIN employees m ON e.manager_id = m.id;

-- Multiple joins
SELECT e.name, d.name, p.project_name
FROM employees e
JOIN departments d ON e.dept_id = d.id
JOIN projects p ON p.dept_id = d.id;

-- ── SUBQUERIES ────────────────────────────────────────────
-- In WHERE
SELECT * FROM emp WHERE salary > (SELECT AVG(salary) FROM emp);

-- In FROM (derived table)
SELECT dept, avg_sal
FROM (SELECT dept, AVG(salary) AS avg_sal FROM emp GROUP BY dept) t
WHERE avg_sal > 60000;

-- IN / NOT IN
SELECT name FROM customers
WHERE id NOT IN (SELECT DISTINCT customer_id FROM orders);

-- EXISTS / NOT EXISTS
SELECT name FROM customers c
WHERE EXISTS (SELECT 1 FROM orders o WHERE o.customer_id = c.id);

-- ── WINDOW FUNCTIONS ──────────────────────────────────────
-- Ranking
ROW_NUMBER() OVER (PARTITION BY dept ORDER BY salary DESC)
RANK()        OVER (PARTITION BY dept ORDER BY salary DESC)  -- gaps on ties
DENSE_RANK()  OVER (PARTITION BY dept ORDER BY salary DESC)  -- no gaps

-- Running totals
SUM(sales) OVER (PARTITION BY region ORDER BY date)
SUM(sales) OVER (ORDER BY date ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)

-- Moving average
AVG(sales) OVER (ORDER BY date ROWS BETWEEN 6 PRECEDING AND CURRENT ROW)

-- Access adjacent rows
LAG(salary, 1)  OVER (PARTITION BY emp_id ORDER BY date)  -- previous row
LEAD(salary, 1) OVER (PARTITION BY emp_id ORDER BY date)  -- next row

-- First/last value in partition
FIRST_VALUE(salary) OVER (PARTITION BY dept ORDER BY salary DESC)
LAST_VALUE(salary)  OVER (PARTITION BY dept ORDER BY salary DESC
                           ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)

-- Percentile
NTILE(4) OVER (ORDER BY salary)        -- quartile (1-4)
PERCENT_RANK() OVER (ORDER BY salary)  -- 0 to 1

-- ── CTEs ──────────────────────────────────────────────────
WITH cte_name AS (
    SELECT dept, AVG(salary) AS avg_sal FROM employees GROUP BY dept
),
top_departments AS (
    SELECT dept FROM cte_name WHERE avg_sal > 80000
)
SELECT * FROM employees WHERE dept IN (SELECT dept FROM top_departments);

-- Recursive CTE (hierarchy)
WITH RECURSIVE org_chart AS (
    SELECT id, name, manager_id, 0 AS level
    FROM employees WHERE manager_id IS NULL   -- root
    UNION ALL
    SELECT e.id, e.name, e.manager_id, oc.level + 1
    FROM employees e
    JOIN org_chart oc ON e.manager_id = oc.id
)
SELECT * FROM org_chart ORDER BY level;

-- ── DATE FUNCTIONS ────────────────────────────────────────
-- MySQL
NOW()                          -- current datetime
CURDATE()                      -- current date
DATE_ADD(date, INTERVAL n DAY/MONTH/YEAR)
DATE_SUB(date, INTERVAL n DAY/MONTH/YEAR)
DATEDIFF(date1, date2)         -- days between
DATE_FORMAT(date, '%Y-%m-%d')
YEAR(date), MONTH(date), DAY(date)
EXTRACT(YEAR FROM date)

-- PostgreSQL
NOW(), CURRENT_DATE, CURRENT_TIMESTAMP
date + INTERVAL '30 days'
date_trunc('month', date)     -- truncate to month
TO_CHAR(date, 'YYYY-MM-DD')
EXTRACT(YEAR FROM date)
AGE(date1, date2)             -- interval between dates

-- ── STRING FUNCTIONS ──────────────────────────────────────
UPPER(col), LOWER(col)
LENGTH(col)                   -- string length
TRIM(col)                     -- remove whitespace
LTRIM(col), RTRIM(col)
SUBSTRING(col, start, len)    -- extract part
CONCAT(col1, ' ', col2)       -- join strings
REPLACE(col, 'old', 'new')    -- replace substring
COALESCE(col, 'default')      -- first non-null value

-- ── CONDITIONAL ───────────────────────────────────────────
CASE
    WHEN salary > 100000 THEN 'High'
    WHEN salary > 50000  THEN 'Medium'
    ELSE 'Low'
END AS salary_band

COALESCE(dept_name, 'No Department')
NULLIF(value, 0)              -- returns NULL if value = 0

-- ── AGGREGATES WITH CONDITION ─────────────────────────────
-- Count only rows matching condition
COUNT(CASE WHEN status = 'active' THEN 1 END)
SUM(CASE WHEN status = 'cancelled' THEN 1 ELSE 0 END)
AVG(CASE WHEN gender = 'M' THEN salary END)  -- avg salary of males

-- ── USEFUL PATTERNS ───────────────────────────────────────
-- Delete duplicates (keep lowest id)
DELETE p1 FROM person p1, person p2
WHERE p1.email = p2.email AND p1.id > p2.id;

-- Find nth highest value
SELECT DISTINCT salary
FROM employee
ORDER BY salary DESC
LIMIT 1 OFFSET N-1;  -- N=2 → OFFSET 1

-- Customers with no orders
SELECT c.name FROM customers c
LEFT JOIN orders o ON c.id = o.customer_id
WHERE o.id IS NULL;

-- Running count of active users per day
SELECT date,
    COUNT(DISTINCT user_id) OVER (ORDER BY date) AS cumulative_users
FROM signups;

-- Top N per group
SELECT * FROM (
    SELECT *, ROW_NUMBER() OVER (PARTITION BY dept ORDER BY salary DESC) AS rn
    FROM employees
) t WHERE rn <= 3;
```

## LeetCode SQL Key Problems by Difficulty

```
Easy:
  175  Combine Two Tables (LEFT JOIN)
  181  Employees Earning More Than Their Managers (self join)
  182  Duplicate Emails (GROUP BY HAVING)
  183  Customers Who Never Order (LEFT JOIN + IS NULL)
  196  Delete Duplicate Emails (DELETE with self join)
  197  Rising Temperature (self join on dates)

Medium:
  177  Nth Highest Salary (DENSE_RANK or LIMIT OFFSET)
  178  Rank Scores (DENSE_RANK)
  180  Consecutive Numbers (self join ×3 or LAG)
  184  Department Highest Salary (JOIN + subquery)
  534  Game Play Analysis III (SUM window running total)
  570  Managers with 5+ Reports (GROUP BY HAVING)
  608  Tree Node (CASE with subquery)
  613  Shortest Distance in a Line (self join)

Hard:
  185  Department Top 3 Salaries (DENSE_RANK + WHERE rnk<=3)
  262  Trips and Users (cancellation rate, CASE SUM)
  571  Find Median Given Frequency (cumulative freq window)
  601  Human Traffic of Stadium (self join ×3 + UNION)
```
