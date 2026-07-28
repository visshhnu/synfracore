# SQL — Fundamentals

## What is SQL?

SQL (Structured Query Language) is the database language used to perform operations on existing databases and create new ones — defining structure, inserting and changing data, and querying it back out. Every statement is a complete, standalone instruction; SQL is not a continuation language the way a shell script is.

**SQL plays multiple roles depending on how you're using it:**
- **Interactive query language** — you type SQL directly into a client (`psql`, MySQL Workbench, a notebook) to explore data
- **Embedded database language** — application code builds and sends SQL strings (or, more safely, parameterized queries) to a database driver
- **Client/server protocol** — a client connects over the network to a database server and exchanges SQL statements and result sets
- **Web-backend language** — most web applications ultimately read and write through SQL, even when a query builder or ORM sits on top of it

**SQL is based primarily on ANSI/ISO standards**, but every major engine (PostgreSQL, MySQL, SQL Server, Oracle, SQLite) extends that standard differently. A recurring theme in this course: syntax that works on one engine often doesn't work unchanged on another. Every example below states which engine it targets.

## SQL Command Categories

```
SQL Commands
├── DDL — Data Definition Language
│   ├── CREATE   — create tables, databases, indexes
│   ├── ALTER    — modify table structure
│   ├── DROP     — delete tables permanently
│   └── TRUNCATE — delete all rows (faster than DELETE)
│
├── DML — Data Manipulation Language
│   ├── INSERT   — add new rows
│   ├── UPDATE   — modify existing rows
│   └── DELETE   — remove rows
│
├── DQL — Data Query Language
│   └── SELECT   — retrieve data
│
├── DCL — Data Control Language
│   ├── GRANT    — give permissions
│   └── REVOKE   — take back permissions
│
└── TCL — Transaction Control Language
    ├── COMMIT     — save transaction
    ├── ROLLBACK   — undo transaction
    └── SAVEPOINT  — create checkpoint within transaction
```

## Syntax Rules Worth Internalizing

1. A `;` ends a statement (required when multiple statements are sent together; many single-statement clients accept its absence).
2. A statement can span multiple lines, but a keyword itself can't be split across lines.
3. Identifiers, operators, and literals are separated by whitespace or a delimiter (comma, parenthesis).
4. A comma separates items within a clause (column lists, value lists); it never separates two different clauses.
5. Reserved words (`SELECT`, `ORDER`, `GROUP`, etc.) can't be used as identifiers unless quoted — double quotes in standard SQL/PostgreSQL, backticks in MySQL, square brackets in SQL Server.
6. String and date literals are enclosed in single quotes: `'like this'`. Double quotes are for quoted identifiers in standard SQL/PostgreSQL, not string values — a common source of confusion for anyone coming from a language where `"..."` and `'...'` are interchangeable.
7. Maximum identifier length varies by engine — this is NOT a universal SQL rule: MySQL allows 64 characters, PostgreSQL 63 bytes, SQL Server 128 characters, and Oracle 128 characters since Oracle 12.2 (30 bytes on older versions). Don't assume one number applies everywhere.
8. Identifiers must start with a letter (or underscore, on most engines) — not a digit.

## Creating Tables (DDL)

The examples in this course use a small running schema: a company with `Employees`, `Departments`, `Customers`, and `Orders`. Every later section reuses these same tables — the shape is introduced once, here, and never silently changes.

