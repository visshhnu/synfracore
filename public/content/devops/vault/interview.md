# Vault Interview Questions

**Q: What's the difference between a static and a dynamic secret in Vault?**
A: A static secret (stored via the KV engine) is written once and read back unchanged until someone manually rotates it — the same long-lived-credential risk profile as a hardcoded password, just centrally stored. A dynamic secret (database, PKI, AWS engines, etc.) is generated fresh by Vault at request time with a defined TTL and tracked via a lease, automatically revoked (the underlying resource actually deleted/expired) when that lease ends — a meaningfully smaller attack surface by design, not by relying on someone remembering to rotate it.

**Q: What happens when Vault is sealed, and how do you unseal it?**
A: A sealed Vault can't decrypt its own storage or serve any requests at all — it's completely inert. Unsealing requires either a threshold of Shamir unseal key shares (generated once at `vault operator init`) submitted separately, or an auto-unseal configuration delegating that to a cloud KMS, which unseals automatically on restart without human intervention.

**Q: What's a Vault "lease," and why does it matter?**
A: A lease is the record Vault keeps of a granted dynamic secret — its TTL, and enough information for Vault to actually revoke the underlying resource (a database user, an issued certificate) when the lease expires or is explicitly revoked. Leases are what make dynamic secrets self-cleaning rather than just self-expiring in name only.

**Q: What's the difference between authentication and authorization in Vault?**
A: Authentication (an auth method — token, AppRole, Kubernetes, etc.) establishes WHO is making a request, resulting in a Vault token. Authorization (policies attached to that token) determines WHAT that authenticated identity is actually allowed to do. Vault denies by default — a token with no matching policy grant has zero access, even if authentication itself succeeded.

**Q: Why is Kubernetes auth considered a good solution to the "secret zero" problem for in-cluster applications?**
A: Secret zero is the bootstrapping problem — something needs an initial credential to authenticate to Vault at all. Kubernetes auth lets a Pod authenticate using its own ServiceAccount token, which Kubernetes itself already provisions and manages — no separate static credential needs to be generated, distributed, and protected just for the purpose of letting the application talk to Vault in the first place.

**Q: What's the Transit secrets engine, and how is it different from KV?**
A: Transit provides encryption as a service — Vault never stores your actual data, only the encryption keys, performing encrypt/decrypt operations on request. KV, by contrast, actually stores the secret value itself. An application using Transit can encrypt sensitive data before storing it anywhere else, without needing to handle raw encryption key material in its own code.

**Q: What's response wrapping, and when would you use it?**
A: Response wrapping returns a single-use wrapping token instead of the actual secret value — only the intended recipient's one-time unwrap ever sees the real data. It's used when a secret needs to pass through a system (a CI pipeline, an orchestration layer) that shouldn't itself be able to read it, and provides tamper detection: if the wrapping token is intercepted and used first, the legitimate recipient's unwrap attempt fails, signaling something was compromised.

**Q: What's the difference between Vault's open-source and Enterprise editions, functionally?**
A: Open-source Vault covers the core secrets management, dynamic secrets, auth methods, and policy model. Enterprise adds namespaces (multi-tenancy within one cluster), Performance and Disaster Recovery Replication across clusters, and Sentinel policy-as-code for richer conditional governance beyond simple path-based ACLs — features aimed at larger organizations with multi-team or multi-region/compliance requirements.

**Q: How would you migrate an application from a hardcoded database password to Vault dynamic secrets?**
A: Configure and test the database secrets engine independently first (confirm generated credentials actually work against the real database) before touching the application. Set up the application's auth method (commonly Kubernetes auth for an in-cluster app) so it can authenticate to Vault. Update the application to fetch credentials from Vault at startup (directly or via Vault Agent) instead of reading a static environment variable, deploying to non-production first. Only after confirming the new path works end-to-end, remove the old hardcoded credential — and rotate the underlying database password, since the old value should be considered compromised simply for having existed in plaintext.

**Q: What's a genuine tradeoff of auto-unseal versus manual Shamir-based unsealing?**
A: Auto-unseal (via a cloud KMS) is far more operationally resilient — Vault unseals itself automatically on restart, no human paging required. Manual Shamir unsealing requires a threshold of separately-held key shares to cooperate, which is operationally heavier but provides a genuinely stronger "no single point of trust" guarantee, since no single human or system alone can unseal Vault. Most production deployments choose auto-unseal for operational reasons; very-high-security root-of-trust scenarios may still prefer manual Shamir unsealing despite the cost.

## Skills Employers Value

```
LEAST-PRIVILEGE POLICY DESIGN: scoping policies to exactly what's
  needed, not broad wildcards -- a real, commonly-tested skill
DYNAMIC SECRETS MIGRATION: converting static, long-lived credentials
  to Vault-generated dynamic ones across real application stacks
AUTH METHOD SELECTION: choosing the right auth method for a given
  client type (Kubernetes for in-cluster apps, AppRole for CI/CD,
  OIDC for humans) rather than defaulting to one for everything
OPERATIONAL RESILIENCE: understanding seal/unseal, HA/Raft, and
  auto-unseal well enough to reason about real failure scenarios
SALARY: Vault/secrets-management expertise commands a premium within
  DevOps/platform engineering roles, particularly at organizations
  with real compliance requirements `(needs verification -- recheck
  current salary bands against current industry salary survey data
  before citing a specific figure)`
```
