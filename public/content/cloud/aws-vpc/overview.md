# AWS VPC — Your Private Network in the Cloud

A VPC (Virtual Private Cloud) is your own isolated network inside AWS. When you launch EC2 instances, RDS databases, or Lambda functions — they all live inside a VPC. You control the IP ranges, subnets, routing, and firewalls.

## VPC Architecture

```svg
<svg viewBox="0 0 740 460" xmlns="http://www.w3.org/2000/svg" style="max-width:100%;font-family:Inter,sans-serif">
  <!-- Internet -->
  <rect x="290" y="10" width="160" height="44" rx="10" fill="#1F2937" stroke="#6B7280" stroke-width="1.5"/>
  <text x="370" y="36" font-size="13" fill="#9CA3AF" text-anchor="middle" font-weight="700">🌐 Internet</text>
  <line x1="370" y1="54" x2="370" y2="76" stroke="#6B7280" stroke-width="1.5" stroke-dasharray="4,2"/>

  <!-- Internet Gateway -->
  <rect x="270" y="76" width="200" height="36" rx="8" fill="#064E3B" stroke="#10B981" stroke-width="1.5"/>
  <text x="370" y="98" font-size="12" fill="#34D399" text-anchor="middle" font-weight="700">Internet Gateway (IGW)</text>
  <line x1="370" y1="112" x2="370" y2="132" stroke="#10B981" stroke-width="1.5"/>

  <!-- VPC border -->
  <rect x="20" y="132" width="700" height="316" rx="14" fill="none" stroke="#3B82F6" stroke-width="2" stroke-dasharray="8,3"/>
  <text x="46" y="156" font-size="12" fill="#60A5FA" font-weight="700">VPC: 10.0.0.0/16</text>

  <!-- Public Subnet 1 -->
  <rect x="36" y="166" width="295" height="120" rx="10" fill="#0C4A6E" stroke="#0284C7" stroke-width="1.5"/>
  <text x="183" y="188" font-size="11" fill="#7DD3FC" text-anchor="middle" font-weight="700">Public Subnet (10.0.1.0/24) — AZ-1a</text>

  <!-- NAT Gateway in public subnet -->
  <rect x="54" y="198" width="124" height="36" rx="7" fill="#065F46" stroke="#059669" stroke-width="1"/>
  <text x="116" y="214" font-size="10" fill="#6EE7B7" text-anchor="middle" font-weight="700">NAT Gateway</text>
  <text x="116" y="227" font-size="9" fill="#34D399" text-anchor="middle">Elastic IP attached</text>

  <!-- ALB in public subnet -->
  <rect x="190" y="198" width="124" height="36" rx="7" fill="#1E3A5F" stroke="#3B82F6" stroke-width="1"/>
  <text x="252" y="214" font-size="10" fill="#93C5FD" text-anchor="middle" font-weight="700">App Load Balancer</text>
  <text x="252" y="227" font-size="9" fill="#60A5FA" text-anchor="middle">Public-facing</text>

  <!-- Route table public -->
  <rect x="54" y="248" width="260" height="28" rx="6" fill="#082F49" stroke="#0284C7" stroke-width="1"/>
  <text x="184" y="265" font-size="9" fill="#7DD3FC" text-anchor="middle">Route: 0.0.0.0/0 → IGW | 10.0.0.0/16 → local</text>

  <!-- Public Subnet 2 -->
  <rect x="409" y="166" width="295" height="120" rx="10" fill="#0C4A6E" stroke="#0284C7" stroke-width="1.5"/>
  <text x="556" y="188" font-size="11" fill="#7DD3FC" text-anchor="middle" font-weight="700">Public Subnet (10.0.2.0/24) — AZ-1b</text>
  <rect x="427" y="198" width="124" height="36" rx="7" fill="#065F46" stroke="#059669" stroke-width="1"/>
  <text x="489" y="214" font-size="10" fill="#6EE7B7" text-anchor="middle" font-weight="700">NAT Gateway</text>
  <text x="489" y="227" font-size="9" fill="#34D399" text-anchor="middle">Elastic IP attached</text>
  <rect x="559" y="198" width="124" height="36" rx="7" fill="#1E3A5F" stroke="#3B82F6" stroke-width="1"/>
  <text x="621" y="214" font-size="10" fill="#93C5FD" text-anchor="middle" font-weight="700">App Load Balancer</text>
  <text x="621" y="227" font-size="9" fill="#60A5FA" text-anchor="middle">Multi-AZ</text>
  <rect x="427" y="248" width="260" height="28" rx="6" fill="#082F49" stroke="#0284C7" stroke-width="1"/>
  <text x="557" y="265" font-size="9" fill="#7DD3FC" text-anchor="middle">Route: 0.0.0.0/0 → IGW | 10.0.0.0/16 → local</text>

  <!-- Private Subnet App -->
  <rect x="36" y="302" width="295" height="80" rx="10" fill="#2D1B69" stroke="#7C3AED" stroke-width="1.5"/>
  <text x="183" y="322" font-size="11" fill="#C4B5FD" text-anchor="middle" font-weight="700">Private Subnet (10.0.3.0/24) — App Tier</text>
  <rect x="54" y="332" width="124" height="36" rx="7" fill="#4C1D95" stroke="#8B5CF6" stroke-width="1"/>
  <text x="116" y="348" font-size="10" fill="#DDD6FE" text-anchor="middle" font-weight="700">EC2 / ECS</text>
  <text x="116" y="361" font-size="9" fill="#C4B5FD" text-anchor="middle">App servers</text>
  <rect x="190" y="332" width="124" height="36" rx="7" fill="#4C1D95" stroke="#8B5CF6" stroke-width="1"/>
  <text x="252" y="348" font-size="10" fill="#DDD6FE" text-anchor="middle" font-weight="700">EC2 / ECS</text>
  <text x="252" y="361" font-size="9" fill="#C4B5FD" text-anchor="middle">App servers</text>

  <!-- Private Subnet DB -->
  <rect x="409" y="302" width="295" height="80" rx="10" fill="#7F1D1D" stroke="#EF4444" stroke-width="1.5"/>
  <text x="556" y="322" font-size="11" fill="#FCA5A5" text-anchor="middle" font-weight="700">Private Subnet (10.0.4.0/24) — DB Tier</text>
  <rect x="427" y="332" width="124" height="36" rx="7" fill="#991B1B" stroke="#DC2626" stroke-width="1"/>
  <text x="489" y="348" font-size="10" fill="#FEE2E2" text-anchor="middle" font-weight="700">RDS Primary</text>
  <text x="489" y="361" font-size="9" fill="#FCA5A5" text-anchor="middle">No internet access</text>
  <rect x="559" y="332" width="124" height="36" rx="7" fill="#991B1B" stroke="#DC2626" stroke-width="1"/>
  <text x="621" y="348" font-size="10" fill="#FEE2E2" text-anchor="middle" font-weight="700">RDS Standby</text>
  <text x="621" y="361" font-size="9" fill="#FCA5A5" text-anchor="middle">Multi-AZ failover</text>

  <!-- Route notes -->
  <rect x="36" y="396" width="295" height="36" rx="6" fill="#1C1917" stroke="#78716C" stroke-width="1"/>
  <text x="183" y="416" font-size="9" fill="#D6D3D1" text-anchor="middle">Route: 0.0.0.0/0 → NAT GW | 10.0.0.0/16 → local</text>
  <rect x="409" y="396" width="295" height="36" rx="6" fill="#1C1917" stroke="#78716C" stroke-width="1"/>
  <text x="556" y="416" font-size="9" fill="#D6D3D1" text-anchor="middle">Route: 10.0.0.0/16 → local only (no internet!)</text>

  <!-- Flow arrows -->
  <line x1="183" y1="286" x2="183" y2="302" stroke="#7C3AED" stroke-width="1.5" marker-end="url(#ap)"/>
  <line x1="116" y1="234" x2="116" y2="248" stroke="#059669" stroke-width="1.5"/>
  <defs><marker id="ap" markerWidth="7" markerHeight="5" refX="7" refY="2.5" orient="auto"><polygon points="0 0,7 2.5,0 5" fill="#7C3AED"/></marker></defs>
</svg>
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

```svg
<svg viewBox="0 0 720 220" xmlns="http://www.w3.org/2000/svg" style="max-width:100%;font-family:Inter,sans-serif">
  <!-- Security Group side -->
  <rect x="10" y="10" width="330" height="200" rx="12" fill="#0F172A" stroke="#10B981" stroke-width="2"/>
  <text x="175" y="38" font-size="13" fill="#34D399" text-anchor="middle" font-weight="800">Security Group</text>
  <text x="175" y="56" font-size="10" fill="#6EE7B7" text-anchor="middle">Instance level · Stateful</text>

  <rect x="26" y="68" width="298" height="26" rx="6" fill="#064E3B" stroke="#059669" stroke-width="1"/>
  <text x="175" y="85" font-size="10" fill="#A7F3D0" text-anchor="middle">✅ Inbound: Port 443 from 0.0.0.0/0</text>
  <rect x="26" y="100" width="298" height="26" rx="6" fill="#064E3B" stroke="#059669" stroke-width="1"/>
  <text x="175" y="117" font-size="10" fill="#A7F3D0" text-anchor="middle">✅ Inbound: Port 22 from 10.0.0.0/8</text>
  <rect x="26" y="132" width="298" height="26" rx="6" fill="#064E3B" stroke="#059669" stroke-width="1"/>
  <text x="175" y="149" font-size="10" fill="#A7F3D0" text-anchor="middle">🔄 Response traffic auto-allowed (stateful)</text>

  <rect x="26" y="166" width="298" height="36" rx="6" fill="#172554"/>
  <text x="175" y="182" font-size="10" fill="#BFDBFE" text-anchor="middle">Allow rules only</text>
  <text x="175" y="196" font-size="10" fill="#93C5FD" text-anchor="middle">All rules evaluated together</text>

  <!-- NACL side -->
  <rect x="380" y="10" width="330" height="200" rx="12" fill="#0F172A" stroke="#F59E0B" stroke-width="2"/>
  <text x="545" y="38" font-size="13" fill="#FCD34D" text-anchor="middle" font-weight="800">Network ACL</text>
  <text x="545" y="56" font-size="10" fill="#FDE68A" text-anchor="middle">Subnet level · Stateless</text>

  <rect x="396" y="68" width="298" height="26" rx="6" fill="#78350F" stroke="#D97706" stroke-width="1"/>
  <text x="545" y="85" font-size="10" fill="#FDE68A" text-anchor="middle">Rule 100: Allow 443 inbound</text>
  <rect x="396" y="100" width="298" height="26" rx="6" fill="#78350F" stroke="#D97706" stroke-width="1"/>
  <text x="545" y="117" font-size="10" fill="#FDE68A" text-anchor="middle">Rule 200: Deny specific IP inbound</text>
  <rect x="396" y="132" width="298" height="26" rx="6" fill="#78350F" stroke="#D97706" stroke-width="1"/>
  <text x="545" y="149" font-size="10" fill="#FDE68A" text-anchor="middle">Must also allow ephemeral ports 1024-65535</text>

  <rect x="396" y="166" width="298" height="36" rx="6" fill="#1C1917"/>
  <text x="545" y="182" font-size="10" fill="#FDE68A" text-anchor="middle">Allow AND Deny rules</text>
  <text x="545" y="196" font-size="10" fill="#FCD34D" text-anchor="middle">Rules evaluated in order (lowest number first)</text>
</svg>
```

## Quick Setup with AWS CLI

```bash
# Create VPC
aws ec2 create-vpc --cidr-block 10.0.0.0/16 \
    --tag-specifications 'ResourceType=vpc,Tags=[{Key=Name,Value=prod-vpc}]'

# Create public subnet
aws ec2 create-subnet --vpc-id vpc-xxx \
    --cidr-block 10.0.1.0/24 --availability-zone us-east-1a

# Create Internet Gateway and attach
aws ec2 create-internet-gateway
aws ec2 attach-internet-gateway --vpc-id vpc-xxx --internet-gateway-id igw-xxx

# Add route for public subnet
aws ec2 create-route --route-table-id rtb-xxx \
    --destination-cidr-block 0.0.0.0/0 --gateway-id igw-xxx
```
