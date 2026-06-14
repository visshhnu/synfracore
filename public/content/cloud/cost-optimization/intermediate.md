# Cost Optimization — Intermediate

## Compute Savings Plans and Reserved Instances

```bash
# Check your current On-Demand spend vs potential savings
aws ce get-cost-and-usage \
  --time-period Start=$(date +%Y-%m-01),End=$(date +%Y-%m-%d) \
  --granularity MONTHLY --metrics BlendedCost \
  --group-by Type=DIMENSION,Key=PURCHASE_TYPE

# Get Savings Plans recommendations
aws savingsplans describe-savings-plans-purchase-recommendation \
  --savings-plan-type ComputeSavingsPlans \
  --term-in-years ONE_YEAR \
  --payment-option PARTIAL_UPFRONT \
  --lookback-period-in-days SIXTY_DAYS

# Reserved Instance recommendations
aws ce get-reservation-purchase-recommendation \
  --service EC2-Instances \
  --lookback-period-in-days SIXTY_DAYS

# Commit to Savings Plan (after reviewing recommendations)
# Console: AWS Cost Management → Savings Plans → Purchase Savings Plans
```

## Right-Sizing EC2 Instances

```bash
# AWS Compute Optimizer
aws compute-optimizer get-ec2-instance-recommendations \
  --filters name=Finding,values=OVER_PROVISIONED

# Cost Explorer: get right-sizing recommendations
aws ce get-rightsizing-recommendation \
  --service EC2 \
  --configuration '{"RecommendationTarget":"SAME_INSTANCE_FAMILY","BenefitsConsidered":true}'

# Stop over-provisioned instances outside business hours (saves 65%)
# Create Lambda + EventBridge:
# 6 PM: stop dev/staging EC2s
# 8 AM Monday-Friday: start them back

aws events put-rule --name stop-dev-instances --schedule-expression "cron(0 12 ? * MON-FRI *)"
# Target: Lambda that calls ec2.stop_instances() for tag=Environment:dev
```

## S3 Storage Cost Optimization

```bash
# Storage class analysis (which objects can move to cheaper tier)
aws s3api create-bucket-analytics-configuration \
  --bucket my-bucket --id full-bucket-analysis \
  --analytics-configuration '{
    "Id":"full-bucket-analysis",
    "StorageClassAnalysis":{"DataExport":{"OutputSchemaVersion":"V_1",
      "Destination":{"S3BucketDestination":{"Format":"CSV","Bucket":"arn:aws:s3:::analytics-bucket","Prefix":"s3-analysis/my-bucket"}}}}
  }'

# Intelligent-Tiering: auto-moves objects between tiers
aws s3api put-bucket-intelligent-tiering-configuration \
  --bucket my-bucket --id entire-bucket \
  --intelligent-tiering-configuration '{
    "Id":"entire-bucket","Status":"Enabled",
    "Tierings":[{"Days":90,"AccessTier":"ARCHIVE_ACCESS"},{"Days":180,"AccessTier":"DEEP_ARCHIVE_ACCESS"}]
  }'

# Check current storage class distribution
aws s3api list-objects-v2 --bucket my-bucket \
  --query 'Contents[*].[Key,StorageClass,Size]' --output table | head -20
```
