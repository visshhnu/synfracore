# Kubernetes

> **Container orchestration at production scale**

**Category:** Containers & Orchestration  
**Learning Path:** What → Why → Learning Modules → Production Example → Interview Prep

**Before you start:** this is not a beginner-friendly technology, and the platform's own Prerequisites tab says so directly — you need to already know Docker well (what an image vs. a container is, how to write a Dockerfile, how `docker run` and `docker compose up` work) before this page will make sense. If Docker itself is new to you, do the **Docker** course first — Fundamentals through at least Intermediate. You'll also want basic Linux command-line comfort and basic networking (what an IP address and a port are). See the **Prerequisites** tab for the full checklist and a realistic time estimate.

---

## What is Kubernetes?

**Kubernetes** (often shortened to **K8s** — "K," then 8 letters, then "s") is an open-source system that runs many containers across many machines and keeps them running the way you told it to. You give it a "desired state" — for example, "always keep 3 copies of this app running" — and Kubernetes continuously checks the real state of the cluster against that and fixes any difference on its own: if a container crashes, it starts a replacement; if a machine dies, it reschedules that machine's containers elsewhere.

The smallest unit Kubernetes manages is a **Pod** — one or more containers that always run together on the same machine, sharing the same network address. In practice, most Pods run exactly one container; the extra flexibility (more than one container per Pod) exists for cases like a small helper process that needs to sit right next to your main app. You'll see "Pod" used constantly from here on — it's the thing Kubernetes actually schedules, restarts, and moves around, not the container directly.

A group of machines running Kubernetes together is called a **cluster** — one or more **Nodes** (the individual machines, physical or virtual) that Pods run on.

## Why Kubernetes?

Running one container by hand (`docker run`) is easy. The problem Kubernetes actually solves shows up once you need *several* containers, on *several* machines, staying available through failures, handling more load by adding copies, and getting updated without downtime — none of which a plain `docker run` does for you. Before tools like this existed, teams solved this with custom scripts and manual intervention, which is slow and error-prone at real scale.

Kubernetes automates all of that: it decides which Node each Pod runs on, restarts Pods that crash, replaces Pods on a Node that goes offline, gives you a stable way to reach a moving set of Pods (see Services, below), and rolls out new versions of your app gradually with automatic rollback if something goes wrong. This is what "a node just died" becomes a non-event instead of a 3am incident.

---

## Learning Modules

### Module 01 — Core Concepts
*Pods, Nodes, clusters, and how Kubernetes compares to Docker Compose*

Docker Compose (covered in the Docker course) runs multiple containers together, but only on one machine, with no automatic recovery if that machine dies. Kubernetes does the same multi-container coordination, but across many machines, with automatic recovery built in — that's the entire reason it exists.

**Topics covered:**

- The container-orchestration problem — 🟢 Beginner
- Kubernetes vs. Docker Compose — 🟢 Beginner
- Pod, Node, Cluster — 🟢 Beginner

### Module 02 — Architecture Deep Dive
*Control plane, worker nodes, etcd*

A Kubernetes cluster has two kinds of machines. The **control plane** ("the brain") makes decisions but never runs your application containers itself — it consists of the **API Server** (the single front door every request goes through, whether from you via `kubectl` or from Kubernetes' own internal components), **etcd** (a distributed key-value store — a simple, reliable database that holds the entire cluster's current state), the **Scheduler** (decides which Node a new Pod should run on), and the **Controller Manager** (continuously checks real state against desired state and corrects any difference). **Worker Nodes** ("the workhorses") are the machines that actually run your Pods.

**Topics covered:**

- Control Plane components — 🟡 Intermediate
- API Server & etcd — 🟡 Intermediate
- Scheduler & Controller Manager — 🟡 Intermediate
- Kubelet & Kube-proxy — 🟡 Intermediate

### Module 03 — Workloads & Pods
*Deployments, StatefulSets, DaemonSets*

