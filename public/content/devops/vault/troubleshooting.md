# Vault Troubleshooting Guide

## Issue 1: Vault reports "sealed" and refuses all requests

**Symptom:** Every request returns `Error: Vault is sealed` — `vault status` shows `Sealed: true`.

**Root Cause:** Vault restarted (crash, planned restart, node failure) and came back up in its default sealed state, requiring the unseal process before it can decrypt storage and serve requests again.

**Debug steps:**
```bash
vault status
# Confirms Sealed: true and shows the unseal threshold/progress
```

**Fix:**
```bash
# Manual Shamir unseal -- requires the THRESHOLD number of separate keys
vault operator unseal <key-1>
vault operator unseal <key-2>
vault operator unseal <key-3>

# If auto-unseal is configured correctly, this should have happened
# automatically -- if it didn't, check the KMS integration itself
# (IAM permissions, KMS key availability) for the actual root cause
```

**Prevention:** Configure auto-unseal via a cloud KMS for production deployments, so restarts don't require manual human intervention to restore service.

---

## Issue 2: "permission denied" despite the token seemingly having the right policy

**Symptom:** A request fails with `permission denied` even though the operator believes the attached policy should allow it.

**Root Cause:** Usually one of: the policy's path doesn't precisely match the actual request path (a trailing `/*` mismatch, or KV v2's extra `data/` segment in the actual API path that's easy to forget when writing a policy), the specific CAPABILITY needed isn't granted (path matches, but `list` wasn't granted alongside `read`), or the token simply doesn't have the policy attached that the operator assumed it did.

**Debug steps:**
```bash
# Confirm which policies are ACTUALLY attached to the token in use
vault token lookup
# Shows the policies list directly

# Confirm the EXACT path being requested matches what the policy covers
# -- for KV v2 specifically, the real API path includes an extra
# "data/" segment: secret/data/myapp/config, not secret/myapp/config
```

**Fix:** Correct the policy's path pattern (accounting for KV v2's `data/` path segment specifically, a very common real mistake) and/or add the missing capability, then re-attach/re-issue the token if it was created before the policy fix.

---

## Issue 3: A dynamic secrets engine generates credentials, but the application can't actually connect with them

**Symptom:** `vault read database/creds/readonly` returns a username/password successfully, but the application fails to authenticate to the actual database with those credentials.

**Root Cause:** Commonly a mismatch between the role's `creation_statements` and what the database actually requires (a missing grant, a role/permission the creation statement doesn't actually assign), or a connectivity/firewall issue between the application and database unrelated to Vault itself, or the credential's TTL already expired between generation and use.

**Debug steps:**
```bash
# Manually test the EXACT generated credential directly against the
# database, outside the application entirely, to isolate whether
# this is a Vault/credential-generation problem or an app-level issue
psql "host=db-host user=<generated-username> password=<generated-password> dbname=mydb"

# Review the role's actual creation_statements for correctness
vault read database/roles/readonly
```

**Fix:** Correct the role's `creation_statements` to grant exactly the permissions the application actually needs, confirm network connectivity independent of credential correctness, and confirm the application is using the credential promptly (before its TTL expires) rather than caching an old, now-expired one.

---

## Issue 4: AppRole login fails with "invalid role or secret ID"

**Symptom:** `vault write auth/approle/login role_id=... secret_id=...` fails despite the values appearing correct.

**Root Cause:** Most commonly, the SecretID has already expired (per its configured TTL) or has already been used the maximum allowed number of times (`secret_id_num_uses`), or the RoleID/SecretID pairing is simply wrong (mismatched between two different roles).

**Debug steps:**
```bash
# Check the role's actual configured constraints
vault read auth/approle/role/my-app

# A SecretID can only be looked up/validated in limited ways once
# issued -- if in doubt, the safer debug path is often generating
# a FRESH SecretID and retesting, rather than trying to diagnose
# an already-possibly-expired one further
vault write -f auth/approle/role/my-app/secret-id
```

**Fix:** Generate a fresh SecretID if the old one has expired/exhausted its uses, and review whether the configured `secret_id_ttl`/`secret_id_num_uses` values actually match the real operational pattern needed (e.g. a CI pipeline needing to authenticate more than once might need a longer TTL or higher use count, or should be re-fetching a fresh SecretID per run instead).

---

## Issue 5: Vault Agent isn't refreshing a rendered secrets file, application is using stale credentials

**Symptom:** A file Vault Agent is supposed to keep updated with current dynamic secrets stops updating, and the application ends up using an expired credential.

**Root Cause:** Commonly Vault Agent's own authentication has failed/expired (the auto_auth token itself needs renewal, and if THAT fails silently, the template rendering stops working too), or the template configuration has an error causing rendering to fail without obviously crashing the whole Agent process.

**Debug steps:**
```bash
# Check Vault Agent's own logs for authentication or template
# rendering errors specifically -- these are often distinct failure
# points from the main application's own logs

# Confirm Agent's own auth token is still valid
vault token lookup <agent-token>
```

**Fix:** Address the root authentication failure first (Agent needs a continuously valid path to re-authenticate, following the same auth method configured for it), then verify the template configuration renders correctly once Agent's own auth is healthy again -- monitoring Agent's own health/auth status separately from the application's health is what catches this class of issue before it becomes an application-level outage from stale credentials.
