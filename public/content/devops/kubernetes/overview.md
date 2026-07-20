# Kubernetes

> **Container orchestration at production scale**

**Category:** Containers & Orchestration  
**Learning Path:** What → Why → Architecture → Setup → Real Examples → Production → Interview Prep

---

## What is Kubernetes?

Kubernetes (K8s) is an open-source system for automating deployment, scaling, and management of containerized applications. It groups containers that make up an application into logical units for easy management and discovery.

## Why Kubernetes?

K8s architecture has two planes: Control Plane (brain) and Worker Nodes (workhorses). The API Server is the gateway for all communication. etcd is the distributed key-value store holding all cluster state.

---

## Learning Modules

### Module 01 — What is Kubernetes?
*Core concepts & why it exists*

Kubernetes (K8s) is an open-source system for automating deployment, scaling, and management of containerized applications. It groups containers that make up an application into logical units for easy management and discovery.

**Topics covered:**

- Container orchestration problem — 🟢 Beginner
- K8s vs Docker Compose — 🟢 Beginner
- Pod, Node, Cluster — 🟢 Beginner

### Module 02 — Architecture Deep Dive
*Control plane, data plane, etcd*

K8s architecture has two planes: Control Plane (brain) and Worker Nodes (workhorses). The API Server is the gateway for all communication. etcd is the distributed key-value store holding all cluster state.

**Topics covered:**

- Control Plane components — 🟡 Intermediate
- API Server & etcd — 🟡 Intermediate
- Scheduler & Controller Manager — 🟡 Intermediate
- Kubelet & Kube-proxy — 🟡 Intermediate

### Module 03 — Workloads & Pods
*Deployments, StatefulSets, DaemonSets*

Pods are the smallest deployable units. Deployments manage stateless workloads with rolling updates. StatefulSets are for databases and stateful apps. DaemonSets run on every node (logging agents, monitoring).

**Topics covered:**

- Pod lifecycle — 🟢 Beginner
- ReplicaSet & Deployment — 🟢 Beginner
- StatefulSet — 🟡 Intermediate
- DaemonSet & Job/CronJob — 🟡 Intermediate

### Module 04 — Networking
*Services, Ingress, DNS*

Kubernetes networking is flat — every Pod gets its own IP. Services provide stable endpoints. Ingress routes external HTTP/HTTPS traffic. Network Policies are your firewall rules between pods.

**Topics covered:**

- ClusterIP, NodePort, LoadBalancer — 🟡 Intermediate
- Ingress Controllers — 🟡 Intermediate
- CoreDNS — 🟡 Intermediate
- Network Policies — 🔴 Advanced

### Module 05 — Storage
*PV, PVC, StorageClass*

Kubernetes decouples storage from pods. PersistentVolumes (PV) are cluster storage resources. PersistentVolumeClaims (PVC) are requests for storage by pods. StorageClass enables dynamic provisioning.

**Topics covered:**

- PersistentVolume & PVC — 🟡 Intermediate
- StorageClass & dynamic provisioning — 🟡 Intermediate
- ConfigMap & Secret — 🟢 Beginner

### Module 06 — RBAC & Security
*Roles, ServiceAccounts, Policies*

RBAC controls who can do what in the cluster. Every pod runs as a ServiceAccount. Least privilege is the principle — only grant what is needed. Pod Security Standards replace deprecated PodSecurityPolicy.

**Topics covered:**

- Role & ClusterRole — 🟡 Intermediate
- RoleBinding — 🟡 Intermediate
- ServiceAccount — 🟡 Intermediate
- Pod Security Standards — 🔴 Advanced
- OPA / Gatekeeper — 🔴 Advanced

### Module 07 — Scaling & HPA
*Horizontal, Vertical, Cluster Autoscaler*

HPA scales pods based on CPU/memory or custom metrics. Cluster Autoscaler adds/removes nodes. KEDA enables event-driven autoscaling from Kafka, queues, etc.

**Topics covered:**

- HPA (Horizontal Pod Autoscaler) — 🟡 Intermediate
- VPA (Vertical Pod Autoscaler) — 🔴 Advanced
- Cluster Autoscaler — 🔴 Advanced
- KEDA — 🔴 Advanced

