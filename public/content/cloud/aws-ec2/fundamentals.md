# AWS EC2 Fundamentals

## Launch Your First Instance (AWS CLI)

```bash
# Install AWS CLI
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip && sudo ./aws/install

# Configure
aws configure
# AWS Access Key ID: AKIA...
# AWS Secret Access Key: ...
# Default region: us-east-1
# Default output format: json

# Launch an instance
aws ec2 run-instances \
  --image-id ami-0c55b159cbfafe1f0 \
  --instance-type t3.micro \
  --key-name my-key-pair \
  --security-group-ids sg-xxxxxxxx \
  --subnet-id subnet-xxxxxxxx \
  --count 1 \
  --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=my-server}]'

# Get instance details
aws ec2 describe-instances \
  --filters "Name=tag:Name,Values=my-server" \
  --query 'Reservations[].Instances[].[InstanceId,State.Name,PublicIpAddress]' \
  --output table

# SSH in
ssh -i ~/.ssh/my-key.pem ec2-user@<public-ip>

# Stop / Start / Terminate
aws ec2 stop-instances --instance-ids i-1234567890abcdef0
aws ec2 start-instances --instance-ids i-1234567890abcdef0
aws ec2 terminate-instances --instance-ids i-1234567890abcdef0
```

## Security Groups

```bash
# Create security group
aws ec2 create-security-group \
  --group-name web-server-sg \
  --description "Web server security group" \
  --vpc-id vpc-xxxxxxxx

# Allow SSH from your IP only
aws ec2 authorize-security-group-ingress \
  --group-id sg-xxxxxxxx \
  --protocol tcp \
  --port 22 \
  --cidr $(curl -s ifconfig.me)/32

# Allow HTTP and HTTPS from anywhere
aws ec2 authorize-security-group-ingress \
  --group-id sg-xxxxxxxx \
  --ip-permissions \
  '[{"IpProtocol":"tcp","FromPort":80,"ToPort":80,"IpRanges":[{"CidrIp":"0.0.0.0/0"}]},
    {"IpProtocol":"tcp","FromPort":443,"ToPort":443,"IpRanges":[{"CidrIp":"0.0.0.0/0"}]}]'

# View rules
aws ec2 describe-security-groups --group-ids sg-xxxxxxxx
```

## User Data — Bootstrap Script

```bash
# Launch with user data (runs as root on first boot)
aws ec2 run-instances \
  --image-id ami-0c55b159cbfafe1f0 \
  --instance-type t3.micro \
  --key-name my-key \
  --security-group-ids sg-xxxxxxxx \
  --user-data file://bootstrap.sh

# bootstrap.sh
#!/bin/bash
set -e
yum update -y
yum install -y nginx
systemctl enable nginx
systemctl start nginx
echo "<h1>Hello from EC2 $(hostname)</h1>" > /usr/share/nginx/html/index.html

# Check user data ran
cat /var/log/cloud-init-output.log
```

## Auto Scaling Group

```bash
# 1. Create Launch Template
aws ec2 create-launch-template \
  --launch-template-name web-server-lt \
  --version-description "v1" \
  --launch-template-data '{
    "ImageId": "ami-0c55b159cbfafe1f0",
    "InstanceType": "t3.micro",
    "KeyName": "my-key",
    "SecurityGroupIds": ["sg-xxxxxxxx"],
    "UserData": "'$(base64 -w 0 bootstrap.sh)'"
  }'

# 2. Create Auto Scaling Group
aws autoscaling create-auto-scaling-group \
  --auto-scaling-group-name web-asg \
  --launch-template LaunchTemplateName=web-server-lt,Version='$Latest' \
  --min-size 2 \
  --max-size 10 \
  --desired-capacity 2 \
  --vpc-zone-identifier "subnet-aaa,subnet-bbb" \
  --target-group-arns arn:aws:elasticloadbalancing:...

# 3. Add scaling policy
aws autoscaling put-scaling-policy \
  --auto-scaling-group-name web-asg \
  --policy-name scale-on-cpu \
  --policy-type TargetTrackingScaling \
  --target-tracking-configuration '{
    "TargetValue": 60.0,
    "PredefinedMetricSpecification": {
      "PredefinedMetricType": "ASGAverageCPUUtilization"
    }
  }'
```

## Instance Metadata Service (IMDS)

```bash
# From inside the instance — get metadata
curl http://169.254.169.254/latest/meta-data/
curl http://169.254.169.254/latest/meta-data/instance-id
curl http://169.254.169.254/latest/meta-data/instance-type
curl http://169.254.169.254/latest/meta-data/local-ipv4
curl http://169.254.169.254/latest/meta-data/iam/security-credentials/

# IMDSv2 (required in hardened environments)
TOKEN=$(curl -X PUT "http://169.254.169.254/latest/api/token" \
  -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")
curl -H "X-aws-ec2-metadata-token: $TOKEN" \
  http://169.254.169.254/latest/meta-data/instance-id
```

## EC2 Interview Q&A

**What is the difference between stopping and terminating an EC2 instance?**
Stopping preserves the instance — EBS volumes remain, the instance can be started again, you keep the same instance ID. Terminating permanently deletes the instance and its root EBS volume (unless DeleteOnTermination=false). You cannot recover a terminated instance.

**What is an Elastic IP and when would you use it?**
An Elastic IP is a static public IPv4 address in your AWS account. Regular EC2 instances get a public IP that changes on stop/start. Use Elastic IP when you need a stable endpoint — DNS records pointing to it, allow-listing in firewalls, or failover scenarios where you need to reassign the IP to another instance.

**Explain the difference between a Security Group and a Network ACL.**
Security Groups are stateful (return traffic automatically allowed), operate at the instance level, support allow rules only. NACLs are stateless (return traffic needs explicit rule), operate at the subnet level, support both allow and deny rules. Security Groups are instance-level; NACLs are subnet-level.
