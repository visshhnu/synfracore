# SQL — Intermediate

## Window Functions

Window functions perform calculations across rows related to the current row without collapsing them — unlike GROUP BY which reduces rows.

```sql
-- Syntax
function_name() OVER (
    PARTITION BY column   -- group rows (like GROUP BY but keeps all rows)
    ORDER BY column       -- ordering within each partition
    ROWS BETWEEN ...      -- frame specification (optional)
)
```

### RANK vs DENSE_RANK vs ROW_NUMBER

```sql
-- Given the Scores table: {3.50, 3.65, 4.00, 4.00, 3.65, 3.85}

-- DENSE_RANK — no gaps in ranking (most common in interviews)
SELECT score,
       DENSE_RANK() OVER (ORDER BY score DESC) AS "Rank"
FROM Scores;
-- Result:
-- 4.00 | 1
-- 4.00 | 1  (tie → same rank)
-- 3.85 | 2  (next rank is 2, not 3 — no gap)
-- 3.65 | 3
-- 3.65 | 3
-- 3.50 | 4

-- RANK — has gaps after ties
SELECT score, RANK() OVER (ORDER BY score DESC) AS rnk FROM Scores;
-- 4.00 | 1
-- 4.00 | 1
-- 3.85 | 3  ← jumps to 3 (gap after two 1st place)

-- ROW_NUMBER — always unique, no ties
SELECT score, ROW_NUMBER() OVER (ORDER BY score DESC) AS rn FROM Scores;
-- 4.00 | 1
-- 4.00 | 2  ← each row gets unique number
-- 3.85 | 3

-- Note for MySQL: 'Rank' is a reserved word — wrap in backticks
-- SELECT score, DENSE_RANK() OVER (...) AS `Rank` FROM Scores;
```

### Running Totals and Cumulative Sums

```sql
-- Cumulative games played per player (LeetCode 534 style)
-- Activity table: player_id, event_date, games_played
SELECT
    t1.player_id,
    t1.event_date,
    SUM(t2.games_played) AS games_played_so_far
FROM Activity t1
JOIN Activity t2
    ON t1.player_id = t2.player_id
   AND t1.event_date >= t2.event_date
GROUP BY t1.player_id, t1.event_date;

-- Cleaner with window function
SELECT
    player_id,
    event_date,
    SUM(games_played) OVER (
        PARTITION BY player_id
        ORDER BY event_date
    ) AS games_played_so_far
FROM Activity;
-- player 1: 5 → 11 (5+6) → 12 (5+6+1) across dates
```

### Finding Nth Highest Value

```sql
-- Nth highest salary (LeetCode 177)
-- Using DENSE_RANK
SELECT DISTINCT salary AS getNthHighestSalary
FROM (
    SELECT salary,
           DENSE_RANK() OVER (ORDER BY salary DESC) AS rnk
    FROM Employee
) t
WHERE rnk = N;

-- Using LIMIT/OFFSET (MySQL)
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
    SET N = N - 1;
    RETURN (
        SELECT DISTINCT Salary
        FROM Employee
        ORDER BY Salary DESC
        LIMIT 1 OFFSET N
    );
END

-- 3rd highest: LIMIT 1 OFFSET 2
-- nth highest: LIMIT 1 OFFSET N-1
```

## JOINs — The Most Important SQL Topic

```sql
-- Tables: Employee (Id, Name, Salary, DepartmentId), Department (Id, Name)

-- INNER JOIN — only matching rows in both tables
SELECT d.Name AS Department, e.Name AS Employee, e.Salary
FROM Employee e
INNER JOIN Department d ON e.DepartmentId = d.Id;

-- LEFT JOIN — all rows from left (Employee), nulls for no match
SELECT e.Name, d.Name AS Dept
FROM Employee e
LEFT JOIN Department d ON e.DepartmentId = d.Id;
-- Employees with no department → Dept will be NULL

-- Department with highest salary employees (LeetCode 184)
SELECT d.Name AS Department, e.Name AS Employee, e.Salary
FROM Employee e
JOIN Department d ON e.DepartmentId = d.Id
WHERE (e.DepartmentId, e.Salary) IN (
    SELECT DepartmentId, MAX(Salary)
    FROM Employee
    GROUP BY DepartmentId
);

-- Same query using window function (cleaner)
SELECT Department, Employee, Salary
FROM (
    SELECT
        d.Name AS Department,
        e.Name AS Employee,
        e.Salary,
        RANK() OVER (PARTITION BY e.DepartmentId ORDER BY e.Salary DESC) AS rnk
    FROM Employee e JOIN Department d ON e.DepartmentId = d.Id
) t
WHERE rnk = 1;
```

## Self Joins

A table joined to itself — used for hierarchical data or comparisons within same table.

```sql
-- Find employees who earn more than their manager (LeetCode 181)
-- Employee table: Id, Name, Salary, ManagerId
SELECT e.Name AS Employee
FROM Employee e
JOIN Employee m ON e.ManagerId = m.Id
WHERE e.Salary > m.Salary;

-- Find managers with at least 5 direct reports (LeetCode 570)
SELECT Name
FROM Employee
WHERE id IN (
    SELECT ManagerId
    FROM Employee
    GROUP BY ManagerId
    HAVING COUNT(DISTINCT Id) >= 5
);

-- Shortest distance between two points on x-axis (LeetCode 613)
-- Self join to compare each pair
SELECT t1.x - t2.x AS shortest
FROM point AS t1
JOIN point AS t2 ON t1.x > t2.x
ORDER BY (t1.x - t2.x) ASC
LIMIT 1;
```

