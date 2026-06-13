# Oracle Database — Intermediate

## PL/SQL Procedures, Functions, and Packages

```sql
-- Stored Procedure
CREATE OR REPLACE PROCEDURE raise_salary(
    p_emp_id  IN  employees.employee_id%TYPE,
    p_pct     IN  NUMBER,
    p_new_sal OUT employees.salary%TYPE
) AS
    v_old_sal employees.salary%TYPE;
BEGIN
    SELECT salary INTO v_old_sal FROM employees WHERE employee_id = p_emp_id;

    p_new_sal := v_old_sal * (1 + p_pct/100);

    UPDATE employees
    SET salary = p_new_sal, last_updated = SYSDATE
    WHERE employee_id = p_emp_id;

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Salary updated from ' || v_old_sal || ' to ' || p_new_sal);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20001, 'Employee ' || p_emp_id || ' not found');
END raise_salary;
/

-- Call procedure
DECLARE v_new NUMBER; BEGIN raise_salary(101, 10, v_new); END;
/

-- Function (returns a value, can be used in SQL)
CREATE OR REPLACE FUNCTION get_annual_salary(p_emp_id NUMBER)
RETURN NUMBER DETERMINISTIC IS
    v_monthly NUMBER;
BEGIN
    SELECT salary INTO v_monthly FROM employees WHERE employee_id = p_emp_id;
    RETURN v_monthly * 12;
EXCEPTION
    WHEN NO_DATA_FOUND THEN RETURN NULL;
END;
/

-- Use in SQL
SELECT first_name, get_annual_salary(employee_id) AS annual_sal FROM employees;

-- Package (group related procedures/functions)
CREATE OR REPLACE PACKAGE emp_pkg AS
    PROCEDURE hire(p_name VARCHAR2, p_dept NUMBER, p_sal NUMBER);
    FUNCTION headcount(p_dept NUMBER) RETURN NUMBER;
    PROCEDURE fire(p_emp_id NUMBER);
    -- Constants visible to callers
    C_MAX_RAISE CONSTANT NUMBER := 50;
END emp_pkg;
/

CREATE OR REPLACE PACKAGE BODY emp_pkg AS
    PROCEDURE hire(p_name VARCHAR2, p_dept NUMBER, p_sal NUMBER) IS
    BEGIN
        INSERT INTO employees(employee_id, first_name, department_id, salary)
        VALUES(employees_seq.NEXTVAL, p_name, p_dept, p_sal);
        COMMIT;
    END hire;

    FUNCTION headcount(p_dept NUMBER) RETURN NUMBER IS
        v_count NUMBER;
    BEGIN
        SELECT COUNT(*) INTO v_count FROM employees WHERE department_id = p_dept;
        RETURN v_count;
    END headcount;

    PROCEDURE fire(p_emp_id NUMBER) IS
    BEGIN
        DELETE FROM employees WHERE employee_id = p_emp_id;
        COMMIT;
    END fire;
END emp_pkg;
/

-- Use package
EXEC emp_pkg.hire('John Smith', 10, 8000);
SELECT emp_pkg.headcount(10) FROM DUAL;
```

## Cursors

```sql
-- Implicit cursor (for single-row SELECT INTO)
SELECT name INTO v_name FROM employees WHERE id = 101;
-- Oracle creates implicit cursor automatically
-- SQL%ROWCOUNT, SQL%FOUND, SQL%NOTFOUND, SQL%ISOPEN

-- Explicit cursor (for multiple rows)
DECLARE
    CURSOR c_employees IS
        SELECT employee_id, first_name, salary
        FROM employees
        WHERE department_id = 10
        ORDER BY salary DESC;

    v_rec c_employees%ROWTYPE;  -- Record type matching cursor columns
BEGIN
    OPEN c_employees;
    LOOP
        FETCH c_employees INTO v_rec;
        EXIT WHEN c_employees%NOTFOUND;  -- Exit if no more rows
        DBMS_OUTPUT.PUT_LINE(v_rec.first_name || ': ' || v_rec.salary);
    END LOOP;
    CLOSE c_employees;
END;
/

-- Cursor FOR loop (simpler — auto open/fetch/close)
BEGIN
    FOR rec IN (SELECT first_name, salary FROM employees WHERE dept = 10) LOOP
        DBMS_OUTPUT.PUT_LINE(rec.first_name || ': ' || rec.salary);
    END LOOP;
END;
/
```
