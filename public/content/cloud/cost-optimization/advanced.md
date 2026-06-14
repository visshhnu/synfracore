# Cost Optimization — Advanced

## FinOps Culture and Tagging Strategy

```bash
# Enforce tagging with Config Rule — no tags = non-compliant
aws config put-config-rule --config-rule '{
  "ConfigRuleName": "required-tags",
  "Source": {"Owner":"AWS","SourceIdentifier":"REQUIRED_TAGS"},
  "InputParameters": "{\"tag1Key\":\"Environment\",\"tag2Key\":\"Owner\",\"tag3Key\":\"Project\"}"
}'

# Cost allocation tags — enable in billing console first
aws ce update-cost-allocation-tags-status \
  --cost-allocation-tags-status '{"TagKey":"Environment","Status":"Active"}' \
  '{"TagKey":"Project","Status":"Active"}'

# Show cost breakdown by team/project
aws ce get-cost-and-usage \
  --time-period Start=2024-01-01,End=2024-01-31 \
  --granularity MONTHLY --metrics BlendedCost \
  --group-by Type=TAG,Key=Project

# Budgets with alerts and actions
aws budgets create-budget --account-id $ACCT \
  --budget '{
    "BudgetName":"prod-monthly",
    "BudgetType":"COST",
    "TimeUnit":"MONTHLY",
    "BudgetLimit":{"Amount":"10000","Unit":"USD"}
  }' \
  --notifications-with-subscribers '[{
    "Notification":{"NotificationType":"ACTUAL","ComparisonOperator":"GREATER_THAN","Threshold":80,"ThresholdType":"PERCENTAGE"},
    "Subscribers":[{"SubscriptionType":"EMAIL","Address":"team@company.com"}]
  }]'
```

## Spot Instance Strategy

```python
# Use Spot instances for 70-90% savings on fault-tolerant workloads
# Best use cases: CI/CD workers, ML training, batch processing, dev/test

import boto3

ec2 = boto3.client('ec2')

# Launch Spot Fleet with multiple instance types (resilient to availability)
response = ec2.request_spot_fleet(
    SpotFleetRequestConfig={
        'IamFleetRole': f'arn:aws:iam::{account_id}:role/AmazonEC2SpotFleetRole',
        'AllocationStrategy': 'diversified',  # Spread across instance types
        'TargetCapacity': 10,
        'SpotPrice': '0.50',  # Max price per instance-hour
        'LaunchSpecifications': [
            {'InstanceType': 'm5.large', 'SpotPrice': '0.05', 'ImageId': ami_id},
            {'InstanceType': 'm5.xlarge', 'SpotPrice': '0.10', 'ImageId': ami_id},
            {'InstanceType': 'm4.large', 'SpotPrice': '0.04', 'ImageId': ami_id},
        ],
        'TerminateInstancesWithExpiration': True,
    }
)
# Handle 2-minute interruption warning via instance metadata:
# http://169.254.169.254/latest/meta-data/spot/interruption-action
```
