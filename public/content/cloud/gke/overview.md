# GKE — Google Kubernetes Engine

**Before you start:** working Kubernetes knowledge (Deployments, Services, kubectl — see the DevOps academy's Kubernetes Overview/Fundamentals first if those are new) is assumed throughout this page; GKE does not re-teach Kubernetes itself, only what Google manages around a cluster you already know how to operate. Basic GCP familiarity (projects, IAM) also helps.

## Why this exists (the hook)

Say you already know Kubernetes — you can write a Deployment YAML, you understand Pods and Services. Now you need to actually run a cluster in production: patch the control plane, upgrade etcd, replace a failed master node, wire up networking so nodes can reach the internet. None of that is "your app" — it's undifferentiated plumbing that exists purely so Kubernetes keeps working. GKE's whole pitch is: Google runs and patches the control plane for you (Google invented Kubernetes and open-sourced it in 2014, so this is their own creation they're operating), and — if you choose Autopilot mode — the worker nodes too. You write Pod specs; Google keeps the cluster alive underneath them.

## Analogy

Running your own Kubernetes cluster (self-managed, on bare VMs) is like owning a building and being your own maintenance crew — you fix the elevator, patch the roof, and handle the electrical panel yourself. GKE Standard is like living in a building with a maintenance staff for the shared infrastructure (the control plane) while you still furnish and manage your own unit (the nodes). GKE Autopilot is a serviced apartment — you show up with your furniture (Pods with resource requests) and everything else (nodes, capacity, security patching) is handled for you, priced into what you pay per Pod rather than per apartment.

## How it fits together (diagram)

```
                     ┌─────────────────────────────┐
                     │   GKE Control Plane          │
                     │   (fully managed by Google   │
                     │   in BOTH Standard & Autopilot)│
                     │   api-server, scheduler,      │
                     │   etcd, controller-manager    │
                     └───────────────┬──────────────┘
                                     │ schedules Pods onto
                     ┌───────────────┴──────────────┐
                     │                               │
          ┌──────────▼─────────┐         ┌───────────▼──────────┐
          │  STANDARD mode      │         │  AUTOPILOT mode       │
          │  Nodes = VMs YOU    │         │  Nodes = provisioned  │
          │  create in node     │         │  and sized by Google  │
          │  pools; you pick    │         │  automatically per    │
          │  machine type,      │         │  Pod resource request │
          │  count, GPUs        │         │  (you never see a VM) │
          │  Billing: per node  │         │  Billing: per Pod     │
          │  (idle or not)      │         │  CPU/memory request   │
          └─────────────────────┘         └───────────────────────┘
```

## Annotated example: creating a cluster and running a Pod

```bash
# Autopilot: Google fully manages nodes — you never pick a machine type
gcloud container clusters create-auto my-cluster \
  --region us-central1
# "create-auto" is the Autopilot subcommand (different from plain "create",
# which provisions Standard mode). Regional (not zonal) by default here,
# which replicates the control plane across zones for higher availability.

# Standard: you own node pool sizing
gcloud container clusters create my-cluster \
  --region us-central1 \
  --num-nodes 3 \
  --machine-type n2-standard-4
# --num-nodes is PER ZONE in a regional cluster, so 3 zones x 3 nodes = 9 VMs total.
# This is the single most common Standard-mode sizing mistake for people new
# to GKE, who expect --num-nodes to be the cluster-wide total.

# Point kubectl at whichever cluster you just created
gcloud container clusters get-credentials my-cluster --region us-central1

# Now it behaves like any Kubernetes cluster
kubectl get nodes
kubectl apply -f deployment.yaml
```

The `kubectl` layer is identical between Standard and Autopilot — the same Deployment/Service YAML that works on Standard also works on Autopilot (with the caveat that Autopilot enforces resource requests and blocks a handful of privileged operations for security reasons — see the Advanced tab).

## Workload Identity — the piece nearly every real deployment needs

Application code often needs to call other GCP services (read a Cloud Storage bucket, query BigQuery). The insecure way is baking a downloaded service-account JSON key into the container image. Workload Identity avoids that entirely by letting a Pod's Kubernetes ServiceAccount impersonate a GCP service account through GCP's metadata server — no key file ever touches disk:

```bash
# 1. Annotate the Kubernetes ServiceAccount, pointing it at a GCP service account
kubectl annotate serviceaccount app-sa \
  iam.gke.io/gcp-service-account=app-sa@PROJECT.iam.gserviceaccount.com

# 2. Grant the Kubernetes SA permission to impersonate that GCP SA
gcloud iam service-accounts add-iam-policy-binding \
  app-sa@PROJECT.iam.gserviceaccount.com \
  --role roles/iam.workloadIdentityUser \
  --member "serviceAccount:PROJECT.svc.id.goog[default/app-sa]"
```

## Try it yourself (2 minutes)

You don't need a live cluster to build the mental model. Using the free [GCP pricing calculator](https://cloud.google.com/products/calculator) or just pen and paper: price out a Standard cluster with 3 `n2-standard-4` nodes running 24/7 for a month, versus an Autopilot workload with the equivalent total CPU/memory but running only 8 hours/day (a dev environment that shuts down overnight). Which is cheaper, and why does the answer flip if the workload instead runs at steady, predictable, 24/7 full utilization? *(exact current per-vCPU/GB-hour pricing for both modes needs verification against the live calculator — the point of the exercise is the shape of the tradeoff, not memorizing a number.)*

## GKE Modes at a glance

```
Standard: You manage node pools, full control, pay per node (idle or not)
Autopilot: Google manages nodes, pay per Pod CPU/memory request, recommended default for most new workloads
```

## Node Pools

```bash
# Add a GPU node pool for ML workloads (Standard mode only — Autopilot
# supports GPUs too, but through Pod-level accelerator requests, not
# manually created node pools)
gcloud container node-pools create gpu-pool \
  --cluster my-cluster \
  --machine-type a2-highgpu-1g \
  --accelerator type=nvidia-tesla-a100,count=1 \
  --enable-autoscaling --min-nodes 0 --max-nodes 5
# *(A2 machine types have GPUs baked into the machine type name itself —
# whether the --accelerator flag is still required alongside an A2 machine
# type, or is redundant/auto-inferred, has changed across gcloud versions;
# needs verification against current `gcloud container node-pools create --help`.)*

# Spot VMs — significantly cheaper for fault-tolerant, interruptible workloads
gcloud container node-pools create spot-pool \
  --cluster my-cluster \
  --spot
# *(exact discount percentage vs on-demand needs verification — it floats
# with real-time capacity/demand, not a fixed number)*
```

## GKE vs EKS

GKE: mature managed Kubernetes experience, Autopilot (fully serverless nodes), Anthos for multi-cloud/hybrid management, Workload Identity generally considered simpler to set up than AWS's IRSA equivalent. A reasonable default for GCP-first organisations.

EKS: deeper integration with the rest of the AWS service catalog, wider enterprise adoption inside AWS-centric shops. A reasonable default when AWS is already the primary cloud.
