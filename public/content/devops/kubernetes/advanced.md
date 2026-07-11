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

## RBAC precisely: four objects, two scopes

`Role` (namespace-scoped permissions) and `ClusterRole` (cluster-wide permissions, or permissions on cluster-scoped resources like nodes) define *what* is allowed. `RoleBinding` (namespace-scoped) and `ClusterRoleBinding` (cluster-wide) define *who* gets it and *where*. A common, useful pattern: define permissions once as a `ClusterRole`, then grant it to different subjects in different specific namespaces via separate `RoleBinding`s — reusing one role definition without granting genuinely cluster-wide access to anyone who only needs access to their own namespace.
