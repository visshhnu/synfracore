# Cloud Networking & Security — Quick Reference

## Security Groups vs. NACLs

| | Security Groups | NACLs |
|---|---|---|
| Stateful | Yes | No — must allow both directions explicitly |
| Scope | Per instance/ENI | Per subnet |
| Evaluation | All rules, allow wins | Numbered order, first match wins |

## VPC connectivity — which solution for which need

| Need | Solution |
|---|---|
| VPC to VPC, same account | VPC Peering |
| Many VPCs, multi-account | Transit Gateway |
| On-premises, dedicated | AWS Direct Connect / Azure ExpressRoute |
| Private access to AWS/Azure services | VPC Endpoints / Private Endpoints |
| Cross-cloud, low volume | Site-to-site VPN |

## Common ports to know cold

| Port | Service |
|---|---|
| 22 | SSH |
| 80 / 443 | HTTP / HTTPS |
| 53 | DNS |
| 3389 | RDP |
| 5432 / 3306 | PostgreSQL / MySQL |
| 6379 | Redis |

## CIDR quick reference

| CIDR | Addresses | Typical use |
|---|---|---|
| /32 | 1 | Single host |
| /28 | 16 | Small subnet |
| /24 | 256 | Typical subnet |
| /16 | 65,536 | Entire VPC range |

## AWS networking commands

```bash
# Create a VPC Endpoint (gateway type — S3/DynamoDB, free)
aws ec2 create-vpc-endpoint --vpc-id vpc-xxx --service-name com.amazonaws.us-east-1.s3 --route-table-ids rtb-xxx

# Enable VPC Flow Logs
aws ec2 create-flow-logs --resource-type VPC --resource-ids vpc-xxx --traffic-type ALL --log-destination-type cloud-watch-logs --log-group-name /vpc/flow-logs

# Enable DNS resolution across a VPC peering connection (both sides needed)
aws ec2 modify-vpc-peering-connection-options --vpc-peering-connection-id pcx-xxx --accepter-peering-connection-options AllowDnsResolutionFromRemoteVpc=true

# Check Security Group rules for an instance
aws ec2 describe-security-groups --group-ids sg-xxx
```

## Encryption checklist

```
[ ] Storage encrypted at rest (S3, RDS, EBS, Blob Storage) — AES-256
[ ] TLS 1.2+ enforced on every internet-facing endpoint
[ ] TLS used for internal service-to-service traffic too — a private
    network is not a substitute for encryption in transit
[ ] Secrets in AWS Secrets Manager / Azure Key Vault — never in
    environment variables or committed config
[ ] Secret rotation automated where the platform supports it
```

## Zero Trust starting checklist

```
[ ] MFA enforced on every account with sensitive access
[ ] Least privilege — roles start at zero permissions, add only what's needed
[ ] Network segmented — a compromised host can't reach everything
[ ] Flow logs / traffic monitoring enabled — "assume breach" needs visibility
[ ] Micro-segmentation at the workload level for highest-risk systems
```

## Troubleshooting order for "traffic is blocked, rule looks correct"

```
1. Route table — does a route to the destination actually exist?
2. NACL — stateless, check both directions explicitly
3. Security Group — stateful, but confirm the actual rule scope/source
4. OS-level firewall on the resource itself (iptables, Windows Firewall)
```
