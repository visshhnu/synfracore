# AWS Route 53 & DNS Certification Guide

## Primary Certification

**AWS Solutions Architect Associate (SAA-C03)**

*Format*: 65 questions | 130 minutes | 720/1000 | $150 USD *(needs verification — exam format/pricing changes over time, check the current AWS Certification page before relying on these numbers)*

## Related Certifications

- AWS Advanced Networking Specialty
- AWS SysOps Administrator

## Key Exam Topics

- Routing policies: Simple, Weighted, Latency, Failover, Geolocation, Multi-value, IP-based
- Alias records: free, for AWS resources, works at zone apex (example.com)
- CNAME: not at zone apex; small charge; for non-AWS external domains
- Health checks: endpoint (HTTP/HTTPS/TCP), CloudWatch alarm, calculated
- Private hosted zones: internal DNS for VPC; must enable DNS resolution + hostnames
- DNS failover: primary/secondary with health check; Route 53 removes unhealthy records
- Traffic flow: visual editor for complex routing policies with geoproximity

## Must-Know CLI Commands

```bash
aws route53 list-hosted-zones
aws route53 list-resource-record-sets --hosted-zone-id ZXXXXX
aws route53 change-resource-record-sets --hosted-zone-id ZXXXXX --change-batch file://change.json
aws route53 create-health-check --caller-reference unique123 --health-check-config Type=HTTPS,FullyQualifiedDomainName=api.example.com,Port=443,ResourcePath=/health
aws route53 test-dns-answer --hosted-zone-id ZXXXXX --record-name api.example.com --record-type A
```

## Exam Tips

- Alias: auto-updates IP if ELB/CloudFront IP changes; no TTL charge
- Health check: Route 53 checks from multiple global health-checker locations and requires a majority to agree before marking an endpoint unhealthy *(needs verification — the exact number of checker locations and majority threshold are documented specifics that change; check the current Route 53 health checks documentation rather than relying on a fixed count)*
- Geolocation: most specific match wins (city > country > continent > default)
- Weighted routing: weight=0 means no traffic (can keep record for testing)

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
  Routing policies: Simple, Weighted, Latency, Failover, Geolocation, Multi-value,
  Alias records: free, for AWS resources, works at zone apex (example.com)
  CNAME: not at zone apex; small charge; for non-AWS external domains
  Health checks: endpoint (HTTP/HTTPS/TCP), CloudWatch alarm, calculated
```
