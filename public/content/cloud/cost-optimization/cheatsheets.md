# Cost Optimization — Cheatsheet

```bash
# ── FIND WASTE IMMEDIATELY ────────────────────────────────
# Unattached EBS volumes
aws ec2 describe-volumes --filters Name=status,Values=available \
  --query 'Volumes[*].[VolumeId,Size,VolumeType,CreateTime]' --output table

# Unused Elastic IPs
aws ec2 describe-addresses \
  --query 'Addresses[?AssociationId==null].[AllocationId,PublicIp]' --output table

# Idle load balancers (no targets or low traffic)
aws elbv2 describe-load-balancers --query 'LoadBalancers[*].[LoadBalancerName,Type,State.Code]' --output table

# Old snapshots (> 30 days old)
aws ec2 describe-snapshots --owner-ids self \
  --query "Snapshots[?StartTime<='$(date -d '30 days ago' +%Y-%m-%d)'].[SnapshotId,VolumeSize,StartTime]" --output table

# Instances with low CPU (right-sizing candidates)
aws cloudwatch get-metric-statistics \
  --namespace AWS/EC2 --metric-name CPUUtilization \
  --dimensions Name=InstanceId,Value=i-1234567 \
  --start-time $(date -d '7 days ago' +%Y-%m-%dT%H:%M:%SZ) \
  --end-time $(date +%Y-%m-%dT%H:%M:%SZ) \
  --period 86400 --statistics Average

# ── COST ANALYSIS ─────────────────────────────────────────
# Total spend by service
aws ce get-cost-and-usage \
  --time-period Start=$(date +%Y-%m-01),End=$(date +%Y-%m-%d) \
  --granularity MONTHLY --metrics BlendedCost \
  --group-by Type=DIMENSION,Key=SERVICE \
  --query 'ResultsByTime[].Groups[*].[Keys[0],Metrics.BlendedCost.Amount]' --output table

# Forecast next month
aws ce get-cost-forecast \
  --time-period Start=$(date +%Y-%m-01),End=$(date -d 'next month' +%Y-%m-01) \
  --metric BLENDED_COST --granularity MONTHLY

# ── SAVINGS PLANS / RI ────────────────────────────────────
# Current commitments
aws savingsplans describe-savings-plans
aws ec2 describe-reserved-instances --query 'ReservedInstances[*].[ReservedInstancesId,InstanceType,State,End]' --output table

# ── AUTO STOP DEV ENVIRONMENTS ────────────────────────────
# Tag: Environment=dev → stop at 6PM, start at 8AM weekdays
# Use EventBridge + Lambda or AWS Instance Scheduler (free CloudFormation template)
aws cloudformation deploy \
  --template-url https://s3.amazonaws.com/solutions-reference/aws-instance-scheduler/latest/aws-instance-scheduler.template \
  --stack-name instance-scheduler \
  --parameter-overrides DefaultTimezone=Asia/Kolkata

# ── KEY PRICING RULES ─────────────────────────────────────
# EC2:     On-Demand > Savings Plan > RI > Spot
# S3:      Standard > Standard-IA > Glacier-IR > Glacier > Deep Archive
# Data in: Free | Data out to internet: $0.09/GB (first 10TB)
# Inter-AZ: $0.01/GB | Same-AZ: Free
# NAT GW:  $0.045/hr + $0.045/GB processed
```
