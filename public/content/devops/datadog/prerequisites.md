# Datadog — Prerequisites

## What to Know Before Starting Datadog

Datadog is approachable for anyone who already understands observability concepts generally — it's largely a matter of learning where those concepts live in Datadog's UI and query syntax, not new fundamentals.

## Required (Must Have)

### 1. Core Observability Concepts
- What a metric, log, and trace each represent, and how they differ
- What a dashboard, alert/monitor, and SLO are conceptually
- Basic time-series thinking — rate, average, percentile (P50/P95/P99)

**Where to learn:** This site's Prometheus and Grafana sections cover these concepts directly — Datadog packages the same ideas in a managed SaaS, so time spent there transfers almost entirely.

### 2. Container/Kubernetes Basics
Most real Datadog deployments run the Agent as a Kubernetes DaemonSet:
```bash
kubectl get pods -n monitoring    # Comfortable reading pod status
kubectl logs, kubectl describe    # Basic troubleshooting commands
helm install / helm upgrade       # Datadog Agent ships via Helm
```
You don't need deep Kubernetes expertise — just enough to deploy and inspect a Helm-installed workload.

### 3. Basic Application Instrumentation Awareness
- What "instrumentation" means (code that emits telemetry about itself)
- The difference between auto-instrumentation (zero code changes) and manual instrumentation (explicit trace/span calls in code)

## Nice to Have (Speeds Up Learning)

### Prior Prometheus/Grafana/ELK Experience
Overview's own framing applies directly here: if you already know Prometheus+Grafana+ELK, Datadog is largely a syntax translation exercise, not new conceptual ground. PromQL experience transfers almost directly to reading (though not writing identically) Datadog's query syntax.

### A Programming Language for APM
To get real value from Module 03's APM instrumentation examples, comfort reading Python or Node.js helps — you don't need to write production code, just understand what `tracer.wrap()` or `dd-trace`'s auto-patching is doing.

### Terraform Basics (Optional)
Module 02 covers defining SLOs via Terraform's `datadog_service_level_objective` resource — if you've been through this site's Terraform section already, that module will feel immediately familiar rather than new syntax to learn cold.

## What You Do NOT Need

- Prior Datadog account or trial experience
- Deep distributed-tracing internals knowledge — APM auto-instrumentation handles most of this for you
- Production on-call experience — the Interview Prep section's PSR-format answers model what production reasoning looks like even if you haven't lived it yet

## Time Estimate

If you have the prerequisites above:
- Fundamentals: 1-2 days
- Intermediate + Advanced: 3-5 days
- Job-ready (able to discuss architecture, SLOs, APM, and cost control confidently): 2-3 weeks

## Start Here

Go to the **Installation** section to deploy the Datadog Agent, then proceed to **Fundamentals**.
