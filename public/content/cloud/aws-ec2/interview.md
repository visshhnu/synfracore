# AWS EC2 — Interview Questions

## Most Asked Questions

**Explain the difference between vertical and horizontal scaling in EC2.**
Vertical scaling (scale up) means changing the instance type to a larger one — e.g. t3.medium to m5.4xlarge. You must stop the instance, change the type, then start it. This causes downtime and has hardware limits. Horizontal scaling (scale out) means adding more instances behind a load balancer, using Auto Scaling Groups. This is the AWS-recommended approach — it can scale to hundreds of instances with zero downtime and provides fault tolerance across AZs.

**What is the difference between an AMI and a Snapshot?**
A Snapshot is a point-in-time backup of an EBS volume — it captures the raw disk data. An AMI (Amazon Machine Image) is a complete template for launching an instance — it includes one or more snapshots (root volume + data volumes), launch permissions, and block device mapping. An AMI is built FROM a snapshot. When you create an AMI from an instance, AWS creates snapshots of its volumes and packages them with instance metadata.

**How does EC2 instance metadata work?**
Every EC2 instance can query its own metadata at http://169.254.169.254/latest/meta-data/ — this is a link-local address only accessible from within the instance. It returns instance ID, instance type, AMI ID, IAM role credentials, private IP, public IP, and more. IMDSv2 (recommended) requires a session token to prevent SSRF attacks. Applications use this to self-configure without hardcoded values.

```bash
# IMDSv2 — get instance metadata securely
TOKEN=$(curl -X PUT "http://169.254.254.254/latest/api/token" \
  -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")
curl -H "X-aws-ec2-metadata-token: $TOKEN" \
  http://169.254.254.254/latest/meta-data/instance-id
```

**What is EC2 Hibernate?**
Normal stop/start flushes RAM to disk (EBS root volume) before stopping — RAM state is preserved. On restart, the OS reads it back into memory and resumes from where it left off. Faster to resume long-running workloads. Requirements: instance must have EBS root volume with enough space for RAM, encrypted volume, and instance must support hibernate (most types do, not bare metal or spot).

**How do you make an instance highly available?**
Place at least 2 instances in different Availability Zones behind an Application Load Balancer. Use Auto Scaling Group with min=2 across at least 2 AZs. Configure health checks on the ALB so unhealthy instances are removed from rotation. Use EBS or EFS for stateful data (not instance store). Enable ALB access logs for visibility. Set up CloudWatch alarms for scaling and health monitoring.

**What happens when an EC2 instance fails its health check?**
With an Auto Scaling Group: ASG's health check (EC2 or ELB) marks the instance unhealthy. ASG terminates the instance and launches a replacement. If using ELB health checks, instances failing ALB health checks get deregistered before termination. The replacement gets launched in the same AZ as the failed instance (ASG rebalances across AZs over time).

**Spot vs Reserved vs On-Demand — when to use each?**
On-Demand: Testing, development, unpredictable workloads, spiky traffic. No commitment.
Reserved: Predictable baseline load that runs 24/7 — databases, always-on APIs. 1 or 3 year commitment. 30-60% savings.
Spot: Batch processing, ML training, CI/CD workers, rendering — workloads that can be interrupted and resumed. Up to 90% savings. 2-minute notice before termination.
Savings Plans: Like Reserved but more flexible — covers any instance type, any size. Preferred over RIs for most teams.

**What is the difference between EBS and Instance Store?**
Instance Store is physically attached to the host — extremely fast (NVMe SSD), but completely ephemeral. Data is LOST when instance stops, terminates, or the underlying hardware fails. Use only for temporary cache, scratch space, or buffer.
EBS is a network-attached block storage service. Data persists independently of instance lifecycle. Can be detached and attached to another instance. Supports snapshots for backup. Slightly higher latency than Instance Store (network vs physical) but acceptable for databases and OS volumes.