### Module 08 — Production Patterns
*Resource limits, Probes, PodDisruptionBudgets*

Production Kubernetes requires resource governance. Always set requests and limits. Probes ensure traffic only goes to healthy pods. PDB ensures minimum availability during updates.

**Topics covered:**

- Resource requests & limits — 🟡 Intermediate
- Liveness, Readiness, Startup probes — 🟡 Intermediate
- PodDisruptionBudget — 🔴 Advanced
- Node affinity & taints — 🔴 Advanced

---

## Production Example

```bash
# Production Runbook — "pods are stuck Pending and won't schedule"

# Step 1: What is the scheduler actually complaining about?
kubectl describe pod <pending-pod> | tail -20
# The Events section at the bottom states the EXACT reason -- insufficient
# CPU/memory, no node matches a nodeSelector/affinity rule, a taint with
# no matching toleration, or a PVC that can't be bound. Read this first,
# don't guess.

# Step 2: Confirm cluster capacity, if the reason is resource-related
kubectl top nodes
kubectl describe nodes | grep -A5 "Allocated resources"
# A node can show as "Ready" while still being fully allocated -- capacity
# and current allocation are different things.

# Step 3: Confirm scheduling constraints, if the reason is affinity/taint-related
kubectl get pod <pending-pod> -o yaml | grep -A10 "nodeSelector\|affinity\|tolerations"
kubectl get nodes --show-labels   # do any nodes actually have the labels being selected for?
kubectl describe nodes | grep Taints

# Step 4: If this is a genuine capacity problem, check whether autoscaling
# should have kicked in
kubectl get events --sort-by='.lastTimestamp' | grep -i "FailedScheduling\|TriggeredScaleUp"
# Cluster Autoscaler logs show exactly why it did or didn't add a node --
# a common cause is the pending pod's constraints not matching any node
# pool the autoscaler is configured to provision

# Step 5: Confirm the fix actually worked
kubectl get pod <pending-pod> -w   # watch until it transitions to Running
```

## Interview Prep

!!! tip "PSR Formula"
    Answer every question: **Problem → Solution → Result**. 45-90 seconds max.

### Common Interview Questions

??? question "What is Kubernetes and why would you use it in production?"
    **Problem:** running containers reliably at scale needs more than just starting them — failed containers need replacing, traffic needs routing to healthy replicas, and deployments need to roll out without downtime, none of which a plain container runtime does on its own. **Solution:** Kubernetes takes a declared desired state ("3 replicas of this app") and continuously reconciles actual cluster state to match it — rescheduling failed Pods, load-balancing across replicas via Services, and rolling out updates gradually with automatic rollback on failure. **Result:** most of what used to be manual, error-prone ops work (restart the crashed process, update the load balancer config, coordinate a rolling deploy) becomes an automated, self-healing loop instead.

??? question "How does Kubernetes work internally? Explain the architecture."
    **Problem:** understanding which component does what is what makes a specific failure ("pods stuck Pending," "API server down") diagnosable rather than mysterious. **Solution:** the control plane (API Server as the single entry point, etcd as the actual state store, Scheduler deciding pod placement, Controller Manager running reconciliation loops) manages desired vs. actual state; worker nodes run kubelet (talks to the API Server, starts containers), kube-proxy (Service networking), and the container runtime. **Result:** this separation is exactly why "the API Server is down" and "my app is down" are different, unrelated problems — existing Pods keep running fine even with a fully unreachable control plane, they just can't be rescheduled or updated until it's back.

??? question "What are the main components of Kubernetes?"
    **Problem:** without breaking "Kubernetes" into its actual pieces, troubleshooting is guesswork. **Solution:** API Server, etcd, Scheduler, Controller Manager (control plane); kubelet, kube-proxy, container runtime (nodes); and the object model built on top — Pods, Deployments/StatefulSets/DaemonSets, Services, ConfigMaps/Secrets, PersistentVolumes. **Result:** each maps to a specific class of real incident (a Pod issue is a workload-object problem; a Service not routing is a networking/label problem; nodes not scaling is an autoscaler problem) — knowing the map is what makes triage fast.

