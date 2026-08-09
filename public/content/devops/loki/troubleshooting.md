# Loki — Troubleshooting

## Promtail is running but logs never arrive in Loki

**Symptom:** the Promtail DaemonSet shows every pod running, but querying Loki for a namespace/app that should have logs returns nothing.

**Root cause:** two common causes beyond an outright crash. First, Promtail's `positions.yaml` file (which tracks read offset per log file) can get into a state where it believes it's already read past the current content, particularly after a log-rotation event it didn't handle cleanly — it then ships nothing new even though new logs are being written. Second, a `drop` pipeline stage intended to filter noisy logs (health checks, debug lines) can be written broadly enough to accidentally match and drop everything from a given source.

**Fix:** confirm Promtail is actually tailing the expected files and check the pipeline stages for over-broad matches before assuming a deeper problem:

```bash
kubectl logs -n monitoring -l app=promtail --tail=50
kubectl exec -n monitoring <promtail-pod> -- cat /run/promtail/positions.yaml
```

```yaml
pipeline_stages:
  - match:
      selector: '{app="payment-api"}'
      stages:
        - drop:
            expression: ".*GET /health.*"   # confirm this regex isn't broader than intended —
            # a mistyped pattern here can silently drop far more than just health checks
```

If `positions.yaml` looks stuck at an old offset for a specific file, deleting that entry (or the whole file, if Promtail can rebuild it from `clients:` config) forces a fresh read — but investigate why the offset got stuck first, since it usually indicates a log-rotation handling issue that will recur.

## Query returns a timeout instead of results

**Symptom:** a LogQL query that previously worked, or a seemingly simple query, times out instead of returning results — even for a time range that shouldn't be especially large.

**Root cause:** the query's label selector isn't selective enough — an under-specified selector (or one relying entirely on a text filter with no tight label match first) forces Loki to fetch and scan a very large set of chunks from object storage before any filtering happens, and that fetch-and-decompress cost is what actually times out, not the LogQL engine itself being slow.

**Fix:** tighten the label selector before assuming the query itself needs restructuring — this is almost always a selectivity problem, not a Loki performance bug:

```logql
# Times out or is very slow — label selector matches too much
{namespace="production"} |= "specific error message"

# Much faster — narrows the chunk set before the text scan
{namespace="production", app="payment-api"} |= "specific error message"
```

Also narrow the time range explicitly rather than relying on a dashboard's default — a query scoped to "last 7 days" when the actual investigation only needs the last hour multiplies the chunk-fetch cost for no benefit.

## Writes fail with `429 Too Many Requests` / "per-stream rate limit exceeded"

**Symptom:** Promtail (or another log shipper) logs write failures against Loki with a 429-style rate-limit error, and some logs are dropped rather than ingested.

**Root cause:** Loki enforces per-tenant ingestion rate limits (`ingestion_rate_mb`) and per-stream limits — a sudden burst in log volume (a service that started logging much more verbosely, or an incident causing a flood of error/retry logs) can exceed the configured limit, and Loki drops the excess rather than buffering indefinitely, by design, to protect the cluster's own stability.

**Fix:** first confirm whether the burst is legitimate (a real incident generating real log volume) or a misconfiguration (a service accidentally logging at debug level in production) — the fix differs. For a genuine, expected volume increase, raise the limit deliberately:

```yaml
limits_config:
  ingestion_rate_mb: 16          # raised from a lower default to accommodate real, sustained volume
  ingestion_burst_size_mb: 32
```

For a misconfiguration (unexpectedly verbose logging), the fix is reducing the log volume at the source or adding a Promtail `drop` stage for the specific noisy pattern — raising the rate limit to accommodate genuinely unnecessary log volume just delays the same problem at a higher ingestion cost.

## Ingester pods are OOMKilled under normal-looking load

**Symptom:** Ingester pods restart with OOM, without an obvious corresponding spike in raw log volume.

**Root cause:** this is very likely a label-cardinality problem, not a volume problem — each unique label combination creates a separate in-memory stream in the Ingester, and a label with unexpectedly high cardinality (an accidentally-promoted `request_id`, `user_id`, or similar high-variance field) can create orders of magnitude more streams than raw log volume alone would suggest, exhausting Ingester memory even when total log *bytes* look normal.

**Fix:** check active stream count, not just log volume, before assuming this needs more memory rather than a labeling fix:

