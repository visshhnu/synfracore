# AWS VPC Interview Questions

## Core Concepts

**Q: Explain AWS VPC architecture.**
A Virtual Private Cloud (VPC) is your private network in AWS — logically isolated from other AWS customers.

Key components:
- **CIDR block**: IP range for the VPC (e.g., 10.0.0.0/16 = 65,536 IPs)
- **Subnets**: Divide VPC into smaller networks (public, private, isolated)
- **Route tables**: Control traffic routing within VPC and to internet
- **Internet Gateway (IGW)**: Enables internet access for public subnets
- **NAT Gateway**: Allows private subnets to reach internet (outbound only)
- **Security Groups**: Stateful firewall at instance level (allow rules only)
- **NACLs**: Stateless firewall at subnet level (allow + deny rules)

**Public vs Private subnet:**
Public subnet = route table has route `0.0.0.0/0 → IGW` (internet accessible)
Private subnet = route table has route `0.0.0.0/0 → NAT Gateway` (outbound only)

---

**Q: Security Groups vs Network ACLs — key differences?**

| | Security Group | NACL |
|---|---|---|
| Level | Instance (ENI) | Subnet |
| State | Stateful (return traffic auto-allowed) | Stateless (must allow both directions) |
| Rules | Allow only | Allow + Deny |
| Evaluation | All rules evaluated | Rules in order, first match wins |
| Default | Deny all in, allow all out | Allow all |

**Best practice:** Use Security Groups as primary firewall. Use NACLs for subnet-level blocking (e.g., block specific IPs).

---

**Q: How does VPC peering work? What are its limitations?**

VPC peering creates a private connection between two VPCs (same or different accounts/regions). Traffic stays on AWS backbone — not internet.

```
VPC A (10.0.0.0/16) ←── Peering ──→ VPC B (172.16.0.0/16)
```

**Limitations:**
- Non-transitive: If A peers with B and B peers with C, A cannot reach C through B
- No overlapping CIDR blocks (must use unique IP ranges)
- Not for large-scale connectivity (use Transit Gateway instead)

**Transit Gateway**: Hub-and-spoke model. One TGW connects many VPCs and on-premise networks. Transitive routing supported.

---

**Q: Explain VPC endpoints — Interface vs Gateway.**

VPC Endpoints allow private connectivity to AWS services without internet/NAT.

**Gateway Endpoint**: Free. Route table entry to S3 or DynamoDB only.
```
Route table: pl-xxxxxx (S3 prefix list) → vpce-xxxxxx
```

**Interface Endpoint (PrivateLink)**: Paid. Creates ENI in your subnet with private IP. Works for 100+ AWS services (SQS, SSM, CloudWatch, etc.).

Use case: EC2 in private subnet needs to access S3 → use Gateway Endpoint (free, no NAT cost).

---

**Q: Walk me through designing a 3-tier VPC.**

```
VPC: 10.0.0.0/16

Public Subnets (per AZ): 10.0.1.0/24, 10.0.2.0/24
  → Load Balancer, NAT Gateway, Bastion

Private App Subnets: 10.0.10.0/24, 10.0.11.0/24
  → EC2 / ECS / EKS application tier

Private DB Subnets: 10.0.20.0/24, 10.0.21.0/24
  → RDS, ElastiCache (no internet access)

Route Tables:
Public:   0.0.0.0/0 → IGW
Private:  0.0.0.0/0 → NAT Gateway
DB:       (local only — no internet)

Security Groups:
ALB-SG:  Inbound 80/443 from 0.0.0.0/0
App-SG:  Inbound 8080 from ALB-SG only
DB-SG:   Inbound 5432 from App-SG only
```

## Revision Notes
```
VPC = private isolated network. CIDR defines IP space.
Public subnet = route to IGW | Private = route to NAT GW
SG: stateful, allow only, instance level
NACL: stateless, allow+deny, subnet level, ordered rules
VPC Peering: non-transitive, no overlapping CIDRs
Transit Gateway: hub-and-spoke, transitive routing
Gateway Endpoint: S3+DynamoDB, free
Interface Endpoint: PrivateLink, paid, all other services
```
