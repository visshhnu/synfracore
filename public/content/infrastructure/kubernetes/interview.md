# Kubernetes Interview Questions

## Architecture Questions

**Q: Explain the Kubernetes architecture.**
Kubernetes has a master-worker architecture.

**Control Plane (Master):**
- **kube-apiserver**: The front door — all kubectl commands, admission controllers, authentication, and communication goes through it. RESTful API.
- **etcd**: Distributed key-value store. Single source of truth for all cluster state. Always back this up.
- **kube-scheduler**: Watches for unscheduled pods, assigns them to nodes based on resource requests, taints/tolerations, affinity rules, and available capacity.
- **kube-controller-manager**: Runs control loops — ReplicaSet controller, Deployment controller, Node controller, Job controller, etc. Each watches state and reconciles to desired state.
- **cloud-controller-manager**: Integrates with cloud providers (AWS, GCP, Azure) for load balancers, volumes, nodes.

**Worker Nodes:**
- **kubelet**: Agent on every node. Ensures containers described in PodSpecs are running and healthy. Reports to API server.
- **kube-proxy**: Network proxy. Maintains network rules (iptables/ipvs) for Service routing.
- **Container Runtime**: Docker, containerd, CRI-O — actually runs containers.

---

**Q: What is a Pod? When would you use multiple containers in one pod?**
A Pod is the smallest deployable unit in Kubernetes — a group of one or more containers that share network namespace (same IP), storage volumes, and lifecycle.

Multiple containers in one pod (sidecar pattern) when containers are tightly coupled:
- **Sidecar**: Log shipper (Fluentd) alongside main app — shares log volume
- **Ambassador**: Proxy that handles network traffic for the main container
- **Adapter**: Transforms main container's output (e.g., normalize metrics format)
- **Init containers**: Run to completion before main containers start (DB migrations, config prep)

Rule of thumb: If two containers would always need to be on the same node and need to share localhost or volumes — same pod.

---

**Q: Difference between Deployment, StatefulSet, DaemonSet, and Job?**

| Controller | Use Case | Characteristics |
|---|---|---|
| Deployment | Stateless apps (web servers, APIs) | Random pod names, rolling updates, scales easily |
| StatefulSet | Stateful apps (databases, Kafka, ZooKeeper) | Stable pod names (pod-0, pod-1), ordered startup/shutdown, persistent volume per pod |
| DaemonSet | Node-level agents | One pod per node (or matching nodes) — log collectors, monitoring agents, CNI plugins |
| Job | Batch tasks | Runs to completion, not restarted on success |
| CronJob | Scheduled batch tasks | Creates Jobs on schedule |

---

**Q: Explain Services — ClusterIP, NodePort, LoadBalancer, ExternalName.**

| Type | Access | Use Case |
|---|---|---|
| ClusterIP (default) | Internal only (cluster DNS) | Service-to-service communication inside cluster |
| NodePort | External via NodeIP:Port (30000-32767) | Quick external access, not production |
| LoadBalancer | Cloud load balancer with external IP | Production external traffic (needs cloud provider) |
| ExternalName | CNAME alias to external DNS | Map service to external endpoint (database as a service) |

Headless Service (clusterIP: None): Returns pod IPs directly — used by StatefulSets for stable DNS names (pod-0.service.namespace.svc.cluster.local).

---

**Q: How does Kubernetes handle rolling updates and rollbacks?**

Deployment rolling update strategy:
```yaml
strategy:
  type: RollingUpdate
  rollingUpdate:
    maxSurge: 1        # Max extra pods above desired count
    maxUnavailable: 0  # Max pods unavailable during update
```

Process: New ReplicaSet created → new pods started → old pods terminated → old RS scaled to 0.

Rollback: `kubectl rollout undo deployment/app` — Kubernetes keeps revision history (configurable with `revisionHistoryLimit`).

---

**Q: What are ConfigMaps and Secrets? How do you use them?**

**ConfigMap**: Store non-sensitive configuration as key-value pairs.
Usage: env vars, command args, or mounted as volume files.

**Secret**: Store sensitive data (base64 encoded, not encrypted by default).
Types: Opaque (generic), kubernetes.io/tls, kubernetes.io/dockerconfigjson.

Best practices for Secrets:
- Enable etcd encryption at rest
- Use external secret managers (AWS Secrets Manager, HashiCorp Vault) with External Secrets Operator
- Never commit secrets to Git (use Sealed Secrets or SOPS)
- Rotate secrets regularly

---

**Q: Explain resource requests and limits. What is QoS class?**

```yaml
resources:
  requests:        # What scheduler uses for placement (guaranteed minimum)
    cpu: "100m"    # 0.1 CPU core
    memory: "128Mi"
  limits:          # Hard ceiling - container killed/throttled if exceeded
    cpu: "500m"
    memory: "256Mi"
```

**QoS Classes** (affects eviction priority):
- **Guaranteed**: requests == limits for all containers → last to be evicted
- **Burstable**: requests < limits for at least one container
- **BestEffort**: no requests or limits → first to be evicted under pressure

---

**Q: What is a PersistentVolume and PersistentVolumeClaim?**

**PV** (PersistentVolume): Cluster-level storage resource. Created by admin or dynamically by StorageClass.
**PVC** (PersistentVolumeClaim): Namespace-level request for storage. Pods use PVCs, not PVs directly.

**StorageClass**: Defines provisioner and parameters. Enables dynamic provisioning.
**Access Modes**: ReadWriteOnce (single node RW), ReadOnlyMany (multiple nodes RO), ReadWriteMany (multiple nodes RW — NFS, EFS).

