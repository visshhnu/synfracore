# Cloud Cost Optimization — FinOps Guide

**Before you start:** basic AWS familiarity (EC2, EBS, S3) is assumed, since every command on this page is AWS CLI — the FinOps concepts (right-sizing, commitment discounts, waste removal, tagging) apply the same way on Azure and GCP, but this course's hands-on examples are AWS-specific. No prior cost-management experience is required.

## Why this exists (the hook)

Cloud billing has no natural brake — unlike buying a physical server, spinning up a bigger instance or leaving one running costs nothing to *do*, only something to *pay for later*, and that payment is invisible until the monthly bill arrives. A team can accumulate real waste (forgotten test resources, over-provisioned instances, idle NAT Gateways) for months without anyone noticing, because nothing about clicking "launch" or forgetting to click "terminate" gives immediate feedback. FinOps exists to put that feedback loop back in, deliberately, since the cloud provider's billing system won't do it for you.

## Analogy

Running cloud infrastructure without cost discipline is like a hotel room with no checkout time and a bill that only arrives once a month — nothing stops you from booking more rooms than you need "just in case," and nothing reminds you a room's been sitting empty for three weeks. FinOps practices (tagging, right-sizing, scheduled shutdowns, savings commitments) are the equivalent of an actual checkout process: they make usage visible and give someone a reason to notice waste before the bill does it for them.

Cloud bills grow faster than engineering teams expect. This guide covers strategies that can meaningfully reduce bills within a few months *(needs verification — the specific "20-40% in 90 days" figure is a commonly-cited industry claim, not a guarantee; actual results depend heavily on how much waste already exists in a given environment)*.

## Why Cloud Bills Explode

The top causes: forgotten test resources never terminated, over-provisioned instances doing a fraction of their capacity, data transfer fees accumulating unnoticed, and dev environments running 24/7 like production.

## How waste accumulates (diagram)

```flow
{
  "layout": "flow",
  "steps": [
    { "label": "Launch an instance", "sublabel": "No natural \"is this still needed?\" prompt", "color": "blue" },
    { "label": "Workload finishes", "sublabel": "Test completes, project ends -- nobody terminates it", "color": "amber" },
    { "label": "Left running", "sublabel": "No automatic cost signal until the monthly bill", "color": "red" },
    { "label": "Charges accumulate", "sublabel": "Weeks/months of silent spend before anyone notices", "color": "slate" }
  ]
}
```

## Try it yourself (2 minutes)

If you have AWS CLI access to any account (even a free-tier sandbox), run:
```bash
aws ec2 describe-volumes --filters Name=status,Values=available \
  --query 'Volumes[*].[VolumeId,Size,CreateTime]' --output table
```
Every row is an EBS volume with no instance attached — storage you're paying for that isn't doing anything. Even a personal free-tier account often has at least one of these sitting around from a terminated instance. That's the exact "invisible until you look" problem this whole page is about, in one command.

## Right-Sizing

AWS Compute Optimizer analyses CloudWatch metrics and recommends smaller instance types. Most teams over-provision by 30-50%. CPU under 5% and memory under 20% consistently means you can downsize immediately.

Graviton (ARM-based) instances are 20-40% cheaper than equivalent x86 instances with the same performance for most workloads. Migrating is the single highest-return action for most teams.

```bash
# Find over-provisioned instances
aws compute-optimizer get-ec2-instance-recommendations \
  --filters name=Finding,values=OVER_PROVISIONED
```

## Savings Plans and Reserved Instances

```conceptgrid
{
  "boxes": [
    { "title": "On-Demand", "description": "No commitment, most expensive baseline", "color": "slate" },
    { "title": "Reserved Instances", "description": "1yr: 30-40% savings, specific type. 3yr: 50-60% savings", "color": "blue" },
    { "title": "Compute Savings Plan", "description": "Commit to $/hour, applies to any EC2/Fargate/Lambda -- most flexible", "color": "purple" },
    { "title": "Spot Instances", "description": "60-90% cheaper, can be interrupted with 2-min notice", "color": "green" }
  ]
}
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
