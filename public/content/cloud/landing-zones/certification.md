# Cloud Landing Zones & Governance Certification Guide

## Primary Certification

**AWS Solutions Architect Professional (SAP-C02)**

*Format*: 75 questions | 180 minutes | 750/1000 | $300 USD (AWS SAP)

## Related Certifications

- AZ-305 Azure Solutions Architect Expert
- Google Professional Cloud Architect

## Key Exam Topics

- Landing zone: secure, scalable multi-account AWS/Azure/GCP foundation
- AWS Organizations: OU structure, SCPs (deny = preventive guardrail), consolidated billing
- Account vending: automate account creation with pre-configured baselines (Control Tower)
- Network architecture: hub-spoke with Transit Gateway, centralized egress, Direct Connect hub
- Security baseline: GuardDuty + Security Hub + Config + CloudTrail in all accounts/regions
- Identity: AWS SSO/IAM Identity Center for centralized access to multiple accounts
- Guardrails: preventive (SCPs block actions) vs detective (Config Rules detect violations)

## Must-Know CLI Commands

```bash
aws organizations list-accounts
aws organizations create-organizational-unit --parent-id r-xxxx --name Production
aws organizations create-policy --name deny-region --type SERVICE_CONTROL_POLICY --content file://scp.json
aws organizations attach-policy --policy-id p-xxxx --target-id ou-xxxx
aws controltower list-landing-zones  # If using Control Tower
```

## Exam Tips

- Control Tower: AWS-managed landing zone service; automates OU creation, SCPs, account factory
- Recommended OU structure: Security + Infrastructure + Workloads + Sandbox + Suspended
- Log archive account: S3 bucket with immutable object lock for audit logs
- Break-glass procedure: emergency root access process (document + alert on use)

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
PRIMARY EXAM: AWS Solutions Architect Professional (SAP-C02)

TOP TOPICS:
  Landing zone: secure, scalable multi-account AWS/Azure/GCP foundation
  AWS Organizations: OU structure, SCPs (deny = preventive guardrail), consolidate
  Account vending: automate account creation with pre-configured baselines (Contro
  Network architecture: hub-spoke with Transit Gateway, centralized egress, Direct
```
