# Database Management Systems — Fundamentals

## DBMS Concepts

```
DBMS: Software to create, manage, and query databases
  Examples: PostgreSQL, MySQL, Oracle, SQL Server, SQLite

Advantages over file systems:
  - Data independence (change storage without changing apps)
  - ACID transactions (consistency guaranteed)
  - Query language (SQL)
  - Concurrency control (multiple users safely)
  - Recovery (crashes don't corrupt data)

Database Architecture:
  External level:  How different users see the data
  Conceptual level: Logical structure (tables, relationships)
  Internal level:  Physical storage (B-trees, pages, files)
```

## ER Diagrams and Normalization

```
Entity-Relationship Modeling:
  Entity: "thing" (Student, Course, Professor)
  Attribute: property of entity (student_id, name, email)
  Relationship: association between entities (Student enrolls Course)
  
  Cardinality: 1:1, 1:N, M:N

Normalization (eliminate redundancy):
  1NF: Atomic values, no repeating groups
    Bad: courses = "Math,Physics,CS"  → each course is a row
  
  2NF: 1NF + no partial dependency (non-key depends on full key)
    Table (student_id, course_id, student_name, grade)
    student_name depends only on student_id (partial) → separate table
  
  3NF: 2NF + no transitive dependency
    Table (employee_id, department_id, department_name)
    department_name depends on department_id (not PK) → separate table
  
  BCNF: Stronger 3NF — every determinant is a candidate key
  
  Denormalization: intentionally add redundancy for read performance
```

## Transactions and ACID

```sql
-- ACID Properties:
-- Atomicity: all or nothing (BEGIN/COMMIT/ROLLBACK)
-- Consistency: constraints always satisfied
-- Isolation: concurrent transactions don't interfere
-- Durability: committed changes survive crashes

-- Transaction example
BEGIN;
UPDATE accounts SET balance = balance - 1000 WHERE id = 1;
UPDATE accounts SET balance = balance + 1000 WHERE id = 2;
COMMIT;  -- Both or neither

-- Isolation levels (read phenomena):
-- READ UNCOMMITTED: sees dirty reads (uncommitted changes)
-- READ COMMITTED:   no dirty reads (PostgreSQL default)
-- REPEATABLE READ:  no non-repeatable reads (MySQL InnoDB default)
-- SERIALIZABLE:     no phantom reads (slowest, most consistent)
```
