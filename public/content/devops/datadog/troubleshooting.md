# Datadog — Troubleshooting

## Agent is running but no metrics are reaching Datadog

**Symptom:** `kubectl get pods` shows the Datadog Agent DaemonSet healthy on every node, but no data appears in the Datadog UI for that cluster.

**Root cause:** beyond the basic connectivity checks (API key, network egress to `api.datadoghq.com`), a commonly-missed cause is clock skew — Datadog rejects metric submissions with timestamps too far outside the current time window, and a node with a significantly drifted system clock can have its metrics silently dropped server-side without an obvious client-side error.

**Fix:** run the layered debug sequence, and add a clock check as an extra step beyond the standard connectivity checks:

```bash
kubectl exec -it datadog-agent-pod -- agent status        # every check, pass/fail, last run
kubectl exec -it datadog-agent-pod -- agent check datadog  # validates the API key specifically
date -u                                                     # compare node time against actual UTC
```

If `agent status` shows the check passing but data still doesn't appear, cross-check the node's clock — NTP daemon failures on individual nodes are a real, if uncommon, cause of exactly this symptom, and it won't surface as an Agent-reported error since the Agent itself doesn't validate its own clock.

## Monitor doesn't fire despite the metric clearly breaching threshold

**Symptom:** a Monitor's query, run manually in the Metrics Explorer, clearly shows values above the configured threshold — but the Monitor stays in OK state and never alerts.

**Root cause:** two common, easy-to-miss causes. First, `evaluation_delay` — set to account for late-arriving data — means the Monitor evaluates a window slightly in the past, so a very recent spike genuinely hasn't been evaluated yet even though it's visible in a live dashboard query. Second, `notify_no_data` and `no_data_timeframe` settings interact with gaps in the metric stream in ways that can suppress an alert if the data itself is intermittent rather than continuously breaching.

**Fix:** check the Monitor's own evaluation history (not just the current metric value) to see what it actually evaluated and when:

```python
monitor = {
    "options": {
        "evaluation_delay": 60,        # the query evaluates data from 60s ago — recent spikes lag behind
        "notify_no_data": True,
        "no_data_timeframe": 10,       # gaps shorter than this don't trigger a no-data alert on their own
    }
}
```

If the Monitor's evaluation history shows it correctly saw the breach but still didn't notify, check the notification message/routing config separately — a correctly-firing Monitor with a broken `@` mention or Slack integration looks identical to "the monitor never fired" from the user's perspective.

## Custom metrics sent via DogStatsD never appear

**Symptom:** application code calls `statsd.increment()`/`statsd.gauge()` without error, but the custom metric never shows up in Datadog.

**Root cause:** DogStatsD uses UDP by default, which is fire-and-forget — a blocked port, a misconfigured `statsd_host`/`statsd_port`, or the Agent's DogStatsD listener not being enabled at all will silently drop every packet with zero error on the application side, since UDP has no delivery confirmation.

**Fix:** confirm the Agent's DogStatsD listener is actually enabled and reachable from the application, since the application-side client will never report a failure on its own:

```yaml
# datadog.yaml — DogStatsD must be explicitly enabled
use_dogstatsd: true
dogstatsd_port: 8125
```

```bash
# From inside the application's pod/host — confirm the port is actually reachable
nc -zvu localhost 8125
kubectl exec -it datadog-agent-pod -- agent status | grep -A5 dogstatsd
```

A Kubernetes NetworkPolicy blocking UDP traffic to the Agent's DaemonSet port is a specific, easy-to-overlook cause in clusters with default-deny network policies applied after the Agent was already working — the metric submission fails silently at the network layer, invisible to both the application and a basic Agent health check.

## Datadog bill spikes unexpectedly with no corresponding infrastructure growth

**Symptom:** the monthly bill increases substantially without a proportional increase in host count or traffic.

**Root cause:** custom-metric cardinality is billed per unique metric-tag combination, not per metric name — a well-intentioned but overly-granular tag (accidentally including something like `request_id` or a raw user ID on a custom metric) multiplies the effective metric count by every unique tag value seen, producing a cost spike disconnected from actual infrastructure size.

**Fix:** audit custom metrics for cardinality explosions directly, rather than assuming the bill increase tracks infrastructure growth by default:

```bash
# Metrics summary — sorted by cardinality, surfaces the worst offenders directly
# (available via the Datadog UI: Metrics → Summary, sortable by "% of custom metrics" contribution)
```

The fix is almost always removing a high-cardinality tag from the specific metric that's the outlier — not a blanket policy change — since most custom metrics on a given system are genuinely low-cardinality and fine; it's typically one or two metrics driving the bulk of an unexpected spike.

## Kubernetes HPA using Datadog custom metrics stops scaling

**Symptom:** an HPA configured to scale on a Datadog custom metric (via the Cluster Agent's external metrics API) stops responding to that metric entirely — replica count stays flat regardless of the metric's actual value.

**Root cause:** this specific integration depends on the *Cluster* Agent (not the per-node Agent) having `clusterAgent.metricsProvider.enabled: true` — if the Cluster Agent is down, was deployed without this flag, or loses connectivity, Kubernetes-facing custom metrics disappear from the external metrics API entirely, even while node-level Agents keep reporting other data normally.

**Fix:** check the Cluster Agent specifically, separately from the per-node Agent DaemonSet — these are two different components with two different failure modes:

```bash
kubectl get pods -n datadog -l app=datadog-cluster-agent
kubectl logs -n datadog -l app=datadog-cluster-agent
kubectl get apiservice v1beta1.external.metrics.k8s.io   # confirms the external metrics API is actually registered
```

A healthy per-node Agent DaemonSet reporting infrastructure metrics normally, alongside a completely stalled HPA, is close to a direct signal to check the Cluster Agent specifically rather than continuing to debug the per-node Agent.

## Watchdog never flags an issue that was clearly abnormal in hindsight

**Symptom:** after an incident, review shows the metric pattern was visibly anomalous — but Watchdog's AI-driven anomaly detection never surfaced it.

**Root cause:** Watchdog builds its anomaly baseline from historical data for that specific metric — a genuinely new metric, a recently-changed traffic pattern (a new feature launch, a seasonal shift), or a metric with too little history yet doesn't have an established "normal" for Watchdog to detect a deviation from, so it can miss real anomalies specifically during the period right after a metric's behavior legitimately changes.

**Fix:** treat Watchdog as a complement to explicitly-configured Monitors on genuinely critical metrics, not a substitute for them — this is a known, structural limitation, not a bug to work around. For a metric that just had a legitimate behavior change (a new deploy, a new feature), expect Watchdog's sensitivity to be reduced for some period afterward while it re-baselines, and rely on an explicit threshold Monitor for anything that needs guaranteed, immediate detection during that window.

---

## Official Resources

- [Datadog Agent Troubleshooting](https://docs.datadoghq.com/agent/troubleshooting/)
- [Datadog Monitors Documentation](https://docs.datadoghq.com/monitors/)
- [DogStatsD Documentation](https://docs.datadoghq.com/developers/dogstatsd/)

---
