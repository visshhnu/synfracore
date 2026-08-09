# Kubernetes — PYQ (Previously Asked / Practice Questions)

**Framing note:** Kubernetes certifications (CKA, CKAD, CKS via the Linux Foundation) are proctored, hands-on, performance-based exams — no public leaked-question archive exists, and the exams themselves are practical tasks rather than multiple-choice. What follows is built from this guide's own Overview/Intermediate/Advanced/Troubleshooting material, framed as practice questions grounded in real, documented Kubernetes behavior.

---

### 1. (Domain: Core Concepts) Why does Kubernetes schedule and manage Pods rather than containers directly, even though most Pods contain exactly one container?

**Answer:** A Pod is the unit that guarantees co-location — one or more containers that always run together on the same machine, sharing a network address. Even when a Pod contains only one container, this abstraction matters because it's what Kubernetes actually schedules, restarts, and moves as a unit; it also provides the flexibility for genuinely multi-container Pods (a small helper/sidecar process needing to sit right next to the main app) without requiring a fundamentally different scheduling model for that case.

---

### 2. (Domain: Architecture) What's the specific role of etcd in a Kubernetes cluster, and why does etcd health directly affect the entire cluster's stability?

**Answer:** etcd is the distributed key-value store holding the cluster's entire current state — every object (Pods, Deployments, Services, ConfigMaps) is ultimately stored there. Because the API Server reads from and writes to etcd for essentially every operation, etcd performance or availability problems don't stay isolated — they manifest as slow or failing `kubectl` commands and API timeouts cluster-wide, which is exactly why etcd health is often the first thing to check during a "kubectl is slow" investigation, not a peripheral concern.

---

### 3. (Domain: Reconciliation) Explain the core reconciliation loop concept that makes Kubernetes self-healing, using a concrete example.

**Answer:** You declare desired state ("always keep 3 replicas of this Deployment running"); the Controller Manager continuously compares that desired state against the cluster's real, observed state via etcd, and takes corrective action on any difference. Concretely: if a Node hosting one of those 3 Pods goes offline, the real state drops to 2 running Pods against a desired state of 3 — the reconciliation loop detects this difference and schedules a replacement Pod on a healthy Node automatically, with no human intervention required.

---

### 4. (Domain: Troubleshooting) A Pod is stuck in `CrashLoopBackOff`. What's the first, most direct diagnostic command, and why is it more useful than just checking Pod status?

**Answer:** `kubectl logs --previous <pod-name>` — this retrieves logs from the container's previous (crashed) attempt, showing the actual application-level reason it exited, rather than just confirming Pod status shows a restart count climbing. Checking status alone confirms *that* it's crashing repeatedly but gives no insight into *why*; the previous logs are almost always where the real root cause (a misconfiguration, a missing dependency, an unhandled startup error) becomes visible.

---

### 5. (Domain: Troubleshooting) A Deployment's Pods stay stuck in `Pending` and never get scheduled. Name two genuinely different root causes this could have, beyond "not enough resources."

**Answer:** Insufficient cluster resources (CPU/memory) is one real cause, but two others are equally common: unsatisfied scheduling constraints (a `nodeSelector` or affinity rule requiring a label no Node actually has), and taints on all available Nodes without a matching toleration on the Pod spec. `kubectl describe pod` surfaces the specific scheduling failure reason in its Events section, which is the direct way to distinguish these causes rather than assuming resource exhaustion by default.

---

### 6. (Domain: Networking) A Service exists and looks correctly configured, but traffic never reaches the intended Pods. What's the single most common root cause to check first?

**Answer:** A mismatch between the Service's `selector` labels and the actual labels on the target Pods — a Service routes traffic based purely on label matching, and even a small, easy-to-miss discrepancy (a typo, a label that was updated on the Deployment but not correspondingly on the Service) means the Service has zero matching endpoints, silently routing nowhere. `kubectl get endpoints <service-name>` directly shows whether any Pods are actually matched — an empty endpoints list is the fast, direct confirmation of this specific failure mode.

---

### 7. (Domain: RBAC) A ServiceAccount gets a "Forbidden" error attempting an action that should be allowed. What are the two things that must both be correctly configured for RBAC to grant access?

**Answer:** A `Role` (or `ClusterRole`) defining the specific permitted verbs and resources, AND a `RoleBinding` (or `ClusterRoleBinding`) actually connecting that Role to the specific ServiceAccount. Both pieces are required together — a correctly-defined Role with no binding to the relevant ServiceAccount grants nothing, and a binding referencing a Role that doesn't grant the specific verb/resource being attempted also results in Forbidden, even though something superficially looks "configured."

---

### 8. (Domain: Architecture) What's the difference between what the Scheduler does and what the Controller Manager does?

**Answer:** The Scheduler makes a one-time decision — which Node a newly-created Pod should run on, based on resource availability and scheduling constraints. The Controller Manager runs continuously, reconciling real cluster state against desired state on an ongoing basis (not just at Pod creation) — restarting crashed containers, replacing Pods from failed Nodes, and generally enforcing that the cluster keeps matching what was declared, indefinitely, not just at the moment of initial scheduling.

---

### 9. (Domain: Kubelet/Kube-proxy) What roles do the Kubelet and kube-proxy play on a Worker Node, and how do they differ from control plane components?

**Answer:** The Kubelet runs on every Worker Node and is responsible for actually starting/stopping containers per the Pod specs assigned to that node by the Scheduler, and reporting Node/Pod status back to the control plane. Kube-proxy handles the networking rules that implement Service routing on that node. Unlike control plane components (API Server, etcd, Scheduler, Controller Manager), which make cluster-wide decisions, Kubelet and kube-proxy are per-node agents executing those decisions locally.

---

### 10. (Domain: Docker Compose Comparison) A team currently uses Docker Compose successfully for a small production deployment. What's the concrete trigger point that would justify migrating to Kubernetes?

**Answer:** The moment the team genuinely needs multi-machine coordination with automatic recovery — Docker Compose runs multiple containers together but only on one machine, with no automatic recovery if that machine dies. If the current single-machine setup and its failure mode (a full outage if that one machine goes down) is acceptable for the team's actual availability requirements, Kubernetes' added operational complexity isn't yet justified; the migration makes sense specifically once "what happens if this one machine dies" becomes a real, unacceptable risk.
