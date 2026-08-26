# Vault — Real World Scenarios

A note on framing: all three scenarios below are illustrative/composite — common, well-documented patterns from production Vault usage industry-wide, not one specific traceable company's incident.

---

## Scenario 1 (illustrative/composite): The migration that left a hardcoded credential still active "just in case"

**The pattern:** A team migrates a critical application from a hardcoded database password to Vault-generated dynamic credentials, following the standard migration steps carefully — testing the new path, deploying gradually, confirming the application is genuinely using freshly-generated credentials. Everything works. But the OLD hardcoded password is never actually rotated on the database side — the team's reasoning was "the application doesn't use it anymore, so it's effectively harmless now, and we can clean it up in a later pass." Months later, that old password (which had existed in plaintext in an old config file, old CI logs, and an old deployment manifest still sitting in Git history) surfaces in a routine secret-scanning audit, and the database user it belonged to still works, since it was never actually revoked or rotated.

**Why "the app doesn't use it anymore" is a dangerously incomplete reason to consider it safe:** the risk was never really about whether the APPLICATION still referenced the credential — it was about whether the credential itself still WORKED and was still exposed in plaintext somewhere (old logs, Git history, a forgotten backup of a config file). Migrating the application's active usage away from a static credential doesn't retire the credential itself; only actually rotating/revoking the underlying database password does that.

**What actually prevents this:**
- **Treat "migrate off the old credential" and "revoke the old credential" as two separate, both-mandatory steps**, not one step where the second half is implied by the first — a migration isn't complete until the old credential genuinely stops working, not just until nothing currently references it.
- **Rotate the old credential immediately once the new dynamic-secrets path is confirmed working**, rather than deferring it to "a later cleanup pass" — the old value is already effectively compromised (having existed in plaintext for however long), so there's no real reason to delay revoking it once it's no longer needed.
- **Run secret-scanning tooling proactively across Git history and old logs/configs**, rather than waiting for a routine audit to surface an old, still-valid credential that should have been rotated as part of the original migration.

---

## Scenario 2 (illustrative/composite): The AppRole SecretID that never expired because nobody set a TTL on it

**The pattern:** A CI pipeline is configured to authenticate to Vault via AppRole — a reasonable, standard machine-authentication pattern. The SecretID is generated once during initial setup and stored as a CI secret, with the team's attention focused on getting the pipeline working rather than on the SecretID's own lifecycle. Over a year later, a security review finds the SecretID has no TTL/expiration configured at all — it's been valid, unrotated, and usable by anyone who ever gained access to that CI secret store, for the entire time, functioning as exactly the kind of long-lived static credential Vault's dynamic-secrets philosophy was meant to move away from.

**Why this defeats Vault's own security model from within Vault itself:** AppRole's RoleID/SecretID pattern is designed so the SecretID can be short-lived and rotated, treated similarly to a dynamic secret in spirit — but nothing enforces that by default; a SecretID's TTL is a deliberate configuration choice, and the default/unconfigured behavior can end up being effectively permanent if nobody explicitly sets a reasonable expiration. A long-lived, never-rotated AppRole SecretID is functionally equivalent to the hardcoded static credential Vault was adopted specifically to eliminate.

**What actually prevents this:**
- **Explicitly configure SecretID TTL (`secret_id_ttl`) and consider `secret_id_num_uses`** when setting up an AppRole role, rather than accepting whatever the default configuration happens to be without reviewing it.
- **Automate SecretID rotation as part of the CI pipeline's own credential-refresh cycle**, treating it the same way a dynamic database credential's lease renewal would be handled, rather than a one-time setup value that's assumed to be fine indefinitely.
- **Periodically audit auth method configurations specifically for TTL/expiration settings**, not just auditing policies for over-broad access — a long-lived credential under a correctly-scoped policy is still a real risk, just a narrower one than a long-lived credential under an over-broad policy.

---

## Scenario 3 (illustrative/composite): The over-broad policy written "to get things working" that was never tightened afterward

**The pattern:** During initial Vault adoption, a team under deadline pressure writes a policy granting an application broad access (`path "secret/*" { capabilities = ["read", "list"] }`) rather than scoping it precisely to the specific paths that application actually needs — the stated intention being "we'll tighten this once everything's working and we understand the real access patterns better." The application launches successfully, the deadline passes, and the broad policy is never revisited. Eighteen months later, that same application (now handling a genuinely different, larger set of responsibilities than it did at launch) is found during a security review to have read access to secrets belonging to several entirely unrelated teams' applications, none of which it has ever actually needed or used.

**Why "we'll tighten it later" is a predictable trap, not a one-off oversight:** once an over-broad policy is in place and nothing is visibly broken, there's no natural forcing function that surfaces the need to revisit it — unlike a too-narrow policy, which fails loudly and gets fixed immediately because something breaks. An over-broad grant fails silently (nothing appears wrong) until a security review or incident specifically goes looking for it, which is exactly why it tends to persist indefinitely once deadline pressure moves attention elsewhere.

**What actually prevents this:**
- **Treat an intentionally broad "get it working first" policy as a tracked, time-boxed exception with an explicit follow-up task**, not an informal intention to tighten it eventually without any concrete tracking mechanism forcing that to actually happen.
- **Periodically audit policies against actual observed access patterns** (Vault's audit logs record every access) — comparing what a policy GRANTS against what a token has actually USED surfaces over-provisioned access directly, rather than relying on someone remembering to revisit an old policy.
- **Default to writing narrowly-scoped policies from the start wherever the actual access pattern is already known**, reserving "broad now, tighten later" specifically for genuine exploratory/early-stage cases — and even then, pairing it with the tracked follow-up task above rather than an informal intention.
