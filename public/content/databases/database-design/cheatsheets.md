# Database Design — Quick Reference

## Normal forms, quick reference

| Form | Rule | Fixes |
|---|---|---|
| 1NF | Atomic values, no repeating groups | Arrays/lists crammed into one column |
| 2NF | 1NF + no partial dependencies | Columns dependent on only part of a composite key |
| 3NF | 2NF + no transitive dependencies | Columns dependent on a non-key column, not the key directly |
| BCNF | Stronger 3NF | Every determinant is a candidate key |

## Constraint syntax quick reference

```sql
-- NOT NULL + foreign key
customer_id INT NOT NULL REFERENCES customers(id) ON DELETE RESTRICT

-- CHECK constraint
status VARCHAR(20) CHECK (status IN ('pending','shipped','delivered'))

-- Composite unique constraint
CONSTRAINT unique_customer_order UNIQUE (customer_id, order_id)

-- Partial unique index (workaround for NULL-handling in UNIQUE, see Troubleshooting)
CREATE UNIQUE INDEX idx_unique_active_email ON users(email) WHERE deleted_at IS NULL;
```

## Index types, quick reference

| Type | Use case |
|---|---|
| B-Tree (default) | Equality and range queries |
| Composite | Multi-column filters — leading column should be highest-selectivity equality condition |
| Partial | Index only a subset of rows (`WHERE status = 'active'`) — smaller, faster for that specific query |
| Covering (`INCLUDE`) | Avoids a table lookup by including extra columns the query needs, directly in the index |
| GIN | JSONB, array, full-text search columns |

## `EXPLAIN ANALYZE` — what to look for

```sql
EXPLAIN ANALYZE SELECT * FROM orders WHERE customer_id = 1;
```

| Plan node | Meaning |
|---|---|
| `Seq Scan` | Full table scan — fine for small tables/large result fractions, a red flag otherwise |
| `Index Scan` | Using an index directly |
| `Index Only Scan` | Index alone satisfies the query, no table lookup needed (covering index) |
| `Bitmap Heap Scan` | Index used to build a bitmap of matching rows first, then fetched |

## CAP theorem, quick reference

| System | CP or AP |
|---|---|
| PostgreSQL, MySQL | CP |
| MongoDB | CP (default config) |
| Cassandra, DynamoDB | AP |
| CouchDB | AP |

## Multi-tenant isolation strategies, quick comparison

| Approach | Isolation | Operational cost |
|---|---|---|
| Shared table + `tenant_id` | Weakest (relies on scoping discipline/RLS) | Lowest |
| Schema-per-tenant | Stronger | Medium — migrations across many schemas |
| Database-per-tenant | Strongest | Highest |

## Partitioning types, quick reference

| Type | Best for |
|---|---|
| Range | Time-series data (date-based) |
| List | Discrete categories (region, tenant) |
| Hash | Even distribution, no natural range/list key |
