# SQL — Interview Questions

**What is the difference between WHERE and HAVING?**
WHERE filters rows BEFORE grouping (cannot use aggregate functions). HAVING filters groups AFTER the GROUP BY aggregation (can use aggregate functions). Example: `SELECT department, COUNT(*) FROM employees WHERE salary > 50000 GROUP BY department HAVING COUNT(*) > 5` — WHERE removes employees with salary ≤ 50000 first, then groups, then HAVING removes departments with 5 or fewer remaining employees.

**Explain the difference between INNER JOIN, LEFT JOIN, RIGHT JOIN, and FULL OUTER JOIN.**
INNER JOIN: returns only rows where the join condition matches in BOTH tables. LEFT JOIN: returns all rows from the left table, plus matching rows from right (NULL for non-matches). RIGHT JOIN: same as LEFT but from the right table perspective. FULL OUTER JOIN: returns all rows from both tables — NULLs where no match on either side. Most common in practice: INNER JOIN and LEFT JOIN. Rule: use LEFT JOIN when you want all records from one table regardless of whether related records exist in the other.

**What are window functions and when do you use them?**
Window functions perform calculations across a set of rows related to the current row, without collapsing rows like GROUP BY does. Syntax: `FUNCTION() OVER (PARTITION BY col ORDER BY col ROWS BETWEEN ...)`. Common uses: `ROW_NUMBER()` — unique rank per partition; `RANK()` / `DENSE_RANK()` — ranking with ties; `LAG(col, n)` / `LEAD(col, n)` — access previous/next row value; `SUM/AVG/COUNT` for running totals or moving averages. Example: "Show each sale alongside the running total for that salesperson" — `SUM(amount) OVER (PARTITION BY salesperson_id ORDER BY date)`.

**What is the difference between UNION and UNION ALL?**
UNION: combines result sets of two queries and removes duplicate rows (does an implicit DISTINCT). UNION ALL: combines result sets including all duplicates — faster because it doesn't need to check for duplicates. Rule: use UNION ALL unless you specifically need deduplication, because it's significantly faster for large datasets. Both require the same number of columns and compatible data types in corresponding positions.

**How do indexes improve query performance? What are the downsides?**
An index is a separate data structure (usually B+ tree) that stores values of a column(s) with pointers to the full rows, sorted for fast lookup. Without index: `SELECT * FROM orders WHERE user_id = 5` does a sequential scan — reads every row (O(n)). With index on user_id: B+ tree traversal finds matching rows in O(log n). Downsides: (1) Storage space — indexes take disk space, sometimes as much as the table itself. (2) Write overhead — INSERT/UPDATE/DELETE must also update all indexes on the table. (3) Query planner may ignore index if statistics are stale or selectivity is too low. Rule: index foreign keys, frequently-searched columns, and columns in ORDER BY. Avoid indexing low-cardinality columns (boolean, status with 2-3 values).

**What is a CTE and when is it better than a subquery?**
CTE (Common Table Expression) defined with the `WITH` keyword creates a named temporary result set reusable within the query. Better than subqueries when: (1) Same subquery result is needed multiple times — CTE calculates once. (2) Query readability — complex logic becomes named, understandable steps. (3) Recursive queries — CTEs support recursion (`WITH RECURSIVE`) for hierarchical data (org charts, bill of materials). Subqueries are fine for simple, one-off filters. Note: in most databases, CTEs are not a performance optimization — the database may execute them multiple times anyway (PostgreSQL) or inline them (SQL Server). Use CTEs for readability, not as a caching mechanism.
