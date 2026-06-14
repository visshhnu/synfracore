# PostgreSQL -- Portfolio Projects

Three PostgreSQL projects from schema design to analytics to production operations.

---

## Project 1: E-Commerce Schema with Optimized Queries

**Level:** Beginner | **Time:** 2 days | **GitHub:** `postgres-ecommerce-schema`

**What you build:** Complete 8-table e-commerce schema with 50K+ rows of test data and 15 optimized queries covering every common SQL pattern.

### Schema highlights
```sql
CREATE TABLE users (
    id         BIGSERIAL PRIMARY KEY,
    email      TEXT UNIQUE NOT NULL,
    name       TEXT NOT NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE orders (
    id         BIGSERIAL PRIMARY KEY,
    user_id    BIGINT NOT NULL REFERENCES users(id),
    status     TEXT NOT NULL DEFAULT "pending"
               CHECK (status IN ("pending","paid","shipped","delivered","cancelled")),
    total      NUMERIC(12,2) NOT NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- Indexes for query patterns
CREATE INDEX idx_orders_user_id ON orders(user_id);
CREATE INDEX idx_orders_status_created ON orders(status, created_at DESC);
CREATE INDEX idx_products_price ON products(price) WHERE stock > 0;  -- Partial index
```

### Key queries to demonstrate
```sql
-- Customer lifetime value with rank
SELECT u.name,
    COUNT(o.id) AS orders,
    SUM(o.total) AS lifetime_value,
    RANK() OVER (ORDER BY SUM(o.total) DESC) AS rank
FROM users u
LEFT JOIN orders o ON u.id = o.user_id
GROUP BY u.id, u.name
ORDER BY lifetime_value DESC NULLS LAST;

-- Month-over-month growth
WITH monthly AS (
    SELECT DATE_TRUNC("month", created_at) AS month,
           SUM(total) AS revenue
    FROM orders WHERE status != "cancelled"
    GROUP BY 1
)
SELECT month, revenue,
    LAG(revenue) OVER (ORDER BY month) AS prev_month,
    ROUND((revenue - LAG(revenue) OVER (ORDER BY month))
          / LAG(revenue) OVER (ORDER BY month) * 100, 1) AS growth_pct
FROM monthly ORDER BY month;
```

### Steps
1. Write schema with ALL constraints (not just PKs)
2. Generate 50K+ rows with Python Faker
3. Write 15 queries -- at least 5 must use window functions
4. EXPLAIN ANALYZE every query, document execution plans
5. Add indexes for slow queries, measure before/after
6. Write performance report with actual timing numbers

---

## Project 2: TimescaleDB IoT Analytics

**Level:** Intermediate | **Time:** 2 days | **GitHub:** `timescale-iot-analytics`

**What you build:** IoT sensor data pipeline -- ingest 1M data points, query aggregations with continuous aggregates (400x faster than raw queries).

### Setup
```sql
CREATE EXTENSION IF NOT EXISTS timescaledb;

CREATE TABLE sensor_readings (
    time      TIMESTAMPTZ NOT NULL,
    sensor_id INTEGER NOT NULL,
    metric    TEXT NOT NULL,
    value     DOUBLE PRECISION NOT NULL
);

SELECT create_hypertable("sensor_readings", "time",
    chunk_time_interval => INTERVAL "1 day");

-- Continuous aggregate (pre-computed, auto-refreshing)
CREATE MATERIALIZED VIEW hourly_averages
WITH (timescaledb.continuous) AS
SELECT time_bucket("1 hour", time) AS hour,
    sensor_id, metric,
    AVG(value) AS avg_value,
    MAX(value) AS max_value
FROM sensor_readings
GROUP BY 1, 2, 3;
```

### Performance result to document
```
Raw query on 1M rows: ~2000ms
Continuous aggregate: ~5ms
Speedup: 400x
```

### Steps
1. Run TimescaleDB via Docker
2. Create schema and hypertable
3. Load 1M rows with Python COPY command
4. Create continuous aggregate
5. Benchmark: measure raw vs aggregate query time
6. Add data retention policy (keep 1 year)
7. Connect Grafana for visualization

---

## Project 3: High-Availability PostgreSQL with pgBouncer

**Level:** Advanced | **Time:** 3-4 days | **GitHub:** `postgres-ha-setup`

**What you build:** Primary + replica PostgreSQL with automatic failover using Patroni, connection pooling with pgBouncer, and monitoring with pg_stat_statements.

### Docker Compose architecture
```yaml
services:
  postgres-primary:
    image: postgres:16
    environment:
      POSTGRES_REPLICATION_MODE: master
      POSTGRES_REPLICATION_USER: replicator

  postgres-replica:
    image: postgres:16
    environment:
      POSTGRES_REPLICATION_MODE: slave
      POSTGRES_MASTER_HOST: postgres-primary

  pgbouncer:
    image: pgbouncer/pgbouncer
    environment:
      DB_HOST: postgres-primary
      POOL_MODE: transaction
      MAX_CLIENT_CONN: 1000
      DEFAULT_POOL_SIZE: 20
```

### Steps
1. Set up primary + replica with streaming replication
2. Verify replication lag: `SELECT * FROM pg_stat_replication`
3. Install pgBouncer in transaction mode (10x more connections)
4. Enable pg_stat_statements for query performance tracking
5. Simulate primary failure, verify replica promotion
6. Load test: 500 concurrent connections via pgBouncer vs direct

---

## Portfolio Checklist
- [ ] Schema initialized from migration files (Flyway or plain SQL scripts)
- [ ] EXPLAIN ANALYZE output in README for top 5 queries
- [ ] Indexes documented: what was added and measured impact
- [ ] README answers: "Why NUMERIC not FLOAT for prices?"
- [ ] All constraints implemented: NOT NULL, CHECK, UNIQUE, FK
