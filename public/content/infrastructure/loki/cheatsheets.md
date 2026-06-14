# Loki — Cheatsheet

```logql
-- ── LOG STREAM SELECTORS ──────────────────────────────────
{job="nginx"}
{service="api", env="prod"}
{namespace="production", container="api"}
{service=~"api|worker"}          -- Regex: matches api OR worker
{service!="health-checker"}      -- NOT equal

-- ── LOG PIPELINE FILTERS ──────────────────────────────────
{service="api"} |= "error"               -- Contains
{service="api"} != "debug"               -- Does not contain
{service="api"} |~ "error|exception"     -- Regex match
{service="api"} !~ "healthcheck|ping"    -- Regex NOT match

-- ── PARSERS ───────────────────────────────────────────────
{service="api"} | json                   -- Parse JSON
{service="api"} | logfmt                 -- Parse key=value
{service="api"} | pattern "<method> <path> <status>"  -- Pattern
{service="api"} | regexp "(?P<status>\d{3})"          -- Regex extract

-- ── FILTER ON PARSED FIELDS ───────────────────────────────
{service="api"} | json | status >= 500
{service="api"} | json | method="POST" | duration > 1000
{service="api"} | json | level="error" | user_id="12345"

-- ── FORMAT OUTPUT ─────────────────────────────────────────
{service="api"} | json | line_format "{{.method}} {{.path}} {{.status}}"
{service="api"} | json | label_format status_code=status

-- ── METRIC QUERIES ────────────────────────────────────────
-- Error rate per second
rate({service="api"} |= "error" [5m])

-- Log volume by service
sum by (service) (rate({env="prod"}[5m]))

-- P99 latency from JSON logs
quantile_over_time(0.99, {service="api"} | json | unwrap duration [5m])

-- Count unique users (approx)
approx_topk(10, {service="api"} | json | unwrap user_id [1h])

-- ── USEFUL SHORTCUTS ──────────────────────────────────────
-- Last 100 errors
{env="prod"} |= "ERROR" | json | limit 100

-- Recent logs from a pod
{pod="api-abc-123"}

-- Logs around a specific time (use Grafana time picker)
-- Or in LogCLI: --from=2024-01-15T10:00:00Z --to=2024-01-15T10:30:00Z
```

```bash
# ── LOGCLI (command line) ─────────────────────────────────
logcli --addr=http://localhost:3100 query '{job="nginx"}' --limit=100
logcli --addr=http://localhost:3100 labels
logcli --addr=http://localhost:3100 labels service
logcli --addr=http://localhost:3100 series '{job="nginx"}'

# ── LOKI API ──────────────────────────────────────────────
curl "http://localhost:3100/loki/api/v1/labels"
curl "http://localhost:3100/loki/api/v1/label/service/values"
curl "http://localhost:3100/ready"
curl "http://localhost:3100/metrics"
```
