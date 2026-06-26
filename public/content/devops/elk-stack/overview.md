# ELK Stack Complete Guide

Monitoring › ELK Stack
📋**ELK Stack**
BeginnerEngineerProductionArchitectCentralised logging — Elasticsearch, Logstash, Kibana, Filebeat
[What is ELK](#sec-what)[Components](#sec-components)[Logstash](#sec-logstash)[ILM](#sec-ilm)[Troubleshoot](#sec-troubleshoot)[Interview Q&A](#sec-interview)


## 📋 What is ELK Stack?›


#### The Logging Problem

With 50 pods running, logs are spread across 50 different places. An error happens — which pod? Which container? What time exactly? ELK centralises ALL logs in one place with full-text search, filtering, and visualisation.


#### ELK Components

| Component | Role | Analogy |
|---|---|---|
| Elasticsearch | Stores and indexes logs for fast search | The database |
| Logstash | Collects, transforms, routes logs | The ETL pipeline |
| Kibana | Web UI for search, dashboards, alerts | The dashboard (like Grafana for logs) |
| Filebeat | Lightweight log shipper on every node | The collector (replaces Logstash for simple cases) |


#### ELK vs Loki vs Splunk

|  | ELK | Loki | Splunk |
|---|---|---|---|
| Indexing | Full-text indexes every word | Labels only (cheaper) | Full-text + ML |
| Storage cost | High | Low (10x cheaper) | Very high |
| Search power | Excellent | Good for labels, slow for content | Excellent + ML |
| License | SSPL (paid for production), OpenSearch = Apache 2.0 | Free/open source | Paid enterprise |
| Best for | Complex log analysis, telecom, SIEM | Kubernetes-native, Grafana teams | Enterprise compliance, SIEM |


Install ELK on KubernetesCopy

```

```


## 🔧 Components Deep Dive›


Elasticsearch health + Filebeat config + Kibana queriesCopy

```

```


## 🔄 Logstash Pipeline›


#### When to use Logstash vs direct Filebeat→Elasticsearch


- **Use direct Filebeat → Elasticsearch** when logs are already structured (JSON), you don't need transformation, and you want simplicity

- **Use Logstash** when you need grok parsing (unstructured text), enrichment (GeoIP, add fields), filtering (drop health checks), or routing to multiple destinations


Logstash pipeline with Kafka input, grok parsing, outputCopy

```

```


## ♻️ Index Lifecycle Management›


#### Why ILM is non-negotiable in production

Without ILM: indices grow forever. After 6 months your disk is full, cluster turns RED, all log ingestion stops. With ILM: hot (recent, fast SSD) → warm (compressed, slower disk) → cold (frozen, object storage) → delete. Automatic. Zero manual cleanup.


ILM policy — hot/warm/cold/deleteCopy

```

```


## 🔍 Troubleshooting›


Cluster RED, no data, OOM — fixesCopy

```

```


## 🎯 Interview Questions›


All
Architect
Engineer
Production


ELK · ENGINEER
What is ELK stack and what does each component do?
ELK stands for Elasticsearch, Logstash, Kibana. Elasticsearch is the distributed search and storage engine — it stores all logs as JSON documents indexed for fast full-text search. Think of it as a database specifically designed for logs. Logstash is the data processing pipeline — it collects logs from sources (files, Kafka, syslog), transforms them (parse unstructured text into structured fields using grok patterns, enrich with GeoIP, filter noise), and outputs to Elasticsearch. Kibana is the web UI — you search logs, build dashboards, set up alerts. In modern production setups, Filebeat replaces Logstash for simple log shipping — it is lightweight (10MB vs 500MB), runs as a DaemonSet on every Kubernetes node, automatically collects pod logs and adds Kubernetes metadata. Logstash is still used when you need complex parsing or routing to multiple destinations. OpenSearch is the free open-source fork of Elasticsearch that many teams now prefer after Elastic changed licensing in 2021.

ELK · PRODUCTION
Elasticsearch cluster is RED. Walk through your troubleshooting.
RED means some primary shards are unassigned — that data is temporarily unavailable. Systematic approach. Step 1: identify extent. curl elasticsearch:9200/_cluster/health shows how many unassigned shards. Step 2: find why. curl elasticsearch:9200/_cluster/allocation/explain explains exactly why each shard is unassigned. Most common causes: disk usage above 85% watermark (Elasticsearch stops allocating new shards when disk > 85%), node offline (check kubectl get pods in logging namespace), shard count exceeds node count (you have 2 nodes but 3 replicas configured — impossible to assign). Step 3: fix root cause. For disk: delete old indices (curl -X DELETE elasticsearch:9200/app-logs-2024-01-*), or temporarily disable disk threshold. For node: bring it back or reduce replica count. Step 4: retry allocation. curl -X POST elasticsearch:9200/_cluster/reroute?retry_failed=true. Prevention: ILM policy to auto-delete indices older than 30 days. Monitoring alert at 75% disk before hitting 85% watermark.

ELK · ARCHITECT
ELK vs Loki vs Splunk — when would you choose each?
ELK (Elasticsearch): full-text search, complex log analytics, dashboard-heavy. Best when you need to search inside log content (find all logs containing a specific error code), aggregate and correlate across many services, or need SIEM capability. Downside: expensive in storage (indexes every word), operationally complex (cluster management, shard tuning). Loki (Grafana): labels-only indexing, much cheaper storage, built for Kubernetes. Best when your team already uses Prometheus + Grafana and you want a unified observability stack. Loki does not index log content — only labels (namespace, pod, container). Searches are slower for content search but cost 10x less in storage. Splunk: enterprise, compliance-focused, expensive. Best when you have budget and need SIEM, compliance reporting, machine learning on logs, and dedicated support. Typical choice: Loki for Kubernetes-native teams that need cost efficiency and already use Grafana. ELK when you need powerful search and analytics. Splunk when you have enterprise compliance requirements and budget. At HPE we used ELK for telecom log analysis — the Grok parsing and structured search was essential for SOM/COM platform debugging.

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
