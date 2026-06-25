# DBMS Cheatsheet

## SQL Quick Reference

### DDL
```sql
CREATE TABLE t (id INT PRIMARY KEY, name VARCHAR(50), dept_id INT REFERENCES depts(id));
ALTER TABLE t ADD COLUMN email VARCHAR(100);
ALTER TABLE t DROP COLUMN email;
DROP TABLE t;
TRUNCATE TABLE t;  -- Delete all rows, reset auto-increment
```

### DML
```sql
INSERT INTO t (id, name) VALUES (1, 'Alice'), (2, 'Bob');
UPDATE t SET name = 'Charlie' WHERE id = 1;
DELETE FROM t WHERE id = 2;
```

### DQL
```sql
SELECT DISTINCT dept_id, COUNT(*) as cnt
FROM employees
WHERE salary > 50000
GROUP BY dept_id
HAVING cnt > 5
ORDER BY cnt DESC
LIMIT 10 OFFSET 20;
```

### Joins
```sql
INNER JOIN  -- Only matching rows
LEFT JOIN   -- All from left, matching from right (NULL if no match)
RIGHT JOIN  -- All from right, matching from left
FULL JOIN   -- All from both
CROSS JOIN  -- Cartesian product
SELF JOIN   -- Table joined with itself
```

### Subqueries
```sql
-- Correlated subquery
SELECT name FROM employees e
WHERE salary > (SELECT AVG(salary) FROM employees WHERE dept_id = e.dept_id);

-- EXISTS
SELECT name FROM customers c WHERE EXISTS (SELECT 1 FROM orders WHERE customer_id = c.id);

-- IN
SELECT name FROM products WHERE category_id IN (SELECT id FROM categories WHERE name = 'Electronics');
```

### Window Functions
```sql
SELECT name, salary,
  RANK() OVER (PARTITION BY dept_id ORDER BY salary DESC) as rank,
  LAG(salary) OVER (ORDER BY hire_date) as prev_salary,
  SUM(salary) OVER (PARTITION BY dept_id) as dept_total
FROM employees;
```

## Normalization Quick Reference
| Form | Rule |
|------|------|
| 1NF | Atomic values, no repeating groups |
| 2NF | 1NF + no partial dependencies |
| 3NF | 2NF + no transitive dependencies |
| BCNF | Every determinant is a candidate key |

## Index Types
| Type | Use Case |
|------|----------|
| B-tree | Range queries, default |
| Hash | Equality only |
| Full-text | Text search |
| Spatial | Geo queries |
| Composite | Multi-column queries |
| Partial | Filtered subset |

## Transaction Isolation Levels
| Level | Dirty Read | NRR | Phantom |
|-------|-----------|-----|---------|
| READ UNCOMMITTED | Yes | Yes | Yes |
| READ COMMITTED | No | Yes | Yes |
| REPEATABLE READ | No | No | Yes |
| SERIALIZABLE | No | No | No |

## Common Aggregate Functions
```sql
COUNT(*), COUNT(col), COUNT(DISTINCT col)
SUM(col), AVG(col), MIN(col), MAX(col)
GROUP_CONCAT(col SEPARATOR ',')  -- MySQL
STRING_AGG(col, ',')  -- PostgreSQL
```

## Key Constraints
```sql
PRIMARY KEY, UNIQUE, NOT NULL, DEFAULT, CHECK
FOREIGN KEY ... REFERENCES ... ON DELETE CASCADE/SET NULL/RESTRICT
```

## ACID in One Line
- **A**tomicity: all or nothing
- **C**onsistency: valid state to valid state
- **I**solation: transactions don't interfere
- **D**urability: committed = permanent
