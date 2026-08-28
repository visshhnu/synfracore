# Kubernetes — Workloads, Networking & Storage

## Deployments, StatefulSets, and DaemonSets — choosing the right one

A **Deployment** manages stateless, interchangeable pods — any replica can be killed and replaced with an identical one, no stable identity or storage needed. Use it for web servers, APIs, microservices.

A **StatefulSet** gives each pod a stable, ordinal name (`db-0`, `db-1`, `db-2`), ordered startup/shutdown, and its own PersistentVolumeClaim that follows it across rescheduling — the pod can move to a different node and still get the same data back. Use it for databases, Kafka, anything where "which specific instance" matters.

A **DaemonSet** ensures exactly one pod runs on every node (or every matching node) — used for node-level agents: log collectors, monitoring exporters, CNI plugins. It doesn't scale with a replica count; it scales with your node count automatically.

```yaml
apiVersion: apps/v1
kind: Deployment
metadata: { name: web }
spec:
  replicas: 3
  strategy: { type: RollingUpdate, rollingUpdate: { maxUnavailable: 0, maxSurge: 1 } }
  selector: { matchLabels: { app: web } }
  template:
    metadata: { labels: { app: web } }
    spec:
      containers:
      - name: web
        image: myapp:v2.1.0
        resources: { requests: { cpu: "100m", memory: "128Mi" }, limits: { memory: "256Mi" } }
```

## ConfigMaps and Secrets — configuration, correctly separated

ConfigMaps hold non-sensitive configuration; Secrets hold sensitive data — but by default, Secrets are only **base64-encoded, not encrypted**. Anyone with `get`/`list` RBAC access on Secrets, or read access to etcd directly, can decode them trivially. Real production hardening needs at least one of: etcd encryption at rest, or better, external secret management (AWS Secrets Manager, Azure Key Vault, HashiCorp Vault) via an External Secrets Operator, so credentials never live in Kubernetes' own storage at all.

```yaml
apiVersion: v1
kind: ConfigMap
metadata: { name: app-config }
data:
  LOG_LEVEL: "info"
---
# mounted as env vars or files
envFrom:
- configMapRef: { name: app-config }
```

## Services and Ingress — routing traffic in

| Type | Reachable from | Use case |
|---|---|---|
| ClusterIP (default) | Inside cluster only | Service-to-service traffic — most services in a real cluster |
| NodePort | Node IP + static port | Dev/testing, non-cloud clusters |
| LoadBalancer | External cloud LB | Direct external access, TCP/UDP services |
| ExternalName | Internal DNS alias | Integrating an external dependency into cluster DNS |

```conceptgrid
{
  "boxes": [
    { "title": "ClusterIP", "description": "Default — inside cluster only. Most services in a real cluster", "color": "blue" },
    { "title": "NodePort", "description": "Node IP + static port. Dev/testing, non-cloud clusters", "color": "purple" },
    { "title": "LoadBalancer", "description": "External cloud LB. Direct external access, TCP/UDP services", "color": "green" },
    { "title": "ExternalName", "description": "Internal DNS alias. Integrating an external dependency into cluster DNS", "color": "amber" }
  ]
}
```

An Ingress is a separate resource routing external HTTP/HTTPS by host/path to one or more Services — it needs an Ingress Controller (NGINX, Traefik) actually running in the cluster to do anything; the resource alone is just a routing spec. Production pattern: one `LoadBalancer` Service for the Ingress Controller itself, `ClusterIP` for everything it routes to — this avoids paying for (and managing) a separate cloud load balancer per service.

## Storage: PV, PVC, StorageClass

Containers are ephemeral — data written inside one is lost when the pod dies. Three resources work together: a **StorageClass** defines *how* storage gets provisioned (which cloud disk type, which driver); a **PersistentVolumeClaim** is a pod's *request* for storage; a **PersistentVolume** is the actual, bound storage resource, created either manually or dynamically by the StorageClass in response to a claim.

```yaml
apiVersion: v1
kind: PersistentVolumeClaim
metadata: { name: db-data }
spec:
  accessModes: [ReadWriteOnce]
  storageClassName: fast-ssd
  resources: { requests: { storage: 20Gi } }
```

## RBAC: the four objects and how they fit together

**Role** grants permissions within one namespace. **ClusterRole** grants permissions cluster-wide, or on cluster-scoped resources (nodes, PVs). **RoleBinding** attaches a Role (or ClusterRole) to a subject within one namespace. **ClusterRoleBinding** attaches a ClusterRole cluster-wide. The practical pattern: give a CI/CD service account a `ClusterRole` (defining *what* it can do) bound via a namespace-scoped `RoleBinding` (defining *where*) — this reuses one role definition across many namespaces without granting cluster-wide access.

## Debugging a Service that isn't routing traffic

```bash
kubectl get endpoints myservice -n production
# Empty output means the Service's label selector doesn't match any pod's labels — the #1 real cause

kubectl describe svc myservice -n production | grep Selector
kubectl get pods --show-labels -n production | grep myapp
# Compare these two outputs directly — a typo or a missed label update is almost always the mismatch
```
An Ingress or Service that "isn't working" is overwhelmingly a label-selector mismatch or a not-yet-Ready pod (check `readinessProbe`) — not a networking bug, in the large majority of real cases.
