# Google Kubernetes Engine (GKE) Interview Questions

## Core Concepts

**Q: What is GKE? Standard vs Autopilot?**

GKE is Google Cloud's managed Kubernetes service. Google manages the control plane.

**GKE Standard**: You manage node pools, machine types, autoscaling config.
- Full control over infrastructure
- Pay for nodes (even when underutilised)
- Good for: specific hardware needs, GPU workloads, fine-tuned configurations

**GKE Autopilot**: Google manages nodes — you only define pod specs.
- Pay per pod (not nodes) — no idle node cost
- Automatic right-sizing, security hardening
- No node management needed
- Good for: most production workloads, teams wanting to minimise ops overhead
- Limitations: no privileged pods, no host network, limited customisation

---

**Q: GKE networking — VPC-native clusters.**

```bash
# VPC-native cluster (recommended): Pods get VPC IPs
gcloud container clusters create my-cluster   --enable-ip-alias \           # VPC-native
  --network my-vpc   --subnetwork my-subnet   --cluster-secondary-range-name pod-range   --services-secondary-range-name service-range
```

**Benefits of VPC-native:**
- Pods directly routable from on-prem/other VPCs
- No NAT masquerading for pod traffic
- Alias IP ranges for pods (no node-level routing overhead)
- Required for private clusters and network policies

**Private cluster**: Control plane has private endpoint only.
```bash
gcloud container clusters create my-cluster   --enable-private-nodes   --enable-private-endpoint   --master-ipv4-cidr 172.16.0.0/28
```

---

**Q: Workload Identity in GKE.**

Allows pods to authenticate as Google Service Accounts without storing keys.

```bash
# Enable workload identity on cluster
gcloud container clusters update my-cluster   --workload-pool=my-project.svc.id.goog

# Create K8s service account
kubectl create serviceaccount my-ksa --namespace my-namespace

# Bind K8s SA to Google SA
gcloud iam service-accounts add-iam-policy-binding my-gsa@my-project.iam.gserviceaccount.com   --role roles/iam.workloadIdentityUser   --member "serviceAccount:my-project.svc.id.goog[my-namespace/my-ksa]"

# Annotate K8s SA
kubectl annotate serviceaccount my-ksa   iam.gke.io/gcp-service-account=my-gsa@my-project.iam.gserviceaccount.com
```

Pods using `my-ksa` automatically get GCP credentials — no key files.

---

**Q: GKE node pools and auto-provisioning.**

```bash
# Node auto-provisioning: GKE creates node pools as needed
gcloud container clusters update my-cluster   --enable-autoprovisioning   --max-cpu 100 --max-memory 1000Gi

# Spot nodes (preemptible) for batch workloads
gcloud container node-pools create spot-pool   --cluster my-cluster --spot   --machine-type n2-standard-4   --enable-autoscaling --min-nodes 0 --max-nodes 20
```

**Cluster autoscaler**: Scales node pools based on pod scheduling needs.
**Node auto-provisioning**: Creates new node pools with right machine type automatically.

---

**Q: GKE operations and monitoring.**

```bash
# Enable Cloud Operations (Logging + Monitoring)
gcloud container clusters update my-cluster   --logging=SYSTEM,WORKLOAD   --monitoring=SYSTEM,WORKLOAD,API_SERVER

# GKE console: Workloads, Services, Cluster → all in GCP Console
# Cloud Monitoring: pre-built GKE dashboards (node, pod, container metrics)
# Cloud Logging: structured logs from all containers
# Cloud Trace: distributed tracing (auto-instrumented for GCP services)
```

**Upgrade strategies:**
- Surge upgrades: Add extra node, migrate pods, remove old node (default)
- Blue-green node pool: Create new pool, migrate, delete old

## Revision Notes
```
GKE: managed K8s by Google. Control plane free (Standard) / fully managed (Autopilot)
STANDARD: control nodes, pay per node, full customisation
AUTOPILOT: Google manages nodes, pay per pod, security hardened, limited customisation

VPC-NATIVE: --enable-ip-alias. Pods get real VPC IPs. Required for private clusters.
PRIVATE CLUSTER: control plane private endpoint. Nodes in private subnet.

WORKLOAD IDENTITY: K8s SA annotated with GCP SA → pods get GCP credentials without key files
Similar to AWS IRSA, Azure Workload Identity

NODE POOLS: Standard machine types | Spot for batch (preemptible)
Cluster autoscaler: scales existing pools | Node auto-provisioning: creates new pools

MONITORING: Cloud Logging + Cloud Monitoring + Cloud Trace (integrated)
UPGRADES: Surge (default) | Blue-green node pool
```
