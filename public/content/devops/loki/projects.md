# Loki + OpenTelemetry — Portfolio Projects

Build these 3 projects to prove Loki mastery. Each includes code, architecture, and interview talking points.

---

## Project 1: Kubernetes Log Pipeline with Grafana Dashboards

**Level:** Beginner | **Time:** 1 day | **GitHub:** `loki-k8s-log-pipeline`

**What you build:** A Kubernetes cluster with the `loki-stack` chart deployed, Promtail auto-labeling pod logs, and a Grafana dashboard built entirely from LogQL queries.

### Install
```bash
helm install loki grafana/loki-stack \
  --namespace logging --create-namespace \
  --set grafana.enabled=true --set promtail.enabled=true \
  --set loki.persistence.enabled=true --set loki.persistence.size=10Gi
```

### Dashboard panels to build (all LogQL-driven, no metrics backend needed)
```
sum(rate({namespace="production"} |= "ERROR" [5m])) by (pod)   # Error rate by pod
{namespace="production"} | json | status >= 500                # Recent 5xx log lines, table panel
sum by (status) (rate({app="nginx"} | logfmt | status =~ "5.." [5m]))  # Status code breakdown
```

### Interview points
- Kubernetes pod metadata (namespace, pod, container) is attached as labels automatically by Promtail, with zero manual configuration
- Deriving an error-rate panel directly from raw logs, without a separate metrics pipeline, is Loki's core value proposition over needing both a metrics system and a logging system instrumented separately for the same signal
- `| json` vs `| logfmt` — picking the right parser stage depends on the actual log format, not a fixed choice

### Steps
1. Deploy the `loki-stack` chart to a local or cloud cluster
2. Deploy 2-3 sample workloads with varied log formats (JSON, logfmt, plain text)
3. Build the three dashboard panels above
4. Add one Grafana alert rule based on the error-rate LogQL query
5. Document the label schema each workload produces in the README

---

## Project 2: Metrics-From-Logs with `unwrap` and Alerting

**Level:** Intermediate | **Time:** 2 days | **GitHub:** `loki-metrics-from-logs`

**What you build:** A service that logs structured request-duration data, with a derived p99 latency panel using `unwrap`/`quantile_over_time`, plus a Ruler alert that fires directly on log content.

### The LogQL pattern
```
quantile_over_time(0.99,
  {app="api"} | json | unwrap duration [5m]
) by (endpoint)
```

### Ruler alert rule
```yaml
groups:
  - name: log-based-alerts
    rules:
      - alert: HighErrorRateFromLogs
        expr: |
          sum(rate({app="api"} |= "ERROR" [5m])) by (service) > 5
        for: 5m
        annotations:
          summary: "Error rate from raw logs exceeds threshold for {{ $labels.service }}"
```

### Interview points
- A service that never explicitly instrumented a `request_duration_seconds` metric can still get a real p99 figure, as long as duration is a structured log field — this is the concrete answer to "why derive metrics from logs instead of just instrumenting metrics directly"
- Ruler-based alerting evaluates LogQL the same way Prometheus evaluates PromQL — this catches problems that were never emitted as a metric in the first place
- Explaining exactly when `unwrap` is the right tool (a numeric field already present in structured logs) versus when proper metrics instrumentation is the better investment (a metric queried constantly, at high cardinality) is a real architectural judgment call worth being able to articulate

### Steps
1. Build a small service that logs structured JSON including a `duration` field per request
2. Write and test the `unwrap`/`quantile_over_time` LogQL query against real log volume
3. Build a Grafana panel from that derived p99 metric
4. Write and deploy a Ruler alert rule based on raw log content (not a pre-derived metric)
5. Document in the README when you'd choose this approach over instrumenting a real metric directly

---

## Project 3: Production Retention and Storage Configuration

**Level:** Advanced | **Time:** 2-3 days | **GitHub:** `loki-retention-storage-config`

**What you build:** A Loki deployment with correctly configured retention (both pieces, not just one), cardinality safety nets, and documented reasoning for the chunk/index storage tradeoffs made.

### Correct retention configuration
```yaml
limits_config:
  retention_period: 30d
  ingestion_rate_mb: 10
  max_streams_per_user: 10000

compactor:
  working_directory: /tmp/loki/compactor
  shared_store: filesystem
  retention_enabled: true   # required — retention_period alone does nothing without this
```

### Interview points
- `retention_period` without `compactor.retention_enabled: true` is a real, common misconfiguration that silently retains everything forever — being able to name this specific gotcha demonstrates hands-on depth, not just documentation-reading
- `max_streams_per_user` as a cardinality safety net — explaining what happens when a tenant hits the cap (new streams rejected with an explicit error, not a silent Ingester OOM) shows understanding of the failure mode it's actually protecting against
- Being able to explain chunk vs. index storage in your own words — what's actually stored where, and why label cardinality specifically (not log volume alone) is what drives index size

### Steps
1. Deploy Loki with an intentionally incomplete retention config first (`retention_period` only)
2. Confirm and document that data isn't actually being deleted
3. Fix the configuration with `compactor.retention_enabled: true` and confirm deletion now happens
4. Deliberately create a high-cardinality label scenario and observe `max_streams_per_user` rejecting new streams
5. Write up the chunk-vs-index storage model in your own words in the README, using this project's own observed behavior as the concrete example

---

## Portfolio Checklist
- [ ] All repos public on GitHub with clear READMEs
- [ ] README includes the Helm values used and how to reproduce each dashboard/alert
- [ ] Can explain the chunk-vs-index storage model without notes in an interview
- [ ] Project 2's derived metric is screenshotted alongside the raw LogQL query that produced it
- [ ] Project 3 documents a real observed failure (incomplete retention config) and its fix, not just the correct config in isolation