??? question "How do you handle failures in Kubernetes?"
    **Problem:** failures happen at every layer — container crash, node failure, misconfigured scheduling constraint, resource exhaustion — and each needs a different diagnostic path. **Solution:** `kubectl describe pod` and `kubectl logs --previous` for container-level failures; `kubectl get events --sort-by='.lastTimestamp'` for cluster-level signals (scheduling failures, image pull errors); resource requests/limits plus liveness/readiness probes so Kubernetes itself catches and recovers from most failures automatically, without a human in the loop. **Result:** most real incidents resolve to one of a handful of root causes (OOM, a label-selector mismatch, an unsatisfiable scheduling constraint, a failing health check) that `describe`/`events`/`logs` surface directly, in that order.

??? question "What is your production experience with Kubernetes?"
    This is a genuinely personal question — answer with a real incident using the Problem → Solution → Result structure: what broke (a bad rollout, a resource-exhaustion cascade, a networking misconfiguration), your actual diagnostic sequence, and what the root cause turned out to be. Interviewers are listening for whether you have real operational experience, not textbook recall.

??? question "How do you monitor and observe Kubernetes in production?"
    **Problem:** a cluster can look healthy at the node level while individual applications are silently failing, or vice versa. **Solution:** liveness/readiness probes for per-Pod health (built into Kubernetes itself), `kubectl top`/metrics-server for resource usage, and a real metrics/logging stack (Prometheus for cluster and application metrics, centralized log aggregation) for anything beyond ad hoc `kubectl` checks. **Result:** the combination catches both "this Pod is unhealthy" (probes) and "the cluster is trending toward resource exhaustion" (metrics) before either becomes a full outage.

??? question "What are the security considerations for Kubernetes?"
    **Problem:** a cluster with default-open networking and no RBAC scoping means any compromised Pod or over-privileged credential can reach far more than it should. **Solution:** RBAC scoped to least privilege (Roles/RoleBindings per namespace, not cluster-wide ClusterRoleBindings by default), NetworkPolicies with a default-deny baseline, Pod Security Standards enforcing non-root/read-only-root-filesystem, and Secrets treated as base64-encoded (not encrypted) unless etcd encryption at rest is explicitly configured. **Result:** these are the same defense-in-depth principles used at the Docker/container layer, applied one level up at the orchestration layer.

??? question "How does Kubernetes compare to alternatives like Docker Swarm or Nomad?"
    This usually means a specific comparison. Docker Swarm: simpler to operate, much smaller ecosystem, effectively no longer actively developed — fine for small deployments, not the industry default anymore. Nomad: simpler operational model than Kubernetes, supports non-container workloads too, but a much smaller ecosystem of tooling/operators than Kubernetes has. State the specific tradeoff being asked about (operational complexity vs. ecosystem maturity vs. specific feature needs) rather than reciting a generic list.

??? question "Explain the container-orchestration problem Kubernetes actually solves."
    Running one container is easy; running many containers, across many machines, staying available through failures, scaling with load, and rolling out updates without downtime is not. Before orchestration, this was solved with custom scripts and manual intervention — genuinely error-prone at scale. Kubernetes' core idea (declare desired state, continuously reconcile actual state to match it) is what makes "a node just died" a non-event instead of an incident: the Scheduler places the affected Pods on healthy nodes automatically, no human paged.

??? question "Explain the control plane / worker node split in more depth."
    The control plane never runs application workloads — it exists purely to observe and reconcile cluster state (API Server as the front door, etcd as the durable record, Scheduler and Controller Manager as the two main reconciliation actors). Worker nodes run everything user-facing. This split is why control-plane component failures and application failures are independent failure domains: a Scheduler outage means *new* Pods can't be placed, but does nothing to Pods already running and already scheduled.

---

## Official Resources

- [Kubernetes Official Documentation](https://kubernetes.io/docs/)
- [Kubernetes API Reference](https://kubernetes.io/docs/reference/)
- [Kubernetes The Hard Way](https://github.com/kelseyhightower/kubernetes-the-hard-way)