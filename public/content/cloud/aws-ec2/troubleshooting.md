# AWS EC2 Troubleshooting Guide

## Issue 1: EC2 instance unreachable via SSH

**Symptom:** `ssh ec2-user@<ip>` → `Connection timed out` or `Connection refused`. Instance shows "running" in console.

**Root cause:** Security group missing inbound rule on port 22, network ACL blocking traffic, no public IP/Elastic IP, or SSH daemon crashed inside instance.

**Debug steps:**
```bash
# Check security group inbound rules
aws ec2 describe-security-groups --group-ids sg-xxx   --query 'SecurityGroups[].IpPermissions'

# Verify instance has public IP
aws ec2 describe-instances --instance-ids i-xxx   --query 'Reservations[].Instances[].PublicIpAddress'

# Check NACL for subnet
aws ec2 describe-network-acls --filters Name=association.subnet-id,Values=subnet-xxx

# Last resort: EC2 Connect via console (browser-based SSH)
# AWS Console → EC2 → Connect → EC2 Instance Connect
```

**Fix:**
```bash
# Add SSH inbound rule to security group
aws ec2 authorize-security-group-ingress   --group-id sg-xxx   --protocol tcp --port 22   --cidr 0.0.0.0/0   # restrict to your IP in prod: <your-ip>/32

# Associate Elastic IP if no public IP
aws ec2 allocate-address
aws ec2 associate-address --instance-id i-xxx --allocation-id eipalloc-xxx
```

**Prevention:** Use Session Manager (no port 22 needed). Tag security groups clearly. Use VPC Flow Logs to debug network drops.

---

## Issue 2: CPU Credit exhaustion on T-series instances

**Symptom:** T2/T3/T4g instance becomes extremely slow. CloudWatch shows `CPUCreditBalance` approaching zero. CPU pegged at baseline (10–30%) even at 100% load.

**Root cause:** T-series instances use burstable CPU credits. Sustained high CPU drains the credit balance. When exhausted, CPU is throttled to baseline.

**Debug steps:**
```bash
# Check credit balance via CloudWatch
aws cloudwatch get-metric-statistics   --namespace AWS/EC2   --metric-name CPUCreditBalance   --dimensions Name=InstanceId,Value=i-xxx   --start-time 2024-01-01T00:00:00Z   --end-time 2024-01-01T24:00:00Z   --period 300 --statistics Average

# Check if unlimited mode is enabled
aws ec2 describe-instance-credit-specifications --instance-ids i-xxx
```

**Fix:**
```bash
# Option 1: Enable unlimited mode (pay for extra credits beyond baseline)
aws ec2 modify-instance-credit-specification   --instance-credit-specifications InstanceId=i-xxx,CpuCredits=unlimited

# Option 2: Upgrade to compute-optimized instance (no credit system)
aws ec2 modify-instance-attribute   --instance-id i-xxx --instance-type c5.large
# (requires stop/start)
```

**Prevention:** Use `unlimited` for production. Monitor `CPUCreditBalance` with alarm at < 20 credits. Consider M or C series for sustained workloads.

---

## Issue 3: EBS volume full — instance behaving erratically

**Symptom:** Application errors writing to disk. Instance logs show `No space left on device`. `df -h` shows 100% usage.

**Debug steps:**
```bash
# SSH into instance
df -h                               # which volume is full?
du -sh /* 2>/dev/null | sort -rh | head -20
find / -size +1G -type f 2>/dev/null | head -10
journalctl --disk-usage            # check journal size
```

**Fix:**
```bash
# Immediate: free space
journalctl --vacuum-size=500M
find /tmp -mtime +7 -delete
docker system prune -a -f          # if Docker used

# Permanent: expand EBS volume (online, no downtime)
aws ec2 modify-volume --volume-id vol-xxx --size 50   # expand to 50GB
# Wait for state=optimizing, then inside instance:
sudo growpart /dev/xvda 1          # expand partition
sudo resize2fs /dev/xvda1          # expand filesystem (ext4)
# For XFS: sudo xfs_growfs /
```

**Prevention:** Set CloudWatch alarm on `DiskSpaceUtilization` > 80%. Enable log rotation. Size volumes with 30% headroom.

---

## Issue 4: Security group misconfiguration — traffic blocked unexpectedly

**Symptom:** Application unreachable on specific port. `curl` from another EC2 times out. Port is open in the SG you think is attached.

**Root cause:** Multiple security groups attached, NACL rule blocking, wrong SG attached to ENI, or stateful SG rule missing return traffic.

**Debug steps:**
```bash
# List ALL security groups on instance
aws ec2 describe-instances --instance-ids i-xxx   --query 'Reservations[].Instances[].SecurityGroups'

# Test connectivity from another EC2 in same VPC
# nc -zv <private-ip> 8080

# Enable VPC Flow Logs to see rejected packets
aws ec2 create-flow-logs   --resource-type VPC --resource-ids vpc-xxx   --traffic-type REJECT   --log-destination-type cloud-watch-logs   --log-group-name VPCFlowLogs
```

**Fix:**
```bash
# Remove unwanted SG
aws ec2 modify-instance-attribute   --instance-id i-xxx   --groups sg-correct1 sg-correct2   # list all SGs to KEEP

# NACLs are stateless - must add BOTH inbound AND outbound rules
aws ec2 create-network-acl-entry   --network-acl-id acl-xxx   --rule-number 110 --protocol tcp   --port-range From=8080,To=8080   --cidr-block 0.0.0.0/0 --rule-action allow   --ingress   # also add --egress for return traffic (ephemeral ports 1024-65535)
```

**Prevention:** Use AWS Reachability Analyzer to test path before production traffic. Tag all security groups. Principle of least privilege.

---

## Issue 5: Instance metadata service (IMDS) access issues

**Symptom:** Application fails to retrieve IAM credentials or region from metadata. `curl http://169.254.169.254/latest/meta-data/` hangs or returns 401.

**Root cause:** IMDSv2 enforced but application uses IMDSv1 style requests, or hop limit too low for containers.

**Debug steps:**
```bash
# Test IMDSv2 (correct way)
TOKEN=$(curl -X PUT "http://169.254.169.254/latest/api/token"   -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")
curl -H "X-aws-ec2-metadata-token: $TOKEN"   http://169.254.169.254/latest/meta-data/instance-id

# Check IMDS configuration
aws ec2 describe-instances --instance-ids i-xxx   --query 'Reservations[].Instances[].MetadataOptions'
```

**Fix:**
```bash
# Increase hop limit for containers (default is 1, containers need 2)
aws ec2 modify-instance-metadata-options   --instance-id i-xxx   --http-put-response-hop-limit 2   --http-endpoint enabled

# If app must use IMDSv1 temporarily:
aws ec2 modify-instance-metadata-options   --instance-id i-xxx   --http-tokens optional   # optional=IMDSv1 allowed; required=IMDSv2 only
```

**Prevention:** Migrate all apps to IMDSv2. Use AWS SDK v2 (auto-handles IMDSv2). Set hop limit to 2 for container workloads at launch.
