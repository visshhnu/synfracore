# AWS VPC Quick Reference

## CLI Commands
```bash
# VPC
aws ec2 create-vpc --cidr-block 10.0.0.0/16
aws ec2 describe-vpcs
aws ec2 describe-vpcs --filters 'Name=isDefault,Values=true'

# Subnets
aws ec2 create-subnet --vpc-id vpc-xxx --cidr-block 10.0.1.0/24 --availability-zone us-east-1a
aws ec2 describe-subnets --filters 'Name=vpc-id,Values=vpc-xxx'
aws ec2 modify-subnet-attribute --subnet-id subnet-xxx --map-public-ip-on-launch

# Internet Gateway
aws ec2 create-internet-gateway
aws ec2 attach-internet-gateway --vpc-id vpc-xxx --internet-gateway-id igw-xxx

# Route Tables
aws ec2 create-route-table --vpc-id vpc-xxx
aws ec2 create-route --route-table-id rtb-xxx --destination-cidr-block 0.0.0.0/0 --gateway-id igw-xxx
aws ec2 associate-route-table --subnet-id subnet-xxx --route-table-id rtb-xxx

# NAT Gateway
aws ec2 allocate-address --domain vpc   # Get Elastic IP
aws ec2 create-nat-gateway --subnet-id subnet-xxx --allocation-id eipalloc-xxx

# Security Groups
aws ec2 create-security-group --group-name web-sg --description 'Web SG' --vpc-id vpc-xxx
aws ec2 authorize-security-group-ingress --group-id sg-xxx --protocol tcp --port 443 --cidr 0.0.0.0/0
aws ec2 revoke-security-group-ingress --group-id sg-xxx --protocol tcp --port 22 --cidr 0.0.0.0/0

# VPC Peering
aws ec2 create-vpc-peering-connection --vpc-id vpc-a --peer-vpc-id vpc-b
aws ec2 accept-vpc-peering-connection --vpc-peering-connection-id pcx-xxx

# Flow Logs
aws ec2 create-flow-logs --resource-type VPC --resource-ids vpc-xxx \
  --traffic-type ALL --log-destination-type cloud-watch-logs \
  --log-destination arn:aws:logs:...
```

## Key Concepts Reference
```
CIDR blocks:
  /16 = 65,536 IPs (large VPC)
  /24 = 256 IPs  (medium subnet)
  /28 = 16 IPs   (small subnet, VPC endpoints)

Reserved IPs per subnet (5 total):
  .0  = Network address
  .1  = VPC router
  .2  = DNS server
  .3  = Reserved
  .255 = Broadcast

Security Group vs NACL:
  SG:   stateful | instance level | allow only
  NACL: stateless | subnet level  | allow + deny | ordered rules

Private IP ranges:
  10.0.0.0/8     (Class A)
  172.16.0.0/12  (Class B)
  192.168.0.0/16 (Class C)
```
