# Kubernetes — Learning Roadmap

## Time to Job-Ready: 8 weeks (2 hours/day)

**Goal:** Deploy, scale, and manage production workloads on Kubernetes clusters.

## Phase 1 — Core Concepts (Week 1-2)
- Understand the architecture: control plane (API server, etcd, scheduler, controller manager), worker nodes (kubelet, kube-proxy, container runtime)
- Core resources: Pod, Deployment, ReplicaSet, Service (ClusterIP, NodePort, LoadBalancer)
- ConfigMaps and Secrets — externalize configuration
- `kubectl` fundamentals: `get`, `describe`, `apply`, `delete`, `logs`, `exec`, `port-forward`
- Set up a local cluster: `minikube` or `kind`

## Phase 2 — Intermediate (Week 3-4)
- Namespaces and resource isolation
- Persistent Volumes, PVCs, StorageClasses
- Ingress controllers — route external HTTP traffic
- Resource requests and limits, HorizontalPodAutoscaler
- RBAC: Roles, ClusterRoles, RoleBindings
- Rolling updates and rollbacks: `kubectl rollout`

## Phase 3 — Production Patterns (Week 5-6)
- Helm charts: install, upgrade, rollback, create custom charts
- NetworkPolicy — restrict pod-to-pod communication
- Pod Disruption Budgets, Affinity and Anti-Affinity rules
- Probes: liveness, readiness, startup
- Init containers and sidecar pattern
- Secrets management: sealed-secrets or external-secrets

## Phase 4 — Advanced (Week 7-8)
- Set up a real cluster: kubeadm or managed (EKS/GKE/AKS)
- Custom Resource Definitions (CRDs) and Operators
- GitOps with ArgoCD or Flux
- Service Mesh basics (Istio or Linkerd)
- Multi-cluster patterns
- Monitoring: Prometheus + Grafana on K8s

## Certifications
- **KCNA** — Kubernetes and Cloud Native Associate (starter)
- **CKAD** — Certified Kubernetes Application Developer
- **CKA** — Certified Kubernetes Administrator (most valuable)

## Jobs After Kubernetes Mastery
Kubernetes Engineer · Platform Engineer · DevOps Engineer · SRE · Cloud Architect

## Resources
- **kubernetes.io/docs** — official docs (allowed during CKA exam)
- **KodeKloud CKA course** — best structured course
- **killer.sh** — 2 free mock exams included with CKA purchase
- **Kubernetes Up & Running** by O'Reilly
