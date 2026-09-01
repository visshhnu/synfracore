# Authentication & Authorization — Interview Q&A

**Q: What's the difference between authentication and authorization?**

Authentication verifies *who* someone is — checking a password, verifying a token's signature. Authorization decides *what* that verified identity is permitted to do — whether this specific user can access this specific resource or perform this specific action. They're sequential and separate: a system can authenticate a user correctly and still be badly broken if it never checks authorization afterward, letting any logged-in user act as any other.

**Q: Why must passwords be hashed rather than encrypted?**

Encryption is reversible by design — anyone with the right key can recover the original value, and if an attacker compromises the server, they very often have access to that key too. A hash is one-way: there's no key that turns a hash back into the original password, only expensive brute-forcing per guess. bcrypt and argon2 specifically are deliberately slow, which makes mass-cracking a stolen hash database computationally impractical even though it's mathematically possible in principle. This distinction matters because a database breach under hashing exposes far less usable information than the same breach under encryption or plaintext.

**Q: What are the tradeoffs between sessions and JWTs?**

Sessions keep identity state server-side — the client only holds an opaque ID — which makes revocation trivial (delete the server-side record) but requires a shared, available session store and a lookup on every request. JWTs are self-contained and stateless — no lookup needed to verify, which simplifies horizontal scaling — but are hard to revoke before their natural expiry, since the token itself is the proof and the server doesn't track which ones are "still valid" by default. Neither is strictly better; the choice depends on whether instant revocability or stateless scaling matters more for the specific system.

**Q: Are JWTs encrypted? What does "signed, not encrypted" mean in practice?**

No — a standard JWT's payload is base64-encoded, not encrypted, and is fully readable by anyone who has the token, no secret required (decode one on jwt.io to see this directly). The signature only proves the token wasn't tampered with since issuance and was issued by whoever holds the signing secret — it says nothing about confidentiality. The practical consequence: never put secret data directly in a JWT payload, and never assume a JWT hides its claims from the client holding it.

**Q: httpOnly cookies vs localStorage for storing a token — which is more secure, and why?**

httpOnly cookies are inaccessible to JavaScript entirely — `document.cookie` doesn't expose them — so an XSS payload running anywhere on the page can't read the token directly. localStorage is plain JavaScript-accessible storage, so any XSS vulnerability anywhere in the app (not necessarily in auth-related code) can exfiltrate a token stored there. The tradeoff isn't free, though: httpOnly cookies reopen exposure to CSRF, since the browser attaches them automatically to requests regardless of which site initiated them — localStorage-based tokens aren't auto-attached and so aren't CSRF-exposed the same way. httpOnly cookies are generally the stronger default because CSRF has well-understood, effective mitigations (SameSite, CSRF tokens), while XSS-driven localStorage theft is harder to fully rule out across a large app.

**Q: What is CSRF, and why does a "Secure" cookie flag not prevent it?**

CSRF exploits the browser's automatic behavior of attaching a valid cookie to any request sent to that domain, even one triggered by a malicious page open in another tab that the user never knowingly interacted with as "the bank." The `Secure` flag only means the cookie is sent over HTTPS — it says nothing about which site initiated the request, so it does nothing to prevent CSRF specifically. `SameSite=Strict`/`Lax` and explicit CSRF tokens (a value the attacker's page can't know or forge) are the actual defenses.

**Q: Explain OAuth's authorization code flow conceptually.**

The user is redirected to the identity provider to authenticate directly with it — the app itself never sees the provider password. On success, the provider redirects back with a short-lived, single-use authorization code, not a token. The app's backend then exchanges that code for an actual access token in a separate, server-to-server call, presenting a client secret only the backend holds. The access token is never exposed to the browser during this exchange, which is exactly what makes this flow production-correct, unlike the now-discouraged implicit flow that returned tokens directly through the browser redirect.

**Q: What does multi-factor authentication actually add security-wise?**

A password alone is "something you know" — a single category of proof, and one that can be phished, reused from a different breached site, or guessed. MFA adds a second, independent factor, typically "something you have" (an authenticator app code, a hardware key). The security value comes specifically from that independence: a fully compromised password database still doesn't compromise a physically separate device, so an attacker needs to separately defeat a genuinely different category of proof, not just the same one twice.
