# Google Kubernetes Engine (GKE) — Fundamentals

## Create a GKE Cluster

```bash
# Standard cluster
gcloud container clusters create prod-cluster \
    --zone asia-south1-a \
    --num-nodes 3 \
    --machine-type e2-standard-4 \
    --enable-autoscaling --min-nodes=1 --max-nodes=10 \
    --enable-network-policy \
    --enable-ip-alias \
    --workload-pool=$(gcloud config get-value project).svc.id.goog \
    --addons HorizontalPodAutoscaling,HttpLoadBalancing,GcsFuseCsiDriver

# Autopilot cluster (fully managed nodes — Google handles everything)
gcloud container clusters create-auto prod-autopilot \
    --region asia-south1 \
    --release-channel regular

# Get credentials
gcloud container clusters get-credentials prod-cluster --zone asia-south1-a
```

## Workload Identity (GKE's IRSA equivalent)

```bash
# Let pods use Google service accounts without keys

# 1. Create Kubernetes Service Account
kubectl create serviceaccount my-app-sa --namespace production

# 2. Create GCP Service Account
gcloud iam service-accounts create my-app-gsa \
    --project=$(gcloud config get-value project)

# 3. Bind them
gcloud iam service-accounts add-iam-policy-binding \
    my-app-gsa@PROJECT.iam.gserviceaccount.com \
    --role roles/iam.workloadIdentityUser \
    --member "serviceAccount:PROJECT.svc.id.goog[production/my-app-sa]"

# 4. Annotate Kubernetes SA
kubectl annotate serviceaccount my-app-sa \
    --namespace production \
    iam.gke.io/gcp-service-account=my-app-gsa@PROJECT.iam.gserviceaccount.com

# 5. Grant GCP permissions to GCP SA
gcloud storage buckets add-iam-policy-binding gs://my-bucket \
    --member "serviceAccount:my-app-gsa@PROJECT.iam.gserviceaccount.com" \
    --role roles/storage.objectViewer
```

## GKE-Specific Features

```bash
# Node pools — different machine types for different workloads
gcloud container node-pools create gpu-pool \
    --cluster prod-cluster \
    --zone asia-south1-a \
    --machine-type n1-standard-4 \
    --accelerator type=nvidia-tesla-t4,count=1 \
    --num-nodes 2

# Vertical Pod Autoscaler (right-size CPU/memory automatically)
kubectl apply -f https://github.com/kubernetes/autoscaler/releases/latest/download/vertical-pod-autoscaler.yaml

# Cloud SQL Auth Proxy (secure DB connections without public IP)
# Sidecar container authenticates to Cloud SQL using Workload Identity
# No passwords, no firewall rules needed

# Binary Authorization — only deploy verified images
gcloud container binauthz policy import policy.yaml
# policy.yaml: require attestation from your CI/CD signing key

# Config Connector — manage GCP resources as K8s objects
kubectl apply -f - <<'YAML'
apiVersion: storage.cnrm.cloud.google.com/v1beta1
kind: StorageBucket
metadata:
  name: my-app-assets
spec:
  location: ASIA-SOUTH1
  uniformBucketLevelAccess: true
YAML
```
