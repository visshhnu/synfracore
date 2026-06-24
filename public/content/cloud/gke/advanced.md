# GKE Advanced Topics

## Autopilot vs Standard

```
GKE STANDARD:
  You manage: node configuration, node pools, OS, scaling decisions
  Full control over: machine type, disk type, GPU, preemptible, etc.
  Billing: per node (whether pods running or not)
  Good for: GPU workloads, custom node configs, cost-optimised node pools

GKE AUTOPILOT:
  Google manages: nodes, node pools, scaling, security hardening
  You manage: pods only (resources per pod)
  Billing: per pod resource request (CPU/memory) — not per node
  Automatic: node provisioning, security defaults, OS updates
  Good for: most workloads, teams who want less ops overhead
  
  Restrictions in Autopilot:
    No privileged containers
    No hostPath volumes (except some exceptions)
    Resource requests required (not optional)
    Node SSH not available
    Pod disruption budgets enforced differently
```

## Workload Identity

```bash
# Enable Workload Identity on cluster
gcloud container clusters create my-cluster \
  --workload-pool=PROJECT_ID.svc.id.goog

# Or update existing
gcloud container clusters update my-cluster \
  --workload-pool=PROJECT_ID.svc.id.goog

# Update node pool to use Workload Identity
gcloud container node-pools update default-pool \
  --cluster=my-cluster \
  --workload-metadata=GKE_METADATA

# Create IAM service account
gcloud iam service-accounts create ksa-workload \
  --display-name "Workload SA"

# Grant GCS read to the GSA
gcloud projects add-iam-policy-binding PROJECT_ID \
  --member "serviceAccount:ksa-workload@PROJECT_ID.iam.gserviceaccount.com" \
  --role "roles/storage.objectViewer"

# Allow KSA to impersonate GSA
gcloud iam service-accounts add-iam-policy-binding \
  ksa-workload@PROJECT_ID.iam.gserviceaccount.com \
  --role roles/iam.workloadIdentityUser \
  --member "serviceAccount:PROJECT_ID.svc.id.goog[NAMESPACE/KSA_NAME]"

# Annotate Kubernetes ServiceAccount
kubectl annotate serviceaccount KSA_NAME \
  --namespace NAMESPACE \
  iam.gke.io/gcp-service-account=ksa-workload@PROJECT_ID.iam.gserviceaccount.com
```

## Multi-cluster and Fleet Management

```bash
# Register cluster to a fleet
gcloud container fleet memberships register my-cluster \
  --gke-cluster us-central1/my-cluster \
  --enable-workload-identity

# Multi-cluster Services (load balance across clusters)
gcloud container fleet multi-cluster-services enable

# Config Sync (GitOps across clusters)
gcloud container fleet config-management apply \
  --membership=my-cluster \
  --config=config-management.yaml

# Policy Controller (OPA Gatekeeper)
gcloud container fleet policycontroller enable

# Service Mesh (Anthos Service Mesh / Managed Istio)
gcloud container fleet mesh enable
gcloud container fleet mesh update --management automatic --memberships my-cluster
```

## Cluster Security

```bash
# Private cluster (no public node IPs)
gcloud container clusters create private-cluster \
  --enable-private-nodes \
  --enable-private-endpoint \
  --master-ipv4-cidr 172.16.0.16/28 \
  --no-enable-master-authorized-networks

# Binary Authorization (only signed images)
gcloud container binauthz policy export > policy.yaml
# Edit policy.yaml then:
gcloud container binauthz policy import policy.yaml

# Enable Shielded GKE nodes
gcloud container node-pools update default-pool \
  --cluster my-cluster --enable-shielded-nodes

# Network policy (Calico or Dataplane V2 Cilium)
gcloud container clusters create my-cluster \
  --enable-network-policy  # Calico
  # OR
  --enable-dataplane-v2    # Cilium (includes network policy)
```

## Study Resources
- **GCP Professional Cloud Developer** — includes GKE focus areas
- **Google Cloud Skills Boost** (cloudskillsboost.google) — free GKE labs
- **GKE Best Practices** (cloud.google.com/kubernetes-engine/docs/best-practices) — official
- **GKE Autopilot docs** — understand billing model and restrictions before using
