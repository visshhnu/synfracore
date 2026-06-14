# Datadog — Cloud Monitoring & Observability

Datadog is the leading commercial observability platform used by thousands of enterprises. It unifies metrics, logs, traces (APM), and infrastructure monitoring in a single platform with deep cloud integrations.

## What Datadog Provides

| Capability | What it does |
|-----------|-------------|
| **Infrastructure Monitoring** | Host, container, Kubernetes metrics |
| **APM (Tracing)** | Distributed traces across microservices |
| **Log Management** | Ingest, search, archive all logs |
| **Synthetics** | Uptime monitoring, browser tests |
| **RUM** | Real User Monitoring — frontend performance |
| **Security** | CSPM, SIEM, threat detection |
| **Dashboards** | Unified view across all data |
| **Alerts** | Multi-condition monitors with routing |

## Datadog vs Prometheus/Grafana

| | Datadog | Prometheus + Grafana |
|--|--|--|
| **Setup** | 5 min (agent install) | Hours (full stack) |
| **Cost** | ~$15-23/host/month | Free (infra cost only) |
| **APM** | Built-in, excellent | Jaeger/Tempo (extra setup) |
| **Logs** | Unified (same platform) | Loki (separate) |
| **SaaS** | Fully managed | Self-managed |
| **Best for** | Speed, enterprise, APM | Cost control, flexibility |

## Agent Installation

```bash
# Linux — one-line install
DD_API_KEY=<YOUR_API_KEY> DD_SITE="datadoghq.com" \
  bash -c "$(curl -L https://s3.amazonaws.com/dd-agent/scripts/install_script_agent7.sh)"

# Kubernetes — Helm
helm repo add datadog https://helm.datadoghq.com
helm repo update

helm install datadog datadog/datadog \
  --namespace datadog \
  --create-namespace \
  --set datadog.apiKey=<YOUR_API_KEY> \
  --set datadog.appKey=<YOUR_APP_KEY> \
  --set datadog.site=datadoghq.com \
  --set datadog.logs.enabled=true \
  --set datadog.logs.containerCollectAll=true \
  --set datadog.apm.enabled=true \
  --set datadog.processAgent.enabled=true \
  --set clusterAgent.enabled=true \
  --set clusterAgent.metricsProvider.enabled=true  # HPA from Datadog metrics

# Docker
docker run -d \
  -e DD_API_KEY=<YOUR_API_KEY> \
  -e DD_SITE=datadoghq.com \
  -e DD_LOGS_ENABLED=true \
  -e DD_LOGS_CONFIG_CONTAINER_COLLECT_ALL=true \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v /proc/:/host/proc/:ro \
  -v /sys/fs/cgroup/:/host/sys/fs/cgroup:ro \
  datadog/agent:latest
```

## APM — Application Performance Monitoring

```python
# Python APM — instrument your app
pip install ddtrace

# Option 1: Auto-instrumentation (zero code change)
DD_SERVICE=myapp DD_ENV=production DD_VERSION=1.2.0 \
  ddtrace-run python app.py

# Option 2: Manual instrumentation
from ddtrace import tracer

@tracer.wrap(service="payment-api", resource="process_payment")
def process_payment(amount, user_id):
    # This function is automatically traced
    result = charge_card(amount)
    return result

# Custom span
with tracer.trace("database.query", service="myapp") as span:
    span.set_tag("db.type", "postgresql")
    span.set_tag("db.statement", "SELECT * FROM orders")
    result = db.execute(query)
```

```javascript
// Node.js APM
const tracer = require('dd-trace').init({
  service: 'my-node-app',
  env: process.env.NODE_ENV,
  version: process.env.APP_VERSION,
})

// Express auto-instrumented — just require dd-trace before everything
```

## Custom Metrics

```python
from datadog import initialize, statsd

initialize(api_key='YOUR_API_KEY', app_key='YOUR_APP_KEY')

# Counter — increment
statsd.increment('orders.processed', tags=['env:prod', 'region:us-east'])

# Gauge — set value
statsd.gauge('queue.length', 42, tags=['queue:payments'])

# Histogram — distribution
statsd.histogram('request.duration', 0.234, tags=['endpoint:/api/orders'])

# Timing helper
@statsd.timed('database.query.time', tags=['query:get_user'])
def get_user(user_id):
    return db.query(f"SELECT * FROM users WHERE id={user_id}")
```

## Log Management

