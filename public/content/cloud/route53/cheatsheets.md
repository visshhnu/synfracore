# Route 53 Cheatsheet

## Core Commands
```bash
# List hosted zones
aws route53 list-hosted-zones
aws route53 list-hosted-zones-by-name --dns-name example.com

# Create hosted zone
aws route53 create-hosted-zone \
  --name example.com --caller-reference $(date +%s)

# List records in zone
aws route53 list-resource-record-sets --hosted-zone-id Z123

# Create/update record (change batch)
aws route53 change-resource-record-sets --hosted-zone-id Z123 \
  --change-batch '{
    "Changes": [{
      "Action": "UPSERT",
      "ResourceRecordSet": {
        "Name": "www.example.com",
        "Type": "A",
        "TTL": 300,
        "ResourceRecords": [{"Value": "1.2.3.4"}]
      }
    }]
  }'

# Alias record (points to AWS resource — no TTL, no charge for queries)
aws route53 change-resource-record-sets --hosted-zone-id Z123 \
  --change-batch '{
    "Changes": [{
      "Action": "UPSERT",
      "ResourceRecordSet": {
        "Name": "app.example.com",
        "Type": "A",
        "AliasTarget": {
          "HostedZoneId": "Z35SXDOTRQ7X7K",
          "DNSName": "my-alb-123.us-east-1.elb.amazonaws.com",
          "EvaluateTargetHealth": true
        }
      }
    }]
  }'

# Health check
aws route53 create-health-check \
  --caller-reference $(date +%s) \
  --health-check-config Type=HTTPS,FullyQualifiedDomainName=www.example.com,Port=443,ResourcePath=/health

aws route53 list-health-checks
aws route53 get-health-check-status --health-check-id xxx
```

## Record Types Quick Reference
| Type | Use Case | Example |
|------|----------|---------|
| A | IPv4 address | 1.2.3.4 |
| AAAA | IPv6 address | 2001:db8::1 |
| CNAME | Alias to another hostname | www → example.com |
| Alias | AWS resource alias (free) | → ALB, CloudFront, S3 |
| MX | Mail server | 10 mail.example.com |
| TXT | Text records, verification | SPF, DKIM, domain verify |
| NS | Name servers | ns-xxx.awsdns-xx.com |
| SOA | Zone authority | Created automatically |
| SRV | Service location | _sip._tcp.example.com |

## Routing Policies Summary
| Policy | Use Case | Key Feature |
|--------|----------|-------------|
| Simple | Single resource | No health checks |
| Failover | Active-passive HA | Primary/Secondary |
| Weighted | A/B testing, blue/green | % split 0-255 |
| Latency | Multi-region active-active | Lowest latency region |
| Geolocation | Compliance, localisation | User geographic location |
| Geoproximity | Custom geographic routing | Bias adjustment |
| Multivalue | Basic DNS load balancing | Up to 8 healthy records |
| IP-based | ISP or on-prem routing | CIDR-based routing |
