# Amazon Web Services

> **The leading cloud platform — core services to architecture**

**Category:** Cloud  
**Learning Path:** What → Why → Learning Modules → Interview Prep

**Before you start:** no prior cloud platform experience is required — this is the entry point for the AWS track. Basic networking concepts (what an IP address and a firewall are) and general command-line comfort help but aren't required to start.

---

## What is Amazon Web Services?

AWS is a cloud platform — instead of buying and racking physical servers, you rent compute, storage, networking, and managed services on demand, billed for what you actually use. It runs across 30+ **Regions** worldwide (independent geographic areas), each containing 2-6 **Availability Zones (AZs)** — physically separate data centers within that region, linked by private high-speed networking. Always design for AZ failure — running across multiple AZs is the baseline expectation for production, not an optional upgrade. AWS operates under a **Shared Responsibility Model**: AWS secures the underlying cloud infrastructure (physical security, hypervisor, network fabric); you're responsible for securing everything you configure on top of it (IAM policies, security groups, encryption settings).

## Why Amazon Web Services?

**IAM (Identity and Access Management)** is the security foundation everything else sits on — it decides who or what can call which AWS API on which resource. The standing rule: use **Roles** (temporary, short-lived credentials) rather than **Users** (long-lived credentials) for anything application-facing, since a leaked role credential expires on its own within hours while a leaked user access key stays valid until someone notices. **IRSA** (IAM Roles for Service Accounts) extends this pattern into Kubernetes, letting EKS pods assume AWS roles directly without ever storing an access key. **SCPs** (Service Control Policies) work at a level above individual IAM policies — they set an organization-wide ceiling on what an entire AWS account can do, which no IAM policy inside that account can override.

---

## Learning Modules

### Module 01 — AWS Fundamentals
*Regions, AZs, global infrastructure*

Covered above: Regions, AZs, and the Shared Responsibility Model. This module covers pricing on top of that foundation.

**Topics covered:**

- Regions and Availability Zones — 🟢 Beginner
- Shared Responsibility Model — 🟢 Beginner
- AWS pricing model — 🟢 Beginner

### Module 02 — IAM
*Identity and access management*

Covered above: Roles vs Users, IRSA, and SCPs. This module covers the building blocks (Users, Groups, Roles, Policies) and where least-privilege and IRSA fit into them concretely.

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

## Interview Prep

**PSR Formula:** Answer every question: **Problem → Solution → Result**. 45-90 seconds max.

### Common Interview Questions

**Q1. What is Amazon Web Services and why would you use it in production?**

**A:** **Problem:** Running your own data center means buying hardware years ahead of actual demand, staffing people to rack/patch/replace it, and still being over- or under-provisioned most of the time. **Solution:** AWS rents compute, storage, networking, and managed services on demand, billed per-second/per-request, with global infrastructure already built out across regions and Availability Zones. **Result:** teams provision in minutes instead of months, scale elastically with real traffic instead of guessed capacity, and shift spend from large upfront capital purchases to variable operating cost — at the price of a new failure mode (cost sprawl, misconfiguration) that has to be actively managed rather than ignored.

---

**Q2. How does Amazon Web Services work internally? Explain the architecture.**

**A:** **Problem:** A learner needs a mental model for how "the cloud" is actually organized before any individual service (EC2, S3, IAM) makes sense. **Solution:** AWS infrastructure is organized as Regions (independent geographic areas, each fully isolated for fault-tolerance and, often, data residency) containing multiple Availability Zones (one or more physically separate data centers with independent power/cooling/networking, linked to other AZs in the same region by low-latency private links). Global services (IAM, Route 53, CloudFront) operate above any single region; most services (EC2, RDS, EKS) are region-scoped and deploy into specific AZs and VPC subnets you control. **Result:** an application deployed across 2+ AZs survives a single data-center failure automatically; one deployed across 2+ regions survives a regional failure and can serve users with lower latency worldwide — the tradeoff is added complexity (cross-AZ/cross-region data replication, latency, cost) that should be justified by the actual availability requirement, not applied everywhere by default.

---

**Q3. What are the main components of Amazon Web Services?**

**A:** **Problem:** With 200+ AWS services, a beginner needs to know which handful actually matter to start being productive. **Solution:** group them by job: **Compute** (EC2 for VMs, Lambda for serverless functions, EKS/ECS for containers) runs your code; **Storage** (S3 for objects, EBS for block storage attached to one instance, EFS for shared file storage) persists your data; **Networking** (VPC, Route 53, load balancers) connects and isolates everything; **Database** (RDS, DynamoDB) manages structured/NoSQL data without you administering the engine by hand; and **IAM** sits underneath all of them, controlling who/what can call which API on which resource. **Result:** almost every real AWS architecture is some combination of these five categories — learning them in that order (rather than jumping straight to a niche service) builds a foundation that transfers to any workload.

---

**Q4. How do you handle failures in Amazon Web Services?**

**A:** **Problem:** Hardware, networks, and even entire data centers fail — AWS explicitly designs for this and expects you to as well, rather than treating failure as an edge case. **Solution:** the practical pattern is redundancy plus automated recovery: run instances across multiple AZs behind a load balancer or Auto Scaling Group so a failed instance is replaced and traffic is rerouted automatically; use managed services with built-in Multi-AZ failover (RDS Multi-AZ, for example) instead of hand-rolling replication; and for anything business-critical, define an explicit RTO (how long can it be down) and RPO (how much data can be lost) so the DR strategy — backup/restore, pilot light, warm standby, or active-active — matches the actual requirement instead of being chosen arbitrarily. **Result:** a well-architected AWS workload degrades gracefully (fewer healthy instances, but still serving traffic) instead of going fully down when one component fails.

