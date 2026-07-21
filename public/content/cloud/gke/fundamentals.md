# Google Kubernetes Engine (GKE) — Fundamentals

## The hook: what "managed" actually buys you

If you've only ever run Kubernetes with `kind` or `minikube` on a laptop, the jump to a real GKE cluster is smaller than it looks — the API objects (Pods, Deployments, Services) don't change. What changes is who is on the hook when the control plane itself breaks: on GKE, that's Google's problem, backed by an SLA, not yours. This section is the practical "stand up a real cluster and let Pods talk to other GCP services safely" walkthrough.

## Analogy

Think of a GKE cluster the way you'd think of a rented commercial kitchen versus a food truck you own outright. The commercial kitchen (GKE control plane) is maintained by someone else — ovens serviced, health inspections passed, electrical up to code — you just show up and cook (deploy Pods). Workload Identity, covered below, is the kitchen's key-card system: your staff (Pods) badge in and get exactly the access they're allowed (a specific GCP service account's permissions) without anyone photocopying a master key (a downloaded service-account JSON file) and leaving copies lying around.

## Diagram: how a Pod gets GCP credentials via Workload Identity

```
 Pod (namespace: production, KSA: my-app-sa)
        │  runs as Kubernetes ServiceAccount "my-app-sa"
        ▼
 GKE metadata server (per-node)
        │  KSA "my-app-sa" is annotated + IAM-bound to GSA
        │  "my-app-gsa@PROJECT.iam.gserviceaccount.com"
        ▼
 Google IAM issues a short-lived token for the GSA's identity
        ▼
 Pod calls e.g. Cloud Storage using that token — no key file anywhere
```

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
# GKE ships VPA as a built-in cluster feature -- enable it on the cluster
# rather than manually installing the open-source project's YAML:
gcloud container clusters update prod-cluster \
    --zone asia-south1-a \
    --enable-vertical-pod-autoscaling
# Then create a VerticalPodAutoscaler object per workload to opt it in.

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

## Try it yourself (2 minutes)

Using the free tier (or just reading along if you don't have a project handy): create an Autopilot cluster with `gcloud container clusters create-auto`, then run `kubectl create serviceaccount test-sa` followed by `kubectl annotate serviceaccount test-sa iam.gke.io/gcp-service-account=fake@example.iam.gserviceaccount.com`. Now run `kubectl describe serviceaccount test-sa` and find the annotation in the output. You've just done step 1 of the Workload Identity binding above — notice that annotating alone does nothing dangerous or billable by itself; the actual permission grant only happens with the separate `add-iam-policy-binding` step. Understanding that these are two independent, composable steps (bind the identities, then grant permissions) is the part people usually get backwards when debugging "why can't my Pod reach GCS" later.
