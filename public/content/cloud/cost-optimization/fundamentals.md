# Cloud Cost Optimization — Fundamentals

## The hook: you can't optimize what you can't see

Every technique on this page — right-sizing, commitment discounts, waste removal, cost-aware architecture — depends on one prerequisite that's easy to skip: actually being able to see, per-team and per-project, where the money is going. Tagging discipline isn't a separate "nice to have" pillar; without it, the other three pillars are optimizing against a bill you can't attribute to anyone, which means nobody has the information needed to act on it.

## Analogy

Optimizing cloud costs without tagging is like trying to reduce a household's grocery bill using only the total receipt amount, with no idea which family member bought what. You can still cut the total (buy less of everything), but you can't find the actual waste (one person's unused gym-smoothie subscription vs. everyone's shared milk) without first attributing spend to a source — which is exactly what consistent tagging does for cloud cost.

## The Four Pillars of Cloud Cost Optimization

```
1. RIGHT-SIZING:    Match resource size to actual usage
2. PRICING MODEL:   Choose On-Demand vs Savings Plans vs Spot
3. WASTE REMOVAL:   Delete unused resources
4. ARCHITECTURE:    Design for cost efficiency from the start
```

## How the four pillars fit together (diagram)

```
                 Tagging (this file's real prerequisite)
                              │
       ┌──────────────────────┼──────────────────────┐
       ▼                      ▼                       ▼
  RIGHT-SIZING          PRICING MODEL            WASTE REMOVAL
  (needs per-team        (needs per-team          (needs per-team
   usage data to           commitment history        attribution to
   know who's over-        to choose On-Demand       know whose orphaned
   provisioned)            vs Savings Plan)           resource it is)
       │                      │                       │
       └──────────────────────┴───────────────────────┘
                              │
                              ▼
                    ARCHITECTURE (the pillar that
                  prevents needing the other three
                   as urgently, going forward)
```

## Try it yourself (2 minutes)

Run the Cost Explorer command below against any AWS account you have read access to (even a mostly-empty sandbox works):
```bash
aws ce get-cost-and-usage --time-period Start=2024-01-01,End=2024-01-31 \
    --granularity MONTHLY --metrics BlendedCost \
    --group-by Type=DIMENSION,Key=SERVICE
```
Look at the output: can you tell WHO is responsible for each service's spend, or only WHAT the spend was on? If tags aren't set up, the answer is "only what" — which is precisely the gap tagging discipline exists to close, and why it's listed as this page's real prerequisite rather than an optional pillar.

## AWS Cost Tools

```bash
# AWS Cost Explorer — visualize spend
aws ce get-cost-and-usage \
    --time-period Start=2024-01-01,End=2024-01-31 \
    --granularity MONTHLY \
    --metrics BlendedCost \
    --group-by Type=DIMENSION,Key=SERVICE

# Find biggest spenders
aws ce get-cost-and-usage \
    --time-period Start=2024-01-01,End=2024-01-31 \
    --granularity MONTHLY \
    --metrics BlendedCost \
    --group-by Type=DIMENSION,Key=SERVICE \
    --query 'ResultsByTime[].Groups[] | sort_by(@, &Metrics.BlendedCost.Amount) | reverse(@) | [:10]'

# AWS Compute Optimizer — right-sizing recommendations
aws compute-optimizer get-ec2-instance-recommendations \
    --filters name=Finding,values=OVER_PROVISIONED

# Trusted Advisor checks (Cost Optimization category)
aws support describe-trusted-advisor-checks --language en \
    --query 'checks[?category==`cost_optimizing`].[id,name]'
```

## Quick Wins (Find and Delete Waste)

```bash
# Unattached EBS volumes
aws ec2 describe-volumes --filters Name=status,Values=available \
    --query 'Volumes[*].[VolumeId,Size,CreateTime]' --output table

# Old snapshots (older than 90 days)
aws ec2 describe-snapshots --owner-ids self \
    --query "Snapshots[?StartTime<='$(date -u -d '90 days ago' +%Y-%m-%dT%H:%M:%SZ)'].[SnapshotId,VolumeSize,StartTime]"

# Unassociated Elastic IPs ($0.005/hr each when not attached)
aws ec2 describe-addresses --query 'Addresses[?AssociationId==null].[AllocationId,PublicIp]'

# Idle Load Balancers (no requests for 7 days)
aws cloudwatch get-metric-statistics \
    --namespace AWS/ApplicationELB \
    --metric-name RequestCount \
    --dimensions Name=LoadBalancer,Value=app/my-alb/xxx \
    --start-time $(date -u -d '7 days ago' +%Y-%m-%dT%H:%M:%SZ) \
    --end-time $(date -u +%Y-%m-%dT%H:%M:%SZ) \
    --period 604800 --statistics Sum

# NAT Gateway idle data processing
aws cloudwatch get-metric-statistics \
    --namespace AWS/NATGateway \
    --metric-name BytesOutToDestination \
    --dimensions Name=NatGatewayId,Value=nat-xxx ...
```

## Savings Plans vs Reserved Instances

```
On-Demand:      No commitment, highest price ($1.00/hr example)
Reserved (1yr): 30-40% off, commit to specific instance type
Reserved (3yr): 50-60% off, longer commit
Savings Plans:  Like RI but flexible — commit $ per hour, any instance

Compute Savings Plan (most flexible):
  Commit: $0.50/hr of compute
  Covers: EC2, Lambda, Fargate — any type, any region
  Discount: 54-66% vs on-demand

EC2 Instance Savings Plan:
  Commit to specific instance family (e.g., m5 in us-east-1)
  Discount: up to 72% vs on-demand

Spot Instances:
  Up to 90% off — but can be interrupted with 2-min notice
  Use for: batch jobs, ML training, CI/CD, rendering
  NOT for: production web servers without interruption handling
```
