# Datadog — Certification

## Free certification paths

Datadog offers a set of free, self-paced learning paths via `learn.datadoghq.com` — each ends in an assessment and a badge/certificate, and none of them cost anything, which makes this one of the lower-friction ways to put a recognizable name on a resume for observability experience:

| Path | Focus | Cost |
|---|---|---|
| Datadog Fundamentals | Agent, metrics, dashboards | Free |
| Log Management | Ingestion, processing, analysis | Free |
| APM & Distributed Tracing | Traces, services, profiling | Free |
| Kubernetes Monitoring | K8s metrics, events, NPM | Free |
| Infrastructure Monitoring | Hosts, containers, cloud | Free |

Each path is a sequence of short modules followed by a graded assessment — completing all modules in a path and passing its assessment earns the badge for that path specifically; there's no single "Datadog Certified" credential covering everything, so pick the path (or paths) that actually match the role being interviewed for rather than trying to complete all five.

## Agent configuration — what the exam actually tests

The core config lives at `/etc/datadog-agent/datadog.yaml` on a host-based install:

```yaml
# /etc/datadog-agent/datadog.yaml
api_key: <YOUR_API_KEY>
site: datadoghq.com       # or datadoghq.eu for EU-region accounts

# Tags applied to every metric/log/trace originating from this host
tags:
  - env:production
  - team:backend
  - service:api-gateway

logs_enabled: true

apm_config:
  enabled: true
  env: production
```

Integration-specific config lives separately, one file per integration, under `conf.d/`:

```yaml
# /etc/datadog-agent/conf.d/nginx.d/conf.yaml
init_config:

instances:
  - nginx_status_url: http://localhost/nginx_status

logs:
  - type: file
    path: /var/log/nginx/access.log
    service: nginx
    source: nginx
    tags:
      - env:production
```

The Agent CLI commands worth knowing cold — these come up both on the assessment and in real day-one debugging:

```bash
systemctl start|stop|restart datadog-agent

datadog-agent status               # Full status: every check, pass/fail, last run
datadog-agent check nginx          # Run one integration's check immediately, see raw output
datadog-agent diagnose             # Connectivity diagnostics — is the Agent reaching Datadog at all
datadog-agent flare                # Bundle logs/config and send to Datadog Support for a ticket
```

## Monitor types — the full set

The certification paths test all seven Monitor types, not just the basic threshold alert — knowing which type fits which scenario is the actual skill being assessed, not memorizing the list:

```
THRESHOLD   Alert when metric > N for M minutes
            Use: CPU > 80% for 5 min | Error count > 100 in 10 min

CHANGE      Alert on a sudden rate-of-change, not an absolute value
            Use: Traffic drops > 50% compared to the same time last hour

ANOMALY     ML-derived baseline from historical pattern; alert on deviation from it
            Use: API latency suddenly higher than what's normal for this time of day

FORECAST    Predicts a future threshold breach from the current trend
            Use: Disk will fill within the next 4 hours at current growth rate

OUTLIER     Alert when one host/pod diverges from its peer group's behavior
            Use: One DB replica serving 10x the query volume of its siblings

COMPOSITE   Combines multiple monitors with AND/OR logic into one alert
            Use: Only page when CPU > 80% AND Memory > 90% simultaneously

SLO         Alerts on error-budget burn rate, not a raw metric threshold
            Use: 99.9% target, ~43 min/30-day budget — alert when burning too fast to last the window
```

COMPOSITE and SLO monitors are the two most commonly under-used in practice — most teams stop at THRESHOLD and never revisit, which produces more noisy pages than necessary for conditions that only actually matter in combination.

## APM instrumentation reference

```python
from ddtrace import patch_all, tracer
patch_all()  # Auto-instruments Flask, Django, SQLAlchemy, Redis, and other supported libraries

# Custom spans for logic auto-instrumentation doesn't cover
with tracer.trace('myapp.process_order', service='order-service') as span:
    span.set_tag('order.id', order_id)
    span.set_tag('customer.tier', customer.tier)
    process_order(order_id)

# Service identity set via environment variables at process start
# DD_SERVICE=api-gateway DD_ENV=production DD_VERSION=1.2.0 python app.py
```

`DD_VERSION` matters more than it looks — it's what lets Datadog show you a deploy marker on every dashboard and correlate a spike in errors or latency directly with a specific release, rather than just "sometime this week."

## Log management pipeline

```
Ingest → Parse (Grok / JSON / CSV) → Enrich (GeoIP, lookup tables) → Filter → Index / Archive
```

Parsed logs produce structured **attributes** — `@timestamp`, `status`, `http.method`, `http.url`, `http.status_code`, `network.client.ip`, `duration`, `error.message`, `service`, `env` — and any attribute can be promoted to a **facet**, which is what makes it filterable/groupable in Log Explorer rather than only searchable as raw text.

**Log-based metrics** turn a log query into a first-class numeric metric — count of HTTP 5xx per service per minute, for example — which is meaningfully cheaper than indexing and retaining every matching raw log line just to later count them.

Standard retention is 15 days online; anything needed for compliance or long-term investigation goes to **Archives** (S3 or equivalent), which can be rehydrated back into a searchable state on demand when an old incident needs re-investigating.

## Quick reference

```
COLLECTION
  500+ pre-built Agent integrations (nginx, postgres, AWS, Kubernetes, etc.)
  DogStatsD: custom app metrics — counter / gauge / histogram / timing
  Cloud integrations: pull metrics directly from AWS CloudWatch, GCP, Azure

MONITORS
  threshold | change | anomaly | forecast | outlier | composite | SLO

APM
  ddtrace-family libraries auto-instrument popular frameworks
  Flame graphs, service maps, error tracking, continuous profiler
  Correlates traces → logs → metrics via shared trace/span IDs

LOGS
  Pipeline: parse (Grok) → enrich → filter → index/archive
  Facets: indexed attributes, used for filtering/grouping in Log Explorer

DASHBOARDS
  Drag-and-drop widgets, template variables (same underlying concept as Grafana variables)
```
