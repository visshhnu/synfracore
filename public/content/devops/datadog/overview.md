# Datadog

> **Enterprise observability — metrics, logs, APM, synthetic monitoring**

**Category:** Monitoring & Observability  
**Learning Path:** What → Why → Architecture → Setup → Real Examples → Production → Interview Prep

---

## What is Datadog?

Datadog is a managed observability SaaS — Prometheus+Grafana+ELK+APM+Synthetics in one platform. The Datadog Agent collects metrics, logs, and traces from hosts and containers. APM auto-instruments your code with distributed tracing. Key advantage: zero infrastructure to manage, integrations for everything, AI-powered anomaly detection (Watchdog). Key cost: expensive at scale.

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

helm install datadog datadog/datadog \\\\
  --namespace monitoring \\\\
  --set datadog.apiKey=\\${DD_API_KEY} \\\\
  --set datadog.clusterName=prod-aks \\\\
  --set datadog.logs.enabled=true \\\\
  --set datadog.logs.containerCollectAll=true \\\\
  --set datadog.apm.portEnabled=true \\\\
  --set datadog.processAgent.enabled=true \\\\
  --set clusterAgent.enabled=true \\\\
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
curl -X POST "https://api.datadoghq.com/api/v1/monitor" \\\\
  -H "DD-API-KEY: \\${DD_API_KEY}" \\\\
  -H "DD-APPLICATION-KEY: \\${DD_APP_KEY}" \\\\
  -d '{
    "type": "query alert",
    "query": "avg(last_5m):sum:trace.http.request.errors{env:production}.as_rate() / sum:trace.http.request.hits{env:production}.as_rate() > 0.01",
    "name": "High Error Rate",
    "message": "@pagerduty Error rate above 1% SLO",
    "tags": ["env:production", "team:platform"],
    "priority": 1
  }'
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

!!! tip "PSR Formula"
    Answer every question: **Problem → Solution → Result**. 45-90 seconds max.

### Common Interview Questions

??? question "What is Datadog and why would you use it in production?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How does Datadog work internally? Explain the architecture."
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "What are the main components of Datadog?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How do you handle failures in Datadog?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "What is your production experience with Datadog?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How do you monitor and observe Datadog in production?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "What are the security considerations for Datadog?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How does Datadog compare to alternatives?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "Explain Datadog Architecture in Datadog."
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "Explain Datadog Metrics & Dashboards in Datadog."
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

---

## Official Resources

- [Datadog Documentation](https://docs.datadoghq.com/)
- [Datadog Metrics Docs](https://docs.datadoghq.com/metrics/)
- [Datadog Log Management](https://docs.datadoghq.com/logs/)
- [Datadog APM](https://docs.datadoghq.com/tracing/)

---

*Part of [LearnwithVishnu](https://learnwithvishnu.pages.dev) — Basics → Production → Architect*