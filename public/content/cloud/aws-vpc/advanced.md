# AWS VPC — Advanced

## Network Firewall

```yaml
# AWS Network Firewall — layer 7 firewall at VPC boundary
# Sits between IGW and public subnets

# Stateful rules (Suricata-compatible)
StatefulRuleGroup:
  Type: AWS::NetworkFirewall::RuleGroup
  Properties:
    RuleGroupName: block-threats
    Type: STATEFUL
    Capacity: 100
    RuleGroup:
      RulesSource:
        StatefulRules:
          # Block known malware C2 domains
          - Action: DROP
            Header:
              Direction: ANY
              Protocol: HTTP
              Destination: ANY
              Source: ANY
            RuleOptions:
              - Keyword: content
                Settings: ['"malware-domain.com"']
              - Keyword: http.host

          # Allow only specific outbound ports
          - Action: PASS
            Header:
              Direction: FORWARD
              Protocol: TCP
              Source: "10.0.0.0/8"
              SourcePort: ANY
              Destination: ANY
              DestinationPort: "443"
```

## IPv6 and Dual-Stack

```hcl
# Enable IPv6 — AWS assigns /56 CIDR for free
resource "aws_vpc" "main" {
  cidr_block                       = "10.0.0.0/16"
  assign_generated_ipv6_cidr_block = true   # AWS assigns /56
  enable_dns_hostnames             = true
}

resource "aws_subnet" "public" {
  vpc_id          = aws_vpc.main.id
  cidr_block      = "10.0.1.0/24"
  # IPv6 — each subnet gets /64 from the VPC's /56
  ipv6_cidr_block = cidrsubnet(aws_vpc.main.ipv6_cidr_block, 8, 1)
  assign_ipv6_address_on_creation = true
}

# Egress-Only IGW for private subnet IPv6 outbound (like NAT for IPv4)
resource "aws_egress_only_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
}

resource "aws_route" "ipv6_private_egress" {
  route_table_id              = aws_route_table.private.id
  destination_ipv6_cidr_block = "::/0"
  egress_only_gateway_id      = aws_egress_only_internet_gateway.main.id
}
```

## VPC Cheatsheet

```bash
# ── CREATION ──────────────────────────────────────────────
aws ec2 create-vpc --cidr-block 10.0.0.0/16
aws ec2 create-subnet --vpc-id vpc-x --cidr-block 10.0.1.0/24 --availability-zone us-east-1a
aws ec2 create-internet-gateway
aws ec2 attach-internet-gateway --vpc-id vpc-x --internet-gateway-id igw-x
aws ec2 create-nat-gateway --subnet-id subnet-x --allocation-id eipalloc-x

# ── ROUTING ────────────────────────────────────────────────
aws ec2 create-route-table --vpc-id vpc-x
aws ec2 create-route --route-table-id rtb-x --destination-cidr-block 0.0.0.0/0 --gateway-id igw-x
aws ec2 associate-route-table --subnet-id subnet-x --route-table-id rtb-x

# ── SECURITY ──────────────────────────────────────────────
aws ec2 create-security-group --group-name web-sg --description "Web" --vpc-id vpc-x
aws ec2 authorize-security-group-ingress --group-id sg-x --protocol tcp --port 443 --cidr 0.0.0.0/0

# ── INSPECTION ────────────────────────────────────────────
aws ec2 describe-vpcs --query 'Vpcs[*].[VpcId,CidrBlock,Tags[?Key==`Name`].Value|[0]]' --output table
aws ec2 describe-subnets --filters "Name=vpc-id,Values=vpc-x" --query 'Subnets[*].[SubnetId,CidrBlock,AvailabilityZone]' --output table
aws ec2 describe-route-tables --filters "Name=vpc-id,Values=vpc-x"
aws ec2 describe-security-groups --filters "Name=vpc-id,Values=vpc-x"

# ── FLOW LOGS ─────────────────────────────────────────────
aws ec2 describe-flow-logs --filter "Name=resource-id,Values=vpc-x"
```
