# Cloud Cost Optimization — FinOps Guide

Cloud bills grow faster than engineering teams expect. This guide covers strategies that actually reduce bills by 20-40% in 90 days.

## Why Cloud Bills Explode

The top causes: forgotten test resources never terminated, over-provisioned instances doing a fraction of their capacity, data transfer fees accumulating unnoticed, and dev environments running 24/7 like production.

## Right-Sizing

AWS Compute Optimizer analyses CloudWatch metrics and recommends smaller instance types. Most teams over-provision by 30-50%. CPU under 5% and memory under 20% consistently means you can downsize immediately.

Graviton (ARM-based) instances are 20-40% cheaper than equivalent x86 instances with the same performance for most workloads. Migrating is the single highest-return action for most teams.

```bash
# Find over-provisioned instances
aws compute-optimizer get-ec2-instance-recommendations \
  --filters name=Finding,values=OVER_PROVISIONED
```

## Savings Plans and Reserved Instances

```
On-Demand:            No commitment, most expensive
Reserved (1-year):    30-40% savings, specific instance type
Reserved (3-year):    50-60% savings
Compute Savings Plan: Commit to $/hour, applies to any EC2/Fargate/Lambda
                      Most flexible — recommended over RIs
Spot Instances:       60-90% cheaper, can be interrupted with 2-min notice
```

Use Savings Plans for your baseline production load. Use Spot for batch processing, CI/CD runners, ML training, and any fault-tolerant workload.

## Storage Optimization

```
gp2 → gp3 EBS:        20% cheaper, upgrade in place with zero downtime
S3 Intelligent Tiering: Automatically moves objects to cheaper tiers
S3 Lifecycle Policies:  Transition to Glacier after 90 days (80% cheaper)
Delete old snapshots:   EBS snapshots accumulate silently and cost significantly
```

## Quick Wins — Week 1

```bash
# Find unattached EBS volumes (charged even when not attached)
aws ec2 describe-volumes --filters Name=status,Values=available

# Find unused Elastic IPs (charged when NOT attached to running instance)  
aws ec2 describe-addresses --query "Addresses[?AssociationId==null]"

# Stop dev instances nights/weekends — saves 65% of instance cost
# AWS Instance Scheduler handles this automatically
```

## Tagging Strategy — Know Who is Spending What

Without tags, you cannot identify which team or project is causing costs. Enforce tagging at the AWS Organizations level:

```yaml
# Required tags on all resources
Team: platform / backend / data / ml
Project: synfracore / payments / analytics
Environment: prod / staging / dev
Owner: engineer-email@company.com
```

Target: 20-40% bill reduction in first 90 days for most teams.
