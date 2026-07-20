# SQL — PYQ (Previously Asked / Practice Questions)

**Framing note:** SQL doesn't have one universal governing exam the way some other technologies do, but **Oracle Database SQL Certified Associate (1Z0-071)** is the most recognized vendor-neutral-in-spirit SQL certification (it's Oracle-branded but tests standard SQL fluency broadly) — ~78 questions, 2 hours, 63% passing, $245 USD, one attempt per purchase (must be scheduled within 6 months), validated against Oracle Database versions through 19c. The Intermediate and Advanced tabs already cover a large, well-chosen set of LeetCode-numbered SQL problems in depth — the questions below deliberately cover different ground (Oracle-specific syntax quirks, engine-portability gaps, and a few problem patterns not already covered elsewhere) rather than repeating what's already there.

---

### 1. (Oracle-specific, 1Z0-071 relevant) Oracle's `ROWNUM` behaves differently from `LIMIT`/`OFFSET` in a way that trips up a lot of people moving from MySQL/PostgreSQL. What's the actual gotcha, and what's the correct pattern for "top N rows by some order" in Oracle?

**Answer:** `ROWNUM` is assigned to rows **before** any `ORDER BY` in the same query is applied — so `SELECT * FROM employees WHERE ROWNUM <= 3 ORDER BY salary DESC` does NOT give you the top 3 salaries; it gives you 3 arbitrary rows (whatever the database happened to fetch first), *then* sorts just those 3. The correct pattern wraps the ordered query in a subquery, so the ordering happens first and `ROWNUM` is applied afterward, in the outer query:
```sql
SELECT * FROM (
    SELECT * FROM employees ORDER BY salary DESC
) WHERE ROWNUM <= 3;
```
This is exactly the kind of Oracle-specific behavior 1Z0-071 tests directly, and it's also a genuine, common bug pattern — worth double-checking any Oracle query using `ROWNUM` for a "top N" pattern to confirm it's wrapped correctly.

---

### 2. (Engine portability) The same CTE-based query returns consistent results every time on PostgreSQL but occasionally returns slightly different numbers on MySQL when run against a table under active concurrent writes. Why, and what should you actually do about it?

**Answer:** PostgreSQL materializes CTEs by default (computed once, treated as a fixed snapshot for the rest of the query); MySQL's CTE handling has historically behaved more like a view, potentially re-evaluating the CTE's underlying query multiple times within a single overall execution — which can pick up different underlying data if concurrent writes are happening during query execution. This is exactly the failure mode covered in the Real World tab. The fix: don't assume CTE materialization behavior is universal across database engines — for reporting queries specifically, either use an explicit transaction isolation level that guarantees a consistent snapshot, or query against a point-in-time extract rather than a live, actively-written table.

---

### 3. (Common technical-screen task) Given a `logins` table with `user_id` and `login_date`, write a query to find users who logged in on 3 or more *consecutive* calendar days at least once.

```sql
WITH numbered AS (
    SELECT
        user_id,
        login_date,
        login_date - (ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY login_date))::int AS grp
    FROM (SELECT DISTINCT user_id, login_date FROM logins) t
)
SELECT DISTINCT user_id
FROM numbered
GROUP BY user_id, grp
HAVING COUNT(*) >= 3;
```
**What's being tested:** the "subtract a row number from a date" trick for finding consecutive-date runs — when dates are truly consecutive, `login_date - row_number` produces the *same* constant value for the whole run (since both increment by exactly 1 together), which lets `GROUP BY` cluster consecutive runs together for a `HAVING COUNT(*) >= 3` check. This is a different, more general technique than the "3 self-joins on sequential IDs" approach shown in the Intermediate tab — this version works directly on dates without needing gapless sequential IDs at all.

---

### 4. (Oracle-specific, 1Z0-071 relevant) What's the difference between Oracle's `NVL()` and standard SQL's `COALESCE()`, and why would you ever choose one over the other?

**Answer:** `NVL(expr1, expr2)` is Oracle-proprietary and only accepts exactly two arguments. `COALESCE(expr1, expr2, ..., exprN)` is standard SQL (works across Oracle, PostgreSQL, SQL Server, MySQL) and accepts any number of arguments, returning the first non-NULL one. Functionally, `NVL(a, b)` and `COALESCE(a, b)` behave identically for the two-argument case — the practical reason to reach for `COALESCE` even on Oracle specifically is portability (if the query might ever run against a non-Oracle database) and the ability to chain more than two fallback values in one expression without nesting `NVL` calls.

---

### 5. (Performance/EXPLAIN reading) An `EXPLAIN` shows a query using an index but the estimated row count is wildly higher than the actual number of matching rows. What does this usually indicate, and why does it matter even though the query is "using an index"?

