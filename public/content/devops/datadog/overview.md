# Datadog

> **Enterprise observability — metrics, logs, APM, synthetic monitoring**

**Category:** Monitoring & Observability  
**Learning Path:** What → Why → Learning Modules → Production Example → Interview Prep

---

**Before you start:** this page assumes familiarity with the concepts covered by this platform's Prometheus/Grafana/ELK pages (metrics, dashboards, alerting, log aggregation) — Datadog is a managed platform covering the same ground, so it's explained largely by comparison to those. No prior Datadog-specific experience is needed.

## What is Datadog?

Datadog is a managed observability SaaS — Prometheus+Grafana+ELK+APM+Synthetics in one platform. The Datadog Agent collects metrics, logs, and traces from hosts and containers. APM auto-instruments your code with distributed tracing. Key advantage: zero infrastructure to manage, integrations for everything, AI-powered anomaly detection (Watchdog). Key cost: expensive at scale.

```conceptgrid
{
  "boxes": [
    { "title": "Prometheus PromQL", "description": "→ Datadog Query Language. Same concepts, different syntax", "color": "blue" },
    { "title": "Grafana Dashboards", "description": "→ Datadog Dashboards. Panels/widgets and template variables map directly", "color": "purple" },
    { "title": "AlertManager", "description": "→ Datadog Monitors. Rules, routing, and silences all have direct equivalents", "color": "amber" },
    { "title": "ELK / Kibana", "description": "→ Datadog Log Explorer. KQL-style search, same core idea", "color": "green" }
  ]
}
```

## Why Datadog?

Datadog metrics use a different syntax than PromQL but same concepts. Monitors = Prometheus AlertManager. Dashboards = Grafana. SLO tracking is built-in — no manual recording rules needed. Watchdog AI automatically detects anomalies and surfaces them without manual alert configuration.

---

## Learning Modules

### Module 01 — Datadog Architecture
*Agent, backend, APM, dashboards*

Datadog is a managed observability SaaS — Prometheus+Grafana+ELK+APM+Synthetics in one platform. The Datadog Agent collects metrics, logs, and traces from hosts and containers. APM auto-instruments your code with distributed tracing. Key advantage: zero infrastructure to manage, integrations for everything, AI-powered anomaly detection (Watchdog). Key cost: expensive at scale.

**Topics covered:**

- Datadog Agent deployment — 🟢 Beginner
- Metrics vs Logs vs APM traces — 🟢 Beginner
- Datadog vs Prometheus+Grafana — 🟡 Intermediate
- Integrations (500+ out of box) — 🟢 Beginner

```bash
# Deploy Datadog Agent on Kubernetes via Helm
helm repo add datadog https://helm.datadoghq.com
helm repo update

helm install datadog datadog/datadog \
  --namespace monitoring \
  --set datadog.apiKey=${DD_API_KEY} \
  --set datadog.clusterName=prod-aks \
  --set datadog.logs.enabled=true \
  --set datadog.logs.containerCollectAll=true \
  --set datadog.apm.portEnabled=true \
  --set datadog.processAgent.enabled=true \
  --set clusterAgent.enabled=true \
  --set clusterAgent.metricsProvider.enabled=true

# Verify agent is running
kubectl get pods -n monitoring | grep datadog
kubectl exec -n monitoring datadog-xxxxx -- agent status
```

### Module 02 — Datadog Metrics & Dashboards
*DQL, monitors, SLOs*

Datadog metrics use a different syntax than PromQL but same concepts. Monitors = Prometheus AlertManager. Dashboards = Grafana. SLO tracking is built-in — no manual recording rules needed. Watchdog AI automatically detects anomalies and surfaces them without manual alert configuration.

**Topics covered:**

- Metric queries in Datadog UI — 🟢 Beginner
- Datadog Query Language vs PromQL — 🟡 Intermediate
- Monitors (alerts) — 🟡 Intermediate
- SLO tracking in Datadog — 🔴 Advanced
- Dashboards and template variables — 🟡 Intermediate

```bash
# Datadog metric query syntax
# (Use in Dashboards or Notebook)

# Error rate — equivalent of PromQL rate()
sum:trace.http.request.errors{env:production}.as_rate()
/ sum:trace.http.request.hits{env:production}.as_rate()

# P99 latency
p99:trace.http.request.duration{service:payment,env:production}

# CPU by pod
avg:kubernetes.cpu.usage.total{cluster_name:prod-aks}
  by {pod_name}

# Datadog Monitor (alert) — equivalent of PrometheusRule
# Via API:
curl -X POST "https://api.datadoghq.com/api/v1/monitor" \
  -H "DD-API-KEY: ${DD_API_KEY}" \
  -H "DD-APPLICATION-KEY: ${DD_APP_KEY}" \
  -d '{
    "type": "query alert",
    "query": "avg(last_5m):sum:trace.http.request.errors{env:production}.as_rate() / sum:trace.http.request.hits{env:production}.as_rate() > 0.01",
    "name": "High Error Rate",
    "message": "@pagerduty Error rate above 1% SLO",
    "tags": ["env:production", "team:platform"],
    "priority": 1
  }'
```

