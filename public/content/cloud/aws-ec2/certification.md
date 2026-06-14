# AWS EC2 / AWS Certifications Guide

## AWS Certification Path

AWS certifications are the most recognized cloud credentials. Start with Practitioner, progress to Solutions Architect Associate, then specialties.

```
Foundational:    Cloud Practitioner (CLF-C02) ← start here
     ↓
Associate:       Solutions Architect (SAA-C03)  ← most popular
                 Developer (DVA-C02)
                 SysOps Administrator (SOA-C02)
     ↓
Professional:    Solutions Architect Professional (SAP-C02)
                 DevOps Engineer Professional (DOP-C02)
     ↓
Specialty:       Security, Machine Learning, Database, Networking, etc.
```

## AWS Cloud Practitioner (CLF-C02)

| Detail | Info |
|---|---|
| **Cost** | $100 USD |
| **Validity** | 3 years |
| **Format** | 65 questions, 90 minutes, multiple choice |
| **Difficulty** | Beginner — no hands-on required |

### Domain Breakdown
- **24%** Cloud Concepts (what is cloud, value proposition)
- **30%** Security & Compliance (shared responsibility, IAM, compliance)
- **17%** Cloud Technology & Services (EC2, S3, VPC, RDS, Lambda overview)
- **29%** Billing, Pricing & Support (pricing models, cost optimization, support tiers)

---

## AWS Solutions Architect Associate (SAA-C03)

| Detail | Info |
|---|---|
| **Cost** | $150 USD |
| **Validity** | 3 years |
| **Format** | 65 questions, 130 minutes, multiple choice + multi-select |
| **Difficulty** | Intermediate — requires hands-on experience |

### Domain Breakdown
- **30%** Design Resilient Architectures (multi-AZ, auto-scaling, disaster recovery)
- **28%** Design High-Performing Architectures (right service for the job, caching)
- **24%** Design Secure Architectures (IAM, encryption, network security)
- **18%** Design Cost-Optimized Architectures (right sizing, savings plans)

### Key Topics to Master
- **EC2**: instance types, pricing models (On-Demand, Reserved, Spot), placement groups
- **S3**: storage classes, lifecycle policies, Cross-Region Replication, presigned URLs
- **VPC**: subnets, route tables, NAT Gateway, VPC peering, PrivateLink
- **IAM**: policies, roles, cross-account access, SCP vs IAM
- **RDS**: Multi-AZ vs Read Replica, Aurora, backup and restore
- **Route 53**: routing policies (latency, failover, weighted, geolocation)
- **CloudFront**: distributions, origins, cache behaviors, Lambda@Edge
- **SQS/SNS**: decoupling, fan-out pattern, visibility timeout, DLQ
- **Lambda**: triggers, execution model, concurrency limits
- **Well-Architected Framework**: 6 pillars — Operational Excellence, Security, Reliability, Performance Efficiency, Cost Optimization, Sustainability

### Exam Tips
- Stephane Maarek's Udemy course is the gold standard ($13 during sale)
- Tutorial Dojo practice exams (Jon Bonso) are harder than the real exam — get comfortable with them scoring 75%+ consistently
- Read each question twice — AWS questions often have 2 "almost right" answers
- Focus on WHEN to use which service, not just what each service does
- The Well-Architected Framework is tested heavily — know all 6 pillars

### Study Resources
- **Stephane Maarek** — udemy.com (wait for $13 sale)
- **Tutorial Dojo** — tutorialsdojo.com (practice exams)
- **AWS Skill Builder** — free tier + paid practice exams
- **Adrian Cantrill** — cantrill.io (deep dive, more expensive)
