# Microsoft Azure

> **Enterprise cloud — AKS, DevOps, and deep Microsoft integration**

**Category:** Cloud  
**Learning Path:** What → Why → Learning Modules → Production Example → Interview Prep

**Before you start:** no prior cloud platform experience is required — this is the entry point for the Azure track. Basic familiarity with the command line helps for the CLI examples below, but isn't required to follow the concepts.

---

## What is Microsoft Azure?

Azure has 4-level hierarchy: Management Groups → Subscriptions → Resource Groups → Resources. ARM is the API for everything. Resource Groups are logical containers — group by lifecycle (create/delete together). Subscriptions are billing boundaries.

## Why Microsoft Azure?

Entra ID is Azure's identity platform. Use Managed Identity instead of service principals with passwords — credentials are managed by Azure. RBAC at subscription level for broad permissions, at resource level for fine-grained control.

## Why this exists (the hook)

If you've ever set up a new laptop for a new hire — creating a login, deciding what folders they can open, tracking which laptop belongs to which department for the finance report — you've already done, at tiny scale, what Azure's Resource Manager hierarchy and Entra ID do for an entire company's cloud footprint. The difference is scale and stakes: instead of one laptop, it's potentially thousands of VMs, databases, and storage accounts, and instead of a locked filing cabinet, "who can touch what" is enforced by a policy engine that has to get it right every single time, automatically, for every request.

## Analogy

Think of the Management Group → Subscription → Resource Group → Resource hierarchy like a company's real-world structure: **Management Groups** are the whole corporation setting company-wide policy; **Subscriptions** are individual departments, each with their own budget (billing boundary); **Resource Groups** are project folders within a department — everything for "Project Phoenix" lives in one folder so it can be archived (deleted) together when the project ends; and **Resources** are the individual documents and tools inside that folder. Entra ID, layered across all of it, is the company's ID badge system — one badge (identity) that different doors (RBAC role assignments) trust to different degrees depending on where you're trying to go.

## How it fits together (diagram)

```
Management Group  (company-wide policy/RBAC)
      │
      ▼
Subscription       (billing + quota boundary)
      │
      ▼
Resource Group     (lifecycle container: created/deleted together)
      │
      ▼
Resource           (VM, storage account, database, VNet, ...)

Every one of the above is created/read/updated/deleted through
Azure Resource Manager (ARM) — the single control-plane API that
the Portal, CLI, Terraform, and Bicep all call underneath.

Entra ID (identity) + Azure RBAC (authorization) sit alongside
this hierarchy, not inside it — a role assignment can be scoped
at any of the four levels above.
```

## Try it yourself (2 minutes)

If you have (or can create) a free Azure account, run these two commands and read the output before moving on: `az account show` (confirms which subscription your CLI session is scoped to) and `az group list --output table` (lists every Resource Group in that subscription). Notice that `az group list` returns nothing meaningful about individual VMs or databases — it only shows the *containers*. That's the hierarchy in practice: you almost always work one level at a time, scoping down from subscription to resource group before you ever touch an individual resource.

---

## Learning Modules

### Module 01 — Azure Fundamentals
*Hierarchy, subscriptions, ARM*

Covered above: the Management Group → Subscription → Resource Group → Resource hierarchy and ARM as the single control-plane API underneath every tool. This module covers the practical topics that hierarchy enables, below.

**Topics covered:**

- Management Groups → Subscriptions → Resource Groups — 🟢 Beginner
- Azure Resource Manager (ARM) — 🟢 Beginner
- Azure regions and availability zones — 🟢 Beginner

### Module 02 — Entra ID & IAM
*Identity, RBAC, managed identity*

Covered above: Entra ID as the identity platform, and Managed Identity over service-principal passwords as the default for workload authentication. This module covers the specific RBAC and identity topics below on top of that foundation.

**Topics covered:**

- Entra ID (formerly Azure AD) — 🟢 Beginner
- RBAC roles (Owner, Contributor, Reader) — 🟡 Intermediate
- Managed Identity (system/user-assigned) — 🟡 Intermediate
- Conditional Access — 🔴 Advanced