---

**Q5. What is your production experience with Amazon Web Services?**

**A:** **Problem:** This question is really asking whether you've operated AWS under real constraints — cost, incidents, scale — not just used it in a tutorial. **Solution (framework to answer with your own specifics):** describe a real workload you ran (what services, what scale), a real problem you hit (a cost spike from an unmonitored NAT Gateway, an AZ outage that exposed a single-AZ deployment, an IAM policy that was too permissive), and the concrete change you made in response. **Result:** name the measurable outcome — reduced cost, improved uptime, faster deploys — because "I used EC2 and S3" without an incident or a decision behind it doesn't demonstrate production judgment. Adapt this with your own actual experience; a fabricated example is worse than admitting you're still building this experience.

---

**Q6. How do you monitor and observe Amazon Web Services in production?**

**A:** **Problem:** Without visibility, failures and cost overruns are discovered by users or by the monthly bill, not by you. **Solution:** CloudWatch is the baseline — metrics (CPU, memory via the CloudWatch agent, custom application metrics), Logs (centralized log aggregation from EC2/Lambda/ECS), and Alarms (trigger on thresholds, notify via SNS or auto-remediate via Lambda). CloudTrail separately logs every API call made in the account, which is what you'd use to answer "who changed this and when" rather than "is this healthy right now." For distributed tracing across microservices, X-Ray shows where time is actually being spent across a request's full path. **Result:** the combination — metrics for "is it healthy," logs for "what happened," CloudTrail for "who did what," alarms for "tell me before a user does" — is what turns an AWS account from something you hope is working into something you know is working.

---

**Q7. What are the security considerations for Amazon Web Services?**

**A:** **Problem:** AWS's Shared Responsibility Model means AWS secures the underlying infrastructure (physical data centers, host hypervisor, network fabric), but everything you configure on top — IAM policies, security groups, S3 bucket permissions, encryption settings — is entirely your responsibility, and misconfiguration there is the single most common cause of real cloud security incidents. **Solution:** the concrete baseline is: never use the root account for daily work (lock it away with MFA after initial setup); use IAM roles with least-privilege policies instead of long-lived access keys, especially for applications; block public access on S3 buckets by default and only open what's explicitly needed; encrypt data at rest (EBS, S3, RDS) and in transit; and enable CloudTrail account-wide so every API call is auditable. **Result:** most publicized AWS breaches trace back to one of these being skipped — a public S3 bucket, an overly broad IAM policy, or a leaked long-term access key — not to a flaw in AWS's own infrastructure.

---

**Q8. How does Amazon Web Services compare to alternatives?**

**A:** **Problem:** AWS, Azure, and GCP overlap heavily in what they offer, so the choice is rarely about raw capability. **Solution:** AWS has the largest service catalog and market share, and is usually the default choice for a startup or team without an existing platform commitment; Azure tends to win in enterprises already standardized on Microsoft (Active Directory, .NET, Office 365) because of tighter integration; GCP is frequently preferred for data/analytics-heavy and ML workloads (BigQuery, Vertex AI) and by teams that value its Kubernetes lineage (GKE). The core primitives map closely across all three — EC2/Azure VMs/GCE, S3/Blob Storage/GCS, IAM/Entra ID/Cloud IAM, EKS/AKS/GKE — so skills largely transfer. **Result:** the real decision drivers in practice are existing vendor relationships, team expertise, specific compliance/data-residency requirements, and workload-specific pricing — not a single cloud being objectively "better" in the abstract.

---

**Q9. Explain AWS Fundamentals in Amazon Web Services.**

**A:** **Problem:** Before touching any individual service, a learner needs the handful of concepts that every other AWS topic assumes you already know. **Solution:** Regions and Availability Zones (AWS's physical redundancy model, covered above); the Shared Responsibility Model (AWS secures the cloud infrastructure, you secure what you put in it — covered above); and AWS's consumption-based pricing (pay for what you provision/use, with no large upfront commitment required to get started, though reserved/committed pricing options exist once usage is predictable). **Result:** these three ideas — where things physically run, who's responsible for securing what, and how billing actually works — are the lens every other AWS service should be read through; skipping them is why "just launch an EC2 instance" tutorials often produce configurations that are insecure or needlessly expensive in production.

---

**Q10. Explain IAM in Amazon Web Services.**

**A:** **Problem:** Every single AWS API call — whether from a human in the console, a script using access keys, or an EC2 instance calling S3 — has to be authenticated (who is this?) and authorized (are they allowed to do this specific action on this specific resource?), and IAM is the service that answers both questions for the entire account. **Solution:** IAM's core building blocks are Users (long-term identities, ideally only for humans, and only when SSO/roles genuinely aren't an option), Groups (a way to attach the same policies to many users at once), Roles (temporary, short-lived credentials assumed by AWS services, applications, or federated users — the default choice for anything non-human), and Policies (JSON documents that state, explicitly, which actions are Allowed or Denied on which resources). By default every request is denied; only an explicit Allow grants access, and an explicit Deny anywhere in the applicable policies always wins over any Allow. **Result:** the single highest-leverage IAM habit is "roles over users, least privilege over convenience" — a leaked temporary role credential expires on its own within hours, while a leaked long-term user access key stays valid indefinitely until someone notices and revokes it.

---

## Official Resources

- [AWS Documentation](https://docs.aws.amazon.com/)
- [AWS Architecture Center](https://aws.amazon.com/architecture/)
- [AWS Well-Architected Framework](https://aws.amazon.com/architecture/well-architected/)