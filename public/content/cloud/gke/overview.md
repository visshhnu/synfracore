# GKE — Google Kubernetes Engine

GKE is Google's managed Kubernetes service. Google invented Kubernetes, and GKE is the most mature managed offering.

## GKE Modes

```
Standard: You manage node pools, full control, pay per node
Autopilot: Google manages nodes, pay per Pod CPU/memory, recommended
```

```bash
# Create Autopilot cluster (recommended)
gcloud container clusters create-auto my-cluster \
  --region us-central1

# Create standard cluster
gcloud container clusters create my-cluster \
  --region us-central1 \
  --num-nodes 3 \
  --machine-type n2-standard-4
```

## Workload Identity

The correct way to give Pods access to GCP services — no service account keys in code.

```bash
# 1. Annotate K8s Service Account with GCP SA
kubectl annotate serviceaccount app-sa \
  iam.gke.io/gcp-service-account=app-sa@PROJECT.iam.gserviceaccount.com

# 2. Allow K8s SA to impersonate GCP SA  
gcloud iam service-accounts add-iam-policy-binding \
  app-sa@PROJECT.iam.gserviceaccount.com \
  --role roles/iam.workloadIdentityUser \
  --member "serviceAccount:PROJECT.svc.id.goog[default/app-sa]"
```

## Node Pools

```bash
# Add GPU node pool for ML workloads
gcloud container node-pools create gpu-pool \
  --cluster my-cluster \
  --machine-type a2-highgpu-1g \
  --accelerator type=nvidia-tesla-a100,count=1 \
  --enable-autoscaling --min-nodes 0 --max-nodes 5

# Spot VMs — 70-80% cheaper for fault-tolerant workloads
gcloud container node-pools create spot-pool \
  --cluster my-cluster \
  --spot
```

## GKE vs EKS

GKE: Best managed Kubernetes experience, Autopilot, Anthos multi-cloud, Workload Identity simpler than IRSA. Choose for GCP-first organisations.

EKS: Better AWS service integration, wider enterprise adoption in AWS shops. Choose when AWS is your primary cloud.