## Subqueries

```sql
-- Correlated subquery: references outer query for each row
-- Employees with salary above department average
SELECT e.Name, e.Salary, e.DepartmentId
FROM Employee e
WHERE e.Salary > (
    SELECT AVG(Salary)
    FROM Employee
    WHERE DepartmentId = e.DepartmentId  -- correlated!
);

-- NOT IN subquery — salespeople who have NO orders to RED company
SELECT name
FROM salesperson
WHERE name NOT IN (
    SELECT DISTINCT salesperson.name
    FROM salesperson, orders, company
    WHERE company.name = 'RED'
      AND salesperson.sales_id = orders.sales_id
      AND orders.com_id = company.com_id
);

-- EXISTS — often faster than IN for large datasets
SELECT name FROM salesperson s
WHERE NOT EXISTS (
    SELECT 1 FROM orders o
    JOIN company c ON o.com_id = c.com_id
    WHERE c.name = 'RED' AND o.sales_id = s.sales_id
);
```

## Aggregations and GROUP BY

```sql
-- Consecutive numbers appearing 3+ times (LeetCode 180)
-- Logs table: id (sequential), num
SELECT DISTINCT l1.num AS ConsecutiveNums
FROM Logs l1, Logs l2, Logs l3
WHERE l1.id = l2.id - 1
  AND l2.id = l3.id - 1
  AND l1.num = l2.num
  AND l2.num = l3.num;

-- Delete duplicate emails, keep lowest id (LeetCode 196)
DELETE p1
FROM Person p1, Person p2
WHERE p1.Email = p2.Email
  AND p1.Id > p2.Id;

-- Count active users per day in last 30 days (LeetCode 1141)
SELECT activity_date AS day,
       COUNT(DISTINCT user_id) AS active_users
FROM Activity
WHERE activity_date > DATE_SUB('2019-07-27', INTERVAL 30 DAY)
  AND activity_date <= '2019-07-27'
GROUP BY activity_date;

-- Average sessions per user (LeetCode 1142)
SELECT ROUND(
    COUNT(DISTINCT session_id) / COUNT(DISTINCT user_id),
    2
) AS average_sessions_per_user
FROM Activity
WHERE activity_date > DATE_ADD('2019-07-27', INTERVAL -30 DAY)
  AND activity_date <= '2019-07-27';
```

## Date Functions

```sql
-- DATE_ADD / DATE_SUB
SELECT DATE_ADD('2019-07-27', INTERVAL -90 DAY);  -- 90 days before
SELECT DATE_SUB('2019-06-30', INTERVAL 30 DAY);   -- 30 days before

-- DATEDIFF
SELECT DATEDIFF('2019-07-27', login_date) <= 90   -- within 90 days

-- DATE_FORMAT
SELECT DATE_FORMAT(order_date, '%Y-%m') AS month   -- '2019-03'

-- EXTRACT
SELECT EXTRACT(YEAR FROM created_at) AS year

-- First login date per user
SELECT user_id, MIN(activity_date) AS login_date
FROM Traffic
WHERE activity = 'login'
GROUP BY user_id;
```

## Common Table Expressions (CTEs)

```sql
-- Trips and cancellation rate (LeetCode 262)
-- Find cancellation rate for unbanned users between two dates
WITH UnbannedTrips AS (
    SELECT t.Request_at,
           t.Status
    FROM Trips t
    JOIN Users client  ON t.Client_Id  = client.Users_Id AND client.Banned = 'No'
    JOIN Users driver  ON t.Driver_Id  = driver.Users_Id AND driver.Banned = 'No'
    WHERE t.Request_at BETWEEN '2013-10-01' AND '2013-10-03'
)
SELECT
    Request_at AS Day,
    ROUND(
        SUM(CASE WHEN Status != 'completed' THEN 1 ELSE 0 END) /
        COUNT(*),
        2
    ) AS "Cancellation Rate"
FROM UnbannedTrips
GROUP BY Request_at;

-- Department top 3 salaries (LeetCode 185 - Hard)
WITH RankedSalaries AS (
    SELECT
        d.Name AS Department,
        e.Name AS Employee,
        e.Salary,
        DENSE_RANK() OVER (
            PARTITION BY e.DepartmentId
            ORDER BY e.Salary DESC
        ) AS rnk
    FROM Employee e
    JOIN Department d ON e.DepartmentId = d.Id
)
SELECT Department, Employee, Salary
FROM RankedSalaries
WHERE rnk <= 3;
```

## Insurance / Policy Queries (Multi-condition)

```sql
-- Find total TIV_2016 for policyholders who:
-- 1. Share TIV_2015 with at least one other policyholder
-- 2. Have unique (LAT, LON) city
SELECT ROUND(SUM(TIV_2016), 2) AS TIV_2016
FROM insurance
WHERE TIV_2015 IN (
    SELECT TIV_2015 FROM insurance
    GROUP BY TIV_2015 HAVING COUNT(*) > 1  -- shared TIV_2015
)
AND (LAT, LON) IN (
    SELECT LAT, LON FROM insurance
    GROUP BY LAT, LON HAVING COUNT(*) = 1  -- unique city
);
```

## Second Degree Follower (Social Graph)

```sql
-- LeetCode 614: Find users who follow at least one person
-- and are followed by at least one person — find their follower count
SELECT followee AS follower, COUNT(DISTINCT follower) AS num
FROM follow
WHERE followee IN (SELECT DISTINCT follower FROM follow)
GROUP BY followee
ORDER BY follower;
```
