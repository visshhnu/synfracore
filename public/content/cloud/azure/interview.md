# Azure Interview Q&A

**Q: When would you choose this platform?**
Choose based on: existing vendor relationships, team expertise, compliance requirements, pricing for your specific workload mix, and regional availability.

**Q: What are the core shared services across clouds?**
Compute (EC2/VM/GCE), Object Storage (S3/Blob/GCS), Managed K8s (EKS/AKS/GKE), IAM (IAM/AAD/IAM), Serverless (Lambda/Functions/Cloud Functions), Database (RDS/Azure SQL/Cloud SQL).

**Q: How do you manage costs in this cloud?**
Use reserved/committed use for baseline workloads (40-60% savings). Spot/preemptible for batch/fault-tolerant. Right-size instances (use monitoring data). Storage tiering. Auto-scaling to match actual demand.

## Quick Reference — Azure

### Key Points for Revision

- Review the overview section for core architecture and fundamentals
- Practice commands/configurations from the cheatsheet section
- Use interview Q&A for active recall before exams or interviews
- Cross-reference with related tools in the cloud academy

### Related Topics

Explore these connected topics to build complete understanding:
- Overview and Architecture
- Fundamentals and Core Concepts
- Advanced Patterns and Production Usage
- Interview Preparation Q&A
- Quick Reference Cheatsheet

### Practice Approach

1. Read the overview to understand *what* and *why*
2. Work through fundamentals for *how*
3. Attempt hands-on labs or configurations
4. Test yourself with interview questions
5. Keep cheatsheet accessible for quick reference during work

### Further Learning

Connect this topic to the broader cloud ecosystem. 
Each tool in this academy is designed to work with others —
understanding the integration points is what separates intermediate from senior practitioners.

# Azure Interview Q&A

**Q: What is the Azure Resource Manager (ARM)?**
Azure's deployment and management service. All Azure resources are deployed through ARM. ARM templates (JSON) or Bicep (DSL) define infrastructure as code. ARM provides: RBAC, tagging, resource groups, deployment history, what-if (like terraform plan). REST API is the foundation; Portal/CLI/SDK all call ARM.

**Q: Explain Azure AD (now Entra ID) vs Azure RBAC.**
Entra ID: identity provider — manages users, groups, service principals, managed identities, OAuth/OIDC tokens. Azure RBAC: authorization — controls who can do what to Azure resources (Reader, Contributor, Owner). They work together: Entra ID authenticates, RBAC authorizes. Similar to AWS IAM (users + policies combined in one service).

**Q: What is a Managed Identity and why use it?**
System-assigned or user-assigned identity for Azure resources (VMs, App Services, Functions). Eliminates need to store credentials in code or config. Azure automatically manages credential rotation. Service authenticates to other Azure services (Key Vault, Storage, SQL) using the managed identity token. Best practice for app authentication in Azure.

**Q: AKS vs ACI vs App Service — when to use each?**
AKS: full Kubernetes — complex microservices, stateful apps, need fine-grained control. ACI: serverless containers — short-lived tasks, burstable workloads, no cluster management overhead. App Service: PaaS for web apps — simple web apps and APIs, built-in scaling, no container expertise needed. AKS Virtual Nodes use ACI for burst capacity.

**Q: How does Azure Policy differ from Azure RBAC?**
RBAC: controls who can perform actions (create VM, read storage). Policy: controls what configuration is allowed (VMs must be in specific regions, tags required, SKUs allowed). Policy evaluates resource properties at deployment and audit time. Combined: RBAC prevents unauthorised actions; Policy prevents non-compliant configurations.

---

*This section is part of the SynfraCore learning platform. Use the sidebar to navigate to Overview, Fundamentals, Advanced, and Cheatsheet sections for comprehensive coverage of this topic.*
