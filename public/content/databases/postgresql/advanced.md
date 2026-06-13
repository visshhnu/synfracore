# PostgreSQL — Advanced

## Logical Replication

```sql
-- Publisher (source database)
-- postgresql.conf: wal_level = logical
ALTER SYSTEM SET wal_level = 'logical';
SELECT pg_reload_conf();

-- Create publication
CREATE PUBLICATION my_pub FOR TABLE users, orders, products;
-- Or for all tables:
CREATE PUBLICATION all_tables FOR ALL TABLES;

-- Subscriber (target database)
CREATE SUBSCRIPTION my_sub
CONNECTION 'postgresql://user:pass@source:5432/mydb'
PUBLICATION my_pub;

-- Check replication status
SELECT * FROM pg_replication_slots;
SELECT * FROM pg_stat_replication;
SELECT * FROM pg_stat_subscription;

-- Use case: zero-downtime migrations
-- 1. Set up logical replication from old to new DB
-- 2. Let it sync
-- 3. Switch app to new DB (< 1 second downtime)
-- 4. Drop replication
```

## Custom Extensions and Functions

```sql
-- Stored procedures
CREATE OR REPLACE PROCEDURE transfer_funds(
    from_account_id UUID,
    to_account_id   UUID,
    amount          NUMERIC
)
LANGUAGE plpgsql AS $$
DECLARE
    from_balance NUMERIC;
BEGIN
    -- Lock both accounts (consistent order to prevent deadlocks)
    SELECT balance INTO from_balance
    FROM accounts
    WHERE id = from_account_id
    FOR UPDATE;

    IF from_balance < amount THEN
        RAISE EXCEPTION 'Insufficient funds: % < %', from_balance, amount;
    END IF;

    UPDATE accounts SET balance = balance - amount WHERE id = from_account_id;
    UPDATE accounts SET balance = balance + amount WHERE id = to_account_id;

    INSERT INTO transactions (from_id, to_id, amount, type)
    VALUES (from_account_id, to_account_id, amount, 'transfer');
END;
$$;

-- Call with transaction wrapping
CALL transfer_funds('uuid-1', 'uuid-2', 100.00);

-- Custom aggregate function
CREATE OR REPLACE FUNCTION median_sfunc(state NUMERIC[], val NUMERIC)
RETURNS NUMERIC[] LANGUAGE plpgsql AS $$
BEGIN
    RETURN array_append(state, val);
END;
$$;

CREATE OR REPLACE FUNCTION median_finalfunc(state NUMERIC[])
RETURNS NUMERIC LANGUAGE plpgsql AS $$
DECLARE
    sorted NUMERIC[];
    n INT;
BEGIN
    sorted := array_agg(x ORDER BY x) FROM unnest(state) x;
    n := array_length(sorted, 1);
    IF n = 0 THEN RETURN NULL; END IF;
    IF n % 2 = 1 THEN RETURN sorted[(n+1)/2]; END IF;
    RETURN (sorted[n/2] + sorted[n/2+1]) / 2;
END;
$$;

CREATE AGGREGATE median(NUMERIC) (
    SFUNC = median_sfunc,
    STYPE = NUMERIC[],
    FINALFUNC = median_finalfunc,
    INITCOND = '{}'
);

SELECT department, median(salary), AVG(salary)
FROM employees
GROUP BY department;
```

## TimescaleDB (Time-Series Extension)

```sql
-- Install TimescaleDB for metrics, IoT, financial data
CREATE EXTENSION IF NOT EXISTS timescaledb;

-- Convert regular table to hypertable
CREATE TABLE metrics (
    time    TIMESTAMPTZ NOT NULL,
    device  TEXT,
    value   DOUBLE PRECISION,
    tags    JSONB
);
SELECT create_hypertable('metrics', 'time');

-- Auto-compression (reduces storage 90-95%)
SELECT add_compression_policy('metrics', INTERVAL '7 days');

-- Continuous aggregate — pre-computed rollups
CREATE MATERIALIZED VIEW metrics_hourly
WITH (timescaledb.continuous) AS
SELECT
    time_bucket('1 hour', time) AS hour,
    device,
    AVG(value) AS avg_val,
    MAX(value) AS max_val,
    MIN(value) AS min_val
FROM metrics
GROUP BY hour, device
WITH NO DATA;

SELECT add_continuous_aggregate_policy('metrics_hourly',
    start_offset => INTERVAL '1 month',
    end_offset   => INTERVAL '1 hour',
    schedule_interval => INTERVAL '1 hour'
);

-- Query spans automatically use the aggregate when possible
SELECT time_bucket('1 hour', time), AVG(value)
FROM metrics
WHERE time > NOW() - INTERVAL '7 days'
GROUP BY 1 ORDER BY 1;
```
