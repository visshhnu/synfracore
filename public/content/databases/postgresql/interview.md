# PostgreSQL — Interview Questions

**What is the difference between WHERE and HAVING?**
WHERE filters individual rows before grouping occurs. HAVING filters groups after GROUP BY aggregation. You cannot use aggregate functions (SUM, COUNT, AVG) in WHERE — those belong in HAVING. Example: `WHERE salary > 50000` filters employees before counting; `HAVING COUNT(*) > 5` filters departments that have more than 5 employees after counting.

**Explain ACID properties in PostgreSQL.**
Atomicity: Every statement in a transaction either all succeeds or all fails — no partial commits. Implemented via WAL (Write-Ahead Log). Consistency: Data always transitions from one valid state to another, respecting constraints. Isolation: Concurrent transactions don't interfere — PostgreSQL defaults to READ COMMITTED isolation. Durability: Once committed, changes survive crashes — achieved through WAL and checkpointing. PostgreSQL is one of the strongest ACID-compliant databases available.

**What is MVCC and how does PostgreSQL implement it?**
MVCC (Multi-Version Concurrency Control) allows readers to not block writers and writers to not block readers. Instead of locking rows for reads, PostgreSQL keeps multiple versions of each row — each transaction sees a consistent snapshot of data as it existed when the transaction started. Old row versions are kept until no active transaction needs them, then removed by VACUUM. The system columns `xmin` (transaction that created the row) and `xmax` (transaction that deleted it) implement this. This is why PostgreSQL needs regular VACUUM to reclaim dead tuples.

**What is the N+1 query problem?**
When fetching a list of N records and then making one additional query per record to get related data — resulting in N+1 total queries. Example: fetch 100 users (1 query), then for each user fetch their orders (100 queries) = 101 queries. Fix with JOIN or eager loading: one query with JOIN brings all data. In ORMs, use `include`/`eager_load`/`select_related`. In raw SQL, always think about whether you can JOIN instead of querying in a loop.

**When would you use a partial index?**
When you frequently query a subset of rows. `CREATE INDEX idx_orders_pending ON orders(user_id) WHERE status = 'pending'` only indexes pending orders. If 95% of orders are completed and 5% pending, a partial index on pending orders is 20x smaller — fits in memory, queries are faster, inserts/updates are cheaper. Other uses: indexing non-null values only (`WHERE email IS NOT NULL`), indexing recently active records (`WHERE created_at > '2024-01-01'`).

**What is connection pooling and why is it critical for PostgreSQL?**
PostgreSQL creates a new OS process per connection (not a thread) — each costs 5-10MB RAM and significant CPU to establish. Without pooling, a web app with 1000 concurrent users would need 1000 database processes. PgBouncer sits between app and PostgreSQL, maintaining a small pool (e.g., 20 connections) and multiplexing thousands of app connections through them. Transaction pooling is most efficient — connection reused after each transaction. This is why PostgreSQL deployments always need PgBouncer or RDS Proxy in production.

**Explain the difference between TRUNCATE and DELETE.**
DELETE removes rows one at a time, fires row-level triggers, can be rolled back within a transaction, respects WHERE clause, and updates table statistics slowly. TRUNCATE removes all rows at once, doesn't fire row-level triggers, resets sequences, is faster (logs minimal data), but cannot have a WHERE clause. In PostgreSQL 8.4+, TRUNCATE can be rolled back inside a transaction. Use TRUNCATE when you need to clear an entire table quickly; DELETE when you need WHERE filtering or trigger execution.