**Reclaim Policies**: Retain (keep PV on PVC delete), Delete (remove PV), Recycle (deprecated).

---

**Q: Explain RBAC in Kubernetes.**

Role-Based Access Control controls who can do what to which resources.

**Resources**: Role (namespace-scoped), ClusterRole (cluster-wide).
**Bindings**: RoleBinding (binds Role or ClusterRole to user/group/SA in namespace), ClusterRoleBinding (binds ClusterRole cluster-wide).

```yaml
# Role: can read pods in dev namespace
kind: Role
rules:
- apiGroups: [""]
  resources: ["pods"]
  verbs: ["get", "list", "watch"]
---
# Bind to user
kind: RoleBinding
subjects:
- kind: User
  name: jane
roleRef:
  kind: Role
  name: pod-reader
```

**ServiceAccount**: Identity for pods. Default SA in each namespace.

---

**Q: What are taints and tolerations? Node affinity?**

**Taints**: Applied to nodes to repel pods that don't tolerate them.
```bash
kubectl taint nodes node1 key=value:NoSchedule|NoExecute|PreferNoSchedule
```

**Tolerations**: Allow pods to schedule on tainted nodes.
```yaml
tolerations:
- key: "key"
  operator: "Equal"
  value: "value"
  effect: "NoSchedule"
```

**Node Affinity**: More expressive than nodeSelector.
- `requiredDuringSchedulingIgnoredDuringExecution`: Hard rule (like nodeSelector)
- `preferredDuringSchedulingIgnoredDuringExecution`: Soft preference

**Pod Affinity/Anti-Affinity**: Schedule pods relative to other pods (co-locate or spread).

---

**Q: How does HPA (Horizontal Pod Autoscaler) work?**

HPA watches metrics (CPU, memory, custom) and adjusts replica count.
Control loop: every 15s (default) — queries metrics API → calculates desired replicas → updates Deployment.

```yaml
apiVersion: autoscaling/v2
kind: HPA
spec:
  scaleTargetRef:
    kind: Deployment
    name: app
  minReplicas: 2
  maxReplicas: 10
  metrics:
  - type: Resource
    resource:
      name: cpu
      target:
        type: Utilization
        averageUtilization: 70
```

VPA (Vertical): Adjusts resource requests/limits.
KEDA: Event-driven autoscaling (scale on Kafka lag, SQS queue depth, etc.).

---

**Q: How would you debug a pod that's stuck in CrashLoopBackOff?**

Systematic approach:
1. `kubectl describe pod <pod-name>` — check Events section (image pull errors, OOMKilled, exit codes)
2. `kubectl logs <pod-name> --previous` — logs from last crashed container
3. Check exit code: 0=success, 1=app error, 137=OOMKilled, 1=SIGKILL
4. Check resource limits — OOMKilled means memory limit too low
5. Check liveness probe — misconfigured probe kills healthy containers
6. Check image — wrong tag, registry auth issues
7. Exec into container if it starts: `kubectl exec -it <pod> -- /bin/sh`

Common causes:
- App crashes on startup (bad config, missing env vars)
- OOMKilled — increase memory limit
- Liveness probe too aggressive — add `initialDelaySeconds`
- Image doesn't exist or wrong architecture

---

## Scenario Questions

**Q: How would you perform zero-downtime deployment?**
1. Use `maxUnavailable: 0` and `maxSurge: 1` in rolling update
2. Ensure readiness probes are correctly configured (traffic only routed to ready pods)
3. Use PodDisruptionBudget: `minAvailable: 1`
4. Consider blue-green (two Deployments, switch Service selector) for risk-averse scenarios

**Q: A service is slow. How do you investigate?**
1. Check pod metrics: `kubectl top pods`
2. Check logs: `kubectl logs -f deployment/app`
3. Check endpoints: `kubectl get endpoints service-name` (is service routing to correct pods?)
4. Check resource pressure: CPU throttling (limits too low), memory pressure
5. Use distributed tracing (Jaeger) if available
6. Check downstream services — is database slow?

**Q: How do you manage secrets securely in production Kubernetes?**
1. Never store raw secrets in Git
2. Use External Secrets Operator with AWS Secrets Manager / HashiCorp Vault
3. Enable etcd encryption at rest (`--encryption-provider-config`)
4. Limit access with RBAC (only pods that need the secret can access it)
5. Use short-lived credentials where possible (IRSA for AWS, Workload Identity for GCP)
6. Audit secret access logs

## Revision Notes
```
CONTROL PLANE: apiserver + etcd + scheduler + controller-manager
WORKER NODE: kubelet + kube-proxy + container runtime

WORKLOADS:
Deployment: stateless | StatefulSet: stateful (stable names, PVCs)
DaemonSet: one per node | Job: to completion | CronJob: scheduled

SERVICES:
ClusterIP: internal | NodePort: node IP:port | LoadBalancer: cloud LB
Headless (clusterIP:None): direct pod IPs

STORAGE: PV(admin) + PVC(user) + StorageClass(dynamic provisioning)
ACCESS: RWO/ROX/RWX

RBAC: Role+RoleBinding(namespace) | ClusterRole+ClusterRoleBinding(cluster)
SCHEDULING: taints+tolerations | node affinity | pod affinity

AUTOSCALING:
HPA: replica count based on CPU/memory/custom metrics
VPA: resource requests adjustment | KEDA: event-driven

DEBUG CRASHLOOP:
describe → logs --previous → check exit code → check resources → check probes
```
