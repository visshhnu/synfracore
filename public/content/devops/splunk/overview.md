# Splunk

> **Enterprise SIEM and log analytics — SPL query language**

**Category:** Monitoring & Observability  
**Learning Path:** What → Why → Architecture → Setup → Real Examples → Production → Interview Prep

---

## What is Splunk?

Splunk uses a distributed architecture. Universal Forwarder (lightweight, installed on every server) ships logs to Indexers. Indexers parse, index and store events. Search Head provides the query UI and dashboards. Heavy Forwarder routes and pre-processes logs before indexing. Splunk indexes EVERYTHING — unlike Loki which only indexes labels — making it powerful for search but expensive for storage.

## Why Splunk?

SPL (Search Processing Language) is Splunk's query language. The pipe (|) chains commands left to right — similar to Unix pipes. Always start with index= and time range to limit data scanned (performance and cost). stats creates aggregations. timechart creates time-based series. rex extracts fields using regex. eval creates computed fields.

---

## Learning Modules

### Module 01 — Splunk Architecture
*Forwarders, Indexers, Search Head*

Splunk uses a distributed architecture. Universal Forwarder (lightweight, installed on every server) ships logs to Indexers. Indexers parse, index and store events. Search Head provides the query UI and dashboards. Heavy Forwarder routes and pre-processes logs before indexing. Splunk indexes EVERYTHING — unlike Loki which only indexes labels — making it powerful for search but expensive for storage.

**Topics covered:**

- Universal Forwarder on every host — 🟢 Beginner
- Indexers — parse and store — 🟡 Intermediate
- Search Head — query interface — 🟢 Beginner
- Heavy Forwarder for routing — 🟡 Intermediate

```bash
# Inputs.conf — tell forwarder what to collect
[monitor:///var/log/app/*.log]
index = production
sourcetype = app_logs
host_regexp = prod-.*

[monitor:///var/log/nginx/access.log]
index = production
sourcetype = nginx_access

# Splunk Connect for Kubernetes (ship K8s logs)
helm install splunk-connect \\\\
  splunk/splunk-connect-for-kubernetes \\\\
  --set global.splunk.hec.host=splunk-hec.company.com \\\\
  --set global.splunk.hec.token=\\${HEC_TOKEN} \\\\
  --set global.splunk.hec.insecureSSL=false \\\\
  --set splunk-kubernetes-logging.enabled=true \\\\
  --set splunk-kubernetes-metrics.enabled=true
```

### Module 02 — SPL — Splunk Query Language
*Search, stats, timechart, rex*

SPL (Search Processing Language) is Splunk's query language. The pipe (|) chains commands left to right — similar to Unix pipes. Always start with index= and time range to limit data scanned (performance and cost). stats creates aggregations. timechart creates time-based series. rex extracts fields using regex. eval creates computed fields.

**Topics covered:**

- Basic search syntax — 🟢 Beginner
- stats count by field — 🟡 Intermediate
- timechart for time-based analysis — 🟡 Intermediate
- rex for field extraction — 🟡 Intermediate
- eval for computed fields — 🔴 Advanced
- transaction for grouping events — 🔴 Advanced

```bash
# SPL — production query patterns

# Basic search — always specify index and time
index=production sourcetype=app_logs level=ERROR earliest=-1h

# Count errors by service
index=production level=ERROR earliest=-1h
| stats count by service, error_message
| sort -count
| head 20

# Failed logins (security)
index=security sourcetype=auth action=failure earliest=-24h
| stats count by src_ip, user
| where count > 10
| sort -count

# P99 API response time
index=production sourcetype=nginx earliest=-1h
| rex field=_raw "response_time=(?<rt>\\\\d+\\\\.?\\\\d*)"
| stats perc99(rt) as p99_ms, avg(rt) as avg_ms by endpoint
| where p99_ms > 2000
| sort -p99_ms

# Error rate per service (timechart)
index=production earliest=-6h
| timechart span=5m
    count(eval(level="ERROR")) as errors,
    count as total
| eval error_rate=round((errors/total)*100,2)

# Kafka consumer lag over time
index=metrics sourcetype=kafka_consumer_lag
| timechart span=5m avg(lag) by consumer_group

# Detect brute force (SIEM)
index=auth action=failure
| bucket _time span=5m
| stats count by _time, src_ip, user
| where count > 20
| eval alert="Brute force: "+src_ip+" targeting "+user
```

