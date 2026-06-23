# Cloud Cost Optimisation (FinOps) Certification Guide

## Primary Certification

**FinOps Certified Practitioner (FOCP — finops.org)**

*Format*: 50 questions | 90 minutes | 70% passing | $300 USD (FOCP)

## Related Certifications

- AWS Certified Cloud Practitioner (cost basics)
- AWS Solutions Architect (Well-Architected cost pillar)

## Key Exam Topics

- FinOps lifecycle: Inform (visibility) → Optimize (action) → Operate (efficiency culture)
- Commitment discounts: Reserved Instances vs Savings Plans vs CUDs (GCP) — trade flexibility for savings
- Right-sizing: match resource size to actual usage; use AWS Compute Optimizer recommendations
- Spot/Preemptible/Spot VMs: 60-90% savings for fault-tolerant workloads
- Tagging strategy: consistent cost allocation tags → accurate showback/chargeback
- Storage lifecycle: move data to cheaper tiers automatically (S3 IA, Glacier, Archive)
- FinOps team model: centralized cloud COE → distributed practitioners → federated hybrid

## Must-Know CLI Commands

```bash
aws ce get-cost-and-usage --time-period Start=2024-01-01,End=2024-01-31 --granularity MONTHLY --metrics BlendedCost --group-by Type=DIMENSION,Key=SERVICE
aws compute-optimizer get-ec2-instance-recommendations --filters Name=Finding,Values=NotOptimized
aws ec2 describe-volumes --filters Name=status,Values=available  # Unattached EBS = waste
aws ec2 describe-addresses --filters Name=association-id,Values=*  # Check unassociated EIPs
aws ce get-savings-plans-purchase-recommendation --savings-plans-type COMPUTE_SP --term-in-years ONE_YEAR --payment-option NO_UPFRONT
```

## Exam Tips

- Quick wins: delete unattached EBS, release unused EIPs, terminate idle EC2 (often 20-40% savings)
- Savings Plans vs Reserved: Savings Plans more flexible (any instance family/region for Compute SP)
- Auto-shutdown dev environments: scale to 0 at night/weekends = save 67% compute costs
- Cost anomaly detection: AWS Cost Anomaly Detection alerts on unusual spend spikes

## Study Plan

**Week 1-2**: Read official docs + overview/fundamentals sections in this platform
**Week 3-4**: Hands-on labs (AWS free tier / Azure sandbox / GCP free tier)
**Week 5**: Practice exams (TutorialsDojo, ExamTopics, Whizlabs)
**Final days**: Review weak areas + cheatsheet

## Free Study Resources

- AWS: aws.amazon.com/training — free digital courses
- Azure: learn.microsoft.com — Microsoft Learn (free + sandbox labs)
- GCP: cloud.google.com/training — free courses + Qwiklabs credits
- TutorialsDojo: cheat sheets for all exams (best value paid resource)

## Revision Notes
```
PRIMARY EXAM: FinOps Certified Practitioner (FOCP — finops.org)

TOP TOPICS:
  FinOps lifecycle: Inform (visibility) → Optimize (action) → Operate (efficiency 
  Commitment discounts: Reserved Instances vs Savings Plans vs CUDs (GCP) — trade 
  Right-sizing: match resource size to actual usage; use AWS Compute Optimizer rec
  Spot/Preemptible/Spot VMs: 60-90% savings for fault-tolerant workloads
```
