# Prometheus Troubleshooting Guide

## Issue 1: Target shows as DOWN in Prometheus UI

**Symptom:** In Prometheus → Status → Targets, a target shows state=DOWN with error message.

**Root Cause:** Target not reachable, wrong port, TLS mismatch, or target not exposing metrics endpoint.

**Debug steps:**
```bash
# Test scrape endpoint manually
curl http://<target-ip>:<port>/metrics | head -20

# Check DNS resolution from Prometheus pod
kubectl exec -it prometheus-pod -n monitoring --   curl http://<service-name>.<namespace>.svc.cluster.local:8080/metrics

# Check Prometheus targets page
# http://<prometheus-url>/targets?search=myservice
```

**Fix:**
```yaml
# Check scrape config in prometheus.yaml
scrape_configs:
  - job_name: 'myapp'
    static_configs:
      - targets: ['myapp:8080']   # correct port?
    metrics_path: '/metrics'       # correct path?
    scheme: 'http'                 # http vs https?

# For K8s, check ServiceMonitor
kubectl describe servicemonitor myapp -n monitoring
kubectl get endpoints myapp -n production  # are endpoints correct?
```

---

## Issue 2: PromQL query returns no data

**Symptom:** Query in Grafana or Prometheus UI returns empty graph or "No data".

**Root Cause:** Wrong metric name, wrong label selectors, or time range issue.

**Debug steps:**
```promql
# Start broad, then narrow
# Step 1: Check if metric exists at all
{__name__=~"http.*"}   # list all HTTP metrics
http_requests_total    # try without any labels

# Step 2: Check label values
http_requests_total{job="myapp"}  # check what label values exist
```

```bash
# List all metrics from a target
curl http://prometheus:9090/api/v1/label/__name__/values | jq '.data | .[]' | grep http

# Check label values for a metric
curl 'http://prometheus:9090/api/v1/label/job/values'
```

**Fix:**
```promql
# Wrong: assumes specific label that doesn't exist
rate(http_requests_total{status_code="200"}[5m])

# Right: check actual label names first, then use
rate(http_requests_total{code="200"}[5m])  # label is 'code' not 'status_code'
```

---

## Issue 3: Prometheus out of memory / crashing

**Symptom:** Prometheus pod OOMKilled. `kubectl logs prometheus-0 -n monitoring --previous` shows killed.

**Root Cause:** Too many series (high cardinality), retention too long, or insufficient memory allocation.

**Debug steps:**
```bash
# Check TSDB stats
curl http://prometheus:9090/api/v1/status/tsdb | jq '.data.headStats'

# Check cardinality issues
curl http://prometheus:9090/api/v1/status/tsdb | jq '.data.seriesCountByMetricName | sort_by(.seriesCount) | reverse | .[0:10]'
```

**Fix:**
```yaml
# Reduce retention
args:
  - '--storage.tsdb.retention.time=15d'  # default is 15d, try 7d

# Increase memory
resources:
  requests:
    memory: "2Gi"
  limits:
    memory: "4Gi"

# Drop high-cardinality labels in scrape config
metric_relabel_configs:
  - source_labels: [user_id]
    action: drop  # remove per-user labels that cause cardinality explosion
```

---

## Issue 4: Alert not firing despite condition being met

**Symptom:** Prometheus shows the alerting rule, but Alertmanager never receives it.

**Debug steps:**
```bash
# Check alert state in Prometheus UI
# http://prometheus:9090/alerts

# Check Alertmanager received alerts
curl http://alertmanager:9093/api/v2/alerts

# Check Prometheus → Alertmanager connectivity
kubectl get pods -n monitoring | grep alertmanager
kubectl logs alertmanager-0 -n monitoring | grep error

# Verify alertmanager config
kubectl get secret alertmanager-main -n monitoring -o jsonpath='{.data.alertmanager\.yaml}' | base64 -d
```

**Fix:**
```yaml
# Check alert rule syntax
groups:
  - name: example
    rules:
      - alert: HighErrorRate
        expr: rate(http_requests_total{code=~"5.."}[5m]) > 0.05
        for: 5m          # must be true for 5 minutes before firing
        labels:
          severity: critical
        annotations:
          summary: "High error rate on {{ $labels.job }}"
```

---

## Issue 5: Grafana shows "No data" even though Prometheus has data

**Symptom:** Prometheus query returns data. Same query in Grafana shows empty panel.

**Root Cause:** Wrong data source URL, time zone mismatch, or variable interpolation issue.

**Debug steps:**
```bash
# Test data source from Grafana
# Grafana UI → Configuration → Data Sources → Test

# Check Grafana logs
kubectl logs grafana-pod -n monitoring | grep -i error | tail -20

# Verify the query in Grafana → Explore mode
# Use same PromQL, check time range
```

**Fix:**
- Set data source URL to: `http://prometheus:9090` (internal cluster DNS, not external)
- Check time zone: Grafana dashboard time zone must match browser/server
- For template variables: use `$__rate_interval` instead of fixed `[5m]`
- Increase scrape interval if data is sparse: queries over `[1m]` won't work if scrape is every 2 minutes