```sql
-- PostgreSQL
CREATE TABLE Departments (
    id     SERIAL PRIMARY KEY,
    name   VARCHAR(50) NOT NULL
);

CREATE TABLE Employees (
    id             SERIAL PRIMARY KEY,
    first_name     VARCHAR(35) NOT NULL,
    last_name      VARCHAR(35) NOT NULL,
    phone          VARCHAR(15),
    manager_id     INT REFERENCES Employees(id),   -- self-reference: a manager is also an employee
    department_id  INT NOT NULL REFERENCES Departments(id),
    salary         INT NOT NULL,
    hire_date      DATE NOT NULL
);

-- Sample data
INSERT INTO Departments (id, name) VALUES
    (1, 'Engineering'),
    (2, 'Sales');

INSERT INTO Employees (id, first_name, last_name, phone, manager_id, department_id, salary, hire_date) VALUES
    (1, 'Amara',  'Okafor',   '5550101', NULL, 1, 9800, '2018-03-14'),
    (2, 'Diego',  'Ramirez',  '5550102', 1,    1, 6200, '2020-06-01'),
    (3, 'Priya',  'Nair',     '5550103', 1,    2, 7100, '2019-11-23'),
    (4, 'Kenji',  'Watanabe', '5550104', 2,    1, 6600, '2021-09-10');
```

```sql
-- MySQL equivalent (AUTO_INCREMENT instead of SERIAL, backtick-quoted identifiers if needed)
CREATE TABLE Employees (
    id             INT AUTO_INCREMENT PRIMARY KEY,
    first_name     VARCHAR(35) NOT NULL,
    last_name      VARCHAR(35) NOT NULL,
    phone          VARCHAR(15),
    manager_id     INT,
    department_id  INT NOT NULL,
    salary         INT NOT NULL,
    hire_date      DATE NOT NULL,
    FOREIGN KEY (manager_id) REFERENCES Employees(id),
    FOREIGN KEY (department_id) REFERENCES Departments(id)
);
```

```sql
-- SQL Server equivalent (IDENTITY instead of SERIAL/AUTO_INCREMENT)
CREATE TABLE Employees (
    id             INT IDENTITY(1,1) PRIMARY KEY,
    first_name     VARCHAR(35) NOT NULL,
    last_name      VARCHAR(35) NOT NULL,
    phone          VARCHAR(15),
    manager_id     INT REFERENCES Employees(id),
    department_id  INT NOT NULL REFERENCES Departments(id),
    salary         INT NOT NULL,
    hire_date      DATE NOT NULL
);
```

Note the different auto-increment keywords — `SERIAL` (PostgreSQL), `AUTO_INCREMENT` (MySQL), `IDENTITY` (SQL Server) — are not interchangeable. Copying a `CREATE TABLE` statement between engines without translating this line is one of the most common "why doesn't this run" mistakes.

## ALTER TABLE

```sql
-- Add column (same syntax across PostgreSQL, MySQL, SQL Server)
ALTER TABLE Employees ADD COLUMN email VARCHAR(100);

-- Drop column (same syntax across all three)
ALTER TABLE Employees DROP COLUMN email;

-- Change a column's type — this one DOES differ by engine:
ALTER TABLE Employees ALTER COLUMN salary TYPE BIGINT;      -- PostgreSQL (TYPE keyword required)
ALTER TABLE Employees MODIFY COLUMN salary BIGINT;           -- MySQL
ALTER TABLE Employees ALTER COLUMN salary BIGINT;             -- SQL Server (no TYPE keyword)

-- Add a named constraint
ALTER TABLE Orders ADD CONSTRAINT fk_orders_customer
    FOREIGN KEY (customer_id) REFERENCES Customers(id)
    ON DELETE CASCADE;

-- Drop a constraint by the name it was actually given
ALTER TABLE Orders DROP CONSTRAINT fk_orders_customer;       -- PostgreSQL, SQL Server
ALTER TABLE Orders DROP FOREIGN KEY fk_orders_customer;      -- MySQL (needs DROP FOREIGN KEY, not DROP CONSTRAINT, for FKs on most versions)
```

A constraint can only be dropped by the name it was actually created with — `DROP CONSTRAINT some_name` fails if `some_name` was never defined. Keep track of the names you give constraints; there's no way to "guess" one later.

## SELECT — Querying Data

