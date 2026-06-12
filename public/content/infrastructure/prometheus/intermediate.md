# Prometheus — Intermediate

## Service Discovery

```yaml
# kubernetes_sd_configs — discover pods, services, nodes automatically
scrape_configs:
  - job_name: kubernetes-pods
    kubernetes_sd_configs:
      - role: pod
    relabel_configs:
      # Only scrape pods with prometheus.io/scrape: "true" annotation
      - source_labels: [__meta_kubernetes_pod_annotation_prometheus_io_scrape]
        action: keep
        regex: "true"
      # Use custom port from annotation
      - source_labels: [__meta_kubernetes_pod_annotation_prometheus_io_port]
        action: replace
        target_label: __address__
        regex: (.+)
        replacement: $1
      # Use custom path from annotation
      - source_labels: [__meta_kubernetes_pod_annotation_prometheus_io_path]
        action: replace
        target_label: __metrics_path__
        regex: (.+)
      # Add namespace label
      - source_labels: [__meta_kubernetes_namespace]
        target_label: namespace
      # Add pod name label
      - source_labels: [__meta_kubernetes_pod_name]
        target_label: pod

  # Scrape Kubernetes nodes (kubelet metrics)
  - job_name: kubernetes-nodes
    kubernetes_sd_configs: [{role: node}]
    scheme: https
    tls_config:
      ca_file: /var/run/secrets/kubernetes.io/serviceaccount/ca.crt
    bearer_token_file: /var/run/secrets/kubernetes.io/serviceaccount/token
    relabel_configs:
      - action: labelmap
        regex: __meta_kubernetes_node_label_(.+)
```

## Recording Rules

```yaml
# Pre-compute expensive queries to speed up dashboards
groups:
  - name: kubernetes.rules
    interval: 30s
    rules:
      # Pre-compute per-namespace CPU
      - record: namespace:container_cpu_usage_seconds_total:sum_rate
        expr: |
          sum by (namespace) (
            rate(container_cpu_usage_seconds_total{
              container!="",container!="POD"
            }[5m])
          )

      # Pre-compute error rate per service
      - record: job:http_requests_errors:rate5m
        expr: |
          sum by (job) (rate(http_requests_total{status=~"5.."}[5m]))
          / sum by (job) (rate(http_requests_total[5m]))

      # P99 latency per job
      - record: job:http_request_duration_seconds:p99
        expr: |
          histogram_quantile(0.99,
            sum by (job, le) (
              rate(http_request_duration_seconds_bucket[5m])
            )
          )

# Dashboards then query the pre-computed metric:
# namespace:container_cpu_usage_seconds_total:sum_rate
# Instead of the expensive raw query
```

## Multi-Target Exporter Pattern

```yaml
# Some exporters use one process to monitor multiple targets
# e.g., blackbox_exporter probes URLs, mysqld_exporter connects to many DBs

# blackbox_exporter — probe HTTP/HTTPS/TCP endpoints
scrape_configs:
  - job_name: blackbox-http
    metrics_path: /probe
    params:
      module: [http_2xx]
    static_configs:
      - targets:
          - https://api.example.com/health
          - https://app.example.com
          - https://admin.example.com
    relabel_configs:
      - source_labels: [__address__]
        target_label: __param_target
      - source_labels: [__param_target]
        target_label: instance
      - target_label: __address__
        replacement: blackbox-exporter:9115   # Actual exporter address

# Useful blackbox metrics:
# probe_success = 1/0 (is endpoint reachable?)
# probe_http_status_code = HTTP response code
# probe_duration_seconds = total probe time
# probe_ssl_earliest_cert_expiry = certificate expiry Unix timestamp
```

## Thanos — Long-Term Storage

```yaml
# Prometheus stores data locally for ~15 days
# Thanos adds: unlimited retention, global queries across clusters, dedup

# Thanos Sidecar runs alongside each Prometheus
# Uploads blocks to S3/GCS every 2 hours

thanos sidecar \
  --tsdb.path /prometheus \
  --prometheus.url http://localhost:9090 \
  --objstore.config-file /etc/thanos/bucket.yaml

# bucket.yaml
type: S3
config:
  bucket: my-prometheus-long-term
  region: us-east-1
  endpoint: s3.amazonaws.com

# Thanos Query — federated querying across all Prometheus instances
thanos query \
  --store dnssrv+_grpc._tcp.thanos-sidecar.monitoring.svc.cluster.local \
  --query.replica-label replica \   # Dedup data from replicated Prometheus
  --http-address 0.0.0.0:9090

# Thanos Ruler — recording rules evaluated globally
# Thanos Compactor — downsample old data (5m, 1h resolutions)
```
