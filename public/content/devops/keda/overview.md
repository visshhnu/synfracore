# KEDA

> **Event-driven autoscaling — scale on Kafka lag, queue depth, cron, custom metrics**

**Category:** Containers & Orchestration  
**Learning Path:** What → Why → Learning Modules → Production Example → Interview Prep

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

**PSR Formula:** Answer every question: **Problem → Solution → Result**. 45-90 seconds max.

### Common Interview Questions

**Q1. What is KEDA and why would you use it in production?**

**A:** **Problem:** the standard Kubernetes HPA only scales on CPU and memory, so a Kafka consumer pod can show 5% CPU and 200MB memory — "healthy" by HPA's metrics — while 2 million messages are backed up in the topic, because consuming a backlog isn't necessarily CPU-intensive. **Solution:** KEDA scales on any metric — Kafka consumer lag, RabbitMQ queue depth, cron schedule, Prometheus queries — via a `ScaledObject` CRD that replaces the HPA, and can scale a Deployment to zero replicas entirely when there's no work, then back up the moment messages arrive. **Result:** workloads whose real load signal isn't CPU (queue consumers being the classic case) actually scale correctly, and scale-to-zero cuts compute cost for anything that's idle a meaningful fraction of the time — a batch processor that only runs at night, for example.

---

**Q2. How does KEDA work internally? Explain the architecture.**

**A:** **Problem:** without knowing what's actually polling the external system, "why isn't my Deployment scaling" is hard to debug. **Solution:** the `keda-operator` watches `ScaledObject` resources and polls each configured trigger (Kafka, RabbitMQ, Prometheus, cron, etc.) on the interval set by `pollingInterval`; the `keda-metrics-apiserver` exposes those external metric values through the standard Kubernetes metrics API, which is what actually lets KEDA drive scaling through the same mechanism the HPA already uses internally — KEDA doesn't replace the HPA's scaling loop, it feeds it external metrics the loop wouldn't otherwise have access to. **Result:** a `ScaledObject` not scaling is either a trigger-connectivity problem (the operator can't reach Kafka/RabbitMQ/Prometheus — check `keda-operator` logs) or a threshold problem (`lagThreshold`/`activationLagThreshold` set too high for the actual traffic) — the two are diagnosed differently, one via operator logs, one via checking the actual metric value against the configured threshold.

---

**Q3. What are the main components of KEDA?**

**A:** **Problem:** "KEDA" is really two cooperating pieces plus a CRD, and knowing which does what matters for troubleshooting. **Solution:** `ScaledObject` is the CRD defining what to scale (`scaleTargetRef`), how (`minReplicaCount`/`maxReplicaCount`), and on what signal (`triggers:` — Kafka, RabbitMQ, cron, Prometheus, and dozens more scaler types); the `keda-operator` pod watches these CRDs and evaluates triggers; the `keda-metrics-apiserver` pod exposes the resulting external metrics to Kubernetes' own HPA mechanism. **Result:** `kubectl get pods -n keda` showing both `keda-operator` and `keda-metrics-apiserver` as Running is the first health check for the whole system — if either is down, no `ScaledObject` in the cluster will function correctly regardless of how it's configured.

---

**Q4. How do you handle failures in KEDA?**

**A:** **Problem:** a workload not scaling as expected could be a KEDA-system problem, a trigger-connectivity problem, or a threshold-tuning problem, and they look similar from the outside ("it's just not scaling"). **Solution:** first confirm `keda-operator`/`keda-metrics-apiserver` are running at all; then check `kubectl describe scaledobject <name>` — its Events section shows the actual scaling decisions and any trigger errors (like an unreachable Kafka broker); if the system is healthy and the trigger is connecting fine but scaling still feels wrong, it's almost always `lagThreshold`/`activationLagThreshold` tuned for the wrong traffic pattern, not a KEDA bug. **Result:** most real KEDA issues are the third category — a threshold set once at initial rollout that no longer matches actual traffic volume — which is a config change, not a debugging session, once the first two categories are ruled out via the operator logs and `describe scaledobject`.

---

**Q5. What is your production experience with KEDA?**

**A:** This is a genuinely personal question — answer with a real incident using the Problem → Solution → Result structure: what broke (a `lagThreshold` set too conservatively causing slow scale-up during a traffic spike, a Kafka broker connectivity issue that silently stalled scaling, cold-start latency after scale-to-zero causing a brief user-facing delay), your actual diagnostic sequence, and what the root cause turned out to be. Interviewers are listening for whether you have real operational experience, not textbook recall.

---

**Q6. How do you monitor and observe KEDA in production?**

