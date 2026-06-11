# DBMS — Complete Guide for GATE & Interviews

DBMS is 8-10 marks in GATE and essential for backend developer interviews. Covers relational model, SQL, normalization, transactions, and indexing.

## Relational Model

```
Relation = Table
Tuple = Row
Attribute = Column
Domain = Set of allowed values for an attribute
Degree = Number of attributes (columns)
Cardinality = Number of tuples (rows)

Keys:
  Super Key: Any set of attributes that uniquely identifies a tuple
  Candidate Key: Minimal super key (no redundant attribute)
  Primary Key: Chosen candidate key
  Foreign Key: Attribute referencing primary key of another table
  Alternate Key: Candidate keys not chosen as primary key
```

## Relational Algebra

```
Core operations:
  σ (Select): Filter rows — σ(age>25)(Employee)
  π (Project): Select columns — π(name,age)(Employee)
  × (Cartesian): All combinations of two relations
  ∪ (Union): All tuples in either (same schema)
  - (Difference): Tuples in first but not second
  ⋈ (Natural Join): Join on common attributes, no duplicates

Derived operations:
  ∩ (Intersection): R∩S = R-(R-S)
  ⋈θ (Theta Join): σθ(R×S) — join with condition θ
  ⋈= (Equijoin): Theta join where θ is equality
  ÷ (Division): R÷S — tuples in R related to ALL tuples in S

GATE example:
  Find employees in ALL departments:
  Employee(eid, did) ÷ Department(did)
```

## SQL — Complete Reference

```sql
-- DDL (Data Definition Language)
CREATE TABLE Employee (
    eid INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    salary DECIMAL(10,2),
    dept_id INT,
    manager_id INT,
    FOREIGN KEY (dept_id) REFERENCES Department(did),
    FOREIGN KEY (manager_id) REFERENCES Employee(eid)
);

ALTER TABLE Employee ADD COLUMN email VARCHAR(100);
ALTER TABLE Employee DROP COLUMN email;
DROP TABLE Employee;
TRUNCATE TABLE Employee;  -- delete all rows, reset identity

-- DML (Data Manipulation Language)
INSERT INTO Employee VALUES (1, 'Alice', 75000, 10, NULL);
UPDATE Employee SET salary = salary * 1.1 WHERE dept_id = 10;
DELETE FROM Employee WHERE eid = 5;

-- Queries
SELECT e.name, d.dname, e.salary
FROM Employee e
INNER JOIN Department d ON e.dept_id = d.did
WHERE e.salary > 50000
ORDER BY e.salary DESC
LIMIT 10;

-- Aggregation
SELECT dept_id, COUNT(*) AS emp_count, AVG(salary) AS avg_sal
FROM Employee
GROUP BY dept_id
HAVING AVG(salary) > 60000;  -- HAVING filters groups, WHERE filters rows

-- Subqueries
SELECT name FROM Employee
WHERE salary > (SELECT AVG(salary) FROM Employee);

-- Employees who earn more than their manager
SELECT e.name FROM Employee e
JOIN Employee m ON e.manager_id = m.eid
WHERE e.salary > m.salary;

-- Window Functions (important for interviews)
SELECT name, salary,
    RANK() OVER (ORDER BY salary DESC) AS rank,
    DENSE_RANK() OVER (ORDER BY salary DESC) AS dense_rank,
    ROW_NUMBER() OVER (PARTITION BY dept_id ORDER BY salary DESC) AS dept_rank,
    SUM(salary) OVER (PARTITION BY dept_id) AS dept_total
FROM Employee;

-- CTEs (Common Table Expressions)
WITH high_earners AS (
    SELECT dept_id, COUNT(*) as cnt
    FROM Employee
    WHERE salary > 80000
    GROUP BY dept_id
)
SELECT d.dname, h.cnt
FROM Department d JOIN high_earners h ON d.did = h.dept_id;

-- JOIN types
INNER JOIN: Only matching rows
LEFT JOIN:  All left + matching right (NULL for no match)
RIGHT JOIN: All right + matching left
FULL JOIN:  All rows from both (NULL for no match)
CROSS JOIN: Cartesian product

-- VIEWS
CREATE VIEW HighEarners AS
SELECT name, salary FROM Employee WHERE salary > 80000;
-- Views are virtual tables, not stored data
```

