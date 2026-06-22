# Datadog Interview Questions

## Core Concepts

**Q: What is Datadog? What are its main pillars?**

Datadog is a cloud-based observability platform providing unified monitoring across infrastructure, applications, and logs.

**Three pillars of observability:**
1. **Metrics**: Numerical time-series data (CPU %, request rate, error count)
2. **Logs**: Structured/unstructured event records
3. **Traces**: Distributed request tracking across services (APM)

**Datadog products:**
- Infrastructure Monitoring: Host/container metrics, dashboards
- APM (Application Performance Monitoring): Distributed tracing
- Log Management: Centralised log ingestion, search, analysis
- Synthetics: Synthetic browser/API monitoring
- RUM (Real User Monitoring): Frontend performance
- Security (CSPM, SIEM): Security monitoring

---

**Q: How does Datadog work architecturally?**

```
[Applications/Infrastructure]
    ↓ (Datadog Agent - installed on every host)
[Datadog Agent]
    → collects metrics, logs, traces
    → compresses and forwards to Datadog backend
    ↓
[Datadog SaaS Platform]
    → processes, stores, indexes data
    → powers dashboards, alerts, APM
```

**Datadog Agent**: Lightweight process installed on each host. Collects system metrics + runs integrations (MySQL, Nginx, K8s, etc.). Also handles log shipping and APM trace collection.

**DogStatsD**: UDP protocol for custom application metrics.
```python
from datadog import statsd
statsd.increment('api.requests', tags=['endpoint:/login', 'status:200'])
statsd.histogram('api.latency_ms', response_time, tags=['endpoint:/login'])
statsd.gauge('queue.depth', queue.size())
```

---

**Q: Datadog APM — how does distributed tracing work?**

APM automatically instruments applications (with DD libraries) to trace requests across services.

**Trace**: Complete end-to-end path of one request.
**Span**: Single operation within a trace (one service call, DB query, etc.).
**Service map**: Automatically generated from traces — shows service dependencies.

```python
# DD APM auto-instrumentation
from ddtrace import patch_all
patch_all()  # Patches Flask, requests, SQLAlchemy, Redis, etc. automatically

# Manual instrumentation
from ddtrace import tracer
with tracer.trace("my.operation", resource="process_payment") as span:
    span.set_tag("user_id", user_id)
    span.set_tag("amount", amount)
    result = process_payment(user_id, amount)
```

**Key APM metrics:**
- **Latency**: P50, P95, P99 response time
- **Throughput**: Requests per second
- **Error rate**: % of requests returning errors

---

**Q: Datadog monitors and alerting.**

```python
# Threshold monitor (CPU > 90% for 5 min)
type: "metric alert"
query: "avg(last_5m):avg:system.cpu.user{*} > 90"
message: "CPU high on {{host.name}} @slack-alerts @pagerduty"

# Anomaly detection (detects unusual patterns)
query: "avg(last_1h):anomalies(avg:requests.count{*}, 'basic', 2) >= 1"

# Composite monitor (combine multiple monitors)
query: "(A || B) && C"  # Alert when (disk OR memory) AND network issue

# SLO monitor — alert when error budget burning fast
type: "slo alert"
```

**Alert routing:**
- `@slack-channel` → Slack
- `@pagerduty-service` → PagerDuty
- `@webhook-url` → Custom webhook
- Escalation policies in PagerDuty for un-acked alerts

---

**Q: Log management in Datadog.**

**Log ingestion:**
```yaml
# Agent config for log collection
logs:
  - type: file
    path: /var/log/app/*.log
    service: my-app
    source: python
    tags: ["env:production"]
```

**Structured logging** (recommended):
```python
import json, logging
logging.info(json.dumps({
    "event": "user_login",
    "user_id": 123,
    "duration_ms": 45,
    "status": "success"
}))
```
Datadog auto-parses JSON logs into searchable fields.

**Log pipelines**: Process logs before indexing (parse, enrich, filter, redact sensitive fields).

**Log retention vs archive**: Index recent logs (expensive) + archive to S3 for long-term storage (cheap). Rehydrate from archive for investigations.

---

**Q: Kubernetes monitoring with Datadog.**

```yaml
# Install Datadog agent on K8s via Helm
helm install datadog-agent datadog/datadog   --set datadog.apiKey=$DD_API_KEY   --set datadog.containerExcludeLogs="name:datadog-agent"   --set datadog.logs.enabled=true   --set datadog.logs.containerCollectAll=true   --set datadog.apm.portEnabled=true   --set clusterAgent.enabled=true
```

**Datadog Cluster Agent**: Single agent communicating with K8s API (vs every node agent polling API — reduces load).

**Key K8s metrics tracked:**
- Node: CPU, memory, disk
- Pod: restart count, CPU/memory vs limits/requests
- Deployment: desired vs available replicas
- PVC: usage
- Kubernetes events (OOMKill, CrashLoopBackOff)

**Auto-discovery**: Agent reads pod annotations to configure integration checks:
```yaml
annotations:
  ad.datadoghq.com/nginx.check_names: '["nginx"]'
  ad.datadoghq.com/nginx.init_configs: '[{}]'
  ad.datadoghq.com/nginx.instances: '[{"nginx_status_url": "http://%%host%%/nginx_status"}]'
```

## Revision Notes
```
DATADOG: SaaS observability platform (metrics + logs + traces)
THREE PILLARS: Metrics (time-series) | Logs (events) | Traces (distributed requests)

AGENT: installed per host, collects everything, forwards to Datadog SaaS
DOGSTATSD: custom app metrics via UDP (increment, gauge, histogram, timing)

APM:
Traces = full request path | Spans = individual operations
Auto-instrument: ddtrace patch_all() | Manual: tracer.trace()
Key metrics: P99 latency, throughput, error rate

MONITORS:
Threshold: metric > value for N minutes
Anomaly: detect unusual patterns (ML-based)
Composite: combine multiple monitors with &&/||
SLO monitor: error budget burn rate

KUBERNETES:
Helm install with clusterAgent.enabled=true
Auto-discovery via pod annotations
Tracks: pod restarts, CPU/memory vs limits, events (OOMKill)
Cluster Agent: single K8s API client (reduces load)

LOG MANAGEMENT:
Structured JSON logging (auto-parsed)
Log pipelines: parse → enrich → redact → index/archive
Archive to S3 for long-term, rehydrate for investigations
```
