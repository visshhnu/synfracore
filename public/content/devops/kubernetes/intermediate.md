# Kubernetes — Workloads, Networking & Storage

# Kubernetes Complete Guide

DevOps › Kubernetes

☸️
**Kubernetes**


Beginner
Engineer
Production
Architect
Container orchestration at production scale — complete guide




**What you will learn:** What K8s is → Architecture (kube-proxy, kubelet, etcd, containerd) → Installation →
kubectl commands → Deployments, StatefulSets, DaemonSets → ConfigMaps & Secrets →
Networking → Storage → RBAC & Security → Scaling → Production patterns →
Troubleshooting → 12 Interview Q&As → Roadmap





[What is K8s](#sec-what)
[Architecture](#sec-architecture)
[Install](#sec-install)
[kubectl](#sec-kubectl)
[Workloads](#sec-workloads)
[Config & Secrets](#sec-config)
[Networking](#sec-networking)
[Storage](#sec-storage)
[RBAC & Security](#sec-security)
[Scaling](#sec-scaling)
[Production](#sec-production)
[Troubleshoot](#sec-troubleshoot)
[Interview Q&A](#sec-interview)
[Roadmap](#sec-roadmap)








## ☸️ What is Kubernetes?
›





Kubernetes (K8s) is an open-source container orchestration platform originally built by Google, donated to CNCF in 2014. It automates deployment, scaling, and management of containerised applications across a cluster of machines.


#### The Problem Kubernetes Solves

Before Kubernetes: you had containers running on servers but no way to manage them at scale. If a container crashed, someone had to manually restart it. If traffic spiked, someone had to manually add servers. Deployments required downtime. Kubernetes solves all of this automatically.


| Without Kubernetes | With Kubernetes |
|---|---|
| Manual restarts when containers crash | Automatic self-healing |
| Manual scaling when traffic increases | Auto-scaling (HPA) |
| Downtime during deployments | Zero-downtime rolling updates |
| Hard to move workloads between servers | Workloads run anywhere |
| No standard way to manage config/secrets | ConfigMaps and Secrets built-in |


#### Key Concepts


- **Declarative model** — you describe WHAT you want, K8s figures out HOW

- **Desired state** — K8s continuously compares actual state vs desired state and reconciles

- **Self-healing** — crashed pods restart, failed nodes get workloads moved away

- **Portability** — same YAML works on AWS EKS, Azure AKS, GCP GKE, on-premise


First Kubernetes deploymentCopy


```

```







## 🏗️ Architecture Deep Dive
›





Kubernetes has two planes: **Control Plane** (the brain — makes decisions) and **Data Plane** (the muscle — executes decisions). Every component communicates through the API Server — nothing talks directly.


#### Control Plane Components


| Component | What it does | Where it runs |
|---|---|---|
| kube-apiserver | Single entry point for ALL operations. Validates, authenticates, stores to etcd. | Master node(s) |
| etcd | Distributed key-value store. Stores entire cluster state. BACK THIS UP. | Master node(s) |
| kube-scheduler | Watches for unscheduled pods, picks the best node based on resources + constraints. | Master node(s) |
| kube-controller-manager | Runs all controllers: Deployment, ReplicaSet, Node, Job, etc. Reconciles desired state. | Master node(s) |
| cloud-controller-manager | Talks to cloud provider APIs (create LoadBalancer, attach EBS volume, etc.) | Master node(s) |


#### Worker Node Components


| Component | What it does |
|---|---|
| kubelet | Agent on every node. Watches for pods assigned to its node, starts/stops containers via CRI. |
| kube-proxy | Manages network rules on each node. Implements Services using iptables or IPVS rules. |
| Container Runtime | Actually runs containers. containerd (default), CRI-O. Docker Engine no longer supported in K8s 1.24+. |


#### Request Flow — what happens when you run kubectl apply


- kubectl serialises YAML → sends HTTPS request to kube-apiserver

- apiserver: authenticates (who are you?) → authorises (RBAC check) → admission controllers (validate + mutate)

- apiserver writes desired state to etcd

- Deployment controller sees new Deployment → creates ReplicaSet

- ReplicaSet controller sees no pods exist → creates Pod objects in etcd

- Scheduler sees unscheduled pods → picks best node → writes nodeName to pod spec

- Kubelet on that node sees pod assigned to it → pulls image → starts container via containerd

- Container starts → readiness probe passes → kubelet reports Ready → kube-proxy adds pod to Service endpoints


Inspect cluster componentsCopy


```

```







## ⚙️ Installation & Setup
›





#### Local Development

For learning and development — run Kubernetes on your laptop:


Local K8s setup optionsCopy


```

```


#### Production — Managed Kubernetes (Recommended)


| Provider | Service | Best for |
|---|---|---|
| AWS | EKS (Elastic Kubernetes Service) | AWS-heavy teams, IAM integration |
| Azure | AKS (Azure Kubernetes Service) | Microsoft/enterprise teams |
| GCP | GKE (Google Kubernetes Engine) | Best managed K8s, Autopilot mode |
| Red Hat | OpenShift OCP | Enterprise, regulated industries |


Create EKS cluster (AWS)Copy


```

```







## 🖥️ kubectl — Complete Command Reference
›





kubectl is the command-line tool to interact with Kubernetes. You must know these commands for any DevOps role.


Essential kubectl commandsCopy


```

```


Debugging and troubleshooting commandsCopy


```

```







## 📦 Workloads — Deployment, StatefulSet, DaemonSet
›





#### Deployment — for stateless applications

Use for: web servers, APIs, microservices — anything that does not need stable identity or persistent storage.


Production Deployment YAMLCopy


```

```


#### StatefulSet — for stateful applications

Use for: databases (PostgreSQL, MySQL, MongoDB), Kafka, Elasticsearch, Redis Cluster. Key differences from Deployment:


- Pods get stable names: `postgres-0`, `postgres-1`, `postgres-2`

- Ordered startup and shutdown (postgres-0 starts before postgres-1)

- Each pod gets its own PVC that survives pod restarts and rescheduling

- Stable DNS: `postgres-0.postgres-svc.namespace.svc.cluster.local`


StatefulSet for PostgreSQLCopy


```

```


#### DaemonSet — one pod per node

Use for: log collectors (Fluentd, Filebeat), monitoring agents (node-exporter), network plugins (Calico, Cilium).


DaemonSet for node monitoringCopy


```

```







## 🔧 ConfigMap & Secrets
›





#### ConfigMap — non-sensitive configuration

Store app config, feature flags, config files. Never put passwords or API keys in ConfigMaps.


ConfigMap — create and useCopy


```

```


#### Secrets — sensitive data

**Important:** Kubernetes Secrets are base64-encoded, NOT encrypted by default. For production you must either:


- Enable **etcd encryption at rest** (encrypt data in etcd)

- Use **Sealed Secrets** (bitnami) — encrypt secrets so they are safe to commit to Git

- Use **External Secrets Operator** — pull secrets from AWS Secrets Manager, Azure Key Vault, HashiCorp Vault


Secrets — create and use securelyCopy


```

```







## 🌐 Networking — Services, Ingress, NetworkPolicy
›





#### Service Types


| Type | Use Case | Accessible from |
|---|---|---|
| ClusterIP | Internal service-to-service communication | Inside cluster only |
| NodePort | Dev/testing, expose on node IP:port | Outside via node IP + port |
| LoadBalancer | Production external access (creates cloud LB) | Outside via cloud LB IP |
| ExternalName | DNS alias to external service | Inside cluster → external |


Services and IngressCopy


```

```


#### NetworkPolicy — pod-level firewall


NetworkPolicy — restrict pod trafficCopy


```

```







## 💾 Storage — PV, PVC, StorageClass
›





#### Storage Concepts

Containers are ephemeral — data is lost when pod dies. Kubernetes uses three resources:


- **StorageClass** — defines HOW storage is provisioned (AWS EBS, Azure Disk, NFS). The template.

- **PersistentVolumeClaim (PVC)** — a REQUEST for storage by a pod. Like asking for a disk.

- **PersistentVolume (PV)** — the actual storage resource. Created manually or dynamically by StorageClass.


Storage — complete exampleCopy


```

```







## 🔒 Security — RBAC, ServiceAccounts, Pod Security
›





#### RBAC Model

Every request in Kubernetes goes through: **Authentication** (who are you?) → **Authorisation** (RBAC: are you allowed?) → **Admission Control** (is this request valid?).


| Resource | Scope | Use for |
|---|---|---|
| Role | Namespace | Permissions within one namespace |
| ClusterRole | Cluster-wide | Node-level access, cross-namespace |
| RoleBinding | Namespace | Attach Role to user/ServiceAccount |
| ClusterRoleBinding | Cluster-wide | Attach ClusterRole to user/ServiceAccount |
| ServiceAccount | Namespace | Identity for pods (not humans) |


RBAC — complete exampleCopy


```

```


#### Production Security Checklist


- ✅ Never use `default` ServiceAccount — it accumulates permissions

- ✅ No `cluster-admin` for application pods

- ✅ Enable Pod Security Standards: `restricted` namespace label

- ✅ No root containers in production

- ✅ Read-only root filesystem where possible

- ✅ Encrypt etcd at rest

- ✅ Rotate ServiceAccount tokens (TokenRequest API, not static tokens)

- ✅ Audit logging enabled on API server

- ✅ NetworkPolicy: default-deny, explicit allow







## 📈 Scaling — HPA, VPA, Cluster Autoscaler
›





#### Why Scaling Matters — The Real Problem

Without scaling, you have two bad choices: provision for peak traffic (expensive, wasteful) or provision for average traffic (crashes during spikes). Kubernetes solves this with three autoscaling mechanisms that work at different levels.



#### Three Types of Autoscaling — When to Use Each


| Autoscaler | What it does | When to use | What it changes |
|---|---|---|---|
| HPA — Horizontal Pod Autoscaler | Adds or removes PODS | Stateless apps with variable traffic (web servers, APIs) | replica count |
| VPA — Vertical Pod Autoscaler | Adjusts CPU/memory of existing pods | When you don't know the right resource requests | resource requests/limits |
| Cluster Autoscaler | Adds or removes NODES | When pods cannot schedule due to insufficient node capacity | number of nodes in cluster |
| KEDA — Event-Driven Autoscaler | Scale on any metric or event | Kafka lag, queue depth, custom Prometheus metrics, scale to zero | replica count (extends HPA) |



#### HPA — Horizontal Pod Autoscaler

**What it is:** HPA watches a metric (CPU, memory, custom) and changes the number of pod replicas to maintain that metric at a target value.


**How it works:** Every 15 seconds (default), the HPA controller reads the metric from the metrics-server, calculates the desired replica count using the formula: `desiredReplicas = ceil(currentReplicas × (currentMetricValue / targetMetricValue))`, and updates the Deployment replica count.


**Example:** You have 3 pods. Target CPU = 70%. Current average CPU = 140%. Desired = ceil(3 × 140/70) = ceil(6) = 6 pods. HPA scales up to 6.


**What you MUST have for HPA to work:**



- metrics-server installed in cluster (kubectl top pods must work)

- Resource requests set on the pod (HPA calculates % relative to requests)

- minReplicas and maxReplicas defined


**Common mistake:** Setting target CPU to 100% — pods are always at 100% before HPA triggers. Keep it at 60-70% so there is headroom while new pods start.



HPA — complete example with explanationCopy


```

```



#### VPA — Vertical Pod Autoscaler

**What it is:** VPA analyses historical resource usage of pods and recommends (or automatically sets) CPU and memory requests/limits. If your app uses 300m CPU but you set requests to 100m, VPA detects this and adjusts.


**Three VPA modes:**



- **Off** — only gives recommendations, no changes. Use this first to understand what values to set.

- **Initial** — sets requests when the pod first starts, does not change running pods. Safe.

- **Auto** — can restart pods to apply new resource values. Causes brief downtime. Use with care.


**Important limitation:** VPA and HPA cannot both use CPU/memory on the same deployment. VPA changes requests, HPA calculates based on requests — they conflict. Use KEDA for custom metrics with HPA when you also need VPA.



#### Cluster Autoscaler

**What it is:** Watches for pods that are stuck in Pending state because no node has enough resources. Adds a new node from the cloud provider's node group. Also removes nodes that have been underutilised for 10+ minutes (saves cost).


**How scale-up works:** Pod stays Pending → CA sees it within 10 seconds → requests new node from cloud API → node ready in 2-3 minutes → pod scheduled.


**How scale-down works:** Node CPU/memory below 50% for 10 minutes AND all pods on it can be moved elsewhere → CA drains the node → terminates the VM.


**What prevents scale-down:** Pod with no PodDisruptionBudget, pod with local storage, pod with restrictive anti-affinity, system pods (kube-system). This is why PDBs matter — a badly configured PDB can prevent ALL scale-down.




Cluster Autoscaler + HPA together — production setupCopy


```

```



#### KEDA — Scale on Any Metric

**What it is:** KEDA extends HPA to scale on events and metrics that HPA cannot natively handle — Kafka consumer lag, RabbitMQ queue length, AWS SQS message count, custom Prometheus queries, Azure Service Bus, and more. It can also scale to zero (HPA minimum is 1).


**Real use case:** You have a Kafka consumer processing messages. At peak, 100,000 messages queue up. You want to scale from 2 pods to 50 based on Kafka consumer group lag, not CPU. KEDA makes this possible with a ScaledObject resource.



#### Scaling Decision Guide


| Situation | Solution |
|---|---|
| API gets more traffic at peak hours | HPA on CPU or request rate |
| Don't know right resource requests for a new app | VPA in Off mode first, then Initial |
| Pods Pending because nodes are full | Cluster Autoscaler |
| Kafka consumer needs to scale on queue depth | KEDA with Kafka trigger |
| Batch job needs to scale to zero when no work | KEDA with scale-to-zero |
| Node costs too high during off-hours | Cluster Autoscaler + scheduled HPA scale-down |





## 🚀 Production Checklist
›





#### Before you go live — every workload must have these:


| Item | Why | How |
|---|---|---|
| Resource requests + limits | Prevents noisy neighbour pod killing others | resources.requests + resources.limits |
| Liveness probe | Restart deadlocked pods automatically | livenessProbe.httpGet or exec |
| Readiness probe | Remove pod from LB when not ready | readinessProbe.httpGet or exec |
| PodDisruptionBudget | Survive node drain / K8s upgrades | minAvailable: 2 or maxUnavailable: 1 |
| Pod anti-affinity | Pods spread across nodes / AZs | podAntiAffinity.requiredDuringScheduling |
| Specific image tag | Reproducible deployments | image: myapp:v2.1.0 — NEVER :latest |
| Non-root user | Security — limit blast radius | securityContext.runAsNonRoot: true |
| HPA configured | Handle traffic spikes automatically | HorizontalPodAutoscaler resource |


Production-ready Deployment — complete templateCopy


```

```







## 🔍 Troubleshooting Guide
›





#### Common Issues and Fixes


| Symptom | First command | Common cause |
|---|---|---|
| Pod stuck in Pending | kubectl describe pod | Insufficient resources, node selector mismatch, PVC not bound |
| Pod in CrashLoopBackOff | kubectl logs --previous | App crash on startup, missing secret/env var, OOMKilled |
| Pod in ImagePullBackOff | kubectl describe pod | Wrong image name/tag, no imagePullSecret for private registry |
| Pod stuck in Terminating | kubectl describe pod | Finalizer not removed, node offline |
| Service not reaching pods | kubectl describe svc + get endpoints | Label selector mismatch, pod not Ready |
| OOMKilled | kubectl describe pod | Memory limit too low, memory leak in app |


Systematic troubleshooting commandsCopy


```

```







## ⚙️ Kubelet, Kubectl, Node, Pod, Container — Clearly Explained›




#### The company analogy — remember this for interviews


- **API Server** = reception desk — all requests go through here

- **etcd** = the filing cabinet — stores everything the cluster knows

- **Scheduler** = HR planner — decides which node gets each new pod

- **Controller Manager** = management — watches state, fixes problems

- **kubelet** = office manager on each node — receives instructions, runs containers

- **kube-proxy** = telephone switchboard — routes network traffic to correct pods

- **kubectl** = your phone to call reception — you send commands, API server receives them


#### The exact hierarchy

```
AZURE (Cloud)
└── VMSS (Virtual Machine Scale Set — the AKS node pool)
└── NODE (a VM running Kubernetes)
├── kubelet (process managing this node)
├── kube-proxy (handles pod networking)
└── POD (smallest K8s deployable unit — has its own IP)
├── Container 1: your-app (the actual application)
├── Container 2: sidecar (log collector, Istio proxy)
└── Shared: network namespace, volumes
```


#### kubelet — what it actually does


- Runs on every worker node. The link between control plane and the containers on that node.

- Watches API server: "Do I have new pods assigned to me?"

- Tells containerd/Docker to start containers

- Reports back: "Pod X is Running, Pod Y is CrashLoopBackOff"

- Runs liveness and readiness probes

- Manages volume mounts — PVCs, Secrets, CSI driver volumes


#### kubectl — common commands explained

```
kubectl get pods -n production
# Asks API server → reads from etcd → returns list

kubectl apply -f deployment.yaml
# Sends YAML to API server → validates → stores in etcd
# Scheduler assigns to node → kubelet starts container

kubectl describe pod mypod
# Full details including Events from kubelet and scheduler

kubectl logs mypod
# Goes to kubelet on the pod's node → returns container stdout/stderr

kubectl exec -it mypod -- bash
# Tunnel: API server → kubelet → container runtime → shell
```





## 🎯 Interview Questions & Answers
›







KUBERNETES · ARCHITECT

How do you design a zero-downtime deployment strategy in Kubernetes?

The approach depends on risk level. For standard services: Rolling Update with maxUnavailable:0 and maxSurge:1. This ensures full capacity is maintained throughout. For database schema changes: expand-and-contract pattern — deploy new code that handles both old and new schema simultaneously, run migration, then remove old code path. For high-risk production releases: Argo Rollouts with canary strategy — send 10% of traffic to new version, monitor Prometheus error rate for 5 minutes, if below 1% proceed to 50%, then 100%. If error rate breaches threshold, automatic rollback triggers. Result: zero customer-visible downtime across 200+ deployments per quarter at HPE.



KUBERNETES · ENGINEER

A pod is in CrashLoopBackOff. Walk through your systematic troubleshooting.

Step 1: kubectl describe pod — check Events section at the bottom for OOMKilled (memory limit too low), ImagePullBackOff (wrong image), scheduling failures, missing secrets. Step 2: kubectl logs --previous — this shows logs from the CRASHED container, not the new one. Look for startup errors, missing environment variables, connection refused to dependencies. Step 3: If the app starts briefly then dies — kubectl exec -it into the pod while it is briefly running to inspect the filesystem or test connections. Common causes in order of frequency: missing Kubernetes Secret or ConfigMap, wrong environment variable name, memory limit too low (OOMKilled), aggressive liveness probe restarting healthy pods before they are ready.



KUBERNETES · ENGINEER

Explain the difference between Liveness and Readiness probes with real examples.

Liveness probe — is the container still alive? If it fails, K8s restarts the pod. Use for detecting deadlocks. Example: a Java app that gets stuck in an infinite loop still has a running process but is not doing work. Liveness probe hits /healthz, gets no response, K8s restarts the pod. Readiness probe — is the container ready to RECEIVE traffic? If it fails, K8s removes the pod from Service endpoints but does NOT restart it. Use for slow startup or temporary unavailability during cache warming. Example: a pod takes 30 seconds to load its cache on startup. Without readiness probe, traffic hits the pod before it is ready and users see errors. With readiness probe, traffic only reaches the pod once it responds 200 to /ready. Production rule: always set both. Missing readiness probe means users hit pods that are not ready.



KUBERNETES · PRODUCTION

How does kube-proxy implement Services? What is the difference between iptables and IPVS mode?

kube-proxy runs on every node and maintains network rules that implement Service virtual IPs. When you create a Service with ClusterIP 10.96.0.1:80, kube-proxy creates rules so that traffic to that IP gets distributed to healthy pod IPs. iptables mode (default): kube-proxy creates iptables NAT rules. Traffic hits the virtual IP, iptables randomly selects a pod IP and NATs the packet. Problem: iptables rules are O(n) — with 10,000 Services, each connection scans thousands of rules. IPVS mode: uses Linux kernel IPVS (IP Virtual Server) which uses hash tables — O(1) lookup regardless of number of Services. For clusters with more than 1000 Services, IPVS mode is significantly faster. Enable with kube-proxy --proxy-mode=ipvs.



KUBERNETES · ARCHITECT

How do you manage secrets securely in Kubernetes? What are the risks of default Secrets?

Default Kubernetes Secrets are only base64-encoded, not encrypted. Anyone who can read the etcd database or has get/list on Secrets can decode them instantly. Production approaches in order of security: Level 1 — Enable etcd encryption at rest (EncryptionConfiguration) — encrypts data in etcd but Secrets are still readable via kubectl by anyone with RBAC access. Level 2 — Sealed Secrets (Bitnami) — asymmetrically encrypted Secrets safe to commit to Git. Only the controller in cluster can decrypt. Level 3 — External Secrets Operator — Secrets never live in K8s at all. They are pulled from AWS Secrets Manager, Azure Key Vault, or HashiCorp Vault at runtime. Most secure. At HPE we use External Secrets with Vault — no production credentials ever touch etcd.



KUBERNETES · ENGINEER

What are QoS classes in Kubernetes and why do they matter during node pressure?

Kubernetes assigns each pod a QoS class based on its resource configuration. Guaranteed: pod has both requests and limits set to identical values for all containers. These pods are the LAST to be evicted under memory pressure. Burstable: pod has requests set but limits are higher, or only requests set. Evicted after BestEffort pods. BestEffort: pod has NO resource requests or limits. These are the FIRST to be evicted when a node runs out of memory. In production: always set resource requests and limits to get Guaranteed or at minimum Burstable class. A single BestEffort pod can get killed at any time during memory pressure even if it is your most critical service. This is one of the most common causes of mysterious pod evictions in production.



KUBERNETES · ARCHITECT

Explain how the Kubernetes scheduler works and how you can influence scheduling decisions.

Scheduler works in two phases: Filter — removes nodes that cannot run the pod (insufficient CPU/memory, node has a taint the pod does not tolerate, node selector does not match, affinity rules exclude the node). Score — ranks remaining nodes (least-requested prefers underutilised nodes, pod affinity scores preferred nodes higher). To influence scheduling: nodeSelector — simplest, requires exact label match. nodeAffinity — flexible label expressions, can be preferred or required. podAffinity/podAntiAffinity — schedule near or away from other pods. Taints and Tolerations — mark nodes for specific workloads (GPU nodes, high-memory nodes). PriorityClasses — higher priority pods can preempt lower priority pods when resources are scarce. Real use case: spread web pods across availability zones using topologyKey: topology.kubernetes.io/zone with podAntiAffinity.



KUBERNETES · PRODUCTION

What happens during a Kubernetes node failure? How does K8s recover?

When a node goes offline: Node controller in kube-controller-manager stops receiving heartbeats from kubelet. After node-monitor-grace-period (default 40 seconds), node is marked NotReady. After pod-eviction-timeout (default 5 minutes for most conditions, 30 seconds for node unreachable with TaintBasedEvictions), pods on the node are marked for eviction. ReplicaSet controller sees fewer pods than desired, creates new pods. Scheduler assigns them to healthy nodes. Total recovery time: typically 5-7 minutes end-to-end. To reduce recovery time: use pod-eviction-timeout on the node taint, use liveness probes to fail fast, use multiple replicas with PodDisruptionBudget. Stateful workloads: StatefulSet pods are NOT automatically rescheduled (to prevent data corruption). Manual intervention required to delete the pod if node is permanently dead.



KUBERNETES · ENGINEER

What is the difference between a Deployment and a StatefulSet? When do you use each?

Deployment: pods are interchangeable. Any pod can be replaced by any other. Pods get random names (my-app-5d8f7-xkp2r). No stable storage per pod. Use for stateless apps: web servers, APIs, microservices. StatefulSet: pods have identity. Each pod has a stable ordinal name (postgres-0, postgres-1). Ordered startup and shutdown. Each pod gets its own PVC that follows the pod. Stable DNS hostname per pod. Use for: databases (PostgreSQL, MySQL, MongoDB), message queues (Kafka), search (Elasticsearch), distributed caches (Redis Cluster). Key operational difference: if you delete postgres-0 from a StatefulSet, K8s creates a NEW postgres-0 on another node AND attaches the SAME PVC. The data survives. If you delete a Deployment pod, K8s creates a new pod with a new random name and no storage connection.



KUBERNETES · ARCHITECT

How do you implement multi-tenancy in Kubernetes for multiple teams?

Soft multi-tenancy for trusted internal teams: Namespace per team or per environment (team-payments, team-search). RBAC: each team gets Role with create/update/delete on their namespace resources. ResourceQuota per namespace limits CPU, memory, pod count so one team cannot starve others. LimitRange sets default requests/limits so pods without resource specs still get sensible defaults. NetworkPolicy default-deny then explicit allow: teams cannot reach each other unless intentionally configured. Hard multi-tenancy for untrusted workloads: separate physical clusters. The complexity of truly isolating untrusted workloads in a shared cluster is not worth it. Use vCluster for a middle ground — virtual clusters inside a physical cluster with complete API isolation. At scale: 15 internal teams on one cluster with namespace isolation, 3 external customers on dedicated clusters.



KUBERNETES · PRODUCTION

How do you perform a zero-downtime Kubernetes cluster upgrade?

Managed clusters (EKS/AKS/GKE): upgrade control plane first via console/CLI — provider handles leader election, minimal API downtime (= 2, read the K8s changelog for API deprecations (check with kubectl deprecations plugin), test in staging first. At HPE: upgraded 50-node clusters with zero application downtime using this rolling strategy.



KUBERNETES · ENGINEER

Explain the Kubernetes container lifecycle — what states does a container go through?

A container in Kubernetes goes through these states. Waiting: container is not yet running — it is pulling the image, waiting for a secret to be available, or waiting for an init container to complete. Running: container is executing. Terminated: container finished execution (exit code 0 = success, non-zero = failure). At the Pod level the phases are: Pending (pod accepted but containers not yet started — usually image pulling or scheduling), Running (at least one container running), Succeeded (all containers exited 0), Failed (at least one container exited non-zero), Unknown (node communication lost). Restart policy controls behaviour on failure: Always (default for Deployments — always restart), OnFailure (restart only on non-zero exit), Never (do not restart). When a container crashes repeatedly, Kubernetes applies exponential backoff: 10s, 20s, 40s, 80s, 160s, 300s max between restarts. This is the CrashLoopBackOff state you see in kubectl get pods — container keeps crashing and Kubernetes keeps waiting longer between restarts. Check kubectl logs pod-name --previous to see logs from the crashed container.




KUBERNETES · ENGINEER

What are the four Kubernetes Service types and when do you use each?

ClusterIP (default): exposes the service on an internal cluster IP. Only reachable from within the cluster. Use for: microservice-to-microservice communication. database services that should never be exposed externally. Most services in a production cluster are ClusterIP. NodePort: exposes the service on each node's IP at a static port (30000-32767). Accessible from outside the cluster via NodeIP:NodePort. Use for: development and testing, on-premise clusters without cloud load balancers. Not recommended for production — exposes high ports, depends on node IPs, no TLS termination. LoadBalancer: provisions a cloud load balancer (AWS NLB, Azure LB, GCP LB) that routes external traffic to the service. Use for: production workloads needing direct external access without ingress, TCP/UDP services (databases, game servers). Cost: each LoadBalancer service creates a cloud LB, which has hourly cost. ExternalName: maps a service to a DNS name. Use for: integrating external services (RDS database, external API) into cluster service discovery. Pods call the service name, it resolves to the external DNS. In practice: use ClusterIP for everything internal, one LoadBalancer for the Ingress Controller, ExternalName for external dependencies.




KUBERNETES · ENGINEER

Explain Kubernetes RBAC — Roles, ClusterRoles, RoleBindings, ClusterRoleBindings.

RBAC controls who can do what on which Kubernetes resources. The four objects: Role defines permissions within a single namespace — rules that allow specific verbs (get, list, watch, create, update, delete) on specific resources (pods, deployments, secrets). ClusterRole defines permissions cluster-wide — same structure as Role but applies across all namespaces, or to cluster-scoped resources (nodes, persistent volumes). RoleBinding attaches a Role or ClusterRole to a subject (User, Group, ServiceAccount) within a specific namespace. ClusterRoleBinding attaches a ClusterRole to a subject across the entire cluster. Common patterns: developer access — ClusterRole with read-only on pods/deployments, RoleBinding per namespace (developer can view their namespace, not production). CI/CD service account — ClusterRole with create/update on deployments, RoleBinding in the deployment namespace only. Least privilege: never give ClusterAdmin unless absolutely necessary. A compromised service account with ClusterAdmin can read all secrets in the cluster including other teams' production credentials. In AKS: Azure AD integration means you can bind Azure AD groups to Kubernetes RBAC — platform team in AD group gets ClusterAdmin, developers in another group get namespace-scoped access.




KUBERNETES · ARCHITECT

What is the role of Helm in Kubernetes and how does it manage releases?

Helm is the package manager for Kubernetes — it packages, versions, and deploys collections of Kubernetes manifests as a single unit called a chart. Without Helm: you apply 15 separate YAML files for one application. Updating a value means editing multiple files. Rolling back means tracking which YAML version was previously applied. With Helm: one helm install command deploys all 15 resources. One helm upgrade updates what changed. helm rollback reverts to a previous release version. A Helm chart contains: templates/ (Kubernetes YAML with Go template variables), values.yaml (default configuration values), Chart.yaml (chart metadata — name, version, dependencies). Release management: Helm stores release state in Kubernetes Secrets in the deployment namespace. Each upgrade creates a new revision. helm history shows all revisions. helm rollback revision-number reverts in seconds. Values override: helm install myapp ./mychart -f production-values.yaml --set image.tag=v2.1.0. The environment-specific values.yaml overrides defaults, and --set overrides specific values at the command line. In GitOps with ArgoCD: ArgoCD manages Helm releases — when values.yaml in Git changes, ArgoCD runs helm upgrade automatically. The combination of Helm for packaging and ArgoCD for delivery is the production standard for Kubernetes application deployment.







KUBERNETES · ENGINEER

Walk through the Kubernetes container lifecycle.

A container passes through these states. Waiting: not yet running — pulling image, waiting for init container, or waiting for a dependency. Running: executing normally. Terminated: finished (exit code 0 = Succeeded, non-zero = Failed). At the Pod level: Pending (accepted by API server, containers not yet started — image pulling or scheduling), Running (at least one container running), Succeeded (all containers exited 0), Failed (at least one container exited non-zero), Unknown (node communication lost). When containers crash: restart policy applies. Always (default for Deployments — always restart). OnFailure (restart only on non-zero exit). Never. Kubernetes applies exponential backoff between restarts: 10s → 20s → 40s → 80s → 160s → 300s maximum. CrashLoopBackOff is the state you see when the container keeps crashing — Kubernetes is waiting between retries. Check kubectl logs pod-name --previous to see the logs from the crashed container.



KUBERNETES · ENGINEER

Explain all four Kubernetes Service types with real use cases.

ClusterIP (default): internal-only virtual IP. Gets a DNS name: service-name.namespace.svc.cluster.local. Used for all pod-to-pod communication. Frontend to backend, app to database. 90% of services in a cluster are ClusterIP. NodePort: exposes on a static port (30000-32767) on every node's IP. Used for testing or on-premise clusters without cloud LB. Not production-recommended — exposes node IPs, non-standard ports. LoadBalancer: provisions a cloud load balancer — Azure LB with public or private IP. External traffic → Azure LB → node → pod. For internal only: add annotation service.beta.kubernetes.io/azure-load-balancer-internal: "true" for a private IP. Each LoadBalancer service creates one Azure LB (costs money) — use Ingress Controller instead to share one LB across many services. ExternalName: maps a K8s service name to an external DNS name. Pod calls payment-gateway-service, it resolves to api.paymentprovider.com. Used for integrating external services into K8s service discovery without changing application code. Production pattern: ClusterIP for everything internal, one LoadBalancer for the Ingress Controller (NGINX or AGIC), ExternalName for external dependencies.



KUBERNETES · ENGINEER

How does HPA work and how does it combine with Cluster Autoscaler?

HPA (Horizontal Pod Autoscaler) scales pod replicas based on metrics. Default trigger: CPU/memory utilisation. Can use custom metrics (requests per second, queue depth) via metrics-server or Prometheus Adapter. When pod CPU average exceeds 70% (target): HPA creates more pod replicas. When drops below: scales down (with a 5-minute cooldown). Cluster Autoscaler (CA) scales nodes. Trigger: pods stuck in Pending state because no node has available capacity. CA sees the Pending pod, evaluates which node pool can satisfy its resource request, and requests Azure to add a VM to the VMSS. Takes 2-5 minutes. They work together: HPA creates demand (more pods needed) → pods go Pending if no node has space → CA adds a node → pods schedule. Important: pods must have resource requests defined — CA uses requests (not limits) to calculate if a pod will fit on a node. Without requests, CA cannot schedule correctly. For scale-down: CA removes a node only if all pods on it can be rescheduled elsewhere and the node is underutilised for 10 minutes.



KUBERNETES · ARCHITECT

How do you implement RBAC in Kubernetes for a multi-team environment?

Two levels: Azure RBAC controls who can manage the AKS cluster (az aks commands). Kubernetes RBAC controls what they can do inside the cluster. The pattern I use: integrate AKS with Azure AD — developers authenticate with their corporate credentials. Define K8s ClusterRoles mapped to job functions. Namespace-scoped RoleBindings limit scope: developer gets Deployment create/update/delete in their namespace only, cannot touch other namespaces or cluster-level resources. Platform team gets ClusterAdmin. Read-only role for observability team. Bind Azure AD groups to ClusterRoles using ClusterRoleBindings — when a user joins the dev-team AD group, they automatically get the right K8s permissions. Nobody gets direct production kubectl access — all production deployments go through the CI/CD pipeline using a service principal or Managed Identity with minimum permissions. Audit: all kubectl actions are logged in Azure Monitor. Review: quarterly access review removes stale bindings.



KUBERNETES · PRODUCTION

A pod replacement is not being created after termination. What do you check?

kubectl describe deployment myapp and kubectl describe replicaset — check the Events section. The ReplicaSet controller should be creating replacement pods. If it's not: check kubectl get events --sort-by=.metadata.creationTimestamp for recent cluster events. Common causes: Insufficient resources — node doesn't have enough CPU/memory to schedule the new pod. kubectl describe node shows allocatable vs allocated resources. Check if there are resource requests on the pod — if not, scheduling is unpredictable. Node issues — kubectl get nodes, check if any are NotReady. Node issues prevent scheduling. Image pull errors — new pod can't pull the image. Check ImagePullBackOff errors. Resource quotas — namespace has a ResourceQuota that's been hit. kubectl describe resourcequota -n namespace. Scheduler issues — check kube-scheduler logs. PodAffinity/AntiAffinity rules — if rules can't be satisfied (e.g., no nodes in the required zone), pod stays Pending. Taints and tolerations — if nodes have taints the pod doesn't tolerate, it won't schedule. Fix the root cause, then kubectl rollout restart deployment myapp to force fresh pod creation.



KUBERNETES · ENGINEER

What is a StatefulSet and why use it for databases?

StatefulSet is a Kubernetes workload type for applications that need stable network identity and persistent storage per pod. With Deployment: pods get random names (app-7d8f9-xyz) that change on restart, and PVCs can be shared or reassigned. MongoDB replica sets identify members by hostname — if the hostname changes on restart, the replica set breaks. With StatefulSet: pods get stable ordered names (mongo-0, mongo-1, mongo-2) that persist across restarts. Each pod gets its own dedicated PVC via volumeClaimTemplates — mongo-0 always gets its own PVC, same data on restart. Pods start in order (mongo-0 first, then mongo-1) which matters for primary election. Headless service (clusterIP: None) provides per-pod DNS: mongo-0.mongo-svc.namespace.svc.cluster.local. MongoDB uses these stable DNS names to find replica set members. Production StatefulSet config: 3 replicas, dedicated SSD storage class, PodDisruptionBudget allowing max 1 unavailable, pod anti-affinity to spread replicas across availability zones so no single zone failure takes all replicas.



KUBERNETES · PRODUCTION

What steps do you follow before a production Kubernetes cluster upgrade?

Structured process. 1. Check compatibility: az aks get-upgrades --name myaks --resource-group myrg. Verify available versions. Check all workloads for any deprecated API versions being removed in the target version (use kubectl deprecations or Pluto tool). 2. Raise Change Request and get approvals — CAB approval for production. 3. Schedule maintenance window — low-traffic period. Notify stakeholders. 4. Test in non-production first: upgrade dev cluster, verify all applications run correctly on new version for minimum 1 week. 5. Backup etcd and document current state — though AKS manages etcd. 6. Upgrade control plane first: az aks upgrade --name myaks --resource-group myrg --kubernetes-version 1.29.0 --control-plane-only. Control plane upgrade typically completes in 5-10 minutes with no application impact. 7. Upgrade node pools one at a time — system pool first, then user pools. AKS cordons and drains each node before upgrading. PodDisruptionBudgets are respected. 8. Validate: kubectl get nodes (all Ready with new version), run smoke tests on all critical services, check Application Insights for error spikes. 9. Monitor for 24 hours with heightened alerting.





## 🗺️ Learning Roadmap
›





#### How to learn Kubernetes step by step





Week 1-2
Foundations

What is K8s and why
Install minikube locally
kubectl basics: get, describe, logs
Create first Deployment



Week 3-4
Core Workloads

Deployments, rolling updates, rollback
Services: ClusterIP, NodePort, LoadBalancer
ConfigMaps and Secrets
Liveness and Readiness probes



Month 2
Intermediate

StatefulSets for databases
Ingress and TLS
PersistentVolumes and storage
RBAC and ServiceAccounts
Namespaces and resource quotas



Month 3
Production

HPA autoscaling
Pod affinity and anti-affinity
PodDisruptionBudgets
NetworkPolicy
Resource limits and QoS classes



Month 4+
Architect Level

Multi-cluster management
GitOps with ArgoCD/FluxCD
Service mesh (Istio)
K8s operators
CKA/CKAD certification








Continue Learning


[🐳 Docker](/devops/docker.html)
[🔷 Terraform](/devops/terraform.html)
[🐙 ArgoCD](/cicd/argocd.html)
[🔥 Prometheus](/monitoring/prometheus.html)
[🕸️ Istio](/containers/istio.html)
[🏠 All Topics](/)









🤖
✕




🤖



AI Assistant

Ask anything about this topic

Clear





👋 Hi! I have read this page and can answer your questions.


Try asking: *"Explain this topic in simple terms"* or *"Give me an example"* or ask any specific question.




Explain simply
Give an example
Interview tips
Common mistakes




➤

---

## Production Patterns from Real Deployments

Kubernetes | Azure | Ansible | Datadog

Prepared for: Senior DevOps Engineer (7+ Years)  |  May 2026

**Your Profile ****at a Glance**

- 7+ years DevOps experience

- Currently managing OCP (OpenShift) with Kafka, Oracle, Grafana, Graylog, Kibana

- Transitioning to Azure DevOps with AKS (Azure Kubernetes Service)

- Learning Ansible and Datadog — covered in depth in this guide

**Document Structure**

- PART 1: 25 Core Interview Questions (CI/CD, Terraform, Kubernetes, Azure)

- PART 2: 10 Ansible Troubleshooting Questions (Real Production Scenarios)

- PART 3: 10 Datadog Monitoring Questions (Setup, Dashboards, Log Correlation)

- PART 4: 5 Production Incident Scenarios (Step-by-Step Resolution)

- PART 5: Code Reference (Ansible Playbooks, Datadog Configs, kubectl Commands)

**  PART 1: 25 CORE INTERVIEW QUESTIONS  **

# Section 1: CI/CD Pipeline

**Q1: ****How would you design a CI/CD pipeline for a microservices application migrating to AKS?**

**Answer:**

Given your OCP background, the migration to AKS CI/CD will feel familiar but uses Azure-native tooling. Here is the architecture I recommend for Wipro engagements:

**Pipeline Architecture:**

- Source Control: Azure Repos (Git) or GitHub

- CI: Azure Pipelines with YAML-based pipelines (azure-pipelines.yml)

- Artifact Registry: Azure Container Registry (ACR)

- CD: Azure Pipelines Release or GitOps with ArgoCD/Flux

- Secrets: Azure Key Vault integration

**YAML Pipeline skeleton:**

trigger:

  branches:

    include: [main, release/*]

variables:

  imageRepository: 'myapp'

  containerRegistry: 'myregistry.azurecr.io'

  tag: '$(Build.BuildId)'

stages:

- stage: Build

  jobs:

  - job: BuildAndPush

    pool: { vmImage: ubuntu-latest }

    steps:

    - task: Docker@2

      inputs:

        command: buildAndPush

        repository: $(imageRepository)

        containerRegistry: myACRServiceConnection

        tags: $(tag)

- stage: Deploy_Dev

  dependsOn: Build

  jobs:

  - deployment: DeployToAKS

    environment: dev

    strategy:

      runOnce:

        deploy:

          steps:

          - task: KubernetesManifest@0

            inputs:

              action: deploy

              kubernetesServiceConnection: aks-dev

              manifests: k8s/deployment.yaml

              containers: $(containerRegistry)/$(imageRepository):$(tag)

**TIP: **From your OCP experience: Azure Pipelines stages map directly to OpenShift pipeline stages. The main difference is YAML syntax and Azure service connections instead of OpenShift secrets.

**Q2: ****Explain Blue-Green vs Canary deployments. When would you use each?**

**Answer:**

**Blue-Green Deployment:**

Two identical production environments. Traffic switches 100% from blue (current) to green (new) via load balancer/ingress update.

- Use when: Zero-downtime releases, easy rollback required, database schema changes

- Risk: Full traffic switch — if green has issues, ALL users are affected

- AKS implementation: Swap Kubernetes Service selectors between blue/green deployments

**Canary Deployment:**

Gradual traffic shift to new version — e.g., 5% > 25% > 50% > 100%.

- Use when: Validating new features with real traffic, A/B testing, risk-averse releases

- AKS implementation: Use NGINX Ingress weight annotations or Azure Front Door

# Canary with NGINX Ingress

apiVersion: networking.k8s.io/v1

kind: Ingress

metadata:

  name: myapp-canary

  annotations:

    nginx.ingress.kubernetes.io/canary: 'true'

    nginx.ingress.kubernetes.io/canary-weight: '20'  # 20% traffic

spec:

  rules:

  - host: myapp.example.com

    http:

      paths:

      - path: /

        pathType: Prefix

        backend:

          service: { name: myapp-canary, port: { number: 80 } }

**TIP: **In Wipro AKS projects, Canary is preferred for microservices — it limits blast radius. Blue-Green suits stateful apps like your Oracle/Kafka stack.

**Q3: ****How do you handle secrets management in a CI/CD pipeline?**

**Answer:**

Nev
