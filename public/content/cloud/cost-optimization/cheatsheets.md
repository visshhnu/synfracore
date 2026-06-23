# Cloud Cost Optimisation Quick Reference

## AWS Cost Commands
```bash
# Cost Explorer
aws ce get-cost-and-usage \
  --time-period Start=2024-01-01,End=2024-01-31 \
  --granularity MONTHLY --group-by Type=DIMENSION,Key=SERVICE

# Compute Optimizer (right-sizing)
aws compute-optimizer get-ec2-instance-recommendations
aws compute-optimizer get-ecs-service-recommendations
aws compute-optimizer get-lambda-function-recommendations

# Trusted Advisor
aws support describe-trusted-advisor-check-summaries \
  --check-ids 'Qch7DwouX1'  # Cost optimisation checks

# Find unused resources
aws ec2 describe-volumes --filters Name=status,Values=available  # Unattached EBS
aws ec2 describe-addresses --filters Name=allocation-id,Values=*  # Unused EIPs
aws ec2 describe-snapshots --owner-ids self --filters Name=status,Values=completed
```

## Cost Saving Reference
```
DISCOUNT OPTIONS:
  On-Demand:      baseline (no discount)
  Spot:           60-90% off (stateless/fault-tolerant workloads)
  RI 1yr No-upfront: ~30% off  (predictable workloads)
  RI 3yr All-upfront: ~60% off (long-running, stable)
  Savings Plans: 17-66% off (flexible, compute or EC2)

RIGHT SIZING (typically 20-40% savings):
  Use Compute Optimizer → recommendations per service
  Target: CPU 40-70%, Memory 40-80%
  Resize DOWN then enable autoscaling

QUICK WINS:
  Delete unattached EBS volumes (immediately)
  Release unassociated Elastic IPs ($3.60/month each)
  Delete old snapshots (set lifecycle policies)
  Stop dev/test at end of business hours (save 67%)
  Delete unused load balancers (~$20/month each)
  Clean up unused NAT Gateways ($35+/month each)
```
