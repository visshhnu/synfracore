# Google Kubernetes Engine (GKE) — Portfolio Projects

Build these projects to demonstrate real skills to employers. Each project is designed to be interview-worthy — something you can walk through in detail.

## Project 1: GKE Standard Cluster with Workload Identity

**Level:** Beginner-Intermediate | **Time:** 2 days

Stand up a real GKE Standard cluster and connect a pod to a Google Cloud service the right way — no service account key files.

### Steps

1. Provision a GKE Standard cluster via Terraform or `gcloud` (not the console, for reproducibility), with node auto-upgrade and auto-repair enabled
2. Deploy an application that needs to read from a Cloud Storage bucket or Firestore
3. Set up Workload Identity so the pod's Kubernetes ServiceAccount maps to a scoped Google Cloud service account — no downloaded JSON key files stored anywhere
4. Confirm the pod's actual effective permissions match exactly what was granted, not more
5. Write a README explaining why Workload Identity is preferred over mounting a service account key as a Kubernetes Secret

### Skills Demonstrated

- Real GKE Standard cluster provisioning via IaC
- Workload Identity for credential-free pod-to-GCP-service authentication
- Understanding what Google manages (control plane) vs. what you manage (node pools, workloads)

### GitHub Repo Name

`gke-standard-workload-identity`

---

## Project 2: REST API on GKE Autopilot

**Level:** Intermediate | **Time:** 3 days

Build a REST API deployed on GKE Autopilot — no node management, billed per Pod resource request rather than per idle VM. (This is a different model from Cloud Run's scale-to-zero serverless — Autopilot pods keep running continuously; it specifically removes node-level operations, not the "always running" cost.)

### Steps

1. Design the API: endpoints, request/response formats
2. Deploy to a GKE Autopilot cluster with resource requests explicitly set on every container — Autopilot bills based on these, so under-declaring them has real cost and performance consequences
3. Add a managed backend (Cloud SQL or Firestore) reached via Workload Identity
4. Configure Horizontal Pod Autoscaler and load test, confirming pod count actually scales with traffic
5. Document the cost model difference you observed versus what a GKE Standard node-pool-based deployment would have cost for the same traffic

### Skills Demonstrated

- Autopilot resource-request sizing and its direct cost implications
- Workload Identity for backend access
- Real cost-model comparison between Autopilot and Standard, backed by actual numbers

### GitHub Repo Name

`gke-autopilot-api`

---

## Project 3: Multi-Zone GKE Platform with Network Policy

**Level:** Advanced | **Time:** 4-5 days

Design a production-shaped GKE platform: real multi-zone resilience, real network segmentation between workloads, real observability.

### Steps

1. Provision a regional (multi-zone) GKE cluster and explain in your README why regional clusters provide stronger availability than zonal ones
2. Implement Kubernetes NetworkPolicy resources to restrict which pods can talk to which — deliberately test that a denied connection actually fails, not just that the policy exists
3. Set up Google Cloud's operations suite (Cloud Logging/Monitoring) integration and confirm a pod crash is actually captured and visible, not lost
4. Deliberately drain a node and confirm workloads reschedule correctly onto remaining capacity across zones
5. Document node pool cost optimization applied (Spot VMs for interruption-tolerant workloads, right-sized machine types) with real numbers

### Skills Demonstrated

- Regional (multi-zone) GKE architecture for genuine high availability
- NetworkPolicy-based segmentation, tested not just configured
- Production-shaped observability and failure-recovery testing

### GitHub Repo Name

`gke-multizone-network-policy`

---

## Tips for Great GKE Projects

**Distinguish Autopilot from Standard clearly.** A strong project explains which mode it uses and why — conflating Autopilot's "no node management" with genuine serverless scale-to-zero is a common, avoidable mistake.

**Use Workload Identity, not service account keys.** Any project connecting a pod to a Google Cloud service should demonstrate Workload Identity specifically — it's one of the most commonly checked GKE security practices in real interviews.

**Test network policy and failure recovery, don't just configure them.** A NetworkPolicy that's never actually been confirmed to block a connection, or a node drain that's never been tested, hasn't really been demonstrated.

## Portfolio Checklist

- [ ] At least one project uses Workload Identity for pod-to-GCP-service authentication, with no stored service account keys
- [ ] At least one project clearly demonstrates the Autopilot vs. Standard cost/operational tradeoff with real numbers
- [ ] At least one project includes a tested NetworkPolicy and a documented node-failure recovery test
- [ ] Each README explains the reasoning, not just the final configuration
- [ ] You can walk through any of these projects for 5+ minutes without notes
