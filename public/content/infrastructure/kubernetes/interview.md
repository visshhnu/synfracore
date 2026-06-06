# Kubernetes Interview Questions & Answers

Comprehensive Q&A covering every level — from your first DevOps job to Principal Architect interviews.

---

## Beginner Questions

**What is Kubernetes and why do we need it?**

Kubernetes (K8s) is an open-source container orchestration platform. When you run one Docker container, you don't need Kubernetes. When you run 100 containers across 10 servers and need automatic restarts, load balancing, zero-downtime deployments, and auto-scaling — that's what Kubernetes does. It turns a cluster of machines into a single, manageable compute resource.

*Follow-up: What did teams use before Kubernetes?*

---

**What is the difference between a Pod and a Container?**

A container is a running process with its own filesystem, created from a Docker image. A Pod is the smallest deployable unit in Kubernetes — it wraps one or more containers that share the same network namespace (same IP address) and storage volumes. Containers in a Pod communicate via `localhost`. In practice, most Pods have one container; multi-container Pods are used for sidecar patterns (logging agent, proxy).

---

**What is a Deployment and why use it instead of a Pod directly?**

A Pod created directly has no self-healing — if it dies, it stays dead. A Deployment manages a ReplicaSet, which ensures a specified number of Pod replicas are always running. Deployments also handle rolling updates (gradually replace old Pods with new ones) and rollbacks. You almost never create Pods directly in production — always use a Deployment.

---

**What are the main Kubernetes components?**

**Control Plane:**
- `kube-apiserver` — Front door. All kubectl commands hit this. REST API.
- `etcd` — Distributed key-value store. Stores ALL cluster state.
- `kube-scheduler` — Decides which Node a Pod runs on.
- `kube-controller-manager` — Runs controllers (ReplicaSet, Node, Deployment).

**Worker Nodes:**
- `kubelet` — Agent on each node. Ensures containers are running.
- `kube-proxy` — Network rules (iptables) for routing traffic to Pods.
- Container runtime — `containerd` or `CRI-O` (runs the actual containers).

---

**What is a Namespace and when would you use it?**

Namespaces provide virtual cluster isolation within a physical cluster. Use cases: separate environments (dev/staging/prod) on the same cluster, separate teams so they don't interfere with each other, apply resource quotas per namespace, apply RBAC policies per namespace. Default namespaces: `default`, `kube-system`, `kube-public`, `kube-node-lease`.

---

## Intermediate Questions

**Explain the difference between ClusterIP, NodePort, and LoadBalancer services.**

`ClusterIP` — Default. Only accessible within the cluster. Used for internal service-to-service communication.

`NodePort` — Exposes the service on a static port (30000-32767) on every node's IP. Accessible from outside the cluster. Not recommended for production — exposes ports directly on nodes.

`LoadBalancer` — Creates an external load balancer in the cloud (AWS ELB, Azure Load Balancer). The right way to expose services in production. Provisions automatically when you create the service.

`ExternalName` — Maps service to a DNS name. Used to reference external services by a Kubernetes service name.

---

**What is a ConfigMap and a Secret? When do you use each?**

Both store configuration as key-value pairs. `ConfigMap` is for non-sensitive configuration (log levels, feature flags, config files). `Secret` is for sensitive data (passwords, API keys, certificates) — stored base64-encoded in etcd. Important: base64 is encoding, not encryption. For production security, enable encryption at rest for Secrets and use external secret managers (AWS Secrets Manager, HashiCorp Vault) with External Secrets Operator.

---

**What is a liveness probe vs readiness probe vs startup probe?**

`livenessProbe` — Is this container alive? If it fails N times, Kubernetes kills and restarts the container. Use for detecting deadlocks or crashed processes.

`readinessProbe` — Is this container ready to receive traffic? If it fails, the Pod is removed from the Service endpoints (no traffic sent). Use for warmup periods, dependency checks.

`startupProbe` — Is this container done starting up? Disables liveness/readiness probes until it passes. Use for slow-starting applications (Java apps with long JVM startup).

```yaml
livenessProbe:
  httpGet:
    path: /health
    port: 8080
  initialDelaySeconds: 30
  periodSeconds: 10
  failureThreshold: 3

readinessProbe:
  httpGet:
    path: /ready
    port: 8080
  initialDelaySeconds: 5
  periodSeconds: 5
```

---

**What is a HorizontalPodAutoscaler (HPA)?**

HPA automatically scales the number of Pod replicas based on observed metrics (CPU, memory, custom metrics). It queries the Metrics Server every 15 seconds. If average CPU across Pods exceeds the target, it increases replicas; below target, it decreases.

```yaml
apiVersion: autoscaling/v2
kind: HorizontalPodAutoscaler
metadata:
  name: myapp-hpa
spec:
  scaleTargetRef:
    apiVersion: apps/v1
    kind: Deployment
    name: myapp
  minReplicas: 2
  maxReplicas: 20
  metrics:
  - type: Resource
    resource:
      name: cpu
      target:
        type: Utilization
        averageUtilization: 60
```

---

**What is the difference between a StatefulSet and a Deployment?**

`Deployment` — For stateless applications. Pods are interchangeable, created/deleted randomly, have random names (`myapp-abc123`).

`StatefulSet` — For stateful applications (databases, Kafka, ZooKeeper). Provides: stable Pod names (`mysql-0`, `mysql-1`, `mysql-2`), stable network identity (DNS names persist), ordered deployment and scaling (0 before 1 before 2), stable persistent storage (each Pod gets its own PVC that survives Pod deletion).

---

**How does Kubernetes networking work?**

