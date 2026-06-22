# Cloud Cost Optimisation Interview Questions

## Core Concepts

**Q: What is FinOps? What are the main levers for cloud cost optimisation?**

FinOps (Cloud Financial Operations) is the practice of bringing financial accountability to cloud spending — enabling engineering, finance, and business teams to make data-driven spending decisions.

**FinOps phases:**
1. **Inform**: Visibility into spending. Who spends what on what? Unit economics.
2. **Optimise**: Right-size, eliminate waste, use commitment discounts.
3. **Operate**: Continuous process. Policies, automation, governance.

**Main cost levers:**

| Lever | Typical Saving | Effort |
|---|---|---|
| Spot/Preemptible instances | 60-90% | Medium |
| Reserved/Committed use | 30-72% | Low (commitment required) |
| Right-sizing (CPU/memory) | 20-40% | Medium |
| Storage tiering | 50-80% for cold data | Low |
| Auto-scaling (eliminate idle) | 20-50% | Medium |
| Delete unused resources | 10-30% | Low |
| Savings Plans | 20-40% | Low (flexible commitment) |

---

**Q: Explain commitment discounts — RI vs Savings Plans vs CUDs.**

**AWS:**
- **Reserved Instances (RI)**: Commit to specific instance type/region for 1-3 years. 40-72% off.
- **Savings Plans (Compute)**: Commit to $/hour of compute spend (flexible across types). 17-66% off.
- **Savings Plans (EC2)**: Commit to specific instance family. Up to 72% off.

**Azure:**
- **Reserved VM Instances**: 1-3 year commit, specific VM size/region. 40-72% off.
- **Azure Hybrid Benefit**: Bring your own Windows Server/SQL Server license.

**GCP:**
- **Committed Use Discounts (CUDs)**: 1-3 year commit for CPU/RAM or specific resources.
- **Sustained Use Discounts**: Automatic discounts for VMs running >25% of month (up to 30%).

**Right-sizing before committing**: Never buy RIs before right-sizing — you lock in waste.

---

**Q: How do you identify and eliminate cloud waste?**

**Step 1: Discover waste**
```bash
# AWS: Trusted Advisor, Cost Explorer, Compute Optimizer
aws ce get-cost-and-usage   --time-period Start=2024-01-01,End=2024-01-31   --granularity MONTHLY   --group-by Type=DIMENSION,Key=SERVICE

# AWS Compute Optimizer: right-sizing recommendations
aws compute-optimizer get-ec2-instance-recommendations

# Azure Advisor: cost recommendations
az advisor recommendation list --category Cost
```

**Common waste patterns:**
- **Idle instances**: Low CPU (<5%) for extended periods → downsize or terminate
- **Unattached EBS/disks**: Volumes not attached to any instance
- **Unassociated Elastic IPs**: Charged when not attached ($3.60/month each)
- **Old snapshots**: Auto-delete snapshots older than 30 days (lifecycle policy)
- **Dev/test running 24/7**: Schedule to run 8 hours/day → save 67%
- **Over-provisioned RDS**: Memory utilisation <20% → downsize
- **Unused NAT Gateways**: Charged per GB + hourly (~$32/month + data)
- **Data transfer costs**: Cross-AZ, cross-region, internet egress

---

**Q: Cloud cost allocation and showback/chargeback.**

**Tagging strategy** (foundation of cost allocation):
```
Mandatory tags:
- Project: my-project
- Environment: production/staging/dev
- Team: backend/frontend/data
- CostCenter: 1234
- Owner: alice@company.com

Enforce with:
AWS: Tag Policies in AWS Organizations
Azure: Azure Policy (deny resources without required tags)
GCP: Resource Manager labels + org policies
```

**Showback**: Show teams what they spend (no charge).
**Chargeback**: Actually charge teams/departments for their cloud usage.

**Unit economics**: Cost per transaction, cost per user, cost per API call.
Good metric to track: infrastructure cost as % of revenue (target <5% for SaaS).

---

**Q: Auto-scaling for cost efficiency.**

```yaml
# K8s HPA: scale pods based on metrics
apiVersion: autoscaling/v2
kind: HorizontalPodAutoscaler
spec:
  minReplicas: 1   # Scale to zero when possible
  maxReplicas: 20
  metrics:
  - type: Resource
    resource:
      name: cpu
      target:
        type: Utilization
        averageUtilization: 70

# KEDA: scale to zero on queue depth
spec:
  triggers:
  - type: aws-sqs-queue
    metadata:
      queueURL: https://sqs.us-east-1.amazonaws.com/123/my-queue
      queueLength: "5"    # Scale up when >5 messages
  minReplicaCount: 0      # Scale to zero when queue empty
```

**Scheduled scaling**: Scale down dev environments at night/weekends.

## Revision Notes
```
FINOPS: Inform (visibility) → Optimise (right-size, commitments) → Operate (governance)

COST LEVERS (highest impact first):
1. Spot/Preemptible: 60-90% off (stateless/batch)
2. Reserved/CUD: 30-72% off (1-3yr commit) — right-size BEFORE committing
3. Right-sizing: 20-40% (Compute Optimizer, Advisor)
4. Storage tiering: 50-80% for cold data
5. Delete waste: idle instances, unattached volumes, unused IPs, old snapshots

TAGGING: Project + Environment + Team + CostCenter + Owner
Enforce via Tag Policies / Azure Policy / GCP org labels
Showback (visibility) → Chargeback (billing by team)

COMMITMENT TYPES:
AWS: Reserved Instances (specific) or Savings Plans (flexible)
Azure: Reserved VM Instances + Hybrid Benefit (BYOL)
GCP: CUDs + Sustained Use Discounts (automatic)

WASTE DETECTION:
CPU <5% → downsize | Unattached EBS → delete | Dev 24/7 → schedule 8hr/day
Old snapshots → lifecycle policy | Unused NAT GW → consolidate
```
