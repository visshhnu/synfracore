# AWS VPC Troubleshooting Guide

## Issue 1: EC2 instances cannot reach the internet

**Symptom:** `curl https://google.com` from EC2 times out. Other instances in same VPC work fine.

**Root cause:** Missing internet gateway, no route to IGW in route table, instance in private subnet, or no public IP.

**Debug steps:**
```bash
# Check route table for subnet
aws ec2 describe-route-tables   --filters Name=association.subnet-id,Values=subnet-xxx

# Check internet gateway
aws ec2 describe-internet-gateways   --filters Name=attachment.vpc-id,Values=vpc-xxx

# Check if instance has public IP
aws ec2 describe-instances --instance-ids i-xxx   --query 'Reservations[].Instances[].PublicIpAddress'
```

**Fix:**
```bash
# Attach IGW if missing
aws ec2 create-internet-gateway
aws ec2 attach-internet-gateway --internet-gateway-id igw-xxx --vpc-id vpc-xxx

# Add default route to route table
aws ec2 create-route   --route-table-id rtb-xxx   --destination-cidr-block 0.0.0.0/0   --gateway-id igw-xxx

# For private subnet: use NAT Gateway instead
aws ec2 create-nat-gateway --subnet-id subnet-PUBLIC --allocation-id eipalloc-xxx
# Then add route: 0.0.0.0/0 → nat-xxx
```

---

## Issue 2: VPC peering — cannot route between peered VPCs

**Symptom:** Peering connection shows "active" but `ping` between instances in different VPCs fails.

**Root cause:** Peering connection active but route tables not updated in BOTH VPCs. Very common mistake.

**Fix:**
```bash
# VPC A route table: add route to VPC B CIDR
aws ec2 create-route   --route-table-id rtb-VPC-A   --destination-cidr-block 10.1.0.0/16 \   # VPC B CIDR
  --vpc-peering-connection-id pcx-xxx

# VPC B route table: add route to VPC A CIDR
aws ec2 create-route   --route-table-id rtb-VPC-B   --destination-cidr-block 10.0.0.0/16 \   # VPC A CIDR
  --vpc-peering-connection-id pcx-xxx

# ALSO update security groups to allow traffic from peer CIDR
```

---

## Issue 3: NACL vs Security Group confusion — traffic blocked

**Symptom:** SG allows traffic but connections still drop. `nc -zv` times out.

**Root cause:** NACL (stateless) is blocking return traffic. SG (stateful) automatically allows return; NACL does not.

**Fix:**
```bash
# NACLs need BOTH inbound AND outbound rules
# Add outbound rule for ephemeral ports (1024-65535) to allow return traffic
aws ec2 create-network-acl-entry   --network-acl-id acl-xxx   --rule-number 200   --protocol tcp   --port-range From=1024,To=65535   --cidr-block 0.0.0.0/0   --rule-action allow   --egress   # outbound from subnet
```

---

## Issue 4: DNS resolution failing in VPC

**Symptom:** `nslookup myservice.production.svc.cluster.local` fails. Private hosted zone records not resolving.

**Root cause:** VPC DNS attributes not enabled, or Route53 resolver not configured for private zones.

**Fix:**
```bash
# Enable DNS support and hostnames on VPC
aws ec2 modify-vpc-attribute --vpc-id vpc-xxx --enable-dns-support
aws ec2 modify-vpc-attribute --vpc-id vpc-xxx --enable-dns-hostnames

# Associate private hosted zone with VPC
aws route53 associate-vpc-with-hosted-zone   --hosted-zone-id ZXXXXX   --vpc VPCRegion=us-east-1,VPCId=vpc-xxx
```

---

## Issue 5: VPC CIDR conflict — cannot peer or connect VPCs

**Symptom:** Attempting to create VPC peering fails with "CIDR ranges overlap". Transit Gateway routing issues.

**Root cause:** Two VPCs or subnets use the same CIDR block. IP ranges must be non-overlapping for routing to work.

**Fix:**
```bash
# Check CIDR blocks
aws ec2 describe-vpcs --query 'Vpcs[].{ID:VpcId,CIDR:CidrBlock}'

# For new VPC: choose non-overlapping CIDR
# Existing VPC: add secondary CIDR (AWS allows adding additional CIDRs)
aws ec2 associate-vpc-cidr-block   --vpc-id vpc-xxx   --cidr-block 100.64.0.0/16   # use non-overlapping range

# For peering: CIDRs must not overlap at all
# Solution: re-create VPC with different CIDR (painful but necessary)
```

**Prevention:** Document VPC CIDRs centrally. Use RFC 1918 ranges systematically: 10.0.0.0/8 divided by region, environment.
