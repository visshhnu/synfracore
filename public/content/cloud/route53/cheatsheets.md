# AWS Route 53 Quick Reference

## CLI Commands
```bash
# List hosted zones
aws route53 list-hosted-zones
aws route53 get-hosted-zone --id /hostedzone/ZXXXXX

# List records
aws route53 list-resource-record-sets --hosted-zone-id ZXXXXX

# Create/update record
aws route53 change-resource-record-sets --hosted-zone-id ZXXXXX \
  --change-batch '{
    "Changes": [{
      "Action": "UPSERT",
      "ResourceRecordSet": {
        "Name": "api.example.com",
        "Type": "A",
        "TTL": 300,
        "ResourceRecords": [{"Value": "1.2.3.4"}]
      }
    }]
  }'

# Alias record (for ALB/CloudFront/S3)
# Use AliasTarget instead of ResourceRecords

# Health checks
aws route53 create-health-check --caller-reference unique-id \
  --health-check-config '{
    "Type": "HTTPS",
    "FullyQualifiedDomainName": "api.example.com",
    "ResourcePath": "/health",
    "RequestInterval": 30,
    "FailureThreshold": 3
  }'
aws route53 list-health-checks
```

## Routing Policies Reference
```
Simple:      Single value or multiple values (random selection)
Weighted:    Traffic split by % (A/B test: 90/10)
Latency:     Route to lowest-latency region (multi-region apps)
Failover:    Primary/secondary with health check (DR pattern)
Geolocation: Route by continent/country (compliance, language)
Multi-value: Up to 8 healthy records (basic load distribution)

ALIAS vs CNAME:
  Alias:  works at zone apex (example.com) | free for AWS targets
         auto-follows IP changes | ELB/CloudFront/S3/API GW
  CNAME:  not at zone apex | charged | external domains only

TTL guidance:
  High TTL (86400): stable records, less DNS queries
  Low TTL (60):     pre-migration, failover scenarios
  During migration: lower TTL 48hr before, then switch, then raise
```
