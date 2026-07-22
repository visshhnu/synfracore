# Oracle Database — Learning Roadmap

## Estimated Time to Job-Ready
**7-10 weeks** of consistent learning (2-3 hours/day), assuming basic SQL fluency already (this platform's own SQL technology is a genuine prerequisite — Oracle-specific material builds on standard SQL and adds a genuinely large amount of Oracle-only syntax and PL/SQL on top).

## Phase 1: Foundation (Week 1-2)

- Get comfortable with `DUAL`, Oracle's data types (`VARCHAR2`, `NUMBER(p,s)`, `DATE` vs `TIMESTAMP`), and Oracle's NULL-handling functions (`NVL`, `NVL2`, `COALESCE`)
- Sequences (`CREATE SEQUENCE`, `.NEXTVAL`, `.CURRVAL`) — Oracle has no `SERIAL`/`AUTO_INCREMENT` equivalent built into the column definition itself
- Basic transactions: `COMMIT`, `ROLLBACK`, `SAVEPOINT`
- Get a free Oracle Database Express Edition (XE) instance running via Docker, or use Oracle Live SQL in the browser for zero-setup practice

**Checkpoint:** can you explain why `SELECT SYSDATE FROM DUAL;` is written that way instead of just `SELECT SYSDATE;`? (Oracle requires every `SELECT` to have a `FROM` clause; `DUAL` is a real, one-row table that exists purely to satisfy that requirement for expressions that don't need a real table.)

## Phase 2: PL/SQL (Week 3-5)

- Anonymous blocks (`DECLARE`/`BEGIN`/`EXCEPTION`/`END`), and why the `/` after `END;` matters (it tells `SQL*Plus`/`sqlcl` to execute the accumulated block, since a bare `;` alone doesn't trigger execution the way it does for a plain SQL statement)
- Stored procedures and functions, `%TYPE`/`%ROWTYPE` (inheriting a column's or a row's structure rather than hardcoding types that can drift out of sync with the table)
- Cursors — explicit (`OPEN`/`FETCH`/`CLOSE`) and the simpler cursor `FOR` loop
- Exception handling: `NO_DATA_FOUND`, `TOO_MANY_ROWS`, `OTHERS`, and `RAISE_APPLICATION_ERROR` for custom errors
- Complete Portfolio Project 1 (schema design with PL/SQL business logic)

**Checkpoint:** given a `SELECT ... INTO` that might match zero or multiple rows, can you explain what happens in each case and which exception handles it? This distinction (`NO_DATA_FOUND` vs `TOO_MANY_ROWS`) is one of the most commonly tested practical PL/SQL skills in real interviews.

## Phase 3: Performance and Optimizer Reading (Week 6-7)

- `EXPLAIN PLAN` and `DBMS_XPLAN.DISPLAY` — learn to actually read the plan tree, not just run it: `TABLE ACCESS FULL` vs `INDEX RANGE SCAN`/`INDEX UNIQUE SCAN`
- `DBMS_STATS.GATHER_TABLE_STATS` and why stale statistics can cause the optimizer to choose a worse plan even with a perfectly good index available
- Optimizer hints (`/*+ INDEX(...) */`, `/*+ USE_HASH(...) */`, `/*+ PARALLEL(...) */`) — and the judgment of when a hint is actually warranted versus overriding a correct default choice
- Complete Portfolio Project 2 (performance investigation)

**Checkpoint:** can you explain, in your own words, why adding an index doesn't always change a query's plan — what else has to be true (statistics freshness, the optimizer's cost model actually favoring the index over a full scan for that specific data distribution) for the optimizer to actually pick it up?

## Phase 4: Oracle-Distinctive Features and Interview Readiness (Week 8-10)

- Analytic (window) functions — `RANK`, `DENSE_RANK`, `ROW_NUMBER`, `LAG`/`LEAD`, `RATIO_TO_REPORT`
- Hierarchical queries: `START WITH` / `CONNECT BY PRIOR` / `ORDER SIBLINGS BY` — genuinely Oracle-distinctive, and a common thing this course flags because the syntax has no direct equivalent in PostgreSQL/MySQL (those use recursive CTEs instead)
- Partitioning (range, list, hash) and confirming partition pruning actually happens via `EXPLAIN PLAN`
- A conceptual pass over RAC and Data Guard even without hands-on practice — know what problem each solves (RAC: multiple instances sharing storage for HA; Data Guard: a synchronized standby database for DR) even if you never configure a full cluster
- Complete Portfolio Project 3 (partitioning and hierarchical queries) and review this course's Interview Q&A material

## Common Pitfalls Specific to Oracle (Not Generic Study Advice)

- **Forgetting the `/` after a PL/SQL block** — a block that looks syntactically complete but never actually executes is a genuinely common early confusion, since a plain SQL statement only needs a `;`
- **Confusing `ROWNUM` with `ROW_NUMBER()`** — `ROWNUM` is assigned before `ORDER BY` runs in the same query block, so filtering on `ROWNUM` for a "top N by some order" pattern without wrapping the ordered query in a subquery first silently gives you the wrong N rows, not an error
- **Assuming PostgreSQL/MySQL connection-pooling tools apply here** — Oracle's own tools are UCP (Universal Connection Pool) and DRCP (Database Resident Connection Pooling), not PgBouncer or ProxySQL
- **Treating `DECODE` as the modern default** — it's Oracle's older, more limited inline-conditional function; `CASE WHEN` is the standard-SQL, more readable choice for new code, with `DECODE` mostly showing up in legacy codebases you'll need to read, not necessarily write

## Getting Your First Oracle-Heavy Role

1. **Portfolio:** the 3 projects in this course's Projects section, each built around something genuinely Oracle-distinctive (PL/SQL business logic, `CONNECT BY`, partitioning with confirmed pruning) rather than generic SQL that happens to run on Oracle
2. **Resume:** be specific — "diagnosed a full table scan via DBMS_XPLAN and reduced query time from 4s to 40ms with a composite index" is far stronger than "experience with Oracle"
3. **Know the enterprise context:** Oracle roles skew toward larger, often regulated organizations (banking, insurance, government, ERP-heavy enterprises) — familiarity with why an organization might still run Oracle at scale (RAC's HA guarantees, decades of stability, existing ERP/SAP integration) is often as relevant in interviews as raw SQL skill
4. **Certifications, if pursuing one:** see this course's own Certification Guide for the OCA/OCP/OCM path and its current format/pricing caveats