### Module 03 — AKS
*Managed Kubernetes on Azure*

AKS is managed Kubernetes with deep Azure integration. System node pool runs cluster components. User node pools for workloads. Azure CNI gives pods real VNet IPs (better for enterprise networking). Always use Managed Identity, never service principal passwords.

**Topics covered:**

- AKS node pools (system vs user) — 🟡 Intermediate
- Azure CNI vs Kubenet — 🟡 Intermediate
- Managed Identity integration — 🟡 Intermediate
- ACR integration — 🟢 Beginner
- Azure Monitor / Container Insights — 🟡 Intermediate
- AKS upgrade strategy — 🔴 Advanced

### Module 04 — Networking
*VNet, NSG, App Gateway, ExpressRoute*

VNet is your private network. NSGs filter traffic at subnet/NIC level (stateful). App Gateway is L7 load balancer with WAF. ExpressRoute is dedicated private connection to Azure (not over internet). Private Endpoints connect to PaaS services (Storage, SQL) over private IPs.

**Topics covered:**

- Virtual Network and subnets — 🟢 Beginner
- Network Security Groups (NSGs) — 🟡 Intermediate
- Application Gateway (WAF) — 🟡 Intermediate
- ExpressRoute for on-prem — 🔴 Advanced
- Private Endpoints — 🔴 Advanced

### Module 05 — Azure Monitor & Logging
*Monitor, Log Analytics, Alerts*

Azure Monitor is the observability platform. Log Analytics uses KQL (Kusto Query Language) — similar to SQL but for logs. Application Insights for APM and distributed tracing. KQL is a must-know for Azure operations.

**Topics covered:**

- Azure Monitor metrics and logs — 🟡 Intermediate
- Log Analytics Workspace (KQL) — 🟡 Intermediate
- Application Insights — 🟡 Intermediate
- Alert rules and action groups — 🟡 Intermediate

---

## Production Example

A typical production Azure landing zone for an application team looks like this: a dedicated Resource Group per environment (`myapp-prod-rg`, `myapp-staging-rg`) so lifecycle and cost roll up cleanly; an AKS cluster with Azure CNI (for direct pod-to-VNet routing) split into a system node pool (cluster components only) and one or more user node pools (application workloads), authenticating to Azure Container Registry and Key Vault via Managed Identity rather than any stored credential; a VNet with separate subnets for AKS nodes, internal services, and data stores, fronted by Application Gateway for L7 routing and WAF protection; and Azure Monitor with a Log Analytics Workspace collecting logs/metrics from every layer, queried with KQL during incidents. RBAC role assignments are scoped per Resource Group, not the subscription, and every resource carries `Environment`/`Team`/`CostCenter` tags from creation — not retrofitted after the fact.

---

## Interview Prep

**PSR Formula:** Answer every question: **Problem → Solution → Result**. 45-90 seconds max.

### Common Interview Questions

**Q1. What is Microsoft Azure and why would you use it in production?**

**A:** **Problem:** Building and running your own data centers means capital spent years ahead of actual demand, staff to rack/patch/replace hardware, and capacity that's almost always wrong for current traffic. **Solution:** Azure rents compute, storage, networking, and managed services on demand, billed per-second/per-resource, deployed across a global footprint of regions and Availability Zones Microsoft already built and operates. **Result:** teams provision infrastructure in minutes instead of months and scale to match real demand instead of a forecast — in exchange for a new discipline requirement (cost governance, RBAC hygiene, resource tagging) that a fixed on-prem estate never forced on you.

---

**Q2. How does Microsoft Azure work internally? Explain the architecture.**