## Normalization

```
Functional Dependency (FD): X → Y means X determines Y
Armstrong's Axioms:
  Reflexivity:  if Y ⊆ X, then X → Y
  Augmentation: if X → Y, then XZ → YZ
  Transitivity: if X → Y and Y → Z, then X → Z

Closure of FD set F: F⁺ = all FDs that can be derived
Closure of attribute set X: X⁺ = all attributes determined by X

Computing X⁺:
  Start with X
  Find FDs where left side ⊆ current set
  Add right sides to set
  Repeat until no change

1NF (First Normal Form):
  Atomic values — no repeating groups or arrays
  Every cell must have a single value

2NF (Second Normal Form):
  1NF + No partial dependencies
  Every non-key attribute depends on the WHOLE primary key
  Only relevant when PK is composite

  Violation example:
    (student_id, course_id) → (grade, student_name)
    student_name depends only on student_id (partial)

3NF (Third Normal Form):
  2NF + No transitive dependencies
  Non-key attributes must not depend on other non-key attributes

  Violation example:
    emp_id → dept_id → dept_name
    dept_name transitively depends on emp_id through dept_id

BCNF (Boyce-Codd NF):
  For every non-trivial FD X → Y, X must be a superkey
  Stronger than 3NF, may lose FD preservation

  Example of 3NF but not BCNF:
    R(A, B, C), FDs: AB → C, C → A
    AB is candidate key, CB is candidate key
    C → A: C is not superkey → not BCNF

4NF:
  No multi-valued dependencies

Lossless decomposition: R1 ⋈ R2 = R (can reconstruct original)
Dependency preservation: All FDs preserved in decompositions
```

## Transactions & ACID

```
Transaction: Sequence of operations as a single logical unit

ACID Properties:
  Atomicity:   All or nothing — commit or rollback
  Consistency: DB moves from valid to valid state
  Isolation:   Concurrent transactions don't interfere
  Durability:  Committed changes survive failures

Transaction states:
  Active → Partially Committed → Committed
  Active → Failed → Aborted

Concurrency anomalies:
  Dirty Read:         Read uncommitted data that gets rolled back
  Non-Repeatable Read: Same query returns different data within transaction
  Phantom Read:       New rows appear that match query criteria

Isolation levels (SQL standard):
  READ UNCOMMITTED: Allows dirty reads, fastest
  READ COMMITTED:   No dirty reads (default PostgreSQL, Oracle)
  REPEATABLE READ:  No dirty/non-repeatable (default MySQL)
  SERIALIZABLE:     No anomalies, slowest

Serializability:
  Serial schedule: Transactions run one after another
  Serializable: Equivalent to some serial schedule

Conflict Serializability (GATE topic):
  Two operations conflict if: same data item, different transactions, one is write
  Build precedence graph: Ti → Tj if Ti's operation conflicts before Tj's
  No cycle = conflict serializable

Lock-based protocols:
  2PL (Two-Phase Locking):
    Growing phase: acquire locks only
    Shrinking phase: release locks only
    Guarantees serializability
    
  Strict 2PL: Hold all exclusive locks until commit
    Prevents cascading rollbacks

  Shared lock (S): Multiple readers allowed
  Exclusive lock (X): Only one writer
  
  Upgrade: S → X only in growing phase
```

## Indexing

```
Why index? Speeds up reads at cost of write performance

B-Tree Index:
  Balanced tree structure
  Supports: equality, range, ORDER BY, prefix queries
  Good for: most general purpose queries

B+ Tree (most databases use this):
  All data in leaves (connected as linked list)
  Internal nodes are only keys for navigation
  Range queries: find start leaf, scan right

Hash Index:
  Hash function maps key → bucket
  Only equality: WHERE id = 5
  Cannot do ranges: WHERE salary > 50000

Index types:
  Primary index: On ordered file, on primary key (clustered)
  Secondary index: On non-ordering field, dense
  Clustered: Data rows stored in index order (only one per table)
  Non-clustered: Index separate from data (many per table)

GATE calculation: Find number of disk accesses
  Dense index: One entry per record
  Sparse index: One entry per block
  If records per block = 10, total = 1000 records
  Sparse index entries = 100 (1 per block)
  Dense index entries = 1000
```
