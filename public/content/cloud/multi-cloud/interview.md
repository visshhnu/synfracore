# Multi-Cloud Interview Q&A

**Q: When would you choose this platform?**
Choose based on: existing vendor relationships, team expertise, compliance requirements, pricing for your specific workload mix, and regional availability.

**Q: What are the core shared services across clouds?**
Compute (EC2/VM/GCE), Object Storage (S3/Blob/GCS), Managed K8s (EKS/AKS/GKE), IAM (IAM/AAD/IAM), Serverless (Lambda/Functions/Cloud Functions), Database (RDS/Azure SQL/Cloud SQL).

**Q: How do you manage costs in this cloud?**
Use reserved/committed use for baseline workloads (40-60% savings). Spot/preemptible for batch/fault-tolerant. Right-size instances (use monitoring data). Storage tiering. Auto-scaling to match actual demand.

**Q: What are the main drivers for multi-cloud adoption?**
Avoid vendor lock-in, regulatory requirements (data sovereignty across regions), best-of-breed services (AWS ML + GCP BigQuery), M&A (acquiring companies with different clouds), disaster recovery across providers, negotiating leverage. Reality: most multi-cloud is accidental (from M&A) rather than planned.

**Q: What are the main challenges of multi-cloud?**
Complexity: different APIs, tooling, IAM models, networking primitives. Skills: team needs expertise in multiple platforms. Cost: harder to optimize reservations/committed use across providers. Networking: cross-cloud traffic incurs egress costs and latency. Security: inconsistent policy enforcement across providers.

**Q: How does Terraform enable multi-cloud?**
Single HCL codebase with multiple provider blocks. Different state backends per cloud. Module abstraction: common interfaces with cloud-specific implementations. Terraform Cloud/Enterprise manages workspaces per cloud. Limitation: abstractions are leaky — still need to understand each cloud's primitives.

**Q: What is a cloud-agnostic architecture?**
Design that avoids provider-specific services (prefer open standards): Kubernetes over managed container services, PostgreSQL over Aurora/Cloud SQL, Kafka over managed messaging, S3-compatible storage API. Trade-off: lose provider-specific features and managed service benefits. Only worth it if actual portability is required.

**Q: How do you handle identity across multiple clouds?**
Federate identity: use a central IdP (Okta, Azure AD/Entra, Google Workspace) and federate to each cloud via OIDC/SAML. AWS: identity federation with AssumeRoleWithWebIdentity. Azure: external identity federation via Entra ID. GCP: Workload Identity Federation. Avoids managing separate IAM users per cloud.
