# Kubernetes — Advanced

## QoS classes: what actually gets evicted first under memory pressure

Kubernetes assigns every pod a Quality of Service class based purely on its resource configuration, and this class directly determines eviction priority when a node runs low on memory:

- **Guaranteed**: every container has both requests and limits set, and they're equal, for both CPU and memory. Last to be evicted.
- **Burstable**: at least one container has requests set, but limits are higher (or only requests are set). Evicted after BestEffort pods, before Guaranteed ones.
- **BestEffort**: no requests or limits set at all. First to be evicted, with no consideration for how "important" the workload actually is.

A pod running with no resource requests/limits, left at defaults, is silently BestEffort — meaning it's the first thing killed if the node comes under memory pressure, regardless of how critical that service actually is. Setting resource requests and limits deliberately is what actually protects a critical service, not naming conventions or documentation about its importance.

## Node failure: the actual recovery timeline

When a node goes offline, recovery isn't instant — there's a real, multi-stage timeline: the node controller stops receiving kubelet heartbeats, marks the node `NotReady` after a grace period (commonly ~40 seconds by default), then pods on that node are marked for eviction after a further timeout (commonly minutes for most conditions, shorter with TaintBasedEvictions for a clearly-unreachable node) — only then does the ReplicaSet controller notice the deficit and create replacement pods, which then need to be scheduled and started on a healthy node. Total real recovery time is commonly in the range of several minutes end-to-end, not instant — a genuinely important number to know precisely rather than assume is near-zero. StatefulSet pods specifically are *not* automatically rescheduled during this process (to avoid a scenario where the same persistent volume gets attached to two instances simultaneously) — a permanently-dead node hosting a StatefulSet pod needs manual intervention (deleting the pod) before it will be recreated elsewhere.

## Scheduler internals: Filter then Score

The scheduler works in two distinct phases for every unscheduled pod: **Filter** removes nodes that flatly cannot run the pod (insufficient resources, an unmatched node selector, a taint the pod doesn't tolerate); **Score** ranks the remaining, viable nodes and picks the best one (factoring in things like resource balance across the cluster, pod affinity preferences). Understanding this two-phase model explains a lot of otherwise-confusing scheduling behavior — a pod that's "clearly fine" resource-wise but stays `Pending` is almost always failing the Filter phase on something specific (check `kubectl describe pod` — the Events section names the exact filtering reason), not a scoring/preference issue.

## Influencing scheduling decisions

| Mechanism | Use case |
|---|---|
| `nodeSelector` | Simplest option — exact label match required |
| `nodeAffinity` | Flexible label expressions, can be preferred (soft) or required (hard) |
| `podAffinity`/`podAntiAffinity` | Schedule near or away from other specific pods |
| Taints and tolerations | Reserve nodes for specific workloads (GPU nodes, high-memory nodes) |
| `PriorityClass` | Higher-priority pods can preempt (evict) lower-priority ones under resource pressure |

A common, real production pattern: spread replicas across availability zones using `podAntiAffinity` with `topologyKey: topology.kubernetes.io/zone` — this is what actually protects a multi-replica deployment against a single zone failure; `replicas: 3` alone provides no such guarantee if the scheduler happens to place all three in the same zone.

## Multi-tenancy: soft isolation vs. hard isolation

For trusted internal teams sharing one cluster, "soft" multi-tenancy is standard and sufficient: a namespace per team, RBAC scoping each team's access to their own namespace, `ResourceQuota` limiting total CPU/memory/pod-count per namespace (so one team can't starve others of cluster capacity), and default-deny `NetworkPolicy` with explicit allow rules between namespaces that actually need to communicate. For genuinely untrusted workloads (external customers, code you don't control), soft isolation isn't sufficient — the real options are separate physical clusters per tenant, or a tool like vCluster providing virtual, API-isolated clusters within one physical cluster as a middle ground between full namespace sharing and full physical separation.

## RBAC beyond the basics: aggregation, auditing, and admission-time gaps

The Intermediate tab covers the four core RBAC objects (`Role`/`ClusterRole`/`RoleBinding`/`ClusterRoleBinding`) and the ClusterRole-plus-per-namespace-RoleBinding reuse pattern — worth reviewing there first if that's unfamiliar. Beyond that:

**Aggregated ClusterRoles** let you compose permissions from multiple ClusterRoles into one, using label selectors rather than listing every rule directly:
```yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRole
metadata:
  name: monitoring-viewer
  labels:
    rbac.example.com/aggregate-to-monitoring: "true"
rules:
- apiGroups: ["monitoring.coreos.com"]
  resources: ["prometheuses", "alertmanagers"]
  verbs: ["get", "list", "watch"]
```
Any ClusterRole with `aggregationRule.clusterRoleSelectors` matching that label automatically inherits these rules — the built-in `view`/`edit`/`admin` ClusterRoles are themselves built this way, which is exactly why installing a CRD-based operator (Prometheus Operator, cert-manager) can silently expand what `edit`/`admin` users can already do, without anyone explicitly re-granting anything.

**Auditing what a subject can actually do**, rather than reading YAML and reasoning it out by hand:
```bash
kubectl auth can-i delete pods --as=system:serviceaccount:prod:ci-deployer -n prod
kubectl auth can-i --list --as=system:serviceaccount:prod:ci-deployer -n prod
```
This asks the API server to actually evaluate the RBAC graph for that subject, which is far more reliable than manually tracing Role → RoleBinding → aggregation chains, especially once aggregated ClusterRoles are in play.

**A real, non-obvious gap**: RBAC governs whether a request is *permitted*, but says nothing about whether it's *valid* or *safe* — a subject with `create` on `pods` can create a Pod with `privileged: true` or `hostNetwork: true` unless something else (Pod Security Admission, an OPA/Gatekeeper policy) blocks it at admission time. RBAC and admission control are two separate, complementary layers — least-privilege RBAC alone does not prevent a permitted-but-dangerous request from succeeding.

## Horizontal Pod Autoscaler (HPA): scaling replica count

HPA adjusts a Deployment/StatefulSet's replica count based on observed metrics, checking on an interval (15s by default) and scaling gradually rather than instantly:
```yaml
apiVersion: autoscaling/v2
kind: HorizontalPodAutoscaler
metadata: { name: myapp-hpa }
spec:
  scaleTargetRef: { apiVersion: apps/v1, kind: Deployment, name: myapp }
  minReplicas: 2
  maxReplicas: 10
  metrics:
  - type: Resource
    resource:
      name: cpu
      target: { type: Utilization, averageUtilization: 70 }
```
This requires `resources.requests` to already be set on the target Pods (`averageUtilization: 70` is 70% of the *requested* CPU, not an absolute number) — HPA silently cannot function without requests defined, which is one more concrete reason resource requests aren't optional in production. HPA can also scale on memory, or on custom/external metrics (queue depth, requests-per-second) via the custom metrics API, though CPU/memory cover the large majority of real use cases.

## Vertical Pod Autoscaler (VPA): right-sizing requests/limits instead of replica count

Where HPA changes *how many* Pods run, VPA changes *how much* each Pod requests/gets, based on observed actual usage over time — useful for workloads that don't scale well horizontally (a single stateful process) but are chronically over- or under-provisioned. VPA has three modes: `Off` (recommendation-only, doesn't act — the safe default to start with, since it reveals what the right sizing *would* be without changing anything yet), `Initial` (sets requests only at Pod creation), and `Auto` (evicts and recreates Pods to apply new sizing — genuinely disruptive, since changing a running Pod's resources requires recreating it). **HPA and VPA should not both target CPU/memory on the same workload simultaneously** — they can fight each other (VPA resizing while HPA is counting on stable per-replica sizing to calculate scale-out), a real, easy-to-hit misconfiguration.

## Cluster Autoscaler (CA): adding/removing nodes

CA operates one level below HPA/VPA — it doesn't scale Pods, it scales the *nodes* Pods run on, by watching for Pods that are Pending because no existing node has room, and provisioning a new node if the cluster's node pool configuration allows one that would fit. It also scales down: nodes that are underutilized for a sustained period get drained and removed, provided none of their Pods have something blocking eviction (see PodDisruptionBudget below). CA cannot create a node type it isn't configured to provision — a Pod requesting a GPU or an unusually large instance type stays Pending indefinitely if no configured node pool matches, with no error surfaced on the Pod itself (see the Interview tab's Q8 for the exact debugging sequence for this).

