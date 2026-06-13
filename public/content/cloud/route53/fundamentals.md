# AWS Route53 — DNS and Traffic Management

## Core Concepts

```
Route53 is AWS's DNS service + health checking + traffic routing

Record types:
  A:     Domain → IPv4 (192.0.2.1)
  AAAA:  Domain → IPv6
  CNAME: Domain → another domain (can't use for zone apex!)
  ALIAS: Like CNAME but works at apex (api.example.com → ALB)
  MX:    Mail exchange servers
  TXT:   SPF, DKIM, domain verification
  NS:    Nameservers (auto-managed by Route53)
  SOA:   Start of Authority (auto-managed)
```

## Create Records with Terraform

```hcl
resource "aws_route53_zone" "main" {
  name = "example.com"
}

# A record pointing to EC2
resource "aws_route53_record" "www" {
  zone_id = aws_route53_zone.main.zone_id
  name    = "www.example.com"
  type    = "A"
  ttl     = 300
  records = ["203.0.113.1"]
}

# ALIAS record for ALB (no TTL needed — AWS-managed)
resource "aws_route53_record" "api" {
  zone_id = aws_route53_zone.main.zone_id
  name    = "api.example.com"
  type    = "A"

  alias {
    name                   = aws_lb.main.dns_name
    zone_id                = aws_lb.main.zone_id
    evaluate_target_health = true
  }
}

# Weighted routing — split traffic 90/10
resource "aws_route53_record" "blue" {
  zone_id = aws_route53_zone.main.zone_id
  name    = "app.example.com"
  type    = "A"
  set_identifier = "blue"
  weighted_routing_policy { weight = 90 }
  alias { name = aws_lb.blue.dns_name; zone_id = aws_lb.blue.zone_id; evaluate_target_health = true }
}

resource "aws_route53_record" "green" {
  zone_id = aws_route53_zone.main.zone_id
  name    = "app.example.com"
  type    = "A"
  set_identifier = "green"
  weighted_routing_policy { weight = 10 }
  alias { name = aws_lb.green.dns_name; zone_id = aws_lb.green.zone_id; evaluate_target_health = true }
}
```

## Routing Policies

```
Simple:         Single record, all traffic goes there
Weighted:       Split traffic % between endpoints (A/B, canary deploys)
Latency-based:  Route to lowest-latency region for the user
Geolocation:    Route India traffic to ap-south-1, US to us-east-1
Geoproximity:   Route by distance, with bias adjustment
Failover:       Active/passive — primary unless health check fails
Multi-value:    Return multiple healthy IPs (basic load balancing)
```

## Route53 Cheatsheet

```bash
# ── CLI OPERATIONS ────────────────────────────────────────
aws route53 list-hosted-zones
aws route53 get-hosted-zone --id /hostedzone/ZXXXXX

# Create record (JSON change batch)
aws route53 change-resource-record-sets \
    --hosted-zone-id /hostedzone/ZXXXXX \
    --change-batch '{
        "Changes": [{
            "Action": "UPSERT",
            "ResourceRecordSet": {
                "Name": "api.example.com",
                "Type": "A",
                "TTL": 300,
                "ResourceRecords": [{"Value": "203.0.113.1"}]
            }
        }]
    }'

# Health checks
aws route53 create-health-check \
    --caller-reference "check-$(date +%s)" \
    --health-check-config '{
        "IPAddress": "203.0.113.1",
        "Port": 443, "Type": "HTTPS",
        "ResourcePath": "/health",
        "FullyQualifiedDomainName": "api.example.com",
        "RequestInterval": 30,
        "FailureThreshold": 3
    }'

aws route53 list-health-checks
aws route53 get-health-check-status --health-check-id XXXX

# DNS debugging
dig api.example.com @8.8.8.8
dig +trace api.example.com
nslookup api.example.com
```
