# SQL — Cheatsheet

```sql
-- ── SELECT ───────────────────────────────────────────────
SELECT * FROM t;
SELECT DISTINCT col FROM t;
SELECT col AS alias FROM t;
SELECT COUNT(*), SUM(n), AVG(n), MIN(n), MAX(n) FROM t;
SELECT col, COUNT(*) FROM t GROUP BY col HAVING COUNT(*) > 5;
SELECT * FROM t ORDER BY col DESC NULLS LAST LIMIT 20 OFFSET 40;

-- ── FILTERING ─────────────────────────────────────────────
WHERE col = 'x' AND col2 != 'y'
WHERE col IN ('a','b') / NOT IN (subquery)
WHERE col BETWEEN 1 AND 100
WHERE col IS NULL / IS NOT NULL
WHERE col LIKE 'prefix%' / ILIKE '%substr%'
WHERE col::text ~ 'regex'   -- PostgreSQL regex
COALESCE(col, 'default')    -- NULL replacement

-- ── JOINS ─────────────────────────────────────────────────
INNER JOIN t2 ON t.id = t2.t_id
LEFT  JOIN t2 ON t.id = t2.t_id
RIGHT JOIN t2 ON t.id = t2.t_id
FULL  JOIN t2 ON t.id = t2.t_id
CROSS JOIN t2                        -- Cartesian product

-- ── WINDOW FUNCTIONS ─────────────────────────────────────
ROW_NUMBER() OVER (PARTITION BY col ORDER BY col2)
RANK()       OVER (ORDER BY salary DESC)
DENSE_RANK() OVER (PARTITION BY dept ORDER BY sal DESC)
SUM(n) OVER (PARTITION BY group ORDER BY date ROWS UNBOUNDED PRECEDING)
AVG(n) OVER (ORDER BY date ROWS BETWEEN 2 PRECEDING AND CURRENT ROW)
LAG(col, 1)  OVER (ORDER BY date)  -- Previous row
LEAD(col, 1) OVER (ORDER BY date)  -- Next row
FIRST_VALUE(col) OVER (...)
LAST_VALUE(col)  OVER (ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)

-- ── CTE ───────────────────────────────────────────────────
WITH cte AS (SELECT ...), cte2 AS (SELECT ... FROM cte)
SELECT * FROM cte2;

-- Recursive
WITH RECURSIVE r AS (
    SELECT id, name, parent_id, 0 AS depth FROM t WHERE parent_id IS NULL
    UNION ALL
    SELECT t.id, t.name, t.parent_id, r.depth + 1
    FROM t JOIN r ON t.parent_id = r.id
    WHERE r.depth < 10
)
SELECT * FROM r;

-- ── MODIFY ────────────────────────────────────────────────
INSERT INTO t (c1, c2) VALUES (v1, v2) RETURNING id;
INSERT INTO t SELECT * FROM other WHERE condition;
INSERT INTO t (c1, c2) VALUES (v1, v2)
    ON CONFLICT (c1) DO UPDATE SET c2 = EXCLUDED.c2;
UPDATE t SET col = val WHERE condition;
UPDATE t SET col = val FROM other WHERE t.id = other.t_id;
DELETE FROM t WHERE condition;
DELETE FROM t USING other WHERE t.id = other.t_id;
TRUNCATE t RESTART IDENTITY CASCADE;

-- ── DDL ───────────────────────────────────────────────────
CREATE TABLE t (
    id BIGSERIAL PRIMARY KEY,
    col TEXT NOT NULL DEFAULT 'val',
    ref_id BIGINT REFERENCES other(id) ON DELETE CASCADE,
    UNIQUE (col1, col2),
    CHECK (price > 0)
);
ALTER TABLE t ADD COLUMN c TEXT;
ALTER TABLE t ALTER COLUMN c SET NOT NULL;
ALTER TABLE t RENAME COLUMN old TO new;
ALTER TABLE t DROP COLUMN c CASCADE;
CREATE INDEX idx ON t(col);
CREATE INDEX CONCURRENTLY idx ON t(col);  -- No lock
DROP TABLE IF EXISTS t CASCADE;

-- ── USEFUL TRICKS ─────────────────────────────────────────
-- Generate series (fill date gaps)
SELECT generate_series('2024-01-01'::date, '2024-12-31', '1 day') AS day;

-- Random sample
SELECT * FROM t ORDER BY RANDOM() LIMIT 100;
-- FASTER for large tables:
SELECT * FROM t WHERE RANDOM() < 0.01;  -- ~1% sample

-- Upsert and return whether it was inserted or updated
INSERT INTO t (id, val) VALUES (1, 'new')
ON CONFLICT (id) DO UPDATE SET val = EXCLUDED.val
RETURNING id, xmax = 0 AS was_inserted;

-- DELETE returning deleted rows
DELETE FROM t WHERE expired_at < NOW() RETURNING *;
```
