# Kubernetes — Container Orchestration at Scale

Kubernetes (K8s) automatically deploys, scales, and manages containerized applications. When you have 10 containers that need to stay running across 5 servers, handle traffic spikes, restart on failures, and update without downtime — that's what Kubernetes does.

:::info Why Kubernetes?
Without K8s: You manually SSH into servers, run Docker commands, restart crashed containers, and stay up at 3am. With K8s: You declare "I want 3 replicas of my app always running" and Kubernetes makes it happen — forever.
:::

## Kubernetes Architecture

```flow
{
  "title": "Control Plane → Worker Nodes",
  "layout": "flow",
  "steps": [
    { "label": "Control Plane", "sublabel": "kubectl → API Server → etcd", "detail": "Scheduler + Controller Manager keep desired state", "color": "blue" },
    { "label": "Worker Nodes", "sublabel": "kubelet + kube-proxy per node", "detail": "Each node runs Pods scheduled to it", "color": "green" }
  ]
}
```

**Control Plane components:**

```conceptgrid
{
  "boxes": [
    { "title": "API Server", "description": "Entry point for all requests — kubectl talks to this", "color": "blue" },
    { "title": "etcd", "description": "Cluster state database — the single source of truth", "color": "blue" },
    { "title": "Scheduler", "description": "Decides which node a new Pod runs on", "color": "blue" },
    { "title": "Controller Manager", "description": "Continuously reconciles actual state toward desired state", "color": "blue" }
  ]
}
```

**Kubernetes objects you'll actually use:**

```conceptgrid
{
  "boxes": [
    { "title": "Pod", "description": "1+ containers, the smallest deployable unit", "color": "purple" },
    { "title": "Deployment", "description": "Manages Pods, handles rolling updates", "color": "blue" },
    { "title": "Service", "description": "Stable IP/DNS, load balances across Pods", "color": "green" },
    { "title": "ConfigMap", "description": "Non-secret config — env vars, files", "color": "amber" },
    { "title": "Secret", "description": "Sensitive config — passwords, keys", "color": "red" },
    { "title": "Ingress", "description": "HTTP routing and TLS termination", "color": "purple" },
    { "title": "HPA", "description": "Auto-scaling based on CPU/memory", "color": "green" },
    { "title": "PersistentVolume", "description": "Storage — EBS, NFS, EFS", "color": "slate" },
    { "title": "Namespace", "description": "Logical isolation for multi-team clusters", "color": "cyan" }
  ]
}
```

## Core Concepts Explained

### Pod — The Smallest Unit
A Pod wraps one or more containers that share network and storage. Containers in the same Pod communicate via `localhost`. In practice, most Pods have one container.

### Deployment — How You Run Apps
You never create Pods directly. You create a Deployment that says "keep 3 replicas of this container running." Kubernetes creates the Pods and continuously ensures that number stays correct — restarting crashed ones, replacing unhealthy ones.

### Service — Stable Network Identity
Pods come and go (new IP each time). A Service provides a stable DNS name (`my-app.default.svc.cluster.local`) and IP that routes to healthy Pods.

## Your First Deployment

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: my-app
spec:
  replicas: 3                    # Keep 3 copies always running
  selector:
    matchLabels: { app: my-app }
  template:
    metadata:
      labels: { app: my-app }
    spec:
      containers:
      - name: my-app
        image: nginx:alpine
        ports:
        - containerPort: 80
---
apiVersion: v1
kind: Service
metadata:
  name: my-app-service
spec:
  selector: { app: my-app }      # Routes to pods with this label
  ports:
  - port: 80
    targetPort: 80
  type: LoadBalancer             # External access
```

```bash
kubectl apply -f deployment.yaml     # Deploy
kubectl get pods                     # Check status
kubectl logs -f my-app-abc123        # View logs
kubectl scale deployment my-app --replicas=5  # Scale up
```

:::warning Common Mistake
Never hardcode secrets in your YAML files. Use Kubernetes Secrets or an external secrets manager like AWS Secrets Manager. Your YAML files end up in Git — don't put passwords there.
:::
