# Grafana — Revision Notes

Condensed reference for quick review. Consolidated from this course's overview, interview, and certification material across the merged content set.

---

## Core Concepts

```
GRAFANA: visualization + alerting layer. STORES NO DATA ITSELF — every
  panel is a live query against an external data source.
Grafana vs Prometheus: Prometheus collects/stores/alerts on metrics.
  Grafana visualizes Prometheus (and 100+ other sources). Each works
  independently; together = industry-standard observability stack.

Data sources: Prometheus (metrics) | Loki (logs) | Tempo (traces) |
  Mimir (long-term, multi-tenant Prometheus-compatible storage) |
  Elasticsearch/OpenSearch | CloudWatch | Azure Monitor | InfluxDB |
  PostgreSQL/MySQL

LGTM STACK: Loki + Grafana + Tempo + Mimir — Grafana's own fully
  open-source observability stack, all four cross-correlated.
```

## Panel Types

```
Time series  — line/area chart over time (CPU, requests, latency)
Stat         — single big number, current value
Gauge        — dial/bar, value vs threshold (utilization %)
Bar chart    — category comparison
Table        — tabular, sortable data
Logs         — log stream (Loki/Elasticsearch)
Traces       — trace viewer (Tempo/Jaeger)
Heatmap      — distribution over time (latency buckets)
Geomap       — geographic distribution
Node graph   — service dependency visualization
State timeline — state transitions over time
```

## PromQL for Dashboards — Verified Patterns

```
Rates:        rate(x[5m]) per-second | irate(x[5m]) instant (last 2 samples)
              | increase(x[1h]) total over window
Aggregation:  sum(x) by (label) | avg(x) without (instance) | topk(5,x) | bottomk(3,x)
Percentiles:  histogram_quantile(0.95, sum(rate(x_bucket[5m])) by (le, label))
              — MUST keep "le" in the by() clause, or the quantile breaks
Comparison:   metric - metric offset 1d   (vs yesterday, same time)
Missing data: absent(up{job="api"})        (fires if metric missing entirely)

Golden Signals:
  Latency:    histogram_quantile(0.95, rate(duration_bucket[5m]))
  Traffic:    sum(rate(http_requests_total[5m])) by (method, route)
  Errors:     sum(rate(http_requests_total{status=~"5.."}[5m])) / sum(rate(http_requests_total[5m]))
  Saturation: 100 - (avg by (instance)(rate(node_cpu_seconds_total{mode="idle"}[5m])) * 100)

Apdex (clever cumulative-bucket trick, verified correct):
  (bucket(le="0.3") + bucket(le="1.2")) / 2 / total
  → mathematically equals (satisfied + tolerating/2) / total because
    histogram buckets are CUMULATIVE (bucket(1.2) already includes
    everything ≤0.3), so averaging the two cumulative counts produces
    exactly the standard Apdex numerator.
```

## LogQL (Loki) — CORRECTED

```
{namespace="prod", pod=~"api-.*"} |= "ERROR"      # filter by content
{app="api"} | json | level="error"                 # parse JSON, filter
sum(rate({namespace="prod"} |= "ERROR" [5m])) by (pod)   # metric from logs

CORRECTED: computing a percentile from an unwrapped numeric field requires
quantile_over_time — a bare "p99 by (...)" is NOT valid LogQL syntax
(found as an error in one source file; the correct form was already used
correctly elsewhere in the same content, inconsistent with itself):
  {app="api"} | json | unwrap duration_ms | quantile_over_time(0.99, [5m]) by (endpoint)
```

## Variables (Template Variables)

```
Type Query:    populated dynamically from data source, e.g.
               label_values(kube_pod_info, namespace) — stays in sync
               with what actually exists right now
Type Custom:   static hardcoded list (dev,staging,prod) — use when the
               list is fixed and won't change
Type Interval: time interval selector (1m,5m,10m,30m,1h)
Type Textbox:  free-form input
Type Datasource: switch between data sources entirely

Chained variables: $pod depends on $namespace via
  label_values(kube_pod_info{namespace=~"$namespace"}, pod)

Syntax in queries: $var | ${var} | ${var:csv} | ${var:regex} | ${var:pipe}
Multi-value + Include All: use =~ (regex match) in queries, not = 
```

## Alerting

```
Unified Alerting — CORRECTED, resolves an internal inconsistency across
source files: introduced in BETA with Grafana 8 (2021), became the
DEFAULT alerting system with Grafana 9 (2022). "Since v8" and "since v9"
are both defensible depending on whether "introduced" or "became
default" is meant — this isn't a contradiction once the nuance is clear.

Alert rule = Query + Condition (threshold/no-data/error) + Pending
  period (`for:`) + Labels (for routing)
`for: 5m` — condition must be CONTINUOUSLY true for the full duration
  before Pending → Firing. Deliberate design to prevent brief-spike
  noise, at the cost of very-short-lived real issues potentially not
  firing at all.

Notification policies: tree structure, root = default/fallback, child
  policies match on labels (severity, team), MOST-SPECIFIC MATCH WINS.
Contact points: Slack, PagerDuty, OpsGenie, email, webhook, Teams
Silences: suppress alerts during planned maintenance windows
Inhibition rules: suppress lower-severity alerts when a higher-severity
  one is already firing for the same service (don't page for pod-level
  issues when the whole cluster is already known down)

Grafana Alerting vs Prometheus Alertmanager: Grafana can alert on ANY
  data source (Loki, SQL, CloudWatch — not just Prometheus-compatible);
  Alertmanager is more mature, common in existing Prometheus-only shops.
  Neither is universally "better" — depends on whether alerting needs
  span multiple non-Prometheus source types.
```

