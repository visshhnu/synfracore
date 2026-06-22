# Kubernetes Advanced — Production Patterns

## High Availability (HA) Design

### Control Plane HA
Production Kubernetes requires HA control plane — no single point of failure.

**Minimum HA setup:** 3 control plane nodes (etcd quorum: can lose 1 node).
**Recommended:** 3 or 5 nodes (5 nodes can lose 2).

```
3 Control Plane Nodes          Load Balancer
[master-1] ←──────────────── [HAProxy/NLB]
[master-2] ←──────────────── (routes kubectl + components)
[master-3] ←────────────────

etcd cluster: all 3 nodes replicate state
```

**etcd quorum:** Needs majority (n/2 + 1). With 3 nodes, quorum = 2 — can lose 1.
**Never run 2 control plane nodes** — losing 1 = losing quorum.

### Worker Node Availability
```yaml
# PodDisruptionBudget — protects against voluntary disruption
apiVersion: policy/v1
kind: PodDisruptionBudget
metadata:
  name: app-pdb
spec:
  minAvailable: 2        # Keep at least 2 pods running always
  # OR:
  # maxUnavailable: 1    # Allow max 1 pod down at a time
  selector:
    matchLabels:
      app: myapp
```

**Topology spread** — spread pods across zones:
```yaml
spec:
  topologySpreadConstraints:
  - maxSkew: 1                      # Max difference between zones
    topologyKey: topology.kubernetes.io/zone
    whenUnsatisfiable: DoNotSchedule
    labelSelector:
      matchLabels:
        app: myapp
```

**Anti-affinity** — don't co-locate replicas:
```yaml
affinity:
  podAntiAffinity:
    requiredDuringSchedulingIgnoredDuringExecution:
    - labelSelector:
        matchLabels:
          app: myapp
      topologyKey: kubernetes.io/hostname  # Not on same node
```

### Multi-Region HA
For highest availability — deploy across 2+ regions:

```
Region A (primary)          Region B (standby/active)
├── AZ-1: app pods          ├── AZ-1: app pods
├── AZ-2: app pods          ├── AZ-2: app pods
└── AZ-3: app pods          └── AZ-3: app pods

Global Load Balancer → routes to healthy region
```

**Traffic routing:**
Active-Active: Both regions serve traffic (better performance, complex data sync).
Active-Passive: One region active, failover to passive (simpler, RTO depends on switchover time).

## Disaster Recovery (DR)

### Key Metrics
**RPO (Recovery Point Objective):** Maximum acceptable data loss measured in time.
"If we fail now, we can lose data up to X minutes ago."
RPO = 0: No data loss (synchronous replication).
RPO = 1hr: Lose up to 1 hour of data (hourly backups).

**RTO (Recovery Time Objective):** Maximum acceptable downtime.
"We must be back online within X hours of a disaster."
RTO = 15min: Automated failover.
RTO = 4hrs: Manual recovery with runbooks.

### DR Strategies by Cost/Speed

| Strategy | RTO | RPO | Cost | Description |
|---|---|---|---|---|
| Backup + Restore | Hours | Hours | Low | Restore from S3/GCS backup |
| Pilot Light | ~1hr | Minutes | Medium | Core infra always on, scale up on failure |
| Warm Standby | Minutes | Seconds | High | Scaled-down copy, always running |
| Multi-Site Active-Active | Seconds | Near-zero | Very High | Full capacity in both regions |

### Kubernetes DR with Velero
```bash
# Install Velero (backup/restore tool for K8s)
velero install   --provider aws   --bucket my-velero-bucket   --backup-location-config region=us-east-1

# Take backup
velero backup create prod-backup-$(date +%Y%m%d)   --include-namespaces production   --ttl 720h   # Keep for 30 days

# Schedule daily backups
velero schedule create daily-backup   --schedule="0 2 * * *"   --include-namespaces production   --ttl 168h

# Restore to DR cluster
velero restore create --from-backup prod-backup-20240115
```

