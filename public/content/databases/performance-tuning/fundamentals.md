# Database Performance Tuning — Fundamentals

## What an index actually is, and why it's not free

An index is a separate, ordered data structure (a B-tree, in the common case) that lets the database find rows matching a condition without scanning every row in the table — the same reason a book's index lets you find a topic without reading every page. The tradeoff that makes index strategy an actual decision, not just "add indexes everywhere": every index has to be updated on every `INSERT`/`UPDATE`/`DELETE` that touches an indexed column, so more indexes mean faster reads but genuinely slower writes, plus real additional storage. A table with 15 indexes optimized for every possible query pattern will have meaningfully slower write throughput than the same table with 3 well-chosen indexes covering its actual real query patterns — index strategy is a deliberate tradeoff, not a "more is always better" decision.

## Reading a basic query plan

```sql
EXPLAIN ANALYZE
SELECT * FROM orders WHERE customer_id = 42;
```
```
Seq Scan on orders  (cost=0.00..2500.00 rows=5 width=120) (actual time=0.02..45.3 rows=5 loops=1)
  Filter: (customer_id = 42)
  Rows Removed by Filter: 99995
```
`Seq Scan` means the database read every single row in the table and filtered afterward — for a table with 100,000 rows to find 5 matching ones, that's the exact signal that an index on `customer_id` is missing. After adding one:
```sql
CREATE INDEX idx_orders_customer ON orders(customer_id);
```
```
Index Scan using idx_orders_customer on orders  (cost=0.29..8.31 rows=5 width=120) (actual time=0.01..0.02 rows=5 loops=1)
  Index Cond: (customer_id = 42)
```
The cost estimate and actual execution time both drop dramatically — this before/after comparison is the core habit of performance tuning: measure with `EXPLAIN ANALYZE`, change one thing, measure again, and confirm the change actually helped rather than assuming it did.

## Connection pooling: why "just open more connections" doesn't scale

Every database connection consumes real server-side memory and resources, independent of whether it's actively running a query — a database configured for `max_connections = 200` genuinely cannot serve a 201st simultaneous connection, and an application that opens a new raw connection per request rather than reusing a pool will exhaust that limit far faster than the actual query workload would justify:

```python
# Without pooling — a new connection per request, wasteful and eventually exhausting
def get_data():
    conn = psycopg2.connect(DATABASE_URL)  # new connection every call
    ...

# With pooling — connections are reused, not recreated
from psycopg2.pool import SimpleConnectionPool
pool = SimpleConnectionPool(minconn=5, maxconn=20, dsn=DATABASE_URL)

def get_data():
    conn = pool.getconn()
    try:
        ...
    finally:
        pool.putconn(conn)
```
At real application scale, a dedicated pooler (PgBouncer for PostgreSQL) sitting between the application and database is the standard solution — it maintains a smaller pool of actual database connections and multiplexes many more application-level connection requests across them, since most connections spend the vast majority of their time idle between queries, not actively executing anything.

## The N+1 query problem: the most common real-world performance bug

```python
# BAD — 1 query for orders, then N additional queries, one per order
orders = session.query(Order).all()
for order in orders:
    print(order.customer.name)   # triggers a separate query per order

# GOOD — eager loading, 2 queries total regardless of order count
orders = session.query(Order).options(joinedload(Order.customer)).all()
for order in orders:
    print(order.customer.name)   # already loaded, no extra query
```
This is specifically an application-layer problem, not a database-layer one — the database itself executes each individual query efficiently, but the application is issuing far more queries than necessary, and the resulting latency is the sum of many round-trips rather than one well-formed query. N+1 is the single most common real performance bug across web applications precisely because it's invisible in development (a test dataset of 5 orders produces 5 extra queries, unnoticeable) and becomes a severe, user-visible problem only once real data volume makes N large — a table with 10,000 orders producing 10,001 queries on one page load.

## The tuning hierarchy: where to actually start

```
1. Schema design       — hardest to change later; get this right upfront
2. Query optimization  — EXPLAIN ANALYZE first, always
3. Index strategy      — usually the most impactful quick win
4. Configuration       — memory, connections, autovacuum settings
5. Hardware/infra      — the last resort, not the first instinct
```
The ordering matters as much as the list itself: reaching for "we need a bigger database instance" before checking whether a missing index or an N+1 query is the actual cause is a common, expensive mistake — hardware scaling can mask a real inefficiency for a while, at real ongoing cost, without ever fixing the underlying problem, which then resurfaces at the next growth threshold anyway.
