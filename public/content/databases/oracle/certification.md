# Oracle Database Certification Guide

## Certifications Available

| Cert | Code | Level | Cost | Format |
|------|------|-------|------|--------|
| **Oracle SQL Certified Associate** | 1Z0-071 | Entry | $245 | MCQ, 90 min |
| **Oracle DB Admin OCA** | 1Z0-082 | Intermediate | $245 | MCQ |
| **Oracle DB Admin OCP** | 1Z0-083 | Advanced | $245 | MCQ |
| **Oracle DB OCM** | Lab exam | Expert | $375 | Hands-on, 2 days |

Certification path: SQL Associate (1Z0-071) → OCA → OCP → OCM.

---

## Oracle SQL — Core Topics (1Z0-071)

```sql
-- ORACLE-SPECIFIC FUNCTIONS
SELECT UPPER(name), LOWER(email), SUBSTR(name, 1, 5) FROM employees;
SELECT NVL(phone, 'N/A') FROM employees;              -- replace NULL
SELECT NVL2(phone, 'Has phone', 'No phone') FROM emp;
SELECT DECODE(status, 'A', 'Active', 'I', 'Inactive', 'Unknown') FROM emp;
SELECT TO_CHAR(hire_date, 'DD-MON-YYYY') FROM employees;
SELECT TO_DATE('15-JAN-2024', 'DD-MON-YYYY') FROM DUAL;
SELECT ROUND(1234.567, 2) FROM DUAL;  -- 1234.57
SELECT TRUNC(1234.567, 2) FROM DUAL;  -- 1234.56 (truncate, not round)

-- DUAL TABLE (Oracle-specific single-row utility table)
SELECT SYSDATE FROM DUAL;      -- current date and time
SELECT USER FROM DUAL;         -- current connected user
SELECT 2 * 3 + 1 FROM DUAL;   -- evaluate any expression

-- DATE ARITHMETIC
SELECT hire_date + 30 FROM employees;                  -- add 30 days
SELECT MONTHS_BETWEEN(SYSDATE, hire_date) FROM employees;
SELECT ADD_MONTHS(hire_date, 6) FROM employees;
SELECT NEXT_DAY(SYSDATE, 'MONDAY') FROM DUAL;

-- ANALYTICAL / WINDOW FUNCTIONS
SELECT name, salary,
  RANK()       OVER (PARTITION BY dept_id ORDER BY salary DESC) AS rnk,
  DENSE_RANK() OVER (PARTITION BY dept_id ORDER BY salary DESC) AS dense,
  ROW_NUMBER() OVER (ORDER BY salary DESC) AS rn,
  LAG(salary, 1, 0) OVER (ORDER BY hire_date) AS prev_sal
FROM employees;

-- PAGINATION (modern — use ROW_NUMBER, not ROWNUM for sorting)
SELECT * FROM (
  SELECT e.*, ROW_NUMBER() OVER (ORDER BY salary DESC) AS rn FROM employees e
) WHERE rn BETWEEN 11 AND 20;

-- SEQUENCES
CREATE SEQUENCE emp_seq START WITH 1000 INCREMENT BY 1 NOCACHE NOCYCLE;
INSERT INTO employees (id, name) VALUES (emp_seq.NEXTVAL, 'Alice');
SELECT emp_seq.CURRVAL FROM DUAL;

-- HIERARCHICAL QUERY (unique Oracle feature)
SELECT LEVEL, LPAD(' ', 2*LEVEL) || name AS org_tree
FROM employees
START WITH manager_id IS NULL
CONNECT BY PRIOR id = manager_id;
```

---

## PL/SQL Basics (OCA / OCP)

```sql
-- STORED PROCEDURE
CREATE OR REPLACE PROCEDURE give_raise(
    p_id  IN NUMBER,
    p_pct IN NUMBER
) AS
    v_sal employees.salary%TYPE;
BEGIN
    SELECT salary INTO v_sal FROM employees WHERE id = p_id;
    UPDATE employees SET salary = salary * (1 + p_pct/100) WHERE id = p_id;
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Old salary: ' || v_sal);
EXCEPTION
    WHEN NO_DATA_FOUND THEN DBMS_OUTPUT.PUT_LINE('Employee not found');
    WHEN OTHERS        THEN ROLLBACK; RAISE;
END;
/
EXEC give_raise(42, 10);

-- TRIGGER
CREATE OR REPLACE TRIGGER trg_salary_audit
BEFORE UPDATE OF salary ON employees
FOR EACH ROW
BEGIN
    INSERT INTO audit_log (emp_id, old_sal, new_sal, changed_at)
    VALUES (:OLD.id, :OLD.salary, :NEW.salary, SYSDATE);
END;
/
```

---

## Study Resources

- **Oracle Live SQL** (livesql.oracle.com) — free Oracle DB in the browser, no install needed
- **Oracle Tutorial** (oracletutorial.com) — free, comprehensive guide
- **Oracle Dev Gym** (devgym.oracle.com) — free practice quizzes and workouts
- **Oracle Education** (education.oracle.com) — official certification learning paths

## Revision Notes
```
ORACLE vs STANDARD SQL:
  DUAL: one-row utility table for expressions (SELECT SYSDATE FROM DUAL)
  NVL(val, default): replace NULL values (COALESCE is ANSI equivalent)
  DECODE: inline case expression (legacy, prefer CASE WHEN in new code)
  VARCHAR2: preferred string type in Oracle (not VARCHAR)
  ROWNUM: assigned before ORDER BY — always wrap in subquery for pagination

DATE: TO_DATE | TO_CHAR | ADD_MONTHS | MONTHS_BETWEEN | TRUNC | NEXT_DAY
SEQUENCES: .NEXTVAL (next value) | .CURRVAL (current value within session)
  Oracle 12c+: GENERATED AS IDENTITY column supported

HIERARCHICAL: START WITH (root) + CONNECT BY PRIOR id = parent_id (tree walk)
PL/SQL: %TYPE (inherit column type) | %ROWTYPE (inherit full row structure)
  Exception types: NO_DATA_FOUND | TOO_MANY_ROWS | OTHERS
```
