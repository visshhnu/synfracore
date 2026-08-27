# AWS VPC — Your Private Network in the Cloud

**Before you start:** basic AWS familiarity (Regions, AZs — see the AWS Core Services Overview) is assumed. No prior networking experience is required, though basic IP-addressing concepts help.

A VPC (Virtual Private Cloud) is your own isolated network inside AWS. When you launch EC2 instances, RDS databases, or Lambda functions — they all live inside a VPC. You control the IP ranges, subnets, routing, and firewalls.

:::tip Analogy: A VPC is a gated business park you lease
Think of AWS as one enormous shared city, and your VPC as a gated business park you've leased inside it — nobody else's traffic can wander in unless you build a gate for them. **Subnets** are the individual buildings inside your park, each with its own address range, some facing the street (public) and some tucked in the back with no street entrance (private). The **Internet Gateway** is the park's main street entrance — only buildings with a paved road to it (a route table entry) can be reached from outside. A **NAT Gateway** is like a delivery desk in the front building: back-office buildings can send requests out through it, but strangers on the street can't use it to walk in. **Security Groups** are the individual lock on each building's door (instance-level, remembers who it let out so it can let the reply back in); **NACLs** are the security guard at each building's parking lot entrance (subnet-level, checks every car in and out, remembers nothing between checks).
:::

## VPC Architecture

Traffic from the internet reaches the VPC through one door — the Internet Gateway — before it ever touches a subnet:

```flow
{
  "layout": "flow",
  "steps": [
    { "label": "🌐 Internet", "color": "slate" },
    { "label": "Internet Gateway (IGW)", "sublabel": "The only way in from outside", "color": "green" },
    { "label": "VPC: 10.0.0.0/16", "sublabel": "Everything below lives inside here", "color": "blue" }
  ]
}
```

**Inside the VPC — 4 subnets across 2 Availability Zones:**

```conceptgrid
{
  "boxes": [
    { "title": "Public Subnet (10.0.1.0/24) — AZ-1a", "description": "NAT Gateway (Elastic IP) + App Load Balancer. Route: 0.0.0.0/0 → IGW", "color": "cyan" },
    { "title": "Public Subnet (10.0.2.0/24) — AZ-1b", "description": "NAT Gateway + App Load Balancer (Multi-AZ). Route: 0.0.0.0/0 → IGW", "color": "cyan" },
    { "title": "Private Subnet (10.0.3.0/24) — App Tier", "description": "EC2/ECS app servers. Route: 0.0.0.0/0 → NAT GW", "color": "purple" },
    { "title": "Private Subnet (10.0.4.0/24) — DB Tier", "description": "RDS Primary + Standby (Multi-AZ failover). Route: local only — no internet!", "color": "red" }
  ]
}
```

## Public vs Private Subnets

| | Public Subnet | Private Subnet |
|---|---|---|
| **Internet access** | Direct via IGW | Outbound only via NAT |
| **What lives here** | Load balancers, NAT Gateway | App servers, databases |
| **Public IP** | Assigned automatically | No public IP |
| **Security** | Exposed to internet | Protected |

:::tip Design Rule
**Load Balancers** → Public subnet (need internet access)
**App Servers** → Private subnet (only ALB needs to reach them)
**Databases** → Private subnet with NO internet route
:::

## Security Groups vs Network ACLs

**Security Group** — instance level, stateful (response traffic is auto-allowed, nothing to configure for replies):

```conceptgrid
{
  "boxes": [
    { "title": "✅ Inbound rule", "description": "Port 443 from 0.0.0.0/0", "color": "green" },
    { "title": "✅ Inbound rule", "description": "Port 22 from 10.0.0.0/8", "color": "green" },
    { "title": "🔄 Stateful", "description": "Response traffic auto-allowed", "color": "green" },
    { "title": "Allow rules only", "description": "All rules evaluated together — no explicit deny", "color": "blue" }
  ]
}
```

**Network ACL** — subnet level, stateless (nothing is remembered between checks, so return traffic needs its own explicit rule):

```conceptgrid
{
  "boxes": [
    { "title": "Rule 100", "description": "Allow 443 inbound", "color": "amber" },
    { "title": "Rule 200", "description": "Deny specific IP inbound", "color": "amber" },
    { "title": "Ephemeral ports", "description": "Must also allow 1024-65535 for replies", "color": "amber" },
    { "title": "Allow AND Deny rules", "description": "Evaluated in order — lowest rule number first", "color": "slate" }
  ]
}
```

## Annotated Example: Quick Setup with AWS CLI

This is the minimum sequence to make one subnet in a new VPC actually reachable from the internet — each step exists because the previous one alone isn't enough:

```bash
# 1. Create the VPC itself — just an empty, isolated /16 address space so far.
#    Nothing inside it can reach the internet yet, even though the VPC now exists.
aws ec2 create-vpc --cidr-block 10.0.0.0/16 \
    --tag-specifications 'ResourceType=vpc,Tags=[{Key=Name,Value=prod-vpc}]'

# 2. Carve out one subnet (a /24 slice of the VPC's /16) in a specific AZ.
#    A subnet is still private by default — creating it does NOT grant internet access.
aws ec2 create-subnet --vpc-id vpc-xxx \
    --cidr-block 10.0.1.0/24 --availability-zone us-east-1a

# 3. Create an Internet Gateway and attach it to the VPC — this is the VPC's
#    only door to the internet. One IGW per VPC. Attaching it still isn't
#    enough on its own: nothing routes traffic to it yet.
aws ec2 create-internet-gateway
aws ec2 attach-internet-gateway --vpc-id vpc-xxx --internet-gateway-id igw-xxx

# 4. Add a route so traffic actually gets sent to that door. Without this
#    route, instances in the subnet still have no path out — this is the
#    step that turns a subnet from "private" into "public".
aws ec2 create-route --route-table-id rtb-xxx \
    --destination-cidr-block 0.0.0.0/0 --gateway-id igw-xxx
```

The instance itself still needs a public IP (or an Elastic IP) to be reachable — the route only makes the *path* exist, it doesn't assign the instance an internet-routable address.

:::tip Try It (2 minutes)
In the AWS Console, open VPC → **Your VPCs** → find the **default VPC** in your account's default region. Click into it, then open its **Route Table**. Find the row with destination `0.0.0.0/0` — its target should be an `igw-...` ID. That single row is the entire difference between a public and a private subnet: everything else (security groups, NACLs) filters traffic, but this route table entry is what decides whether traffic can leave to the internet at all.
:::
