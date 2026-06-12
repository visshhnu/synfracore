# AWS EC2 — Cheatsheet

```bash
# ── INSTANCES ────────────────────────────────────────────────
aws ec2 describe-instances --query 'Reservations[].Instances[].[InstanceId,State.Name,InstanceType,PublicIpAddress,Tags[?Key==`Name`].Value|[0]]' --output table
aws ec2 describe-instances --filters "Name=tag:Environment,Values=prod" "Name=instance-state-name,Values=running"
aws ec2 start-instances --instance-ids i-1234567890abcdef0
aws ec2 stop-instances --instance-ids i-1234567890abcdef0
aws ec2 reboot-instances --instance-ids i-1234567890abcdef0
aws ec2 terminate-instances --instance-ids i-1234567890abcdef0

# Launch instance
aws ec2 run-instances \
  --image-id $(aws ssm get-parameter --name /aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64 --query Parameter.Value --output text) \
  --instance-type t3.micro \
  --key-name my-key \
  --security-group-ids sg-12345678 \
  --subnet-id subnet-12345678 \
  --iam-instance-profile Name=EC2SSMRole \
  --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=web-01},{Key=Env,Value=prod}]'

# SSM Session (no SSH key needed)
aws ssm start-session --target i-1234567890abcdef0

# ── AMIs ──────────────────────────────────────────────────────
aws ec2 describe-images --owners amazon --filters "Name=name,Values=al2023-ami-*-x86_64" --query 'sort_by(Images,&CreationDate)[-1].ImageId'
aws ec2 create-image --instance-id i-123 --name "web-server-$(date +%Y%m%d)" --no-reboot
aws ec2 deregister-image --image-id ami-12345678

# ── SECURITY GROUPS ──────────────────────────────────────────
aws ec2 describe-security-groups --group-ids sg-12345678
aws ec2 create-security-group --group-name web-sg --description "Web servers" --vpc-id vpc-12345
aws ec2 authorize-security-group-ingress --group-id sg-12345 --protocol tcp --port 443 --cidr 0.0.0.0/0
aws ec2 revoke-security-group-ingress --group-id sg-12345 --protocol tcp --port 22 --cidr 0.0.0.0/0

# ── KEY PAIRS ─────────────────────────────────────────────────
aws ec2 create-key-pair --key-name my-key --query 'KeyMaterial' --output text > my-key.pem
chmod 400 my-key.pem
aws ec2 describe-key-pairs
aws ec2 delete-key-pair --key-name my-key

# ── ELASTIC IPs ───────────────────────────────────────────────
aws ec2 allocate-address --domain vpc                          # Create EIP
aws ec2 associate-address --instance-id i-123 --allocation-id eipalloc-123
aws ec2 disassociate-address --association-id eipassoc-123
aws ec2 release-address --allocation-id eipalloc-123           # Delete EIP

# ── EBS VOLUMES ───────────────────────────────────────────────
aws ec2 describe-volumes --filters "Name=status,Values=available"  # Unattached
aws ec2 create-volume --size 100 --volume-type gp3 --availability-zone us-east-1a
aws ec2 attach-volume --volume-id vol-123 --instance-id i-123 --device /dev/xvdf
aws ec2 create-snapshot --volume-id vol-123 --description "backup-$(date +%Y%m%d)"
aws ec2 modify-volume --volume-id vol-123 --size 200 --volume-type gp3  # Resize

# ── AUTO SCALING ─────────────────────────────────────────────
aws autoscaling describe-auto-scaling-groups
aws autoscaling set-desired-capacity --auto-scaling-group-name my-asg --desired-capacity 5
aws autoscaling update-auto-scaling-group --auto-scaling-group-name my-asg --min-size 2 --max-size 20
```

## Instance Type Quick Cheat

```
t3.micro   = 2 vCPU,  1GB  — dev/test, burstable
t3.medium  = 2 vCPU,  4GB  — small apps
m5.large   = 2 vCPU,  8GB  — general purpose
m5.xlarge  = 4 vCPU,  16GB — general purpose
c5.large   = 2 vCPU,  4GB  — compute-optimized
r5.large   = 2 vCPU,  16GB — memory-optimized (databases)
→ Graviton (arm64): t4g, m6g, c6g — same specs, ~20% cheaper
```
