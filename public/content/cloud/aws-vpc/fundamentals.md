# AWS VPC — Fundamentals

## VPC Architecture

```
VPC (10.0.0.0/16) — your private network in AWS
  ├── Public Subnet (10.0.1.0/24) — has route to Internet Gateway
  │     └── EC2 with public IP, ALB, NAT Gateway
  ├── Private Subnet (10.0.2.0/24) — no direct internet route
  │     └── App servers, databases (reach internet via NAT)
  └── Database Subnet (10.0.3.0/24) — isolated
        └── RDS, ElastiCache (no internet at all)

Internet Gateway: Allows public subnet ↔ internet
NAT Gateway: Allows private subnet → internet (outbound only)
  - Deployed in public subnet
  - Private subnet route: 0.0.0.0/0 → NAT Gateway
```

## Build a VPC with Terraform

```hcl
resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = { Name = "prod-vpc" }
}

resource "aws_subnet" "public" {
  count             = 2
  vpc_id            = aws_vpc.main.id
  cidr_block        = cidrsubnet("10.0.0.0/16", 8, count.index)
  availability_zone = data.aws_availability_zones.available.names[count.index]
  map_public_ip_on_launch = true
  tags = { Name = "public-${count.index + 1}", Tier = "public" }
}

resource "aws_subnet" "private" {
  count             = 2
  vpc_id            = aws_vpc.main.id
  cidr_block        = cidrsubnet("10.0.0.0/16", 8, count.index + 10)
  availability_zone = data.aws_availability_zones.available.names[count.index]
  tags = { Name = "private-${count.index + 1}", Tier = "private" }
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
}

resource "aws_nat_gateway" "main" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public[0].id  # NAT lives in public subnet
  depends_on    = [aws_internet_gateway.main]
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.main.id
  }
}
```

## Security Groups vs NACLs

```
Security Group (SG):
  - Attached to ENI (instance level)
  - STATEFUL: return traffic auto-allowed
  - Allow rules only (no deny)
  - Evaluate all rules together

Network ACL (NACL):
  - Attached to subnet
  - STATELESS: must explicitly allow return traffic
  - Allow AND deny rules
  - Rules evaluated in order (lowest number first)
  - Rule 100, 200, 300... leave gaps for future rules

Typical setup:
  NACL: Broad rules (deny known malicious IP ranges)
  SG: Fine-grained rules (allow port 443 from ALB only)
```

## VPC Endpoints

```bash
# Gateway endpoint (free) — for S3 and DynamoDB
# Traffic stays in AWS network, never goes to internet
aws ec2 create-vpc-endpoint \
  --vpc-id vpc-12345 \
  --service-name com.amazonaws.us-east-1.s3 \
  --vpc-endpoint-type Gateway \
  --route-table-ids rtb-12345

# Interface endpoint — for other AWS services (costs $0.01/hr per AZ)
aws ec2 create-vpc-endpoint \
  --vpc-id vpc-12345 \
  --service-name com.amazonaws.us-east-1.secretsmanager \
  --vpc-endpoint-type Interface \
  --subnet-ids subnet-12345 \
  --security-group-ids sg-12345
  
# Benefits: 
# - Lambda/EC2 in private subnet can reach AWS APIs without NAT Gateway
# - Saves NAT Gateway data processing costs
# - Better security (traffic never leaves AWS)
```

## VPC Peering & Transit Gateway

```
VPC Peering: Direct 1:1 connection between 2 VPCs
  - Same or different accounts, same or different regions
  - Non-transitive: A↔B, B↔C does NOT mean A↔C
  - Use for: 2-3 VPCs, simple sharing

Transit Gateway: Hub-and-spoke for many VPCs
  - Attach multiple VPCs + on-premise (via VPN/Direct Connect)
  - Transitive routing: A→TGW→B→TGW→C
  - Use for: 4+ VPCs, complex networking, hybrid cloud
```