**Answer:** This usually indicates stale table statistics — the query optimizer's cost estimates (and therefore its choice of execution plan) are based on statistics about data distribution that haven't been refreshed since the table's data changed significantly (a large bulk insert, a major deletion). Even though an index is being used, the optimizer might still be making a *suboptimal* choice elsewhere in the plan (join order, whether to use a different available index) based on outdated row-count assumptions. The fix is running the database's statistics-refresh command (`ANALYZE` in PostgreSQL, `ANALYZE TABLE` in MySQL, `DBMS_STATS.GATHER_TABLE_STATS` in Oracle) — "the query uses an index" and "the query uses the *best* index/plan" are different claims, and stale statistics is exactly the gap between them.

---

### 6. (Common technical-screen task) Write a query to find, for each product category, the single best-selling product by total quantity sold — but if there's a tie for first place within a category, include all tied products.

```sql
WITH ranked AS (
    SELECT
        category,
        product_name,
        SUM(quantity) AS total_qty,
        RANK() OVER (PARTITION BY category ORDER BY SUM(quantity) DESC) AS rnk
    FROM sales
    GROUP BY category, product_name
)
SELECT category, product_name, total_qty
FROM ranked
WHERE rnk = 1;
```
**What's being tested:** choosing `RANK()` specifically (not `ROW_NUMBER()`, which would arbitrarily pick just one of several tied products) — this is exactly the distinction the Intermediate tab draws out between the three ranking functions, applied to a slightly different scenario (aggregated sales totals) than the salary-ranking examples already covered there.

---

### 7. (Oracle-specific, 1Z0-071 relevant) What does Oracle's `MERGE` statement do, and what standard SQL problem does it solve that would otherwise require separate `INSERT` and `UPDATE` statements with error-prone conditional logic?

**Answer:** `MERGE` (also called "upsert" in other database systems — `INSERT ... ON CONFLICT` in PostgreSQL, `INSERT ... ON DUPLICATE KEY UPDATE` in MySQL) performs a conditional insert-or-update in a single atomic statement: if a matching row exists (per a specified join condition), update it; if not, insert a new row. This solves the classic race-condition-prone pattern of "check if a row exists, then decide whether to insert or update" as two separate statements, where a concurrent transaction could insert the same row between your check and your subsequent action — `MERGE` (and its equivalents) handles this atomically at the database level instead.

---

### 8. (Common technical-screen task) A `products` table has a `price` column, and you need to find every product whose price is *not* a round number of dollars (i.e., has a nonzero cents value). Write the query.

```sql
SELECT * FROM products
WHERE price <> ROUND(price, 0);
```
**What's being tested:** a simple but genuinely useful pattern — comparing a value against its own rounded form to detect non-round numbers, applicable well beyond just currency (detecting any column that should hold "clean" values but doesn't). A common mistake is trying to parse the string representation of the number instead of this direct numeric comparison, which is both slower and more fragile across different locale/formatting settings.

---

### 9. (Engine portability, common real gotcha) A query with `GROUP BY dept_id` also selects `employee_name` in the `SELECT` list without an aggregate function or including it in the `GROUP BY`. This runs without error on MySQL but fails with an error on PostgreSQL. Why the difference, and which behavior should you actually rely on?

**Answer:** Standard SQL (and PostgreSQL's strict enforcement of it) requires every non-aggregated column in the `SELECT` list to also appear in the `GROUP BY` clause — selecting `employee_name` without aggregating it or grouping by it is ambiguous, since multiple different employee names could exist within the same `dept_id` group, and the database can't know which one you mean. MySQL, in certain SQL modes, historically allowed this and would silently pick an arbitrary row's value for the ungrouped column — a real, non-obvious source of bugs, since the returned value isn't deterministic or meaningful. You should rely on the PostgreSQL/standard-SQL behavior regardless of which engine you're using: treat this as an error condition to fix (either aggregate the column with something like `MAX()` or `STRING_AGG()`, or add it to the `GROUP BY`), not something to depend on MySQL silently allowing.

---

### 10. (Common technical-screen task) Given an `orders` table, write a query to find the single day with the largest percentage increase in order count compared to the previous day.

```sql
WITH daily_counts AS (
    SELECT
        order_date,
        COUNT(*) AS order_count,
        LAG(COUNT(*)) OVER (ORDER BY order_date) AS prev_count
    FROM orders
    GROUP BY order_date
)
SELECT
    order_date,
    order_count,
    prev_count,
    ROUND((order_count - prev_count) * 100.0 / NULLIF(prev_count, 0), 2) AS pct_increase
FROM daily_counts
WHERE prev_count IS NOT NULL
ORDER BY pct_increase DESC
LIMIT 1;
```
**What's being tested:** combining `LAG()` (for period-over-period comparison) with `NULLIF(prev_count, 0)` to guard against a division-by-zero error on any day where the previous day had zero orders — a real, easy-to-miss edge case in "percentage change" queries that a naive `(order_count - prev_count) / prev_count` would crash on the moment `prev_count` is ever legitimately zero.
