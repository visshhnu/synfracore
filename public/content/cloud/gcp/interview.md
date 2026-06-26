# Gcp Interview Q&A

**Q: When would you choose this platform?**
Choose based on: existing vendor relationships, team expertise, compliance requirements, pricing for your specific workload mix, and regional availability.

**Q: What are the core shared services across clouds?**
Compute (EC2/VM/GCE), Object Storage (S3/Blob/GCS), Managed K8s (EKS/AKS/GKE), IAM (IAM/AAD/IAM), Serverless (Lambda/Functions/Cloud Functions), Database (RDS/Azure SQL/Cloud SQL).

**Q: How do you manage costs in this cloud?**
Use reserved/committed use for baseline workloads (40-60% savings). Spot/preemptible for batch/fault-tolerant. Right-size instances (use monitoring data). Storage tiering. Auto-scaling to match actual demand.

## Quick Reference — Gcp

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

# GCP Interview Q&A

**Q: What is GKE Autopilot vs Standard?**
Standard: you manage nodes (choose machine types, set autoscaling parameters). Autopilot: Google manages nodes — you only define pods. Autopilot bills per pod resource requests (not node capacity). Better resource utilisation, reduced ops overhead. Limitations: some DaemonSets and privileged containers not supported.

**Q: How does Cloud IAM differ from AWS IAM?**
GCP IAM: principals (users, service accounts, groups) + roles (collections of permissions) + policies (bind principals to roles on resources). Resources have hierarchy: Organization > Folder > Project > Resource. Permissions are inherited down the hierarchy. Service accounts are identities for workloads (like AWS IAM Roles).

**Q: What is Workload Identity in GKE?**
Maps Kubernetes Service Accounts to GCP Service Accounts. Pods authenticate to GCP APIs using the KSA identity — no key files needed. GCP issues short-lived tokens automatically. Replaces older approach of mounting service account key JSON files (security risk). Best practice for all GKE workloads accessing GCP services.

**Q: BigQuery vs Cloud SQL vs Bigtable — when to use each?**
Cloud SQL: relational OLTP (MySQL/PostgreSQL) — transactional workloads, web apps, up to a few TB. BigQuery: serverless OLAP — analytics, data warehouse, petabyte scale, SQL on massive datasets. Bigtable: NoSQL wide-column — very high throughput (millions of ops/sec), time-series, IoT, low latency at massive scale.

**Q: What is Cloud Spanner?**
Globally distributed relational database with horizontal scaling and strong consistency (external consistency). Unique: combines ACID transactions with horizontal scale across regions. Used when you need relational semantics + massive global scale. More expensive than Cloud SQL. Used by Google internally and by large-scale banking/fintech applications.

---

*This section is part of the SynfraCore learning platform. Use the sidebar to navigate to Overview, Fundamentals, Advanced, and Cheatsheet sections for comprehensive coverage of this topic.*
