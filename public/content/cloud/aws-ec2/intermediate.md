# AWS EC2 — Intermediate

## Launch Templates and Auto Scaling

```hcl
# Terraform — Production ASG with mixed instances
resource "aws_launch_template" "app" {
  name_prefix   = "app-"
  image_id      = data.aws_ami.amazon_linux.id
  instance_type = "t3.medium"

  iam_instance_profile { arn = aws_iam_instance_profile.app.arn }
  vpc_security_group_ids = [aws_security_group.app.id]

  user_data = base64encode(<<-EOF
    #!/bin/bash
    set -e
    yum install -y amazon-cloudwatch-agent
    /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl \
      -a fetch-config -m ec2 -s -c ssm:/cloudwatch/config
    systemctl start myapp
  EOF
  )

  metadata_options {
    http_tokens                 = "required"    # Require IMDSv2
    http_put_response_hop_limit = 1
  }

  monitoring { enabled = true }  # Detailed CloudWatch metrics
  ebs_optimized = true

  tag_specifications {
    resource_type = "instance"
    tags = { Name = "app-${terraform.workspace}", Environment = terraform.workspace }
  }

  lifecycle { create_before_destroy = true }
}

resource "aws_autoscaling_group" "app" {
  name                = "app-asg"
  vpc_zone_identifier = module.vpc.private_subnets
  target_group_arns   = [aws_lb_target_group.app.arn]
  health_check_type   = "ELB"     # Use ALB health checks
  health_check_grace_period = 300

  min_size         = 2
  max_size         = 20
  desired_capacity = 2

  # Mix of on-demand and spot for cost savings
  mixed_instances_policy {
    instances_distribution {
      on_demand_base_capacity                  = 2    # Always 2 on-demand
      on_demand_percentage_above_base_capacity = 0    # Rest are spot
      spot_allocation_strategy = "capacity-optimized" # Pick most available spot
    }
    launch_template {
      launch_template_specification {
        launch_template_id = aws_launch_template.app.id
        version            = "$Latest"
      }
      override {
        instance_type = "t3.medium"
      }
      override {
        instance_type = "t3a.medium"   # AMD alternative (cheaper)
      }
      override {
        instance_type = "m5.medium"
      }
    }
  }

  # Scale in protection for running jobs
  instance_refresh {
    strategy = "Rolling"
    preferences {
      min_healthy_percentage = 90
      instance_warmup        = 300
    }
  }
}
```

## Systems Manager (SSM) — No SSH Needed

```bash
# SSM Session Manager — SSH-free remote access
# Requirements: IAM role with AmazonSSMManagedInstanceCore + SSM Agent running

# Connect to instance (no bastion, no security group SSH rule needed)
aws ssm start-session --target i-1234567890abcdef0

# Run command on fleet
aws ssm send-command \
    --targets "Key=tag:Environment,Values=production" \
    --document-name "AWS-RunShellScript" \
    --parameters 'commands=["sudo yum update -y --security"]' \
    --output-s3-bucket-name my-logs-bucket \
    --output-s3-key-prefix ssm-output

# Wait for completion and get results
COMMAND_ID="xxx"
aws ssm list-command-invocations \
    --command-id $COMMAND_ID \
    --details \
    --query 'CommandInvocations[*].[InstanceId,Status,CommandPlugins[0].Output]' \
    --output table

# Parameter Store — centralized config management
aws ssm put-parameter \
    --name "/myapp/prod/database-url" \
    --value "postgresql://user:pass@db.example.com/myapp" \
    --type "SecureString" \
    --key-id "alias/myapp-key"

# Read in EC2 user data or application code
DB_URL=$(aws ssm get-parameter \
    --name /myapp/prod/database-url \
    --with-decryption \
    --query Parameter.Value \
    --output text)
```

## EC2 Cost Optimization

```bash
# Find idle instances (CPU < 5% over 7 days)
aws cloudwatch get-metric-statistics \
    --namespace AWS/EC2 \
    --metric-name CPUUtilization \
    --dimensions Name=InstanceId,Value=i-1234567890abcdef0 \
    --start-time $(date -u -d '7 days ago' +%Y-%m-%dT%H:%M:%SZ) \
    --end-time $(date -u +%Y-%m-%dT%H:%M:%SZ) \
    --period 604800 \
    --statistics Average \
    --query 'Datapoints[0].Average'

# AWS Compute Optimizer recommendations
aws compute-optimizer get-ec2-instance-recommendations \
    --filters name=Finding,values=OVER_PROVISIONED \
    --query 'instanceRecommendations[*].[instanceArn,finding,recommendationOptions[0].instanceType,recommendationOptions[0].estimatedMonthlySavings.value]' \
    --output table

# Savings Plans coverage report
aws ce get-savings-plans-coverage \
    --time-period Start=$(date -u -d '30 days ago' +%Y-%m-%d),End=$(date -u +%Y-%m-%d)
```
