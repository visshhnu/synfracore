# Route 53 Advanced Topics

## Advanced Routing Policies

```
LATENCY-BASED ROUTING:
  Route to region with lowest latency for the user
  Based on AWS latency measurements between regions (not user-calculated)
  Use case: multi-region active-active applications
  
  aws route53 change-resource-record-sets --hosted-zone-id Z123 \
    --change-batch '{
      "Changes": [{
        "Action": "CREATE",
        "ResourceRecordSet": {
          "Name": "api.example.com",
          "Type": "A",
          "SetIdentifier": "us-east-1",
          "Region": "us-east-1",
          "TTL": 60,
          "ResourceRecords": [{"Value": "1.2.3.4"}]
        }
      }]
    }'

GEOLOCATION ROUTING:
  Route based on user's geographic location
  Hierarchy: continent → country → state (US only)
  Default record: catch-all for locations not specifically configured
  Different from latency: you decide routing, not AWS latency measurements
  Use case: GDPR compliance (route EU users to EU), language-specific content

GEOPROXIMITY ROUTING:
  Route based on geographic proximity with optional bias
  Bias +: expand the region's coverage area
  Bias -: shrink the region's coverage area
  Requires Traffic Flow (visual policy editor in console)

MULTIVALUE ANSWER ROUTING:
  Returns up to 8 healthy records
  Each record has health check attached
  DNS-level basic load balancing (NOT replacement for ELB)
  Client picks from returned records

WEIGHTED ROUTING:
  Route % of traffic to different resources
  Weight 0-255; proportional distribution
  Use case: blue/green deployment (shift traffic gradually)
  Example: 90% to v1 (weight=90), 10% to v2 (weight=10)
```

## Private Hosted Zones

```bash
# Create private hosted zone (VPC-only DNS)
aws route53 create-hosted-zone \
  --name internal.company.com \
  --caller-reference 2025-06-24 \
  --hosted-zone-config Comment="Internal DNS",PrivateZone=true \
  --vpc VPCRegion=us-east-1,VPCId=vpc-xxxx

# Associate additional VPCs
aws route53 associate-vpc-with-hosted-zone \
  --hosted-zone-id Z123 \
  --vpc VPCRegion=us-west-2,VPCId=vpc-yyyy

# Split-view DNS:
# Same domain (example.com) resolves differently inside vs outside VPC
# Private zone: resolves to private IPs (internal traffic)
# Public zone: resolves to public IPs (internet traffic)

# Resolver inbound endpoint (on-prem → Route 53)
aws route53resolver create-resolver-endpoint \
  --creator-request-id myEndpoint \
  --security-group-ids sg-xxxx \
  --direction INBOUND \
  --ip-addresses SubnetId=subnet-xxx,Ip=10.0.1.10 SubnetId=subnet-yyy,Ip=10.0.2.10

# Resolver outbound endpoint (Route 53 → on-prem DNS)
aws route53resolver create-resolver-endpoint \
  --creator-request-id myOutbound \
  --security-group-ids sg-xxxx \
  --direction OUTBOUND \
  --ip-addresses SubnetId=subnet-xxx SubnetId=subnet-yyy
```

## DNSSEC

```bash
# Enable DNSSEC signing for hosted zone
aws route53 enable-hosted-zone-dnssec --hosted-zone-id Z123

# Create key signing key (KSK) using CMK in KMS
aws route53 create-key-signing-key \
  --hosted-zone-id Z123 \
  --key-management-service-arn arn:aws:kms:us-east-1:123456789:key/my-key \
  --name myKSK --status ACTIVE --caller-reference 2025-06-24

# Activate DNSSEC signing
aws route53 activate-key-signing-key \
  --hosted-zone-id Z123 --name myKSK
```

## Study Resources
- **AWS SAA-C03 / ANS-C01 Route 53 content** — routing policies frequently tested
- **AWS Route 53 documentation** — health checks, routing policies, Resolver
- **Route 53 Resolver for hybrid DNS** (aws.amazon.com/route53/faqs) — on-prem integration
- **DNS and BIND** (O'Reilly) — deep dive into DNS concepts
