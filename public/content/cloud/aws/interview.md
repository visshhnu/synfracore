# AWS Interview Q&A

**Q: When would you choose this platform?**
Choose based on: existing vendor relationships, team expertise, compliance requirements, pricing for your specific workload mix, and regional availability.

**Q: What are the core shared services across clouds?**
Compute (EC2/VM/GCE), Object Storage (S3/Blob/GCS), Managed K8s (EKS/AKS/GKE), IAM (IAM/AAD/IAM), Serverless (Lambda/Functions/Cloud Functions), Database (RDS/Azure SQL/Cloud SQL).

**Q: How do you manage costs in this cloud?**
Use reserved/committed use for baseline workloads (40-60% savings). Spot/preemptible for batch/fault-tolerant. Right-size instances (use monitoring data). Storage tiering. Auto-scaling to match actual demand.

**Q: What is the difference between security groups and NACLs?**
Security Groups: stateful (return traffic automatically allowed), attached to instances/ENIs, allow rules only. NACLs: stateless (must explicitly allow inbound AND outbound), attached to subnets, allow and deny rules, evaluated in order. Use SGs for instance-level control, NACLs for subnet-level defense in depth.

**Q: Explain VPC peering vs Transit Gateway.**
VPC Peering: direct 1:1 connection between two VPCs (same or different accounts/regions). Non-transitive — if A peers with B and B peers with C, A cannot reach C through B. Transit Gateway: hub-and-spoke model, centrally routes traffic between many VPCs and on-premises. More scalable; supports transitive routing.

**Q: What is the difference between EBS, EFS, and S3?**
EBS: block storage, attached to single EC2 instance, persistent, low latency. EFS: network file system (NFS), shared across multiple EC2 instances, scales automatically. S3: object storage, virtually unlimited scale, accessed via API (not mountable as filesystem natively), cheapest per GB.

**Q: How does IAM Roles differ from IAM Users?**
Users: long-term credentials for humans or applications (access key + secret). Roles: temporary credentials, assumed by AWS services (EC2, Lambda), federated users (SSO), or cross-account access. Best practice: no long-term access keys for applications — use roles. EC2 instance profiles attach a role to the instance.

**Q: What is AWS Lambda and its cold start issue?**
Serverless compute — runs code without provisioning servers. Cold start: first invocation (or after idle period) requires initialising the execution environment (download code, start runtime). Adds 100ms-1s latency. Mitigations: Provisioned Concurrency (pre-warm containers), SnapStart (Java), keep functions warm via scheduled pings.
