# OpenShift OCP 4.x — Architecture & Installation

## Module 1: OCP Architecture Overview

# OpenShift OCP 4.x — Complete Deep Dive Interview Preparation
## Enterprise Architecture · Security · HA · HPA · CI/CD · Workload Identity · AKS Upgrade · App Gateway
### Real-world practical design with scenarios — Vishnu's complete reference

---

## PART 1: OPENSHIFT vs KUBERNETES — WHAT MAKES OCP DIFFERENT

### OCP is Kubernetes + Enterprise Layer

```
OpenShift OCP 4.x Architecture Stack:

┌─────────────────────────────────────────────────────┐
│  APPLICATION LAYER                                  │
│  Your microservices, Deployments, StatefulSets      │
├─────────────────────────────────────────────────────┤
│  OPENSHIFT PLATFORM LAYER (on top of K8s)           │
│  Routes · ImageStreams · BuildConfigs · S2I         │
│  OAuth Server · SCCs · OperatorHub · Project RBAC   │
├─────────────────────────────────────────────────────┤
│  KUBERNETES LAYER                                   │
│  Pods · Deployments · Services · ConfigMaps         │
│  RBAC · NetworkPolicy · PV/PVC                      │
├─────────────────────────────────────────────────────┤
│  RHCOS (Red Hat Enterprise Linux CoreOS)            │
│  Immutable OS · CRI-O runtime · Ignition config     │
│  Machine Config Operator manages OS changes         │
└─────────────────────────────────────────────────────┘
```

### Key OCP-Specific Concepts vs Vanilla Kubernetes

| Feature | Vanilla Kubernetes | OpenShift OCP 4.x |
|---|---|---|
| OS | Any (Ubuntu, CentOS) | RHCOS (immutable, managed by MCO) |
| Container runtime | Docker or containerd | CRI-O only |
| Namespace | Namespace | Project (namespace + annotations + RBAC) |
| Routing | Ingress | Route (HAProxy-based, automatic TLS) |
| Image registry | External only | Built-in internal registry |
| Build system | External CI only | BuildConfig + S2I (Source-to-Image) |
| Security | Permissive by default | SCCs (Security Context Constraints) strict |
| Authentication | External OIDC | Built-in OAuth server |
| Operators | Manual install | OperatorHub + OLM (Operator Lifecycle Manager) |
| Upgrade | Manual steps | Cluster Version Operator (CVO) manages upgrades |
| CLI | kubectl | oc (superset of kubectl) |

---

## PART 2: OCP 4.x ARCHITECTURE — NODES AND ROLES

### Node Types in OCP 4.x

```
OCP Cluster (Production HA Design):

CONTROL PLANE (Master Nodes) — 3 minimum for HA
├── etcd           — cluster state database (distributed)
├── kube-apiserver — all API requests go through here
├── kube-scheduler — assigns pods to nodes
├── kube-controller-manager — reconciliation loops
└── OpenShift-specific controllers

INFRASTRUCTURE NODES (separate from workers — best practice)
├── Ingress Controller (HAProxy) — handles Routes
├── Internal Image Registry
├── Monitoring stack (Prometheus, Grafana, Alertmanager)
├── Logging stack (Elasticsearch, Fluentd, Kibana)
└── OAuth server

WORKER NODES (application workloads)
├── Your application pods
├── kubelet + CRI-O
└── kube-proxy
```

**Why Infrastructure Nodes?**
- Separates platform services from application workloads
- Infra nodes use infra node subscription — does NOT consume worker node licence
- Apply taint `node-role.kubernetes.io/infra:NoSchedule` to keep app pods off infra nodes

**How to create infra nodes:**
```bash
# Label and taint a node as infra
oc label node worker-3 node-role.kubernetes.io/infra=""
oc adm taint nodes worker-3 node-role.kubernetes.io/infra:NoSchedule
```

---

## PART 3: VM RESOURCE LIMIT — HOW TO INCREASE WITHOUT DOWNTIME

### Scenario: Node is running out of memory. How to increase VM memory in OCP/Kubernetes without downtime?

**The honest answer:** You CANNOT increase VM memory of a running node without rebooting it. But you can achieve ZERO APPLICATION DOWNTIME by following this process:

### Step-by-Step: Increase VM Memory Without Application Downtime

```
GOAL: Replace old under-resourced nodes with larger VMs
      without taking any application offline

APPROACH: Rolling node replacement (cordon → drain → delete → add new)
```

**Step 1 — Check current node resources:**
```bash
# OCP
oc adm top nodes
oc describe node <node-name> | grep -A5 "Allocated resources"

# Kubernetes/AKS
kubectl top nodes
kubectl describe node <node-name> | grep -A5 "Allocated resources"
```

