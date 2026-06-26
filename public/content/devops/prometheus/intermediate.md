# Prometheus — PromQL, Alertmanager & Production Monitoring

here services appear and disappear. Service discovery automatically finds new pods. Nagios requires manual host registration.

PROMETHEUS · ENGINEER
Explain the four Prometheus metric types. When do you use each?
Counter: always increases, never decreases (resets on restart). Use for total requests, errors, bytes processed. Always use rate() or increase() in PromQL to get rate of change per second — the raw counter number is not useful. Gauge: current value, can go up or down. Use for memory usage, active connections, queue depth, temperature. Query directly without rate(). Histogram: distributes values into predefined buckets. Use for request latency and response sizes where you need percentile calculations. Creates three series: _bucket (counts), _count (total), _sum (sum of all values). Use histogram_quantile() to calculate P95/P99. Summary: similar to histogram but calculates quantiles in the application code. Less flexible than histogram because you cannot aggregate across multiple instances. Prefer histogram unless you have a specific reason for summary.

PROMETHEUS · ARCHITECT
An alert is firing in Prometheus but you see no issue in Grafana. What are the possible causes?
Five possible causes. One: time range mismatch — Grafana dashboard is showing last 1 hour but the alert triggered on a spike that is now outside the range. Expand time range. Two: alert has no FOR duration — fired on a single data point that immediately resolved. The alert appears in history but Grafana dashboard now shows normal. Add FOR 5m to the alert rule. Three: alert is silenced in Alertmanager — someone silenced it while investigating. Check Alertmanager UI silences. Four: the metric labels in the alert do not match the Grafana panel query — alert is for namespace=production but Grafana panel shows all namespaces combined. Look at the exact alert labels. Five: recording rules lag — if the alert uses a recording rule, there is a scrape interval delay. The alert fired on slightly stale data. Check the recording rule evaluation interval. At HPE: most of these issues come from copy-pasting alert rules without understanding the labels — the alert fires for a specific pod but the Grafana panel aggregates all pods.

PROMETHEUS · PRODUCTION
Prometheus is using too much memory and pods keep OOMKilling. How do you fix it?
Root cause: too many time series (high cardinality) or too long retention. Investigation: Prometheus UI → Status → TSDB Status shows top series by metric name and label name. Look for any label with millions of unique values — typically user_id, session_id, request_id, URL path with parameters. These are high-cardinality labels and each unique value = separate time series = memory. Immediate fix: increase memory limit and reduce retention from 15 days to 7 days. Medium-term fix: remove high-cardinality labels from metrics using metric_relabel_configs in the scrape config — drop the offending label. Long-term fix: code review of application metrics — every label must have bounded cardinality. Also check for metrics that are never queried and can be dropped entirely. Recording rules help too — pre-aggregate expensive queries into new lower-cardinality series. At HPE: a developer added request_path as a label with full URL paths including query parameters. 50 million unique series in 2 hours. Fix: drop path label in relabel config, add path_prefix with only the first URL segment.

PROMETHEUS · ENGINEER
What is the difference between Prometheus rate() and increase() functions?
Both calculate how much a counter changed over a time window, but express it differently. rate(counter[5m]) gives the per-second rate of increase averaged over 5 minutes. increase(counter[5m]) gives the total increase over 5 minutes. Mathematically: increase = rate × 300 (seconds in 5 minutes). Use rate() when you care about speed — requests per second, errors per second. Use increase() when you care about total count in a window — how many restarts in the last hour, how many deploys today. Important nuance: both handle counter resets (when a process restarts and counter goes to 0) by detecting the reset and not counting it as a decrease. This is why you must use rate()/increase() instead of subtracting counter values directly.

PROMETHEUS · ARCHITECT
How do you design Prometheus alerting for a Kubernetes production cluster to avoid alert fatigue?
Alert fatigue happens when too many alerts fire, operators stop paying attention, and real incidents get missed. Prevention strategy: only alert on symptoms (user-visible impact) not causes. Symptom alert: high error rate. Cause alert: database connection timeout — often too specific. Four golden signals to always alert on: Latency (P99 > SLA), Traffic (abnormal request rate), Errors (error rate > threshold), Saturation (CPU/memory/disk approaching limit). For each alert: add FOR duration (5 minutes for critical, 15 for warning) to prevent noise from transient spikes. Add runbook_url annotation pointing to documented response. Inhibition rules: if a node is down, suppress all pod alerts from that node — the root cause is the node, not the individual pods. Group related alerts in Alertmanager: group by namespace so 50 pod alerts from one bad deployment become one grouped notification. Route by team: platform team gets infra alerts, app team gets their service alerts. Review alerts monthly — if an alert fires more than twice a week for a non-incident, it is threshold too low or not important enough.


## 🗺️ Roadmap›





Day 1
Install

Install kube-prometheus-stack
Access Grafana — import K8s dashboards
Run first PromQL query



Week 1
PromQL

Learn rate(), histogram_quantile()
CPU, memory, error rate queries
Instrument your own app with /metrics



Week 2
Alerting

Write PrometheusRule with FOR duration
Configure Alertmanager Slack route
Test alert end-to-end



Month 2
Production

Recording rules for expensive queries
Cardinality control
Thanos or VictoriaMetrics for long-term storage
OpenTelemetry integration


Continue Learning
[📊 ELK Stack](/monitoring/elk.html)[📈 Datadog](/monitoring/datadog.html)[☸️ Kubernetes](/devops/kubernetes.html)[🏠 All Topics](/)

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

---

## Prometheus vs Datadog — Interview Answer Framework