Every Pod gets a unique IP address. Pods can communicate with any other Pod on any node without NAT (the flat network model). This is implemented by a CNI plugin (Calico, Flannel, Cilium, WeaveNet).

Services get a stable virtual IP (ClusterIP) that load-balances to matching Pods via `kube-proxy` iptables rules. DNS resolution: `service-name.namespace.svc.cluster.local` resolves to the ClusterIP.

---

## Advanced Questions

**How do you implement zero-downtime deployments in Kubernetes?**

```yaml
strategy:
  type: RollingUpdate
  rollingUpdate:
    maxSurge: 1          # Max pods above desired during update
    maxUnavailable: 0    # Never go below desired (zero downtime)
```

Additionally:
1. `readinessProbe` must be configured — new Pods only get traffic when ready
2. `preStop` hook with sleep to drain in-flight requests before termination
3. `terminationGracePeriodSeconds` long enough for graceful shutdown
4. PodDisruptionBudget to limit voluntary disruptions

```yaml
spec:
  containers:
  - lifecycle:
      preStop:
        exec:
          command: ["sh", "-c", "sleep 10"]
  terminationGracePeriodSeconds: 30
```

---

**Explain RBAC in Kubernetes.**

Role-Based Access Control restricts who can do what to which resources.

- `Role` — Namespace-scoped permissions
- `ClusterRole` — Cluster-wide permissions
- `RoleBinding` — Binds a Role to subjects (users, groups, ServiceAccounts) in a namespace
- `ClusterRoleBinding` — Binds a ClusterRole cluster-wide

```bash
# Check what a ServiceAccount can do
kubectl auth can-i list pods --as=system:serviceaccount:production:myapp-sa -n production

# View all permissions for a role
kubectl describe role pod-reader -n production
```

---

**What is etcd and what happens if it goes down?**

etcd is a distributed, strongly-consistent key-value store that stores all Kubernetes cluster state — every Pod spec, Service definition, ConfigMap, Secret, and more. If etcd is unavailable, the API server cannot read or write state. Existing workloads continue running (kubelet doesn't need etcd), but you cannot create, update, or delete anything. This is why etcd HA (3 or 5 node cluster) is critical in production. Always back up etcd regularly.

```bash
# Backup etcd
ETCDCTL_API=3 etcdctl snapshot save snapshot.db \
  --endpoints=https://127.0.0.1:2379 \
  --cacert=/etc/etcd/ca.crt \
  --cert=/etc/etcd/server.crt \
  --key=/etc/etcd/server.key
```

---

**How do you handle Persistent Storage in Kubernetes?**

`PersistentVolume (PV)` — A piece of storage in the cluster, provisioned by admin or dynamically by a StorageClass.

`PersistentVolumeClaim (PVC)` — A request for storage by a user. Kubernetes binds PVC to a matching PV.

`StorageClass` — Defines the "type" of storage. Enables dynamic provisioning — PVs created automatically when PVC is created.

```yaml
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: postgres-pvc
spec:
  accessModes: [ReadWriteOnce]
  storageClassName: gp3        # AWS EBS gp3
  resources:
    requests:
      storage: 50Gi
```

Access modes:
- `ReadWriteOnce (RWO)` — One node read/write. EBS, Azure Disk.
- `ReadOnlyMany (ROX)` — Multiple nodes read. NFS.
- `ReadWriteMany (RWX)` — Multiple nodes read/write. EFS, Azure Files.

---

## Architect-Level Questions

**Design a multi-tenant Kubernetes platform for 20 development teams.**

Architecture decisions:

1. **Isolation model** — Namespace per team. Consider separate clusters for high-security tenants.
2. **Resource quotas** — `ResourceQuota` per namespace (CPU, memory, Pod count limits).
3. **Network isolation** — Default-deny `NetworkPolicy` in each namespace. Teams can only reach their own services.
4. **RBAC** — Each team gets `admin` role in their namespace only. Platform team gets cluster-admin.
5. **GitOps** — ArgoCD with `AppProject` per team. Teams can only deploy to their namespace.
6. **Cost tracking** — Kubecost or opencost labels for chargeback by namespace.
7. **Image registry** — Harbor with per-team projects and image scanning.
8. **Monitoring** — Prometheus with per-namespace dashboards. Teams see only their own metrics.
9. **Onboarding** — Terraform module: creates namespace + quota + RBAC + NetworkPolicy + ArgoCD AppProject in one apply.

*Follow-up: How would you handle a team that consistently exceeds their quota?*

---

**How do you approach Kubernetes cluster upgrades with zero downtime?**

```bash
# 1. Read release notes — check deprecated APIs
kubectl api-resources
kubectl get --raw /apis | jq '.groups[].versions[].version'

# 2. Upgrade control plane first (one minor version at a time)
# On managed K8s (EKS/AKS/GKE): use the console or CLI
aws eks update-cluster-version --name prod-cluster --kubernetes-version 1.29

# 3. Check nodes
kubectl get nodes

# 4. Upgrade node groups one at a time
# Cordon the node (no new scheduling)
kubectl cordon node-1

# Drain (evict all pods gracefully)
kubectl drain node-1 --ignore-daemonsets --delete-emptydir-data

# Upgrade node (replace with new AMI/image)
# Then uncordon
kubectl uncordon node-1

# 5. Verify
kubectl get nodes -o wide
kubectl get pods -A | grep -v Running
```

Key considerations: PodDisruptionBudgets prevent draining if it would violate them. Test in staging first. Have rollback plan. Upgrade at low-traffic period. Notify teams of maintenance window.
