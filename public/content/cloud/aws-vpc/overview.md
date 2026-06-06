# AWS VPC — Virtual Private Cloud

VPC is your private network inside AWS. Every EC2 instance, RDS database, and Lambda function lives inside a VPC. Understanding VPC deeply is essential for cloud security and architecture.

## What is a VPC?

A Virtual Private Cloud is a logically isolated section of the AWS cloud where you launch resources in a virtual network you define. You control:
- IP address ranges (CIDR blocks)
- Subnets (public vs private)
- Route tables
- Network gateways
- Security (Security Groups + NACLs)

Every AWS account gets a **default VPC** in each region (172.31.0.0/16) with public subnets. For production, always create custom VPCs.

## VPC Architecture — Production Pattern

```
VPC: 10.0.0.0/16
├── us-east-1a
│   ├── Public Subnet:  10.0.1.0/24   (ALB, NAT Gateway, Bastion)
│   └── Private Subnet: 10.0.11.0/24  (App servers, EKS nodes)
│   └── Data Subnet:    10.0.21.0/24  (RDS, ElastiCache)
│
├── us-east-1b
│   ├── Public Subnet:  10.0.2.0/24
│   └── Private Subnet: 10.0.12.0/24
│   └── Data Subnet:    10.0.22.0/24
│
└── us-east-1c
    ├── Public Subnet:  10.0.3.0/24
    └── Private Subnet: 10.0.13.0/24
    └── Data Subnet:    10.0.23.0/24
```

## Core Components

**Subnets** — Subdivisions of your VPC's IP range, tied to one AZ. Public subnets route to the Internet Gateway. Private subnets route outbound through NAT Gateway.

**Internet Gateway (IGW)** — Allows communication between VPC and the internet. One per VPC. Attached to the VPC, not subnets. Public subnets route 0.0.0.0/0 to IGW.

**NAT Gateway** — Allows private subnet resources to initiate outbound internet connections (software updates, API calls) without being publicly accessible. Managed, highly available per AZ. Has an hourly + data processing cost.

**Route Tables** — Rules that determine where network traffic is directed. Each subnet has one route table. Public subnets: route 0.0.0.0/0 → IGW. Private subnets: route 0.0.0.0/0 → NAT Gateway.

**Security Groups** — Stateful firewall at the ENI (instance) level. Allow-only rules.

**Network ACLs (NACLs)** — Stateless firewall at the subnet level. Allow and deny rules. Evaluated in order by rule number.

**VPC Endpoints** — Private connectivity to AWS services (S3, DynamoDB, SSM) without internet traffic. Interface endpoints (PrivateLink) and Gateway endpoints.

**VPC Peering** — Connect two VPCs privately. Non-transitive (A↔B, B↔C does not mean A↔C).

**Transit Gateway** — Hub-and-spoke network. Connect many VPCs and on-premises networks through one gateway. Transitive routing supported.

## CIDR Planning

```
Production best practices:
- Use /16 for VPC (65,536 IPs)
- Use /24 for subnets (256 IPs, 251 usable — AWS reserves 5)
- Leave room to grow — don't use 10.0.0.0/8 entirely
- Use different ranges for each environment (dev/staging/prod)
  to enable VPC peering without overlap

Example multi-account strategy:
prod:    10.0.0.0/16
staging: 10.1.0.0/16
dev:     10.2.0.0/16
shared:  10.3.0.0/16
```

## DNS in VPC

Two VPC DNS settings (both default to true for custom VPCs):
- **enableDnsSupport** — Enables DNS resolution via Route 53 Resolver
- **enableDnsHostnames** — Gives instances public DNS hostnames

Private hosted zones in Route 53 can be associated with VPCs for internal DNS resolution.