```python
# Python logging → Datadog
import logging
from ddtrace import tracer

# JSON structured logging (Datadog parses automatically)
import json

class DatadogFormatter(logging.Formatter):
    def format(self, record):
        log_entry = {
            "timestamp": self.formatTime(record),
            "level": record.levelname,
            "message": record.getMessage(),
            "service": "myapp",
            "env": "production",
        }
        # Inject trace context for log-trace correlation
        span = tracer.current_span()
        if span:
            log_entry["dd.trace_id"] = span.trace_id
            log_entry["dd.span_id"] = span.span_id
        return json.dumps(log_entry)

handler = logging.StreamHandler()
handler.setFormatter(DatadogFormatter())
logging.getLogger().addHandler(handler)
```

```yaml
# Kubernetes pod annotation — tell Datadog how to parse logs
apiVersion: apps/v1
kind: Deployment
metadata:
  name: myapp
spec:
  template:
    metadata:
      annotations:
        ad.datadoghq.com/myapp.logs: |
          [{
            "source": "python",
            "service": "myapp",
            "log_processing_rules": [{
              "type": "multi_line",
              "name": "stack_traces",
              "pattern": "^\\d{4}-\\d{2}-\\d{2}"
            }]
          }]
```

## Monitors (Alerts)

```python
# Create monitor via API
import requests

monitor = {
    "name": "High Error Rate — Payment API",
    "type": "metric alert",
    "query": """
        sum(last_5m):
          sum:trace.web.request.errors{service:payment-api,env:production}.as_rate()
          /
          sum:trace.web.request.hits{service:payment-api,env:production}.as_rate()
        > 0.05
    """,
    "message": """
@slack-alerts @pagerduty-production
Error rate is {{value}} on payment-api in production.

Runbook: https://wiki.company.com/runbooks/payment-api-errors
    """,
    "options": {
        "thresholds": {
            "critical": 0.05,   # >5% = critical
            "warning": 0.02     # >2% = warning
        },
        "evaluation_delay": 60,
        "notify_no_data": True,
        "no_data_timeframe": 10,
    },
    "tags": ["service:payment-api", "env:production", "team:payments"],
    "priority": 1
}

response = requests.post(
    "https://api.datadoghq.com/api/v1/monitor",
    headers={"DD-API-KEY": API_KEY, "DD-APPLICATION-KEY": APP_KEY},
    json=monitor
)
```

## Datadog Query Language (DQL / Metrics)

```
# Infrastructure metrics
avg:system.cpu.user{env:production,host:web-*} by {host}

# Container metrics
avg:docker.cpu.usage{kube_namespace:production} by {kube_deployment}

# APM metrics
sum:trace.web.request.hits{service:api,env:prod}.as_rate()
p99:trace.web.request.duration{service:api,env:prod}

# Logs query (in Log Explorer)
service:payment-api status:error @error.type:TimeoutError

# Custom metric
sum:orders.processed{env:production} by {region}.as_rate()
```

## Datadog SLOs

```yaml
# Define SLO via Terraform
resource "datadog_service_level_objective" "api_availability" {
  name        = "API Availability"
  type        = "metric"
  description = "Payment API must be 99.9% available"

  query {
    numerator   = "sum:trace.web.request.hits{service:payment-api,env:production,!status:error}.as_count()"
    denominator = "sum:trace.web.request.hits{service:payment-api,env:production}.as_count()"
  }

  thresholds {
    timeframe       = "30d"
    target          = 99.9
    warning         = 99.95
  }

  tags = ["service:payment-api", "env:production"]
}
```

## Interview Questions

**What is Datadog APM and how does distributed tracing work?**
Datadog APM instruments your application code to create spans — timed units of work. Each request generates a trace (collection of spans) with a unique trace ID. When service A calls service B, it passes the trace ID in HTTP headers. Datadog collects all spans with the same trace ID and assembles them into a flame graph showing exactly where time was spent across the entire distributed call chain. This lets you identify which microservice is causing latency or errors in complex multi-service architectures.

**How does Datadog handle cardinality differently from Prometheus?**
High cardinality (many unique tag value combinations) is expensive in both. Prometheus stores each unique label combination as a separate time series in its local TSDB — high cardinality directly increases memory and disk usage on your server. Datadog processes metrics server-side and uses dynamic tag aggregation, making high cardinality more manageable but also more expensive (they charge per custom metric). For very high cardinality (user IDs, request IDs), both tools recommend avoiding those as metric tags and using tracing/logging instead.
