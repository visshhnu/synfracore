# Route53 — Advanced

## DNS Failover Architecture

```
Multi-region active-passive failover:

Primary Region (ap-south-1)
  ├── ALB → ECS/EKS workloads
  ├── Route53 Health Check → monitors /health endpoint
  └── Failover record type: PRIMARY

Secondary Region (us-east-1)
  ├── ALB → Standby workloads (smaller scale)
  ├── Route53 Health Check → monitors /health endpoint
  └── Failover record type: SECONDARY (only receives traffic when PRIMARY fails)

Route53 checks health every 30s
If PRIMARY fails 3 consecutive checks → DNS switches to SECONDARY
TTL should be low (30-60s) for fast failover
```

## Traffic Flow Policies (Visual Editor)

Route53 Traffic Flow lets you build complex routing logic with a visual editor:
- Combine multiple routing policies
- Route by geolocation → then by latency within region → then failover
- Saves as a policy version (rollback capability)
- Applied via Traffic Policy Records

## Route53 Resolver (Hybrid DNS)

```bash
# Route53 Resolver: forward DNS queries between on-prem and AWS

# Inbound endpoint: on-prem can query AWS private hosted zones
aws route53resolver create-resolver-endpoint \
  --creator-request-id "inbound-$(date +%s)" \
  --name inbound-endpoint \
  --security-group-ids $SG_ID \
  --direction INBOUND \
  --ip-addresses SubnetId=$SUBNET_A SubnetId=$SUBNET_B

# Outbound endpoint: AWS queries on-prem DNS
aws route53resolver create-resolver-endpoint \
  --name outbound-endpoint \
  --direction OUTBOUND \
  --ip-addresses SubnetId=$SUBNET_A SubnetId=$SUBNET_B \
  --security-group-ids $SG_ID

# Forward rule: send .corp.internal queries to on-prem DNS
aws route53resolver create-resolver-rule \
  --creator-request-id "rule-$(date +%s)" \
  --name forward-corp \
  --rule-type FORWARD \
  --domain-name "corp.internal" \
  --resolver-endpoint-id $OUTBOUND_ENDPOINT_ID \
  --target-ips "Ip=10.0.1.53,Port=53"
```
