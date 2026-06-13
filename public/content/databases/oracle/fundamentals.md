# Oracle Database — Fundamentals

## Connecting and Basic SQL

```sql
-- Connect via SQL*Plus
sqlplus username/password@hostname:1521/SERVICE_NAME
sqlplus / as sysdba   -- Connect as DBA locally

-- Or use SQL Developer (GUI) or sqlcl (modern CLI)

-- Oracle-specific SQL differences from standard SQL
-- DUAL table (Oracle's dummy table for expressions)
SELECT 1+1 FROM DUAL;
SELECT SYSDATE FROM DUAL;      -- Current date+time
SELECT USER FROM DUAL;         -- Current username
SELECT SYS_CONTEXT('USERENV','SESSION_USER') FROM DUAL;

-- Date handling (Oracle stores date+time in DATE type)
SELECT TO_DATE('15-01-2024', 'DD-MM-YYYY') FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'DD-MON-YYYY HH24:MI:SS') FROM DUAL;
SELECT SYSDATE + 7 FROM DUAL;  -- 7 days from now
SELECT MONTHS_BETWEEN(DATE '2024-12-31', SYSDATE) FROM DUAL;

-- NULL handling
SELECT NVL(commission, 0) FROM employees;       -- replace NULL with 0
SELECT NVL2(commission, 'Has comm', 'No comm') FROM employees;
SELECT NULLIF(salary, 0) FROM employees;         -- return NULL if salary=0
SELECT COALESCE(comm, bonus, 0) FROM employees;  -- first non-null

-- String functions
SELECT SUBSTR('Hello World', 1, 5) FROM DUAL;   -- 'Hello' (1-indexed!)
SELECT INSTR('Hello World', 'o') FROM DUAL;      -- 5
SELECT LPAD('42', 5, '0') FROM DUAL;            -- '00042'
SELECT TRIM(' hello ') FROM DUAL;                -- 'hello'
SELECT REPLACE('Hello', 'l', 'r') FROM DUAL;    -- 'Herro'
```

## PL/SQL Basics

```sql
-- PL/SQL = Procedural Language/SQL — Oracle's procedural extension
-- Blocks: DECLARE (optional) → BEGIN → EXCEPTION (optional) → END

-- Anonymous block (runs once, not stored)
DECLARE
    v_name   VARCHAR2(50);
    v_salary NUMBER(10,2);
    v_dept   NUMBER;
BEGIN
    -- SQL within PL/SQL
    SELECT first_name || ' ' || last_name, salary, department_id
    INTO v_name, v_salary, v_dept
    FROM employees
    WHERE employee_id = 101;

    -- Conditional
    IF v_salary > 10000 THEN
        DBMS_OUTPUT.PUT_LINE(v_name || ' is highly paid');
    ELSIF v_salary > 5000 THEN
        DBMS_OUTPUT.PUT_LINE(v_name || ' is moderately paid');
    ELSE
        DBMS_OUTPUT.PUT_LINE(v_name || ' is entry level');
    END IF;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Employee not found');
    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('Multiple rows returned');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/   -- semicolon + slash executes the block

-- Enable output
SET SERVEROUTPUT ON;
```

## Oracle Data Types

```sql
-- Common Oracle data types
VARCHAR2(n)     -- Variable string up to n chars (max 32767 in PL/SQL)
CHAR(n)         -- Fixed-length string (padded with spaces)
NUMBER(p,s)     -- Numeric: p=precision (total digits), s=scale (decimal digits)
                -- NUMBER(10,2): 12345678.99 — up to 10 digits, 2 decimal
DATE            -- Date + time (no timezone) — most common
TIMESTAMP       -- Date + time with fractional seconds
TIMESTAMP WITH TIME ZONE -- includes timezone
CLOB            -- Character Large Object (up to 128TB text)
BLOB            -- Binary Large Object (images, files up to 128TB)
XMLTYPE         -- XML data with XML indexing and querying
```