**Step 2 — Cordon the node (stop new pods scheduling on it):**
```bash
# OCP
oc adm cordon <node-name>

# Kubernetes
kubectl cordon <node-name>
```
Node shows `SchedulingDisabled` — existing pods keep running, no new pods go here.

**Step 3 — Drain the node (gracefully move all pods to other nodes):**
```bash
# OCP
oc adm drain <node-name> \
  --ignore-daemonsets \
  --delete-emptydir-data \
  --grace-period=60 \
  --timeout=300s

# Kubernetes
kubectl drain <node-name> \
  --ignore-daemonsets \
  --delete-emptydir-data \
  --grace-period=60
```

**What drain does:**
1. Respects PodDisruptionBudgets — waits for replacement pods to be ready elsewhere
2. `--ignore-daemonsets` — DaemonSet pods cannot be moved, skip them
3. `--delete-emptydir-data` — pods with emptyDir volumes get data deleted (warning!)
4. `--grace-period=60` — gives applications 60 seconds to shutdown gracefully

**Step 4 — Wait for all pods to reschedule on other nodes:**
```bash
kubectl get pods -A -o wide | grep <node-name>
# Should show nothing (or only daemonset pods)
```

**Step 5 — In OCP — Edit MachineSet to increase VM size:**
```bash
# OCP uses MachineSets for node management
oc get machinesets -n openshift-machine-api

# Edit MachineSet to change VM size
oc edit machineset <machineset-name> -n openshift-machine-api

# Change this field:
spec:
  template:
    spec:
      providerSpec:
        value:
          vmSize: Standard_D8s_v3    # was Standard_D4s_v3
```

**Step 6 — Delete old node (MachineSet creates replacement automatically in OCP):**
```bash
# In OCP — delete the Machine object (not the node directly)
oc delete machine <machine-name> -n openshift-machine-api
# MachineSet controller automatically creates new machine with new VM size

# In AKS — dele

---

## Module 2: Installation Methods

**&**** CONFIGURATION**

**2.1  Installation Methods**

| **Method** | **When to Use** |
| --- | --- |
| IPI — Installer Provisioned Infrastructure | OCP installs AND manages cloud infra (AWS, Azure, GCP, vSphere). Recommended for cloud deployments |
| UPI — User Provisioned Infrastructure | You provision nodes manually. Needed for bare-metal, restricted networks, on-prem |
| Assisted Installer | Web-based guided install via Red Hat Console — best for on-prem/bare-metal |
| Agent-based Installer | Disconnected / air-gapped environments — ISO-based, no internet required |
| Single Node OpenShift (SNO) | All OCP roles on one node — edge/lab use only |

**2.2  Pre-Installation Checklist (UPI/IPI)**

- DNS: API endpoint (api.<cluster>.<domain>) and wildcard apps (*.apps.<cluster>.<domain>) must resolve

- Pull Secret: Download from Red Hat Console (cloud.redhat.com) — required to pull OCP images

- SSH Key pair: for node access post-install

- Network: CIDR ranges for Machine CIDR, Cluster Network (pod CIDR), Service Network — must not overlap

- Firewall ports: 6443 (API), 22623 (Machine Config), 80/443 (apps), 2379-2380 (etcd)

- Storage: etcd requires fast SSD (fio test ≥ 10ms p99 fsync latency)

**2.3  install-config.yaml — Key Fields**

*This file is consumed ONCE during install — edit before running openshift-install create cluster*

| **Field** | **Description** |
| --- | --- |
| baseDomain | Your root DNS domain (e.g. example.com) |
| metadata.name | Cluster name — becomes part of all DNS entries |
| controlPlane.replicas | Usually 3 (HA). Never 2 (no quorum) or 1 (no HA) |
| compute.replicas | Number of worker nodes (can be scaled post-install) |
| networking.clusterNetwork | Pod CIDR (default 10.128.0.0/14) |
| networking.serviceNetwork | Service CIDR (default 172.30.0.0/16) |
| networking.machineNetwork | Node/host CIDR |
| platform.aws/azure/none | Cloud-specific config or 'none' for bare-metal UPI |
| pullSecret | Red Hat pull secret (JSON) |
| sshKey | Your public SSH key for node access |
| fips | Enable FIPS 140-2 mode (true/false) — set at install time, cannot change later |

**2.4  Post-Install Verification**

- oc get nodes — all nodes should show Ready status

- oc get co — all Cluster Operators should show Available=True, Progressing=False, Degraded=False

- oc get clusterversion — check VERSION and AVAILABLE columns

- oc get pods -A | grep -v Running | grep -v Completed — identify any failing pods

- Access web console URL: https://console-openshift-console.apps.<cluster>.<domain>
