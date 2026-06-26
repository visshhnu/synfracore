# OpenShift Container Platform (OCP) — Overview

## What is OpenShift?

Red Hat OpenShift Container Platform (OCP) is an **enterprise Kubernetes distribution** — Kubernetes underneath, but with everything enterprises actually need already built in. Where vanilla Kubernetes gives you the engine, OpenShift gives you the entire car.

OCP version reference: **4.x (4.14 / 4.15 / 4.16)** — current production versions as of 2026.

## OpenShift vs Vanilla Kubernetes

The single most important table to understand before any OCP interview:

| Feature | Kubernetes | OpenShift |
|---|---|---|
| Ingress | Kubernetes Ingress (needs controller) | Routes (HAProxy built-in) |
| Deployment | Deployment | Deployment + DeploymentConfig (legacy) |
| Image builds | External CI required | BuildConfig + ImageStream built-in |
| Security | Basic RBAC | RBAC + Security Context Constraints (SCCs) |
| Authentication | External IdP only | Built-in OAuth server (HTPasswd, LDAP, OIDC) |
| Registry | External only | Integrated Internal Image Registry |
| CLI | kubectl | oc (superset — all kubectl commands work) |
| Monitoring | Optional add-on | Built-in Prometheus + Grafana + Alertmanager |
| Updates | Manual | Managed by Cluster Version Operator (CVO) |
| Developer portal | None | Web Console with topology view |
| Pipelines | External | OpenShift Pipelines (Tekton) built-in |

**Key phrase for interviews:** *"OpenShift is Kubernetes with enterprise guardrails — security, observability, and developer experience baked in rather than bolted on."*

## OCP Cluster Architecture

### Node Types

```
┌─────────────────────────────────────────────────────────┐
│                   OCP Cluster                           │
│                                                         │
│  ┌─────────────────────────────────┐                   │
│  │   Control Plane (Masters) × 3  │  ← etcd here       │
│  │   API Server | Scheduler        │                   │
│  │   Controller Manager | etcd     │                   │
│  └─────────────────────────────────┘                   │
│                                                         │
│  ┌──────────┐  ┌──────────┐  ┌──────────┐             │
│  │ Worker 1 │  │ Worker 2 │  │ Worker N │  ← app pods  │
│  └──────────┘  └──────────┘  └──────────┘             │
│                                                         │
│  ┌──────────────────────────┐                          │
│  │  Infrastructure Nodes    │  ← Router, Registry,     │
│  │  (optional, recommended) │    Monitoring, Logging   │
│  └──────────────────────────┘                          │
└─────────────────────────────────────────────────────────┘
```

| Node Type | Role |
|---|---|
| Control Plane (Masters) | Run etcd, API server, Scheduler, Controller Manager. Minimum 3 for HA |
| Worker Nodes (Compute) | Run application workloads (pods). Scale horizontally |
| Infrastructure Nodes | Run platform components: Ingress, Registry, Monitoring, Logging. Reduces licensing cost |
| Bootstrap Node | Temporary — only used during initial install, then decommissioned |

### Core OCP Components

| Component | Purpose |
|---|---|
| **etcd** | Distributed key-value store — all cluster state lives here. Always 3 or 5 nodes for quorum |
| **API Server** | Central hub — all oc/kubectl commands go through it. Validates and persists objects |
| **Controller Manager** | Control loops that reconcile desired vs actual state (ReplicaSet controller, etc.) |
| **Scheduler** | Places pods on nodes based on resource requests, affinity, taints/tolerations |
| **OVN-Kubernetes** | Default CNI (network plugin) in OCP 4.x — provides pod networking and Network Policies |
| **Cluster Version Operator (CVO)** | Manages OCP cluster upgrades — reads ClusterVersion object, applies updates |
| **Operator Lifecycle Manager (OLM)** | Manages Operators from OperatorHub — install, updates, lifecycle |
| **OpenShift OAuth Server** | Authentication — integrates with HTPasswd, LDAP, GitHub, OIDC |
| **Internal Image Registry** | Stores container images built inside OCP — backed by object storage |
| **Machine Config Operator (MCO)** | Manages OS-level config on nodes via MachineConfig objects |
| **Ingress Operator** | Manages HAProxy-based Router — handles Route objects |

## Why OpenShift is Dominant in Enterprise

**Telecom:** 5G core networks, NFV/VNF workloads, ORAN — virtually all telcos (Vodafone, Orange, Nokia, Ericsson deployments) run OCP.

**Banking & Finance:** Security, compliance (FIPS 140-2, PCI-DSS), support SLAs — regulated industries need Red Hat's enterprise support.

**Healthcare:** HIPAA compliance requirements, enterprise support contracts, long-term stability.

**Government:** FedRAMP certification, Air-gapped deployment capability (Agent-based installer), FIPS compliance.

**Why it beats vanilla K8s in enterprise:**
- One support contract covers everything (OS, K8s, operators, monitoring)
- Managed upgrades with CVO — no manual Kubernetes version upgrades
- SCCs provide security policies that vanilla K8s added only in Kubernetes 1.25+ (PSA)
- OperatorHub gives certified, Red Hat-supported operators for databases, monitoring, GitOps

## Quick Key Namespaces

Every OCP cluster has these system namespaces — know them for troubleshooting:

```
openshift-apiserver      — API server components
openshift-etcd           — etcd cluster
openshift-ingress        — Router / HAProxy pods
openshift-image-registry — internal image registry
openshift-monitoring     — Prometheus, Alertmanager, Grafana
openshift-logging        — EFK/Loki logging stack (if installed)
openshift-operators      — cluster-scoped operators
openshift-gitops         — ArgoCD (if OpenShift GitOps operator installed)
openshift-pipelines      — Tekton (if OpenShift Pipelines operator installed)
```

**Golden rule:** Never deploy application workloads in namespaces starting with `openshift-` or `kube-`.

## OCP in the Real World — Enterprise Telecom

In a large telecom organisation, OCP 4.16 ran the unified telecom provisioning platform:
- 3 environments: dev, test, prod
- 50+ pods per environment
- Microservices: Service Order Management (SOM), Catalog (COM/CFS), Resource Fulfillment (RFS)
- Full day-2 operations: RBAC, deployments, upgrades, SCC troubleshooting, Helm, ArgoCD
- 99.9% SLA maintained on production
