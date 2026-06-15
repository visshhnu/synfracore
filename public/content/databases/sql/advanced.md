# SQL — Advanced

## Hard LeetCode SQL Patterns

These are actual problems from the PDF collection — the patterns here appear repeatedly in real interviews at product companies.

## Pattern 1: Finding Median

```sql
-- LeetCode 571: Find Median Given Frequency of Numbers
-- Numbers table: Number (value), Frequency (how many times it appears)
-- Approach: expand numbers using cumulative frequency, find middle value

SELECT AVG(Number) AS median
FROM (
    SELECT
        Number,
        Frequency,
        SUM(Frequency) OVER (ORDER BY Number) AS cumulative,
        SUM(Frequency) OVER () AS total
    FROM Numbers
) t
WHERE cumulative >= total / 2
  AND cumulative - Frequency < total / 2;

-- Explanation:
-- If total = 12, median position is between rows 6 and 7
-- cumulative >= 6 AND cumulative - freq < 6
-- This selects the row(s) that contain positions 6 or 7
```

## Pattern 2: Market Basket / Product Analysis

```sql
-- LeetCode 1075: Project Employees I
-- Find average experience for each project
SELECT p.project_id,
       ROUND(AVG(e.experience_years), 2) AS average_years
FROM Project p
JOIN Employee e ON p.employee_id = e.employee_id
GROUP BY p.project_id;

-- LeetCode 1069: Product Sales Analysis II
-- Find total quantity sold for each product
SELECT product_id, SUM(quantity) AS total_quantity
FROM Sales
GROUP BY product_id;

-- Only products sold in Spring 2019 (exclusively)
SELECT DISTINCT s.product_id, p.product_name
FROM Sales s
LEFT JOIN Product p ON s.product_id = p.product_id
WHERE s.product_id NOT IN (
    SELECT product_id FROM Sales
    WHERE sale_date NOT BETWEEN '2019-01-01' AND '2019-03-31'
)
GROUP BY s.product_id;

-- Cleaner with HAVING + date filter
SELECT DISTINCT s.product_id, p.product_name
FROM Sales s
LEFT JOIN Product p ON p.product_id = s.product_id
GROUP BY s.product_id
HAVING SUM(sale_date < '2019-01-01') = 0
   AND SUM(sale_date > '2019-03-31') = 0;
```

## Pattern 3: User Activity and Retention

```sql
-- LeetCode 1083: User Activity First Login Date
-- Find first login date for each player
SELECT player_id, MIN(event_date) AS first_login
FROM Activity
GROUP BY player_id;

-- LeetCode 1141: User Activities in Past 30 Days I
SELECT activity_date AS day,
       COUNT(DISTINCT user_id) AS active_users
FROM Activity
WHERE activity_date > DATE_SUB('2019-07-27', INTERVAL 30 DAY)
  AND activity_date <= '2019-07-27'
GROUP BY activity_date;

-- Users who logged in within 90 days (LeetCode 1097)
SELECT login_date,
       COUNT(user_id) AS user_count
FROM (
    SELECT user_id, MIN(activity_date) AS login_date
    FROM Traffic
    WHERE activity = 'login'
    GROUP BY user_id
) t
WHERE login_date >= DATE_ADD('2019-06-30', INTERVAL -90 DAY)
GROUP BY login_date;
```

## Pattern 4: Hierarchy and Tree Queries

```sql
-- LeetCode 608: Tree Node Classification
-- Given a table with id and p_id (parent), classify each node:
-- Root (p_id IS NULL), Leaf (id not in p_ids), Inner (everything else)
SELECT id,
    CASE
        WHEN p_id IS NULL THEN 'Root'
        WHEN id NOT IN (SELECT DISTINCT p_id FROM tree WHERE p_id IS NOT NULL) THEN 'Leaf'
        ELSE 'Inner'
    END AS Type
FROM tree;

-- Finding employees under a manager
-- All direct + indirect reports of a manager
WITH RECURSIVE Hierarchy AS (
    SELECT id, name, managerId
    FROM employees
    WHERE managerId IS NULL  -- start at top

    UNION ALL

    SELECT e.id, e.name, e.managerId
    FROM employees e
    JOIN Hierarchy h ON e.managerId = h.id  -- join to previous level
)
SELECT * FROM Hierarchy;
```

## Pattern 5: Pivot Tables

```sql
-- Convert rows to columns (MySQL doesn't have PIVOT, use CASE)
-- Sales by quarter
SELECT
    product,
    SUM(CASE WHEN quarter = 'Q1' THEN sales ELSE 0 END) AS Q1,
    SUM(CASE WHEN quarter = 'Q2' THEN sales ELSE 0 END) AS Q2,
    SUM(CASE WHEN quarter = 'Q3' THEN sales ELSE 0 END) AS Q3,
    SUM(CASE WHEN quarter = 'Q4' THEN sales ELSE 0 END) AS Q4
FROM sales_data
GROUP BY product;

-- Transpose gender count by department
SELECT department,
    COUNT(CASE WHEN gender = 'M' THEN 1 END) AS male_count,
    COUNT(CASE WHEN gender = 'F' THEN 1 END) AS female_count
FROM employees
GROUP BY department;
```

## Pattern 6: The N-th Highest Pattern