**A:** **Problem:** Every Azure resource — a VM, a storage account, a database — has to live somewhere in a structure that supports both billing and access control, or an organization with hundreds of resources becomes unmanageable. **Solution:** Azure enforces a strict four-level hierarchy: **Management Groups** (org-wide policy/RBAC across many subscriptions) contain **Subscriptions** (the billing and quota boundary) which contain **Resource Groups** (logical containers you define, conventionally grouped by lifecycle — things created and deleted together) which contain individual **Resources**. Every one of these is ultimately created, read, updated, and deleted through a single control-plane API — Azure Resource Manager (ARM) — regardless of whether the request came from the Portal, the CLI, Terraform, or Bicep. **Result:** because every tool goes through the same ARM API, there's exactly one source of truth for what a resource's state actually is, and the same RBAC/policy/tagging rules apply no matter which tool made the change.

---

**Q3. What are the main components of Microsoft Azure?**

**A:** **Problem:** With hundreds of Azure services, a beginner needs to know which handful actually matter to become productive. **Solution:** group them by job: **Identity** (Entra ID, the platform every human and workload identity resolves through, plus Azure RBAC for authorization) underlies everything else; **Compute** (Virtual Machines, AKS for managed Kubernetes, App Service/Functions for PaaS and serverless) runs your workloads; **Storage** (Blob Storage for objects, managed disks for VM-attached block storage) persists data; **Networking** (VNets, Network Security Groups, Application Gateway, ExpressRoute) connects and isolates resources; and **Azure Monitor** (metrics, Log Analytics with KQL, Application Insights) gives you visibility into all of it. **Result:** nearly every real Azure architecture is some combination of these five categories, and learning identity first is what makes the rest of the platform's access model make sense.

---

**Q4. How do you handle failures in Microsoft Azure?**

**A:** **Problem:** Hardware, racks, and even entire data centers fail — Azure is built assuming this will happen, and expects the workloads running on it to be designed for it too. **Solution:** the practical pattern is redundancy plus automated recovery: deploy VMs across multiple Availability Zones (physically separate, independently powered data centers within a region) behind a load balancer or a VM Scale Set so a failed instance is replaced and traffic rerouted automatically; prefer managed services with built-in zone/region redundancy options over hand-rolled replication; and define an explicit RTO (how long can it be down) and RPO (how much data loss is tolerable) so the disaster-recovery approach actually matches the business requirement instead of being picked arbitrarily. **Result:** a well-architected Azure workload degrades gracefully — fewer healthy instances, but still serving traffic — instead of going fully down when a single zone or VM fails.

---

**Q5. What is your production experience with Microsoft Azure?**

**A:** **Problem:** This question is really asking whether you've operated Azure under real constraints — cost, incidents, scale — not just clicked through the Portal in a tutorial. **Solution (framework to answer with your own specifics):** describe a real workload you ran (what services, what scale), a real problem you hit (an over-scoped role assignment that granted more access than intended, an AKS node pool that was under-provisioned during a traffic spike, a cost spike from an idle resource nobody tagged for cleanup), and the concrete change you made in response. **Result:** name the measurable outcome — reduced cost, improved uptime, faster incident response — because "I used VMs and AKS" without a decision or an incident behind it doesn't demonstrate production judgment. Adapt this with your own actual experience; a fabricated example is worse than admitting you're still building it.

---

**Q6. How do you monitor and observe Microsoft Azure in production?**

**A:** **Problem:** Without visibility, failures and cost overruns are discovered by users or by the monthly invoice, not by you. **Solution:** Azure Monitor is the baseline — metrics (VM/AKS resource utilization, custom application metrics), Logs via a Log Analytics Workspace queried with KQL (Kusto Query Language, similar in spirit to SQL but pipe-based), and Alert rules/action groups that notify or auto-remediate on a threshold. Application Insights layers distributed tracing and APM on top for actually seeing where time is spent across a request's path through your services. **Result:** the combination — metrics for "is it healthy," KQL log queries for "what happened," Application Insights for "where exactly is the time going," alerts for "tell me before a user does" — is what turns an Azure subscription from something you hope is working into something you know is working.

---

**Q7. What are the security considerations for Microsoft Azure?**

