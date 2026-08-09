# KEDA — PYQ (Previously Asked / Practice Questions)

**Framing note:** KEDA (via CNCF) doesn't administer a proctored public certification with a leaked-question archive. What follows is built from this guide's own Overview/Intermediate/Advanced/Troubleshooting material, framed as practice questions grounded in real, documented KEDA behavior.

---

### 1. (Domain: Core Problem) A Kafka consumer pod shows 5% CPU and 200MB memory usage, but consumer lag is 2 million messages. Why does plain Kubernetes HPA fail to scale this, and how does KEDA solve it?

**Answer:** HPA by default only scales on CPU and memory — a consumer that's I/O-bound (waiting on messages) rather than CPU-bound can have genuinely low CPU usage even while badly backed up, since processing messages faster doesn't necessarily mean using more CPU. HPA sees healthy resource metrics and takes no action. KEDA solves this by scaling on the actual relevant signal — Kafka consumer lag itself — as a trigger, completely independent of CPU/memory, catching exactly the scenario plain HPA structurally can't see.

---

### 2. (Domain: Architecture) Does KEDA replace the Kubernetes HPA controller, or work alongside it?

**Answer:** Alongside it, not replacing it — KEDA registers as a Kubernetes External Metrics API provider, and the standard, unmodified HPA controller queries that API the same way it would query CPU/memory metrics. KEDA never scales anything directly; it only ever supplies richer metric values into the existing HPA control loop, meaning all standard HPA behavior (target utilization calculations, `behavior` stabilization windows) continues to apply unchanged.

---

### 3. (Domain: Configuration) A ScaledObject has `minReplicaCount: 3` and no `idleReplicaCount` set. Will this workload ever scale to zero?

**Answer:** No — without `idleReplicaCount` explicitly set below `minReplicaCount` (most commonly to 0), the workload never goes below `minReplicaCount` regardless of how idle it actually is. `idleReplicaCount` is the specific field controlling true scale-to-zero behavior during genuinely idle periods; `minReplicaCount` alone only sets the floor maintained once the workload is considered active.

---

### 4. (Domain: HPA Behavior Tuning) Why does this guide recommend an asymmetric HPA `behavior` configuration — fast scale-up, slow scale-down — rather than symmetric timing for both?

**Answer:** The two directions carry different risk profiles: scaling up slowly risks real user-facing latency impact during a genuine spike, so a `stabilizationWindowSeconds: 0` (immediate) scale-up minimizes that risk. Scaling down too quickly risks prematurely removing capacity right before load returns, causing repeated thrashing; a longer stabilization window (e.g., 300 seconds) on scale-down avoids that. The asymmetry directly reflects that the cost of being slow to scale up and the cost of being fast to scale down are not equivalent.

---

### 5. (Domain: TriggerAuthentication) Why would a team use a cloud-native identity mechanism (like IRSA) instead of a Kubernetes Secret for `TriggerAuthentication`, when both are supported?

**Answer:** A static Kubernetes Secret is a long-lived credential that needs to be created, stored, and eventually rotated manually. A cloud-native identity mechanism (IRSA on AWS, Workload Identity on GKE) authenticates using the same short-lived, credential-free identity mechanism the rest of a well-configured cluster already uses — eliminating the need for a static secret specifically for KEDA's own polling, and removing an entire class of credential-management risk.

---

### 6. (Domain: HTTP Add-on) Why can't the core KEDA scalers (Kafka, RabbitMQ, cron) handle scale-to-zero for a synchronous HTTP service the same way they do for a queue consumer?

**Answer:** A queue-based workload scaled to zero has no problem — messages simply accumulate in the queue until a consumer pod scales up to process them. An HTTP service scaled to zero has a structural problem: an incoming request needs *something* running to receive it right now, and there's no queue to hold it while scale-up happens. The KEDA HTTP Add-on solves this with an interceptor proxy that holds/queues the incoming request while triggering scale-up, then forwards it once a pod becomes ready — without this, the first request after idle would simply fail rather than succeed after a brief delay.

---

### 7. (Domain: Custom Scalers) What are the three methods a custom External Scaler must implement, and what is each responsible for?

**Answer:** `IsActive` determines whether the scaled workload should be active at all (any pending work at all). `GetMetricSpec` defines the metric name and target size KEDA should scale against. `GetMetrics` returns the actual current metric value (e.g., current pending-job count) on each evaluation. Together, these three methods let KEDA treat a genuinely bespoke, custom system (with no built-in scaler) using the exact same trigger evaluation pipeline as any built-in scaler type.

---

### 8. (Domain: Troubleshooting) A cron-triggered ScaledObject scales at the wrong time of day. What field is almost certainly the cause?

**Answer:** A missing or incorrect `timezone` field in the cron trigger's metadata — if `timezone` isn't set explicitly, it defaults to UTC, which produces exactly this "scaling at the wrong local time" symptom for any team not operating in UTC themselves. This is a common, easily-overlooked configuration gap rather than a KEDA malfunction.

---

### 9. (Domain: Multi-Trigger) A ScaledObject has both a RabbitMQ queue-depth trigger and a CPU trigger configured. How does KEDA decide the actual scaling target when both are present?

**Answer:** KEDA evaluates each trigger independently and scales based on whichever produces the higher target replica count — not an average of the two, and not a first-match. This lets a workload scale correctly whether the bottleneck is queue backlog or raw CPU load, without requiring the team to predict in advance which signal will matter more at any given moment.

---

### 10. (Domain: KEDA Operator HA) Why does running `operator.replicaCount=2` matter for a genuinely production-critical KEDA deployment, and what mechanism prevents both replicas from reconciling simultaneously and conflicting?

**Answer:** A single-replica Operator going down stops new scaling decisions from being evaluated until it recovers — existing scaled workloads keep running, but scaling responsiveness is lost during the outage window. Running 2 replicas provides failover, using Kubernetes' standard leader-election mechanism (via a `Lease` object) so only one replica actively reconciles at a time while the other stands ready to take over immediately if the leader's lease isn't renewed — preventing both replicas from making conflicting scaling decisions simultaneously.
