# AWS VPC — Fundamentals

Every AWS account gets a default VPC in each region, but production workloads should never just live in it — you want full control over which subnets exist, which ones can reach the internet, and exactly what can talk to what. This page covers the building blocks you actually configure: subnets, route tables, NAT, Security Groups/NACLs, VPC endpoints, and how VPCs connect to each other.

:::tip Analogy: route tables are the building directory, not the lock on the door
If a VPC is a gated business park (see the Overview page), a **route table** is the directory sign at the entrance to each building telling delivery trucks which road to take to leave the park — it decides *where traffic can go*, not *who's allowed to send it*. Security Groups and NACLs are the separate locks and guards that decide *who's allowed through*. A subnet with no route to the Internet Gateway is private no matter how open its Security Group is — and a subnet with a route to the IGW is public no matter how strict its Security Group is. These are two independent layers, and mixing them up is one of the most common VPC debugging mistakes.
:::

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

**What this actually builds, step by step:** the VPC and its two subnet pairs (public/private, one of each per AZ) don't do anything on their own — they're just address space. The `aws_nat_gateway` resource is what makes the private subnets' internet access *outbound-only*: it deliberately sits inside the **public** subnet (`aws_subnet.public[0].id`) so it can reach the IGW, but nothing on the internet can initiate a connection back through it. The two route tables are what actually separate "public" from "private" in practice — `aws_route_table.public` sends unmatched traffic (`0.0.0.0/0`) straight to the Internet Gateway, while `aws_route_table.private` sends that same catch-all traffic to the NAT Gateway instead. Everything else about a subnet's identity as public or private ultimately traces back to which of these two route tables it's associated with.

:::tip Try It (2 minutes)
Sketch (on paper or in a text file) a VPC with one public subnet and one private subnet. For each subnet, write down what its `0.0.0.0/0` route table entry points to. Then ask yourself: if you swapped the two entries, what would break? (Answer: the "private" subnet would become directly internet-facing, and the "public" subnet's NAT-dependent instances would lose all outbound internet access, since NAT Gateways themselves must live in a subnet that routes to an IGW.)
:::

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

# Interface endpoint — for other AWS services (hourly rate + data charges apply)
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

*(Interface endpoint hourly rate needs verification — check current AWS PrivateLink pricing per AZ; it is billed per-hour per-AZ plus per-GB data processing, unlike the free Gateway endpoint type.)*

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
