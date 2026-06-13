# DBMS — Interview Questions

**Explain the difference between DBMS and RDBMS.**
DBMS (Database Management System) is software to store and retrieve data — it includes hierarchical DBs (IMS), network DBs, document DBs (MongoDB), and relational DBs. RDBMS (Relational DBMS) specifically stores data in tables with rows and columns, supports SQL, enforces relationships via foreign keys, and guarantees ACID properties. Examples: PostgreSQL, MySQL, Oracle. Key RDBMS features: tables, primary/foreign keys, joins, referential integrity. All RDBMS are DBMS but not all DBMS are RDBMS.

**What is the difference between primary key, unique key, and foreign key?**
Primary key: uniquely identifies each row, cannot be NULL, one per table, creates a clustered index by default. Unique key: ensures uniqueness in a column (or columns), CAN be NULL (typically one NULL allowed), multiple per table. Foreign key: references the primary key of another table, enforces referential integrity (can't insert a value that doesn't exist in the parent table, can't delete a parent row if children exist). Primary and unique keys prevent duplicate data; foreign keys maintain relationships between tables.

**What is indexing and what are the types?**
An index is a data structure (usually B-tree) that speeds up data retrieval at the cost of additional storage and slower writes. Without an index, the DB scans every row (O(n)). With an index, lookup is O(log n). Types: Clustered index — physically orders table rows by the index key (one per table, usually primary key). Non-clustered index — separate structure pointing to row locations (multiple per table). Composite index — on multiple columns (leftmost prefix rule applies). Covering index — includes all columns needed by a query (no table lookup). Partial index — on a subset of rows. Full-text index — for text search.

**Explain joins and when to use each type.**
INNER JOIN returns only rows with matching values in both tables — unmatched rows from either table are excluded. LEFT JOIN returns all rows from the left table, with NULL for right table columns when no match exists. RIGHT JOIN is the mirror. FULL OUTER JOIN returns all rows from both tables. CROSS JOIN returns the Cartesian product (every combination). SELF JOIN joins a table with itself (e.g., employee-manager hierarchy). Use INNER for "must have a match"; LEFT when you want all records even without a match.

**What is a stored procedure vs a function?**
Both are precompiled SQL code stored in the database. Functions: must return a value, can be used in SELECT statements, cannot use transactions, designed for computation. Stored procedures: may or may not return values, cannot be used in SELECT, can contain transaction control (BEGIN/COMMIT), can modify data, execute with EXECUTE/CALL. Stored procedures are used for complex business logic, batch operations, and maintaining data integrity. Functions are used for reusable calculations in queries.
