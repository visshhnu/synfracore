# Prometheus + Grafana Complete Guide

Monitoring › Prometheus
**Prometheus + Grafana**
BeginnerEngineerProductionArchitectTime-series monitoring — metrics, PromQL, alerts, Grafana dashboards
[What is Prometheus](#sec-what)[Metric Types](#sec-metrics)[PromQL](#sec-promql)[Alert Rules](#sec-alerts)[Alertmanager](#sec-alertmanager)[Troubleshoot](#sec-troubleshoot)[Interview Q&A](#sec-interview)[Roadmap](#sec-roadmap)


## 🔥 What is Prometheus + Grafana?›


#### The Monitoring Problem

When a user reports slow responses at 3pm on Tuesday, you need to answer: was it slow before the last deployment? Was it one pod or all pods? Was CPU high or memory? Was the database slow? Without time-series monitoring, you cannot answer any of these retrospectively. Prometheus records every metric as a timestamped value, forever. Grafana lets you visualise and query that history.


#### How it Works

| Step | What happens |
|---|---|
| 1. Application exposes metrics | Your app has a GET /metrics endpoint returning Prometheus format text |
| 2. Prometheus scrapes | Every 15-30 seconds, Prometheus calls /metrics on every target |
| 3. Stored as time-series | Each metric value stored with timestamp + labels in local TSDB |
| 4. Grafana queries | Grafana sends PromQL queries to Prometheus, renders charts |
| 5. Alert evaluation | Prometheus evaluates alert rules every 30 seconds |
| 6. Alertmanager routes | If rule fires, Alertmanager sends to Slack/PagerDuty/email |


#### Prometheus vs Alternatives

|  | Prometheus | Datadog | Nagios |
|---|---|---|---|
| Cost | Free and open source | $15+/host/month | Free (complex) |
| Model | Pull (scrape) | Push (agent) | Check-based |
| Kubernetes | Native, ServiceMonitor CRD | DaemonSet agent | Plugins, not native |
| Query power | PromQL — very powerful | Good | None |
| Best for | K8s, on-prem, multi-cloud, cost-sensitive | SaaS, ease of use, APM | Legacy, simple checks |


Install kube-prometheus-stack + access GrafanaCopy

```

```


## 📊 Metric Types — What They Mean›


#### Why metric types matter

Using the wrong metric type or wrong PromQL function is the most common Prometheus mistake. A counter used with the wrong function looks like it is always zero or always at max. Understanding types prevents these bugs.


All four metric types with examplesCopy

```

```


## 🔍 PromQL — Essential Queries›


#### PromQL — the query language you must know

PromQL is not SQL. It is designed for time-series data. Key operators: rate() for counter speed, histogram_quantile() for percentiles, by() for grouping, without() for removing labels, topk() for top N, avg_over_time() for rolling average.


Essential PromQL queries — CPU, memory, errors, K8sCopy

```

```


## 🚨 Alert Rules — Writing Good Alerts›


#### What makes a good alert?


- **Actionable** — someone waking up at 3am must know exactly what to do

- **Has FOR duration** — transient spikes should not fire alerts

- **Has runbook_url** — link to documented response procedure

- **Tests symptoms not causes** — alert on high error rate, not on "database connection timeout"

- **Right severity** — CRITICAL wakes people up, WARNING can wait until morning


PrometheusRule with real production alertsCopy

```

```


## 📬 Alertmanager — Routing Alerts›


#### What is Alertmanager?

Alertmanager handles routing, deduplication, grouping, and silencing of alerts. Prometheus evaluates rules and fires alerts. Alertmanager decides who gets notified, how, and when. Without Alertmanager you would get a separate Slack message for every single pod that crashed — with it, 50 pod restarts become one grouped notification.


Alertmanager config — Slack, PagerDuty, inhibitionCopy

```

```


## 🔍 Troubleshooting›


#### Systematic debugging approach

The Prometheus targets page at `http://prometheus:9090/targets` is your first debugging stop. Green = scraping successfully, Red = failing (check error message). From there you can determine if the problem is ServiceMonitor labels, network, or the application itself.


Common issues and fixesCopy

```

```


## 🎯 Interview Questions›


All
Architect
Engineer
Production


PROMETHEUS · ENGINEER
What is Prometheus and how does it differ from traditional monitoring tools like Nagios?
Prometheus is a pull-based, time-series monitoring system. It periodically scrapes metrics from HTTP endpoints on your applications and infrastructure. Nagios and Zabbix are check-based — they periodically run a check script (is the service responding? is disk below 90%?) and return OK/WARNING/CRITICAL. The fundamental difference: Prometheus stores actual metric values over time as numbers, enabling powerful queries like trends, rates, and percentile calculations. Nagios only knows current state. With Prometheus you can ask: what was the 99th percentile latency last Tuesday between 2pm-4pm? What is the rate of change in memory usage over the last 6 hours? Nagios cannot answer these. Prometheus is cloud-native — designed for containers w
