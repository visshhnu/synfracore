# DBMS Fundamentals

## What is a Database Management System?
A DBMS is software that manages data storage, retrieval, and manipulation. It provides an interface between users/applications and the physical data store.

## Core Concepts

### Data Models
- **Relational Model**: Data in tables (relations) with rows and columns. Uses SQL.
- **Hierarchical Model**: Tree structure, parent-child relationships.
- **Network Model**: Graph structure, more flexible than hierarchical.
- **NoSQL Models**: Document, key-value, wide-column, graph databases.

### ACID Properties
- **Atomicity**: Transaction is all-or-nothing.
- **Consistency**: Database moves from one valid state to another.
- **Isolation**: Concurrent transactions don't interfere.
- **Durability**: Committed transactions survive failures.

### Schema
- **Physical Schema**: How data is stored on disk.
- **Logical Schema**: Structure of data (tables, relationships).
- **View Schema**: User-visible portion of the database.

## Relational Model

### Keys
- **Primary Key**: Uniquely identifies a row. Cannot be NULL.
- **Foreign Key**: References primary key in another table.
- **Candidate Key**: Minimal set of attributes that uniquely identifies a row.
- **Super Key**: Any set of attributes that uniquely identifies a row.
- **Composite Key**: Primary key made of multiple columns.

### Relations
- **One-to-One**: Each row in table A maps to one row in table B.
- **One-to-Many**: One row in A maps to many rows in B.
- **Many-to-Many**: Implemented via junction/bridge table.

## SQL Basics
```sql
-- Create table
CREATE TABLE students (
  id INT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  dept_id INT REFERENCES departments(id)
);

-- Insert
INSERT INTO students VALUES (1, 'Alice', 10);

-- Query
SELECT s.name, d.name FROM students s
JOIN departments d ON s.dept_id = d.id
WHERE s.name LIKE 'A%';

-- Update
UPDATE students SET dept_id = 20 WHERE id = 1;

-- Delete
DELETE FROM students WHERE id = 1;
```

## Normalization
Normalization reduces data redundancy and improves integrity.
- **1NF**: Atomic values, no repeating groups.
- **2NF**: 1NF + no partial dependencies on composite key.
- **3NF**: 2NF + no transitive dependencies.
- **BCNF**: Every determinant is a candidate key.

## Indexes
Indexes speed up queries at the cost of write overhead.
- **B-tree index**: Default in most RDBMS. Good for range queries.
- **Hash index**: Good for equality lookups only.
- **Clustered index**: Data rows sorted by index key.
- **Non-clustered index**: Separate structure pointing to data rows.

## Transactions
```sql
BEGIN TRANSACTION;
UPDATE accounts SET balance = balance - 100 WHERE id = 1;
UPDATE accounts SET balance = balance + 100 WHERE id = 2;
COMMIT;
-- or ROLLBACK on error
```

## Concurrency Control
- **Locks**: Shared (read) and Exclusive (write) locks.
- **Two-Phase Locking (2PL)**: Acquire all locks before releasing any.
- **MVCC**: Multiple versions of data for concurrent reads without blocking writes.
- **Deadlock**: Two transactions waiting for each other's locks. Detected and resolved by aborting one.