```sql
-- Basic SELECT
SELECT * FROM Customers;                     -- all columns
SELECT phone, email FROM Customers;          -- specific columns
SELECT DISTINCT department_id FROM Employees; -- unique values only

-- WHERE clause — filter rows
SELECT * FROM Employees WHERE department_id = 1;
SELECT * FROM Employees WHERE salary > 7000;

-- WHERE with multiple conditions
SELECT * FROM Employees WHERE salary > 6000 AND last_name LIKE 'R%';
SELECT * FROM Employees WHERE salary < 6500 OR department_id = 2;

-- ORDER BY
SELECT * FROM Employees ORDER BY salary DESC;
SELECT * FROM Employees ORDER BY last_name ASC, first_name ASC;

-- LIMIT / TOP — also engine-specific
SELECT * FROM Employees ORDER BY salary DESC LIMIT 10;         -- PostgreSQL, MySQL
SELECT TOP 10 * FROM Employees ORDER BY salary DESC;            -- SQL Server
```

## Constraints

Constraints are rules the database enforces on column data — they reject bad writes rather than relying on application code to catch every case.

```sql
-- NOT NULL — cannot store a null value
name VARCHAR(50) NOT NULL

-- UNIQUE — all values must be different
email VARCHAR(100) UNIQUE

-- PRIMARY KEY — uniquely identifies each row (implies NOT NULL + UNIQUE)
id INT PRIMARY KEY
-- Or declared at table level, useful for composite keys:
PRIMARY KEY (id)

-- FOREIGN KEY — links to another table's primary key
FOREIGN KEY (department_id) REFERENCES Departments(id)

-- ON DELETE CASCADE — deleting the parent row deletes matching child rows too
FOREIGN KEY (manager_id) REFERENCES Employees(id) ON DELETE CASCADE

-- CHECK — restrict which values are allowed
age INT CHECK (age >= 18 AND age <= 65)
salary DECIMAL CHECK (salary > 0)

-- DEFAULT — value used automatically when none is supplied
status VARCHAR(20) DEFAULT 'active'
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
```

## DROP vs TRUNCATE vs DELETE

| | DROP | TRUNCATE | DELETE |
|---|---|---|---|
| What it does | Removes table and contents | Removes all rows | Removes specific rows |
| Table structure | Removed | Kept | Kept |
| Frees table space | Yes | Yes | No |
| Command type | DDL | DDL | DML |
| WHERE clause | No | No | Yes |
| Table exists after | No | Yes (empty) | Yes |
| Constraints/indexes | Removed with the table | Kept | Kept |
| Transaction log | Minimal | Minimal (engine-dependent) | Full row-by-row logging |
| Speed on large tables | Fast | Fast | Slow (logs every row) |

```sql
DROP TABLE Employees;                    -- removes table completely
TRUNCATE TABLE Employees;                -- empties table, keeps structure
DELETE FROM Employees WHERE salary < 5000;  -- removes specific rows
DELETE FROM Employees;                   -- removes all rows (slower than TRUNCATE, but rolls back if the transaction does)
```

## Subqueries — Independent and Correlated

A separate small schema for this section — a school's `Students`, `Courses`, and the `Enrollments` table linking them:

```sql
CREATE TABLE Students (
    roll_no  INT PRIMARY KEY,
    name     VARCHAR(50) NOT NULL,
    city     VARCHAR(50)
);

CREATE TABLE Courses (
    course_id    INT PRIMARY KEY,
    course_name  VARCHAR(50) NOT NULL   -- e.g. 'Data Structures', 'Databases'
);

CREATE TABLE Enrollments (
    roll_no    INT REFERENCES Students(roll_no),
    course_id  INT REFERENCES Courses(course_id),
    PRIMARY KEY (roll_no, course_id)
);
```

**Independent subquery** — the inner query runs on its own, unrelated to the outer row currently being evaluated:

```sql
-- Students enrolled in 'Data Structures' or 'Databases'
SELECT name FROM Students
WHERE roll_no IN (
    SELECT roll_no FROM Enrollments
    WHERE course_id IN (
        SELECT course_id FROM Courses
        WHERE course_name IN ('Data Structures', 'Databases')
    )
);

-- ANY — salary greater than at least one salary in department 2
SELECT * FROM Employees WHERE salary > ANY (
    SELECT salary FROM Employees WHERE department_id = 2
);

-- ALL — salary greater than every salary in department 2
SELECT * FROM Employees WHERE salary > ALL (
    SELECT salary FROM Employees WHERE department_id = 2
);
```

