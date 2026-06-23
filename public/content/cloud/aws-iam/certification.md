# AWS IAM & Identity Certification Guide

## Primary Certification

**AWS Certified Security Specialty (SCS-C02)**

*Format*: 65 questions | 170 minutes | 750/1000 | $300 USD (Security Specialty)

## Related Certifications

- AWS Solutions Architect (all levels have heavy IAM)
- AWS SysOps Administrator

## Key Exam Topics

- Policy evaluation: Explicit Deny > SCP > Resource policy > Identity policy > implicit deny
- IAM condition keys: aws:SourceIp, aws:RequestedRegion, aws:MultiFactorAuthPresent
- Permission boundaries: set maximum permissions (even if identity policy allows more)
- SCP (Service Control Policies): org-level maximum permissions (cannot grant)
- IRSA and Workload Identity for EC2/Lambda/ECS/EKS service permissions
- Trust policies and cross-account access with external ID
- IAM Access Analyzer: find external/cross-account access, validate policies

## Must-Know CLI Commands

```bash
aws iam simulate-principal-policy --policy-source-arn arn:... --action-names s3:GetObject
aws iam get-account-authorization-details > iam-snapshot.json
aws iam create-role --role-name MyRole --assume-role-policy-document file://trust.json
aws sts assume-role --role-arn arn:aws:iam::123:role/MyRole --role-session-name session
aws accessanalyzer list-findings --analyzer-name my-analyzer
```

## Exam Tips

- Never use root account for daily tasks — enable MFA and create admin user
- Access keys rotate every 90 days — use IAM Access Advisor to find unused permissions
- External ID in trust policy prevents confused deputy attack (for third-party access)
- IAM roles for EC2: attach role to instance profile — no static credentials

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
PRIMARY EXAM: AWS Certified Security Specialty (SCS-C02)

TOP TOPICS:
  Policy evaluation: Explicit Deny > SCP > Resource policy > Identity policy > imp
  IAM condition keys: aws:SourceIp, aws:RequestedRegion, aws:MultiFactorAuthPresen
  Permission boundaries: set maximum permissions (even if identity policy allows m
  SCP (Service Control Policies): org-level maximum permissions (cannot grant)
```
