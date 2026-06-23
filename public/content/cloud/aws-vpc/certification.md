# AWS VPC & Networking Certification Guide

## Primary Certification

**AWS Advanced Networking Specialty (ANS-C01)**

*Format*: 65 questions | 170 minutes | 750/1000 | $300 USD (Advanced Networking)

## Related Certifications

- AWS Solutions Architect Associate (VPC is 20-25% of exam)
- AWS SysOps

## Key Exam Topics

- VPC architecture: subnets (public/private), route tables, IGW, NAT Gateway
- Security Groups (stateful) vs NACLs (stateless, subnet-level, ordered rules)
- VPC Peering: non-transitive, no overlapping CIDR, cross-region/account supported
- Transit Gateway: hub-and-spoke for many VPCs; replaces complex peering mesh
- VPC Endpoints: Gateway (S3/DynamoDB, free) vs Interface (PrivateLink, per-hour cost)
- Direct Connect: dedicated network connection (1G, 10G, 100G), lower latency than VPN
- VPN: site-to-site (IPSec over internet) or Client VPN (OpenVPN to remote workers)

## Must-Know CLI Commands

```bash
aws ec2 create-vpc --cidr-block 10.0.0.0/16 --tag-specifications "ResourceType=vpc,Tags=[{Key=Name,Value=MyVPC}]"
aws ec2 create-subnet --vpc-id vpc-xxx --cidr-block 10.0.1.0/24 --availability-zone us-east-1a
aws ec2 create-nat-gateway --subnet-id subnet-xxx --allocation-id eipalloc-xxx
aws ec2 create-vpc-endpoint --vpc-id vpc-xxx --service-name com.amazonaws.us-east-1.s3 --vpc-endpoint-type Gateway
aws ec2 describe-flow-logs
```

## Exam Tips

- VPC Peering: must update BOTH route tables; /32 routes to peer VPC resources
- Transit Gateway: single point; can share across accounts via RAM
- NAT Gateway: per-AZ for HA; $35+/month + data processing charges
- VPC Flow Logs: capture IP traffic metadata (not payload); send to S3 or CloudWatch

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
PRIMARY EXAM: AWS Advanced Networking Specialty (ANS-C01)

TOP TOPICS:
  VPC architecture: subnets (public/private), route tables, IGW, NAT Gateway
  Security Groups (stateful) vs NACLs (stateless, subnet-level, ordered rules)
  VPC Peering: non-transitive, no overlapping CIDR, cross-region/account supported
  Transit Gateway: hub-and-spoke for many VPCs; replaces complex peering mesh
```
