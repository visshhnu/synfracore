# Amazon Web Services

> **The leading cloud platform — core services to architecture**

**Category:** Cloud  
**Learning Path:** What → Why → Architecture → Setup → Real Examples → Production → Interview Prep

---

## What is Amazon Web Services?

AWS has 30+ regions worldwide, each with 2-6 AZs. Always design for AZ failure — multi-AZ is the baseline for production. Shared Responsibility: AWS secures the cloud, you secure what's IN the cloud.

## Why Amazon Web Services?

IAM is the security foundation. Use Roles, not Users for applications. IRSA (IAM Roles for Service Accounts) lets K8s pods assume AWS roles without access keys. SCPs control what accounts can do at the organization level.

---

## Learning Modules

### Module 01 — AWS Fundamentals
*Regions, AZs, global infrastructure*

AWS has 30+ regions worldwide, each with 2-6 AZs. Always design for AZ failure — multi-AZ is the baseline for production. Shared Responsibility: AWS secures the cloud, you secure what's IN the cloud.

**Topics covered:**

- Regions and Availability Zones — 🟢 Beginner
- Shared Responsibility Model — 🟢 Beginner
- AWS pricing model — 🟢 Beginner

### Module 02 — IAM
*Identity and access management*

IAM is the security foundation. Use Roles, not Users for applications. IRSA (IAM Roles for Service Accounts) lets K8s pods assume AWS roles without access keys. SCPs control what accounts can do at the organization level.

**Topics covered:**

- Users, Groups, Roles, Policies — 🟢 Beginner
- Least privilege principle — 🟡 Intermediate
- IAM Roles for EC2/EKS (IRSA) — 🟡 Intermediate
- SCP and Organizations — 🔴 Advanced

### Module 03 — Compute
*EC2, Lambda, ECS, EKS*

EC2 is VMs. EKS is managed Kubernetes. ECS is AWS's own container orchestration. Lambda for event-driven serverless. For new workloads: prefer EKS (if K8s expertise) or Fargate (serverless containers) over raw EC2.

**Topics covered:**

- EC2 instance families and pricing — 🟢 Beginner
- Auto Scaling Groups — 🟡 Intermediate
- EKS (managed Kubernetes) — 🔴 Advanced
- ECS and Fargate — 🟡 Intermediate
- Lambda and serverless — 🟡 Intermediate

### Module 04 — Networking
*VPC, Route53, Load Balancers*

VPC is your private network in AWS. Public subnets have IGW route. Private subnets go through NAT GW. Security Groups are stateful instance firewalls. NACLs are stateless subnet firewalls. Transit Gateway connects multiple VPCs and on-prem.

**Topics covered:**

- VPC, subnets, routing tables — 🟡 Intermediate
- Security Groups vs NACLs — 🟡 Intermediate
- NAT Gateway and Internet Gateway — 🟡 Intermediate
- Transit Gateway — 🔴 Advanced
- Route53 DNS — 🟡 Intermediate

### Module 05 — Storage
*S3, EBS, EFS*

S3 is object storage — the most used AWS service. EBS is block storage for EC2 (like a hard drive). EFS is shared NFS filesystem for multiple instances. S3 lifecycle policies automatically move data to cheaper storage classes.

**Topics covered:**

- S3 storage classes and lifecycle — 🟡 Intermediate
- EBS volume types (gp3, io2) — 🟡 Intermediate
- EFS for shared file system — 🟡 Intermediate
- S3 security and bucket policies — 🔴 Advanced

---

## Production Example


---

## Interview Prep

!!! tip "PSR Formula"
    Answer every question: **Problem → Solution → Result**. 45-90 seconds max.

### Common Interview Questions

??? question "What is Amazon Web Services and why would you use it in production?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How does Amazon Web Services work internally? Explain the architecture."
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "What are the main components of Amazon Web Services?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How do you handle failures in Amazon Web Services?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "What is your production experience with Amazon Web Services?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How do you monitor and observe Amazon Web Services in production?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "What are the security considerations for Amazon Web Services?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How does Amazon Web Services compare to alternatives?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "Explain AWS Fundamentals in Amazon Web Services."
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "Explain IAM in Amazon Web Services."
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

---

## Official Resources

- [AWS Documentation](https://docs.aws.amazon.com/)
- [AWS Architecture Center](https://aws.amazon.com/architecture/)
- [AWS Well-Architected Framework](https://aws.amazon.com/architecture/well-architected/)

---

*Part of [LearnwithVishnu](https://learnwithvishnu.pages.dev) — Basics → Production → Architect*