## Cardinality — Real Production Risk, Not Theoretical

```
Each unique combination of label values = a SEPARATE stored time series.
Adding a label with unbounded/very-large cardinality (user_id, raw IP,
full request path) multiplies total series count — degrades Prometheus
memory AND query performance across EVERY dashboard querying that
metric, not just the panel that added the label. See this course's Real
World Scenarios for a full worked example of exactly this failure mode.

Fix: keep high-cardinality, per-request detail in LOGS (Loki) or TRACES
(Tempo), correlated back to metrics via EXEMPLARS — not as metric labels.
Monitor Prometheus's own series count as a first-class metric to catch
a cardinality explosion immediately, not days later via degraded dashboards.
```

## Dashboards as Code / Provisioning

```
Provisioning (YAML, at startup):
  /etc/grafana/provisioning/datasources/*.yaml — data source configs
  /etc/grafana/provisioning/dashboards/*.yaml  — dashboard JSON file providers
Terraform grafana provider: grafana_dashboard, grafana_alert_rule resources
Grafonnet/Jsonnet: programmatic dashboard generation → JSON → import

WHY IT MATTERS: version-controlled, reproducible, reviewable via PR,
  no manual UI clicks, no config drift. Manual UI edits alongside
  provisioning-managed dashboards WILL silently get overwritten on the
  next re-provisioning/redeploy — pick a clear convention (UI = quick
  prototyping only; anything meant to persist gets exported to JSON
  and committed) rather than letting the two paths diverge silently.

Secrets in provisioning: use secureJsonData (encrypted at rest, never
  returned in plaintext), NOT jsonData (plain config) — a common,
  avoidable mistake especially when provisioning files are in Git.
```

## RBAC / Administration

```
Organizations: full tenant isolation (separate dashboards/users/data sources)
Roles: Admin > Editor > Viewer
Teams: group users, assign folder/dashboard permissions
Folders: organize dashboards, primary unit for team-based access control
Service accounts: for CI/CD and provisioning — NOT personal accounts
```

## High Availability

```
Requires PostgreSQL/MySQL (NOT SQLite) for shared dashboard/session/
  alert state across multiple Grafana instances behind a load balancer.
Redis: session caching + live queries.
Session affinity NOT needed at the LB — Grafana HA mode + shared
  Postgres/Redis handles this itself.
All instances need the SAME secret key for cookie encryption.

IMPORTANT (see this course's Real World Scenarios): don't run your
observability infrastructure in the SAME failure domain as what it
monitors — Grafana/Prometheus going down alongside the infrastructure
they're supposed to help you debug is a well-documented real incident
pattern, not theoretical.
```

## Keyboard Shortcuts — VERIFIED against Grafana's own docs

```
Ctrl+S save | Ctrl+K command palette | f search | d s settings |
d e expand rows | d k kiosk mode | Esc exit

CORRECTED: Ctrl+Z = ZOOM OUT (Cmd+Z on Mac) — NOT "undo," NOT "zoom in."
Two source files in this content set each had this shortcut wrong,
disagreeing with each other; verified the actual behavior directly
against Grafana/AWS Managed Grafana documentation.
t+ / t- : zoom in half / zoom out double (newer alternate shortcuts)
Panel-focused (hover first): e edit | v fullscreen | ps share |
pd duplicate | pr remove | pl legend
```

## Certifications

```
Grafana Certified Associate: MCQ + practical, 70% passing.
  Domains: data sources & connection | PromQL/LogQL queries | dashboard
  creation | alerting | administration.
Free study resources: Grafana Fundamentals (grafana.com/tutorials),
  Play Grafana (play.grafana.org — live sandbox, no setup needed).
```

## Common Failure Modes Worth Remembering

```
"No data" panel: check the QUERY first (test in Explore), THEN the
  time range — connection succeeding doesn't mean a specific query
  will return results.
Dashboard panel and alert rule showing DIFFERENT results for what's
  meant to be the same signal: they're almost certainly built from two
  DIFFERENT underlying queries that drifted apart — define the query
  once (a shared recording rule) and reference it from both places.
Imported community dashboard shows broken/empty panels: it assumes
  specific metric/label names from a specific scrape setup
  (kube-state-metrics + node-exporter + cAdvisor, commonly) — check the
  dashboard's own documented requirements before assuming universal fit.
```
