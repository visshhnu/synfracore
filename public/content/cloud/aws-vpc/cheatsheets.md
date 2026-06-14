# AWS VPC — Cheatsheet

```bash
# ── CREATE VPC INFRASTRUCTURE ────────────────────────────
# Create VPC
VPC_ID=$(aws ec2 create-vpc --cidr-block 10.0.0.0/16 --query 'Vpc.VpcId' --output text)
aws ec2 create-tags --resources $VPC_ID --tags Key=Name,Value=prod-vpc
aws ec2 modify-vpc-attribute --vpc-id $VPC_ID --enable-dns-hostnames

# Subnets
aws ec2 create-subnet --vpc-id $VPC_ID --cidr-block 10.0.1.0/24 --availability-zone ap-south-1a
aws ec2 create-subnet --vpc-id $VPC_ID --cidr-block 10.0.11.0/24 --availability-zone ap-south-1a

# Internet Gateway (for public subnets)
IGW=$(aws ec2 create-internet-gateway --query 'InternetGateway.InternetGatewayId' --output text)
aws ec2 attach-internet-gateway --vpc-id $VPC_ID --internet-gateway-id $IGW

# NAT Gateway (for private subnets outbound)
EIP=$(aws ec2 allocate-address --query 'AllocationId' --output text)
NAT=$(aws ec2 create-nat-gateway --subnet-id $PUB_SUBNET --allocation-id $EIP --query 'NatGateway.NatGatewayId' --output text)
aws ec2 wait nat-gateway-available --nat-gateway-ids $NAT

# Route tables
RT=$(aws ec2 create-route-table --vpc-id $VPC_ID --query 'RouteTable.RouteTableId' --output text)
aws ec2 create-route --route-table-id $RT --destination-cidr-block 0.0.0.0/0 --gateway-id $IGW
aws ec2 associate-route-table --subnet-id $PUB_SUBNET --route-table-id $RT

# Security Groups
SG=$(aws ec2 create-security-group --group-name web-sg --description "Web tier" --vpc-id $VPC_ID --query 'GroupId' --output text)
aws ec2 authorize-security-group-ingress --group-id $SG --protocol tcp --port 443 --cidr 0.0.0.0/0
aws ec2 authorize-security-group-ingress --group-id $SG --protocol tcp --port 80 --cidr 0.0.0.0/0

# ── INSPECTION ────────────────────────────────────────────
aws ec2 describe-vpcs --query 'Vpcs[*].[VpcId,CidrBlock,Tags[?Key==Name].Value|[0]]' --output table
aws ec2 describe-subnets --filters "Name=vpc-id,Values=$VPC_ID" --output table
aws ec2 describe-route-tables --filters "Name=vpc-id,Values=$VPC_ID" --output table
aws ec2 describe-security-groups --filters "Name=vpc-id,Values=$VPC_ID" --output table

# VPC Flow Logs
aws ec2 create-flow-logs --resource-type VPC --resource-ids $VPC_ID   --traffic-type ALL --log-destination-type cloud-watch-logs   --log-group-name /aws/vpc/flowlogs --deliver-logs-permission-arn arn:aws:iam::ACCT:role/flowlogs-role

# ── VPC PEERING ───────────────────────────────────────────
PEER=$(aws ec2 create-vpc-peering-connection --vpc-id $VPC_A --peer-vpc-id $VPC_B --query 'VpcPeeringConnection.VpcPeeringConnectionId' --output text)
aws ec2 accept-vpc-peering-connection --vpc-peering-connection-id $PEER
# Add routes in BOTH VPCs pointing to each other via peering connection

# ── TRANSIT GATEWAY (multi-VPC hub) ──────────────────────
TGW=$(aws ec2 create-transit-gateway --query 'TransitGateway.TransitGatewayId' --output text)
aws ec2 create-transit-gateway-vpc-attachment --transit-gateway-id $TGW --vpc-id $VPC_ID --subnet-ids $SUBNET_A $SUBNET_B

# ── CIDR QUICK REFERENCE ─────────────────────────────────
# /16 = 65,536 IPs  (recommended for VPC CIDR)
# /24 = 256 IPs, 251 usable (AWS reserves 5)
# /26 = 64 IPs, 59 usable
# /28 = 16 IPs, 11 usable (smallest subnet in VPC)
# AWS reserves first 4 IPs and last 1 IP in every subnet
```
