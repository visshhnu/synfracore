# Datadog — Fundamentals

## What is Datadog?

|  | Datadog | Prometheus+Grafana | ELK |
|---|---|---|---|
| Type | SaaS all-in-one | Self-hosted metrics | Self-hosted logs |
| Covers | Metrics + logs + traces + APM | Metrics + alerting | Logs only |
| Setup | 5 minutes (one Helm chart) | 30 minutes | Hours |
| Cost | $15-35/host/month | Free | Free (self-hosted) |
| Best for | APM, distributed tracing, unified platform | K8s metrics, cost-sensitive | Complex log analysis |

```bash
# Install the Datadog Agent on Kubernetes via Helm
helm repo add datadog https://helm.datadoghq.com
helm install datadog-agent datadog/datadog \
  --set datadog.apiKey=<YOUR_API_KEY> \
  --set datadog.site="datadoghq.com" \
  --set datadog.logs.enabled=true \
  --set datadog.apm.portEnabled=true \
  --set clusterAgent.enabled=true
```

## Metrics, Monitors & Dashboards

**The Four Golden Signals** appear on every service dashboard — if all four are green, users are happy.

| Signal | What it tells you | Datadog metric example |
|---|---|---|
| Latency | How fast are requests? | `trace.http.request.duration` (P95) |
| Traffic | How much load? | `trace.http.request.hits` |
| Errors | Are requests failing? | `trace.http.request.errors` |
| Saturation | How full is the system? | `kubernetes.cpu.usage.total` |

```python
# Create a monitor via the Datadog API — alert if P95 latency exceeds 500ms
from datadog_api_client.v1.api.monitors_api import MonitorsApi
from datadog_api_client.v1.model.monitor import Monitor

body = Monitor(
    name="High API Latency",
    type="metric alert",
    query="avg(last_5m):p95:trace.http.request.duration{service:payment-api} > 0.5",
    message="P95 latency exceeded 500ms @slack-payment-alerts",
    tags=["service:payment-api", "team:payments"],
)
MonitorsApi(api_client).create_monitor(body=body)
```

## APM — Distributed Tracing

A request is slow. Without APM, checking every service's logs manually takes 30 minutes. With APM, clicking the slow trace shows a waterfall diagram — the database query at step 4 took 2.3 seconds — done in 30 seconds.

```python
# Python — auto-instrumentation with ddtrace
# ddtrace-run python app.py
# automatically instruments Flask, Django, requests, psycopg2, redis, etc.

from ddtrace import tracer

@tracer.wrap(service="payment-api", resource="process_payment")
def process_payment(order_id):
    with tracer.trace("db.query", service="payment-api"):
        order = fetch_order(order_id)
    with tracer.trace("external.call", service="payment-gateway"):
        result = charge_card(order)
    return result
```
Every span (the database query, the external call) is automatically linked into one trace by a shared trace ID — the waterfall view in the Datadog UI shows exactly where the 2.3 seconds went, without manually correlating timestamps across separate service logs.

## Log Management

```yaml
# datadog-values.yaml — enable log collection with automatic parsing
datadog:
  logs:
    enabled: true
    containerCollectAll: true
```
```python
# Log-based metric — count errors per service without a separate monitoring pipeline
# (configured in the Datadog UI: Logs → Generate Metrics)
# query: status:error service:payment-api
# metric name: payment_api.error_count
```
Log-based metrics let you turn a log query into a first-class, graphable metric — useful for tracking something (a specific error type, a business event logged as text) that was never emitted as a metric directly by the application.

## Troubleshooting & Cost

```bash
# Agent pod status
kubectl get pods -n datadog

# If CrashLoopBackOff, check logs
kubectl logs daemonset/datadog -n datadog

# Check agent status from inside the pod — shows all checks and errors
kubectl exec -it datadog-agent-pod -- agent status

# Verify the API key is valid
kubectl exec -it datadog-agent-pod -- agent check datadog

# Check network egress — can the agent reach Datadog at all?
kubectl exec -it datadog-agent-pod -- curl -v https://api.datadoghq.com
```
**Cost reduction:** disable APM/logs collection for genuinely low-value namespaces, use log exclusion filters to drop high-volume, low-value log lines before they're billed, and review the host count regularly — Datadog bills per host, so ephemeral CI runner hosts left unmonitored (or monitored unnecessarily) are a real, common cost leak.

## Interview Questions

**What is Datadog and when would you choose it over Prometheus+Grafana?**
Datadog is a SaaS observability platform covering metrics, logs, traces, APM, synthetic testing, and security in one platform. Choose Datadog when the team doesn't want the operational overhead of managing monitoring infrastructure, when distributed tracing (APM) with automatic service dependency mapping is needed, when logs and metrics should live in the same tool with automatic correlation, when synthetic monitoring of external endpoints is needed, or when ML-based anomaly detection is valuable. Prometheus+Grafana wins when cost is a priority (Datadog runs $15-35/host/month versus Prometheus being free), the team has Kubernetes expertise and wants fine-grained control, the org is multi-cloud and wants one consistent self-hosted tool, or custom PromQL queries are needed that Datadog can't express. In practice, large enterprises often use both — Prometheus for detailed K8s metrics and alerting, Datadog for APM and distributed tracing where auto-instrumentation saves weeks of engineering effort.

**Datadog agent on Kubernetes is not sending metrics. How do you troubleshoot?**
Layered debugging. First, confirm the agent pod is running — `kubectl get pods -n datadog` should show a DaemonSet pod per node; a `CrashLoopBackOff` means checking `kubectl logs daemonset/datadog -n datadog` first. Second, check agent status from inside the pod with `agent status`, which shows every check, whether it's passing, and any errors. Third, verify the API key with `agent check datadog` — a wrong key gives a 403 Forbidden. Fourth, check network connectivity — can the agent reach `api.datadoghq.com` on port 443, since some clusters have restrictive egress policies. Fifth, if custom metrics are missing specifically, confirm `clusterAgent.metricsProvider.enabled` is `true` in the Helm values — the *cluster* agent, not the node agent, is responsible for Kubernetes state metrics, so if the cluster agent is down, pod/deployment metrics disappear from Datadog even while node agents keep running fine.

**How does Datadog APM work? What is distributed tracing?**
Distributed tracing tracks a single user request as it flows through multiple services. Without tracing, you see a slow response but don't know if the slowness is in the API, a database call, or a downstream payment service. With tracing, every request gets a unique trace ID, and each service that handles the request creates a span with a start time, end time, and tags — all spans sharing that trace ID link into a waterfall diagram showing exactly where time was spent. Implementation means instrumenting each service with a Datadog tracer (`ddtrace` for Python, `dd-java-agent` for Java), which automatically creates spans for HTTP requests, database queries, and Redis calls without manual instrumentation of every call site.
