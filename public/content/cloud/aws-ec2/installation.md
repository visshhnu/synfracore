# AWS — Getting Started Guide

## Create Your AWS Account

1. Go to **aws.amazon.com** → Create an AWS Account
2. Enter email, password, account name
3. Add payment method (required but free tier won't charge you)
4. Verify phone number
5. Choose Support plan: **Basic (Free)**

**Free Tier:** 750 hours/month of t2.micro EC2, 5GB S3, 25GB DynamoDB, and more for 12 months.

## Install AWS CLI

### macOS
```bash
brew install awscli
aws --version   # aws-cli/2.x.x
```

### Linux
```bash
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
aws --version
```

### Windows
```powershell
winget install Amazon.AWSCLI
aws --version
```

## Configure AWS CLI

### Create IAM User (Don't Use Root Account for CLI)
1. AWS Console → IAM → Users → Create user
2. Username: `cli-admin`
3. Permissions: Attach policies directly → AdministratorAccess (for learning)
4. Security credentials → Create access key → CLI use case
5. Copy Access Key ID and Secret Access Key

```bash
aws configure
# AWS Access Key ID: AKIA...
# AWS Secret Access Key: xxx
# Default region: ap-south-1   (Mumbai — closest to India)
# Default output format: json

# Verify it works
aws sts get-caller-identity
# Returns your account ID and user ARN
```

## Launch Your First EC2 Instance

```bash
# Find the latest Ubuntu 22.04 AMI in ap-south-1
aws ec2 describe-images \
  --owners 099720109477 \
  --filters "Name=name,Values=ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*" \
  --query "sort_by(Images, &CreationDate)[-1].ImageId" \
  --output text

# Create a key pair
aws ec2 create-key-pair --key-name my-key --query 'KeyMaterial' --output text > my-key.pem
chmod 400 my-key.pem

# Launch EC2 (free tier: t2.micro)
aws ec2 run-instances \
  --image-id ami-0f58b397bc5c1f2e8 \
  --count 1 \
  --instance-type t2.micro \
  --key-name my-key \
  --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=my-first-ec2}]'

# Get the public IP
aws ec2 describe-instances \
  --filters "Name=tag:Name,Values=my-first-ec2" \
  --query "Reservations[0].Instances[0].PublicIpAddress" \
  --output text

# SSH to it
ssh -i my-key.pem ubuntu@PUBLIC-IP

# IMPORTANT: Stop it when done (to avoid charges)
aws ec2 stop-instances --instance-ids INSTANCE-ID
```

## Essential AWS CLI Commands

```bash
# EC2
aws ec2 describe-instances --output table
aws ec2 start-instances --instance-ids i-xxx
aws ec2 stop-instances --instance-ids i-xxx
aws ec2 terminate-instances --instance-ids i-xxx

# S3
aws s3 ls                                  # List all buckets
aws s3 ls s3://my-bucket                   # List bucket contents
aws s3 cp file.txt s3://my-bucket/         # Upload file
aws s3 sync ./local-dir s3://my-bucket/    # Sync directory

# Check what's running (and costing money)
aws ec2 describe-instances \
  --filters "Name=instance-state-name,Values=running" \
  --query "Reservations[*].Instances[*].[InstanceId,InstanceType,PublicIpAddress,Tags[?Key=='Name'].Value|[0]]" \
  --output table
```

## Set Up Billing Alerts (Do This Now)

Prevent surprise bills:
1. AWS Console → Billing → Budgets → Create Budget
2. Budget type: Cost budget
3. Amount: $5 (alerts you before spending more than $5)
4. Alert: 80% of budget → your email

## Next Steps

AWS CLI is configured. Go to the **AWS EC2 Fundamentals** section to learn about VPCs, security groups, and the core services.
