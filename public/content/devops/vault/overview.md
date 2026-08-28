# HashiCorp Vault

> **Secrets management, encryption as a service, and identity-based access**

**Category:** Security & Secrets Management
**Learning Path:** What → Why → Learning Modules → Production Example → Interview Prep

---

**Before you start:** basic Linux/CLI comfort and a general sense of what a secret (password, API key, certificate) is used for are assumed. No prior secrets-management-tool experience is needed.

## What is Vault?

Vault is HashiCorp's secrets management tool — it centrally stores, tightly controls access to, and can dynamically generate sensitive data (passwords, API keys, certificates, encryption keys) rather than leaving secrets scattered across config files, environment variables, and Git repositories. Every secret access is authenticated, authorized, and audit-logged.

## Why Vault?

Static secrets (a database password hardcoded in a config file, unrotated for years) are a real, common attack surface — anyone with access to that config file or its Git history has that credential indefinitely. Vault's core value is replacing static, long-lived secrets with **dynamic, short-lived, automatically-revoked** ones wherever possible: a database credential generated on-demand, valid for an hour, and automatically revoked afterward is a fundamentally smaller attack surface than one hardcoded and never rotated.

```flow
{
  "title": "A Request, End to End",
  "layout": "flow",
  "steps": [
    { "label": "Client authenticates", "sublabel": "Token, AppRole, Kubernetes auth...", "color": "blue" },
    { "label": "Vault issues a token", "sublabel": "Scoped to the auth method's policies", "color": "purple" },
    { "label": "Secrets engine responds", "sublabel": "KV, database, PKI — reads or generates the secret", "color": "green" }
  ]
}
```

```conceptgrid
{
  "boxes": [
    { "title": "KV Engine", "description": "Static secrets — you write it, Vault stores it, you read it back unchanged", "color": "blue" },
    { "title": "Database Engine", "description": "Genuinely dynamic — generates a brand-new, short-lived DB credential per request", "color": "green" },
    { "title": "PKI Engine", "description": "Issues short-lived TLS certificates on demand", "color": "purple" }
  ]
}
```

---

## Learning Modules

### Module 01 — Vault Fundamentals
*Seal/unseal, storage backends, the Vault server*

