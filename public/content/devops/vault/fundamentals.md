# Vault Fundamentals — Policies, Leases & the KV Engine

**Analogy** — Vault's policy model works like a hotel key card, not a master key. A guest's key card opens exactly their room, the gym, and the pool — nothing else, and it stops working automatically at checkout. A Vault policy is the same idea applied to secrets: a token is granted access to exactly the specific paths it needs, for exactly as long as it needs it, not indefinite access to everything.

## Policies — Vault's authorization model

```hcl
# policy: my-app-policy.hcl
path "secret/data/myapp/*" {
  capabilities = ["read", "list"]
}

path "database/creds/readonly" {
  capabilities = ["read"]
}
```

A policy is a set of path-based rules, each granting specific capabilities (`read`, `create`, `update`, `delete`, `list`, `sudo`) on a specific path or path pattern. Policies are attached to auth methods (a token, an AppRole, a Kubernetes ServiceAccount role) — Vault evaluates every request against the union of all policies attached to the authenticated identity making it. By default, Vault denies everything not explicitly granted — the same deny-by-default posture as Kubernetes RBAC.

```bash
vault policy write my-app-policy my-app-policy.hcl
vault token create -policy="my-app-policy"
```

## Tokens — the universal credential

Every single request to Vault, regardless of which auth method originally established identity, ultimately carries a Vault token. Tokens have their own TTL (time-to-live) and can be renewable or not:

```
Root token       — created at vault operator init, unlimited access,
                    should be revoked/locked away after initial setup
Service tokens    — normal, policy-scoped tokens for applications/users
Batch tokens      — lightweight, non-renewable, cannot create child
                    tokens -- lower overhead for high-volume, short-lived use
Periodic tokens    — renewable indefinitely as long as renewal happens
                    within each period, useful for long-running services
```

**Key distinction worth internalizing:** authentication (proving who you are, via an auth method) and authorization (what you're allowed to do, via policies) are separate concerns in Vault, exactly as in most real access-control systems — an auth method establishes identity and issues a token; policies attached to that token determine what it can actually touch.

## Leases — the mechanism behind dynamic secrets' expiry

```bash
vault read database/creds/readonly
# Returns: lease_id, lease_duration, username, password

# Explicitly renew a lease before it expires
vault lease renew database/creds/readonly/<lease-id>

# Explicitly revoke a lease immediately (before its natural expiry)
vault lease revoke database/creds/readonly/<lease-id>
```

Every dynamic secret Vault generates comes with a lease — a record of that secret's grant, its TTL, and (crucially) enough information for Vault to actually revoke the underlying resource when the lease expires or is explicitly revoked. This is what makes dynamic secrets genuinely self-cleaning: when a database credential's lease expires, Vault doesn't just stop tracking it — it actively connects to the database and drops that specific generated user.

## The KV Secrets Engine — v1 vs. v2

```
KV v1:  Simple key-value store. No versioning. Overwriting a
        secret loses the previous value permanently.

KV v2:  Versioned key-value store. Every write creates a new
        version; previous versions remain retrievable (and
        recoverable) unless explicitly deleted/destroyed.
```

Working with KV v2 in practice:

```bash
# KV v2: write creates version 1, write again creates version 2
vault kv put secret/myapp/db password="v1-password"
vault kv put secret/myapp/db password="v2-password"

# Read the latest version (default)
vault kv get secret/myapp/db

# Read a SPECIFIC earlier version
vault kv get -version=1 secret/myapp/db

# "delete" marks a version deleted but recoverable
vault kv delete secret/myapp/db
vault kv undelete -versions=2 secret/myapp/db

# "destroy" permanently removes a version's data, unrecoverable
vault kv destroy -versions=1 secret/myapp/db
```

KV v2's versioning is a genuinely different safety property from v1 — an accidental overwrite in v1 permanently loses the previous value; in v2, it's just a new version, with the previous one still recoverable until someone deliberately destroys it.

## Secret Zero — the problem every Vault deployment eventually has to solve

However well-designed Vault's own access control is, *something* needs an initial credential to authenticate to Vault in the first place — this is commonly called the "secret zero" problem. For a human, this might be an OIDC/LDAP login. For a machine (an application, a CI pipeline), it's typically something that doesn't itself require a pre-existing static secret to obtain — Kubernetes auth (using a Pod's already-provisioned ServiceAccount token, itself managed by Kubernetes) is a common, elegant answer, since it avoids introducing yet another static credential that would need its own secure distribution.

## Try It (2 Minutes)

Using the policy example above:

1. A token has only `my-app-policy` attached. Can it read `secret/data/otherapp/config`?
2. That same token tries to `delete` a secret at `secret/data/myapp/config`. Does the policy allow this?
3. Why does Vault deny-by-default rather than allow-by-default?

You should land on: no — the policy only grants access under `secret/data/myapp/*`, and `otherapp` doesn't match that path pattern; no — the policy only grants `read` and `list` capabilities, not `delete`, so even though the PATH matches, the specific CAPABILITY requested isn't granted; deny-by-default means a newly created token/policy starts with zero access, forcing every permission to be a deliberate, explicit grant — the same principle behind Kubernetes RBAC's default-deny posture, minimizing the risk of accidentally over-provisioning access.