**A:** **Problem:** Azure's Shared Responsibility Model means Microsoft secures the underlying physical infrastructure and the platform itself, but everything configured on top — RBAC role assignments, network security group rules, storage account access settings, managed identity usage — is entirely the customer's responsibility, and misconfiguration there is the most common real-world cause of cloud security incidents. **Solution:** the concrete baseline is: use Managed Identity instead of service principals with stored passwords wherever a resource needs to call another Azure service, since there's no secret for your code to hold or leak; scope RBAC role assignments as narrowly as the task allows rather than defaulting to subscription-wide Owner/Contributor; restrict storage account and database access with firewall rules or Private Endpoints instead of leaving public endpoints open; and enable Conditional Access in Entra ID (MFA on unfamiliar sign-in context, blocking risky locations) as a layer above basic RBAC. **Result:** most real Azure security incidents trace back to one of these being skipped — an over-scoped role assignment, a publicly exposed storage account, or a long-lived credential — not a flaw in Azure's own infrastructure.

---

**Q8. How does Microsoft Azure compare to alternatives?**

**A:** **Problem:** AWS, Azure, and GCP overlap heavily in raw capability, so the choice is rarely about one platform being able to do something the others fundamentally can't. **Solution:** Azure tends to win in organizations already standardized on Microsoft (on-prem Active Directory, .NET, Microsoft 365) because of how tightly Entra ID and hybrid identity integrate with that existing investment; AWS has the largest service catalog and market share and is often the default for teams without an existing platform commitment; GCP is frequently preferred for data/analytics-heavy and ML workloads and by teams that value its Kubernetes lineage. The core primitives map closely across all three — Azure VMs/EC2/GCE, Blob Storage/S3/GCS, Entra ID/IAM/Cloud IAM, AKS/EKS/GKE — so skills largely transfer between them. **Result:** the real decision drivers in practice are existing vendor relationships, team expertise, compliance/data-residency requirements, and workload-specific pricing, not one cloud being objectively "better" in the abstract.

---

**Q9. Explain Azure Fundamentals in Microsoft Azure.**

**A:** **Problem:** Before touching any individual service, a learner needs the handful of concepts every other Azure topic assumes you already know. **Solution:** the Management Group → Subscription → Resource Group → Resource hierarchy (covered above) determines where policy, billing, and access boundaries actually apply; the Shared Responsibility Model (Microsoft secures the platform, you secure what you configure on it — covered above) determines who owns what; and Azure's consumption-based pricing (pay for what you provision/use, with reserved/committed options available once usage is predictable) determines how billing actually works. **Result:** these three ideas — where things live in the hierarchy, who's responsible for securing what, and how billing works — are the lens every other Azure service should be read through; skipping them is why "just create a VM" tutorials often produce resources that are insecure, hard to find later, or needlessly expensive.

---

**Q10. Explain Entra ID & IAM in Microsoft Azure.**

**A:** **Problem:** Every Azure API call — a human in the Portal, a script using a credential, a VM calling into Blob Storage — has to be authenticated (who is this?) and authorized (are they allowed to do this specific action on this specific resource?), and Entra ID plus Azure RBAC together answer both questions for the entire tenant. **Solution:** Entra ID is the identity layer — it manages users, groups, service principals, and issues the OAuth/OIDC tokens that prove who's making a request. Azure RBAC is the authorization layer sitting on top — role assignments (Owner, Contributor, Reader, or custom roles) scoped at any level of the Management Group/Subscription/Resource Group/Resource hierarchy determine which actions that authenticated identity can actually perform, and where. For workload identity specifically (a VM or app calling another Azure service), **Managed Identity is the correct default over a service principal with a stored password** — Azure manages the underlying credential's creation and rotation automatically, so there's no secret value your code has to hold or that can leak from a config file or repository. **Result:** the highest-leverage habit is "Managed Identity over stored credentials, least-privilege RBAC scope over subscription-wide roles" — a leaked temporary managed-identity token is short-lived and scoped, while a leaked long-term credential stays valid until someone notices and revokes it.

---

## Official Resources

- [Azure Documentation](https://learn.microsoft.com/en-us/azure/)
- [AKS Documentation](https://learn.microsoft.com/en-us/azure/aks/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)