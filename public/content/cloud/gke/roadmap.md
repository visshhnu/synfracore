# Google Kubernetes Engine (GKE) — Learning Roadmap

## Estimated Time to Job-Ready
**6-8 weeks** of consistent learning (2-3 hours/day), assuming baseline Kubernetes fluency already — without that baseline, expect closer to 9-11 weeks since you're learning Kubernetes itself and GKE's specific GCP integration simultaneously.

## Phase 1: Foundation (Week 1-2)

- What Google actually manages: the control plane (API server, etcd, scheduler) is fully managed in both GKE modes — Standard and Autopilot — and Google itself created and open-sourced Kubernetes, so this is their own system they're operating
- GKE Standard (you manage node pools) vs. GKE Autopilot (Google manages nodes too, you're billed per-Pod resource request) — a genuinely different operational and billing model, not just a feature toggle
- Creating a cluster and connecting via `kubectl` — the same client tooling as any Kubernetes cluster
- Node pools in Standard mode: machine type selection and why separating system-critical workloads from application workloads across pools is standard practice

**Checkpoint:** can you explain what Google actually operates for you in GKE versus what you're still responsible for in Standard mode specifically — where does "managed" stop?

## Phase 2: Identity and Autopilot Economics (Week 2-4)

- Workload Identity: how a pod's Kubernetes ServiceAccount maps to a Google Cloud service account via federation, with no downloaded service account key files ever stored in the cluster
- Autopilot's resource-request-based billing: since you're billed on what you declare, not what a node happens to have spare, under- or over-declaring Pod resource requests has direct, real cost consequences
- The real distinction between Autopilot ("no node management, but Pods run continuously") and genuine scale-to-zero serverless like Cloud Run — a common point of confusion worth being precise about
- Complete Portfolio Project 1 (Standard cluster with Workload Identity) from this course's Projects section

**Checkpoint:** can you explain why Workload Identity is preferred over mounting a downloaded service account key as a Kubernetes Secret, and what federation mechanism makes keyless authentication possible?

## Phase 3: Networking and Scaling (Week 4-6)

- GKE's networking model: VPC-native clusters where Pods get real, routable IPs within the VPC's address space, and the IP planning implications of that at scale
- NetworkPolicy resources for restricting pod-to-pod traffic — genuinely testing that a denied connection actually fails, not just that a policy object exists
- Horizontal Pod Autoscaler and Cluster Autoscaler (or node auto-provisioning) working together, and regional (multi-zone) vs. zonal clusters as a real availability tradeoff
- Complete Portfolio Project 2 (Autopilot REST API) from this course's Projects section

**Checkpoint:** can you explain, concretely, why a regional GKE cluster provides stronger availability guarantees than a zonal one, and what specifically fails differently between the two if a single zone has an outage?

## Phase 4: Production Operations and Interview Readiness (Week 6-8)

- Google Cloud's operations suite (Cloud Logging/Monitoring) integration, and what's captured automatically versus what needs application-level instrumentation
- Node pool cost optimization: Spot VMs for interruption-tolerant workloads, right-sizing machine types based on actual utilization, and Committed Use Discounts for stable baseline capacity
- GKE release channels (Rapid/Regular/Stable) for managing the tradeoff between getting new Kubernetes features quickly versus prioritizing stability
- Complete Portfolio Project 3 (multi-zone platform with NetworkPolicy) and review this course's Interview Q&A material, particularly the Autopilot-vs-Standard and Workload Identity questions

## Common Pitfalls Specific to GKE

- **Confusing Autopilot's "no node management" with genuine scale-to-zero serverless** — Autopilot Pods run continuously; the billing and operational model differs from Cloud Run in ways worth being precise about
- **Mounting downloaded service account keys instead of using Workload Identity** — this is one of the most commonly flagged GKE security anti-patterns in real interviews and real audits
- **Under-declaring resource requests on Autopilot to save cost** — this directly risks pod performance/eviction, since Autopilot schedules and bills based on what's declared, not actual usage
- **Running a zonal cluster for a workload that genuinely needs multi-zone availability** — a zonal cluster's control plane and often its nodes are concentrated in one zone, a real availability gap regional clusters close

## Getting Your First GKE-Heavy Role

1. **Portfolio:** the 3 projects in this course's Projects section, each demonstrating a different core skill (Workload Identity-based pod authentication, Autopilot cost/resource-request tuning, multi-zone production operations with tested NetworkPolicy)
2. **Resume:** be specific — "migrated pod-to-GCP-service authentication from downloaded service account keys to Workload Identity across 10 services, eliminating stored credentials" is far stronger than "experience with GKE"
3. **Know Kubernetes fundamentals independently of GKE:** interviewers will test general Kubernetes knowledge (pods, deployments, services) alongside GKE-specific GCP integration questions
4. **Certifications, if pursuing one:** GKE is central to Google Cloud's Professional Cloud DevOps Engineer and Associate Cloud Engineer certifications; CKA (vendor-neutral) is also highly relevant — see this course's own Certification Guide for current format and pricing
