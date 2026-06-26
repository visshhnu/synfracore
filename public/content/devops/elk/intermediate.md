# ELK Stack — Advanced Queries & Production Operations

side log content (find all logs containing a specific error code), aggregate and correlate across many services, or need SIEM capability. Downside: expensive in storage (indexes every word), operationally complex (cluster management, shard tuning). Loki (Grafana): labels-only indexing, much cheaper storage, built for Kubernetes. Best when your team already uses Prometheus + Grafana and you want a unified observability stack. Loki does not index log content — only labels (namespace, pod, container). Searches are slower for content search but cost 10x less in storage. Splunk: enterprise, compliance-focused, expensive. Best when you have budget and need SIEM, compliance reporting, machine learning on logs, and dedicated support. Typical choice: Loki for Kubernetes-native teams that need cost efficiency and already use Grafana. ELK when you need powerful search and analytics. Splunk when you have enterprise compliance requirements and budget. At HPE we used ELK for telecom log analysis — the Grok parsing and structured search was essential for SOM/COM platform debugging.

ELK · ARCHITECT
How do you design ELK for a high-volume production environment processing 1 million logs/minute?
Architecture: Filebeat on every K8s node ships to Kafka topics (not directly to Logstash/Elasticsearch). Kafka acts as buffer — if Logstash or Elasticsearch slows down, Kafka absorbs the backpressure, no log loss. Multiple Logstash consumers read from Kafka, parse and transform, write to Elasticsearch. Elasticsearch cluster sizing: data nodes with dedicated SSD storage, master nodes (3 dedicated, not data nodes for stability), coordinating nodes for query routing. ILM policy: hot tier (last 7 days, SSD, 2 replicas), warm tier (8-30 days, HDD, 1 replica), cold tier (frozen, 30-90 days, object storage), delete after 90 days. Index rollover at 50GB or 1 day. Performance: disable dynamic mapping (explicit templates only, prevents mapping explosions), use keyword type for exact-match fields, text type only for full-text search fields. At 1M logs/minute: 16 Filebeat pods, 8 Logstash consumers, 6-node Elasticsearch cluster with 3 hot + 3 warm nodes handles comfortably. Monitor: Elasticsearch JVM heap, indexing rate, search latency, disk watermarks.

Continue Learning
[🔥 Prometheus](/monitoring/prometheus.html)[📈 Datadog](/monitoring/datadog.html)[🏠 All Topics](/)

🤖
✕




🤖



AI Assistant

Ask anything about this topic

Clear





👋 Hi! I have read this page and can answer your questions.


Try asking: *"Explain this topic in simple terms"* or *"Give me an example"* or ask any specific question.




Explain simply
Give an example
Interview tips
Common mistakes




➤
