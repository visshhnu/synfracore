# KEDA

> **Event-driven autoscaling — scale on Kafka lag, queue depth, cron, custom metrics**

**Category:** Containers & Orchestration  
**Learning Path:** What → Why → Architecture → Setup → Real Examples → Production → Interview Prep

---

## What is KEDA?

HPA only scales on CPU and memory. Problem: a Kafka consumer pod has low CPU even when 1 million messages are backed up — HPA won't scale it. KEDA (Kubernetes Event-Driven Autoscaling) scales on ANY metric — Kafka consumer lag, RabbitMQ queue depth, Azure Service Bus message count, cron schedule, Prometheus metrics. Killer feature: scale to zero when queue is empty, then scale up when messages arrive. From a large telecom organisation: our Kafka consumers needed KEDA not HPA because CPU stayed low during lag spikes.

## Why KEDA?

ScaledObject is the KEDA CRD that replaces HPA. It has a scaleTargetRef (your Deployment), min/max replica counts, and triggers. Multiple triggers can be combined — scale based on EITHER Kafka lag OR CPU, whichever is higher. activationLagThreshold is the minimum before scaling from zero — prevents thrashing.

---

## Learning Modules

### Module 01 — Why KEDA over HPA?
*HPA limitations and event-driven scaling*

HPA only scales on CPU and memory. Problem: a Kafka consumer pod has low CPU even when 1 million messages are backed up — HPA won't scale it. KEDA (Kubernetes Event-Driven Autoscaling) scales on ANY metric — Kafka consumer lag, RabbitMQ queue depth, Azure Service Bus message count, cron schedule, Prometheus metrics. Killer feature: scale to zero when queue is empty, then scale up when messages arrive. From a large telecom organisation: our Kafka consumers needed KEDA not HPA because CPU stayed low during lag spikes.

**Topics covered:**

- HPA limitation: only CPU and memory — 🟢 Beginner
- KEDA: scale on ANY metric — 🟢 Beginner
- Scale to zero — cost savings — 🟡 Intermediate
- KEDA architecture and how it works — 🟡 Intermediate
- CNCF graduated project status — 🟢 Beginner

```bash
# The HPA problem:
# Kafka consumer: CPU=5%, Memory=200MB (looks healthy)
# But consumer lag = 2,000,000 messages (NOT healthy)
# HPA sees: "everything is fine, no scaling needed"
# Reality: 2M messages are waiting — users are experiencing delays

# KEDA solves this:
# Install KEDA
helm repo add kedacore https://kedacore.github.io/charts
helm install keda kedacore/keda \\
  --namespace keda \\
  --create-namespace

# Verify
kubectl get pods -n keda
# keda-operator-xxx       Running
# keda-metrics-apiserver  Running
```

### Module 02 — ScaledObject Examples
*Kafka, RabbitMQ, cron, Prometheus*

ScaledObject is the KEDA CRD that replaces HPA. It has a scaleTargetRef (your Deployment), min/max replica counts, and triggers. Multiple triggers can be combined — scale based on EITHER Kafka lag OR CPU, whichever is higher. activationLagThreshold is the minimum before scaling from zero — prevents thrashing.

**Topics covered:**

- Scale on Kafka consumer lag — 🟡 Intermediate
- Scale on RabbitMQ queue depth — 🟡 Intermediate
- Cron-based scaling (scale up at 9am, down at 6pm) — 🟢 Beginner
- Scale on Prometheus metrics — 🔴 Advanced
- Scale to zero and activation threshold — 🟡 Intermediate

```bash
# ScaledObject: scale Kafka consumer on lag
apiVersion: keda.sh/v1alpha1
kind: ScaledObject
metadata:
  name: payment-consumer-scaler
  namespace: production
spec:
  scaleTargetRef:
    name: payment-consumer      # Your Deployment name
  minReplicaCount: 0            # Scale to ZERO when no messages
  maxReplicaCount: 50           # Maximum scale
  pollingInterval: 15           # Check every 15 seconds
  cooldownPeriod: 60            # Wait 60s before scaling down
  triggers:
  - type: kafka
    metadata:
      bootstrapServers: kafka.production:9092
      consumerGroup: payment-processor
      topic: payment-events
      lagThreshold: "1000"         # 1 replica per 1000 messages lag
      activationLagThreshold: "100" # Min lag to scale from 0 → 1
---
# ScaledObject: cron-based scaling
# Scale up before business hours, down at night
apiVersion: keda.sh/v1alpha1
kind: ScaledObject
metadata:
  name: api-cron-scaler
spec:
  scaleTargetRef:
    name: api-server
  triggers:
  - type: cron
    metadata:
      timezone: Asia/Kolkata
      start: "0 8 * * 1-5"     # 8am Monday-Friday → scale up
      end: "0 20 * * 1-5"      # 8pm Monday-Friday → scale down
      desiredReplicas: "10"
---
# ScaledObject: Prometheus metric
apiVersion: keda.sh/v1alpha1
kind: ScaledObject
metadata:
  name: prometheus-scaler
spec:
  scaleTargetRef:
    name: api-server
  triggers:
  - type: prometheus
    metadata:
      serverAddress: http://prometheus.monitoring:9090
      metricName: http_requests_per_second
      query: sum(rate(http_requests_total[2m]))
      threshold: "100"           # 1 replica per 100 RPS
```

---

## Production Example

```bash
# KEDA — Production Operations

# Check KEDA scaling status
kubectl get scaledobject -n production
# NAME                    SCALETARGETKIND   SCALETARGETNAME    MIN  MAX  READY
# payment-consumer-scaler  Deployment       payment-consumer    0    50   True

# Check current replica count
kubectl get hpa -n production
# KEDA creates an HPA under the hood — you can see it here

# Debug: why is KEDA not scaling?
kubectl describe scaledobject payment-consumer-scaler -n production
# Look for: Events section — shows scaling decisions

# Check KEDA operator logs
kubectl logs -n keda -l app=keda-operator -f

# SCALE TO ZERO — real cost saving example:
# Batch processor that only runs at night
# Normal HPA: minimum 2 replicas always running = cost 24/7
# KEDA + cron: 0 replicas during day, scales to 10 at 11pm
# Saving: ~70% compute cost for that workload

# KEDA ScaledJob — for one-off batch processing
# Instead of scaling a Deployment, creates fresh Jobs per message
apiVersion: keda.sh/v1alpha1
kind: ScaledJob
metadata:
  name: report-generator
spec:
  jobTargetRef:
    template:
      spec:
        containers:
        - name: report
          image: myreport:latest
  triggers:
  - type: rabbitmq
    metadata:
      queueName: report-requests
      queueLength: "1"    # One Job per message
```

---

## Interview Prep

!!! tip "PSR Formula"
    Answer every question: **Problem → Solution → Result**. 45-90 seconds max.

### Common Interview Questions

??? question "What is KEDA and why would you use it in production?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How does KEDA work internally? Explain the architecture."
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "What are the main components of KEDA?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How do you handle failures in KEDA?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "What is your production experience with KEDA?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How do you monitor and observe KEDA in production?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "What are the security considerations for KEDA?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How does KEDA compare to alternatives?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "Explain Why KEDA over HPA? in KEDA."
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "Explain ScaledObject Examples in KEDA."
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

---

## Official Resources

- [KEDA Documentation](https://keda.sh/docs/)
- [KEDA Scalers Reference](https://keda.sh/docs/latest/scalers/)
- [KEDA Helm Chart](https://github.com/kedacore/charts)

---

*Part of [LearnwithVishnu](https://learnwithvishnu.pages.dev) — Basics → Production → Architect*