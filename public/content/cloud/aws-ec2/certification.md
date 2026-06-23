# AWS EC2 & Compute Certification Guide

## Primary Certification

**AWS Solutions Architect Associate (SAA-C03)**

*Format*: 65 questions | 130 minutes | 720/1000 | $150 USD

## Related Certifications

- AWS SysOps Administrator Associate (SOA-C02)
- AWS DevOps Engineer Professional (DOP-C02)

## Key Exam Topics

- Instance types (t/m/c/r/i/g families) and right-sizing
- Purchasing options: On-Demand, Spot, Reserved, Savings Plans
- Auto Scaling Groups: policies, lifecycle hooks, health checks
- AMI creation, Image Builder, cross-region copy
- Placement groups: Cluster, Spread, Partition — use cases
- EC2 networking: ENI, security groups, placement, EBS vs instance store
- Instance connect, SSM Session Manager (no SSH key needed)

## Must-Know CLI Commands

```bash
aws ec2 describe-instances --filters Name=instance-state-name,Values=running
aws ec2 start-instances --instance-ids i-xxx
aws ec2 stop-instances --instance-ids i-xxx
aws ec2 create-image --instance-id i-xxx --name "MyAMI"
aws ec2 describe-instance-types --filters Name=vcpu-info.default-vcpus,Values=4
```

## Exam Tips

- Know T instance CPU credits — T3 Unlimited eliminates credit worry
- Spot: 2-minute interruption notice via instance metadata
- Reserved Instance: OS + instance family + region must match for discount
- Savings Plans: flexible (commit to $/hr compute spend, any family/region)

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
PRIMARY EXAM: AWS Solutions Architect Associate (SAA-C03)

TOP TOPICS:
  Instance types (t/m/c/r/i/g families) and right-sizing
  Purchasing options: On-Demand, Spot, Reserved, Savings Plans
  Auto Scaling Groups: policies, lifecycle hooks, health checks
  AMI creation, Image Builder, cross-region copy
```
