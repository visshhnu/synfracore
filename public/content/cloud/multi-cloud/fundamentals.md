# Multi-Cloud

Cloud › Multi-Cloud
🌐**Multi-Cloud**
BeginnerEngineerArchitectMulti-cloud strategy, Terraform multi-provider, challenges and patterns
[What is Multi-Cloud](#sec-what)[Tools](#sec-tools)[Challenges](#sec-challenges)[Q&A](#sec-interview)


## 🌐 What is Multi-Cloud?›


#### What is multi-cloud?

Multi-cloud means **using services from more than one public cloud provider simultaneously**. For example: AWS for machine learning workloads (SageMaker has the deepest ML ecosystem), Azure for Kubernetes and enterprise identity (AKS + Active Directory integration), and GCP for analytics (BigQuery is unmatched for large-scale data warehousing). Each cloud used for what it does best.


Multi-cloud is different from hybrid cloud. **Hybrid cloud** = one public cloud connected to your own on-premise data centre. **Multi-cloud** = multiple public cloud providers (AWS, Azure, GCP) — no on-premise required.


#### Why organisations use multi-cloud
| Reason | Explanation | Real example |
|---|---|---|
| Best-of-breed services | Each cloud has unique strengths that no other cloud matches | GCP BigQuery, Azure AD + M365, AWS broadest managed services |
| Avoid vendor lock-in | One cloud controls your pricing. Two clouds gives negotiation leverage. | Renegotiate AWS contract because Azure is a real option |
| Regulatory compliance | Some regions require data processing by specific providers | India RBI regulations, European data residency requirements |
| Resilience | Major cloud outages happen — AWS us-east-1, Azure East US both have had multi-hour incidents | Route traffic to Azure if AWS has an outage |
| Mergers and acquisitions | Acquired company uses a different cloud — consolidation takes years | Post-acquisition: one team on AWS, another on Azure |


#### Multi-cloud by design vs by accident

Most organisations are multi-cloud by *accident* — different teams chose different clouds independently, or acquisitions brought in companies using different providers. Managing this unplanned multi-cloud is harder than designing for it. The tools and patterns below apply to both scenarios.


## 🔷 Terraform Multi-Cloud›


Multi-provider Terraform + Route53 failoverCopy

```

```


## ☸️ Multi-Cluster Kubernetes›


ArgoCD ApplicationSet + Cluster API + SubmarinerCopy

```

```


## 🔧 Tools — Terraform, Kubernetes, Observability›

#### Why organisations go multi-cloud
| Reason | Explanation | Real example |
|---|---|---|
| Avoid vendor lock-in | No single provider can hold you hostage on pricing or features | Use AWS for compute, Azure for AD integration |
| Best-of-breed services | Each cloud has unique strengths | GCP BigQuery for analytics, Azure for enterprise identity, AWS for ML |
| Regulatory compliance | Some countries require specific cloud providers | India: RBI mandates some data on local providers |
| Resilience | One cloud outage does not take down everything | Route traffic to AWS if Azure has an outage |
| Mergers and acquisitions | Acquired company uses different cloud | Post-acquisition: one team on AWS, another on Azure |
| Cost arbitrage | Different pricing for different workloads | Spot instances cheaper on AWS for batch |

#### Multi-cloud challenges
| Challenge | Impact | Mitigation |
|---|---|---|
| Skills gap | Need expertise in 2-3 clouds — expensive | Focus on cloud-agnostic tools (K8s, Terraform) |
| Data egress costs | Moving data between clouds is expensive | Keep compute close to data — process where data lives |
| Security complexity | Separate IAM, policies, tools per cloud | CSPM tools (Prisma Cloud, Wiz) for unified view |
| Operational overhead | 2x the monitoring, alerting, ops runbooks | Unified observability (Datadog, Prometheus federation) |
| Networking complexity | Cross-cloud connectivity needs VPN or SD-WAN | Avoid cross-cloud data paths where possible |


#### Tools that make multi-cloud manageable
| Tool | Category | What it does |
|---|---|---|
| Terraform | IaC | Manage AWS, Azure, GCP with one codebase. Provider per cloud, same workflow. |
| Kubernetes | Compute | Same manifests, Helm charts, ArgoCD on any cloud K8s cluster |
| Datadog / Prometheus | Observability | Unified metrics and alerts across all clouds |
| Vault (HashiCorp) | Secrets | One secrets store accessed from any cloud |
| Packer | Images | Build machine images for AMI (AWS), VHD (Azure), GCE image (GCP) from one template |
| Pulumi | IaC | Like Terraform but uses Python/TypeScript instead of HCL |

#### Terraform multi-cloud example
```
# providers.tf — configure multiple clouds
terraform {
required_providers {
aws   = { source = "hashicorp/aws",     version = "~> 5.0" }
azurerm = { source = "hashicorp/azurerm", version = "~> 3.0" }
google  = { source = "hashicorp/google",  version = "~> 5.0" }
}
}

provider "aws" {
region = "us-east-1"
}
provider "azurerm" {
features {}
subscription_id = var.azure_subscription_id
}
provider "google" {
project = var.gcp_project
region  = "us-central1"
}

# Use AWS for primary, Azure for DR
resource "aws_instance" "primary" { ... }
resource "azurerm_virtual_machine" "dr" { ... }
```


## ⚠️ Challenges and Tradeoffs›

#### Common multi-cloud architecture patterns
| Pattern | How it works | When to use |
|---|---|---|
| Cloud-agnostic apps | Apps containerised with K8s, deploy anywhere, use abstracted storage/DB APIs | Portability is a requirement, no vendor lock-in acceptable |
| Cloud bursting | Primary workload on one cloud, burst to second cloud for peaks | Cost optimisation, seasonal peaks |
| Active-active DR | Full deployment on two clouds, Route 53/Traffic Manager routes between them | Zero downtime requirement, can afford 2x cost |
| Best-of-breed | Each cloud used for what it does best, integrated via APIs | GCP BigQuery + Azure AD + AWS EKS in same platform |
| Shadow IT consolidation | Different business units chose different clouds — consolidate with unified governance | Post-merger, large enterprise with many teams |

#### Multi-cloud networking options
| Option | What it is | Cost |
|---|---|---|
| Cloud VPN | IPSec VPN tunnels between clouds over internet | Low — pay for gateway + data transfer |
| SD-WAN | Software-defined WAN connecting all clouds and on-prem | Medium — managed service cost |
| Direct interconnect | Dedicated physical link between AWS Direct Connect + Azure ExpressRoute | High — dedicated bandwidth |
| Aviatrix / Megaport | Third-party cloud networking fabric | Medium — subscription-based |


#### Multi-cloud adds real operational complexity — know the tradeoffs before choosing it
| Challenge | Impact | How to address |
|---|---|---|
| Skills gap | Team needs expertise across 2-3 clouds — expensive to hire and train | Invest in cloud-agnostic skills (K8s, Terraform, Prometheus). Accept some per-cloud specialisation. |
| Data egress costs | Moving data between clouds costs $0.08-0.09/GB — active-active multi-cloud is expensive | Keep compute close to data. Process where data lives. Avoid cross-cloud data movement. |
| Security complexity | Separate IAM per cloud, more attack surface, harder to audit | CSPM tool (Prisma Cloud, Wiz) for unified security view.
