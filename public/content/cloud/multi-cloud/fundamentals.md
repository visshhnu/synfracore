# Multi-Cloud — Fundamentals

## The hook: this is the section that actually contradicts marketing slides

Vendor conference slides love "multi-cloud strategy" diagrams with clean arrows between three cloud logos. Real multi-cloud is messier: two different IAM models to keep in sync, egress bills that show up a month after the architecture decision was made, and a team that now needs working knowledge of two consoles instead of one. This section is deliberately concrete about the actual tools and the actual costs, not the slide-deck version.

## Analogy

Multi-cloud tooling is like international business travel gear: a universal power adapter (Terraform) solves the "different plug shape" problem everywhere, and a translation app (Kubernetes as a common workload API) solves the "everyone speaks a different language" problem reasonably well for basic requests — but neither one makes local customs, local law, or local business etiquette (each cloud's actual IAM model, networking primitives, and pricing) suddenly the same everywhere. The adapter and the app reduce friction; they don't erase the fact that you're operating in genuinely different places.

## What is multi-cloud?

Multi-cloud means **using services from more than one public cloud provider simultaneously**, deliberately — for example: AWS for machine learning workloads (SageMaker has one of the deepest ML ecosystems), Azure for Kubernetes and enterprise identity (AKS plus tight Entra ID/Active Directory integration), and GCP for analytics (BigQuery is a frequent standout for large-scale data warehousing). Each cloud is used for what it does best, rather than one provider trying to be everything.

Multi-cloud is different from hybrid cloud. **Hybrid cloud** = one public cloud connected to your own on-premise data center. **Multi-cloud** = multiple public cloud providers (AWS, Azure, GCP) — no on-premise component required.

### Multi-cloud by design vs. by accident

Most organizations that end up multi-cloud got there *by accident* — different teams independently chose different clouds, or an acquisition brought in a company already running on a different provider. Managing this unplanned multi-cloud reality is harder than deliberately designing for it, because there was never a single point where tooling, IAM federation, and observability were chosen consistently. The tools and patterns below apply to both scenarios — whether multi-cloud was a deliberate decision or something the organization now has to make manageable after the fact.

## Why organizations go multi-cloud

| Reason | Explanation | Real example |
|---|---|---|
| Avoid vendor lock-in | No single provider can hold you hostage on pricing or roadmap decisions | Use AWS for compute, Azure for AD integration, with real leverage to renegotiate either |
| Best-of-breed services | Each cloud has genuine strengths no other cloud fully matches | GCP BigQuery for analytics, Azure for enterprise identity, AWS for the broadest managed-service catalog |
| Regulatory compliance | Some jurisdictions require data processing by specific providers or within specific regions | India RBI data-localization rules, EU data-residency requirements |
| Resilience | Major cloud outages happen — both AWS and Azure have had real multi-hour, multi-region-visible incidents | Route traffic to a second provider if the primary has an outage |
| Mergers and acquisitions | An acquired company already uses a different cloud; consolidation can take years | Post-acquisition: one team stays on AWS, another on Azure, until (or unless) consolidated |
| Cost arbitrage | Different providers price certain workload types differently | Spot/preemptible pricing for a specific batch workload happens to be cheaper on one provider |

## Multi-cloud challenges

| Challenge | Impact | Mitigation |
|---|---|---|
| Skills gap | Team needs real expertise in 2-3 clouds — expensive to hire and train for | Invest in cloud-agnostic skills (Kubernetes, Terraform, Prometheus); accept some genuine per-cloud specialization is still needed |
| Data egress costs | Moving data *between* cloud providers incurs real, often underestimated per-GB charges that don't apply to same-provider traffic | Keep compute close to data — process where the data already lives, minimize cross-cloud data movement by design |
| Security complexity | Separate IAM models, separate default network configurations, separate compliance tooling per cloud | A CSPM tool (Cloud Security Posture Management — e.g., Wiz, Prisma Cloud) for one unified misconfiguration view across providers |
| Operational overhead | Two platforms' worth of monitoring, alerting, and on-call runbooks instead of one | Unified observability (Datadog, or Prometheus federation with Thanos) so incident response doesn't start with "which cloud's dashboard do I check" |
| Networking complexity | Cross-cloud connectivity needs VPN, dedicated interconnect, or an overlay mesh — none of which is "just add a route" | Avoid cross-cloud data paths where the workload doesn't genuinely require them; only build cross-cloud networking for a named requirement |

## Tools that make multi-cloud manageable

| Tool | Category | What it does |
|---|---|---|
| Terraform | IaC | Manage AWS, Azure, and GCP resources from one codebase — one provider block per cloud, same overall workflow |
| Kubernetes | Compute | Same manifests, Helm charts, and ArgoCD Applications run on any cloud's managed K8s (EKS, AKS, GKE) with minor provider-specific differences |
| Datadog / Prometheus + Thanos | Observability | One unified view of metrics and alerts across every cloud in use, instead of separate dashboards per provider |
| Vault (HashiCorp) | Secrets | One secrets store, accessed the same way regardless of which cloud a workload runs in |
| Packer | Machine images | Builds a machine image for AMI (AWS), VHD (Azure), and a GCE image (GCP) from one shared template |
| Pulumi | IaC | A Terraform alternative that uses a real programming language (Python, TypeScript, Go) instead of HCL |

## Terraform multi-cloud in practice

```hcl
# providers.tf — configure multiple clouds in one codebase
terraform {
  required_providers {
    aws     = { source = "hashicorp/aws",     version = "~> 5.0" }
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

# Primary workload on AWS, warm DR standby on Azure —
# each resource block targets its own provider explicitly.
resource "aws_instance" "primary" {
  ami           = var.primary_ami
  instance_type = "t3.medium"
  tags          = { Role = "primary" }
}

resource "azurerm_linux_virtual_machine" "dr" {
  name                = "dr-standby-vm"
  resource_group_name = azurerm_resource_group.dr.name
  location            = "eastus"
  size                = "Standard_B2s"
  tags                = { Role = "dr-standby" }
}
```

One Terraform codebase, two provider blocks, and each resource declares which cloud it belongs to explicitly — this is what "Terraform abstracts the API, not the platform" means in practice: the *workflow* (`plan`/`apply`, state management, modules) is shared, but each resource type is still fully cloud-specific underneath.

## Multi-cluster Kubernetes in practice

A common way to run the same Kubernetes-based application across AKS and EKS simultaneously combines three pieces:

- **ArgoCD ApplicationSet** — generates one ArgoCD Application per target cluster from a single template, so a change to the manifest source deploys to every registered cluster (AKS, EKS) instead of maintaining separate pipelines per cloud.
- **Cluster API (CAPI)** — a Kubernetes-native way to declare and manage the *clusters themselves* (not just workloads on them) as Kubernetes objects, across providers, using provider-specific CAPI implementations (CAPA for AWS, CAPZ for Azure).
- **Submariner** — establishes pod-to-pod and service-to-service network connectivity *between* separate Kubernetes clusters running in different clouds, so a service in the AKS cluster can call a service in the EKS cluster directly, without routing through the public internet.

```yaml
# ArgoCD ApplicationSet — deploy the same app to every registered cluster
apiVersion: argoproj.io/v1alpha1
kind: ApplicationSet
metadata:
  name: myapp-multi-cluster
spec:
  generators:
    - clusters: {}   # targets every cluster ArgoCD knows about (AKS + EKS)
  template:
    metadata:
      name: '{{name}}-myapp'
    spec:
      source:
        repoURL: https://github.com/org/myapp-manifests
        targetRevision: main
        path: k8s/overlays/{{name}}
      destination:
        server: '{{server}}'
        namespace: myapp
```

## Common multi-cloud architecture patterns

| Pattern | How it works | When to use |
|---|---|---|
| Primary + DR | All production traffic on one cloud; warm/cold standby on a second cloud purely for disaster recovery | Lower complexity, still meaningfully improves availability against a whole-provider failure |
| Active-active | Full deployment on two clouds, a global load balancer (or DNS-based routing) distributes live traffic between them | Requires near-zero downtime tolerance and the budget for genuinely running two full production deployments |
| Best-of-breed | Each cloud used for what it does best, integrated via APIs — e.g., GCP BigQuery + Azure Entra ID + AWS EKS in the same overall platform | The most common deliberate multi-cloud pattern in practice |
| Cloud bursting | Primary workload on one cloud, burst additional capacity to a second cloud only during demand peaks | Seasonal or highly variable load, where the second cloud is idle most of the time |
| Shadow IT consolidation | Different business units independently chose different clouds; a governance effort unifies policy without necessarily unifying infrastructure | Post-merger, or a large enterprise discovering it's already accidentally multi-cloud |

## Multi-cloud networking options

| Option | What it is | Cost |
|---|---|---|
| Cloud VPN (IPSec tunnels) | Encrypted tunnels between clouds over the public internet | Low — pay for the gateway plus data transfer; simplest to stand up |
| SD-WAN | Software-defined WAN connecting all clouds and any on-premise sites through one managed overlay | Medium — ongoing managed-service cost |
| Direct interconnect (AWS Direct Connect + Azure ExpressRoute at a shared co-location) | A dedicated physical link between providers, bypassing the public internet entirely | High — dedicated bandwidth pricing, but lowest latency and often required for regulated workloads |
| Third-party cloud networking fabric (Aviatrix, Megaport) | A vendor-managed overlay that handles multi-cloud connectivity as a service | Medium — subscription-based |

## Multi-cloud adds real operational complexity — know the tradeoffs before choosing it

Every one of the tools and patterns above reduces multi-cloud's cost; none of them makes it free. The recurring, real costs to weigh before committing to a multi-cloud architecture:

- **Skills gap** — a team needs genuine expertise across 2-3 clouds, which is expensive to hire and slow to train internally. Investing in cloud-agnostic skills (Kubernetes, Terraform, Prometheus) reduces this but doesn't eliminate it — some amount of per-cloud specialization is unavoidable.
- **Data egress costs** — moving data between providers is priced per GB and is easy to underestimate during initial architecture planning; it only becomes visible once real production traffic volume hits the first full monthly bill. Keeping compute close to data, and processing data where it already lives, is the practical mitigation.
- **Security complexity** — separate IAM per cloud means more total attack surface and a harder audit story. A CSPM tool (Prisma Cloud, Wiz, or similar) gives a single pane of glass across providers instead of checking each cloud's native security tooling separately.
- **Operational overhead** — roughly double the monitoring, alerting, and on-call runbooks unless observability is deliberately unified (Datadog, or Prometheus federation) from the start.
- **Networking complexity** — cross-cloud connectivity requires an explicit choice from the networking options table above; "it'll just route" is never actually true across provider boundaries.

## How it fits together (diagram)

```
   Deliberate multi-cloud (has a named driver)     Accidental multi-cloud (no driver)
   ─────────────────────────────────────────       ───────────────────────────────────
   Best-of-breed / regulatory / M&A / lock-in       Different teams picked differently,
   avoidance — chosen up front                      or inherited via acquisition

              │                                                │
              ▼                                                ▼
   ┌──────────────────────────────────────────────────────────────────┐
   │        Cloud-agnostic tooling layer (reduces, doesn't erase,      │
   │        the real cost below)                                      │
   │  Terraform/Pulumi (IaC)  │  Kubernetes (workload API)  │ Vault    │
   │  Datadog/Prometheus (observability)  │  CSPM (security posture)  │
   └──────────────────────────────────────────────────────────────────┘
              │                                                │
              ▼                                                ▼
   ┌─────────────────┐                              ┌─────────────────┐
   │   Cloud A (AWS)  │◄──── VPN / Interconnect ────►│  Cloud B (Azure) │
   └─────────────────┘                              └─────────────────┘

Real, ongoing costs that never fully go away regardless of tooling:
skills gap · data egress fees · security/IAM inconsistency · 2x ops overhead
```

## Try it yourself (2 minutes)

Take the "Why organizations go multi-cloud" table above and, for each reason, write one sentence describing what evidence would actually prove that reason applies to a real organization (not just "resilience" as an abstract word, but a specific, named regulatory citation, a specific service capability gap, or a specific dollar figure for vendor-lock-in risk). If you can't write a concrete sentence for a given reason, that's a sign the reason is being used as a justification rather than an actual driver — the same test a real multi-cloud proposal should be put through before it's approved.
