# KEDA Interview Q&A

**Q: What is KEDA and why use it?**
Kubernetes Event-Driven Autoscaler. Scales workloads based on external metrics (Kafka lag, queue depth, Prometheus metrics, cron schedule). Unlike HPA (CPU/memory only), KEDA can scale to zero and from zero. Critical for cost optimization in event-driven architectures.

**Q: KEDA vs HPA?**
HPA: built-in, CPU/memory based, min replicas >= 1. KEDA: event-driven, 50+ scalers, can scale to zero. KEDA creates HPA under the hood but with custom metrics. They can work together.

**Q: What is a ScaledObject?**
KEDA CRD that defines scaling behavior: which deployment to scale, what triggers (scalers), min/max replicas, polling interval. KEDA watches the trigger source and adjusts HPA target replicas.

## Quick Reference — Keda

### Key Points for Revision

- Review the overview section for core architecture and fundamentals
- Practice commands/configurations from the cheatsheet section
- Use interview Q&A for active recall before exams or interviews
- Cross-reference with related tools in the devops academy

### Related Topics

Explore these connected topics to build complete understanding:
- Overview and Architecture
- Fundamentals and Core Concepts
- Advanced Patterns and Production Usage
- Interview Preparation Q&A
- Quick Reference Cheatsheet

### Practice Approach

1. Read the overview to understand *what* and *why*
2. Work through fundamentals for *how*
3. Attempt hands-on labs or configurations
4. Test yourself with interview questions
5. Keep cheatsheet accessible for quick reference during work

### Further Learning

Connect this topic to the broader devops ecosystem. 
Each tool in this academy is designed to work with others —
understanding the integration points is what separates intermediate from senior practitioners.

**Q: What happens when KEDA scales to zero?**
When trigger metric drops to zero (e.g., Kafka topic has no messages), KEDA sets HPA target replicas to 0. Kubernetes terminates all pods. When a new message arrives, KEDA detects it via the scaler, sets replicas to 1+ (minReplicaCount in the spec), and pods spin up. Cold start latency depends on image pull and application startup time.

**Q: How does KEDA differ from cluster autoscaler?**
KEDA: scales individual Deployments/StatefulSets based on custom metrics (Kafka lag, queue depth, cron). Cluster Autoscaler: scales the number of nodes in the cluster based on pending pods and node utilization. They work together: KEDA scales pods, Cluster Autoscaler adds nodes when pods can't be scheduled.

**Q: What are KEDA scalers? Name five common ones.**
Scalers are connectors to external metric sources: (1) Kafka — consumer group lag, (2) RabbitMQ — queue length, (3) Azure Service Bus — message count, (4) AWS SQS — queue depth, (5) Prometheus — any custom metric query, (6) Cron — scale based on time schedule, (7) Redis — list length, (8) NATS JetStream — consumer lag.

**Q: What is KEDA's TriggerAuthentication?**
CRD for managing credentials used by scalers. Stores secrets (Kafka SASL credentials, Azure connection strings) separately from ScaledObject. Can reference: Kubernetes secrets, pod identity (Azure MSI, AWS IRSA), HashiCorp Vault. Avoids embedding credentials in ScaledObject definition.

---

*This section is part of the SynfraCore learning platform. Use the sidebar to navigate to Overview, Fundamentals, Advanced, and Cheatsheet sections for comprehensive coverage of this topic.*

## Summary

This reference section complements the main content. For best results:
- Start with the Overview to understand the big picture
- Work through Fundamentals for core concepts
- Use this section alongside the Cheatsheet for quick recall
- Practice with Interview Q&A to test your understanding

Use the navigation sidebar to move between sections of this topic.
