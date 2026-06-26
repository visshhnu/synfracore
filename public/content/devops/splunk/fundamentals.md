# Splunk

Monitoring › Splunk
📊**Splunk**
BeginnerEngineerProductionArchitectEnterprise log management and SIEM — SPL queries, forwarders, cost control
[What is Splunk](#sec-what)[SPL Queries](#sec-spl)[Interview Q&A](#sec-interview)


## 📊 What is Splunk?›


#### The Splunk Architecture

Splunk works differently from ELK. Instead of Filebeat agents, Splunk uses Universal Forwarders — lightweight agents that ship data to Indexers. Indexers store and index data in Splunk's proprietary format. Search Heads provide the user interface and run searches distributed across indexers.


| Component | Role | ELK equivalent |
|---|---|---|
| Universal Forwarder | Lightweight agent, ships logs from servers | Filebeat |
| Indexer | Receives, indexes, stores data | Elasticsearch node |
| Search Head | Query engine, dashboards, alerts | Kibana |
| Deployment Server | Manages forwarder configuration at scale | No direct equivalent |


#### When to choose Splunk vs ELK vs Loki

| Splunk | ELK | Loki |
|---|---|---|
| Enterprise SIEM, compliance, regulated industry (telco, banking) | Complex log analytics, full-text search, custom dashboards | Cost-sensitive, K8s-native, Grafana teams |


**Real Scenario — Vodafone Telco**In large telco environments like Vodafone, Splunk is the standard for network operations. TeMIP platform events, alarm management logs, and network element logs all flow into Splunk. NOC (Network Operations Centre) teams use Splunk dashboards to correlate network alarms with service degradation. A BSS (Business Support System) outage generates thousands of events — Splunk's transaction command groups them by session ID and shows the full chain of events leading to the failure.


## 🔍 SPL — Search Processing Language›


#### SPL is powerful, SQL-like, pipe-based

Every SPL search is a pipeline: search → filter → transform → aggregate → visualise. The pipe `|` symbol passes results from one command to the next. Understanding this pipeline model is the key to writing effective SPL.


Core SPL commands with real examplesCopy

```

```


Production SPL queries — error counting, latency analysisCopy

```

```


## 🎯 Interview Questions›


All
Architect
Engineer
Production


SPLUNK · ENGINEER
What is Splunk and how does it differ from ELK?
Splunk is a commercial log management and SIEM platform. You install forwarders (lightweight agents) on servers, they ship data to Splunk indexers, which store and index logs. Kibana shows dashboards; Splunk has its own SPL query language which is more SQL-like and powerful for ad-hoc analysis. Key differences from ELK: Splunk is fully managed (no Elasticsearch cluster tuning, no shard management). SPL is generally considered more expressive than KQL for complex queries. Splunk has built-in alerting, machine learning, and SIEM capabilities. Cost: Splunk charges by data ingestion volume (GB/day) — expensive at scale. ELK is open-source but requires significant operational expertise. In my experience: ELK is the right choice for teams comfortable with Kubernetes operations and wanting cost control. Splunk is the right choice when you need enterprise SIEM, compliance reporting, or have a team without ELK expertise. At Vodafone-scale telco environments, Splunk is common because of compliance requirements — regulators want auditable log trails and Splunk's audit capabilities are mature.

SPLUNK · PRODUCTION
How do you use Splunk for troubleshooting a production incident?
During an incident, Splunk is your fastest path from symptom to root cause. Scenario: payment errors spiking at 14:23. First search: index=production sourcetype=payment log_level=ERROR earliest=-15m to see what errors appeared in the last 15 minutes. The errors show database connection timeout. Second search: index=production sourcetype=database host=db-01 earliest=-30m to correlate. Found: database logs show disk I/O saturation starting at 14:21 — two minutes before payment errors. Third search: find what caused the I/O spike. index=production sourcetype=batch host=db-01 to find batch jobs. Found: a batch job that runs quarterly started at 14:18 and triggered a full table scan. Root cause identified in 8 minutes. Resolution: kill the batch job, database I/O normalises, payment errors stop. Post-incident: create a Splunk alert that fires when batch jobs run during business hours to prevent recurrence. This is the real value of Splunk — correlating events across multiple systems quickly during high-pressure incidents.

SPLUNK · ARCHITECT
How do you control Splunk costs at enterprise scale?
Splunk pricing is based on daily ingestion volume — at enterprise scale this can be hundreds of thousands of dollars per year. Cost control strategy: First, filter at the forwarder level. Universal Forwarder has nullQueue routing — send noisy logs (health checks, debug logs, verbose framework output) to null instead of Splunk. This reduces volume by 20-40% with no loss of useful data. Second, use summary indexing — pre-compute commo
