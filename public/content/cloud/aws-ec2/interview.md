# AWS EC2 Interview Questions

## Core Concepts

**Q: What is EC2? Explain instance types.**

EC2 (Elastic Compute Cloud) is AWS's virtual server service. You choose instance type (CPU/RAM/storage profile) and OS, and AWS runs it on their hardware.

**Instance families:**
| Family | Optimised For | Examples |
|---|---|---|
| t (Burstable) | Variable workloads, dev/test | t3.micro, t3.large |
| m (General Purpose) | Balanced CPU/RAM | m6i.large, m5.xlarge |
| c (Compute) | CPU-heavy (video, batch) | c6i.4xlarge |
| r (Memory) | Databases, caches | r6i.8xlarge |
| i/d (Storage) | High disk IOPS | i4i.xlarge |
| g/p (GPU) | ML training, graphics | g5.xlarge, p4d.24xlarge |
| trn (Trainium) | ML training (AWS chip) | trn1.32xlarge |
| inf (Inferentia) | ML inference (AWS chip) | inf2.xlarge |

**T instances and CPU credits**: Burstable — earn credits when CPU < baseline, spend during bursts. `T3 Unlimited` = burst without credit limit (small extra cost).

---

**Q: EC2 purchasing options.**

| Option | Discount | Commitment | Best For |
|---|---|---|---|
| On-Demand | 0% | None | Unpredictable, short-term |
| Spot | 60-90% | None (evictable) | Stateless batch, fault-tolerant |
| Reserved (1yr) | ~40% | 1 year | Steady-state production |
| Reserved (3yr) | ~60% | 3 years | Long-running databases |
| Savings Plans | ~17-66% | 1-3yr $/hr commit | Flexible mix of instances |
| Dedicated Host | 0% | On-demand or reserved | Licensing, compliance |

**Spot best practices:**
- Use Spot Fleet (mix instance types) to reduce interruption risk
- Use `--instance-interruption-behavior=hibernate` for stateful workloads
- Monitor Spot interruption notices (2-min warning via metadata service)
- Use On-Demand + Spot mixed ASG (base capacity On-Demand, scale with Spot)

---

**Q: EC2 networking — ENI, security groups, placement groups.**

**ENI (Elastic Network Interface)**: Virtual NIC. Each instance gets primary ENI. Can attach additional ENIs (for network appliances, dual-homed instances).

**Security Groups:**
```
Inbound rules: by default deny all. Add allow rules.
Outbound rules: by default allow all. Can restrict.
Stateful: allow inbound → return traffic automatically allowed.
Reference other SGs: "allow port 8080 from App-SG" → any instance in App-SG
```

**Placement Groups:**
- **Cluster**: All instances in same AZ, same rack. Low latency (HPC). Risk: all fail together.
- **Spread**: Each instance on different rack (max 7 per AZ). High availability.
- **Partition**: Groups of instances on separate racks (good for Hadoop, Kafka).

---

**Q: AMI, snapshots, and EC2 Image Builder.**

**AMI (Amazon Machine Image)**: Template for launching EC2 instances. Contains OS, software, configuration.

```bash
# Create AMI from running instance
aws ec2 create-image   --instance-id i-1234567890abcdef0   --name "MyApp-AMI-$(date +%Y%m%d)"   --no-reboot

# Copy AMI to another region (for DR/global deployment)
aws ec2 copy-image   --source-region us-east-1   --source-image-id ami-xxxxx   --region eu-west-1   --name "MyApp-AMI-EU"
```

**EC2 Image Builder**: Automate AMI creation pipeline.
- Define image recipe (base AMI + components to install/configure)
- Schedule automated builds, test, distribute to multiple regions
- Integrates with Systems Manager for patching

**EBS Snapshots**: Point-in-time backup of EBS volume. Incremental (only changed blocks). Stored in S3.
```bash
aws ec2 create-snapshot --volume-id vol-xxx --description "Daily backup"
# Automate: Data Lifecycle Manager (DLM) policies
```

---

**Q: EC2 Auto Scaling — how does it work?**

Auto Scaling Group (ASG): Maintains desired number of EC2 instances, scales based on demand.

```yaml
Auto Scaling Group:
  MinSize: 2
  MaxSize: 20
  DesiredCapacity: 4
  
Scaling Policies:
  Target Tracking: "Keep avg CPU at 70%"
  Step Scaling: "CPU > 80% → add 2 | CPU < 20% → remove 1"
  Scheduled: "Scale to 10 at 9am weekdays, scale to 2 at 8pm"
  Predictive: ML-based pre-scaling for recurring patterns
  
Health Checks: EC2 status checks + ELB health checks
Lifecycle Hooks: Run scripts on launch/terminate (warm up, drain connections)
```

**Launch Template** (preferred over Launch Configuration): Defines instance configuration for ASG. Supports multiple versions, Spot+On-Demand mix.

---

**Q: EC2 monitoring and troubleshooting.**

```bash
# EC2 status checks
# System status check: hardware/hypervisor issue (contact AWS)
# Instance status check: OS/network issue (your responsibility)

# View instance metadata from within instance
curl http://169.254.169.254/latest/meta-data/instance-id
curl http://169.254.169.254/latest/meta-data/instance-type
# IMDSv2 (more secure):
TOKEN=$(curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")
curl -H "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/meta-data/

# CloudWatch metrics: CPUUtilization, NetworkIn/Out, DiskReadBytes
# Enhanced monitoring: 1-minute granularity (default: 5 min)
aws ec2 monitor-instances --instance-ids i-xxx

# Connect to instance
aws ssm start-session --target i-xxx   # Systems Manager (no SSH key needed)
# Or traditional: ssh -i key.pem ec2-user@ip
```

**Common issues:**
- Instance won't start: Check instance limits, VPC/subnet config
- Can't connect via SSH: Check SG port 22, NACL, key pair, OS boot logs
- High CPU: Check CloudWatch, use `top`/`htop` via SSM session
- Status check failed: Stop/start (moves to new hardware) vs reboot

## Revision Notes
```
EC2 FAMILIES: t(burst) m(general) c(compute) r(memory) i(storage) g/p(GPU)
T instances: CPU credits for burst. T3 Unlimited = burst without credit limit.

PURCHASING:
On-Demand: no commitment | Spot: 60-90% off, evictable | RI: 40-60% off 1-3yr
Savings Plans: flexible commitment | Dedicated Host: licensing/compliance

NETWORKING:
ENI: virtual NIC, can add multiple
SGs: stateful, allow-only, can reference other SGs
Placement: Cluster(low latency) | Spread(HA, 7/AZ) | Partition(Hadoop/Kafka)

AMI: instance template. Create from running instance. Copy cross-region.
EBS Snapshot: incremental backup. DLM for automation.
EC2 Image Builder: automated AMI pipeline with testing.

AUTO SCALING:
ASG: min/desired/max. Launch Template (preferred over Launch Config).
Policies: Target Tracking | Step | Scheduled | Predictive
Lifecycle hooks: scripts on launch/terminate

TROUBLESHOOTING:
Status checks: System (AWS hardware) vs Instance (your OS)
IMDSv2: use token-based metadata access (more secure)
Connect: SSM Session Manager (no SSH key needed, no port 22)
```
