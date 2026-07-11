# Cloud Networking & Security — Fundamentals

## Designing a VPC's subnet layout — the decision that shapes everything after it

A VPC's subnet structure is the first real security decision made in any cloud environment, because it determines what's reachable from the internet by default, before a single security group rule is written:

```
VPC: 10.0.0.0/16
├── Public Subnet   (10.0.1.0/24) → Internet Gateway  — load balancers, bastion hosts only
├── Private Subnet  (10.0.2.0/24) → NAT Gateway        — application servers, outbound-only
└── Database Subnet (10.0.3.0/24) → no internet route  — databases, no direct internet path at all
```
The pattern worth internalizing, not just copying: **only what genuinely needs to be reached directly from the internet belongs in a public subnet** — a load balancer, yes; the application servers behind it, no. Application servers in a private subnet can still reach the internet outbound (for package installs, third-party API calls) via a NAT Gateway, without being directly reachable from it — this asymmetry (outbound yes, inbound no) is exactly the security property a private subnet is providing, and a database subnet with no internet route at all is the tightest tier, appropriate for a resource that should never need direct internet access in either direction.

## Security Groups vs. NACLs — a distinction that trips up almost everyone at first

| Property | Security Groups | Network ACLs |
|---|---|---|
| Stateful | Yes — return traffic automatically allowed | No — must explicitly allow both directions |
| Scope | Per instance/ENI | Per subnet |
| Rule evaluation | All rules evaluated, allow wins | Rules evaluated in numbered order, first match wins |
| Default | Deny all inbound, allow all outbound | Allow all (default NACL) |

The stateful/stateless distinction is the one that causes the most real confusion: a Security Group rule allowing inbound HTTPS on port 443 automatically allows the corresponding *outbound* response traffic — you don't write a separate outbound rule for it. A NACL has no such memory — allowing inbound on 443 does nothing for the response unless you also explicitly allow outbound on the ephemeral port range (1024-65535) the client's OS picked for that connection. This is precisely why most real-world designs use Security Groups as the primary, day-to-day control (simpler, stateful) and NACLs sparingly, for an explicit subnet-wide deny rule that Security Groups alone can't express as cleanly (blocking a known-bad IP range at the subnet level, for instance).

## Encryption: the two states, and why both need separate, explicit handling

- **Encryption at rest** — data sitting in storage (S3, RDS, EBS, Blob Storage) protected via AES-256; on AWS/Azure this is typically a checkbox or a KMS key reference at resource-creation time, not something requiring custom code
- **Encryption in transit** — data moving over the network, protected via TLS 1.2+; this needs to be enforced explicitly (a load balancer configured to redirect HTTP→HTTPS, an internal service-to-service call using TLS rather than assuming a "private network" is sufficient protection on its own)

The mistake worth specifically avoiding: assuming a private subnet or VPC boundary is itself sufficient protection for data in transit, and skipping TLS for "internal" traffic. Network segmentation limits *who can reach* a service; TLS protects the *data itself* even if network segmentation is ever bypassed or misconfigured — the two are complementary controls, not substitutes for each other, and skipping TLS "because it's internal" removes a real defense-in-depth layer for a threat model (compromised internal host, misconfigured route) that's more common than it might seem.

## Secrets: never in environment variables checked into anything

```bash
# WRONG — a secret hardcoded or passed as a plain env var in a Dockerfile/manifest
ENV DB_PASSWORD=hunter2

# RIGHT — reference a secrets manager, fetch at runtime
aws secretsmanager get-secret-value --secret-id prod/db/password --query SecretString --output text
```
AWS Secrets Manager and Azure Key Vault both provide the same core capability: secrets are stored encrypted, access is controlled via IAM/RBAC (auditable — you can see exactly which principal accessed which secret and when), and rotation can be automated without redeploying application code. A plain environment variable, by contrast, is visible to anything with access to the process/container's environment, has no access audit trail of its own, and commonly ends up accidentally committed to version control at some point — the entire reason a dedicated secrets manager is the standard, not a preference.

## Zero Trust, as a starting checklist rather than an abstract principle

The three Zero Trust principles are easy to state and easy to leave as slogans — the practical version, as an actual starting checklist:

1. **Verify identity explicitly** — MFA enforced on every account with access to anything sensitive, not just admin accounts; device health checks where the platform supports them
2. **Least privilege access** — start every new role/policy from zero permissions and add only what's actually needed, rather than starting from a broad template and trying to remove access later (which reliably gets skipped under time pressure)
3. **Assume breach** — design as if an attacker will eventually get a foothold somewhere: segment networks so a single compromised host can't reach everything, and monitor traffic broadly enough to actually detect lateral movement if it happens, not just perimeter-crossing traffic
