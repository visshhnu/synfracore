# Kubernetes — Container Orchestration

Kubernetes (K8s) is the industry-standard platform for running containerized applications at scale. Built by Google, open-sourced in 2014, and now maintained by the CNCF.

## What Problem Does Kubernetes Solve?

Running one Docker container is easy. Running 100 containers across 10 servers with:
- Automatic restarts when containers crash
- Load balancing across containers
- Zero-downtime deployments
- Automatic scaling based on CPU/memory
- Service discovery (containers find each other)
- Secret management
- Health checking

…is what Kubernetes does.

## Architecture

\`\`\`
┌─────────────────────────── Cluster ───────────────────────────┐
│                                                               │
│  ┌─────────────── Control Plane ───────────────┐             │
│  │  API Server  │  etcd  │  Scheduler  │  CM   │             │
│  └─────────────────────────────────────────────┘             │
│                                                               │
│  ┌─── Worker Node 1 ──┐  ┌─── Worker Node 2 ──┐             │
│  │ kubelet  kube-proxy │  │ kubelet  kube-proxy │             │
│  │ ┌──────┐ ┌──────┐  │  │ ┌──────┐ ┌──────┐  │             │
│  │ │ Pod  │ │ Pod  │  │  │ │ Pod  │ │ Pod  │  │             │
│  └─────────────────────┘  └─────────────────────┘             │
└───────────────────────────────────────────────────────────────┘
\`\`\`

## Core Components

**API Server** — The front door to the cluster. All kubectl commands hit the API server. REST API that stores state in etcd.

**etcd** — Distributed key-value store. The "brain" of the cluster — stores all cluster state (every resource definition). If etcd is healthy, the cluster can recover from anything.

**Scheduler** — Watches for new Pods with no Node assigned and selects the best Node based on resource requirements, constraints, and affinity rules.

**Controller Manager** — Runs controllers that watch cluster state and reconcile it toward desired state. Examples: ReplicaSet controller (ensure N replicas running), Node controller (handle node failures).

**kubelet** — Agent on each worker node. Takes PodSpecs and ensures containers are running and healthy. Talks to the container runtime (containerd).

**kube-proxy** — Network proxy on each node. Maintains network rules (iptables/ipvs) to route traffic to Pods.

## Key Resource Types

| Resource | Purpose |
|----------|---------|
| **Pod** | Smallest deployable unit. One or more containers sharing network/storage |
| **Deployment** | Manages ReplicaSets. Handles rolling updates, rollbacks |
| **Service** | Stable network endpoint (ClusterIP, NodePort, LoadBalancer) |
| **ConfigMap** | Non-sensitive configuration key-value pairs |
| **Secret** | Sensitive data (base64 encoded, use external secrets in prod) |
| **Namespace** | Virtual cluster for resource isolation |
| **Ingress** | HTTP/HTTPS routing rules (needs Ingress Controller) |
| **PersistentVolume** | Storage that outlives Pods |
| **HPA** | Horizontal Pod Autoscaler — scale based on metrics |