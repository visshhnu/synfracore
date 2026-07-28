# Loki Interview Q&A

**Q: Loki vs ELK vs Datadog logs?**
Loki: lightweight, index-free (labels only), cost-efficient, tight Grafana integration. ELK: full-text search, complex queries (KQL), heavy resource. Datadog: SaaS, expensive, best APM integration. Loki best for K8s-native teams already using Grafana.

**Q: What is Promtail?**
Log collector agent that runs on every K8s node (DaemonSet). Discovers pod logs, attaches labels (namespace, pod, container), pushes to Loki. Like Filebeat for ELK.

**Q: LogQL vs KQL?**
LogQL (Loki): `{namespace="production"} |= "error" | json | rate > 0`. KQL (Kibana): `status: 5* AND namespace: "production"`. LogQL uses metric queries for aggregation; KQL has better text search.


**Q: What makes Loki different from Elasticsearch for logs?**
Loki does NOT index log content — only indexes labels (namespace, pod, container, app). Logs are stored compressed in chunks. This means: very cheap storage, fast label-based filtering, but no full-text search across all log content. Trade-off: use Loki when you know the labels to filter on; use ELK when you need arbitrary text search.

**Q: What is Promtail and how does it work?**
Promtail is Loki's log collector agent, runs as a DaemonSet on every Kubernetes node. It discovers pod logs via Kubernetes API (watches pod labels), attaches labels to log streams, tails log files, and pushes to Loki. No transformation like Logstash — lightweight, low overhead.

**Q: What is chunk and index in Loki's architecture?**
Index: maps label sets to chunk IDs — stored in object storage (S3/GCS) or DynamoDB. Chunks: compressed log data — stored in object storage. Querier fetches index first to find relevant chunks, then decompresses and streams matching lines. Ruler: evaluates LogQL metric rules for alerting.

**Q: How do you alert on logs in Loki?**
Define Ruler rules using LogQL metric queries. Example: alert when error log rate exceeds threshold. `count_over_time({app="myapp"} |= "ERROR" [5m]) > 10`. Rules evaluated by Ruler component, alerts sent to Alertmanager. Same as Prometheus alerting workflow but for log-derived metrics.