A **Deployment** manages a set of identical, interchangeable Pods and handles rolling updates — the right choice for most stateless apps (web servers, APIs). A **StatefulSet** is for workloads where each Pod needs a stable identity and its own storage that follows it (databases). A **DaemonSet** ensures exactly one Pod runs on every Node — used for per-machine agents like log collectors.

**Topics covered:**

- Pod lifecycle — 🟢 Beginner
- ReplicaSet & Deployment — 🟢 Beginner
- StatefulSet — 🟡 Intermediate
- DaemonSet & Job/CronJob — 🟡 Intermediate

### Module 04 — Networking
*Services, Ingress, DNS*

Every Pod gets its own IP address, but Pods are constantly being replaced with new ones that get new IPs — so nothing else in the cluster can reliably hold onto a Pod's address directly. A **Service** solves this: it gives a stable address that always routes to whichever Pods currently match a label, regardless of how many times they've been replaced. An **Ingress** builds on top of Services to route external web traffic (HTTP/HTTPS) by hostname or URL path. **Network Policies** act as firewall rules between Pods.

**Topics covered:**

- ClusterIP, NodePort, LoadBalancer — 🟡 Intermediate
- Ingress Controllers — 🟡 Intermediate
- CoreDNS (the internal DNS service that lets Pods find Services by name instead of IP) — 🟡 Intermediate
- Network Policies — 🔴 Advanced

### Module 05 — Storage
*PV, PVC, StorageClass*

Kubernetes deliberately separates storage from Pods, since Pods are temporary but data often shouldn't be. A **PersistentVolume (PV)** is an actual piece of storage available to the cluster. A **PersistentVolumeClaim (PVC)** is a Pod's request for some of that storage — "I need 20GB" — without the Pod needing to know exactly which disk it gets. A **StorageClass** lets that storage get created automatically on demand, rather than someone provisioning it by hand ahead of time.

**Topics covered:**

- PersistentVolume & PVC — 🟡 Intermediate
- StorageClass & dynamic provisioning — 🟡 Intermediate
- ConfigMap & Secret — 🟢 Beginner

### Module 06 — RBAC & Security
*Roles, ServiceAccounts, Policies*

**RBAC (Role-Based Access Control)** is how Kubernetes controls who — a person or a Pod — is allowed to do what in the cluster. Every Pod runs as a **ServiceAccount** (an identity for non-human/automated access, as opposed to a human user account), and the standard principle is least privilege — grant only the specific access something actually needs, nothing more.

**Topics covered:**

- Role & ClusterRole — 🟡 Intermediate
- RoleBinding — 🟡 Intermediate
- ServiceAccount — 🟡 Intermediate
- Pod Security Standards — 🔴 Advanced
- OPA / Gatekeeper (Open Policy Agent — a general-purpose policy engine some clusters use to enforce rules beyond what RBAC alone covers) — 🔴 Advanced

### Module 07 — Scaling
*Horizontal, Vertical, and Cluster Autoscaling*

The **Horizontal Pod Autoscaler (HPA)** adds or removes copies of a Pod based on measured CPU/memory usage (or custom metrics). The **Cluster Autoscaler** works one level below that — it adds or removes entire Nodes, so there's actually room for however many Pods HPA decides you need. **KEDA** (Kubernetes Event-Driven Autoscaling) extends the same idea to event sources HPA doesn't natively understand, like a message queue's backlog.

**Topics covered:**

- HPA (Horizontal Pod Autoscaler) — 🟡 Intermediate
- VPA (Vertical Pod Autoscaler) — 🔴 Advanced
- Cluster Autoscaler — 🔴 Advanced
- KEDA — 🔴 Advanced

### Module 08 — Production Patterns
*Resource limits, Probes, PodDisruptionBudgets*

Running Kubernetes reliably in production needs more than the defaults. Every container should declare **resource requests and limits** (how much CPU/memory it needs vs. is capped at). **Probes** are automated health checks Kubernetes runs against your container so traffic only goes to Pods that are actually ready. A **PodDisruptionBudget (PDB)** limits how many Pods of a workload can be taken down at once for routine maintenance, protecting availability during planned changes (not crashes — see the Advanced tab for that distinction).

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