SLOs are defined the same way as everything else in this stack — as code, reviewed in PRs, applied via CI. Terraform's `datadog_service_level_objective` resource is the standard way to do it:

```hcl
# Define SLO via Terraform — codifies the error-budget target instead of
# configuring it by hand in the Datadog UI
resource "datadog_service_level_objective" "api_availability" {
  name        = "API Availability"
  type        = "metric"
  description = "Payment API must be 99.9% available"

  query {
    numerator   = "sum:trace.web.request.hits{service:payment-api,env:production,!status:error}.as_count()"
    denominator = "sum:trace.web.request.hits{service:payment-api,env:production}.as_count()"
  }

  thresholds {
    timeframe = "30d"
    target    = 99.9
    warning   = 99.95
  }

  tags = ["service:payment-api", "env:production"]
}
```

### Module 03 — Datadog APM
*Distributed tracing, service map*

APM gives code-level visibility — see which function is slow, which DB query is the bottleneck, which external API call is timing out. Auto-instrumentation adds tracing with zero code changes (sidecar injection). Service Map shows dependencies between all services visually. Continuous Profiler shows CPU/memory hotspots in production code without performance impact.

**Topics covered:**

- APM auto-instrumentation — 🟡 Intermediate
- Service map and dependencies — 🟢 Beginner
- Flame graphs and span analysis — 🟡 Intermediate
- Continuous Profiler — 🔴 Advanced

```bash
# Enable APM auto-instrumentation in Kubernetes
# Add to pod spec:
spec:
  template:
    metadata:
      labels:
        admission.datadoghq.com/enabled: "true"  # Auto-inject tracer
    spec:
      containers:
      - name: myapp
        env:
        - name: DD_ENV
          value: "production"
        - name: DD_SERVICE
          value: "payment-api"
        - name: DD_VERSION
          value: "1.2.3"
        - name: DD_TRACE_SAMPLE_RATE
          value: "0.1"   # Sample 10% of traces (cost control)

# Manual instrumentation (Python example)
from ddtrace import tracer, patch_all
patch_all()  # Auto-instrument all supported libraries

@tracer.wrap("payment.process")
def process_payment(order_id: str):
    with tracer.trace("db.query") as span:
        span.set_tag("order.id", order_id)
        result = db.execute("SELECT * FROM orders WHERE id = %s", order_id)
    return result
```

```javascript
// Node.js APM — dd-trace must be required before any other module
// so it can patch Express/http/pg/etc. at import time
const tracer = require('dd-trace').init({
  service: 'my-node-app',
  env: process.env.NODE_ENV,
  version: process.env.APP_VERSION,
})

// Express, http, pg, redis are auto-instrumented once dd-trace is initialized —
// no per-route code changes needed
```

**Log-trace correlation.** APM traces and application logs are two separate data streams by default — a slow trace doesn't automatically show you the log lines from that same request. Fixing this means injecting the active trace's ID into every log line, so Datadog can link a log entry directly to the trace/span that produced it:

```python
import logging, json
from ddtrace import tracer

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

With `dd.trace_id`/`dd.span_id` present on every log line, the Datadog UI shows a "Related Logs" tab directly on the trace view — no manual timestamp correlation across two separate tools.

### Module 04 — Mapping from Prometheus/ELK
*Same concepts, different syntax*

If you know Prometheus+Grafana+ELK, you already understand Datadog — the concepts are identical, only the syntax differs. This is exactly what interviewers want to hear: "I use Prometheus/Grafana in production. Datadog packages the same capabilities in a managed SaaS — same observability thinking, different UI. I can onboard in one week."

**Topics covered:**

- PromQL → Datadog query syntax — 🟡 Intermediate
- ELK KQL → Datadog log search — 🟡 Intermediate
- Grafana dashboard → Datadog dashboard — 🟢 Beginner
- AlertManager → Datadog Monitor — 🟡 Intermediate

```bash
# MAPPING: Your current tools → Datadog equivalent

# ── METRICS ───────────────────────────────────────────────
# Prometheus PromQL:
sum(rate(http_requests_total{status=~"5.."}[5m]))

# Datadog equivalent:
sum:trace.http.request.errors{*}.as_rate()

# ── LOGS ──────────────────────────────────────────────────
# ELK KQL:        level:ERROR AND service:payment
# Graylog search: level:ERROR AND source:payment-*
# Datadog logs:   service:payment status:error