**Correlated subquery** — the inner query references a column from the outer query, so it conceptually re-runs once per outer row:

```sql
-- Students whose city has more than one student (a same-city comparison)
SELECT s1.name FROM Students s1
WHERE (
    SELECT COUNT(*) FROM Students s2
    WHERE s2.city = s1.city   -- correlated: depends on the outer row
) > 1;
```

**A real, common `NOT IN` bug**: if the subquery's result set contains even one `NULL`, the entire `NOT IN` comparison becomes indeterminate (SQL's three-valued logic) and the outer query silently returns zero rows — no error, just an empty result that looks like "nobody matched."

```sql
-- Risky if Enrollments.course_id can ever be NULL:
SELECT name FROM Students
WHERE roll_no NOT IN (SELECT roll_no FROM Enrollments);

-- Safer — filter NULLs explicitly, or use NOT EXISTS instead (immune to this problem):
SELECT s.name FROM Students s
WHERE NOT EXISTS (
    SELECT 1 FROM Enrollments e WHERE e.roll_no = s.roll_no
);
```

`EXISTS`/`NOT EXISTS` is also typically faster than `IN`/`NOT IN` on large tables, on top of not having the `NULL`-poisoning problem above.

## INSERT, UPDATE, DELETE (DML)

```sql
-- INSERT
INSERT INTO Students (roll_no, name, city) VALUES (1, 'Zara', 'Nairobi');

-- INSERT multiple rows
INSERT INTO Students (roll_no, name, city) VALUES
    (1, 'Zara',   'Nairobi'),
    (2, 'Farouk', 'Lagos'),
    (3, 'Mei',    'Singapore'),
    (4, 'Tomas',  'Lisbon');

-- UPDATE
UPDATE Students SET city = 'Accra' WHERE roll_no = 1;
UPDATE Employees SET salary = salary * 1.1 WHERE department_id = 1;

-- UPDATE multiple columns
UPDATE Students
SET city = 'Cairo'
WHERE name = 'Zara';

-- DELETE
DELETE FROM Students WHERE roll_no = 4;
DELETE FROM Students WHERE roll_no NOT IN (
    SELECT roll_no FROM Enrollments   -- delete students enrolled in nothing
);
```

## AND, OR, NOT Operators

```sql
-- AND — every condition must be true
SELECT * FROM Employees
WHERE department_id = 1 AND salary > 6000;

-- OR — at least one condition must be true
SELECT * FROM Employees
WHERE department_id = 1 OR department_id = 2;

-- Combined, with explicit parentheses (don't rely on operator precedence being obvious to the next reader)
SELECT * FROM Employees
WHERE (department_id = 1 OR department_id = 2)
AND salary > 6000;

-- NOT
SELECT * FROM Students WHERE NOT city = 'Lagos';
SELECT * FROM Students WHERE city != 'Lagos';   -- equivalent, more common in practice
```

## CASE Expression

```sql
-- Simple CASE
SELECT first_name, last_name, salary,
    CASE
        WHEN salary >= 8000 THEN 'Senior band'
        WHEN salary >= 6000 THEN 'Mid band'
        ELSE 'Junior band'
    END AS salary_band
FROM Employees;

-- Counting by category using CASE
SELECT
    COUNT(CASE WHEN department_id = 1 THEN 1 END) AS engineering_count,
    COUNT(CASE WHEN department_id = 2 THEN 1 END) AS sales_count
FROM Employees;

-- CASE inside WHERE
SELECT * FROM Employees
WHERE CASE
    WHEN department_id = 1 THEN salary > 6000
    WHEN department_id = 2 THEN salary > 6500
    ELSE salary > 5000
END;
```

## Cascading Delete

