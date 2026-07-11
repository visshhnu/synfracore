# Google Cloud Platform — Intermediate

## GKE Standard vs. Autopilot — a real operational tradeoff, not just a pricing choice

**Standard mode**: you configure and manage node pools directly — machine types, autoscaling parameters, and you can SSH into nodes or run privileged DaemonSets. You pay per node, whether or not pods are actually using its full capacity. **Autopilot mode**: Google manages all nodes entirely — no node-level SSH access, no privileged DaemonSets, you define only pod specs and resource requests, and Google provisions nodes to match. You pay per pod's actual CPU/memory, including genuine scale-to-zero when nothing's running.

The real decision isn't just cost — Autopilot's restrictions (no privileged workloads, no custom node-level configuration) are a genuine limitation for some workloads (certain CNI plugins, GPU-specific tuning, node-level debugging tools), not just an inconvenience. Choose Standard when you specifically need node-level access or configuration; choose Autopilot when you don't, since it removes an entire category of operational burden (node patching, capacity planning) by design.

## Workload Identity: the correct way for GKE pods to access GCP services

```bash
# 1. Enable Workload Identity on the cluster
gcloud container clusters update prod-cluster --workload-pool=my-project.svc.id.goog

# 2. Bind a Kubernetes ServiceAccount to a GCP ServiceAccount
gcloud iam service-accounts add-iam-policy-binding \
  myapp-sa@my-project.iam.gserviceaccount.com \
  --role roles/iam.workloadIdentityUser \
  --member "serviceAccount:my-project.svc.id.goog[production/myapp-ksa]"

# 3. Annotate the Kubernetes ServiceAccount
kubectl annotate serviceaccount myapp-ksa -n production \
  iam.gke.io/gcp-service-account=myapp-sa@my-project.iam.gserviceaccount.com
```

Without Workload Identity, granting a pod access to GCP services means embedding a service account **key file** as a Kubernetes Secret — a long-lived credential that, if leaked, has no automatic expiry. Workload Identity federates a Kubernetes ServiceAccount directly to a GCP ServiceAccount's permissions, with no key file ever existing — the pod authenticates via its Kubernetes identity, and GCP verifies that mapping directly. This is the same category of improvement Azure's Managed Identity and AWS's IAM Roles for Service Accounts (IRSA) provide — a pattern worth recognizing across all three major clouds.

## Cloud Run vs. GKE: when serverless containers are the right call

Cloud Run runs a container serverlessly — no cluster to manage, scales to zero, pay per request. The genuine decision point: Cloud Run fits stateless services (APIs, webhooks, event-driven processing) where you want Kubernetes-free simplicity; GKE fits workloads that genuinely need Kubernetes-specific capabilities (StatefulSets, complex networking policies, service mesh, fine-grained scheduling control) that Cloud Run's simpler model doesn't expose. Choosing GKE for a workload that's really just "run this container and scale it" is common, real over-engineering — Cloud Run would do the same job with far less operational surface.

## Traffic splitting on Cloud Run — canary deployments without extra tooling

```bash
gcloud run deploy myapp --image gcr.io/my-project/myapp:v1.3.0 --no-traffic
gcloud run services update-traffic myapp --to-revisions LATEST=10,myapp-00001-abc=90
```
Cloud Run supports revision-level traffic splitting natively — no need for a separate progressive-delivery tool (like Argo Rollouts, which exists specifically to add this capability to Kubernetes) when you're already on Cloud Run, since the capability is built directly into the platform.

## BigQuery: why it's fast at a scale traditional databases aren't

BigQuery is a serverless, columnar data warehouse — you don't provision or manage any compute cluster; queries run against Google's shared infrastructure, and you pay per query (per bytes scanned) rather than per always-on server. Its architecture separates storage from compute entirely, which is what lets it scan petabyte-scale datasets in seconds — a query's cost and speed scale with how much data it actually reads, which is why selecting only needed columns (not `SELECT *`) and using partitioned/clustered tables meaningfully affects both cost and performance in ways that matter far more in BigQuery than in a traditional row-based database.

## Cloud NAT: outbound internet access for private instances, without a public IP

```bash
gcloud compute routers nats create prod-nat --router prod-router --region us-central1 \
  --auto-allocate-nat-external-ips --nat-all-subnet-ip-ranges
```
Instances with no external IP normally can't reach the internet at all — Cloud NAT provides outbound-only internet access (for package downloads, calling external APIs) without giving the instance a public IP an attacker could target directly. This is the standard pattern for private GKE nodes and any instance that needs outbound access but should never accept inbound connections from the public internet.
