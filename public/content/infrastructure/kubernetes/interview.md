# Kubernetes — Interview Q&A

**What is the difference between a Deployment and a StatefulSet?**
Deployment manages stateless pods — all replicas are identical and interchangeable. Pods get random names (app-7d9f8-abc12), can be replaced in any order, and share the same PVC if any. StatefulSet manages stateful applications like databases — each pod gets a stable hostname (postgres-0, postgres-1), a dedicated PVC that follows the pod, and are started/stopped in order. Use Deployment for web servers, APIs. Use StatefulSet for PostgreSQL, Kafka, Elasticsearch.

**Explain the difference between requests and limits.**
Requests are what Kubernetes uses for scheduling — the node must have at least this much free CPU/memory to place the pod. Limits are the hard ceiling — memory limit: exceeding it kills the pod with OOMKilled; CPU limit: exceeding it throttles (not kills) the pod. Best practice: always set requests (for proper scheduling), set memory limits (to prevent OOM cascades), be careful with CPU limits (throttling can cause latency spikes even when CPU is available).

**What happens when a pod is OOMKilled?**
The container exceeded its memory limit. The Linux kernel's OOM killer terminates the process. Kubernetes restarts the container according to the pod's restartPolicy (default: Always). If it keeps OOMKilling, the pod enters CrashLoopBackOff with exponential backoff. Fix by: increasing memory limit, fixing memory leak in application, or reducing memory usage. Check with: `kubectl describe pod <name>` — look for "OOMKilled" in Last State.

**How does Kubernetes service discovery work?**
Every Service gets a DNS entry: `<service-name>.<namespace>.svc.cluster.local`. CoreDNS (the cluster DNS server) resolves this to the Service's ClusterIP. Kube-proxy on each node maintains iptables/IPVS rules that load-balance connections to the ClusterIP across healthy pod IPs. Pods discover services via environment variables (injected at startup) or DNS (preferred). The DNS-based approach is dynamic — new pods are picked up immediately.

**What is a DaemonSet and when would you use it?**
DaemonSet ensures exactly one pod runs on every node (or subset of nodes via nodeSelector). Used for: log collectors (Fluentd, Filebeat), monitoring agents (node-exporter, Datadog agent), network plugins (Calico, Weave), storage plugins. When a new node joins the cluster, DaemonSet automatically schedules the pod on it. When a node is removed, the pod is garbage collected.

**Explain Kubernetes RBAC.**
RBAC controls who can do what in the cluster. Four objects: Role (permissions within a namespace), ClusterRole (cluster-wide), RoleBinding (assign Role to a user/SA in a namespace), ClusterRoleBinding (assign ClusterRole cluster-wide). Subjects can be: User (human), Group, ServiceAccount (for pods). Always use least privilege — give pods only the specific verbs (get, list, watch, create, delete) on specific resources they need, not wildcard `*`.

```bash
# Check what permissions a service account has
kubectl auth can-i list pods --as system:serviceaccount:default:my-sa
kubectl auth can-i create deployments --as system:serviceaccount:default:my-sa -n production
```

**What is a PodDisruptionBudget?**
PDB guarantees a minimum number of pods stay available during voluntary disruptions (node drain, rolling update, cluster upgrade). `minAvailable: 2` means at least 2 pods must be running. `maxUnavailable: 1` means at most 1 pod can be unavailable at a time. Without PDB, `kubectl drain` could evict all replicas simultaneously. Essential for production — prevents outages during planned maintenance.

**How does a rolling update work and how do you roll back?**
Rolling update replaces pods one (or a few) at a time: creates new pod → waits for it to be Ready → terminates one old pod → repeat. Controlled by `maxSurge` (extra pods above desired) and `maxUnavailable` (pods that can be unavailable). Zero-downtime requires: `maxUnavailable: 0`, proper readinessProbe, and enough replicas. Roll back: `kubectl rollout undo deployment/app` reverts to previous ReplicaSet. Check history: `kubectl rollout history deployment/app`.
