# Loki

Monitoring › Loki
📊**Loki**
BeginnerEngineerArchitectLog aggregation — Promtail → Loki → Grafana, LogQL queries, vs Elasticsearch
[What is Loki](#sec-what)[Architecture](#sec-architecture)[LogQL](#sec-logql)[Q&A](#sec-interview)


## 📊 What is Loki?›


#### What is Loki?

Loki is a **log aggregation system built by Grafana Labs** — designed as the logging equivalent of Prometheus. It collects logs from all your applications and infrastructure, stores them cost-efficiently, and lets you query them using LogQL — a language with the same feel as Prometheus's PromQL.


Loki is part of the **PLG stack**: **P**romtail (log collector on every node) → **L**oki (log storage and query engine) → **G**rafana (visualisation and alerting). All three integrate natively — you query metrics and logs side by side in the same Grafana dashboard.


#### Why Loki is different from Elasticsearch

The fundamental difference is the **indexing strategy**. Elasticsearch indexes the full text of every log — every word becomes searchable. Fast for arbitrary searches but the index is large (20-30% of raw log volume) and Elasticsearch clusters are expensive to operate. Loki indexes **only labels** (metadata: namespace, app, pod, environment) — never the log content. Log content is stored as compressed text chunks in cheap object storage (S3, GCS, Azure Blob Storage).

|  | Loki | Elasticsearch (ELK) |
|---|---|---|
| What is indexed | Labels only (namespace, app, pod) | Full text of every log message |
| Storage cost | Very low — compressed chunks in S3/GCS | High — Elasticsearch index + shard storage |
| Query speed | Fast for label-based, slower for full-text scan | Fast for any text search |
| Setup complexity | Simple — 3 components, one Helm chart | Complex — ES cluster sizing, JVM tuning |
| Integration | Native Grafana data source | Kibana (separate UI) |
| Best for | K8s logs with consistent labels | Full-text search, unknown log patterns |


## 🏗️ Architecture — Promtail, Loki, Grafana›

#### Loki components and how they work together
| Component | What it does |
|---|---|
| Promtail | Agent that runs on every node. Reads container logs from /var/log/pods/, attaches K8s labels (pod, namespace, app), sends to Loki. |
| Loki | The log aggregation server. Receives logs, indexes only labels (not content), stores compressed chunks in object storage (S3/GCS/Azure Blob). |
| Grafana | Query and visualise logs using Explore tab + LogQL. Create dashboards combining Prometheus metrics and Loki logs. |
| Ruler | Evaluate LogQL rules and send alerts (like Prometheus AlertManager but for logs). |

#### Why Loki is different from ELK
|  | Loki | ELK (Elasticsearch) |
|---|---|---|
| Index | Labels only (like Prometheus) — small index | Full-text search index — large index |
| Storage cost | Very low — compressed chunks in object storage | High — Elasticsearch is expensive to store |
| Query speed | Fast for label-based queries, slower for full-text | Faster for arbitrary text search |
| Setup complexity | Simple — Helm chart, 3 components | Complex — ES cluster tuning required |
| Best for | Known log patterns, Kubernetes label-based queries | Full-text search, unknown log patterns |

#### Install Loki stack with Helm
```
helm repo add grafana https://grafana.github.io/helm-charts
helm repo update

# Install Loki + Promtail + Grafana together
helm install loki-stack grafana/loki-stack   --namespace monitoring   --set grafana.enabled=true   --set prometheus.enabled=true   --set loki.persistence.enabled=true   --set loki.persistence.size=50Gi
```

#### Promtail config — scrape K8s pod logs
```
scrape_configs:
- job_name: kubernetes-pods
kubernetes_sd_configs:
- role: pod
pipeline_stages:
- docker: {}          # parse Docker log format
- json:               # parse JSON app logs
expressions:
level: level
msg: message
duration: duration
relabel_configs:
- source_labels: [__meta_kubernetes_pod_label_app]
target_label: app
- source_labels: [__meta_kubernetes_namespace]
target_label: namespace
```


## 🔍 LogQL — Querying Logs›


#### LogQL syntax — label selector then pipeline filters

Every LogQL query starts with a **log stream selector** in curly braces (selects which logs using the label index — fast). Then optional **pipeline stages** filter or parse the content.


```
# Basic label selection
{namespace="production"}
{namespace="production", app="payment-api"}

# Text filters
{namespace="production"} |= "ERROR"            # contains ERROR
{namespace="production"} != "DEBUG"            # excludes DEBUG
{namespace="production"} |~ "timeout|refused"  # regex match

# JSON log parsing
{app="payment-api"} | json | level="error"
{app="payment-api"} | json | duration > 1000

# Metric queries — count log lines
rate({namespace="production"} |= "ERROR" [5m])

# Error rate per service over time
sum by (app) (rate({namespace="production"} |= "ERROR" [5m]))

# Error ratio (errors / total)
sum(rate({namespace="production"} |= "ERROR" [5m])) /
sum(rate({namespace="production"} [5m]))
```


#### Common LogQL patterns
| Use case | LogQL query |
|---|---|
| All errors in namespace | {namespace="production"} |= "ERROR" |
| Specific pod logs | {pod="payment-api-7d8f9-xyz"} |
| JSON field filter | {app="api"} | json | status_code >= 500 |
| Error rate per app | sum by(app)(rate({ns="prod"} |= "ERROR" [5m])) |
| Slowest requests | {app="api"} | json | unwrap duration | p99 by (endpoint) [5m] |


#### Using Loki in Grafana

In Grafana: go to Explore → select Loki as data source → paste LogQL query. The result shows matching log lines in a timeline. Switch to Metrics view to see the rate chart. Create Dashboard panels combining Prometheus error rate metrics with Loki log lines for the same service side by side — correlation without context switching.


## 🚀 Promtail — Log Collection›


Promtail config + drop health checksCopy

```

```


## 🚨 Alerting from Logs›


#### Alert on log content — no need to instrument your app

Loki Ruler evaluates LogQL expressions on a schedule and fires alerts — just like Prometheus evaluates PromQL. Alert on ERROR rate, specific exception messages, or any log pattern.


Loki alerting rules + Grafana dashboardCopy

```

```


## 🎯 Interview Questions›


All
Architect
Engineer
Production


LOKI · ENGINEER
What is Loki and how does it differ from ELK?
Loki is a log aggregation system by Grafana designed to be cost-effective and Kubernetes-native. The key architectural difference from ELK: Loki does not index the content of log messages. It o