**What Velero backs up:** Kubernetes objects (Deployments, Services, ConfigMaps, Secrets, PVCs).
**What it doesn't back up:** etcd directly, node configs, cluster-level configs.

### etcd Backup
```bash
# Backup etcd (run on control plane node)
ETCDCTL_API=3 etcdctl snapshot save /backup/etcd-$(date +%Y%m%d).db   --endpoints=https://127.0.0.1:2379   --cacert=/etc/kubernetes/pki/etcd/ca.crt   --cert=/etc/kubernetes/pki/etcd/server.crt   --key=/etc/kubernetes/pki/etcd/server.key

# Verify backup
etcdctl snapshot status /backup/etcd-20240115.db

# Restore (stops kube-apiserver first)
etcdctl snapshot restore /backup/etcd-20240115.db   --data-dir=/var/lib/etcd-restore

# Upload to S3
aws s3 cp /backup/etcd-$(date +%Y%m%d).db s3://my-etcd-backup/
```

## RBAC — Role-Based Access Control

### Kubernetes RBAC Architecture
```
ServiceAccount / User / Group
        ↓
   RoleBinding or ClusterRoleBinding
        ↓
     Role or ClusterRole
        ↓
   Rules (apiGroups + resources + verbs)
```

### Minimal Privilege Examples
```yaml
# READ-ONLY role for monitoring team
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRole
metadata:
  name: monitoring-reader
rules:
- apiGroups: [""]
  resources: ["pods", "nodes", "services", "endpoints"]
  verbs: ["get", "list", "watch"]
- apiGroups: ["apps"]
  resources: ["deployments", "daemonsets", "replicasets"]
  verbs: ["get", "list", "watch"]
- apiGroups: ["metrics.k8s.io"]
  resources: ["pods", "nodes"]
  verbs: ["get", "list"]
---
# DEVELOPER role — full control in their namespace only
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  namespace: team-alpha
  name: developer
rules:
- apiGroups: ["", "apps", "batch"]
  resources: ["*"]
  verbs: ["*"]
- apiGroups: [""]
  resources: ["secrets"]
  verbs: ["get", "list"]  # Can read but not create/delete secrets
---
# CI/CD robot account — deploy only
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRole
metadata:
  name: ci-deployer
rules:
- apiGroups: ["apps"]
  resources: ["deployments"]
  verbs: ["get", "list", "update", "patch"]
- apiGroups: [""]
  resources: ["configmaps"]
  verbs: ["get", "list", "create", "update"]
```

### Audit RBAC
```bash
# Who can do what?
kubectl auth can-i create deployments --as system:serviceaccount:prod:myapp
kubectl auth can-i delete pods --namespace production --as jane

# List all bindings
kubectl get clusterrolebindings -o wide
kubectl get rolebindings -A -o wide

# Who has cluster-admin?
kubectl get clusterrolebindings -o json |   jq '.items[] | select(.roleRef.name=="cluster-admin") | .subjects'

# Audit tool: rbac-lookup
kubectl rbac-lookup jane --kind user --output wide
```

## Network Policies — Zero Trust Networking

```yaml
# Default deny all ingress and egress
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: default-deny-all
  namespace: production
spec:
  podSelector: {}      # Selects all pods in namespace
  policyTypes:
  - Ingress
  - Egress
---
# Allow app to talk to database only
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: app-to-db
  namespace: production
spec:
  podSelector:
    matchLabels:
      app: myapp
  policyTypes:
  - Egress
  egress:
  - to:
    - podSelector:
        matchLabels:
          app: postgres
    ports:
    - port: 5432
  # Also allow DNS
  - to:
    - namespaceSelector:
        matchLabels:
          kubernetes.io/metadata.name: kube-system
    ports:
    - port: 53
      protocol: UDP
---
# Allow ingress from ingress controller only
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: allow-ingress-controller
  namespace: production
spec:
  podSelector:
    matchLabels:
      app: myapp
  ingress:
  - from:
    - namespaceSelector:
        matchLabels:
          kubernetes.io/metadata.name: ingress-nginx
```

