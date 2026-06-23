# Sql Certification Guide

## Certifications Available

| Cert / Course | Provider | Cost |
|---------------|----------|------|
| **DP-900: Azure Data Fundamentals** | Microsoft | $165 |
| **Oracle Database SQL Certified Associate** | Oracle | $245 |
| **Kaggle SQL Course** | Kaggle | Free |
| **Mode Analytics SQL Tutorial** | Mode | Free |

SQL knowledge tested in: data analyst certifications, cloud data platform certs.

---

## Core Skills & Commands

```sql
-- Core SQL for certifications
-- SELECT with filtering
SELECT name, salary FROM employees
WHERE department = 'Engineering' AND salary > 100000
ORDER BY salary DESC LIMIT 10;

-- JOINs
SELECT e.name, d.department_name, e.salary
FROM employees e
LEFT JOIN departments d ON e.dept_id = d.id
WHERE d.location = 'Mumbai';

-- Aggregation
SELECT department, COUNT(*) as headcount, AVG(salary) as avg_sal
FROM employees
GROUP BY department
HAVING AVG(salary) > 80000
ORDER BY avg_sal DESC;

-- Window functions
SELECT name, salary,
  RANK() OVER (PARTITION BY department ORDER BY salary DESC) as rank,
  SUM(salary) OVER (PARTITION BY department) as dept_total,
  LAG(salary) OVER (ORDER BY hire_date) as prev_salary
FROM employees;

-- CTE (Common Table Expression)
WITH top_earners AS (
  SELECT *, RANK() OVER (ORDER BY salary DESC) as rnk FROM employees
)
SELECT * FROM top_earners WHERE rnk <= 10;

-- Subquery
SELECT * FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);
```

---

## Study Resources

- **SQLZoo** (sqlzoo.net) — free interactive SQL practice
- **Mode Analytics SQL Tutorial** (free, business analytics focus)
- **LeetCode SQL problems** — interview-style practice
- **PostgreSQL Tutorial** (postgresqltutorial.com) — comprehensive reference

## Revision Notes

```
SQL KEY CONCEPTS:
  SELECT/FROM/WHERE/GROUP BY/HAVING/ORDER BY/LIMIT
  JOINs: INNER | LEFT | RIGHT | FULL OUTER | SELF | CROSS
  Aggregates: COUNT/SUM/AVG/MIN/MAX + GROUP BY + HAVING
  Window functions: RANK/ROW_NUMBER/LAG/LEAD/SUM OVER (PARTITION BY ORDER BY)
  Subqueries: WHERE col IN (SELECT...) | correlated subqueries
  CTEs: WITH name AS (SELECT...) -- reusable named subquery
  Indexes: speed up WHERE/JOIN/ORDER BY on high-cardinality columns
```
