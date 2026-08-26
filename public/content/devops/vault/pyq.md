# Vault — PYQ (Practice Questions)

**Framing note:** HashiCorp's Vault Associate certification is proctored and confidential — no public leaked-question archive exists. What follows is built from this guide's own Overview/Fundamentals/Intermediate/Advanced material, framed as practice questions grounded in real, documented Vault behavior.

---

### 1. (Domain: Core Concepts) Why does Vault start in a sealed state, and what does sealing actually protect against?

**Answer:** A sealed Vault has encrypted-at-rest storage it cannot decrypt without the unseal mechanism (a Shamir threshold of key shares, or auto-unseal via a cloud KMS) — meaning even someone with direct filesystem/database access to Vault's storage backend cannot read anything meaningful without also obtaining the unseal keys. This protects against the scenario where Vault's storage itself is compromised or exfiltrated separately from Vault's own running process.

---

### 2. (Domain: Secrets Engines) What's the fundamental difference between the KV and database secrets engines?

**Answer:** KV stores a static secret you explicitly write, returned unchanged on read until manually rotated. The database engine generates a brand-new, unique credential on every read, tracked via a lease with a defined TTL, and actually revokes the underlying database user when that lease expires — a fundamentally different security posture (bounded-lifetime-by-design versus indefinite-until-manually-rotated), not just a different storage mechanism.

---

### 3. (Domain: Authentication) Why is Kubernetes auth considered well-suited for in-cluster applications specifically, compared to a static token?

**Answer:** Kubernetes auth lets a Pod authenticate using its own ServiceAccount token, which Kubernetes itself already provisions and manages — avoiding the need to generate, distribute, and separately protect a new static credential just for Vault authentication. This directly addresses the "secret zero" bootstrapping problem without introducing another long-lived secret into the system.

---

### 4. (Domain: Policies) A token has a policy granting `read` on `secret/data/app/*` but not `list`. Can it successfully run `vault kv list secret/app/`?

**Answer:** No — `list` is a separate capability from `read`, and Vault's policy model requires the specific capability actually being requested to be explicitly granted. A policy granting only `read` allows retrieving a KNOWN secret's value directly, but not listing what secrets exist under that path — both need to be explicitly granted if both operations are needed.

---

### 5. (Domain: Leases) What happens to an application's already-active database connection if its underlying dynamic credential's lease expires while the connection is still open?

**Answer:** This depends on the database and existing session behavior — an already-established, currently-open connection is often not immediately terminated just because the credential's lease expired (existing sessions frequently remain valid until they're closed), but the underlying database user itself gets revoked, meaning any NEW connection attempt using that same credential fails, and some databases/configurations may forcibly terminate existing sessions on user revocation. This is exactly why an application should proactively renew leases before expiry (via Vault Agent or its own renewal logic) rather than relying on an expired credential's exact behavior. `(needs verification — recheck specific database engine behavior on credential revocation, since this varies by database and configuration)`

---

### 6. (Domain: Transit Engine) Why can an application use the Transit engine to encrypt sensitive data without itself ever handling raw encryption keys?

**Answer:** Transit performs encryption/decryption operations as a service — the application sends plaintext to Vault and receives ciphertext (or vice versa), while the actual encryption key material never leaves Vault at all. This means the application's own code and memory never need to handle raw key material, meaningfully reducing the attack surface compared to an application managing its own encryption keys directly.

---

### 7. (Domain: PKI) Why do production PKI setups typically issue certificates from an intermediate CA rather than directly from the root CA?

**Answer:** Keeping the root CA's private key maximally protected (ideally unused for routine day-to-day issuance) limits the blast radius if a certificate-issuing component is ever compromised — if an intermediate CA is compromised, the root can revoke and replace it without needing to re-establish trust from scratch across every system that trusts the root CA itself, which would be a far larger, more disruptive recovery if the root itself had been directly compromised instead.

---

### 8. (Domain: HA) In a 3-node Vault cluster using Raft integrated storage, what happens if exactly one node fails?

**Answer:** The cluster continues operating normally — Raft's majority-quorum consensus (2 of 3 nodes still available) is sufficient to maintain leadership and process requests. If the FAILED node happened to be the active leader, the remaining nodes elect a new leader automatically; if a standby node failed instead, the active leader continues unaffected.

---

### 9. (Domain: Response Wrapping) Why does response wrapping's single-use property provide tamper detection, not just confidentiality?

**Answer:** Because the wrapping token can only be unwrapped successfully ONCE — if an unauthorized party intercepts and unwraps it first, the legitimate intended recipient's later unwrap attempt will fail (since it's already been consumed). That failure itself is a strong, immediate signal that something was intercepted along the way, which a simple "send the secret directly" approach wouldn't provide any equivalent detection mechanism for.

---

### 10. (Domain: Operational Security) Why does Vault's documentation recommend revoking or tightly restricting the root token after initial cluster setup, rather than leaving it available for convenience?

**Answer:** The root token has unlimited access to every path and operation by design — routine use of it defeats Vault's entire least-privilege policy model, since anyone/anything using it has effectively unlimited access regardless of what a properly-scoped policy would otherwise restrict. Restricting it to genuine break-glass emergency scenarios (ideally behind its own additional audited access procedure) keeps day-to-day operations properly scoped through auth methods and policies, consistent with the least-privilege principle Vault is meant to enforce for everything else it manages.