### Module 03 — Splunk Dashboards & Alerts
*Saved searches, scheduled reports, alerts*

Splunk dashboards use saved searches as data sources. Schedule searches to run periodically and email reports to management. Alerts trigger when a search returns results matching a condition. Splunk Enterprise Security (ES) provides pre-built SIEM dashboards for security operations. Splunk is the dominant SIEM platform in enterprise security teams.

**Topics covered:**

- Saving searches and dashboards — 🟢 Beginner
- Scheduled reports via email — 🟡 Intermediate
- Real-time alerts with webhook actions — 🟡 Intermediate
- Splunk SIEM dashboards — 🔴 Advanced

```bash
# Saved alert — email when error rate exceeds threshold
# Settings > Searches, Reports and Alerts > New Alert

# Search:
index=production level=ERROR earliest=-5m
| stats count as error_count
| where error_count > 100

# Alert settings:
# - Cron schedule: */5 * * * *  (every 5 minutes)
# - Trigger condition: Number of results > 0
# - Action: Send email to devops@company.com
# - Action: Trigger webhook → PagerDuty/Slack

# Splunk HTTP Event Collector (HEC) — send events via API
# Useful when Forwarder can't be installed
curl -k https://splunk:8088/services/collector/event \\\\
  -H "Authorization: Splunk \\${HEC_TOKEN}" \\\\
  -d '{"event": {"level":"ERROR","service":"payment","msg":"DB timeout"}, "sourcetype":"json_logs", "index":"production"}'
```

---

## Production Example

```bash
# Splunk vs ELK vs Datadog — Comparison

# ┌──────────────┬──────────────┬──────────────┬──────────────┐
# │ Feature      │ Splunk       │ ELK          │ Datadog Logs │
# ├──────────────┼──────────────┼──────────────┼──────────────┤
# │ Query lang   │ SPL (pipes)  │ KQL/Lucene   │ Facets+query │
# │ Setup        │ Moderate     │ Complex      │ Easy (agent) │
# │ Cost         │ Very high    │ Free (OSS)   │ Per GB       │
# │ SIEM         │ Best in class│ Basic        │ Limited      │
# │ Scalability  │ Excellent    │ Complex ops  │ Managed      │
# │ ML/AI        │ MLTK addon   │ Elastic ML   │ Watchdog AI  │
# │ Compliance   │ Strong       │ Good         │ Good         │
# └──────────────┴──────────────┴──────────────┴──────────────┘

# INTERVIEW ANSWER when asked about Splunk:
# "I use ELK and Graylog in production — same log aggregation
# concepts. Splunk's SPL uses a pipe-based syntax similar to
# Unix pipes or pandas chains. The mental model is identical:
# search → filter → aggregate → visualize.
# Key Splunk advantage: enterprise SIEM capabilities and
# compliance reporting that ELK doesn't match out of the box.
# Key disadvantage: licensing cost — Splunk charges per GB/day
# indexed which makes it prohibitive for high-volume logging."

# SPL quick reference:
# | stats count by field    → GROUP BY in SQL
# | timechart span=5m count → time series aggregation
# | rex field=X "(?<name>pattern)" → extract field
# | eval field=expression   → computed column
# | where condition         → HAVING in SQL
# | sort -count             → ORDER BY count DESC
# | head 10                 → LIMIT 10
```

---

## Interview Prep

!!! tip "PSR Formula"
    Answer every question: **Problem → Solution → Result**. 45-90 seconds max.

### Common Interview Questions

??? question "What is Splunk and why would you use it in production?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How does Splunk work internally? Explain the architecture."
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "What are the main components of Splunk?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How do you handle failures in Splunk?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "What is your production experience with Splunk?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How do you monitor and observe Splunk in production?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "What are the security considerations for Splunk?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How does Splunk compare to alternatives?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "Explain Splunk Architecture in Splunk."
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "Explain SPL — Splunk Query Language in Splunk."
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

---

## Official Resources

- [Splunk Documentation](https://docs.splunk.com/Documentation/Splunk)
- [SPL Quick Reference](https://docs.splunk.com/Documentation/Splunk/latest/SearchReference/)
- [Splunk Enterprise Security](https://docs.splunk.com/Documentation/ES)

---

*Part of [LearnwithVishnu](https://learnwithvishnu.pages.dev) — Basics → Production → Architect*