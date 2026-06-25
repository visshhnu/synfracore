# DBMS Interview Questions

## Fundamentals

**Q: What is the difference between DELETE, TRUNCATE, and DROP?**
- DELETE: DML, removes rows with WHERE filter, can rollback, slow (row by row), fires triggers.
- TRUNCATE: DDL, removes all rows, faster (deallocates pages), usually can't rollback, resets auto-increment.
- DROP: DDL, removes the entire table structure and data.

**Q: What are ACID properties?**
Atomicity (all-or-nothing), Consistency (valid state transitions), Isolation (concurrent transactions don't interfere), Durability (committed data survives crashes).

**Q: Difference between Primary Key and Unique Key?**
Primary key: cannot be NULL, only one per table, clustered index by default.
Unique key: can have one NULL (in most DBs), multiple per table, non-clustered index.

**Q: What is a foreign key? What happens with ON DELETE CASCADE?**
Foreign key enforces referential integrity. ON DELETE CASCADE automatically deletes child rows when parent is deleted.

## Normalization

**Q: What is 3NF vs BCNF?**
3NF: no transitive dependencies (non-key attribute depends on non-key attribute).
BCNF: every determinant must be a candidate key. BCNF is stricter; sometimes 3NF is preferred to preserve FDs.

**Q: When would you denormalize?**
For read-heavy workloads where joins are expensive. Trade write overhead for faster reads. Common in data warehouses (star/snowflake schemas).

## Indexing

**Q: How does a B+ Tree index work?**
Data is stored in sorted order in leaf nodes, with internal nodes as index. Supports O(log n) search, range queries. Leaf nodes linked for sequential access.

**Q: What is a covering index?**
An index that includes all columns a query needs — the query can be answered entirely from the index without accessing the main table.

**Q: When would you NOT use an index?**
- Small tables (full scan faster)
- High-cardinality boolean columns
- Frequently updated columns
- Queries returning >20-30% of rows

## Transactions

**Q: What is a deadlock and how is it resolved?**
Two transactions each hold a lock the other needs. DBMS detects the cycle and aborts one transaction (victim selection by lowest cost/most recent).

**Q: What is phantom read?**
Transaction re-executes a range query and gets different rows because another transaction inserted/deleted rows in that range. Prevented by SERIALIZABLE isolation.

**Q: What is dirty read?**
Reading uncommitted changes from another transaction. Prevented by READ COMMITTED or higher isolation.

## Performance

**Q: How would you optimize a slow query?**
1. Use EXPLAIN to see execution plan
2. Check for full table scans
3. Add appropriate indexes
4. Rewrite subqueries as JOINs
5. Use covering indexes
6. Partition large tables
7. Update statistics

**Q: What is connection pooling?**
Reusing database connections instead of creating new ones for each request. Reduces connection overhead. Examples: PgBouncer, HikariCP.

## Advanced

**Q: Difference between OLTP and OLAP?**
OLTP: Many short transactions, normalized, row-store, high concurrency.
OLAP: Complex analytical queries over large data, denormalized, column-store, batch processing.

**Q: What is CAP theorem?**
Distributed systems can guarantee at most 2 of: Consistency, Availability, Partition Tolerance. CA (RDBMS), CP (MongoDB), AP (Cassandra).

**Q: Explain MVCC.**
Multi-Version Concurrency Control: multiple versions of a row exist simultaneously. Readers get a consistent snapshot, writers don't block readers. Used in PostgreSQL, MySQL InnoDB.
