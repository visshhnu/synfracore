# DBMS Intermediate Concepts

## Advanced Normalization

### Functional Dependencies
A functional dependency X → Y means knowing X determines Y.
- **Armstrong's Axioms**: Reflexivity, augmentation, transitivity.
- **Closure**: Find all attributes determined by a set.

### Denormalization
Sometimes intentional redundancy improves read performance:
- Pre-computed aggregates
- Duplicate columns to avoid joins
- Trade write overhead for read speed

## Query Processing

### Query Execution Pipeline
1. Parser → Parse tree
2. Optimizer → Logical plan
3. Code Generator → Physical plan
4. Executor → Results

### Join Algorithms
- **Nested Loop Join**: O(n*m). Simple but slow for large tables.
- **Sort-Merge Join**: Sort both tables, then merge. Good for sorted data.
- **Hash Join**: Build hash table on smaller table, probe with larger. Fast for large tables.

### Query Optimization
- **Cost-based optimizer**: Estimates I/O and CPU cost of different plans.
- **Statistics**: Row counts, column cardinality, histograms.
- **Index selection**: Optimizer decides which indexes to use.

```sql
-- Use EXPLAIN to see query plan
EXPLAIN SELECT * FROM orders o JOIN customers c ON o.customer_id = c.id;
```

## Advanced Indexing

### Composite Indexes
```sql
CREATE INDEX idx_name_dept ON employees(last_name, dept_id);
-- Useful for: WHERE last_name = 'Smith' AND dept_id = 10
-- Also useful for: WHERE last_name = 'Smith'
-- NOT useful for: WHERE dept_id = 10 (leftmost prefix rule)
```

### Covering Index
An index that includes all columns needed by a query — avoids table lookup.

### Partial Index
```sql
CREATE INDEX idx_active ON users(email) WHERE active = true;
```

## Transactions — Advanced

### Isolation Levels
| Level | Dirty Read | Non-Repeatable Read | Phantom Read |
|-------|-----------|---------------------|--------------|
| READ UNCOMMITTED | Yes | Yes | Yes |
| READ COMMITTED | No | Yes | Yes |
| REPEATABLE READ | No | No | Yes |
| SERIALIZABLE | No | No | No |

### Savepoints
```sql
BEGIN;
INSERT INTO orders VALUES (101, ...);
SAVEPOINT sp1;
INSERT INTO order_items VALUES (101, 'item1', ...);
-- Error occurs
ROLLBACK TO sp1;  -- Only undo after sp1
COMMIT;
```

## Stored Procedures and Triggers
```sql
-- Stored procedure
CREATE PROCEDURE transfer_funds(from_id INT, to_id INT, amount DECIMAL)
BEGIN
  UPDATE accounts SET balance = balance - amount WHERE id = from_id;
  UPDATE accounts SET balance = balance + amount WHERE id = to_id;
END;

-- Trigger
CREATE TRIGGER update_timestamp
BEFORE UPDATE ON orders
FOR EACH ROW
SET NEW.updated_at = NOW();
```

## Views and Materialized Views
```sql
-- Regular view (virtual)
CREATE VIEW high_value_orders AS
SELECT * FROM orders WHERE amount > 1000;

-- Materialized view (stored, refreshed periodically)
CREATE MATERIALIZED VIEW monthly_sales AS
SELECT date_trunc('month', order_date), SUM(amount)
FROM orders GROUP BY 1;
REFRESH MATERIALIZED VIEW monthly_sales;
```

## NoSQL vs Relational

### When to use NoSQL
- Flexible/evolving schema
- Horizontal scalability
- High write throughput
- Semi-structured data (JSON, documents)

### CAP Theorem
A distributed system can guarantee at most 2 of:
- **Consistency**: All nodes see same data
- **Availability**: Every request gets a response
- **Partition Tolerance**: System works despite network splits

RDBMS: CA | MongoDB: CP | Cassandra: AP
