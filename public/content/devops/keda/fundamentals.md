# KEDA

Containers › KEDA
⚡**KEDA**
BeginnerEngineerProductionArchitectEvent-driven autoscaling — Kafka lag, scale to zero, batch jobs, 60+ scalers
[What is KEDA](#sec-what)[ScaledObject](#sec-scaledobject)[ScaledJob](#sec-scaledjob)[Interview Q&A](#sec-interview)


## ⚡ What is KEDA?›


#### HPA vs KEDA — the key gap

| Metric | HPA | KEDA |
|---|---|---|
| CPU/memory | ✅ Native | ✅ Via Prometheus trigger |
| Kafka lag | ❌ | ✅ Native Kafka trigger |
| SQS/Service Bus | ❌ | ✅ Native cloud triggers |
| Custom Prometheus | ⚠️ Needs adapter | ✅ Direct query |
| Scale to zero | ❌ Min 1 replica | ✅ Min 0 replicas |
| ScaledJob (batch) | ❌ | ✅ Native |


**Real Scenario — Telecom Alarm Processing**A telecom alarm notification service processed network events from Kafka. Before KEDA: 3 replicas always running. After KEDA Kafka trigger: 0 replicas at 2am (no alarms), auto-scales to 8+ during morning alarm storms when hundreds of network elements report simultaneously. Consumer lag never exceeds 50 messages. Cost: 65% reduction on that service alone. The business benefit: alarms are processed faster during peak (more pods), less waste during quiet periods (zero pods).


Install KEDA + concept overviewCopy

```

```


## 📄 ScaledObject›


Kafka + Azure Service Bus + Prometheus triggersCopy

```

```


## 🔨 ScaledJob — Batch Processing›


#### ScaledJob vs ScaledObject

**ScaledObject**: wraps a Deployment. Scales a long-running consumer up/down based on queue depth. The pods keep running, processing messages.


**ScaledJob**: creates Kubernetes Jobs. Each job processes a fixed batch and exits. Use for: report generation, data migration, one-shot tasks where each unit of work should be isolated.


ScaledJob + TriggerAuthentication with IRSACopy

```

```


## ⚡ How KEDA Works›

#### KEDA fills the gap that HPA cannot fill

Standard HPA scales on CPU and memory only. Most real workloads need to scale on business metrics: queue depth, message count, custom Prometheus metrics. KEDA extends HPA to support 60+ event sources natively.


External trigger (Queue, Kafka, Cron, Prometheus)
↓
KEDA Metrics Adapter — reads trigger, converts to K8s metrics
↓
KEDA Operator — creates/manages HPA on your behalf
↓
HPA scales Deployment/StatefulSet/Job
↓
Scale to ZERO when no messages (HPA minimum is 1 — KEDA goes to 0)
| Feature | HPA | KEDA |
|---|---|---|
| Scale metric | CPU, Memory only | 60+ sources: Kafka, SQS, RabbitMQ, Prometheus, Cron, HTTP... |
| Scale to zero | No — min 1 replica | Yes — 0 replicas when no events |
| ScaledJob | No | Yes — K8s Job per message, not long-running Deployment |

```
helm repo add kedacore https://kedacore.github.io/charts
helm install keda kedacore/keda --namespace keda --create-namespace
```


## 📦 ScaledObject Examples›

#### Kafka trigger — scale consumers with queue depth
```
apiVersion: keda.sh/v1alpha1
kind: ScaledObject
metadata:
name: payment-processor-scaler
namespace: production
spec:
scaleTargetRef:
name: payment-processor
minReplicaCount: 0           # scale to ZERO when queue empty
maxReplicaCount: 50
pollingInterval: 15
cooldownPeriod: 300
triggers:
- type: kafka
metadata:
bootstrapServers: kafka-broker:9092
consumerGroup: payment-processors
topic: payment-events
lagThreshold: "100"      # 1 replica per 100 unprocessed messages
authenticationRef:
name: kafka-trigger-auth
```

#### Prometheus trigger
```
triggers:
- type: prometheus
metadata:
serverAddress: http://prometheus.monitoring:9090
metricName: active_checkout_sessions
threshold: "50"
query: sum(active_checkout_sessions{app="checkout"})
```

#### Cron trigger — scale on schedule
```
triggers:
- type: cron
metadata:
timezone: Asia/Dubai
start: "0 8 * * 1-5"      # scale up at 8am weekdays
end: "0 18 * * 1-5"       # scale down at 6pm weekdays
desiredReplicas: "10"
```


## 🎯 Interview Questions›


All
Architect
Engineer
Production


KEDA · ENGINEER
What is KEDA and why is it better than HPA for event-driven workloads?
KEDA is Kubernetes Event-Driven Autoscaling. It extends the native Horizontal Pod Autoscaler to support scaling based on external event sources — Kafka consumer lag, message queue depth, HTTP request rate, custom Prometheus metrics. The fundamental limitation of HPA: it scales based only on CPU and memory. If you have a Kafka consumer processing messages, its CPU usage might be low even when the queue has 100,000 messages backed up — HPA would not scale it up. KEDA directly queries the Kafka consumer group lag and scales based on that real signal. The other critical KEDA capability: scale to zero. HPA has a minimum of 1 replica. KEDA can scale to 0. For event-driven workloads that are idle most of the time — batch jobs, off-hours processors, weekend report generators — scale-to-zero saves significant cost. Real scenario: at HPE, a telecom alarm notification service ran 24/7 at 3 replicas even though 90% of alarms arrive during business hours. After KEDA with Kafka trigger: 0 replicas at night, scales to 5+ during alarm storms, automatically. Monthly compute cost for that service dropped by 65%.

KEDA · ARCHITECT
How do you use KEDA for cost optimisation in a Kubernetes environment?
Scale-to-zero is the primary
