# Loki Interview Q&A

**Q: Loki vs ELK vs Datadog logs?**
Loki: lightweight, index-free (labels only), cost-efficient, tight Grafana integration. ELK: full-text search, complex queries (KQL), heavy resource. Datadog: SaaS, expensive, best APM integration. Loki best for K8s-native teams already using Grafana.

**Q: What is Promtail?**
Log collector agent that runs on every K8s node (DaemonSet). Discovers pod logs, attaches labels (namespace, pod, container), pushes to Loki. Like Filebeat for ELK.

**Q: LogQL vs KQL?**
LogQL (Loki): `{namespace="production"} |= "error" | json | rate > 0`. KQL (Kibana): `status: 5* AND namespace: "production"`. LogQL uses metric queries for aggregation; KQL has better text search.
