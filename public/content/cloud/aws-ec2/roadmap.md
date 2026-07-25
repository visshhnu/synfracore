# AWS EC2 — Learning Roadmap

## Estimated Time to Job-Ready
**5-7 weeks** of consistent learning (2-3 hours/day) — EC2 itself is conceptually simple (a VM), but real proficiency means understanding instance family selection, pricing models, and how EC2 sits inside a VPC, security groups, and auto-scaling — not just launching an instance.

## Phase 1: Foundation (Week 1-2)

- Instance families and sizing: general-purpose (m-series), compute-optimized (c-series), memory-optimized (r-series), and when each is actually the right choice for a workload
- Launching an instance via the console and CLI, connecting via SSH/Session Manager, and understanding the difference between stopping, terminating, and rebooting
- AMIs (Amazon Machine Images): using a public AMI vs. building a custom one, and why a "golden AMI" pipeline matters for consistent deployments
- Security groups (stateful, instance-level firewall) vs. NACLs (stateless, subnet-level) — a genuinely common early point of confusion

**Checkpoint:** can you explain why a security group rule allowing inbound traffic on port 443 doesn't need a matching outbound rule for the response, while a NACL does?

## Phase 2: Pricing Models and Storage (Week 2-4)

- On-Demand vs. Reserved Instances vs. Savings Plans vs. Spot Instances — the real tradeoff each makes between cost and commitment/interruption risk
- EBS volume types (gp3, io2, st1) and matching volume type to actual I/O pattern, not defaulting to one type everywhere
- Instance store vs. EBS — ephemeral vs. persistent storage, and why losing instance store data on stop/terminate surprises people who assumed all EC2 storage persists
- Elastic IPs vs. dynamic public IPs, and why a dynamic IP changing on stop/start breaks naive DNS assumptions

**Checkpoint:** given a genuinely fault-tolerant, interruption-tolerant batch workload, can you justify choosing Spot over On-Demand with a real cost comparison, not just "Spot is cheaper"?

## Phase 3: Auto Scaling and Production Patterns (Week 4-6)

- Auto Scaling Groups: launch templates, scaling policies (target tracking, step scaling), and health checks that actually replace unhealthy instances
- Placement groups (cluster, spread, partition) and when each matters for real workloads
- User data scripts for instance bootstrapping, and why baking more into the AMI beats a longer, more fragile boot-time script
- Load balancer integration (ALB/NLB) with an Auto Scaling Group as the standard production pattern

**Checkpoint:** can you explain why a target-tracking scaling policy is generally preferred over manually-tuned step scaling for most workloads?

## Phase 4: Cost, Security, and Interview Readiness (Week 6-7)

- Right-sizing based on actual CloudWatch utilization data, not initial provisioning guesses
- IAM instance profiles/roles for granting an EC2 instance AWS permissions without embedding long-lived credentials
- Patch management strategy (Systems Manager Patch Manager, or golden-AMI rotation) for fleets at scale
- Review this course's Interview Q&A material, particularly instance family selection and Spot vs. Reserved tradeoff questions

## Common Pitfalls Specific to EC2

- **Assuming instance store data survives a stop/start** — it doesn't; only EBS-backed volumes persist across a stop, and instance store is wiped on both stop and terminate
- **Treating security groups and NACLs as interchangeable** — security groups are stateful and instance-level; NACLs are stateless and subnet-level, requiring explicit rules for both directions
- **Hardcoding AWS credentials into an instance instead of using an IAM instance profile** — a long-lived embedded credential is a real security liability an instance profile avoids entirely
- **Choosing an instance family by habit rather than actual workload profile** — a memory-bound workload on a compute-optimized instance (or vice versa) wastes money without the performance benefit you're actually paying for

## Getting Your First EC2-Heavy Role

1. **Portfolio:** a project demonstrating a real Auto Scaling Group behind a load balancer, with a genuine scaling event triggered and documented (not just configured)
2. **Resume:** be specific — "reduced EC2 spend 30% by right-sizing over-provisioned m5.2xlarge instances to m5.xlarge based on 30 days of CloudWatch utilization data" is far stronger than "experience with AWS EC2"
3. **Know the pricing models cold:** interviewers commonly probe whether you can justify a pricing model choice with real reasoning, not just recite the four options
4. **Certifications, if pursuing one:** EC2 is heavily featured in AWS Solutions Architect Associate and SysOps Administrator — see this course's own Certification Guide for current format and pricing
