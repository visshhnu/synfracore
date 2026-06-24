# Cloud Cost Optimization Cheatsheet

## AWS Cost Commands
```bash
# Current month spend by service
aws ce get-cost-and-usage \
  --time-period Start=2025-06-01,End=2025-06-30 \
  --granularity MONTHLY \
  --metrics BlendedCost \
  --group-by Type=DIMENSION,Key=SERVICE

# Cost by tag
aws ce get-cost-and-usage \
  --time-period Start=2025-06-01,End=2025-06-30 \
  --granularity DAILY --metrics BlendedCost \
  --group-by Type=TAG,Key=Environment

# Rightsizing recommendations
aws ce get-rightsizing-recommendation --service EC2

# Reserved Instance utilisation
aws ce get-reservation-utilization \
  --time-period Start=2025-05-01,End=2025-06-01

# Savings Plans recommendations
aws ce get-savings-plans-purchase-recommendation \
  --savings-plans-type COMPUTE_SP \
  --term-in-years ONE_YEAR --payment-option NO_UPFRONT

# Identify unused EBS volumes
aws ec2 describe-volumes \
  --filters Name=status,Values=available \
  --query 'Volumes[].{ID:VolumeId,Size:Size,State:State}'

# List unattached Elastic IPs
aws ec2 describe-addresses \
  --query 'Addresses[?!InstanceId].PublicIp'
```

## Azure Cost Commands
```bash
# Cost by resource group
az consumption usage list \
  --start-date 2025-06-01 --end-date 2025-06-30 \
  --query "[].{ResourceGroup:resourceGroup,Cost:pretaxCost,Currency:currency}" \
  --output table

# Advisor cost recommendations
az advisor recommendation list --category Cost

# Identify unattached disks
az disk list --query "[?diskState=='Unattached'].{Name:name,Size:diskSizeGb,RG:resourceGroup}"

# Identify unused public IPs
az network public-ip list --query "[?ipAddress==null].{Name:name,RG:resourceGroup}"
```

## Key Optimization Strategies
| Strategy | Savings | Effort |
|----------|---------|--------|
| Delete unused resources (idle EC2, unattached disks) | 10-30% | Low |
| Rightsize oversized instances | 15-40% | Medium |
| Reserved Instances / Savings Plans / Committed Use | 30-72% | Low (1-3yr commit) |
| Spot/Preemptible/Spot VMs for fault-tolerant workloads | 60-90% | High |
| Auto-scaling (scale in during low demand) | 20-50% | Medium |
| S3/Blob lifecycle policies (move to cold storage) | 50-70% on cold data | Low |
| Scheduled start/stop (dev/test environments) | 60-70% on non-prod | Low |
| Data transfer optimization (same-region, CloudFront) | Variable | Medium |
| Graviton/Arm instances (AWS) — 20% better price/perf | 20% | Low |

## Quick Wins Checklist
```
☐ Enable Cost Explorer / Azure Cost Management / GCP Billing
☐ Set up billing alerts (alert at 80% and 100% of budget)
☐ Delete unattached EBS volumes and Azure Disks
☐ Release unattached Elastic IPs / Azure Public IPs
☐ Terminate stopped instances older than 30 days (verify first)
☐ Enable S3 Intelligent-Tiering or lifecycle rules
☐ Right-size instances flagged by Cost Explorer / Advisor
☐ Purchase RIs/Savings Plans for baseline steady-state workloads
☐ Tag all resources (enables cost allocation by team/project)
☐ Stop dev/test instances on weekends (70% savings on non-prod)
```
