# Route53 — Intermediate

## Health Checks

```bash
# Create HTTP health check
aws route53 create-health-check \
  --caller-reference "hc-$(date +%s)" \
  --health-check-config '{
    "Type": "HTTPS",
    "FullyQualifiedDomainName": "api.example.com",
    "Port": 443,
    "ResourcePath": "/health",
    "RequestInterval": 30,
    "FailureThreshold": 3,
    "EnableSNI": true
  }'

# CloudWatch alarm on health check
aws cloudwatch put-metric-alarm \
  --alarm-name api-health \
  --namespace AWS/Route53 \
  --metric-name HealthCheckStatus \
  --dimensions Name=HealthCheckId,Value=$HEALTH_CHECK_ID \
  --comparison-operator LessThanThreshold \
  --threshold 1 --evaluation-periods 1 --period 60 \
  --statistic Minimum --alarm-actions $SNS_ARN
```

## Routing Policies

```bash
# Weighted routing — A/B testing, canary deployments
aws route53 change-resource-record-sets --hosted-zone-id $ZONE \
  --change-batch '{
    "Changes": [
      {"Action":"UPSERT","ResourceRecordSet":{
        "Name":"api.example.com","Type":"A",
        "SetIdentifier":"blue","Weight":90,
        "AliasTarget":{"DNSName":"blue-alb.amazonaws.com","EvaluateTargetHealth":true,"HostedZoneId":"Z1234"}
      }},
      {"Action":"UPSERT","ResourceRecordSet":{
        "Name":"api.example.com","Type":"A",
        "SetIdentifier":"green","Weight":10,
        "AliasTarget":{"DNSName":"green-alb.amazonaws.com","EvaluateTargetHealth":true,"HostedZoneId":"Z1234"}
      }}
    ]
  }'

# Latency-based — route to lowest latency region
aws route53 change-resource-record-sets --hosted-zone-id $ZONE \
  --change-batch '{
    "Changes": [{"Action":"UPSERT","ResourceRecordSet":{
      "Name":"api.example.com","Type":"A",
      "SetIdentifier":"ap-south-1","Region":"ap-south-1",
      "AliasTarget":{"DNSName":"ap-alb.amazonaws.com","EvaluateTargetHealth":true,"HostedZoneId":"Z1234"}
    }}]
  }'

# Failover — active/passive
aws route53 change-resource-record-sets --hosted-zone-id $ZONE \
  --change-batch '{
    "Changes": [{"Action":"UPSERT","ResourceRecordSet":{
      "Name":"api.example.com","Type":"A","SetIdentifier":"primary",
      "Failover":"PRIMARY","HealthCheckId":"$HEALTH_CHECK_ID",
      "AliasTarget":{"DNSName":"primary-alb.amazonaws.com","EvaluateTargetHealth":true,"HostedZoneId":"Z1234"}
    }}]
  }'
```

## Private Hosted Zones

```bash
# Create private zone (internal DNS)
aws route53 create-hosted-zone \
  --name internal.company.com \
  --caller-reference "$(date +%s)" \
  --hosted-zone-config "Comment=Internal DNS,PrivateZone=true" \
  --vpc "VPCRegion=ap-south-1,VPCId=vpc-123"

# Associate with additional VPCs
aws route53 associate-vpc-with-hosted-zone \
  --hosted-zone-id $ZONE_ID \
  --vpc "VPCRegion=ap-south-1,VPCId=vpc-456"
```
