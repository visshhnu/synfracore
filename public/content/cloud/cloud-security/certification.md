# Cloud Security Certification Guide

## Primary Certification

**AWS Certified Security Specialty (SCS-C02)**

*Format*: Varies by vendor | $300-$400 USD for specialties

## Related Certifications

- Google Professional Cloud Security Engineer
- AZ-500 Azure Security
- CCSP (Cloud Security Professional)

## Key Exam Topics

- Shared responsibility model: vendor secures OF the cloud; customer secures IN the cloud
- IAM least privilege: grant minimum permissions needed; audit unused with Access Advisor
- CSPM tools: Security Hub (AWS), Defender for Cloud (Azure), Security Command Center (GCP)
- Encryption: at rest (KMS managed keys) + in transit (TLS 1.2+)
- Network security: private subnets, NACLs/NSGs, WAF, DDoS protection (Shield/Armor)
- Threat detection: GuardDuty (AWS), Microsoft Sentinel (Azure), Chronicle (GCP)
- Compliance: AWS Config/Azure Policy/GCP OrgPolicies for continuous compliance monitoring

## Must-Know CLI Commands

```bash
aws securityhub enable-security-hub --enable-default-standards
aws guardduty create-detector --enable --finding-publishing-frequency FIFTEEN_MINUTES
aws kms create-key --description "My CMK" --key-usage ENCRYPT_DECRYPT
aws kms enable-key-rotation --key-id arn:aws:kms:...
aws wafv2 list-web-acls --scope REGIONAL --region us-east-1
```

## Exam Tips

- Enable GuardDuty, Security Hub, Config in ALL regions — threats can come from any region
- S3 Block Public Access: enable account-wide as baseline, then explicitly allow if needed
- CloudTrail: enable in all regions + S3 bucket in separate account for immutable audit log
- Secrets Manager vs SSM Parameter Store: Secrets Manager for credentials (rotation built-in)

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
  Shared responsibility model: vendor secures OF the cloud; customer secures IN th
  IAM least privilege: grant minimum permissions needed; audit unused with Access 
  CSPM tools: Security Hub (AWS), Defender for Cloud (Azure), Security Command Cen
  Encryption: at rest (KMS managed keys) + in transit (TLS 1.2+)
```
