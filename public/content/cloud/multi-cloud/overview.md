# Multi-Cloud Strategy

> **Why, when, and how — patterns, tools, and real trade-offs**

**Category:** Cloud  
**Learning Path:** What → Why → Architecture → Setup → Real Examples → Production → Interview Prep

---

## What is Multi-Cloud Strategy?

Multi-cloud means deliberately using more than one public cloud provider. Good reasons: avoid vendor lock-in for critical infrastructure, use best-of-breed services (GCP BigQuery + Azure AKS), regulatory requirement to keep data in specific regions. Bad reasons: "just in case" without a real use case. Multi-cloud adds significant operational complexity — every tool must work across clouds, team must know multiple platforms, costs increase.

## Why Multi-Cloud Strategy?

The tools that make multi-cloud manageable: Terraform abstracts cloud APIs behind a common HCL language — one team skills set, multiple cloud providers. Kubernetes means the same manifests deploy to AKS, EKS, or GKE with minimal changes. Crossplane extends Kubernetes to provision cloud resources (databases, queues) using K8s-native YAML. Unified observability (Datadog, Prometheus federation) spans clouds.

---

## Learning Modules

### Module 01 — Why Multi-Cloud?
*Reasons, risks and honest trade-offs*

Multi-cloud means deliberately using more than one public cloud provider. Good reasons: avoid vendor lock-in for critical infrastructure, use best-of-breed services (GCP BigQuery + Azure AKS), regulatory requirement to keep data in specific regions. Bad reasons: "just in case" without a real use case. Multi-cloud adds significant operational complexity — every tool must work across clouds, team must know multiple platforms, costs increase.

**Topics covered:**

- Avoid vendor lock-in — 🟢 Beginner
- Best-of-breed services per cloud — 🟡 Intermediate
- Regulatory and data sovereignty — 🟡 Intermediate
- The hidden costs of multi-cloud — 🟡 Intermediate
- When NOT to go multi-cloud — 🟡 Intermediate

```bash
# VALID MULTI-CLOUD REASONS:

# 1. Best-of-breed services
#    Use GCP BigQuery for data analytics (best in class)
#    Use Azure AKS + Entra ID for enterprise K8s (deep AD integration)
#    Use AWS Lambda for serverless (largest ecosystem)

# 2. Regulatory / data sovereignty
#    Customer data MUST stay in India (use Azure India region)
#    EU customer data MUST stay in EU (use AWS EU regions)
#    DR requirement in different provider (bank regulation)

# 3. Acquisition / merger
#    Company A uses AWS, acquires Company B using Azure
#    Short-term: run both, migrate gradually

# 4. Avoid critical single-vendor dependency
#    Kubernetes control plane on AWS, DR on Azure
#    Database primary on Azure, replica on GCP

# HIDDEN COSTS OF MULTI-CLOUD:
#   - Engineers need expertise in 2-3 platforms (expensive)
#   - Data transfer between clouds = egress fees ($$$)
#   - Different APIs, different IAM models, different networking
#   - Double the monitoring, double the security tooling
#   - CI/CD pipelines must deploy to multiple targets

# WHEN NOT TO DO MULTI-CLOUD:
#   - Small team (< 20 engineers)
#   - No clear business requirement
#   - "Just in case" reasoning
#   - If the answer is cloud-agnostic containers anyway
```

### Module 02 — Cloud-Agnostic Tools
*Terraform, Kubernetes, Crossplane*

The tools that make multi-cloud manageable: Terraform abstracts cloud APIs behind a common HCL language — one team skills set, multiple cloud providers. Kubernetes means the same manifests deploy to AKS, EKS, or GKE with minimal changes. Crossplane extends Kubernetes to provision cloud resources (databases, queues) using K8s-native YAML. Unified observability (Datadog, Prometheus federation) spans clouds.

**Topics covered:**

- Terraform — same IaC across AWS/Azure/GCP — 🟡 Intermediate
- Kubernetes — same workload platform everywhere — 🟡 Intermediate
- Crossplane — K8s-native multi-cloud IaC — 🔴 Advanced
- Unified observability across clouds — 🔴 Advanced
- Multi-cloud networking (VPN, peering) — 🔴 Advanced

```bash
# Terraform multi-cloud — one module, multiple providers

# providers.tf
terraform {
  required_providers {
    aws   = { source = "hashicorp/aws",   version = "~> 5.0" }
    azurerm = { source = "hashicorp/azurerm", version = "~> 3.0" }
    google = { source = "hashicorp/google", version = "~> 5.0" }
  }
}

provider "aws" {   region = "us-east-1" }
provider "azurerm" { features {} }
provider "google" { project = "my-project" }

# Same K8s manifest deploys to AKS, EKS, GKE:
apiVersion: apps/v1
kind: Deployment
metadata:
  name: myapp
spec:
  replicas: 3
  # Works on any K8s — cloud-agnostic
  # Only cloud-specific part: StorageClass and LoadBalancer annotations

# Crossplane — provision cloud resources via K8s YAML
apiVersion: database.azure.crossplane.io/v1beta1
kind: PostgreSQLServer
metadata:
  name: prod-db
spec:
  forProvider:
    resourceGroupName: prod-rg
    location: eastus
    sku:
      tier: GeneralPurpose
      capacity: 4
  writeConnectionSecretToRef:
    name: prod-db-conn     # Secret injected into K8s automatically

# Unified monitoring across clouds:
# Datadog agent deployed on each cluster (AKS + EKS)
# Single Datadog workspace shows all clouds
# Or: Prometheus federation — each cluster scrapes locally,
# central Thanos aggregates across all clusters
```

