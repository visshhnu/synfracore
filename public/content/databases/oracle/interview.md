# Oracle Database — Interview Questions

**What is the difference between DELETE, TRUNCATE, and DROP?**
DELETE is DML — removes rows based on a WHERE condition, can be rolled back, fires triggers, logs each row deletion (slow for large datasets), table structure remains. TRUNCATE is DDL — removes ALL rows, cannot be rolled back (in Oracle, truncate is auto-committed), doesn't fire row-level triggers, much faster (just deallocates extents), table structure remains. DROP is DDL — removes the entire table including structure, constraints, and indexes. Cannot be easily rolled back (though Oracle's Recycle Bin may allow FLASHBACK TABLE).

**What is PL/SQL and why is it used?**
PL/SQL (Procedural Language/SQL) is Oracle's proprietary procedural extension to SQL. It adds: variables, loops, conditionals, exceptions, procedures, functions, packages, triggers, and cursors. Benefits: reduces network round trips (multiple SQL statements in one call), business logic close to data, packages provide modularization, precompilation improves performance. Used for: complex business rules, batch processing, data validation triggers, ETL procedures, and encapsulating logic that multiple applications share.

**What is a sequence in Oracle?**
A sequence is a database object that generates unique sequential numbers. `CREATE SEQUENCE emp_seq START WITH 1 INCREMENT BY 1 NOCACHE;` Usage: `INSERT INTO employees VALUES(emp_seq.NEXTVAL, 'Alice');`. Key properties: NEXTVAL gets next value (irreversible), CURRVAL gets current value (within session), CACHE caches values in memory for performance, NOCYCLE/CYCLE controls what happens after MAXVALUE. Unlike MySQL's AUTO_INCREMENT, Oracle sequences are separate objects that can be shared across tables.

**Explain Oracle's ROWID and ROWNUM.**
ROWID is a physical address for each row in the database — it encodes the file number, block number, and row slot. Fastest way to access a single row. Used internally by indexes. ROWNUM is a pseudo-column assigned to each row AS it's returned by a query — before ORDER BY. Common mistake: `WHERE ROWNUM <= 10 ORDER BY salary` — this limits to first 10 rows THEN sorts (wrong). Correct pagination: use subquery or ROW_NUMBER() analytic function. Oracle 12c+ introduced `FETCH FIRST n ROWS ONLY` for proper top-N queries.

**What is Oracle RAC and why is it used?**
RAC (Real Application Clusters) allows multiple servers to access a single Oracle database simultaneously. Each node has its own SGA (memory) but all share the same physical disk storage. Uses Cache Fusion technology to synchronize memory between nodes. Benefits: high availability (one node fails, others continue), horizontal scalability (add nodes for more capacity), rolling upgrades (patch one node at a time). Used for: mission-critical applications requiring zero downtime and very high transaction volumes. Common in banking, telecom, and airline reservation systems.
