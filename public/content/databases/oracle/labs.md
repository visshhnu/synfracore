# Oracle Database — Labs

## Interactive Labs

Oracle Database labs use our SQL console with syntax validation and execution simulation.

## Lab 1: Oracle SQL Fundamentals

### Exercise 1.1: Basic Queries
```sql
-- Oracle uses DUAL for expressions
SELECT SYSDATE FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS') AS current_time FROM DUAL;

-- String functions (Oracle syntax)
SELECT UPPER('hello') FROM DUAL;
SELECT SUBSTR('Hello World', 1, 5) FROM DUAL;  -- 'Hello' (1-indexed)
SELECT LENGTH('Hello') FROM DUAL;
SELECT NVL(NULL, 'default') FROM DUAL;  -- NVL = COALESCE in Oracle
```

### Exercise 1.2: Working with Sequences
```sql
-- Create a sequence (Oracle's auto-increment)
CREATE SEQUENCE products_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

-- Use sequence
INSERT INTO products (id, name, price)
VALUES (products_seq.NEXTVAL, 'Laptop', 89999);

-- Check current value
SELECT products_seq.CURRVAL FROM DUAL;
```

### Exercise 1.3: Date Functions
```sql
-- Oracle date arithmetic
SELECT SYSDATE + 1 FROM DUAL;           -- Tomorrow
SELECT SYSDATE - 30 FROM DUAL;          -- 30 days ago
SELECT MONTHS_BETWEEN(SYSDATE, DATE '2024-01-01') FROM DUAL;
SELECT ADD_MONTHS(SYSDATE, 6) FROM DUAL;  -- 6 months from now
SELECT TRUNC(SYSDATE, 'MM') FROM DUAL;    -- First day of current month
```

## Lab 2: PL/SQL Basics

### Exercise 2.1: Anonymous Block
```sql
DECLARE
    v_name     VARCHAR2(100) := 'Alice';
    v_count    NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_count FROM users WHERE name = v_name;

    IF v_count > 0 THEN
        DBMS_OUTPUT.PUT_LINE('Found ' || v_count || ' users named ' || v_name);
    ELSE
        DBMS_OUTPUT.PUT_LINE('No users found');
    END IF;
END;
/

-- Enable output: SET SERVEROUTPUT ON
```

### Exercise 2.2: Stored Procedure
```sql
CREATE OR REPLACE PROCEDURE get_user_orders(p_user_id IN NUMBER)
IS
    CURSOR c_orders IS
        SELECT order_id, total, status, created_at
        FROM orders
        WHERE user_id = p_user_id
        ORDER BY created_at DESC;
BEGIN
    FOR r IN c_orders LOOP
        DBMS_OUTPUT.PUT_LINE('Order ' || r.order_id || ': ' || r.total || ' (' || r.status || ')');
    END LOOP;
END;
/

-- Execute
EXEC get_user_orders(12345);
```

## Lab 3: Performance Tuning

### Exercise 3.1: EXPLAIN PLAN
```sql
-- Oracle uses EXPLAIN PLAN instead of EXPLAIN
EXPLAIN PLAN FOR
SELECT * FROM orders WHERE user_id = 5 AND status = 'pending';

-- Read the plan
SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY());
-- Look for: INDEX RANGE SCAN (good) vs FULL TABLE SCAN (bad for large tables)
```

## Quiz: Oracle vs PostgreSQL

Test yourself on Oracle-specific syntax before your interview or certification exam.
Use the **Quiz** tab to access Oracle MCQ practice sets.