Vault starts in a **sealed** state — encrypted at rest, unable to decrypt anything until unsealed with a threshold of unseal keys (via Shamir's Secret Sharing) or an auto-unseal mechanism (a cloud KMS). This isn't a minor detail — a sealed Vault is completely inert, and understanding seal/unseal is foundational to everything else.

**Topics covered:**

- Vault server architecture — 🟢 Beginner
- Seal and unseal, Shamir's Secret Sharing — 🟡 Intermediate
- Storage backends (Raft integrated storage, Consul) — 🟡 Intermediate

```bash
# Start a dev-mode Vault server (in-memory, auto-unsealed — NEVER for production)
vault server -dev

# In a separate terminal, set the address and check status
export VAULT_ADDR='http://127.0.0.1:8200'
vault status

# Production init generates unseal keys + root token — done ONCE
vault operator init
# Output: 5 unseal key shares, threshold 3, plus an initial root token

# Unseal requires the THRESHOLD number of separate unseal keys
vault operator unseal <key-1>
vault operator unseal <key-2>
vault operator unseal <key-3>
```

### Module 02 — Secrets Engines
*KV, database, PKI — static vs. dynamic secrets*

A secrets engine is a plugin mounted at a path, each implementing a specific kind of secret storage or generation. The KV (key-value) engine stores static secrets you provide; the database engine generates genuinely dynamic, short-lived database credentials on demand; the PKI engine issues short-lived TLS certificates.

**Topics covered:**

- KV secrets engine (v1 vs v2, versioning) — 🟢 Beginner
- Dynamic secrets — database engine — 🔴 Advanced
- PKI secrets engine — dynamic certificates — 🔴 Advanced

```bash
# Enable the KV v2 engine at a path
vault secrets enable -path=secret kv-v2

# Write and read a static secret
vault kv put secret/myapp/db password="s3cr3t"
vault kv get secret/myapp/db

# Enable the database engine for dynamic credentials
vault secrets enable database
vault write database/config/mydb \
  plugin_name=postgresql-database-plugin \
  connection_url="postgresql://{{username}}:{{password}}@db:5432/mydb" \
  allowed_roles="readonly"

# A "role" defines what a generated credential can do, and its TTL
vault write database/roles/readonly \
  db_name=mydb \
  creation_statements="CREATE ROLE \"{{name}}\" WITH LOGIN PASSWORD '{{password}}' VALID UNTIL '{{expiration}}'; GRANT SELECT ON ALL TABLES IN SCHEMA public TO \"{{name}}\";" \
  default_ttl=1h max_ttl=24h

# Every call to this generates a BRAND NEW, unique, time-limited credential
vault read database/creds/readonly
```

### Module 03 — Authentication Methods
*Token, AppRole, Kubernetes auth*

A client must authenticate to Vault before doing anything — auth methods are how. Token auth is the base mechanism everything else ultimately resolves to; AppRole is designed for machine-to-machine auth (a CI pipeline, a service); Kubernetes auth lets a Pod authenticate using its own ServiceAccount token, with no separate credential to manage at all.

**Topics covered:**

- Token auth — the base authentication mechanism — 🟢 Beginner
- AppRole — machine/application authentication — 🟡 Intermediate
- Kubernetes auth method — Pod-native authentication — 🔴 Advanced

```bash
# AppRole: create a role, get its RoleID (public) and SecretID (private)
vault auth enable approle
vault write auth/approle/role/my-app token_policies="my-app-policy"
vault read auth/approle/role/my-app/role-id
vault write -f auth/approle/role/my-app/secret-id

# The app authenticates with both to get a Vault token
vault write auth/approle/login role_id="<role-id>" secret_id="<secret-id>"
```

---

## Production Example

```bash
# Production Runbook — "our app has a hardcoded DB password in an
# env var, and we need to migrate it to Vault dynamic secrets"

# Step 1: Confirm the database engine is configured and generates
# valid credentials before touching the application at all
vault read database/creds/readonly
# Manually test the returned username/password against the DB directly

# Step 2: Set up the application's authentication path (Kubernetes
# auth, since the app runs in-cluster) BEFORE removing the old secret
vault write auth/kubernetes/role/my-app \
  bound_service_account_names=my-app \
  bound_service_account_namespaces=production \
  policies=my-app-policy \
  ttl=1h

# Step 3: Update the application to fetch credentials from Vault at
# startup (via the Vault Agent sidecar, or the app's own Vault client)
# INSTEAD of reading a hardcoded environment variable -- deploy this
# change to a non-production environment first

# Step 4: Verify the app is genuinely using freshly-generated
# credentials, not silently falling back to a cached/hardcoded one
vault list sys/leases/lookup/database/creds/readonly
# Confirm a lease exists corresponding to the app's actual startup time

# Step 5: Only AFTER confirming the new path works end-to-end,
# remove the old hardcoded credential from environment
# configuration/secrets manager entirely -- and rotate the underlying
# database password, since the old hardcoded value should now be
# considered compromised (it existed in plaintext for however long)

# INTERVIEW POINT:
# "The migration order matters -- verify the new dynamic-secrets path
# works completely before removing the old static credential, and
# always rotate the old credential afterward rather than assuming it's
# safely retired just because nothing references it anymore."
```

---

## Interview Prep

**PSR Formula:** Answer every question: **Problem → Solution → Result**. 45-90 seconds max.

### Common Interview Questions

**Q1. What is Vault and why would you use it in production?**

**A:** **Problem:** static, long-lived secrets (a hardcoded database password, an API key sitting in a config file for years) create a large, hard-to-audit attack surface — anyone who ever had access to that file or its Git history effectively has that credential indefinitely. **Solution:** Vault centralizes secrets storage with strict access control and audit logging, and where possible replaces static secrets with dynamic ones — generated on demand, short-lived, and automatically revoked. **Result:** a compromised credential has a bounded blast radius (it expires soon regardless) instead of being valid indefinitely, and every access is logged, making "who accessed what secret, when" an answerable question instead of an unknown.

---

**Q2. How does Vault work internally? Explain the architecture.**

**A:** **Problem:** understanding what actually happens on each request matters for both debugging and trusting the security model. **Solution:** Vault starts sealed (encrypted at rest, unable to decrypt its own storage) and must be unsealed with a threshold of unseal keys (or an auto-unseal KMS) before serving any requests. Once unsealed, a client authenticates via an auth method (token, AppRole, Kubernetes, etc.) to receive a Vault token, and every subsequent request is authorized against the policies attached to that token before Vault's secrets engines (KV, database, PKI, etc.) do the actual work of reading or generating a secret. **Result:** the seal/unseal mechanism means even someone with direct access to Vault's storage backend can't read anything without the unseal keys — the encryption key itself isn't stored in plaintext anywhere.

---

**Q3. What are the main components of Vault?**

**A:** **Problem:** "Vault" names several distinct concepts worth separating when reasoning about a real deployment. **Solution:** the Vault server (the core process, sealed/unsealed), storage backend (where encrypted data actually persists — Raft integrated storage is the modern default), secrets engines (plugins implementing specific secret types — KV, database, PKI, and many more), auth methods (how clients authenticate), and policies (what an authenticated token is actually allowed to do). **Result:** knowing this separation is what makes Vault's access model reason-able — a policy grants permissions, an auth method determines identity, and a secrets engine determines what kind of secret is actually being accessed — three genuinely independent axes.

---

**Q4. How do you handle failures in Vault, particularly around unsealing?**

**A:** **Problem:** a Vault server that restarts (a crash, a planned upgrade, a node failure) comes back up SEALED — completely unable to serve requests until unsealed again, which is a real operational concern if it happens unexpectedly. **Solution:** for production, auto-unseal via a cloud KMS (AWS KMS, Azure Key Vault, GCP Cloud KMS) is strongly preferred over manually re-entering Shamir unseal key shares every time — it lets Vault unseal itself automatically on restart using the cloud provider's own key management, without requiring humans to be paged for every restart. **Result:** manual Shamir-based unsealing (each of several separate people holding one key share) still has its place for the very highest-security root-of-trust scenarios, but for routine production operations, auto-unseal is what actually makes Vault operationally resilient rather than a single point of manual-intervention failure.

---

**Q5. What is your production experience with Vault?**

**A:** This is a genuinely personal question — answer with a real incident using the Problem → Solution → Result structure: a dynamic-secrets migration away from a hardcoded credential, an unseal/auto-unseal incident, or a policy misconfiguration that either over- or under-granted access. Interviewers are listening for whether you've actually operated Vault against real infrastructure and real incidents, not just enabled a KV engine once.

---

**Q6. How do you monitor and observe Vault in production?**

**A:** **Problem:** Vault sits directly in the critical path of anything that needs a secret — if it's unhealthy, sealed, or unreachable, dependent applications can fail to start or refresh credentials. **Solution:** Vault's own telemetry (Prometheus-compatible metrics) covers request rates, latency, and seal status; audit devices log every single request (who, what path, when) to a file, syslog, or a socket for centralized log analysis; health check endpoints (`sys/health`) report sealed/unsealed/standby status for load balancer and monitoring integration. **Result:** seal status specifically deserves its own dedicated alert — a sealed Vault is a total outage for everything depending on it, not a degraded state, and that distinction should be visible immediately, not buried in general error-rate monitoring.

---

**Q7. What are the security considerations for Vault?**

**A:** **Problem:** Vault itself becomes a extremely high-value target, since compromising it potentially exposes every secret it manages. **Solution:** least-privilege policies (a token/role should only have access to the specific paths it genuinely needs, never a broad wildcard by default), auto-unseal via a properly access-controlled cloud KMS, mandatory audit logging enabled from day one (not added reactively after an incident), and short TTLs on dynamic secrets/leases so a leaked credential has a bounded useful lifetime. **Result:** Vault's own root token (created at initialization) should be revoked or tightly locked away after initial setup — day-to-day operations should use scoped, policy-limited tokens/auth methods, not the root token, following the same least-privilege principle Vault itself is meant to enforce for everything else.

---

**Q8. How does Vault compare to alternatives?**

**A:** This usually means a specific comparison. Vault vs. cloud-native secrets managers (AWS Secrets Manager, Azure Key Vault): cloud-native options integrate tightly and simply with their own single cloud, while Vault's real advantage is being cloud-agnostic — one consistent secrets platform across multi-cloud or hybrid infrastructure, plus genuinely dynamic secrets generation many cloud-native tools don't offer as deeply. Vault vs. Kubernetes Secrets (native): native Kubernetes Secrets are base64-encoded (not encrypted by default at rest without extra configuration) and static; Vault provides genuine encryption, dynamic secrets, and fine-grained audit logging Kubernetes' own Secret object doesn't natively offer. State the specific tool being compared and the actual tradeoff, rather than reciting a generic list.

---

**Q9. Why does Vault treat "static secrets" and "dynamic secrets" as fundamentally different security postures, not just two storage options?**

**A:** A static secret (something you write into Vault and read back unchanged, like a KV entry) exists indefinitely until someone manually rotates it — the same long-lived-credential risk profile as a hardcoded password, just centrally stored instead of scattered. A dynamic secret is generated fresh by Vault itself at request time, with a defined TTL, and Vault tracks a "lease" for it that can be automatically revoked when it expires or on demand — meaning a leaked dynamic credential has a bounded, generally short useful lifetime by design, not because someone remembered to rotate it. This is why migrating from static to dynamic secrets wherever possible is treated as a meaningful security improvement, not just a storage-location change.

---

**Q10. Walk through what happens when an application authenticates to Vault via Kubernetes auth and reads a dynamic database credential.**

**A:** The application's Pod has a ServiceAccount token (automatically mounted by Kubernetes). It presents that token to Vault's Kubernetes auth method, which verifies it against the Kubernetes API (confirming the token is genuinely valid and matches a configured role's bound ServiceAccount/namespace) and, if valid, issues a Vault token scoped to whatever policies that role grants. The application then uses that Vault token to read from the database secrets engine's `creds/<role>` path — Vault's database engine connects to the actual database, creates a brand-new, unique database user with the permissions defined in that role, and returns those fresh credentials to the application along with a lease. When the lease expires (or is explicitly revoked), Vault removes that database user entirely — the credential simply stops working, without anyone needing to manually track or revoke it.
