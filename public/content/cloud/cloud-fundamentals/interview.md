# Cloud Fundamentals Interview Q&A

**Q: When would you choose public, private, hybrid, or multi-cloud for a given workload?**
Choose based on: regulatory/data-residency constraints (may force private or hybrid), existing infrastructure investment (favors hybrid during a migration), team expertise and vendor relationships (favors a single public cloud for most workloads), and any specific best-of-breed service or resilience requirement that would justify multi-cloud. Default to public-cloud-only unless one of these gives a concrete, named reason otherwise.

**Q: What are the core shared services across clouds?**
Compute (EC2/VM/GCE), Object Storage (S3/Blob/GCS), Managed K8s (EKS/AKS/GKE), IAM (IAM/AAD/IAM), Serverless (Lambda/Functions/Cloud Functions), Database (RDS/Azure SQL/Cloud SQL).

**Q: How do you manage costs regardless of which cloud model or provider you're on?**
Use reserved/committed use for baseline workloads (40-60% savings). Spot/preemptible for batch/fault-tolerant. Right-size instances (use monitoring data). Storage tiering. Auto-scaling to match actual demand. These levers apply the same way on AWS, Azure, or GCP — only the specific product names change.

**Q: What's the actual difference between hybrid cloud and multi-cloud, and why does the distinction matter in an interview answer?**
Hybrid cloud is one public cloud provider connected to your own on-premise infrastructure (e.g., SAP running on-prem, web tier in Azure, linked via a private connection). Multi-cloud is multiple public cloud providers used simultaneously, with no on-premise component required. Conflating them in an interview answer is a common tell that the concepts were memorized as a list rather than understood — the practical difference is that hybrid always involves infrastructure you still physically operate, while multi-cloud is entirely about vendor relationships between providers you don't operate at all.

**Q: A team says "we're going multi-cloud for resilience." What follow-up question exposes whether that's a good decision?**
"What's the specific driver — a named regulatory requirement, a specific best-of-breed service, or avoiding dependence on one vendor for something genuinely critical?" If the honest answer is "just in case" with no named driver, multi-cloud is very likely the wrong call: it adds a certain, ongoing operational cost (two platforms to secure, monitor, and staff for) to hedge against a vague, unquantified risk. Real resilience for most workloads comes from multi-AZ (and, if truly warranted, multi-region) design within a single cloud, which is far cheaper than multi-cloud and solves the actual availability risk most teams are worried about.
