# Splunk — Fundamentals

## What is Splunk?

Splunk works differently from ELK. Instead of Filebeat agents, Splunk uses Universal Forwarders — lightweight agents that ship data to Indexers. Indexers store and index data in Splunk's proprietary format, and Search Heads provide the user interface and run searches distributed across indexers.

| Component | Role | ELK equivalent |
|---|---|---|
| Universal Forwarder | Lightweight agent, ships logs from servers | Filebeat |
| Indexer | Receives, indexes, stores data | Elasticsearch node |
| Search Head | Query engine, dashboards, alerts | Kibana |
| Deployment Server | Manages forwarder configuration at scale | No direct equivalent |

**When to choose Splunk vs. ELK vs. Loki:**

| Splunk | ELK | Loki |
|---|---|---|
| Enterprise SIEM, compliance, regulated industry (telco, banking) | Complex log analytics, full-text search, custom dashboards | Cost-sensitive, K8s-native, Grafana teams |

**Real scenario — large telco operations:** in a major telco's network operations, Splunk is the standard tool. Network management platform events, alarm management logs, and network element logs all flow into Splunk. NOC (Network Operations Centre) teams use Splunk dashboards to correlate network alarms with service degradation — a BSS (Business Support System) outage generates thousands of events, and Splunk's `transaction` command groups them by session ID, showing the full chain of events leading to the failure in one view rather than thousands of disconnected log lines.

## SPL — Search Processing Language

Every SPL search is a pipeline: search → filter → transform → aggregate → visualise. The pipe `|` symbol passes results from one command to the next — understanding this pipeline model is the key to writing effective SPL.

```spl
# Core commands, chained via the pipe
index=production sourcetype=payment_logs
| search log_level=ERROR
| stats count by error_type
| sort -count
| head 10

# stats — aggregate, like SQL GROUP BY
index=production sourcetype=access_combined
| stats avg(response_time) as avg_latency, count as requests by service

# eval — compute a new field
index=production sourcetype=payment
| eval success_rate = (successful_txns/total_txns)*100
| where success_rate < 95

# timechart — aggregate over time buckets, for trend visualization
index=production sourcetype=access_combined status=5*
| timechart span=5m count by service

# transaction — group related events into one logical unit by a shared field
index=production sourcetype=payment_logs
| transaction session_id maxspan=5m
| where duration > 30
```

**Production SPL queries — error counting and latency analysis:**
```spl
# Error rate by service, last 15 minutes
index=production earliest=-15m
| stats count(eval(status>=500)) as errors, count as total by service
| eval error_rate = round((errors/total)*100, 2)
| sort -error_rate

# P95 latency per endpoint
index=production sourcetype=access_combined earliest=-1h
| stats p95(response_time) as p95_latency by endpoint
| sort -p95_latency
| head 10

# Correlate a specific incident window across two source types
(index=production sourcetype=payment log_level=ERROR)
OR (index=production sourcetype=database host=db-01)
| eval source_system = if(sourcetype="payment", "Payment API", "Database")
| table _time, source_system, message
| sort _time
```

## Interview Questions

**What is Splunk and how does it differ from ELK?**
Splunk is a commercial log management and SIEM platform — Universal Forwarders (lightweight agents) ship data to Splunk indexers, which store and index logs; Search Heads provide dashboards and run its own SPL query language, which is generally considered more SQL-like and expressive for ad-hoc analysis than Kibana's KQL. Key differences from ELK: Splunk is fully managed with no Elasticsearch cluster tuning or shard management required, and it has built-in alerting, machine learning, and SIEM capabilities out of the box. Cost is the other major difference — Splunk charges by data ingestion volume (GB/day), which gets expensive at scale, while ELK is open-source but requires significant operational expertise to run well. In practice, ELK is the right choice for teams comfortable with Kubernetes operations and wanting cost control; Splunk is the right choice when enterprise SIEM, compliance reporting, or a team without ELK expertise is the actual constraint. At telco/banking scale, Splunk is common specifically because of compliance requirements — regulators want auditable log trails, and Splunk's audit capabilities are mature.

**How do you use Splunk for troubleshooting a production incident?**
During an incident, Splunk is the fastest path from symptom to root cause. Scenario: payment errors spike at 14:23. First search — `index=production sourcetype=payment log_level=ERROR earliest=-15m` — to see what errors appeared in the last 15 minutes; the errors show a database connection timeout. Second search — `index=production sourcetype=database host=db-01 earliest=-30m` — to correlate, revealing database logs showing disk I/O saturation starting at 14:21, two minutes before the payment errors. Third search — find what caused the I/O spike: `index=production sourcetype=batch host=db-01` reveals a quarterly batch job that started at 14:18 and triggered a full table scan. Root cause identified in about 8 minutes. Resolution: kill the batch job, database I/O normalises, payment errors stop. Post-incident, create a Splunk alert that fires when batch jobs run during business hours, to prevent recurrence — this is the real value of Splunk, correlating events across multiple systems quickly during high-pressure incidents rather than manually grepping separate log files on separate hosts.

**How do you control Splunk costs at enterprise scale?**
Splunk pricing is based on daily ingestion volume — at enterprise scale this can run hundreds of thousands of dollars per year, so cost control is a real, ongoing discipline. First, filter at the forwarder level: Universal Forwarder supports `nullQueue` routing, sending noisy logs (health checks, debug logs, verbose framework output) to null instead of Splunk, which typically reduces volume by 20-40% with no loss of genuinely useful data. Second, use summary indexing — pre-compute common aggregations (hourly error counts, daily transaction summaries) once via a scheduled search, and query the small summary index for routine dashboards instead of re-scanning full raw event volume on every dashboard load. Third, set data retention policies deliberately by sourcetype — genuinely compliance-critical logs might need years of retention, while verbose debug logs might only need days, and treating all data with the same retention policy wastes real storage cost on data nobody will ever query again. Fourth, review index usage regularly — an index nobody has queried in months is a real, ongoing cost with zero value, and identifying these requires periodic audit, not just leaving indexes running indefinitely by default.
