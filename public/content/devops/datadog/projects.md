# Datadog — Portfolio Projects

Build these 3 projects to prove Datadog mastery. Each includes code, architecture, and interview talking points.

---

## Project 1: Kubernetes Cluster Observability Baseline

**Level:** Beginner | **Time:** 1 day | **GitHub:** `datadog-k8s-baseline`

**What you build:** A Kubernetes cluster with the Datadog Agent deployed via Helm, log collection enabled, and a dashboard covering cluster-wide health.

### Helm install
```bash
helm install datadog datadog/datadog \
  --namespace monitoring --create-namespace \
  --set datadog.apiKey=${DD_API_KEY} \
  --set datadog.clusterName=portfolio-cluster \
  --set datadog.logs.enabled=true \
  --set datadog.logs.containerCollectAll=true \
  --set clusterAgent.enabled=true
```

### Dashboard widgets to build
- Cluster-wide CPU/memory usage by namespace
- Pod restart count (top list, sorted descending)
- Error-rate-in-logs count (`status:error` query, timeseries)

### Interview points
- DaemonSet deployment ensures every node reports without manual per-node setup
- `containerCollectAll` vs. per-container log configuration — the tradeoff between simplicity and log-volume cost
- Dashboard template variables (`$namespace`) let one dashboard serve every team instead of building one per namespace

### Steps
1. Deploy a local or cloud Kubernetes cluster (kind/minikube is fine for portfolio purposes)
2. Install the Agent via Helm with logs enabled
3. Deploy 2-3 sample workloads with intentionally varied restart/error behavior
4. Build the dashboard with the three widgets above
5. Create one Monitor alerting on pod restart count exceeding a threshold
6. Document the Helm values file and dashboard JSON export in the README

---

## Project 2: Full-Stack APM with Log-Trace Correlation

**Level:** Intermediate | **Time:** 2-3 days | **GitHub:** `datadog-apm-correlation`

**What you build:** A small microservice (Python or Node) fully instrumented with APM, structured JSON logging, and trace-log correlation, deployed with auto-instrumentation.

### Architecture
```
Client
  |
API Service (auto-instrumented, DD_SERVICE=api)
  |
  +-- Database query (traced span)
  +-- External API call (traced span)
  |
Structured JSON logs with dd.trace_id/dd.span_id injected
```

### Key instrumentation pattern (Python)
```python
from ddtrace import tracer
import logging, json

class DatadogFormatter(logging.Formatter):
    def format(self, record):
        entry = {"message": record.getMessage(), "level": record.levelname}
        span = tracer.current_span()
        if span:
            entry["dd.trace_id"] = span.trace_id
            entry["dd.span_id"] = span.span_id
        return json.dumps(entry)

@tracer.wrap("payment.process")
def process_payment(order_id: str):
    with tracer.trace("db.query"):
        return db.execute("SELECT * FROM orders WHERE id = %s", order_id)
```

### Interview points
- `ddtrace-run` must wrap the process start command for auto-instrumentation to patch libraries at import time — a common real-world gap when this drops out during a Dockerfile refactor
- Log-trace correlation via injected `dd.trace_id` is what makes the "Related Logs" tab on a trace actually populate
- Manual spans (`tracer.trace("db.query")`) complement auto-instrumentation for business-logic-level visibility auto-instrumentation alone won't capture

### Steps
1. Build a small API service with at least one DB call and one outbound HTTP call
2. Add `ddtrace-run` (or equivalent) and confirm traces appear in APM
3. Add the structured JSON logging formatter with trace-ID injection
4. Confirm the "Related Logs" tab populates on a real trace in the Datadog UI
5. Set `DD_TRACE_SAMPLE_RATE` to a non-default value and explain the tradeoff in the README
6. Document one intentionally-broken instrumentation scenario and how you debugged it

---

## Project 3: Cost-Optimized Production Monitoring Setup

**Level:** Advanced | **Time:** 3-4 days | **GitHub:** `datadog-cost-optimized-monitoring`

**What you build:** A production-shaped monitoring configuration with SLOs defined as Terraform code, meta-monitoring on Agent health, and demonstrated cost-control levers.

### Terraform-managed SLO
```hcl
resource "datadog_service_level_objective" "api_availability" {
  name = "API Availability"
  type = "metric"
  query {
    numerator   = "sum:trace.web.request.hits{service:api,!status:error}.as_count()"
    denominator = "sum:trace.web.request.hits{service:api}.as_count()"
  }
  thresholds { timeframe = "30d", target = 99.9, warning = 99.95 }
}
```

### Meta-monitor (alerting on the Agent's own health)
```bash
curl -X POST "https://api.datadoghq.com/api/v1/monitor" \
  -H "DD-API-KEY: ${DD_API_KEY}" -H "DD-APPLICATION-KEY: ${DD_APP_KEY}" \
  -d '{
    "type": "metric alert",
    "query": "avg(last_5m):avg:datadog.agent.up{*} < 1",
    "name": "Datadog Agent Down",
    "message": "Agent stopped reporting — metrics/logs may be silently missing"
  }'
```

### Interview points
- SLOs as Terraform code mirror this stack's own everything-as-code philosophy, reviewable in a PR rather than clicked into the UI
- A meta-monitor on Agent health is what catches the exact silent-failure scenario in Overview's Interview Prep — an Agent that goes down without anyone noticing until an unrelated incident
- Cost levers (sampling, log exclusion, cardinality audits) are demonstrable, quantifiable engineering decisions, not vague "we manage cost" claims

### Steps
1. Write the Terraform for one real SLO on a service you control
2. Set up the meta-monitor for Agent health
3. Apply a trace sampling rate and document the before/after ingestion volume
4. Add a log exclusion filter for a genuinely low-value log category (health checks)
5. Run a cardinality audit on any custom metrics and document one finding
6. Write up the total cost-control story in the README as if presenting it to leadership

---

## Portfolio Checklist
- [ ] All repos public on GitHub with clear READMEs
- [ ] README includes architecture diagram and Helm/Terraform commands to reproduce
- [ ] Can explain the Agent → backend → dashboard/monitor pipeline end-to-end in an interview
- [ ] Project 2's log-trace correlation actually works and is screenshotted in the README
- [ ] Project 3 includes real before/after cost numbers, not just configuration