# ── DASHBOARDS ────────────────────────────────────────────
# Grafana panel → Datadog widget (same: timeseries, top list, heatmap)
# Grafana variables → Datadog template variables

# ── ALERTS ────────────────────────────────────────────────
# PrometheusRule → Datadog Monitor
# AlertManager routes → Datadog notification rules
# AlertManager silences → Datadog Downtime

# ── INTERVIEW ANSWER ──────────────────────────────────────
# "I run Prometheus/Grafana at production scale at a large telecom organisation.
# Datadog solves the same problems with less operational overhead
# — no Prometheus servers to manage, no Grafana to maintain.
# The query syntax is different but the mental model is identical.
# I would ramp up in Datadog within one week, building dashboards
# and monitors in week two, designing monitoring architecture by
# week four."
```

---

## Production Example

```bash
# Datadog — 14-Day Free Trial Quick Start

# Day 1: Install Agent on one VM or K8s cluster
# Day 2: Enable log collection, see logs in Log Explorer
# Day 3: Enable APM on one service, see traces
# Day 4: Build your first dashboard (CPU, memory, errors)
# Day 5: Create your first Monitor (alert on error rate)

# KEY DATADOG CONCEPTS MAP:
# Infrastructure List  → All hosts/containers (like kubectl get nodes/pods)
# Metrics Explorer     → Prometheus UI ad-hoc queries
# Log Explorer         → Kibana Discover
# APM Service List     → Service overview with error rate + latency
# Service Map          → Visual dependency graph (auto-generated)
# Watchdog             → AI anomaly detection (no config needed)
# SLO page             → Error budget tracking
# Notebooks            → Shared runbook + query workspace

