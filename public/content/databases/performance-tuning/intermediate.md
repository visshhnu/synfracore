# Database Performance Tuning — Intermediate

## Composite indexes: column order is not arbitrary

A composite (multi-column) index is only useful for queries that filter on a **left-to-right prefix** of its columns — this is the single most misunderstood detail of composite indexing, and getting column order wrong silently makes an index far less useful than it appears:

```sql
CREATE INDEX idx_orders_customer_status ON orders(customer_id, status);

-- Uses the index — filters on customer_id, a left prefix
SELECT * FROM orders WHERE customer_id = 42;
SELECT * FROM orders WHERE customer_id = 42 AND status = 'shipped';

-- Does NOT use this index effectively — status alone isn't a left prefix
SELECT * FROM orders WHERE status = 'shipped';
```
The practical rule: put the column used in equality filters (`=`) and with the highest selectivity (fewest matching rows per value) first, and range-filtered columns (`>`, `<`, `BETWEEN`) last — a range condition on a non-final column effectively stops the index from being useful for anything after it in the column order, since the B-tree can no longer maintain a useful sorted position past a range condition.

## Covering indexes: avoiding the table lookup entirely

A normal index scan still requires a second step — looking up the actual row in the table (a "heap fetch") to retrieve columns not in the index itself. A **covering index** includes every column the query needs, letting the database satisfy the entire query from the index alone:

```sql
-- A query that needs customer_id, status, and total
SELECT customer_id, status, total FROM orders WHERE customer_id = 42;

-- A covering index — INCLUDE adds columns without making them part of the sort key
CREATE INDEX idx_orders_covering ON orders(customer_id) INCLUDE (status, total);
```
```
Index Only Scan using idx_orders_covering on orders
```
`Index Only Scan` (versus `Index Scan`) in the plan output confirms the heap fetch was avoided entirely — a genuinely significant speedup for read-heavy queries against wide tables, at the cost of a larger index (since it now stores more data per entry) — worth reserving for genuinely hot, frequently-run queries rather than applied to every index by default.

## Table partitioning: when a single table becomes the actual bottleneck

Once a table grows large enough that even indexed queries and routine maintenance (VACUUM, index rebuilds) become slow simply due to table size, partitioning splits it into smaller physical pieces while keeping one logical table for queries:

```sql
-- Partition orders by month — a very common pattern for time-series data
CREATE TABLE orders (
    order_id BIGINT,
    created_at TIMESTAMP NOT NULL,
    customer_id INT,
    total NUMERIC
) PARTITION BY RANGE (created_at);

CREATE TABLE orders_2026_07 PARTITION OF orders
    FOR VALUES FROM ('2026-07-01') TO ('2026-08-01');
```
The real performance benefit is **partition pruning** — a query filtering on `created_at` within a specific month only scans that one partition, not the entire multi-year table, and maintenance operations (VACUUM, reindexing) can run per-partition rather than against the full table at once. This is worth reaching for specifically once a table is large enough that even a well-indexed query's performance is being limited by overall table/index size rather than the index's own efficiency — introducing it prematurely, on a table that isn't actually large enough to need it, adds real complexity (every query needs to consider partition boundaries) without a corresponding benefit yet.

## Replication lag: the read-scaling tradeoff that isn't free

Read replicas are a standard way to scale read throughput beyond a single primary — but replication is asynchronous by default in most setups, meaning a read from a replica can return **stale** data, reflecting the database's state slightly before the current moment:

```
Write to primary → replicated to replica (typically milliseconds, but not guaranteed)
                                              ↓
                          A read from the replica immediately after
                          the write may not see it yet
```
This becomes a real, user-visible bug in a specific common pattern: a user submits a form (write to primary), the application immediately redirects to a page that reads from a replica, and the just-submitted data appears missing because replication hasn't caught up yet. The fix isn't avoiding read replicas — it's routing reads that must reflect a just-completed write back to the primary (or to the same connection/session that performed the write), while genuinely read-heavy, staleness-tolerant traffic (a dashboard, an analytics view) uses replicas freely.

## Query caching: what it actually buys you, and its real limitation

```python
# Application-level query result caching
import redis
cache = redis.Redis()

def get_top_products():
    cached = cache.get("top_products")
    if cached:
        return json.loads(cached)
    result = db.execute("SELECT ... expensive aggregation ...")
    cache.set("top_products", json.dumps(result), ex=300)  # 5-minute TTL
    return result
```
Caching is most valuable for expensive, frequently-repeated queries whose result changes relatively infrequently relative to how often it's requested — a homepage "top products" query recomputed on every single page load, when the underlying data only meaningfully changes every few minutes, is a strong caching candidate. The real limitation worth being explicit about: caching introduces staleness by design (the same tradeoff as replication lag, but deliberately controlled via TTL), and caching a query whose result needs to be immediately consistent with the latest write (an account balance, an inventory count at checkout) can introduce real correctness bugs if applied without carefully considering that specific query's actual freshness requirement.
