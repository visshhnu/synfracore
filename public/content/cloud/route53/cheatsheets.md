# Route53 — Cheatsheet

```bash
# ── HOSTED ZONES ──────────────────────────────────────────
aws route53 list-hosted-zones --output table
aws route53 get-hosted-zone --id /hostedzone/ZXXXXX
aws route53 list-resource-record-sets --hosted-zone-id ZXXXXX

# ── UPSERT RECORD ─────────────────────────────────────────
aws route53 change-resource-record-sets --hosted-zone-id $ZONE \
  --change-batch '{
    "Changes": [{"Action":"UPSERT","ResourceRecordSet":{
      "Name":"api.example.com",
      "Type":"A",
      "TTL":300,
      "ResourceRecords":[{"Value":"203.0.113.1"}]
    }}]
  }'

# ── ALIAS RECORD (AWS resources) ──────────────────────────
aws route53 change-resource-record-sets --hosted-zone-id $ZONE \
  --change-batch '{
    "Changes": [{"Action":"UPSERT","ResourceRecordSet":{
      "Name":"example.com","Type":"A",
      "AliasTarget":{
        "HostedZoneId":"Z1234",
        "DNSName":"my-alb.ap-south-1.elb.amazonaws.com",
        "EvaluateTargetHealth":true
      }
    }}]
  }'

# ── HEALTH CHECKS ─────────────────────────────────────────
aws route53 list-health-checks
aws route53 get-health-check --health-check-id $HC_ID
aws route53 get-health-check-status --health-check-id $HC_ID

# ── QUERY LOGS ────────────────────────────────────────────
aws route53resolver list-resolver-query-log-configs
aws route53 create-query-logging-config \
  --hosted-zone-id $ZONE \
  --cloud-watch-logs-log-group-arn arn:aws:logs:us-east-1:ACCT:log-group:/aws/route53/queries

# ── TRAFFIC POLICIES ──────────────────────────────────────
aws route53 list-traffic-policies
aws route53 create-traffic-policy --name my-policy --document file://policy.json

# ── DNS DEBUGGING ─────────────────────────────────────────
dig api.example.com @8.8.8.8
dig +trace api.example.com
dig api.example.com TXT   # SPF/DKIM records
nslookup api.example.com

# Route53 record types:
# A: IPv4 | AAAA: IPv6 | CNAME: alias | MX: mail
# TXT: text | NS: nameservers | SOA: zone info
# SRV: service | CAA: certificate authority
# PTR: reverse DNS
```
