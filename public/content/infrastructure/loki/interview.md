# Loki — Interview Questions

**What is Loki and how does it differ from Elasticsearch?**
Loki is a log aggregation system from Grafana Labs. The key architectural difference: Elasticsearch indexes every word in every log line (full-text index), making it fast to search but expensive to store and operate. Loki only indexes labels (metadata like service name, environment, pod name), storing the actual log content compressed in object storage (S3/GCS). This makes Loki 10-100x cheaper for the same volume of logs. Trade-off: Loki is slower for ad-hoc full-text searches but good enough for label-filtered searches. Best for: teams already using Prometheus/Grafana (same query paradigm), cost-conscious environments, Kubernetes log aggregation.

**What is LogQL and how does it work?**
LogQL is Loki's query language, inspired by PromQL. Two types of queries: Log queries return log lines — `{service="api"} |= "error"`. Metric queries return numeric data — `rate({service="api"} |= "error" [5m])`. Log queries start with a stream selector (label filter in `{}`), then chain pipeline stages with `|`: `| json` to parse JSON, `|= "text"` to filter, `| status > 400` to filter on parsed field, `| line_format "{{.field}}"` to reshape output. The label selector is critical — it determines which log streams are read (narrow selectors = faster queries).

**Why doesn't Loki index log content and what are the implications?**
Loki's design philosophy: log content changes constantly and is high-cardinality — indexing it creates massive index overhead. Labels are low-cardinality (env:prod/staging/dev, service:api/worker) — small index. Implication 1: You MUST filter by label first, then content. A query with no label selector (`{} |= "error"`) scans all logs — very slow. Implication 2: Choose labels carefully — high-cardinality labels (user_id, request_id) create too many streams and kill performance. Implication 3: Full-text search is slower than Elasticsearch for very broad queries, but adequate for operational use cases where you know the service/environment.

**How do you handle log volume spikes in Loki?**
Rate limiting: configure `ingestion_rate_mb` per tenant. Backpressure: Promtail queues logs locally when Loki is overwhelmed. Horizontal scaling: run multiple ingesters (stateful, need consistent hashing). For unexpected spikes: check if a new service started logging verbosely, add sampling rules in Promtail to drop debug logs in production, use recording rules to pre-aggregate metrics from logs instead of querying raw logs.
