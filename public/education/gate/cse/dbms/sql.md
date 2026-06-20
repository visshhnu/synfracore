# SQL

## Why This Chapter Matters
SQL is heavily tested in GATE — 6-10 marks. Complex SELECT queries with joins, subqueries, GROUP BY, HAVING, and aggregate functions are the main focus.

## Core Concepts

### 1. DDL (Data Definition Language)
CREATE TABLE name (col type constraints, ...)
ALTER TABLE name ADD/DROP/MODIFY column
DROP TABLE name
TRUNCATE TABLE name (deletes all data, keeps structure)

### 2. DML (Data Manipulation Language)
INSERT INTO table (cols) VALUES (vals)
UPDATE table SET col=val WHERE condition
DELETE FROM table WHERE condition
SELECT ... FROM ... WHERE ...

### 3. SELECT Query Structure (MUST know order!)
SELECT [DISTINCT] columns / aggregates
FROM tables / joins
WHERE condition (on rows, BEFORE grouping)
GROUP BY columns
HAVING condition (on groups, AFTER grouping)
ORDER BY columns [ASC/DESC]
LIMIT n

**Execution order:** FROM -> WHERE -> GROUP BY -> HAVING -> SELECT -> ORDER BY -> LIMIT

### 4. Aggregate Functions
COUNT(*), COUNT(col), SUM(col), AVG(col), MIN(col), MAX(col)
Ignores NULLs (except COUNT(*))

### 5. Joins in SQL
INNER JOIN: only matching rows
LEFT JOIN: all from left, NULLs for unmatched right
RIGHT JOIN: all from right, NULLs for unmatched left
FULL OUTER JOIN: all rows from both, NULLs for unmatched

### 6. Subqueries
**Scalar subquery:** Returns single value. Use in SELECT or WHERE.
**Row subquery:** Returns single row. Use with (=, <, >) operators.
**Table subquery:** Returns table. Use with IN, EXISTS, or FROM.

IN vs EXISTS: EXISTS stops at first match (efficient for large tables).

### 7. Views
CREATE VIEW name AS SELECT ...
Virtual table. No data stored. Query executed when view is accessed.

## PYQs
**GATE 2024:** Find students who scored more than the average score in their department.
SELECT s.name FROM Student s, Score sc WHERE s.sid=sc.sid AND sc.marks > (SELECT AVG(s2.marks) FROM Score s2, Student t WHERE s2.sid=t.sid AND t.dept=s.dept)

**GATE 2023:** Find departments with more than 5 students.
SELECT dept FROM Student GROUP BY dept HAVING COUNT(*) > 5

**GATE 2022:** Difference between WHERE and HAVING?
WHERE: filters individual rows BEFORE grouping.
HAVING: filters groups AFTER GROUP BY.
WHERE cannot use aggregate functions; HAVING can.

## Revision Notes
```
SQL EXECUTION ORDER:
FROM -> WHERE -> GROUP BY -> HAVING -> SELECT -> ORDER BY

KEY DISTINCTIONS:
WHERE: row-level filter, before grouping
HAVING: group-level filter, after GROUP BY
DISTINCT: removes duplicate rows in SELECT

JOINS:
INNER: only matches
LEFT: all of left table
RIGHT: all of right table
FULL OUTER: all of both

NULL: any comparison with NULL = NULL (use IS NULL / IS NOT NULL)
COUNT(*): counts all rows including NULLs
COUNT(col): counts non-NULL values
```
