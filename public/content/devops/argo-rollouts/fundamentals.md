# Argo Rollouts

CI/CD › Argo Rollouts
🚀**Argo Rollouts**
BeginnerEngineerProductionArchitectProgressive delivery — canary, blue-green, metric-driven promotion, automatic rollback
[What is Argo Rollouts](#sec-what)[Canary Rollout](#sec-canary)[AnalysisTemplate](#sec-analysis)[Interview Q&A](#sec-interview)


## 🚀 What is Argo Rollouts?›


#### Why standard Kubernetes rolling updates are not enough

A standard Kubernetes rolling update replaces pods one by one. The moment new pods are live, real users hit them. If the new version has a bug — even a subtle performance regression — it is immediately affecting users. You have no way to send only 10% of traffic to the new version while keeping 90% on the old version.


Argo Rollouts adds the missing layer: **traffic management + metric analysis + automated rollback**. Deploy new version, measure its behaviour scientifically, promote or rollback based on data.


|  | K8s Rolling Update | Argo Rollouts Canary |
|---|---|---|
| Traffic control | None — all traffic shifts as pods replace | Precise % control — 10%, 25%, 50% |
| Metric-based promotion | None | Prometheus/Datadog queries drive promotion |
| Automatic rollback | Only on pod crash (not on high error rate) | On ANY metric threshold breach |
| Pause for approval | No | Pause at any step for human approval |


**Real Scenario — Payment Service**HPE payment processing: deploy v2.1.0 as 10% canary. AnalysisRun queries Prometheus every minute for P99 latency and error rate. If both healthy for 5 checks, auto-promote to 25%. At 50% traffic, pause for manual approval from release manager. After approval, promote to 100%. If any analysis check fails at any stage: automatic rollback to stable within 2 minutes. Zero human watching dashboards at deployment time.


Install + kubectl plugin + watch commandCopy

```

```


## 🐦 Canary Rollout›


Complete Rollout spec with Istio traffic routing + stepsCopy

```

```


## 📊 AnalysisTemplate — Data-Driven Promotion›


#### This is what separates progressive delivery from just a slow rollout

Without AnalysisTemplate: canary just waits a fixed time then promotes. A bug that appears after 10 minutes would not be caught. With AnalysisTemplate: Prometheus (or Datadog, or a custom webhook) is queried continuously. The system promotes or rolls back based on real metric data, not time elapsed.


AnalysisTemplate with Prometheus success rate + latencyCopy

```

```


## 🚀 Deployment Strategies — Canary and Blue-Green Deep Dive›


#### Why Argo Rollouts over standard Kubernetes rolling updates?

Standard Kubernetes rolling update sends traffic to new pods as soon as they start. There is no traffic splitting, no automated analysis, no pause-and-check. Argo Rollouts adds: controlled traffic percentages, automated metric analysis (roll back if error rate rises), manual pause gates, and full visibility of the rollout progress.


| Strategy | How it works | When to use |
|---|---|---|
| Canary | Send a small % of traffic to new version first. Monitor. Gradually increase. Auto-rollback if metrics fail. | Applications where you want to limit blast radius. Most common in production. |
| Blue-Green | New version (green) deployed fully alongside old (blue). Switch 100% traffic at once. Old stays for instant rollback. | Databases, stateful services, when you need instant full-cutover or instant rollback. |
| Rolling (native K8s) | Gradually replace old pods with new. No traffic control. | Non-critical apps, when you just need basic zero-downtime. |


#### Complete canary rollout example

```
apiVersion: argoproj.io/v1alpha1
kind: Rollout
metadata:
name: payment-api
namespace: production
spec:
replicas: 10
selector:
matchLabels:
app: payment-api
template:          # same as Deployment pod template
metadata:
labels:
app: payment-api
spec:
containers:
- name: payment-api
image: myacr.azurecr.io/payment-api:v2.1.0
ports:
- containerPort: 8080
strategy:
canary:
steps:
- setWeight: 10        # Step 1: send 10% traffic to new version
- pause: {duration: 5m}  # wait 5 minutes, observe metrics
- setWeight: 30        # Step 2: increase to 30%
- pause: {}            # pause indefinitely — manual promotion needed
- setWeight: 60
- pause: {duration: 10m}
- setWeight: 100       # Step 4: full rollout
canaryService: payment-api-canary    # Service pointing to new pods
stableService: payment-api-stable    # Service pointing to old pods
trafficRouting:
nginx:
stableIngress: payment-ingress   # NGINX Ingress controls traffic split
```


#### Complete blue-green example

```
strategy:
blueGreen:
activeService: payment-api           # currently receiving traffic (blue)
previewService: payment-api-preview  # new version deployed here (green)
autoPromotionEnabled: false          # require manual promotion
scaleDownDelaySeconds: 30            # keep blue running 30s after promotion
prePromotionAnalysis:                # run analysis before switching traffic
templates:
- templateName: success-rate
args:
- name: service-name
value: payment-api-preview
```


## 📊 AnalysisTemplate — Automated Rollback›


#### AnalysisTemplate queries Prometheus/Datadog to decide pass or fail

```
apiVersion: argoproj.io/v1alpha1
kind: AnalysisTemplate
metadata:
name: success-rate
spec:
args:
- name: service-name
metrics:
- name: success-rate
interval: 2m           # check every 2 minutes
count: 3               # must pass 3 consecutive checks
successCondition: result[0] >= 0.95   # 95% success rate require
