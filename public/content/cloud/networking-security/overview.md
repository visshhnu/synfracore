# Cloud Networking and Security — Overview

## Why Networking and Security are Inseparable

Every cloud resource exists inside a network. Network design determines what can talk to what. Security determines who can talk and whether data is encrypted. Both must be designed together from day one.

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
| Cost | Free | Paid (~$1.25/hour) |

## Zero Trust Principles
1. Verify identity explicitly — MFA, device health check, location
2. Least privilege access — RBAC, just-in-time access
3. Assume breach — segment everything, monitor all traffic

## Encryption Checklist
- Storage: AES-256 encryption at rest (S3, RDS, EBS, Blob Storage)
- Transit: TLS 1.2+ enforced everywhere
- Secrets: AWS Secrets Manager or Azure Key Vault — never environment variables
