# MySQL Certification Guide

## Certifications Available

| Cert | Code | Cost | Format |
|------|------|------|--------|
| **MySQL Database Admin OCA** | 1Z0-908 | $245 | MCQ, 90 min |
| **MySQL Database Admin OCP** | 1Z0-909 | $245 | MCQ, 90 min |
| **MySQL Developer** | 1Z0-910 | $245 | MCQ |

Certification path: OCA (1Z0-908) → OCP (1Z0-909) → OCM (hands-on lab exam).

---

## Core SQL — Key Topics

```sql
-- EXPLAIN — run before deploying any query to production
EXPLAIN SELECT * FROM orders WHERE user_id = 123 AND status = 'paid';
-- type=ALL: full table scan (add index!)  |  type=ref: index used (good)
-- key: which index is used  |  rows: estimated rows scanned

-- INDEXES
CREATE INDEX idx_user_status ON orders(user_id, status);  -- composite
CREATE INDEX idx_created ON orders(created_at DESC);
CREATE FULLTEXT INDEX idx_body ON posts(title, body);
ALTER TABLE orders DROP INDEX idx_old;

-- VIEWS AND STORED PROCEDURES
CREATE OR REPLACE VIEW v_active_orders AS
  SELECT * FROM orders WHERE status != 'cancelled';

DELIMITER $$
CREATE PROCEDURE give_raise(IN emp_id INT, IN pct DECIMAL(5,2))
BEGIN
  UPDATE employees SET salary = salary * (1 + pct/100) WHERE id = emp_id;
  COMMIT;
END $$
DELIMITER ;
CALL give_raise(42, 10.0);

-- TRANSACTIONS
START TRANSACTION;
  UPDATE accounts SET balance = balance - 500 WHERE id = 1;
  UPDATE accounts SET balance = balance + 500 WHERE id = 2;
COMMIT;

-- WINDOW FUNCTIONS (MySQL 8.0+)
SELECT name, salary,
  RANK() OVER (PARTITION BY dept_id ORDER BY salary DESC) AS dept_rank,
  SUM(salary) OVER (PARTITION BY dept_id) AS dept_total,
  LAG(salary) OVER (ORDER BY hire_date) AS prev_salary
FROM employees;

-- JSON (MySQL 5.7+)
SELECT JSON_EXTRACT(meta, '$.color') FROM products;
SELECT * FROM products WHERE JSON_EXTRACT(meta, '$.active') = true;
```

---

## Administration (1Z0-908)

```bash
# Post-install hardening
mysql_secure_installation

# Backup
mysqldump -u root -p --single-transaction mydb > backup.sql
mysql -u root -p mydb < backup.sql   # restore

# Key my.cnf settings
# innodb_buffer_pool_size = 4G    (70-80% of total RAM)
# max_connections = 200
# slow_query_log = 1
# long_query_time = 0.5           (log queries > 500ms)

# User management
CREATE USER 'app'@'%' IDENTIFIED BY 'SecurePass!1';
GRANT SELECT, INSERT, UPDATE, DELETE ON mydb.* TO 'app'@'%';
SHOW GRANTS FOR 'app'@'%';
DROP USER 'app'@'%';

# Replication check
SHOW MASTER STATUS;
SHOW REPLICA STATUS;
```

---

## Study Resources

- **MySQL Tutorial** (mysqltutorial.org) — free comprehensive guide
- **MySQL Docs** (dev.mysql.com/doc) — authoritative reference
- **Planet MySQL** — community blogs and best practices
- **Oracle MySQL Training** (education.oracle.com) — official certification prep

## Revision Notes
```
STORAGE ENGINE: always InnoDB (row-level locks, ACID, FK support, crash recovery)
EXPLAIN: type=ALL (full scan, add index) | type=ref/const (index used, good)
INDEXES: B-tree default | FULLTEXT for text search | prefix for long VARCHAR
  Composite: leftmost-prefix rule — (a,b,c) covers WHERE a=? AND a=? AND b=?

TRANSACTIONS: START TRANSACTION | COMMIT | ROLLBACK | SAVEPOINT name
ISOLATION: REPEATABLE READ (MySQL default) prevents dirty and non-repeatable reads

REPLICATION: ROW-format binlog | GTID for reliable position-independent replication
PERFORMANCE: innodb_buffer_pool_size=70-80% RAM | slow_query_log=1 | EXPLAIN
```