## Cost Optimisation

### Resource Right-Sizing
```bash
# Find pods with no resource requests (can't be scheduled efficiently)
kubectl get pods -A -o json | jq '.items[] | select(.spec.containers[].resources == {}) | .metadata.name'

# VPA recommendation (install VPA first)
kubectl get vpa -A
# VPA shows recommended CPU/memory based on actual usage
```

```yaml
# LimitRange — default limits for namespace (prevent runaway pods)
apiVersion: v1
kind: LimitRange
metadata:
  name: default-limits
  namespace: production
spec:
  limits:
  - type: Container
    default:          # Applied if not specified
      cpu: "500m"
      memory: "256Mi"
    defaultRequest:
      cpu: "100m"
      memory: "128Mi"
    max:              # Hard ceiling
      cpu: "4"
      memory: "8Gi"
---
# ResourceQuota — cap total namespace usage
apiVersion: v1
kind: ResourceQuota
metadata:
  name: team-quota
  namespace: team-alpha
spec:
  hard:
    requests.cpu: "10"
    requests.memory: 20Gi
    limits.cpu: "20"
    limits.memory: 40Gi
    count/pods: "50"
```

### Cluster Autoscaler + Spot Instances
```yaml
# Karpenter (modern, AWS) — provisions right-sized nodes on demand
apiVersion: karpenter.sh/v1alpha5
kind: Provisioner
metadata:
  name: default
spec:
  requirements:
  - key: karpenter.sh/capacity-type
    operator: In
    values: ["spot", "on-demand"]   # Prefer spot, fallback to on-demand
  - key: node.kubernetes.io/instance-type
    operator: In
    values: ["m5.large", "m5.xlarge", "m4.large"]
  limits:
    resources:
      cpu: "100"          # Max 100 CPUs in this provisioner
      memory: "400Gi"
  ttlSecondsAfterEmpty: 30   # Terminate idle nodes after 30s
```

### Cost Monitoring
```bash
# kubecost — open source cloud cost monitoring for K8s
helm install kubecost cost-analyzer   --repo https://kubecost.github.io/cost-analyzer/   --namespace kubecost   --set kubecostToken="your-token"

# Shows cost per namespace, pod, deployment
# Identifies waste: over-provisioned resources, idle pods, expensive workloads
```

**Key cost levers:**
1. Spot/preemptible instances for stateless workloads (60-80% discount)
2. Right-size resource requests using VPA recommendations
3. Cluster Autoscaler / Karpenter to eliminate idle nodes
4. Use arm64 (Graviton/Ampere) instances where possible (20% cheaper)
5. Schedule non-critical jobs to low-demand windows

## Revision Notes
```
HA CONTROL PLANE: 3+ masters, etcd quorum (n/2+1). Never 2 nodes.
POD AVAILABILITY:
PodDisruptionBudget: minAvailable or maxUnavailable
TopologySpreadConstraints: spread across zones
Pod Anti-Affinity: don't co-locate replicas on same node

DR METRICS:
RPO = max data loss | RTO = max downtime
Strategies: Backup/Restore → Pilot Light → Warm Standby → Active-Active

VELERO: K8s object backup/restore. Scheduled backups to S3/GCS.
etcdctl snapshot: low-level etcd backup (run on control plane node)

RBAC:
ClusterRole: cluster-wide resources | Role: namespace-scoped
Binding maps subject (user/SA/group) to role
Least privilege: only grant what's needed

NETWORK POLICIES: Default deny-all, then explicitly allow
Always allow DNS (port 53 to kube-system)

COST:
LimitRange: defaults + caps per container
ResourceQuota: total namespace budget
Karpenter: right-sized nodes on demand + spot instance support
Right-size requests using VPA | Monitor with kubecost
```