```sql
-- Nth highest salary — three approaches

-- Approach 1: MySQL function with LIMIT OFFSET
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
    SET N = N - 1;
    RETURN (
        SELECT DISTINCT Salary
        FROM Employee
        ORDER BY Salary DESC
        LIMIT 1 OFFSET N
    );
END;

-- Approach 2: Window function (works in all modern DBs)
SELECT DISTINCT salary AS getNthHighestSalary
FROM (
    SELECT salary,
           DENSE_RANK() OVER (ORDER BY salary DESC) AS rnk
    FROM Employee
) ranked
WHERE rnk = N;

-- Approach 3: Correlated subquery
SELECT DISTINCT Salary
FROM Employee e1
WHERE N - 1 = (
    SELECT COUNT(DISTINCT Salary)
    FROM Employee e2
    WHERE e2.Salary > e1.Salary
);
-- "Find salary where exactly N-1 salaries are greater than it"
```

## Pattern 7: Finding Missing / Extra Data

```sql
-- Delete duplicates, keep row with lowest id (LeetCode 196)
DELETE p1 FROM Person p1, Person p2
WHERE p1.Email = p2.Email
  AND p1.Id > p2.Id;

-- Find duplicate emails
SELECT Email FROM Person
GROUP BY Email HAVING COUNT(*) > 1;

-- Customers who never ordered (LeetCode 183)
SELECT Name AS Customers
FROM Customers
WHERE Id NOT IN (SELECT CustomerId FROM Orders);

-- Using LEFT JOIN (often faster)
SELECT c.Name AS Customers
FROM Customers c
LEFT JOIN Orders o ON c.Id = o.CustomerId
WHERE o.Id IS NULL;
```

## Pattern 8: Running Totals and Lag/Lead

```sql
-- LAG: access previous row value
SELECT
    emp_no,
    salary,
    LAG(salary) OVER (PARTITION BY emp_no ORDER BY from_date) AS prev_salary,
    salary - LAG(salary) OVER (PARTITION BY emp_no ORDER BY from_date) AS increase
FROM salaries;

-- LEAD: access next row value
SELECT
    date,
    revenue,
    LEAD(revenue) OVER (ORDER BY date) AS next_day_revenue,
    LEAD(revenue) OVER (ORDER BY date) - revenue AS change
FROM daily_revenue;

-- First and Last value in partition
SELECT
    department,
    employee,
    salary,
    FIRST_VALUE(salary) OVER (PARTITION BY department ORDER BY salary DESC) AS highest_in_dept,
    LAST_VALUE(salary)  OVER (PARTITION BY department ORDER BY salary DESC
                               ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS lowest_in_dept
FROM salaries;
```

## Performance Optimization

```sql
-- Use indexes effectively
-- Index on columns used in WHERE, JOIN ON, ORDER BY, GROUP BY

-- CHECK if index is being used
EXPLAIN SELECT * FROM Employee WHERE DepartmentId = 1;
-- type: 'ref' = index used, 'ALL' = full scan (bad for large tables)

-- Covering index: index contains all columns needed by query
-- No table lookup needed — faster
CREATE INDEX idx_emp_dept_sal ON Employee(DepartmentId, Salary);
-- Now this query uses index only (no table access):
SELECT Salary FROM Employee WHERE DepartmentId = 1;

-- Avoid functions on indexed columns in WHERE — disables index
-- BAD:
WHERE YEAR(created_at) = 2019
-- GOOD:
WHERE created_at >= '2019-01-01' AND created_at < '2020-01-01'

-- Use LIMIT when you only need N rows
SELECT * FROM large_table WHERE status = 'pending'
ORDER BY created_at
LIMIT 100;  -- much faster than returning all rows

-- Avoid SELECT * in production
-- Only select columns you need
SELECT id, name, email FROM users WHERE active = 1;
```

## SQL Interview Problem: Cancellation Rate (Hard)

```sql
-- LeetCode 262: Trips and Users — one of the hardest SQL problems
-- Find cancellation rate per day for unbanned users

SELECT t.Request_at AS Day,
       ROUND(
           SUM(CASE WHEN t.Status != 'completed' THEN 1 ELSE 0 END) /
           COUNT(*),
           2
       ) AS "Cancellation Rate"
FROM Trips t
WHERE t.Client_Id NOT IN (
    SELECT Users_Id FROM Users WHERE Banned = 'Yes'
)
AND t.Driver_Id NOT IN (
    SELECT Users_Id FROM Users WHERE Banned = 'Yes'
)
AND t.Request_at BETWEEN '2013-10-01' AND '2013-10-03'
GROUP BY t.Request_at;

-- Key insight: filter out banned users for BOTH client AND driver
-- Then count cancelled (status != 'completed') / total per day
```

## SQL Interview Problem: Third Highest Salary with CTEs

```sql
-- Find employee with 3rd maximum salary
WITH RankedSalaries AS (
    SELECT Salary,
           DENSE_RANK() OVER (ORDER BY Salary DESC) AS rnk
    FROM Employee
),
ThirdHighest AS (
    SELECT MAX(Salary) AS third_salary
    FROM RankedSalaries
    WHERE rnk = 3
)
SELECT a.* FROM Employees a
JOIN ThirdHighest t ON a.Salary = t.third_salary;

-- Alternative using ROWNUM pattern (Oracle)
WITH TEMP AS (
    SELECT MAX(salary) AS salary
    FROM Employees
    WHERE salary NOT IN (
        SELECT salary FROM Employees
        ORDER BY salary DESC WHERE ROWNUM < 3
    )
)
SELECT a.* FROM Employees a JOIN TEMP b ON a.salary = b.salary;
```