# COST CONTROL:
# APM sampling: set DD_TRACE_SAMPLE_RATE=0.1 (10% of traces)
# Log exclusion filters: drop health check + debug logs
# Custom metrics: monitor cardinality (< 1000 custom metrics free)
# Use Log Archives (S3/Azure Blob) for long-term retention
```

---

## Interview Prep

**PSR Formula:** Answer every question: **Problem → Solution → Result**. 45-90 seconds max.

### Common Interview Questions

**Q1. What is Datadog and why would you use it in production?**

**A:** **Problem:** A team running Prometheus + Grafana + ELK + a homegrown APM shim had three separate query languages, three separate on-call runbooks, and no way to jump from a metric spike straight to the logs and trace for that same request — every incident started with 10 minutes of manually correlating timestamps across tools.

**Solution:** Migrated to Datadog as the unified platform — one Agent per host collecting metrics, logs, and traces, with automatic correlation via shared trace IDs and host tags. Kept the same alerting thresholds, just moved them into Datadog Monitors.

**Result:** Mean time to identify root cause dropped because a metric alert now links directly to the exact log lines and trace for that time window, in one click. Traded lower operational overhead for a real per-host cost — worth it for the team's size, but the tradeoff is explicit, not free.

---

**Q2. How does Datadog work internally? Explain the architecture.**

**A:** **Problem:** Needed to explain to a skeptical infra lead why "just install an agent" isn't magic — what's actually happening under the hood.

**Solution:** Walked through the pipeline: the Datadog Agent runs as a DaemonSet (or host process) collecting system metrics, tailing logs, and receiving traces from instrumented apps via a local endpoint. It batches and forwards everything to Datadog's backend over HTTPS. The Cluster Agent (Kubernetes-specific) handles cluster-level metadata and exposes an external metrics API for HPA. APM auto-instrumentation works by patching known libraries at process start (`ddtrace-run`, or `require('dd-trace').init()` before anything else in Node), injecting trace/span IDs into outgoing requests so downstream services stay linked to the same trace.

**Result:** Once the lead saw it was the same collector-agent pattern as Prometheus node_exporter + Filebeat + a tracing sidecar, just packaged into one binary reporting to one backend, the "magic" framing went away — it's the same architecture, consolidated.

---

**Q3. What are the main components of Datadog?**

**A:** **Problem:** Needed a clear mental model of the platform to know where to look first during an incident.

**Solution:** Broke it into five pieces: the Agent (collection), Infrastructure List (host/container inventory), Metrics Explorer + Dashboards (time series), APM Service List + Service Map (traces and dependencies), and Monitors (alerting). Log Explorer sits alongside as its own pillar, correlated to the others via tags and trace IDs.

**Result:** New team members now triage in a fixed order — check the Monitor that fired, jump to the Service Map for blast radius, then APM traces for root cause — instead of clicking around the UI looking for where the answer lives.

---

**Q4. How do you handle failures in Datadog?**

**A:** **Problem:** The Datadog Agent itself went into `CrashLoopBackOff` on a subset of Kubernetes nodes, and metrics silently stopped flowing for those nodes — nobody noticed until a separate incident review.

**Solution:** Added a meta-monitor: a Monitor that alerts on `datadog.agent.up` gaps, so the monitoring system alerts on itself, not just on the services it watches. Standardized the debug sequence — check pod status, `agent status` from inside the pod, `agent check datadog` to validate the API key, then verify egress to `api.datadoghq.com` on 443 — into a runbook so it's not re-derived from scratch every time.

**Result:** Agent failures now get caught within minutes instead of being discovered incidentally, and the fixed debug sequence cut resolution time from "who remembers how to debug the agent" to a five-minute checklist.

---

**Q5. What is your production experience with Datadog?**

**A:** **Problem:** Needed to demonstrate hands-on depth, not just "we use Datadog," in an interview setting.

**Solution:** Described rolling out APM auto-instrumentation on a payment service, tuning `DD_TRACE_SAMPLE_RATE` down from default to control ingestion cost once trace volume got expensive at scale, and writing the Terraform-managed SLO for that service's availability so the error budget was tracked as code, not a manually-configured UI object.

**Result:** Concrete detail — specific env vars, a real cost lever, a real Terraform resource — signals actual production time over a surface-level "I've used the dashboard" answer.

---

**Q6. How do you monitor and observe Datadog in production?**

**A:** **Problem:** Monitoring the monitoring tool sounds circular, but an unnoticed Agent outage means blind infrastructure.

**Solution:** Used the Infrastructure List's host-count trend as a canary — an unexpected drop means agents stopped reporting, not that hosts vanished. Paired with the meta-monitor above and a periodic `agent status` check via a scheduled job for hosts that don't page on their own.

**Result:** Caught two silent agent failures in six months that would otherwise have gone unnoticed until an unrelated incident needed the missing data.

---

**Q7. What are the security considerations for Datadog?**

**A:** **Problem:** Datadog is a third-party SaaS receiving logs, metrics, and traces — including, potentially, sensitive request data if instrumentation isn't scoped carefully.

**Solution:** Scrubbed PII at the Agent level using log processing rules before data left the host, restricted API/App key scope (separate read-only keys for dashboards vs. write keys for monitor management), and used log exclusion filters to drop entire categories (health checks, verbose debug) before they were ever ingested or billed.

**Result:** Reduced both the security surface (less sensitive data leaving the network) and the bill (less ingested volume) with the same set of filters.

---

**Q8. How does Datadog compare to alternatives?**

**A:** **Problem:** Leadership asked to justify Datadog's cost against a self-hosted Prometheus+Grafana+ELK stack the team already knew how to run.

**Solution:** Laid out the real tradeoff: Prometheus+Grafana is free but the team owns storage sizing, HA, and Alertmanager routing; ELK adds full-text log search at real operational weight; Datadog is $15-35/host/month but collapses all three into one managed platform with built-in correlation. For a small platform team without dedicated SRE headcount, the operational-overhead savings outweighed the license cost; for a team that already had Prometheus expertise and cost sensitivity, self-hosted stayed the better call.

**Result:** The decision was made on total cost of ownership, not sticker price alone — the honest framing is what got it approved.

---

**Q9. Walk through debugging a service that suddenly shows no APM traces.**

**A:** **Problem:** A newly deployed service showed up in the Infrastructure List (agent healthy, host metrics flowing) but had zero traces in APM.

**Solution:** Checked instrumentation first, not the Agent — confirmed `DD_SERVICE`/`DD_ENV`/`DD_VERSION` were set and that `ddtrace-run` actually wrapped the process start command (a redeploy had dropped the wrapper during a Dockerfile refactor). Verified the trace agent port (8126) was reachable from the app container to the Agent sidecar.

**Result:** Traced it to the missing `ddtrace-run` prefix — host metrics work independently of APM instrumentation, so a healthy Agent doesn't guarantee traces are flowing, which was the key insight that shortened the debug loop.

---

**Q10. How would you control Datadog cost as ingestion volume grows?**

**A:** **Problem:** A team's Datadog bill grew faster than infrastructure did, driven by APM trace volume and custom metric cardinality, not host count.

**Solution:** Applied `DD_TRACE_SAMPLE_RATE` to sample traces instead of capturing 100%, added log exclusion filters for high-volume/low-value log lines (health checks, static asset requests), and audited custom metrics for cardinality explosions (tags like `request_id` accidentally applied to a custom metric).

**Result:** Cut ingestion cost meaningfully without losing debugging capability — sampled traces still catch the P99 outliers that matter, and the cardinality audit alone removed a six-figure line item caused by a single mistagged metric.

---

## Official Resources

- [Datadog Documentation](https://docs.datadoghq.com/)
- [Datadog Metrics Docs](https://docs.datadoghq.com/metrics/)
- [Datadog Log Management](https://docs.datadoghq.com/logs/)
- [Datadog APM](https://docs.datadoghq.com/tracing/)

---

