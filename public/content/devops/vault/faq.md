# Vault — FAQ

## Is Vault only for secrets storage, or does it do more?

More — while KV-style secret storage is the most immediately obvious use case, Vault's real differentiator is dynamic secrets generation (databases, cloud credentials, PKI certificates issued fresh on demand) and encryption-as-a-service (the Transit engine). Treating Vault as "just an encrypted key-value store" misses most of its actual value.

## Do I need Vault Enterprise to use dynamic secrets, PKI, or Transit?

No — dynamic secrets, PKI, Transit, and the core auth methods/policy model are all available in open-source Vault. Enterprise adds namespaces (multi-tenancy), Performance/DR Replication across clusters, and Sentinel policy-as-code — genuinely additional capabilities for larger, multi-team, or multi-region organizations, not gating the core dynamic-secrets functionality itself.

## What happens to applications currently using a database credential if Vault becomes unreachable?

Existing, already-issued credentials continue working until their lease naturally expires (Vault issuing them doesn't mean the database itself depends on Vault being reachable afterward) — but the application can't obtain NEW credentials, and any automatic lease renewal will fail, until Vault is reachable again. This is exactly why Vault's own availability (HA clustering, monitoring seal status) matters so much — it sits in the critical path for credential renewal, even if not for already-active credentials' continued validity.

## Is a hardcoded Vault token in an application's config actually any better than a hardcoded database password?

Not meaningfully, if done carelessly — a long-lived, hardcoded Vault token defeats much of the point. The better pattern (Kubernetes auth, AppRole with proper SecretID rotation, or Vault Agent handling authentication automatically) avoids ever hardcoding a long-lived Vault credential at all, addressing the "secret zero" problem without just relocating a static secret from one place to another.

## Can Vault manage secrets it didn't itself generate — e.g. a database password someone else set manually?

Yes, via the KV engine — you can store any static secret in Vault regardless of how it was originally created, gaining centralized access control and audit logging even without dynamic generation. This is a reasonable interim step when migrating from scattered static secrets toward Vault, before (or instead of, for some genuinely static values) also adopting dynamic secrets generation.

## What's the actual difference between a Vault "lease" and a Vault "token"?

A token represents an authenticated identity's session with Vault — it's what you present with every request. A lease represents a specific granted dynamic secret and its expiry/revocation info — a single token's session could be associated with issuing (and later needing to track) many separate leases over its lifetime, for different dynamic secrets requested during that session.

## Does sealing Vault delete any data?

No — sealing doesn't delete anything; it just makes the encrypted storage unreadable without the unseal keys/mechanism. Unsealing (with the correct keys, or via auto-unseal) restores full access to the exact same data that was there before sealing — sealing is a protective state, not a destructive operation.

## Why does Vault recommend against using the root token for day-to-day operations?

The root token has unlimited access to everything by design, meant only for initial setup and genuine break-glass emergency scenarios — using it routinely defeats the entire least-privilege policy model Vault otherwise provides. Day-to-day human and machine access should go through scoped auth methods and policies, with the root token revoked or locked away (potentially requiring a documented, audited break-glass procedure to access again) after initial setup completes.
