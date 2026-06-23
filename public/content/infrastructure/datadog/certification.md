# Datadog Certification Guide

## Certifications Available

Datadog offers **free** certification paths via learn.datadoghq.com:

| Cert | Focus | Cost |
|------|-------|------|
| **Datadog Fundamentals** | Agent, metrics, dashboards | Free |
| **Log Management** | Ingestion, processing, analysis | Free |
| **APM & Distributed Tracing** | Traces, services, profiling | Free |
| **Kubernetes Monitoring** | K8s metrics, events, NPM | Free |
| **Infrastructure Monitoring** | Hosts, containers, cloud | Free |

Complete each learning path → take assessment → earn badge/certificate.

---

## Datadog Agent & Collection

```yaml
# /etc/datadog-agent/datadog.yaml (core config)
api_key: <YOUR_API_KEY>
site: datadoghq.com       # or datadoghq.eu for EU

# Tags applied to all metrics from this host
tags:
  - env:production
  - team:backend
  - service:api-gateway

# Log collection
logs_enabled: true

# APM
apm_config:
  enabled: true
  env: production
```

```yaml
# Integration config (/etc/datadog-agent/conf.d/nginx.d/conf.yaml)
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

```bash
# Agent commands
systemctl start|stop|restart datadog-agent
datadog-agent status               # Check all integrations
datadog-agent check nginx          # Test specific integration
datadog-agent diagnose             # Connection diagnostics
datadog-agent flare                # Send diagnostic bundle to support
```

---

## Metrics, Monitors & Dashboards

```python
# Custom metrics via DogStatsD (application instrumentation)
from datadog import initialize, statsd

initialize(statsd_host='localhost', statsd_port=8125)

# Counter (track events)
statsd.increment('myapp.requests.total', tags=['endpoint:/api', 'method:GET'])

# Gauge (track current value)
statsd.gauge('myapp.queue.size', queue.length(), tags=['queue:orders'])

# Histogram (track distributions — auto-computes p50/p75/p95/p99)
statsd.histogram('myapp.request.duration', elapsed_ms, tags=['endpoint:/api'])

# Timing shortcut
with statsd.timed('myapp.db.query.duration'):
    result = db.execute(query)
```

---

## Monitor Types

```
THRESHOLD: Alert when metric > N for M minutes
  Use: CPU > 80% for 5 min | Error count > 100 in 10 min

CHANGE: Alert on sudden change (rate of change)
  Use: Traffic drop > 50% compared to last hour (traffic spike/drop detection)

ANOMALY: Machine learning baseline, alert on unusual behavior
  Use: API latency suddenly higher than historical norm

FORECAST: Predict metric will breach threshold
  Use: Disk will fill in next 4 hours

OUTLIER: Alert when one host behaves differently from its peers
  Use: One DB replica serving 10x queries of others

COMPOSITE: Combine multiple monitors with AND/OR logic
  Use: CPU > 80% AND Memory > 90% → only alert when both

SLO (Service Level Objective):
  Target: 99.9% uptime | Error budget: 43.8 min/month
  Alert when burning through budget too fast
```

---

## APM & Distributed Tracing

```python
# Instrument Python app for APM (ddtrace)
from ddtrace import patch_all, tracer
patch_all()  # Auto-instrument Flask, Django, SQLAlchemy, Redis, etc.

# Custom spans
with tracer.trace('myapp.process_order', service='order-service') as span:
    span.set_tag('order.id', order_id)
    span.set_tag('customer.tier', customer.tier)
    process_order(order_id)

# Manual instrumentation via env vars
DD_SERVICE=api-gateway DD_ENV=production DD_VERSION=1.2.0 python app.py
```

---

## Log Management

```
LOG PROCESSING PIPELINE:
  Ingest → Parse (Grok/JSON/CSV) → Enrich (GeoIP, lookup) → Filter → Index/Archive

ATTRIBUTES (structured fields from parsed logs):
  @timestamp, status, http.method, http.url, http.status_code
  network.client.ip, duration, error.message, service, env

FACETS: indexed attributes for filtering/grouping in Log Explorer

LOG-BASED METRICS: generate metrics FROM logs (cost-efficient for high-volume)
  Example: count of HTTP 5xx errors per service per minute

ARCHIVE: store raw logs in S3 for compliance (rehydrate for investigation)
RETENTION: 15 days online (standard) | Archives for long-term
```

## Revision Notes
```
DATADOG: SaaS observability platform. Agent on host → sends to Datadog cloud.
Free certifications at learn.datadoghq.com

METRICS COLLECTION:
  Agent integrations: 500+ pre-built (nginx, postgres, AWS, K8s)
  DogStatsD: custom app metrics (increment/gauge/histogram)
  CloudWatch integration: pull AWS metrics

MONITOR TYPES: threshold | change | anomaly | forecast | outlier | composite | SLO

APM: ddtrace library auto-instruments popular frameworks
  Flame graphs, service maps, error tracking, profiling
  Correlate traces → logs → metrics (unified observability)

LOG PIPELINE: parse (Grok) → enrich → filter → index/archive
FACETS: indexed log attributes for filtering

DASHBOARDS: drag-drop, templating with template variables (same as Grafana concept)
ALERTING: monitors → notify Slack/PD/email/OpsGenie/webhook
```