**A:** **Problem:** scale-to-zero specifically makes "is this healthy" harder to answer at a glance — zero replicas could mean "no work to do" (correct) or "KEDA is stuck and should have scaled up already" (a real problem), and they look identical in a basic replica-count dashboard. **Solution:** `kubectl describe scaledobject <name>`'s Events section directly shows the last scaling decision and why; `keda-operator` logs surface trigger-connectivity failures; for the "should this be scaled up already" question specifically, comparing the actual queue/lag metric (from Kafka/RabbitMQ/Prometheus directly) against the configured threshold answers whether zero replicas is correct or KEDA has stalled. **Result:** a dashboard showing replica count alone is insufficient for KEDA-scaled workloads — the real health signal is replica count *against* the current trigger metric value, which is why the ScaledObject's own Events (not just `kubectl get pods`) is the primary diagnostic surface.

---

**Q7. What are the security considerations for KEDA?**

**A:** **Problem:** KEDA's triggers need credentials to poll external systems (Kafka brokers, RabbitMQ, cloud message queues), and those credentials are a real attack surface if scoped too broadly. **Solution:** trigger authentication should use KEDA's `TriggerAuthentication` CRD referencing a Kubernetes Secret (or a cloud-native identity like IRSA/workload identity where the scaler supports it) rather than embedding credentials directly in the `ScaledObject` spec; scope those credentials to read-only access on the specific queue/topic being monitored, not broad cluster-wide messaging-system access; the `keda-operator` itself runs with RBAC to read/scale target Deployments across the cluster, so its own ServiceAccount permissions should be reviewed like any other cluster-wide operator. **Result:** the most common real KEDA security gap isn't the scaling logic itself — it's over-scoped trigger credentials (e.g. full Kafka cluster admin access just to check consumer lag) left in place after the initial working configuration was reached.

---

**Q8. How does KEDA compare to alternatives?**

**A:** **Problem:** "autoscaling" has several answers depending on what signal actually reflects load. **Solution:** vs. the standard HPA alone — HPA is a subset of what KEDA does (CPU/memory only) and KEDA feeds it external metrics rather than replacing its core loop, so they're complementary, not competitors, for CPU-bound workloads; vs. Cluster Autoscaler/Karpenter — those scale *nodes*, KEDA scales *pods*, and a real event-driven workload typically needs both (KEDA scaling pods, a node autoscaler providing capacity for them); vs. hand-rolled polling scripts calling the Kubernetes API directly — KEDA is a CNCF-graduated, maintained project with dozens of built-in scaler types, which is a lot of undifferentiated engineering to replicate custom for one queue system. **Result:** the real comparison question is almost never "KEDA vs. X," it's "which layer does X operate at" — pod-level event-driven scaling is KEDA's specific job, and it composes with node autoscalers and the standard HPA rather than replacing either.

---

**Q9. Why does HPA fail for event-driven workloads like Kafka consumers, specifically?**

**A:** **Problem:** a Kafka consumer's CPU usage doesn't track message backlog in any reliable way — a consumer can sit at 5% CPU while polling an empty topic, and the exact same 5% CPU while a consumer group is badly behind on a topic with millions of buffered messages, because the bottleneck is network/broker throughput, not local compute. **Solution:** KEDA's Kafka scaler queries actual consumer group lag (via `lagThreshold`) directly from Kafka's own consumer-group offset metadata — the real signal for "is this consumer keeping up" — and scales replica count based on that, completely independent of CPU. **Result:** this is precisely the gap a large telecom org's real Kafka consumers hit — CPU staying flat during genuine lag spikes — and it's the concrete, mechanism-level reason "scale on the actual bottleneck metric, not a proxy for it" matters, not just an abstract best practice.

---

**Q10. Walk through how you'd design a ScaledObject for a Kafka consumer, including scale-to-zero — what do minReplicaCount, activationLagThreshold, and lagThreshold each actually control?**

**A:** **Problem:** these three fields interact, and getting any one wrong produces a specific, different failure mode — thrashing, slow scale-up, or a consumer that never scales down. **Solution:** `minReplicaCount: 0` allows scaling all the way to zero pods when the topic is empty, saving cost during idle periods; `activationLagThreshold` is the minimum lag required to scale from zero to one replica at all — set too low, KEDA thrashes between 0 and 1 on minor lag noise; `lagThreshold` then governs scaling *beyond* one replica (e.g. one additional replica per 1,000 messages of lag) once already active. **Result:** a correctly-tuned `ScaledObject` sits at zero cost during idle periods, activates cleanly on genuine load via `activationLagThreshold`, and scales proportionally to backlog size via `lagThreshold` — misconfiguring any one of the three either wastes cost (never scaling to zero), causes thrashing (activation threshold too sensitive), or under-scales during real spikes (lag threshold too high).

---

## Official Resources

- [KEDA Documentation](https://keda.sh/docs/)
- [KEDA Scalers Reference](https://keda.sh/docs/latest/scalers/)
- [KEDA Helm Chart](https://github.com/kedacore/charts)

---

