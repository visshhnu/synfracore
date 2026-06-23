# AWS S3 & Storage Certification Guide

## Primary Certification

**AWS Solutions Architect Associate (SAA-C03)**

*Format*: 65 questions | 130 minutes | 720/1000 | $150 USD

## Related Certifications

- AWS Developer Associate
- AWS SysOps Administrator

## Key Exam Topics

- Storage classes: Standard, Intelligent-Tiering, Standard-IA, One Zone-IA, Glacier classes
- Lifecycle policies: transition between classes, expire objects, abort multipart uploads
- Security: bucket policies, ACLs (legacy), Block Public Access, encryption (SSE-S3/KMS/C)
- Replication: CRR (cross-region) and SRR (same-region), replication rules and filters
- Performance: multipart upload (>100MB), S3 Transfer Acceleration (CloudFront edge)
- S3 Versioning: protect against accidental delete; MFA Delete for extra protection
- S3 Event Notifications: trigger Lambda, SNS, SQS on object events

## Must-Know CLI Commands

```bash
aws s3 mb s3://my-bucket --region us-east-1
aws s3 cp large-file.zip s3://my-bucket/ --sse aws:kms
aws s3 sync ./local-dir s3://my-bucket/prefix/ --delete
aws s3api put-bucket-versioning --bucket my-bucket --versioning-configuration Status=Enabled
aws s3api put-public-access-block --bucket my-bucket --public-access-block-configuration BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=true,RestrictPublicBuckets=true
```

## Exam Tips

- S3 is eventual consistent for overwrites/deletes — now fully consistent since Dec 2020
- Presigned URLs: grant temporary access without credentials (up to 12hr; 7 days via STS)
- S3 Object Lock: WORM (Write Once Read Many) for compliance
- Requester Pays: bucket owner pays storage, requester pays transfer costs

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
  Storage classes: Standard, Intelligent-Tiering, Standard-IA, One Zone-IA, Glacie
  Lifecycle policies: transition between classes, expire objects, abort multipart 
  Security: bucket policies, ACLs (legacy), Block Public Access, encryption (SSE-S
  Replication: CRR (cross-region) and SRR (same-region), replication rules and fil
```
