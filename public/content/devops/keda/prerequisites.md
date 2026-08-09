# KEDA — Prerequisites

## What to Know Before Starting KEDA

KEDA is a focused extension to Kubernetes' existing autoscaling model — the prerequisites are mostly about understanding HPA's limitations first, since KEDA's entire value proposition is framed as solving what HPA can't.

## Required (Must Have)

### 1. Kubernetes HPA Fundamentals
```bash
kubectl get hpa
kubectl describe deployment
```
You need to understand what the Horizontal Pod Autoscaler does by default (scaling on CPU/memory) before KEDA's "scale on any metric" pitch means anything concrete — Overview's own framing (a Kafka consumer with low CPU but massive lag) assumes you already know why HPA alone would miss that.

### 2. Basic Message Queue / Event Source Concepts
- What a message queue is, at a conceptual level (Kafka, RabbitMQ, or similar)
- What "consumer lag" means — messages waiting to be processed
- You don't need deep Kafka/RabbitMQ administration experience, just enough to understand why lag matters as a scaling signal

### 3. Helm and kubectl Comfort
```bash
helm install / helm upgrade
kubectl get pods -n keda
```
KEDA installs via Helm and is managed entirely through Kubernetes CRDs (`ScaledObject`, `ScaledJob`) — the same interaction pattern as any other Kubernetes-native operator.

## Nice to Have (Speeds Up Learning)

### Prometheus Basics
KEDA can scale on Prometheus query results as a trigger — prior exposure to PromQL (this site's Prometheus section) makes that specific trigger type immediately understandable rather than new syntax.

### Cloud-Native Identity Concepts (IRSA, Workload Identity)
Intermediate's `TriggerAuthentication` material covers both secret-based and cloud-identity-based credential patterns — basic familiarity with your cloud provider's pod-identity mechanism speeds up that section specifically.

### HTTP/Networking Basics
The KEDA HTTP Add-on (Intermediate) assumes basic understanding of why a scaled-to-zero HTTP service needs special handling for its first incoming request.

## What You Do NOT Need

- Deep Kafka/RabbitMQ administration expertise — KEDA scalers are pre-built connectors, not something you write from scratch
- Prior custom Kubernetes controller/operator development experience
- Multi-cluster infrastructure experience — the core concepts apply on a single cluster

## Time Estimate

If you have the prerequisites above:
- Fundamentals: 1 day
- Intermediate + Advanced: 3-4 days
- Job-ready (comfortable with ScaledObjects, activation thresholds, and the HPA behavior tuning covered in Intermediate): 1-2 weeks

## Start Here

Go to the **Installation** section to install KEDA, then proceed to **Fundamentals**.
