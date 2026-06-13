# PostgreSQL — Intermediate

## Advanced Indexing

```sql
-- Partial index — only index rows matching a condition
-- Use when you frequently query a subset
CREATE INDEX idx_orders_pending ON orders(user_id)
WHERE status = 'pending';
-- If only 5% of orders are pending, index is 20x smaller

-- Expression index — index a computed value
CREATE INDEX idx_users_email_lower ON users(LOWER(email));
-- Now WHERE LOWER(email) = 'alice@example.com' uses the index

-- Composite index — order matters (leftmost prefix rule)
CREATE INDEX idx_orders_user_status_date ON orders(user_id, status, created_at DESC);
-- Supports: WHERE user_id = $1
-- Supports: WHERE user_id = $1 AND status = 'paid'
-- Supports: WHERE user_id = $1 AND status = 'paid' ORDER BY created_at DESC
-- Does NOT support: WHERE status = 'paid'  (no user_id = first column)

-- Covering index — include extra columns to avoid table lookup
CREATE INDEX idx_orders_user_covering ON orders(user_id)
INCLUDE (status, total, created_at);
-- SELECT status, total, created_at FROM orders WHERE user_id = $1
-- → Pure index scan (no heap access)

-- GIN index for JSONB and arrays
CREATE INDEX idx_users_metadata ON users USING GIN (metadata);
CREATE INDEX idx_posts_tags ON posts USING GIN (tags);

-- Concurrent index build — doesn't lock the table
CREATE INDEX CONCURRENTLY idx_orders_new ON orders(created_at);
```

## Table Partitioning

```sql
-- Range partitioning by date (for time-series data)
CREATE TABLE events (
    id          BIGSERIAL,
    event_type  TEXT,
    payload     JSONB,
    created_at  TIMESTAMPTZ NOT NULL
) PARTITION BY RANGE (created_at);

-- Create monthly partitions
CREATE TABLE events_2024_01
    PARTITION OF events
    FOR VALUES FROM ('2024-01-01') TO ('2024-02-01');

CREATE TABLE events_2024_02
    PARTITION OF events
    FOR VALUES FROM ('2024-02-01') TO ('2024-03-01');

-- Default partition catches everything else
CREATE TABLE events_default
    PARTITION OF events DEFAULT;

-- Indexes on partitioned table → auto-created on each partition
CREATE INDEX ON events(created_at, event_type);

-- Query performance: partition pruning kicks in
SELECT * FROM events
WHERE created_at >= '2024-01-01' AND created_at < '2024-02-01';
-- Only scans events_2024_01 partition!

-- List partitioning (by region, status, etc.)
CREATE TABLE orders_by_region
    PARTITION BY LIST (region);

CREATE TABLE orders_apac PARTITION OF orders_by_region FOR VALUES IN ('IN', 'SG', 'AU');
CREATE TABLE orders_us   PARTITION OF orders_by_region FOR VALUES IN ('US', 'CA');
```

## Transactions and Locking

```sql
-- Explicit transaction
BEGIN;
UPDATE accounts SET balance = balance - 100 WHERE id = 1;
UPDATE accounts SET balance = balance + 100 WHERE id = 2;
-- If any error occurs → ROLLBACK automatically
COMMIT;

-- Savepoints
BEGIN;
UPDATE inventory SET qty = qty - 1 WHERE product_id = 5;
SAVEPOINT after_inventory;

INSERT INTO order_items (order_id, product_id) VALUES (100, 5);
-- If this fails:
ROLLBACK TO SAVEPOINT after_inventory;
-- Inventory update still intact, only order_item rolled back
COMMIT;

-- SELECT FOR UPDATE — lock rows you're about to modify
BEGIN;
SELECT balance FROM accounts WHERE id = 1 FOR UPDATE;
-- Other transactions trying to update account 1 will wait
UPDATE accounts SET balance = balance - 100 WHERE id = 1;
COMMIT;

-- SKIP LOCKED — for job queues (don't wait for locked rows)
SELECT id, payload FROM jobs
WHERE status = 'pending'
ORDER BY created_at
LIMIT 1
FOR UPDATE SKIP LOCKED;
-- Multiple workers can process different jobs concurrently without deadlocks
```

## pgvector — AI/ML Embeddings

```sql
-- Install extension
CREATE EXTENSION vector;

-- Store embeddings (e.g., from OpenAI text-embedding-3-small = 1536 dims)
CREATE TABLE documents (
    id        BIGSERIAL PRIMARY KEY,
    content   TEXT,
    embedding vector(1536)
);

-- Create HNSW index for fast approximate nearest-neighbor search
CREATE INDEX ON documents USING hnsw (embedding vector_cosine_ops)
WITH (m = 16, ef_construction = 64);

-- Semantic search: find most similar documents
SELECT content, 1 - (embedding <=> $1::vector) AS similarity
FROM documents
ORDER BY embedding <=> $1::vector  -- <=> = cosine distance
LIMIT 10;

-- Combined SQL + semantic search
SELECT content, 1 - (embedding <=> $1::vector) AS similarity
FROM documents
WHERE metadata->>'category' = 'devops'    -- SQL filter first
ORDER BY embedding <=> $1::vector          -- Then semantic sort
LIMIT 5;
```
