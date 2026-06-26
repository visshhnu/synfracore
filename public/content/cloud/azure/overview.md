# Microsoft Azure

> **Enterprise cloud — AKS, DevOps, and deep Microsoft integration**

**Category:** Cloud  
**Learning Path:** What → Why → Architecture → Setup → Real Examples → Production → Interview Prep

---

## What is Microsoft Azure?

Azure has 4-level hierarchy: Management Groups → Subscriptions → Resource Groups → Resources. ARM is the API for everything. Resource Groups are logical containers — group by lifecycle (create/delete together). Subscriptions are billing boundaries.

## Why Microsoft Azure?

Entra ID is Azure's identity platform. Use Managed Identity instead of service principals with passwords — credentials are managed by Azure. RBAC at subscription level for broad permissions, at resource level for fine-grained control.

---

## Learning Modules

### Module 01 — Azure Fundamentals
*Hierarchy, subscriptions, ARM*

Azure has 4-level hierarchy: Management Groups → Subscriptions → Resource Groups → Resources. ARM is the API for everything. Resource Groups are logical containers — group by lifecycle (create/delete together). Subscriptions are billing boundaries.

**Topics covered:**

- Management Groups → Subscriptions → Resource Groups — 🟢 Beginner
- Azure Resource Manager (ARM) — 🟢 Beginner
- Azure regions and availability zones — 🟢 Beginner

### Module 02 — Entra ID & IAM
*Identity, RBAC, managed identity*

Entra ID is Azure's identity platform. Use Managed Identity instead of service principals with passwords — credentials are managed by Azure. RBAC at subscription level for broad permissions, at resource level for fine-grained control.

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


---

## Interview Prep

!!! tip "PSR Formula"
    Answer every question: **Problem → Solution → Result**. 45-90 seconds max.

### Common Interview Questions

??? question "What is Microsoft Azure and why would you use it in production?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How does Microsoft Azure work internally? Explain the architecture."
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "What are the main components of Microsoft Azure?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How do you handle failures in Microsoft Azure?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "What is your production experience with Microsoft Azure?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How do you monitor and observe Microsoft Azure in production?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "What are the security considerations for Microsoft Azure?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How does Microsoft Azure compare to alternatives?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "Explain Azure Fundamentals in Microsoft Azure."
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "Explain Entra ID & IAM in Microsoft Azure."
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

---

## Official Resources

- [Azure Documentation](https://learn.microsoft.com/en-us/azure/)
- [AKS Documentation](https://learn.microsoft.com/en-us/azure/aks/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

---

*Part of [LearnwithVishnu](https://learnwithvishnu.pages.dev) — Basics → Production → Architect*