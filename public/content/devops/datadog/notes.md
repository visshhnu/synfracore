# Datadog — Revision Notes

Condensed reference for quick review. Consolidated from this guide's Overview, Intermediate, Advanced, and Troubleshooting material.

---

## Core Architecture

```
DATADOG: managed observability SaaS — metrics + logs + APM + synthetics
  in one platform. Zero infrastructure to manage, real per-host/per-GB cost.

Pipeline: Datadog Agent (DaemonSet/host process) -> collects metrics,
  tails logs, receives traces -> batches -> forwards over HTTPS to
  Datadog's backend.

Cluster Agent (K8s-specific): cluster-level metadata aggregation +
  external metrics API for HPA. Requires clusterAgent.metricsProvider.enabled=true
  separately from basic cluster-agent enablement.
```

## Query Syntax Reference

```
Error rate:  sum:trace.http.request.errors{env:production}.as_rate()
             / sum:trace.http.request.hits{env:production}.as_rate()
P99 latency: p99:trace.http.request.duration{service:payment,env:production}
CPU by pod:  avg:kubernetes.cpu.usage.total{cluster_name:x} by {pod_name}

PromQL -> Datadog mapping:
  sum(rate(http_requests_total{status=~"5.."}[5m]))
  -> sum:trace.http.request.errors{*}.as_rate()
```

## APM Instrumentation Checklist

```
1. ddtrace-run (Python) or require('dd-trace').init() as FIRST line (Node)
   — must wrap/precede everything else or auto-instrumentation doesn't patch
2. DD_SERVICE, DD_ENV, DD_VERSION set as env vars
3. DD_TRACE_SAMPLE_RATE for cost control (default is 100% — expensive at scale)
4. Log-trace correlation: inject dd.trace_id/dd.span_id into every log line
   for the "Related Logs" tab to populate on a trace
```

**Common gotcha, verified from this guide's own Troubleshooting:** host metrics flowing does NOT mean APM is working — Agent health and instrumentation are two separate failure domains. A service can show healthy in Infrastructure List with zero traces in APM.

## SLO-as-Code (Terraform)

```hcl
resource "datadog_service_level_objective" "api_availability" {
  name = "API Availability"
  type = "metric"
  query {
    numerator   = "sum:trace.web.request.hits{service:x,!status:error}.as_count()"
    denominator = "sum:trace.web.request.hits{service:x}.as_count()"
  }
  thresholds { timeframe = "30d", target = 99.9, warning = 99.95 }
}
```

## Cost Control Levers (all three needed, not just one)

```
1. DD_TRACE_SAMPLE_RATE — sample traces instead of capturing 100%
2. Log exclusion filters — drop health checks / low-value log lines
   before ingestion (not after — cost is per-ingested-byte)
3. Custom metric cardinality audit — a single mistagged custom metric
   (e.g., request_id as a tag) can produce a genuinely large cost line item
```

## Security Checklist

```
- PII scrubbing at the Agent level (log processing rules) BEFORE data
  leaves the host — not a downstream filter
- Separate API key (write, agent reporting) vs Application key
  (read/write, resource management) — scope accordingly
- Log exclusion filters double as both a cost AND security control
```

## Meta-Monitoring

```
Monitor on datadog.agent.up — alerts on the Agent's OWN health, not
just the services it watches. This is the direct fix for the
Troubleshooting scenario where an Agent silently CrashLoopBackOff'd
and nobody noticed until an unrelated incident.
```

## Terminology Cross-Reference

```
Datadog term          | Equivalent in Prometheus/Grafana/ELK stack
-----------------------|---------------------------------------------
Monitor                | PrometheusRule / AlertManager rule
Notification rule      | AlertManager route
Downtime                | AlertManager silence
Dashboard widget        | Grafana panel
Template variable       | Grafana variable
Infrastructure List     | kubectl get nodes/pods (conceptually)
Service Map             | Auto-generated dependency graph (no direct equivalent)
Watchdog                | AI anomaly detection (no direct equivalent)
```
