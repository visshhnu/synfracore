# Grafana Cheatsheet

## Keyboard Shortcuts
```
d z       — zoom out time range
Ctrl+Z    — zoom in
g h       — go to home dashboard
g p       — go to profile
Ctrl+S    — save dashboard
e         — expand panel
p i       — panel info
p e       — edit panel
p s       — panel share
```

## PromQL Quick Reference
```promql
# Rates
rate(metric[5m])                    # per-second rate over 5m
irate(metric[5m])                   # instant rate (last 2 samples)
increase(metric[1h])                # total increase over 1h

# Aggregations
sum(metric) by (label)
avg(metric) without (instance)
max(metric) by (job)
topk(5, metric)                     # top 5 values
bottomk(3, metric)

# Percentiles (histograms)
histogram_quantile(0.95, rate(duration_bucket[5m]))

# Offset comparison
metric - metric offset 1d           # vs yesterday

# Absent/missing data
absent(up{job="api"})              # fires if metric missing
```

## Template Variables
```
$__timeFilter()    — time range as SQL WHERE clause
$__interval        — auto-calculated interval
$__from / $__to   — time range as epoch ms
$__rate_interval   — recommended for rate() queries
${var:csv}         — variable as comma-separated values
${var:regex}       — variable as regex OR
${var:pipe}        — variable as pipe-separated
```

## URL Parameters
```
?from=now-1h&to=now              — set time range
?var-namespace=prod              — set template variable
?orgId=1&kiosk=true             — kiosk mode (no nav)
?refresh=30s                    — auto-refresh
?panelId=5&fullscreen=true      — single panel
```

## Grafana API
```bash
# Get dashboards
curl -H "Authorization: Bearer $TOKEN"   https://grafana.example.com/api/search?type=dash-db

# Export dashboard
curl -H "Authorization: Bearer $TOKEN"   https://grafana.example.com/api/dashboards/uid/abc123

# Snapshot
curl -X POST -H "Authorization: Bearer $TOKEN"   -d '{"dashboard": {...}, "expires": 3600}'   https://grafana.example.com/api/snapshots

# Annotations
curl -X POST -H "Authorization: Bearer $TOKEN"   -H "Content-Type: application/json"   -d '{"text":"Deployed v1.2","tags":["deploy"]}'   https://grafana.example.com/api/annotations
```

## Alert Labels and Annotations
```yaml
labels:
  severity: critical          # used for routing
  team: platform             # ownership
  env: prod                  # environment

annotations:
  summary: "{{ $labels.service }} error rate high"
  description: "Error rate: {{ $value | humanizePercentage }}"
  runbook_url: "https://wiki/runbooks/high-error-rate"
```

## Data Source UIDs (for provisioning)
```yaml
# Find UID: Settings → Data Sources → click source → check URL /datasources/edit/<uid>
datasource: Prometheus    uid: "prometheus"
datasource: Loki          uid: "loki"
datasource: Tempo         uid: "tempo"
datasource: Pyroscope     uid: "pyroscope"
```