## KEDA: event-driven autoscaling beyond CPU/memory

KEDA (Kubernetes Event-Driven Autoscaling) extends the same scaling model to metrics HPA doesn't natively understand — queue depth (SQS, RabbitMQ, Kafka consumer lag), a database's pending-row count, a custom Prometheus query — and can scale a Deployment down to **zero** replicas when there's genuinely nothing to process, which plain HPA cannot do (HPA's `minReplicas` floor is 1). A `ScaledObject` wraps a normal Deployment and translates an external metric into an HPA under the hood:
```yaml
apiVersion: keda.sh/v1alpha1
kind: ScaledObject
metadata: { name: worker-scaler }
spec:
  scaleTargetRef: { name: queue-worker }
  minReplicaCount: 0
  maxReplicaCount: 20
  triggers:
  - type: aws-sqs-queue
    metadata: { queueURL: "https://sqs.us-east-1.amazonaws.com/...", queueLength: "5" }
```
This is the standard pattern for genuinely spiky, queue-driven workloads (batch processing, event consumers) where running replicas 24/7 at low utilization would be wasteful, but plain HPA's inability to scale to zero makes it a poor fit.

## PodDisruptionBudget (PDB): protecting availability during voluntary disruption

A PDB limits how many Pods of a given workload can be *voluntarily* disrupted at once — a node drain (for maintenance, or Cluster Autoscaler scaling down), a Pod eviction, or a rolling update all check PDBs first and will wait rather than violate one. It does **not** protect against *involuntary* disruption (a node crashing outright, a kernel panic) — the distinction matters, since a PDB creates a false sense of protection if this isn't understood.
```yaml
apiVersion: policy/v1
kind: PodDisruptionBudget
metadata: { name: myapp-pdb }
spec:
  minAvailable: 2   # or maxUnavailable: 1 -- pick one, not both
  selector: { matchLabels: { app: myapp } }
```
`minAvailable: 2` on a 3-replica Deployment means a node drain will evict at most 1 of its Pods at a time, waiting for a replacement to become Ready before evicting the next — this is exactly what stops Cluster Autoscaler's scale-down or a routine node drain from taking an entire workload's availability down at once, which a naive drain without a PDB genuinely can.
