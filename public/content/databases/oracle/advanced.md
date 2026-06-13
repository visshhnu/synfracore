# Oracle Database — Advanced

## Partitioning

```sql
-- Range partitioning (by date — most common for time-series data)
CREATE TABLE sales (
    sale_id    NUMBER,
    sale_date  DATE,
    amount     NUMBER,
    region     VARCHAR2(20)
)
PARTITION BY RANGE (sale_date) (
    PARTITION p_2023_q1 VALUES LESS THAN (DATE '2023-04-01'),
    PARTITION p_2023_q2 VALUES LESS THAN (DATE '2023-07-01'),
    PARTITION p_2023_q3 VALUES LESS THAN (DATE '2023-10-01'),
    PARTITION p_2023_q4 VALUES LESS THAN (DATE '2024-01-01'),
    PARTITION p_2024_q1 VALUES LESS THAN (DATE '2024-04-01'),
    PARTITION p_future   VALUES LESS THAN (MAXVALUE)
);

-- Query using partition pruning (Oracle only reads relevant partition)
SELECT * FROM sales
WHERE sale_date >= DATE '2023-07-01' AND sale_date < DATE '2023-10-01';
-- EXPLAIN PLAN shows: PARTITION RANGE SINGLE

-- Add new partition
ALTER TABLE sales ADD PARTITION p_2024_q2
VALUES LESS THAN (DATE '2024-07-01');

-- List partitioning
CREATE TABLE orders (order_id NUMBER, region VARCHAR2(20), amount NUMBER)
PARTITION BY LIST (region) (
    PARTITION p_north VALUES ('NORTH', 'NORTHEAST'),
    PARTITION p_south VALUES ('SOUTH', 'SOUTHEAST'),
    PARTITION p_west  VALUES ('WEST', 'NORTHWEST'),
    PARTITION p_other VALUES (DEFAULT)
);
```

## Oracle-Specific Features

```sql
-- Analytic Functions (similar to window functions in PostgreSQL)
SELECT
    employee_id,
    first_name,
    salary,
    department_id,
    RANK()       OVER (PARTITION BY department_id ORDER BY salary DESC) AS dept_rank,
    DENSE_RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) AS dense_rank,
    ROW_NUMBER() OVER (PARTITION BY department_id ORDER BY salary DESC) AS row_num,
    LAG(salary, 1, 0) OVER (PARTITION BY department_id ORDER BY hire_date) AS prev_sal,
    SUM(salary) OVER (PARTITION BY department_id) AS dept_total,
    RATIO_TO_REPORT(salary) OVER (PARTITION BY department_id) AS pct_of_dept
FROM employees;

-- CONNECT BY (hierarchical queries — Oracle-specific)
-- Find all employees under manager with id 100
SELECT LEVEL, LPAD(' ', 2*(LEVEL-1)) || first_name AS emp_tree,
       employee_id, manager_id
FROM employees
START WITH manager_id IS NULL          -- Root: top-level manager
CONNECT BY PRIOR employee_id = manager_id  -- Parent → Child
ORDER SIBLINGS BY first_name;

-- MODEL clause (spreadsheet calculations in SQL)
SELECT year, product, sales
FROM sales_data
MODEL DIMENSION BY (year, product)
MEASURES (sales)
RULES (
    sales[2025, 'A'] = sales[2024, 'A'] * 1.10,  -- 10% growth
    sales[2025, 'B'] = sales[2024, 'B'] * 1.15
);
```

## Performance Tuning

```sql
-- EXPLAIN PLAN
EXPLAIN PLAN FOR
SELECT e.first_name, d.department_name
FROM employees e JOIN departments d ON e.department_id = d.department_id
WHERE e.salary > 10000;

SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY(FORMAT => 'ALLSTATS LAST'));

-- Hints (guide optimizer)
SELECT /*+ INDEX(e emp_dept_idx) */
       first_name, salary
FROM employees e
WHERE department_id = 10;

-- Common hints:
-- /*+ FULL(table) */          Force full table scan
-- /*+ INDEX(table index) */   Force index use
-- /*+ USE_NL(t1 t2) */        Nested loop join
-- /*+ USE_HASH(t1 t2) */      Hash join
-- /*+ PARALLEL(table, 4) */   Use 4 parallel query processes

-- Gather fresh statistics
EXEC DBMS_STATS.GATHER_TABLE_STATS('SCHEMA_NAME', 'EMPLOYEES');
EXEC DBMS_STATS.GATHER_SCHEMA_STATS('SCHEMA_NAME');
```
