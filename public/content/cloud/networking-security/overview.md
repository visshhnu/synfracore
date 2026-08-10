# Cloud Networking and Security — Overview

**Before you start:** basic AWS VPC and/or Azure VNet familiarity (subnets, route tables — see those courses first if new) is assumed, since this page builds directly on those platform-specific building blocks rather than re-teaching them. No prior security-specific background is required — Zero Trust, encryption, and WAF concepts are explained from scratch below.

## Why Networking and Security are Inseparable

Every cloud resource exists inside a network. Network design determines what can talk to what. Security determines who can talk and whether data is encrypted. Both must be designed together from day one.

## Why this exists (the hook)

A public S3 bucket leaking customer data and a database directly reachable from the internet are, at the root, the same mistake: something was made reachable that shouldn't have been. Networking and security aren't two separate checklists to work through — networking decides *what can physically reach what*, and security decides *who's allowed to use that reachability and whether the data itself is protected regardless*. Design one without the other and you get either a system that's technically unreachable but has no defense if that changes, or a system with strong access rules sitting on a network that exposes it directly anyway.

## Analogy

Think of a VPC's subnet layout like a building's floor plan, and security controls like the building's access policy. The floor plan decides which rooms have a door to the street (public subnet), which rooms only connect to a lobby that connects to the street (private subnet, NAT-routed), and which rooms have no door to the outside at all (database subnet, no internet route). Security Groups and NACLs are the locks on those doors — even a room with no street-facing door still needs its internal doors locked, because the floor plan alone doesn't stop someone who's already inside the building from wandering into the wrong room.

## How it fits together (diagram)

```
                 Internet
                    │
             ┌──────▼──────┐
             │   Internet   │
             │   Gateway    │
             └──────┬──────┘
                     │
      ┌──────────────▼──────────────┐
      │        Public Subnet         │  ← load balancer, bastion ONLY
      └──────────────┬──────────────┘
                     │ (NAT Gateway — outbound only)
      ┌──────────────▼──────────────┐
      │       Private Subnet         │  ← application servers
      └──────────────┬──────────────┘
                     │ (no internet route at all)
      ┌──────────────▼──────────────┐
      │       Database Subnet        │  ← databases, never internet-reachable
      └───────────────────────────────┘

Security Groups (stateful, per-instance) and NACLs (stateless,
per-subnet) are enforced at every layer above — the network
topology limits WHAT can reach a resource; SGs/NACLs limit WHO,
on WHICH port, is actually allowed through.
```

## Try it yourself (2 minutes)

Pick a web application you're familiar with (even a side project) and sketch which of its components belong in a public subnet, which in a private subnet, and which in a database subnet, using the rule "only what genuinely needs a direct internet-facing door goes in public." Most real applications have exactly one thing that belongs in the public subnet — the load balancer — with everything else, including the application servers themselves, one layer back in private.

## AWS Networking

### VPC Structure
```
VPC: 10.0.0.0/16
Public Subnet  → Internet Gateway (internet access)
Private Subnet → NAT Gateway (outbound only)
Database Subnet → No internet access
```

### Security Groups vs NACLs
| Feature | Security Groups | Network ACLs |
|---------|----------------|-------------|
| Stateful | Yes | No |
| Scope | Per instance | Per subnet |
| Return traffic | Automatic | Must allow explicitly |

### VPC Connectivity
| Need | Solution |
|------|---------|
| VPC to VPC same account | VPC Peering |
| Multi-account networking | Transit Gateway |
| On-premises (dedicated) | AWS Direct Connect |
| Private access to AWS services | VPC Endpoints |

## Azure Networking

### VNet Structure
```
VNet: 10.1.0.0/16
Frontend Subnet → NSG (web tier)
Backend Subnet  → NSG (app tier)
Database Subnet → NSG + Private Endpoints
```

### NSG vs Azure Firewall
| Feature | NSG | Azure Firewall |
|---------|-----|---------------|
| Layer | L4 | L4 + L7 |
| FQDN filtering | No | Yes |
| Cost | Free | Paid *(needs verification — Azure Firewall's hourly rate changes with SKU/region; previously stated here as ~$1.25/hour)* |

## WAF — Web Application Firewall

A WAF operates at Layer 7, inspecting actual HTTP request content — not just source/destination/port like a Security Group, NSG, or NACL, and not just protocol/FQDN like Azure Firewall. It's the layer that catches things a network-layer firewall structurally can't see: a SQL injection payload in a POST body, a cross-site-scripting attempt in a query parameter, a request pattern matching a known bad bot signature.

```
AWS WAF                                Azure WAF (on Application Gateway/Front Door)
────────                               ──────────────────────────────────────────
Attached to CloudFront, ALB,           Attached to Application Gateway or
or API Gateway                         Front Door — not a standalone resource

Managed Rule Groups: OWASP Top 10,     Managed Rule Sets: OWASP Core Rule Set
known bad IPs, SQLi/XSS signatures     (CRS), bot protection

Rate-based rules: block an IP          Custom + managed rules combined,
sending >N requests per 5 min          evaluated in Prevention or Detection mode
```

WAF and network-layer controls (Security Groups, NACLs, NSGs, Azure Firewall) aren't substitutes for each other — a WAF blocking a malicious HTTP payload does nothing to stop an internal service from being reachable on a port it shouldn't be, and a tightly-scoped Security Group does nothing to stop a SQL injection string arriving on a port it explicitly allowed open. Real production setups run both layers together, not one instead of the other.

## Zero Trust Principles
1. Verify identity explicitly — MFA, device health check, location
2. Least privilege access — RBAC, just-in-time access
3. Assume breach — segment everything, monitor all traffic

## Encryption Checklist
- Storage: AES-256 encryption at rest (S3, RDS, EBS, Blob Storage)
- Transit: TLS 1.2+ enforced everywhere
- Secrets: AWS Secrets Manager or Azure Key Vault — never environment variables
