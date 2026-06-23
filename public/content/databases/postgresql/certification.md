# PostgreSQL Certification Guide

## Certifications Available

| Cert | Provider | Cost | Format |
|------|----------|------|--------|
| **EDB Postgres Associate** | EDB | $200 | MCQ |
| **EDB Postgres Professional** | EDB | $400 | MCQ + practical |
| **PostgreSQL CE (community)** | Various | Varies | MCQ |

EDB (EnterpriseDB) is the primary commercial training and certification provider for PostgreSQL.

---

## Core Topics

```sql
-- UPSERT (ON CONFLICT)
INSERT INTO users (email, name) VALUES ('a@b.com', 'Alice')
  ON CONFLICT (email) DO UPDATE SET name = EXCLUDED.name;

-- RETURNING — get generated values after write
INSERT INTO orders (user_id, amount) VALUES (1, 99.99)
  RETURNING id, created_at;

-- JSONB
SELECT data->>'name' FROM products;
SELECT * FROM products WHERE data @> '{"active": true}';
UPDATE products SET data = data || '{"sale": true}';
CREATE INDEX idx_json ON products USING GIN (data);

-- ARRAYS
SELECT ARRAY[1,2,3] || ARRAY[4,5];
SELECT * FROM users WHERE 'admin' = ANY(roles);
SELECT array_agg(name ORDER BY name) FROM users;

-- WINDOW FUNCTIONS
SELECT name, salary,
  RANK() OVER (PARTITION BY dept ORDER BY salary DESC),
  SUM(salary) OVER (PARTITION BY dept) AS dept_total,
  LAG(salary) OVER (ORDER BY hire_date) AS prev_salary
FROM employees;

-- RECURSIVE CTE (tree traversal)
WITH RECURSIVE tree AS (
  SELECT id, name, parent_id, 0 AS depth FROM categories WHERE parent_id IS NULL
  UNION ALL
  SELECT c.id, c.name, c.parent_id, t.depth + 1
  FROM categories c JOIN tree t ON c.parent_id = t.id
)
SELECT * FROM tree ORDER BY depth, name;

-- PARTIAL INDEX (only index rows matching condition)
CREATE INDEX idx_active ON users(email) WHERE active = true;

-- EXPRESSION INDEX
CREATE INDEX idx_lower_email ON users(lower(email));

-- CONCURRENT INDEX (no table lock — safe on production)
CREATE INDEX CONCURRENTLY idx_big ON big_table(user_id);
```

```bash
# psql quick reference
# \l    list databases   \dt   list tables
# \d t  describe table   \di   list indexes
# \timing  show exec time  \x   expanded output

# Backup and restore
pg_dump -Fc mydb > backup.dump
pg_restore -d mydb backup.dump

# Performance
EXPLAIN ANALYZE SELECT * FROM orders WHERE user_id = 123;
-- Seq Scan (add an index) | Index Scan (good) | Index Only Scan (best)

SELECT query, calls, mean_exec_time
FROM pg_stat_statements ORDER BY mean_exec_time DESC LIMIT 10;

VACUUM ANALYZE orders;   -- reclaim dead rows + update planner statistics
```

---

## Study Resources

- **PostgreSQL Tutorial** (postgresqltutorial.com) — free, comprehensive
- **PostgreSQL Docs** (postgresql.org/docs) — authoritative official reference
- **pgexercises.com** — interactive SQL practice exercises
- **EDB Academy** (edbacademy.com) — certification preparation courses

## Revision Notes
```
POSTGRESQL STRENGTHS: JSONB | Arrays | Partial/expression indexes | Full ACID | Extensions
ON CONFLICT: atomic upsert  |  RETURNING: get auto-generated IDs and timestamps after DML

INDEXES: B-tree (default) | GIN (JSONB/arrays/full-text) | BRIN (large sequential tables)
MVCC: readers never block writers — multiple row versions coexist in storage
VACUUM: MVCC creates dead rows that need cleaning — never disable autovacuum

REPLICATION: streaming (physical clone) | logical (table-level, works across versions)
PATRONI: de-facto standard HA solution for automatic PostgreSQL failover
PGBOUNCER: connection pooler — transaction mode is most efficient for web apps
```
