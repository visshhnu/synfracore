# KEDA Interview Q&A

**Q: What is KEDA and why use it?**
Kubernetes Event-Driven Autoscaler. Scales workloads based on external metrics (Kafka lag, queue depth, Prometheus metrics, cron schedule). Unlike HPA (CPU/memory only), KEDA can scale to zero and from zero. Critical for cost optimization in event-driven architectures.

**Q: KEDA vs HPA?**
HPA: built-in, CPU/memory based, min replicas >= 1. KEDA: event-driven, 50+ scalers, can scale to zero. KEDA creates HPA under the hood but with custom metrics. They can work together.

**Q: What is a ScaledObject?**
KEDA CRD that defines scaling behavior: which deployment to scale, what triggers (scalers), min/max replicas, polling interval. KEDA watches the trigger source and adjusts HPA target replicas.
