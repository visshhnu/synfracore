# Oracle Database — Portfolio Projects

Build these projects to demonstrate real skills to employers. Each project is designed to be interview-worthy — something you can walk through in detail.

## Project 1: Oracle Schema Design with PL/SQL Business Logic

**Level:** Beginner-Intermediate | **Time:** 2-3 days

Design and implement a real-world schema (an order-management or HR system works well) using Oracle-specific constructs, not just generic SQL — sequences, `%TYPE`/`%ROWTYPE`, and at least one stored procedure enforcing business logic the database itself guarantees.

### Steps

1. Design the entity-relationship diagram first, then implement it with Oracle-appropriate data types (`VARCHAR2`, `NUMBER(p,s)`, `DATE`/`TIMESTAMP`)
2. Add constraints (`NOT NULL`, `UNIQUE`, `CHECK`, `FOREIGN KEY`) and at least one sequence for a primary key
3. Write a stored procedure that performs a real multi-step operation (e.g. a funds transfer or order placement) with proper `EXCEPTION` handling (`NO_DATA_FOUND`, `OTHERS`)
4. Write 8-10 queries exercising Oracle-specific features: analytic functions (`RANK`, `DENSE_RANK`), a hierarchical `CONNECT BY` query if your domain has any tree/org structure, and `DECODE` or `CASE` logic
5. Run `EXPLAIN PLAN` on your queries and document what you see

### Skills Demonstrated

- Oracle-specific schema design (sequences, `%TYPE`, PL/SQL constraints)
- Stored procedure design with real exception handling
- Reading `EXPLAIN PLAN` output

### GitHub Repo Name

`oracle-schema-plsql-project`

---

## Project 2: Query Performance Investigation with EXPLAIN PLAN and Hints

**Level:** Intermediate | **Time:** 2-3 days

Take a schema with a meaningful data volume, find genuinely slow queries, and fix them with evidence — not guesses.

### Steps

1. Load a realistic volume of test data (hundreds of thousands of rows, not a handful)
2. Write a handful of realistic queries and run `EXPLAIN PLAN FOR ...` followed by `SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY(FORMAT => 'ALLSTATS LAST'))` on each
3. Identify at least one query doing a `TABLE ACCESS FULL` that should be using an index, add the appropriate index, and confirm the plan changes to an `INDEX RANGE SCAN`
4. Run `EXEC DBMS_STATS.GATHER_TABLE_STATS(...)` and document a case where stale statistics were causing the optimizer to choose a worse plan
5. Try at least one optimizer hint (`/*+ INDEX(...) */` or `/*+ USE_HASH(...) */`) and document when it actually helped versus when the optimizer's own default choice was already correct

### Skills Demonstrated

- Reading and acting on `EXPLAIN PLAN`/`DBMS_XPLAN` output
- Evidence-based indexing (not guesswork)
- Understanding when optimizer hints are (and aren't) the right tool

### GitHub Repo Name

`oracle-performance-investigation`

---

## Project 3: Partitioned Table with Hierarchical and Analytic Queries

**Level:** Advanced | **Time:** 3-4 days

Build something that specifically exercises Oracle's less-portable, more distinctive feature set — the parts of Oracle that don't look like generic SQL.

### Steps

1. Design a range-partitioned table for time-series-style data (e.g. sales or transaction history, partitioned by date) and confirm partition pruning actually happens via `EXPLAIN PLAN` (look for `PARTITION RANGE SINGLE`, not a scan across all partitions)
2. Build a hierarchical dataset (an org chart, a category tree, a bill-of-materials) and write `CONNECT BY PRIOR` queries to traverse it, including at least one query using `ORDER SIBLINGS BY`
3. Write a report query combining several analytic functions in one `SELECT` (`RANK`, `SUM() OVER (PARTITION BY ...)`, `LAG`/`LEAD`) against your partitioned data
4. Document, in your README, one case where you'd choose Oracle's `CONNECT BY` over a portable `WITH RECURSIVE` CTE, and why (or vice versa) — this is a genuinely common design decision if your target role ever needs cross-engine portability

### Skills Demonstrated

- Partitioning strategy and confirming partition pruning with real evidence
- Hierarchical query design (`CONNECT BY`), an Oracle-distinctive skill
- Combining multiple analytic functions in realistic reporting queries

### GitHub Repo Name

`oracle-partitioning-hierarchy-project`

---

## Tips for Great Oracle Projects

**Lean into what's actually Oracle-specific.** A schema and set of joins that would look identical on PostgreSQL or MySQL doesn't demonstrate Oracle expertise — analytic functions, `CONNECT BY`, PL/SQL packages, and partitioning are the parts of these projects that actually show you know this specific engine.

**Show the `EXPLAIN PLAN`/`DBMS_XPLAN` output, not just the final indexes.** "I added this index" is far less convincing than "here's the plan before, showing `TABLE ACCESS FULL`, and after, showing `INDEX RANGE SCAN`."

**Use current connection-pooling terminology if you cover it.** Oracle's own connection pooling tools are UCP (Universal Connection Pool) and DRCP (Database Resident Connection Pooling) — PgBouncer and ProxySQL are PostgreSQL- and MySQL-specific respectively and don't apply to Oracle.

## Portfolio Checklist

- [ ] At least one project uses an Oracle-distinctive feature (analytic functions, `CONNECT BY`, partitioning, or a PL/SQL package) as a central piece, not an afterthought
- [ ] At least one project includes real `EXPLAIN PLAN`/`DBMS_XPLAN` evidence for an indexing decision
- [ ] Each README explains the reasoning, not just the final schema/query
- [ ] You can walk through any of these projects for 5+ minutes without notes
