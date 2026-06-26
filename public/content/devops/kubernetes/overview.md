# Kubernetes

> **Container orchestration at production scale**

**Category:** Containers & Orchestration  
**Learning Path:** What → Why → Architecture → Setup → Real Examples → Production → Interview Prep

---

## What is Kubernetes?

Kubernetes (K8s) is an open-source system for automating deployment, scaling, and management of containerized applications. It groups containers that make up an application into logical units for easy management and discovery.

## Why Kubernetes?

K8s architecture has two planes: Control Plane (brain) and Worker Nodes (workhorses). The API Server is the gateway for all communication. etcd is the distributed key-value store holding all cluster state.

---

## Learning Modules

### Module 01 — What is Kubernetes?
*Core concepts & why it exists*

Kubernetes (K8s) is an open-source system for automating deployment, scaling, and management of containerized applications. It groups containers that make up an application into logical units for easy management and discovery.

**Topics covered:**

- Container orchestration problem — 🟢 Beginner
- K8s vs Docker Compose — 🟢 Beginner
- Pod, Node, Cluster — 🟢 Beginner

### Module 02 — Architecture Deep Dive
*Control plane, data plane, etcd*

K8s architecture has two planes: Control Plane (brain) and Worker Nodes (workhorses). The API Server is the gateway for all communication. etcd is the distributed key-value store holding all cluster state.

**Topics covered:**

- Control Plane components — 🟡 Intermediate
- API Server & etcd — 🟡 Intermediate
- Scheduler & Controller Manager — 🟡 Intermediate
- Kubelet & Kube-proxy — 🟡 Intermediate

### Module 03 — Workloads & Pods
*Deployments, StatefulSets, DaemonSets*

Pods are the smallest deployable units. Deployments manage stateless workloads with rolling updates. StatefulSets are for databases and stateful apps. DaemonSets run on every node (logging agents, monitoring).

**Topics covered:**

- Pod lifecycle — 🟢 Beginner
- ReplicaSet & Deployment — 🟢 Beginner
- StatefulSet — 🟡 Intermediate
- DaemonSet & Job/CronJob — 🟡 Intermediate

### Module 04 — Networking
*Services, Ingress, DNS*

Kubernetes networking is flat — every Pod gets its own IP. Services provide stable endpoints. Ingress routes external HTTP/HTTPS traffic. Network Policies are your firewall rules between pods.

**Topics covered:**

- ClusterIP, NodePort, LoadBalancer — 🟡 Intermediate
- Ingress Controllers — 🟡 Intermediate
- CoreDNS — 🟡 Intermediate
- Network Policies — 🔴 Advanced

### Module 05 — Storage
*PV, PVC, StorageClass*

Kubernetes decouples storage from pods. PersistentVolumes (PV) are cluster storage resources. PersistentVolumeClaims (PVC) are requests for storage by pods. StorageClass enables dynamic provisioning.

**Topics covered:**

- PersistentVolume & PVC — 🟡 Intermediate
- StorageClass & dynamic provisioning — 🟡 Intermediate
- ConfigMap & Secret — 🟢 Beginner

### Module 06 — RBAC & Security
*Roles, ServiceAccounts, Policies*

RBAC controls who can do what in the cluster. Every pod runs as a ServiceAccount. Least privilege is the principle — only grant what is needed. Pod Security Standards replace deprecated PodSecurityPolicy.

**Topics covered:**

- Role & ClusterRole — 🟡 Intermediate
- RoleBinding — 🟡 Intermediate
- ServiceAccount — 🟡 Intermediate
- Pod Security Standards — 🔴 Advanced
- OPA / Gatekeeper — 🔴 Advanced

### Module 07 — Scaling & HPA
*Horizontal, Vertical, Cluster Autoscaler*

HPA scales pods based on CPU/memory or custom metrics. Cluster Autoscaler adds/removes nodes. KEDA enables event-driven autoscaling from Kafka, queues, etc.

**Topics covered:**

- HPA (Horizontal Pod Autoscaler) — 🟡 Intermediate
- VPA (Vertical Pod Autoscaler) — 🔴 Advanced
- Cluster Autoscaler — 🔴 Advanced
- KEDA — 🔴 Advanced

### Module 08 — Production Patterns
*Resource limits, Probes, PodDisruptionBudgets*

Production Kubernetes requires resource governance. Always set requests and limits. Probes ensure traffic only goes to healthy pods. PDB ensures minimum availability during updates.

**Topics covered:**

- Resource requests & limits — 🟡 Intermediate
- Liveness, Readiness, Startup probes — 🟡 Intermediate
- PodDisruptionBudget — 🔴 Advanced
- Node affinity & taints — 🔴 Advanced

---

## Production Example


---

## Interview Prep

!!! tip "PSR Formula"
    Answer every question: **Problem → Solution → Result**. 45-90 seconds max.

### Common Interview Questions

??? question "What is Kubernetes and why would you use it in production?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How does Kubernetes work internally? Explain the architecture."
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "What are the main components of Kubernetes?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How do you handle failures in Kubernetes?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "What is your production experience with Kubernetes?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How do you monitor and observe Kubernetes in production?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "What are the security considerations for Kubernetes?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How does Kubernetes compare to alternatives?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "Explain What is Kubernetes? in Kubernetes."
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "Explain Architecture Deep Dive in Kubernetes."
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

---

## Official Resources

- [Kubernetes Official Documentation](https://kubernetes.io/docs/)
- [Kubernetes API Reference](https://kubernetes.io/docs/reference/)
- [Kubernetes The Hard Way](https://github.com/kelseyhightower/kubernetes-the-hard-way)

---

*Part of [LearnwithVishnu](https://learnwithvishnu.pages.dev) — Basics → Production → Architect*