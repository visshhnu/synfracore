# GKE — Intermediate

## Workload Identity Setup

```bash
# GKE Workload Identity: pods authenticate to GCP without service account keys
PROJECT=$(gcloud config get-value project)
CLUSTER=prod-cluster

# 1. Create Kubernetes Service Account
kubectl create serviceaccount app-ksa --namespace production

# 2. Create GCP Service Account
gcloud iam service-accounts create app-gsa --project=$PROJECT

# 3. Bind K8s SA to GCP SA
gcloud iam service-accounts add-iam-policy-binding \
  app-gsa@$PROJECT.iam.gserviceaccount.com \
  --role roles/iam.workloadIdentityUser \
  --member "serviceAccount:$PROJECT.svc.id.goog[production/app-ksa]"

# 4. Annotate K8s SA
kubectl annotate serviceaccount app-ksa \
  --namespace production \
  iam.gke.io/gcp-service-account=app-gsa@$PROJECT.iam.gserviceaccount.com

# 5. Grant GCP permissions to GCP SA
gcloud storage buckets add-iam-policy-binding gs://my-bucket \
  --member "serviceAccount:app-gsa@$PROJECT.iam.gserviceaccount.com" \
  --role roles/storage.objectViewer

# 6. Use in pod spec
# spec:
#   serviceAccountName: app-ksa
# Application auto-gets GCP credentials via metadata server
```

## GKE Autopilot vs Standard

```
Standard cluster:
  - You manage node pools (VM sizes, count, OS)
  - Pay for nodes whether or not pods are running
  - Full control: node taints, machine types, GPU nodes
  - Manual scaling or cluster autoscaler
  - Better for: mixed workloads, special hardware needs

Autopilot cluster:
  - Google manages all nodes
  - Pay per pod resource requests (not idle nodes)
  - Auto-scaling: instant pod scheduling
  - Enforced pod security (no privileged containers)
  - Better for: simplicity, variable workloads, cost efficiency
  
Node auto-provisioning (Standard): dynamically create node pools
Vertical Pod Autoscaler: recommend right-sizing for pod requests
```

## GKE Multi-Cluster (Fleet)

```bash
# Register clusters to a fleet for multi-cluster management
gcloud container fleet memberships register prod-cluster \
  --gke-cluster asia-south1/prod-cluster \
  --enable-workload-identity

# Enable Config Sync (GitOps across clusters)
gcloud container fleet config-management enable
gcloud container fleet config-management apply \
  --membership prod-cluster \
  --config config-management.yaml

# Multi-cluster Gateway for cross-cluster load balancing
gcloud container fleet ingress enable \
  --config-membership prod-cluster
```