```bash
# Series/stream count is the diagnostic signal here, not throughput
curl "http://localhost:3100/loki/api/v1/label/__name__/values"   # sanity check on label cardinality per label
```

Audit the Promtail pipeline configs feeding this Loki instance for any `labels:` stage promoting a high-cardinality field — the fix is almost always removing that field from labels and querying it via `| json` content-parsing instead, not raising Ingester memory limits, since the memory problem will recur and grow as that field's cardinality grows further.

## Logs arrive in Loki but with missing or wrong labels

**Symptom:** log lines are present when queried broadly, but expected labels (like `app` or `namespace`) are missing or incorrect on the affected streams, making them hard to filter.

**Root cause:** Promtail's `relabel_configs` — which map Kubernetes pod metadata into Loki labels — either doesn't include the expected `source_labels`/`target_label` mapping, or the source metadata itself (a pod missing the expected Kubernetes label in the first place) doesn't have anything to map from.

**Fix:** confirm both halves — that Promtail's relabel config actually targets the right source, and that the pod itself carries the metadata being mapped:

```yaml
relabel_configs:
  - source_labels: [__meta_kubernetes_pod_label_app]   # this K8s label must exist on the pod itself
    target_label: app                                    # or this mapping produces nothing
  - source_labels: [__meta_kubernetes_namespace]
    target_label: namespace
```

```bash
kubectl get pod <pod-name> --show-labels   # confirm the pod actually has the K8s label being mapped from
```

A pod deployed without the expected `app` Kubernetes label (a deployment manifest that skipped it) is a common, simple root cause — Promtail's relabel config being correct doesn't help if the source metadata was never present to map from.

## Ruler alerts never fire even though the underlying condition is clearly true

**Symptom:** a LogQL-based alerting rule that should be firing (manually running the same query shows the condition is met) never actually sends an alert.

**Root cause:** two common causes. First, the Ruler component might not be enabled or running at all in this Loki deployment — alerting rules are silently inert without it, distinct from query/ingestion functioning normally. Second, `alertmanager_url` might be misconfigured or pointing at an unreachable Alertmanager instance, meaning the Ruler correctly evaluates the rule and decides to fire, but the notification never reaches its destination.

**Fix:** verify the Ruler is actually running and correctly configured, separately from confirming the rule's query logic is sound (which manually running the query already confirms):

```bash
kubectl get pods -l app=loki -o wide | grep -i rule    # or check for a dedicated ruler component in microservices mode
```

```yaml
ruler:
  alertmanager_url: http://alertmanager:9093   # confirm this is actually reachable from the Ruler pod
  enable_api: true
```

If the Ruler is running and `alertmanager_url` looks correct, check connectivity directly between the two pods — a NetworkPolicy blocking traffic between the Ruler and Alertmanager produces exactly this symptom (rule correctly evaluated, alert silently never delivered) with no error visible from the Ruler's own logs alone in some configurations.

## Retention isn't actually deleting old logs, storage keeps growing

**Symptom:** `retention_period` is configured, but storage usage keeps growing well past what the retention window should allow.

**Root cause:** setting `retention_period` in `limits_config` alone doesn't delete anything — deletion is performed by the **Compactor** component, which must both be running and have `retention_enabled: true` explicitly set; without both, the retention period is effectively just a configured value with nothing acting on it.

**Fix:** confirm both pieces are actually in place, not just the retention period value:

```yaml
limits_config:
  retention_period: 30d

compactor:
  working_directory: /tmp/loki/compactor
  shared_store: filesystem       # or s3/gcs — must match the actual storage backend in use
  retention_enabled: true        # without this explicit flag, retention_period alone deletes nothing
```

```bash
kubectl get pods -l app=loki | grep -i compactor    # confirm the Compactor is actually deployed and running
```

A `shared_store`/storage-backend mismatch between the Compactor's config and where chunks are actually stored is a specific, easy-to-miss variant of this same symptom — the Compactor can be running and enabled but looking in the wrong place for what to delete.

---

## Official Resources

- [Loki Documentation](https://grafana.com/docs/loki/latest/)
- [Loki Operations Guide](https://grafana.com/docs/loki/latest/operations/)
- [Promtail Documentation](https://grafana.com/docs/loki/latest/send-data/promtail/)

---
