# Datadog Complete Guide

Monitoring › Datadog
**Datadog**
BeginnerEngineerProductionArchitectSaaS observability — metrics, APM, distributed tracing, logs
[What is Datadog](#sec-what)[Metrics & Monitors](#sec-metrics)[APM Tracing](#sec-apm)[Logs](#sec-logs)[Troubleshoot](#sec-troubleshoot)[Interview Q&A](#sec-interview)


## 📈 What is Datadog?›


#### Datadog vs Prometheus+Grafana vs ELK

|  | Datadog | Prometheus+Grafana | ELK |
|---|---|---|---|
| Type | SaaS all-in-one | Self-hosted metrics | Self-hosted logs |
| Covers | Metrics + logs + traces + APM | Metrics + alerting | Logs only |
| Setup | 5 minutes (one Helm chart) | 30 minutes | Hours |
| Cost | $15-35/host/month | Free | Free (self-hosted) |
| Best for | APM, distributed tracing, unified platform | K8s metrics, cost-sensitive | Complex log analysis |


Install Datadog on KubernetesCopy

```

```


## 📊 Metrics, Monitors & Dashboards›


#### Four Golden Signals — every service dashboard

These four metrics tell you everything about a service's health. If all four are green, users are happy.


| Signal | What it tells you | Datadog metric example |
|---|---|---|
| Latency | How fast are requests? | trace.http.request.duration (P95) |
| Traffic | How much load? | trace.http.request.hits |
| Errors | Are requests failing? | trace.http.request.errors |
| Saturation | How full is the system? | kubernetes.cpu.usage.total |


Monitors + API + dashboard designCopy

```

```


## 🔭 APM — Distributed Tracing›


#### Why distributed tracing matters

A request is slow. Without APM: you check every service log manually for 30 minutes. With APM: click the slow trace, see the waterfall — the database query at step 4 took 2.3 seconds. Done in 30 seconds.


APM instrumentation — Python, Java, auto-injectCopy

```

```


## 📄 Log Management›


Log collection, parsing, log-based metricsCopy

```

```


## 🔍 Troubleshooting & Cost›


Agent not sending, missing metrics, cost reductionCopy

```

```


## 🎯 Interview Questions›


All
Architect
Engineer
Production


DATADOG · ENGINEER
What is Datadog and when would you choose it over Prometheus+Grafana?
Datadog is a SaaS observability platform covering metrics, logs, traces, APM, synthetic testing, and security in one platform. You choose Datadog over Prometheus+Grafana when: team does not want operational overhead of managing monitoring infrastructure, you need distributed tracing (APM) with automatic service dependency mapping, you want logs and metrics in the same tool with automatic correlation, you need synthetic monitoring of external endpoints, or you need ML-based anomaly detection. Prometheus+Grafana wins when: cost is a priority (Datadog is $15-35/host/month, Prometheus is free), team has Kubernetes expertise and wants fine-grained control, you are multi-cloud and want one consistent tool, or you need custom PromQL queries Datadog cannot express. In practice: large enterprises often use BOTH — Prometheus for detailed K8s metrics and alerting, Datadog for APM and distributed tracing where auto-instrumentation saves weeks of engineering.

DATADOG · PRODUCTION
Datadog agent on Kubernetes is not sending metrics. How do you troubleshoot?
Layered debugging. First: is the agent pod running? kubectl get pods -n datadog shows DaemonSet should have one pod per node. If pod is in CrashLoopBackOff, check logs: kubectl logs daemonset/datadog -n datadog. Second: check agent status from inside the pod. kubectl exec -it datadog-agent-pod -- agent status. This shows all checks, whether they are passing, and any errors. Third: verify API key is valid. kubectl exec -it datadog-agent-pod -- agent check datadog. A wrong API key gives 403 Forbidden. Fourth: check network connectivity. Can the agent reach api.datadoghq.com on port 443? Some clusters have restrictive egress policies. kubectl exec -it datadog-agent-pod -- curl -v https://api.datadoghq.com. Fifth: check if custom metrics are enabled if you expect custom metrics. clusterAgent.metricsProvider.enabled must be true in Helm values. Common issue at scale: the cluster agent (not the node agent) is responsible for Kubernetes state metrics. If the cluster agent is down, pod/deployment metrics disappear from Datadog even though node agents are running.

DATADOG · ARCHITECT
How does Datadog APM work? What is distributed tracing?
Distributed tracing tracks a single user request as it flows through multiple services. Without tracing: you see slow responses but don't know if the slowness is in the API, the database call, or the downstream payment service. With tracing: every request gets a unique trace ID. Each service that handles the request creates a span (start time, end time, tags). All spans with the same trace ID are linked into a waterfall diagram showing exactly where time was spent. Implementation: instrument each service with a Datadog tracer (ddtrace for Python, dd-java-agent for Java). The tracer automatically creates spans for HTTP requests, database queries, Redis cal
