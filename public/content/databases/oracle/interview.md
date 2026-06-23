# Oracle Database Interview Questions

## Core Concepts

**Q: Oracle vs PostgreSQL/MySQL — key differences.**

Oracle Database is an enterprise-grade RDBMS with advanced features for large-scale, mission-critical systems.

| Feature | Oracle | PostgreSQL | MySQL |
|---|---|---|---|
| License | Commercial (expensive) | Open source (free) | Open source (GPLv2) |
| Partitioning | Advanced (range, list, hash, interval) | Good | Limited |
| RAC | Yes (multi-instance shared storage) | No | No |
| PL/SQL | Yes (Oracle's procedural language) | PL/pgSQL (similar) | Stored procedures |
| Flashback | Yes (point-in-time query without restore) | No | No |
| Data Guard | Yes (HA/DR) | Patroni/Repmgr | MHA/Group Replication |
| Cloud | Oracle Cloud, AWS RDS Oracle | RDS PostgreSQL | RDS MySQL |

---

**Q: Oracle architecture.**

```
Oracle Instance = SGA (System Global Area) + Background Processes
  
SGA Components:
  Database Buffer Cache: caches frequently accessed data blocks
  Shared Pool: parsed SQL, PL/SQL code (Library Cache + Data Dictionary)
  Redo Log Buffer: changes before writing to redo logs
  Large Pool, Java Pool, Streams Pool

Background Processes:
  DBWn: Database Writer (writes buffer to datafiles)
  LGWR: Log Writer (writes redo buffer to redo logs)
  CKPT: Checkpoint (updates file headers with checkpoint info)
  SMON: System Monitor (crash recovery)
  PMON: Process Monitor (cleans up failed user processes)
  ARCH: Archiver (copies redo logs for backup/standby)

Storage:
  Datafiles → Tablespaces → Segments → Extents → Data Blocks
  Redo Log Files: circular, always writing, required for recovery
  Control File: database metadata, current log sequence
  Parameter File (spfile): instance configuration
```

---

**Q: PL/SQL — Oracle's procedural extension.**

```sql
-- Basic stored procedure
CREATE OR REPLACE PROCEDURE update_salary(
    p_emp_id   IN NUMBER,
    p_increase IN NUMBER,
    p_message  OUT VARCHAR2
) AS
    v_current_salary NUMBER;
BEGIN
    SELECT salary INTO v_current_salary
    FROM employees WHERE employee_id = p_emp_id;
    
    UPDATE employees
    SET salary = salary * (1 + p_increase/100)
    WHERE employee_id = p_emp_id;
    
    COMMIT;
    p_message := 'Salary updated from ' || v_current_salary;
    
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        p_message := 'Employee not found';
        ROLLBACK;
    WHEN OTHERS THEN
        p_message := 'Error: ' || SQLERRM;
        ROLLBACK;
END;

-- Cursor (iterate result set)
DECLARE
    CURSOR emp_cursor IS
        SELECT employee_id, first_name FROM employees WHERE department_id = 10;
BEGIN
    FOR emp_rec IN emp_cursor LOOP
        DBMS_OUTPUT.PUT_LINE(emp_rec.first_name);
    END LOOP;
END;

-- Trigger
CREATE OR REPLACE TRIGGER log_salary_changes
BEFORE UPDATE OF salary ON employees
FOR EACH ROW
BEGIN
    INSERT INTO salary_audit(emp_id, old_salary, new_salary, change_date)
    VALUES(:OLD.employee_id, :OLD.salary, :NEW.salary, SYSDATE);
END;
```

---

**Q: Oracle performance tuning.**

```sql
-- Explain plan
EXPLAIN PLAN FOR SELECT * FROM orders WHERE customer_id = 123;
SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY);
-- Look for: TABLE ACCESS FULL (bad) → INDEX RANGE SCAN (good)

-- AWR (Automatic Workload Repository): performance snapshots
SELECT * FROM DBA_HIST_TOP_SQL
WHERE snap_id > (SELECT MAX(snap_id)-2 FROM DBA_HIST_SNAPSHOT);

-- Index creation
CREATE INDEX idx_orders_customer ON orders(customer_id);
CREATE INDEX idx_orders_date ON orders(order_date DESC);

-- Partitioning (for large tables)
CREATE TABLE orders_partitioned (
    order_id NUMBER,
    order_date DATE,
    amount NUMBER
)
PARTITION BY RANGE (order_date) (
    PARTITION p_2023 VALUES LESS THAN (DATE '2024-01-01'),
    PARTITION p_2024 VALUES LESS THAN (DATE '2025-01-01'),
    PARTITION p_future VALUES LESS THAN (MAXVALUE)
);
-- Only scans relevant partition → massive performance gain for date-range queries

-- Hints (force specific execution plan)
SELECT /*+ INDEX(o idx_orders_customer) */ * FROM orders o WHERE customer_id = 123;
```

---

**Q: Oracle Data Guard (HA/DR).**

Data Guard maintains a standby database synchronised with primary.

**Types:**
- Physical Standby: block-for-block copy (Redo Apply). Exact duplicate. Can open read-only.
- Logical Standby: SQL Apply. Can have different structure, fully open for queries.

**Protection modes:**
- Maximum Performance: async redo shipping (primary not affected by standby lag)
- Maximum Availability: sync redo, async if standby unavailable
- Maximum Protection: sync redo, primary halts if standby unavailable

**Switchover**: planned role reversal (no data loss).
**Failover**: unplanned (possible data loss in Maximum Performance mode).

## Revision Notes
```
ORACLE: Enterprise RDBMS. Advanced partitioning, RAC, Data Guard, Flashback.
vs PostgreSQL: Oracle=commercial/enterprise | PG=open source, same features cheaper

ARCHITECTURE:
SGA: Buffer Cache + Shared Pool + Redo Log Buffer
Key processes: DBWn (write), LGWR (redo), SMON (crash recovery), PMON (cleanup)
Storage: Datafiles → Tablespaces → Segments → Extents → Blocks

PL/SQL: Oracle procedural language
Stored procedures, functions, triggers, packages, cursors
EXCEPTION: NO_DATA_FOUND | TOO_MANY_ROWS | OTHERS

PERFORMANCE:
EXPLAIN PLAN → look for TABLE ACCESS FULL → add index
AWR: automatic performance snapshots (DBA_HIST_TOP_SQL)
Partitioning: RANGE | LIST | HASH | INTERVAL (only scan relevant partitions)

DATA GUARD:
Physical Standby: block copy | Logical Standby: SQL Apply (open for queries)
Modes: Max Performance (async) | Max Availability (sync if possible) | Max Protection
Switchover (planned, no loss) vs Failover (unplanned, possible loss)
```
