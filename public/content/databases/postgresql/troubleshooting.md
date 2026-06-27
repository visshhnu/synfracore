# PostgreSQL Troubleshooting Guide

## Issue 1: Slow queries — query taking minutes instead of milliseconds

**Symptom:** Application latency spikes. Specific queries timeout. `pg_stat_activity` shows long-running queries.

**Debug steps:**
```sql
-- Find slow queries currently running
SELECT pid, now() - query_start AS duration, state, query
FROM pg_stat_activity
WHERE state != 'idle'
ORDER BY duration DESC;

-- Find slowest queries historically (requires pg_stat_statements extension)
SELECT query, calls, total_time/calls AS avg_ms,
       rows/calls AS avg_rows
FROM pg_stat_statements
ORDER BY avg_ms DESC LIMIT 20;

-- Check query plan
EXPLAIN (ANALYZE, BUFFERS) SELECT * FROM orders WHERE customer_id = 123;
```

**Fix:**
```sql
-- Add missing index
CREATE INDEX CONCURRENTLY idx_orders_customer_id ON orders(customer_id);

-- Identify sequential scans on large tables
SELECT schemaname, tablename, seq_scan, seq_tup_read,
       idx_scan, idx_tup_fetch
FROM pg_stat_user_tables
ORDER BY seq_scan DESC;

-- Update statistics if planner using bad plan
ANALYZE orders;
SET random_page_cost = 1.1;  -- for SSDs (default 4.0 is for spinning disk)
```

**Prevention:** Enable `pg_stat_statements`. Set `log_min_duration_statement = 1000` (log queries > 1s). Run `VACUUM ANALYZE` regularly.

---

## Issue 2: Lock contention — queries waiting for locks

**Symptom:** Queries queue up. `pg_stat_activity` shows `state = 'idle in transaction'` or `wait_event_type = 'Lock'`.

**Debug steps:**
```sql
-- See all lock waits
SELECT blocked.pid, blocked.query AS blocked_query,
       blocking.pid AS blocking_pid, blocking.query AS blocking_query
FROM pg_stat_activity AS blocked
JOIN pg_stat_activity AS blocking
  ON blocking.pid = ANY(pg_blocking_pids(blocked.pid))
WHERE blocked.wait_event_type = 'Lock';

-- Find long-running idle-in-transaction sessions
SELECT pid, now() - state_change AS idle_duration, query
FROM pg_stat_activity
WHERE state = 'idle in transaction'
AND now() - state_change > interval '5 minutes';
```

**Fix:**
```sql
-- Terminate blocking session
SELECT pg_terminate_backend(blocking_pid);

-- Set statement timeout to prevent runaway queries
ALTER DATABASE mydb SET statement_timeout = '30s';
ALTER ROLE myapp SET idle_in_transaction_session_timeout = '60s';
```

**Prevention:** Always close transactions promptly. Use `NOWAIT` or `SKIP LOCKED` for queue patterns. Enable `deadlock_timeout = 1s` and log deadlocks.

---

## Issue 3: Connection pool exhaustion

**Symptom:** `FATAL: remaining connection slots are reserved for non-replication superuser`. Application errors.

**Debug steps:**
```sql
-- Check current connections
SELECT count(*), state, wait_event_type
FROM pg_stat_activity
GROUP BY state, wait_event_type;

-- Check max_connections setting
SHOW max_connections;

-- See connections by application
SELECT application_name, count(*)
FROM pg_stat_activity
GROUP BY application_name ORDER BY count DESC;
```

**Fix:**
```bash
# Immediate: terminate idle connections
psql -c "SELECT pg_terminate_backend(pid) FROM pg_stat_activity
  WHERE state = 'idle' AND now() - state_change > interval '10 minutes';"

# Proper fix: use PgBouncer connection pooler in front of PostgreSQL
# PgBouncer manages a pool of real connections, apps connect to PgBouncer
```

```ini
# postgresql.conf
max_connections = 200         # base; use 100-200 for most setups
# PgBouncer handles 1000+ app connections mapping to 100 real connections
```

---

## Issue 4: Disk full — PostgreSQL cannot write WAL

**Symptom:** `PANIC: could not write to file "pg_wal/..."` in logs. PostgreSQL shuts down.

**Debug steps:**
```bash
df -h /var/lib/postgresql   # check disk usage
du -sh /var/lib/postgresql/data/pg_wal/   # WAL size

# Check if pg_wal is accumulating (replication slot not consumed)
psql -c "SELECT slot_name, pg_size_pretty(pg_wal_lsn_diff(pg_current_wal_lsn(), restart_lsn)) AS lag FROM pg_replication_slots;"
```

**Fix:**
```bash
# Drop stuck replication slot (if replica is gone permanently)
psql -c "SELECT pg_drop_replication_slot('replica_slot_name');"

# Increase WAL disk allocation
# Set wal_keep_size = 512MB in postgresql.conf (instead of keeping forever)

# Long term: extend disk or move pg_wal to separate volume
```

---

## Issue 5: Replication lag — replica falling behind

**Symptom:** Read replica serves stale data. `pg_stat_replication` shows increasing lag.

**Debug steps:**
```sql
-- On primary: check lag for each replica
SELECT client_addr, state,
       pg_size_pretty(pg_wal_lsn_diff(pg_current_wal_lsn(), sent_lsn)) AS sending_lag,
       pg_size_pretty(pg_wal_lsn_diff(sent_lsn, flush_lsn)) AS receiving_lag,
       pg_size_pretty(pg_wal_lsn_diff(flush_lsn, replay_lsn)) AS replay_lag
FROM pg_stat_replication;
```

**Fix:**
```ini
# Optimize replica for speed
max_standby_streaming_delay = 30s   # allow queries to be cancelled if blocking replay
recovery_min_apply_delay = 0        # don't add artificial delay
wal_receiver_timeout = 60s

# On primary: reduce wal_level if logical decoding not needed
wal_level = replica  # instead of logical (less WAL generated)
```

**Prevention:** Alert when replica lag > 30 seconds. Use `synchronous_commit = off` on replica for read scaling. Monitor with `pg_stat_replication` continuously.
