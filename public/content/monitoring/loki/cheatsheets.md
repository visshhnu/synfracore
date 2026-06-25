# Loki Cheatsheet

## LogQL Quick Reference

```logql
# Stream selectors
{job="nginx"}
{job="api", env="prod"}
{namespace=~"prod|staging"}        # regex match
{service!="healthcheck"}           # not equal

# Line filters
|= "text"          # contains
!= "text"          # not contains
|~ "regex"         # regex match
!~ "regex"         # regex not match

# Parsers
| json
| logfmt
| pattern `<method> <path> <status>`
| regexp `(?P<level>[A-Z]+)`
| unpack                           # extract packed Promtail labels

# Label filters (after parsing)
| level="error"
| status_code >= 500
| duration > 1s                    # duration type
| size > 10mb                      # bytes type

# Line formatting
| line_format "{{.level}} - {{.message}}"
| label_format level=severity      # rename label

# Metric functions
rate({job="api"}[5m])
count_over_time({job="api"}[1h])
bytes_rate({job="nginx"}[5m])
bytes_over_time({job="nginx"}[1h])

# Unwrapped range aggregations
sum(rate({job="api"} | json | unwrap duration [5m])) by (service)
quantile_over_time(0.99, {job="api"} | json | unwrap latency [5m]) by (endpoint)
```

## Promtail Commands
```bash
# Test config
promtail --config.file=config.yaml --dry-run

# Check targets
curl http://localhost:9080/targets

# Current positions
cat /tmp/positions.yaml
```

## Loki API
```bash
# Push logs
POST /loki/api/v1/push

# Query
GET /loki/api/v1/query?query={job="nginx"}&limit=100

# Query range
GET /loki/api/v1/query_range?query={job="nginx"}&start=<ns>&end=<ns>

# Labels
GET /loki/api/v1/labels
GET /loki/api/v1/label/{name}/values

# Series
GET /loki/api/v1/series?match[]={job="nginx"}

# Tail (streaming)
GET /loki/api/v1/tail?query={job="nginx"}
```

## Label Cardinality Rules
```
Good labels (low cardinality):
  env: prod, staging, dev
  service: api, worker, db
  namespace: production, monitoring
  level: INFO, WARN, ERROR

Bad labels (high cardinality — use structured metadata):
  trace_id, request_id, user_id, pod_uid

Rule: if unique values > 1000, use structured metadata
```

## logcli — Loki CLI
```bash
# Install
go install github.com/grafana/loki/cmd/logcli@latest

# Configure
export LOKI_ADDR=http://localhost:3100

# Query
logcli query '{job="nginx"}' --limit=100 --since=1h

# Labels
logcli labels
logcli labels job

# Stream
logcli query '{job="api"}' --tail
```

## Grafana LogQL Quick Actions
- Live tail: toggle at top-right in Explore
- Stats: see line count, bytes below query
- Dedupe: toggle to collapse identical lines
- Prettify: format JSON log lines
- Copy link: share current query + time range
