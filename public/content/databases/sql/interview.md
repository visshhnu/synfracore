# SQL — Interview Questions

Real questions from product company interviews, compiled from 5 years of notes and LeetCode SQL practice.

---

## Core Concepts

**What is the difference between WHERE and HAVING?**
WHERE filters individual rows before grouping. HAVING filters groups after GROUP BY aggregation. WHERE cannot use aggregate functions (COUNT, SUM, AVG etc.) but HAVING can. Rule: if you need to filter on an aggregate result, use HAVING. If filtering on raw column values, use WHERE.
```sql
-- WHERE filters before grouping (no aggregates)
SELECT dept, COUNT(*) FROM employees
WHERE salary > 50000          -- filter individual employees first
GROUP BY dept
HAVING COUNT(*) > 5;          -- then filter groups with > 5 employees
```

**Difference between RANK, DENSE_RANK, ROW_NUMBER?**
All three assign numbers to rows within a partition. ROW_NUMBER: always unique (1,2,3,4 — no ties). RANK: ties get same rank, next rank has a gap (1,1,3 — skips 2). DENSE_RANK: ties get same rank, no gaps (1,1,2 — most useful in interviews). In practice: DENSE_RANK is the most used in interview problems for "find Nth highest".

**What is the difference between INNER JOIN, LEFT JOIN, RIGHT JOIN, FULL OUTER JOIN?**
INNER JOIN: rows where join condition matches in both tables only. LEFT JOIN: all rows from left table + matching from right (NULL if no match on right). RIGHT JOIN: all rows from right table + matching from left (NULL if no match on left). FULL OUTER JOIN: all rows from both tables (NULL where no match on either side). Most commonly tested: LEFT JOIN and INNER JOIN.

**What is a correlated subquery?**
A subquery that references the outer query — executes once per row of the outer query (can be slow). Uncorrelated subquery: independent, runs once. Example of correlated: find employees earning more than their department average — the subquery references the current row's department.

**What is a CTE and when do you use it?**
CTE (Common Table Expression) uses the `WITH` keyword to create a named temporary result set. Use when: (1) the same subquery is needed multiple times, (2) you need multiple steps (chain CTEs), (3) readability matters in complex queries. For recursive data (org charts, hierarchies), use `WITH RECURSIVE`. Note: PostgreSQL materializes CTEs (calculated once), MySQL treats them like views (may recalculate).

---

## Window Function Questions

**What is the output of DENSE_RANK vs RANK for scores [90, 85, 85, 80]?**
```
Score | RANK | DENSE_RANK | ROW_NUMBER
90    |  1   |     1      |     1
85    |  2   |     2      |     2
85    |  2   |     2      |     3
80    |  4   |     3      |     4
         ↑ gap           ↑ no gap
```

**How do you calculate a 7-day rolling average?**
```sql
SELECT date, sales,
    AVG(sales) OVER (
        ORDER BY date
        ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
    ) AS rolling_7day_avg
FROM daily_sales;
```

**What is PARTITION BY and how is it different from GROUP BY?**
Both group rows by a column value. GROUP BY collapses rows into one row per group. PARTITION BY in window functions groups rows for calculation purposes but keeps all individual rows in the result. Use GROUP BY for aggregated summaries, PARTITION BY when you need per-group calculations while retaining row-level detail.

---

## Hard Pattern Questions

**How do you find employees who earn more than their manager?**
```sql
-- Self join: employee table joined to itself
SELECT e.Name AS Employee
FROM Employee e
JOIN Employee m ON e.ManagerId = m.Id
WHERE e.Salary > m.Salary;
```

**How do you delete duplicate rows keeping the one with the lowest ID?**
```sql
-- MySQL: multi-table DELETE with self-join
DELETE p1 FROM Person p1, Person p2
WHERE p1.Email = p2.Email AND p1.Id > p2.Id;

-- Standard SQL: using CTE
WITH Duplicates AS (
    SELECT id, ROW_NUMBER() OVER (PARTITION BY email ORDER BY id) AS rn
    FROM Person
)
DELETE FROM Person WHERE id IN (SELECT id FROM Duplicates WHERE rn > 1);
```

**How do you find consecutive repeated values?**
```sql
-- Find numbers appearing 3+ consecutive times
SELECT DISTINCT l1.num AS ConsecutiveNums
FROM Logs l1, Logs l2, Logs l3
WHERE l1.id = l2.id - 1
  AND l2.id = l3.id - 1
  AND l1.num = l2.num
  AND l2.num = l3.num;
-- Key: use sequential IDs to check consecutive rows
-- Only works when IDs are gapless (1,2,3,4...)
```

**Write a query to find each department's top 3 earners.**
```sql
-- DENSE_RANK approach (handles ties correctly)
SELECT Department, Employee, Salary
FROM (
    SELECT
        d.Name AS Department,
        e.Name AS Employee,
        e.Salary,
        DENSE_RANK() OVER (PARTITION BY d.Id ORDER BY e.Salary DESC) AS rnk
    FROM Employee e JOIN Department d ON e.DepartmentId = d.Id
) t
WHERE rnk <= 3;
-- DENSE_RANK handles ties: if two people tie for 2nd, both are included
-- and the person after is 3rd (not 4th)
```

**How do you calculate a cancellation rate in SQL?**
```sql
-- Count cancelled / total — use CASE inside SUM or AVG
SELECT
    date,
    ROUND(
        SUM(CASE WHEN status != 'completed' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS cancellation_rate
FROM trips
GROUP BY date;

-- Alternative: AVG with boolean expression (works in MySQL)
SELECT date,
    ROUND(AVG(status != 'completed'), 2) AS cancellation_rate
FROM trips GROUP BY date;
```

---

## Performance Questions

**How does a database index work and when should you NOT use one?**
B-tree index stores column values sorted with pointers to rows. Query reads the index (O log n) instead of scanning all rows (O n). Don't use indexes on: (1) columns with very low cardinality (boolean, status with 2-3 values) — the optimizer often ignores them anyway, (2) small tables where full scan is faster, (3) columns that are rarely used in WHERE/JOIN/ORDER BY, (4) tables with very heavy INSERT/UPDATE loads — every index slows writes.

**What is the difference between a clustered and non-clustered index?**
Clustered index: determines physical order of data on disk — only one per table (primary key is usually clustered). Non-clustered: separate structure with pointers back to the data rows — multiple allowed per table. In practice: InnoDB (MySQL default) always has a clustered index on the primary key.

**Why is `SELECT *` bad in production?**
(1) Returns unnecessary data — network bandwidth waste, (2) prevents index-only scans (covering indexes), (3) breaks if table schema changes and application assumes column order, (4) harder to read and debug. Always specify only the columns you need.

---

## SQL Syntax Quick-Fire

**How do you get the second highest salary without using LIMIT?**
```sql
SELECT MAX(Salary) FROM Employee
WHERE Salary < (SELECT MAX(Salary) FROM Employee);
```

**What does COALESCE do?**
Returns the first non-NULL value from a list. `COALESCE(a, b, c)` returns `a` if not null, else `b`, else `c`, else NULL.

**Difference between UNION and UNION ALL?**
UNION removes duplicates (slower — does a DISTINCT). UNION ALL keeps all rows including duplicates (faster). Use UNION ALL unless you specifically need deduplication.

**What is a view and when would you use it?**
A named saved query — virtual table. Use for: (1) simplify complex queries used repeatedly, (2) security (expose only certain columns/rows), (3) hide complexity from application layer. Views don't store data (unless materialized views), so they're always up to date but can be slow for complex logic.