```sql
CREATE TABLE Customers (
    id                 SERIAL PRIMARY KEY,
    first_name         VARCHAR(35) NOT NULL,
    last_name          VARCHAR(35) NOT NULL,
    email              VARCHAR(100),
    phone              VARCHAR(15),
    preferred_contact  VARCHAR(10)   -- 'EMAIL' or 'PHONE'
);

CREATE TABLE Orders (
    id           SERIAL PRIMARY KEY,
    customer_id  INT REFERENCES Customers(id) ON DELETE CASCADE,  -- orders deleted when customer is deleted
    order_date   DATE NOT NULL,
    amount       DECIMAL NOT NULL
);

-- ON DELETE SET NULL — an alternative: keep the child row, just clear the link
FOREIGN KEY (manager_id) REFERENCES Employees(id)
    ON DELETE SET NULL   -- an employee's manager_id becomes NULL if that manager is deleted

-- Test the actual behavior, don't just assume the migration applying means it's correct:
DELETE FROM Customers WHERE id = 5;
-- Every order belonging to customer 5 is now gone too — verify that's really what you want
-- before using CASCADE on anything with audit/business significance.
```

## SELECT — Aggregates and Pattern Matching

```sql
-- COUNT, SUM, AVG, MIN, MAX
SELECT COUNT(*) FROM Employees;
SELECT AVG(salary) FROM Employees;
SELECT MAX(salary), MIN(salary) FROM Employees;
SELECT SUM(salary) FROM Employees WHERE department_id = 1;

-- GROUP BY
SELECT department_id, COUNT(*), AVG(salary)
FROM Employees
GROUP BY department_id;

-- HAVING — filters groups, evaluated after GROUP BY (WHERE filters rows, before grouping)
SELECT department_id, AVG(salary) AS avg_salary
FROM Employees
GROUP BY department_id
HAVING AVG(salary) > 6500;

-- LIKE — pattern matching
SELECT * FROM Customers WHERE email LIKE '%@example.com';
SELECT * FROM Employees WHERE first_name LIKE 'D%';    -- starts with D
SELECT * FROM Employees WHERE first_name LIKE '%zi';    -- ends with zi
SELECT * FROM Employees WHERE first_name LIKE '_eji';   -- _ = exactly one character

-- BETWEEN
SELECT * FROM Employees WHERE salary BETWEEN 6000 AND 8000;
SELECT * FROM Orders WHERE order_date BETWEEN '2023-01-01' AND '2023-12-31';

-- NULL handling
SELECT * FROM Employees WHERE manager_id IS NULL;    -- top-level managers
SELECT * FROM Customers WHERE email IS NOT NULL;

SELECT COALESCE(manager_id, 0) FROM Employees;   -- replace NULL with 0 (standard SQL, portable)
```

## JOINs — Combining Tables

```sql
-- INNER JOIN — only rows matching in both tables
SELECT e.first_name, e.last_name, d.name AS department
FROM Employees e
INNER JOIN Departments d ON e.department_id = d.id;

-- LEFT JOIN — all rows from the left table + matching rows from the right (NULL if no match)
SELECT c.first_name, c.last_name, o.order_date
FROM Customers c
LEFT JOIN Orders o ON c.id = o.customer_id;
-- A customer with no orders still appears, with order_date = NULL

-- Self JOIN — a table joined to itself, e.g. employee-manager hierarchies
SELECT e.first_name AS employee, m.first_name AS manager
FROM Employees e
LEFT JOIN Employees m ON e.manager_id = m.id;
-- Amara has NULL for manager — she's the top of the hierarchy

-- Multi-table JOIN — chaining three related tables (Students -> Enrollments -> Courses)
SELECT s.name, c.course_name
FROM Students s
JOIN Enrollments en ON en.roll_no = s.roll_no
JOIN Courses c ON c.course_id = en.course_id
WHERE s.city = 'Nairobi';

-- Once multiple tables are joined, qualify ambiguous column names with the table (or alias):
SELECT Employees.first_name, Departments.name
FROM Employees JOIN Departments ON Employees.department_id = Departments.id;
```
