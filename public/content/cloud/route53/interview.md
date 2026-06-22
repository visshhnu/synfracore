# AWS Route 53 Interview Questions

## Core Concepts

**Q: Routing policies.**

- **Simple**: Standard DNS, one or more values
- **Weighted**: Split traffic by % (A/B testing, canary)
- **Latency**: Route to lowest-latency region for user
- **Failover**: Primary + secondary, failover when health check fails
- **Geolocation**: Route by user's country/continent (compliance, language)
- **Multi-value**: Return multiple healthy IPs

---

**Q: Health checks.**

```bash
aws route53 create-health-check \
  --health-check-config '{
    "Type": "HTTPS",
    "FullyQualifiedDomainName": "api.example.com",
    "ResourcePath": "/health",
    "RequestInterval": 30,
    "FailureThreshold": 3
  }'
```

Types: endpoint (HTTP/HTTPS/TCP), CloudWatch alarm, calculated (combine multiple).

---

**Q: Alias vs CNAME.**

| | CNAME | Alias |
|---|---|---|
| Zone apex | NO (example.com fails) | YES |
| AWS targets | Standard resolution | Auto-follows IP changes |
| Cost | Charged per query | Free for AWS resources |

```yaml
# Always use Alias for ALB, NLB, CloudFront, S3, API GW
# CNAME only for external non-AWS hostnames
```

---

**Q: Private hosted zones.**

DNS resolution within VPC only — not resolvable from internet.

```bash
aws route53 create-hosted-zone \
  --name internal.company.com \
  --vpc VPCRegion=us-east-1,VPCId=vpc-xxx
# database.internal.company.com -> 10.0.5.100 (private RDS)
```

Use for: service discovery, database/cache endpoints, microservice-to-microservice.

## Revision Notes
```
ROUTING POLICIES:
Simple: one record | Weighted: % split (A/B test)
Latency: closest region | Failover: primary/secondary
Geolocation: by country | Multi-value: multiple healthy IPs

HEALTH CHECKS:
Endpoint (HTTP/TCP) | CloudWatch alarm | Calculated (combine checks)
3 consecutive failures -> unhealthy -> failover activates

ALIAS vs CNAME:
Alias: works at zone apex, free for AWS resources, auto-follows IP changes
CNAME: not at apex, charged, for external hostnames
Use Alias for: ALB, NLB, CloudFront, S3, API GW

PRIVATE ZONES: VPC-only DNS. Service discovery. DB endpoints.
```