### Module 03 — Multi-Cloud Patterns
*Active/active, primary/DR, data mesh*

Three common multi-cloud patterns: (1) Primary + DR: run everything on AWS, DR on Azure. Lower complexity, higher availability. (2) Active/active: both clouds serve production traffic via global load balancer. Highest availability, highest complexity, stateless only. (3) Data mesh: business domains own their data in the cloud that fits best — payments on Azure, analytics on GCP BigQuery.

**Topics covered:**

- Primary + DR across clouds — 🟡 Intermediate
- Active/active across clouds — 🔴 Advanced
- Data residency — which data lives where — 🔴 Advanced
- Multi-cloud networking — VPN, peering — 🔴 Advanced

```bash
# Pattern 1: Primary AWS + DR Azure
# Primary: All production traffic on AWS (EKS + RDS)
# DR: Warm standby on Azure (AKS + Azure SQL)
# Replication: Database streaming replication cross-cloud via VPN
# Failover: Route53 → Azure Traffic Manager (DNS switch)

# Pattern 2: Active/Active
# AWS us-east-1 + Azure East US both serving 50% traffic
# Global load balancer: AWS Global Accelerator or Cloudflare
# Challenge: stateless only (or distributed cache like Redis)
# Data: Cosmos DB multi-region or CockroachDB multi-cloud

# Pattern 3: Best-of-breed per domain
# Payment processing:     Azure (deep .NET/MSSQL ecosystem)
# Data analytics:         GCP (BigQuery is unmatched)
# AI/ML workloads:        AWS (SageMaker ecosystem)
# Web/API serving:        Any cloud via K8s

# Multi-cloud networking options:

# Option A: VPN tunnels (simplest)
# AWS VPC ←IPSec VPN→ Azure VNet
# Bandwidth: up to 10 Gbps
# Latency: adds ~2-5ms
# Cost: VPN gateway fees both sides

# Option B: Dedicated interconnect
# AWS Direct Connect + Azure ExpressRoute to same co-location
# Bandwidth: 100 Gbps
# Latency: lowest possible
# Cost: $$$$ but required for financial/healthcare

# Option C: Overlay network (Cilium Cluster Mesh)
# Pod-to-pod connectivity across AKS and EKS
# Same K8s NetworkPolicy across both clusters
ciliumclustermesh connect \\
  --context aws-prod \\
  --destination-context azure-prod
```

---

## Production Example

```bash
# Multi-Cloud — Interview Answer Framework

# Q: "How would you design a multi-cloud strategy for our company?"

# FIRST QUESTION BACK: "What is the business driver?"
# If no clear driver → recommend single cloud first
# If clear driver → design for that specific need

# ANSWER for "avoid vendor lock-in" driver:
# "I build on cloud-agnostic abstractions:
#  1. Kubernetes for compute — same manifests on AKS, EKS, GKE
#  2. Terraform for IaC — same team skills, different providers
#  3. PostgreSQL-compatible databases — RDS, Azure SQL, Cloud SQL
#  4. Standard container images — registry mirrors in each cloud
#
#  I do NOT try to abstract storage or serverless —
#  those are too different across clouds to abstract effectively.
#
#  For the first 12 months: master one cloud (Azure).
#  Month 13+: add second cloud for specific DR or regulatory need.
#  Never go multi-cloud just for theoretical flexibility."

# TOOLS SUMMARY:
# IaC:            Terraform (all clouds)
# Containers:     Kubernetes (AKS/EKS/GKE)
# GitOps:         ArgoCD (multi-cluster, multi-cloud)
# Monitoring:     Datadog or Prometheus + Thanos
# Secrets:        HashiCorp Vault (multi-cloud)
# Networking:     Cilium Cluster Mesh or VPN tunnels
# CI/CD:          GitHub Actions or Azure DevOps (cloud-agnostic)
```

---

## Interview Prep

!!! tip "PSR Formula"
    Answer every question: **Problem → Solution → Result**. 45-90 seconds max.

### Common Interview Questions

??? question "What is Multi-Cloud Strategy and why would you use it in production?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How does Multi-Cloud Strategy work internally? Explain the architecture."
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "What are the main components of Multi-Cloud Strategy?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How do you handle failures in Multi-Cloud Strategy?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "What is your production experience with Multi-Cloud Strategy?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How do you monitor and observe Multi-Cloud Strategy in production?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "What are the security considerations for Multi-Cloud Strategy?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How does Multi-Cloud Strategy compare to alternatives?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "Explain Why Multi-Cloud? in Multi-Cloud Strategy."
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "Explain Cloud-Agnostic Tools in Multi-Cloud Strategy."
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

---

## Official Resources

- [CNCF Multi-Cloud Working Group](https://www.cncf.io/)
- [Crossplane Documentation](https://docs.crossplane.io/)
- [Cilium Cluster Mesh](https://docs.cilium.io/en/stable/network/clustermesh/)

---

*Part of [LearnwithVishnu](https://learnwithvishnu.pages.dev) — Basics → Production → Architect*