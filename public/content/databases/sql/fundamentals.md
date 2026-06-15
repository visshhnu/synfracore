# SQL — Fundamentals

## What is SQL?

SQL (Structured Query Language) is the database language used to perform operations on existing databases and create new ones. SQL uses commands like CREATE, DROP, INSERT, etc.

**SQL plays multiple roles (from Himanshu Kumar's guide):**
- **Interactive query language** — users type SQL into tools to retrieve data
- **Database programming language** — embedded into applications
- **Client/server language** — personal programs use SQL to communicate with database servers over networks
- **Internet language** — web servers use SQL to access databases

**SQL is based primarily on ANSI standards.** It is not a continuation language — each statement is complete.

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

## Rules for SQL (from Himanshu Kumar notes)

1. A `;` is used to end SQL statements
2. Statements may be split across lines but keywords may not be split
3. Identifiers, operator names, literals are separated by spaces or delimiters
4. A comma separates parameters without a clause
5. A space separates a clause
6. Reserved words cannot be used as identifiers unless enclosed in double quotes
7. Identifiers can contain up to 30 characters
8. Identifiers must start with an alphabetical character
9. Characters and date literals must be enclosed within single quotes
10. Numeric literals can be represented by simple values

## Creating Tables (DDL)

```sql
-- Basic CREATE TABLE
CREATE TABLE Students (
    roll_no   INT PRIMARY KEY,
    name      VARCHAR(50) NOT NULL,
    address   VARCHAR(100),
    phone     VARCHAR(15),
    age       INT
);

-- With all constraints
CREATE TABLE Employees (
    Id            INT NOT NULL AUTO_INCREMENT,
    FName         VARCHAR(35) NOT NULL,
    LName         VARCHAR(35) NOT NULL,
    PhoneNumber   VARCHAR(11),
    ManagerId     INT,
    DepartmentId  INT NOT NULL,
    Salary        INT NOT NULL,
    HireDate      DATETIME NOT NULL,
    PRIMARY KEY (Id),
    FOREIGN KEY (ManagerId) REFERENCES Employees(Id),
    FOREIGN KEY (DepartmentId) REFERENCES Departments(Id)
);

-- Insert sample data
INSERT INTO Employees
    ([Id], [FName], [LName], [PhoneNumber], [ManagerId], [DepartmentId], [Salary], [HireDate])
VALUES
    (1, 'James',    'Smith',    '1234567890', NULL, 1, 1000, '01-01-2002'),
    (2, 'John',     'Johnson',  '2468101214', 1,    1, 400,  '23-03-2005'),
    (3, 'Michael',  'Williams', '1357911131', 1,    2, 600,  '12-05-2009'),
    (4, 'Johnathon','Smith',    '1212121212', 2,    1, 500,  '24-07-2016');
```

## ALTER TABLE

```sql
-- Add column
ALTER TABLE Employees ADD Email VARCHAR(100);

-- Add multiple columns
ALTER TABLE Students ADD COLUMN grade CHAR(2), ADD COLUMN marks INT;

-- Drop column
ALTER TABLE Employees DROP COLUMN Email;

-- Alter column type
ALTER TABLE Employees ALTER COLUMN Salary BIGINT;

-- Add constraint
ALTER TABLE Employees ADD CONSTRAINT pk_emp PRIMARY KEY (Id);
ALTER TABLE Orders ADD CONSTRAINT fk_customer
    FOREIGN KEY (CustomerId) REFERENCES Customers(Id)
    ON DELETE CASCADE;

-- Add primary key to existing table
ALTER TABLE Students ADD PRIMARY KEY (roll_no);

-- Drop constraint
ALTER TABLE Employees DROP CONSTRAINT fk_dept;
```

## SELECT — Querying Data

```sql
-- Basic SELECT
SELECT * FROM Customers;                    -- all columns
SELECT PhoneNumber, Email FROM Customers;   -- specific columns
SELECT DISTINCT age FROM Students;          -- unique values only

-- Selecting specific columns (from Customers table)
SELECT
    PhoneNumber,
    Email,
    PreferredContact
FROM Customers;
-- Returns only those 3 columns for all rows

-- WHERE clause — filter rows
SELECT * FROM Cars WHERE status = 'READY';
SELECT * FROM Students WHERE age > 18;
SELECT * FROM Students WHERE age NOT IN (18, 20, 21);

-- WHERE with multiple conditions
SELECT * FROM Students WHERE age > 18 AND name LIKE 'A%';
SELECT * FROM Students WHERE age < 18 OR grade = 'A';

-- ORDER BY
SELECT * FROM Employees ORDER BY Salary DESC;
SELECT * FROM Employees ORDER BY LName ASC, FName ASC;

-- LIMIT / TOP
SELECT * FROM Employees ORDER BY Salary DESC LIMIT 10;  -- MySQL
SELECT TOP 10 * FROM Employees ORDER BY Salary DESC;    -- SQL Server
```

## Constraints

Constraints are rules applied to column data. From Himanshu Kumar's notes:

```sql
-- NOT NULL — cannot store null value
name VARCHAR(50) NOT NULL

-- UNIQUE — all values must be different
email VARCHAR(100) UNIQUE

-- PRIMARY KEY — uniquely identifies each row (NOT NULL + UNIQUE)
Id INT PRIMARY KEY
-- Or at table level:
PRIMARY KEY (Id)

-- FOREIGN KEY — link to another table
FOREIGN KEY (DepartmentId) REFERENCES Departments(Id)

-- ON DELETE CASCADE — if parent deleted, delete child rows too
FOREIGN KEY (ManagerId) REFERENCES Employees(Id) ON DELETE CASCADE

-- CHECK — restrict values
age INT CHECK (age >= 18 AND age <= 65)
salary DECIMAL CHECK (salary > 0)

-- DEFAULT — set default value
status VARCHAR(20) DEFAULT 'active'
created_at DATETIME DEFAULT CURRENT_TIMESTAMP
```

## DROP vs TRUNCATE vs DELETE

| | DROP | TRUNCATE | DELETE |
|---|---|---|---|
| What it does | Removes table and contents | Removes all rows | Removes specific rows |
| Table structure | Removed | Kept | Kept |
| Frees table space | Yes | No | No |
| Command type | DDL | DDL | DML |
| WHERE clause | No | No | Yes |
| View of table | Does not exist after | Exists (empty) | Exists |
| Integrity constraints | Removed | Not removed | Not removed |
| UNDO space | Not used | Uses less than DELETE | Uses undo space |
| Speed | Fast | Faster than DELETE | Slowest |

```sql
DROP TABLE Students;              -- removes table completely
TRUNCATE TABLE Students;          -- empties table, keeps structure
DELETE FROM Students WHERE age < 18;  -- removes specific rows
DELETE FROM Students;             -- removes all rows (slower than TRUNCATE)
```

## Nested Queries (Subqueries)

From Himanshu Kumar — using STUDENT, COURSE, STUDENT_COURSE tables:

```
STUDENT: S_ID, S_NAME, S_ADDRESS, S_PHONE, S_AGE
COURSE:  C_ID, C_NAME (DSA, Programming, DBMS)
STUDENT_COURSE: S_ID, C_ID (junction table)
```

**Two types of nested queries:**

**1. Independent Nested Queries** — inner query runs independently:
```sql
-- Find students enrolled in 'DSA' or 'DBMS'
-- Step 1: find C_IDs for those courses
SELECT C_ID FROM COURSE WHERE C_NAME = 'DSA' OR C_NAME = 'DBMS';
-- Result: C1, C3

-- Step 2: find student IDs enrolled in those courses
SELECT S_ID FROM STUDENT_COURSE WHERE C_ID IN ('C1', 'C3');

-- Combined as nested query using IN:
SELECT S_NAME FROM STUDENT
WHERE S_ID IN (
    SELECT S_ID FROM STUDENT_COURSE
    WHERE C_ID IN (
        SELECT C_ID FROM COURSE
        WHERE C_NAME = 'DSA' OR C_NAME = 'DBMS'
    )
);

-- NOT IN — students NOT enrolled in DSA
SELECT S_NAME FROM STUDENT
WHERE S_ID NOT IN (
    SELECT S_ID FROM STUDENT_COURSE
    WHERE C_ID = (SELECT C_ID FROM COURSE WHERE C_NAME = 'DSA')
);

-- ANY — salary greater than ANY salary in dept 2
SELECT * FROM Employees WHERE Salary > ANY (
    SELECT Salary FROM Employees WHERE DepartmentId = 2
);

-- ALL — salary greater than ALL salaries in dept 2
SELECT * FROM Employees WHERE Salary > ALL (
    SELECT Salary FROM Employees WHERE DepartmentId = 2
);
```

**2. Correlated Nested Queries** — inner query references outer query:
```sql
-- Find students whose age is above average for their city
SELECT S_NAME FROM STUDENT s1
WHERE S_AGE > (
    SELECT AVG(S_AGE) FROM STUDENT s2
    WHERE s2.S_ADDRESS = s1.S_ADDRESS  -- correlated!
);
```

## INSERT, UPDATE, DELETE (DML)

```sql
-- INSERT
INSERT INTO Students (roll_no, name, age, address)
VALUES (1, 'Ram', 18, 'Delhi');

-- INSERT multiple rows
INSERT INTO Students VALUES
    (1, 'Ram',    'Delhi',   '9455123451', 18),
    (2, 'Ramesh', 'Gurgaon', '9652431543', 18),
    (3, 'Sujit',  'Rohtak',  '9156253131', 20),
    (4, 'Suresh', 'Delhi',   '9156768971', 18);

-- UPDATE
UPDATE Students SET age = 21 WHERE S_ID = 'S1';
UPDATE Employees SET Salary = Salary * 1.1 WHERE DepartmentId = 1;

-- UPDATE multiple columns
UPDATE Students
SET address = 'Mumbai', age = 22
WHERE name = 'Ram';

-- DELETE
DELETE FROM Students WHERE age < 18;
DELETE FROM Students WHERE S_ID NOT IN (
    SELECT S_ID FROM STUDENT_COURSE   -- delete students with no courses
);
```

## AND, OR Operators

```sql
-- AND — both conditions must be true
SELECT * FROM Employees
WHERE DepartmentId = 1 AND Salary > 500;

-- OR — at least one condition must be true
SELECT * FROM Employees
WHERE DepartmentId = 1 OR DepartmentId = 2;

-- Combined
SELECT * FROM Employees
WHERE (DepartmentId = 1 OR DepartmentId = 2)
AND Salary > 400;

-- NOT
SELECT * FROM Students WHERE NOT age = 18;
SELECT * FROM Students WHERE age != 18;  -- same
```

## CASE Expression

```sql
-- Simple CASE
SELECT FName, LName, Salary,
    CASE
        WHEN Salary >= 1000 THEN 'High'
        WHEN Salary >= 500  THEN 'Medium'
        ELSE 'Low'
    END AS SalaryBand
FROM Employees;

-- Count by category using CASE
SELECT
    COUNT(CASE WHEN PreferredContact = 'PHONE' THEN 1 END) AS phone_count,
    COUNT(CASE WHEN PreferredContact = 'EMAIL' THEN 1 END) AS email_count
FROM Customers;

-- CASE in WHERE
SELECT * FROM Employees
WHERE CASE
    WHEN DepartmentId = 1 THEN Salary > 400
    WHEN DepartmentId = 2 THEN Salary > 500
    ELSE Salary > 300
END;
```

## Cascading Delete

```sql
-- ON DELETE CASCADE: when parent row deleted, all child rows deleted too
CREATE TABLE Orders (
    OrderId INT PRIMARY KEY,
    CustomerId INT,
    FOREIGN KEY (CustomerId) REFERENCES Customers(Id)
        ON DELETE CASCADE        -- orders deleted when customer deleted
);

-- ON DELETE SET NULL: instead of cascade, set FK to NULL
FOREIGN KEY (ManagerId) REFERENCES Employees(Id)
    ON DELETE SET NULL           -- employees' ManagerId set to NULL when manager deleted

-- Test cascade
DELETE FROM Customers WHERE Id = 5;
-- All orders for customer 5 are automatically deleted
```

## SELECT — Advanced Features

```sql
-- COUNT, SUM, AVG, MIN, MAX
SELECT COUNT(*) FROM Employees;
SELECT AVG(Salary) FROM Employees;
SELECT MAX(Salary), MIN(Salary) FROM Employees;
SELECT SUM(Salary) FROM Employees WHERE DepartmentId = 1;

-- GROUP BY
SELECT DepartmentId, COUNT(*), AVG(Salary)
FROM Employees
GROUP BY DepartmentId;

-- HAVING (filter groups)
SELECT DepartmentId, AVG(Salary) AS avg_sal
FROM Employees
GROUP BY DepartmentId
HAVING AVG(Salary) > 600;

-- LIKE — pattern matching
SELECT * FROM Customers WHERE Email LIKE '%@gmail.com';
SELECT * FROM Employees WHERE FName LIKE 'J%';      -- starts with J
SELECT * FROM Employees WHERE FName LIKE '%son';    -- ends with son
SELECT * FROM Employees WHERE FName LIKE '_ohn';    -- _ = exactly one char

-- BETWEEN
SELECT * FROM Employees WHERE Salary BETWEEN 400 AND 800;
SELECT * FROM Orders WHERE HireDate BETWEEN '2020-01-01' AND '2023-12-31';

-- NULL handling
SELECT * FROM Employees WHERE ManagerId IS NULL;     -- top-level managers
SELECT * FROM Customers WHERE Email IS NOT NULL;

SELECT COALESCE(ManagerId, 0) FROM Employees;        -- replace NULL with 0
SELECT ISNULL(ManagerId, 0) FROM Employees;          -- SQL Server syntax
```

## JOINs — Combining Tables

```sql
-- Sample tables used:
-- Employees: Id, FName, LName, ManagerId, DepartmentId, Salary, HireDate
-- Customers: Id, FName, LName, Email, PhoneNumber, PreferredContact
-- Orders:    Id, CustomerId, OrderDate, Amount

-- INNER JOIN — only matching rows in both tables
SELECT e.FName, e.LName, d.Name AS Department
FROM Employees e
INNER JOIN Departments d ON e.DepartmentId = d.Id;

-- LEFT JOIN — all from left + matching from right (NULL if no match)
SELECT c.FName, c.LName, o.OrderDate
FROM Customers c
LEFT JOIN Orders o ON c.Id = o.CustomerId;
-- Customers with no orders → OrderDate = NULL

-- Self JOIN — table joined to itself
SELECT e.FName AS Employee, m.FName AS Manager
FROM Employees e
LEFT JOIN Employees m ON e.ManagerId = m.Id;
-- James Smith has NULL Manager (he's the top)

-- Multi-table JOIN
SELECT e.FName, d.Name AS Dept, o.Amount
FROM Employees e
JOIN Departments d ON e.DepartmentId = d.Id
JOIN Orders o ON o.CustomerId = e.Id
WHERE o.Amount > 500;

-- If multiple tables are joined — specify column with table name:
-- table_name.column_name
SELECT Employees.FName, Departments.Name
FROM Employees JOIN Departments ...
```

## CREATE TABLE with Full Example (riptutorial)

```sql
-- From the SQL book (riptutorial.com) — Employees table with self-reference
CREATE TABLE Employees (
    Id            INT NOT NULL AUTO_INCREMENT,
    FName         VARCHAR(35) NOT NULL,
    LName         VARCHAR(35) NOT NULL,
    PhoneNumber   VARCHAR(11),
    ManagerId     INT,                          -- self-reference (manager is also employee)
    DepartmentId  INT NOT NULL,
    Salary        INT NOT NULL,
    HireDate      DATETIME NOT NULL,
    PRIMARY KEY(Id),
    FOREIGN KEY (ManagerId) REFERENCES Employees(Id),     -- self-referencing FK
    FOREIGN KEY (DepartmentId) REFERENCES Departments(Id)
);

-- Employees data:
-- 1 | James    | Smith    | 1234567890 | NULL | 1 | 1000 | 2002-01-01 (top manager)
-- 2 | John     | Johnson  | 2468101214 | 1    | 1 | 400  | 2005-03-23
-- 3 | Michael  | Williams | 1357911131 | 1    | 2 | 600  | 2009-05-12
-- 4 | Johnathon| Smith    | 1212121212 | 2    | 1 | 500  | 2016-07-24

-- Customers data:
-- 1 | William | Jones | william.jones@example.com | 3347927472 | PHONE
-- 2 | David   | Miller| dmiller@example.net       | 2137921892 | EMAIL
-- 3 | Richard | Davis | richard0123@example.com   | NULL       | EMAIL
```
