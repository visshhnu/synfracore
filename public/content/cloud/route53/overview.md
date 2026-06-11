# AWS Route 53 — DNS and Traffic Management

Route 53 is AWS's highly available DNS service. It handles domain registration, DNS resolution, health checks, and sophisticated traffic routing policies used in production high-availability architectures.

## Core Concepts

```
Hosted Zone: Container for DNS records for a domain
  Public: Resolves on the internet
  Private: Resolves only within VPCs

Record Types:
  A:     hostname → IPv4 (most common)
  AAAA:  hostname → IPv6
  CNAME: alias → canonical name (cannot be used for root domain)
  ALIAS: AWS extension — maps root domain to AWS resources
         Points to: ELB, CloudFront, S3, API Gateway
         Unlike CNAME: Works for root domain (apex records)
  MX:    Mail server records
  TXT:   Verification, SPF, DKIM records
  NS:    Name servers for zone
  SOA:   Start of Authority — zone metadata
```

## Routing Policies

```yaml
# 1. Simple Routing — single resource
simple-record:
  Name: api.example.com
  Type: A
  Value: 1.2.3.4

# 2. Weighted — split traffic by percentage
weighted-a:
  Name: api.example.com
  Type: A
  Value: 1.2.3.4  # Production
  Weight: 90      # 90% of traffic

weighted-b:
  Name: api.example.com  
  Type: A
  Value: 5.6.7.8  # Canary
  Weight: 10      # 10% of traffic
  # Use for: A/B testing, canary deployments

# 3. Latency — route to lowest latency region
latency-us:
  Name: api.example.com
  Type: A
  Region: us-east-1
  Value: 1.2.3.4  # US Load Balancer

latency-ap:
  Name: api.example.com
  Type: A
  Region: ap-south-1
  Value: 5.6.7.8  # India Load Balancer
  # User in India → automatically routes to ap-south-1

# 4. Failover — primary/secondary
primary:
  Name: api.example.com
  Type: A
  Failover: PRIMARY
  HealthCheckId: hc-12345
  Value: 1.2.3.4  # Primary region

secondary:
  Name: api.example.com
  Type: A
  Failover: SECONDARY
  Value: 5.6.7.8  # DR region
  # Primary unhealthy → automatically serves secondary

# 5. Geolocation — route by country/continent
geo-india:
  Name: api.example.com
  Type: A
  GeoLocation:
    CountryCode: IN
  Value: <india-endpoint>

geo-default:
  Name: api.example.com
  Type: A
  GeoLocation:
    CountryCode: "*"  # All other locations
  Value: <global-endpoint>

# 6. Multi-value — return multiple IPs, health-checked
# Route 53 returns up to 8 healthy IPs
# Client-side load balancing

# 7. IP-based — route based on client IP CIDR
# For: ISP-based routing, corporate network routing
```

## Health Checks

```
Types of health checks:
  Endpoint: HTTP/HTTPS/TCP check to your service
  Calculated: Combine multiple health checks (AND/OR logic)
  CloudWatch Alarm: Trigger based on metrics

Endpoint health check:
  Protocol: HTTP | HTTPS | TCP
  Port: 80 | 443 | custom
  Path: /health (your health endpoint)
  Check interval: 30s (standard) or 10s (fast, extra cost)
  Failure threshold: 3 (consecutive failures before unhealthy)
  
Health check regions: Route 53 checks from multiple AWS regions
  For private resources: Use CloudWatch metric health check

Integration with routing:
  Failover routing: Primary fails → automatic failover
  Weighted routing: Unhealthy target removed from rotation
  Latency routing: Unhealthy region removed
  
SNS notifications: Get alerted when endpoints become unhealthy
```

## Terraform Example

```hcl
resource "aws_route53_zone" "main" {
  name = "example.com"
}

# Simple A record
resource "aws_route53_record" "www" {
  zone_id = aws_route53_zone.main.zone_id
  name    = "www.example.com"
  type    = "A"
  ttl     = 300
  records = ["1.2.3.4"]
}

# ALIAS record for ELB (no TTL for alias records)
resource "aws_route53_record" "apex" {
  zone_id = aws_route53_zone.main.zone_id
  name    = "example.com"  # Root domain
  type    = "A"
  alias {
    name                   = aws_lb.main.dns_name
    zone_id                = aws_lb.main.zone_id
    evaluate_target_health = true
  }
}

# Failover routing
resource "aws_route53_health_check" "primary" {
  fqdn              = "api-primary.example.com"
  port              = 443
  type              = "HTTPS"
  resource_path     = "/health"
  failure_threshold = 3
  request_interval  = 30
}

resource "aws_route53_record" "primary" {
  zone_id         = aws_route53_zone.main.zone_id
  name            = "api.example.com"
  type            = "A"
  set_identifier  = "primary"
  health_check_id = aws_route53_health_check.primary.id
  failover_routing_policy {
    type = "PRIMARY"
  }
  records = ["1.2.3.4"]
  ttl     = 60
}
```

## Common Patterns

```
Blue-Green deployment with weighted routing:
  Start: Blue 100%, Green 0%
  After deploy: Blue 90%, Green 10%
  Validate: Blue 50%, Green 50%
  Complete: Blue 0%, Green 100%
  Rollback: Instantly shift weight back to Blue

Low TTL for deployments:
  Normally use TTL 300-3600s (DNS caching)
  Before deployment: Lower TTL to 60s (changes propagate faster)
  After deployment: Restore high TTL (reduce Route 53 queries)
  
Private hosted zone for internal services:
  service.internal → private IPs
  Multiple VPCs can share same private zone
  No public DNS exposure
```
