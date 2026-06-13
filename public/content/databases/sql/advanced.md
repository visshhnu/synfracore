# SQL — Advanced

## Advanced PostgreSQL Features

```sql
-- LATERAL join — correlated subquery in FROM clause
SELECT u.id, u.name, recent.last_order_date, recent.total
FROM users u
CROSS JOIN LATERAL (
    SELECT created_at AS last_order_date, total
    FROM orders
    WHERE user_id = u.id
    ORDER BY created_at DESC
    LIMIT 1
) recent
WHERE recent.last_order_date > NOW() - INTERVAL '90 days';

-- FILTER clause — conditional aggregation
SELECT
    COUNT(*)                                     AS total,
    COUNT(*) FILTER (WHERE status = 'paid')      AS paid,
    COUNT(*) FILTER (WHERE status = 'refunded')  AS refunded,
    SUM(total) FILTER (WHERE status = 'paid')    AS paid_revenue,
    AVG(total) FILTER (WHERE region = 'APAC')    AS apac_avg
FROM orders
WHERE created_at >= '2024-01-01';

-- JSONB queries for semi-structured data
SELECT
    id,
    metadata->>'plan' AS subscription_plan,
    (metadata->'features')::jsonb ? 'advanced_analytics' AS has_analytics,
    jsonb_array_length(metadata->'integrations') AS integration_count
FROM users
WHERE metadata @> '{"status": "active"}'
  AND (metadata->>'mrr')::numeric > 1000;

-- Update JSONB
UPDATE users
SET metadata = jsonb_set(metadata, '{last_login}', to_jsonb(NOW()::text))
WHERE id = $1;

-- Append to JSONB array
UPDATE users
SET metadata = jsonb_set(
    metadata,
    '{tags}',
    (metadata->'tags') || '["enterprise"]'::jsonb
)
WHERE id = $1;
```

## Database Design Patterns

```sql
-- Soft delete pattern
ALTER TABLE users ADD COLUMN deleted_at TIMESTAMPTZ;
CREATE INDEX idx_users_not_deleted ON users(id) WHERE deleted_at IS NULL;

-- Always filter: WHERE deleted_at IS NULL
-- Or use a view:
CREATE VIEW active_users AS
    SELECT * FROM users WHERE deleted_at IS NULL;

-- Audit trail pattern
CREATE TABLE users_audit (
    id          BIGSERIAL PRIMARY KEY,
    user_id     UUID NOT NULL,
    action      TEXT NOT NULL,  -- 'INSERT', 'UPDATE', 'DELETE'
    changed_by  UUID,
    changed_at  TIMESTAMPTZ DEFAULT NOW(),
    old_values  JSONB,
    new_values  JSONB
);

CREATE OR REPLACE FUNCTION audit_users() RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO users_audit (user_id, action, old_values, new_values)
    VALUES (
        COALESCE(NEW.id, OLD.id),
        TG_OP,
        CASE WHEN TG_OP = 'INSERT' THEN NULL ELSE row_to_json(OLD) END,
        CASE WHEN TG_OP = 'DELETE' THEN NULL ELSE row_to_json(NEW) END
    );
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER users_audit_trigger
AFTER INSERT OR UPDATE OR DELETE ON users
FOR EACH ROW EXECUTE FUNCTION audit_users();

-- Event sourcing with SQL
CREATE TABLE events (
    id          BIGSERIAL PRIMARY KEY,
    stream_id   UUID NOT NULL,  -- e.g., order ID
    version     INT  NOT NULL,
    event_type  TEXT NOT NULL,
    payload     JSONB NOT NULL,
    created_at  TIMESTAMPTZ DEFAULT NOW(),
    UNIQUE(stream_id, version)  -- No gaps, no duplicates
);

-- Rebuild current state from events
SELECT DISTINCT ON (stream_id)
    stream_id,
    payload AS current_state
FROM events
WHERE event_type = 'OrderUpdated'
ORDER BY stream_id, version DESC;
```

## SQL Cheatsheet

```sql
-- ── SELECT ───────────────────────────────────────────────
SELECT * FROM t;
SELECT DISTINCT col FROM t;
SELECT col AS alias FROM t;
SELECT COUNT(*), SUM(n), AVG(n), MIN(n), MAX(n) FROM t;
SELECT col, COUNT(*) FROM t GROUP BY col HAVING COUNT(*) > 5;
SELECT * FROM t ORDER BY col DESC NULLS LAST;
SELECT * FROM t LIMIT 20 OFFSET 40;

-- ── FILTERING ─────────────────────────────────────────────
WHERE col = 'val'
WHERE col != 'val'
WHERE col IN ('a','b','c')
WHERE col NOT IN (SELECT id FROM other)
WHERE col BETWEEN 10 AND 100
WHERE col IS NULL
WHERE col IS NOT NULL
WHERE col LIKE 'prefix%'
WHERE col ILIKE '%substr%'
WHERE col::text ~ 'regex'

-- ── JOINS ─────────────────────────────────────────────────
FROM a INNER JOIN b ON a.id = b.a_id
FROM a LEFT JOIN b ON a.id = b.a_id
FROM a RIGHT JOIN b ON a.id = b.a_id
FROM a FULL OUTER JOIN b ON a.id = b.a_id
FROM a CROSS JOIN b               -- Cartesian product
FROM a, b WHERE a.id = b.a_id    -- Old syntax (avoid)

-- ── MODIFY ────────────────────────────────────────────────
INSERT INTO t (c1,c2) VALUES (v1,v2);
INSERT INTO t (c1,c2) VALUES (v1,v2) ON CONFLICT (c1) DO UPDATE SET c2 = EXCLUDED.c2;
INSERT INTO t SELECT * FROM other_t WHERE condition;
UPDATE t SET col = val WHERE condition;
UPDATE t SET col = val FROM other WHERE t.id = other.t_id;
DELETE FROM t WHERE condition;
TRUNCATE t;
TRUNCATE t RESTART IDENTITY CASCADE;

-- ── DDL ───────────────────────────────────────────────────
CREATE TABLE t (id BIGSERIAL PRIMARY KEY, name TEXT NOT NULL);
ALTER TABLE t ADD COLUMN email TEXT;
ALTER TABLE t DROP COLUMN email;
ALTER TABLE t RENAME COLUMN old TO new;
CREATE INDEX idx_name ON t(col);
CREATE UNIQUE INDEX idx_uniq ON t(col);
DROP TABLE t;
DROP TABLE IF EXISTS t CASCADE;
```
