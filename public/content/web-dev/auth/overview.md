# Authentication & Authorization

> **Prove who you are, then decide what you're allowed to do**

**Category:** Backend / Web Development
**Learning Path:** What → Why → Learning Modules → Production Example → Interview Prep

**Before you start:** you need basic Express comfort — defining routes, understanding the middleware pipeline (`(req, res, next)`), and reading a request's headers/body. This page does not re-teach Express itself — that's covered in this platform's own Express.js technology. See the **Prerequisites** tab for the full detail.

---

## What is Authentication & Authorization?

These are two different questions, constantly confused as if they were one, and conflating them is a genuinely common real mistake with real consequences. Think of walking into a large office building: **authentication** is showing your ID at the front desk — proving you actually are who you claim to be. **Authorization** is what your keycard opens once you're inside — which floors, which rooms, which doors. Passing the front desk (authentication) tells the building nothing about which floors you should reach; a valid ID doesn't imply access to the server room. Those are two separate, sequential decisions, and a system that only checks one of them is broken, no matter how well it implements the other.

Technically: **authentication** verifies identity — a username/password pair checked against a stored (hashed) credential, a token proving a prior successful login, a biometric check. **Authorization** decides what that now-identified user is permitted to do — read this resource, delete that record, access an admin panel. A system can authenticate perfectly and still be catastrophically insecure if its authorization checks are missing or wrong (a logged-in regular user who can hit an admin-only API route just because they're logged in at all, not because they were ever granted that role).

The reason either of these needs solving at all is that **HTTP is stateless** — each request arrives with no memory of any previous one. Without a mechanism to carry "who this is" forward, a server would need the user to re-prove their identity on every single request. Sessions and tokens are the two dominant mechanisms for solving that — different tradeoffs, covered in Module 01, but both exist to answer the same underlying problem: making a stateless protocol behave as if it remembers you.

```flow
{
  "layout": "flow",
  "steps": [
    { "label": "Login Request", "sublabel": "Username + password submitted", "color": "slate" },
    { "label": "Credential Verification", "sublabel": "Compare against stored hash", "color": "blue" },
    { "label": "Session/Token Issued", "sublabel": "Proof of identity handed to client", "color": "purple" },
    { "label": "Subsequent Request", "sublabel": "Client sends proof (cookie/header)", "color": "amber" },
    { "label": "Authorization Check", "sublabel": "Is THIS identity allowed to do THIS?", "color": "green" }
  ]
}
```

## Why Authentication & Authorization?

Almost every real application beyond a static brochure site needs to answer two questions on nearly every request: *who is this*, and *what can they do*. Without authentication, there's no way to show a user their own data instead of someone else's, no way to know who performed an action, no way to personalize anything. Without authorization, an authenticated identity is meaningless as a security boundary — any logged-in user could act as any other, or as an admin, purely by knowing a URL.

This is also one of the highest real-stakes topics in this academy. A bug in, say, a date-formatting utility produces a wrong-looking date. A bug in authentication or authorization produces an actual account takeover, an actual data breach, an actual regulatory incident — the failure mode is a real compromise, not a cosmetic defect. Getting the underlying mechanics right — how passwords are stored, how a token proves what it claims to prove, why "logged in" and "allowed to do X" are separate checks — is not optional rigor for this topic; it's the entire point.

---

## Learning Modules

### Module 01 — Sessions vs Tokens — the Core Tradeoff
*Two different ways to make a stateless protocol remember who you are*

A **session** keeps identity state on the server — a session store (in memory, Redis, a database) holds "session ID X belongs to user 42," and the client only carries a small, opaque session ID (usually in a cookie). A **token** (typically a JWT) keeps identity state on the client itself — the token *is* the proof, self-contained and cryptographically signed, and the server verifies it without needing to look anything up in a store, at least for basic validity.

```conceptgrid
{
  "boxes": [
    { "title": "Session-Based", "description": "Server holds state (session store). Client holds only an opaque ID. Easy to revoke instantly — delete the server-side record.", "color": "blue" },
    { "title": "Token-Based (JWT)", "description": "Client holds self-contained, signed proof. Server verifies without a lookup. Hard to revoke before expiry — the token stays valid until it expires.", "color": "green" }
  ]
}
```

**Topics covered:**

- Why HTTP is stateless and what that actually means — 🟢 Beginner
- Cookies as the transport mechanism for session IDs — 🟢 Beginner
- Server-side session stores (memory, Redis) — 🟡 Intermediate
- Stateless vs stateful tradeoffs, revocation implications — 🟡 Intermediate

### Module 02 — Implementing JWT-Based Auth
*Structure, signing, and building it in Express*

**Topics covered:**

- Password hashing with bcrypt/argon2 — 🟢 Beginner
- JWT structure: header.payload.signature — 🟢 Beginner
- Signing and verifying tokens in Express middleware — 🟡 Intermediate
- "Signed, not encrypted" — what that actually means for the payload — 🟡 Intermediate
- Refresh token rotation — 🔴 Advanced

### Module 03 — OAuth & Third-Party Sign-In
*Letting users sign in with an existing identity instead of a new password*

**Topics covered:**

- The authorization code flow, conceptually — 🟡 Intermediate
- OAuth vs OpenID Connect — authorization vs identity — 🟡 Intermediate
- Why the implicit flow is now discouraged — 🔴 Advanced
- Multi-factor authentication as a second, independent factor — 🔴 Advanced

---

## Production Example

```bash
# Production Runbook -- "users are getting logged out randomly, support tickets rising"

# Step 1: Reproduce and categorize -- is it EVERY user, or a subset?
# Check whether it correlates with a deploy, a specific route, or time-of-day
grep "401" /var/log/app/access.log | tail -100
# A spike immediately after a deploy points at a config/secret mismatch,
# not gradual token expiry

# Step 2: Distinguish session-store failure from token expiry -- they look
# identical to the user ("logged out") but have completely different fixes
redis-cli -h $SESSION_STORE_HOST PING
redis-cli -h $SESSION_STORE_HOST KEYS "sess:*" | wc -l
# If the session store was restarted/flushed (a Redis eviction policy, an
# out-of-memory event, a deploy that recreated the store), every session
# disappears at once -- this is a session-store problem, not a token one

# Step 3: If using JWTs, check whether the signing secret differs between
# the instance that issued the token and the instance verifying it --
# a rolling deploy with an env var that changed mid-rollout is a classic cause
echo $JWT_SECRET | sha256sum   # compare across all running instances
# jwt.verify() fails immediately if the secret doesn't match -- this
# LOOKS like "logged out" from the user's perspective but is actually a
# signature verification failure, not expiry

# Step 4: Check actual token/session lifetime configuration against what's
# assumed -- a short-lived access token with no working refresh flow presents
# identically to a real bug even though the token is "working as configured"
grep -r "expiresIn" src/auth/

# Step 5: Fix and verify -- confirm the secret is identical across every
# instance (a shared secrets manager, not per-instance env files), confirm
# the session store's persistence/eviction policy matches expectations, and
# confirm refresh-token flow actually renews access tokens before expiry
```

## Interview Prep

**PSR Formula:** Answer every question: **Problem → Solution → Result**. 45-90 seconds max.

### Common Interview Questions

**Q1. What's the difference between authentication and authorization?**

**A:** **Problem:** these two terms get used interchangeably in casual conversation, but they're genuinely different security decisions. **Solution:** authentication verifies *who* someone is (credential/token check); authorization decides *what* that verified identity is allowed to do (role/permission check) — like showing ID at a front desk versus what a keycard actually opens once inside. **Result:** a system needs both, checked separately and in that order — authenticating correctly says nothing about what the user should be permitted to do next.

---

**Q2. Why must passwords be hashed rather than encrypted or stored in plaintext?**

**A:** **Problem:** plaintext storage means a single database breach exposes every user's actual password directly, and encryption is reversible — anyone with the decryption key (including an attacker who compromises the server) can recover the original passwords too. **Solution:** a hash (via bcrypt or argon2) is a one-way function — there's no key that turns a hash back into the password, only slow, computationally expensive brute-forcing per guess, deliberately, since these algorithms are designed to be slow. **Result:** even a full database breach doesn't hand an attacker usable passwords directly, and since many users reuse passwords across sites, this containment matters far beyond just this one application.

---

**Q3. What's the tradeoff between session-based and token-based (JWT) authentication?**

**A:** **Problem:** teams often pick JWTs by default without weighing the actual tradeoff. **Solution:** sessions keep state server-side — trivially revocable (delete the record) but require a shared store and a lookup on every request; JWTs are self-contained and stateless — no server lookup needed, but hard to revoke before they naturally expire, since the token itself is the proof. **Result:** sessions suit apps that need instant, reliable revocation (banking, admin panels); stateless JWTs suit distributed APIs where avoiding a shared session store simplifies horizontal scaling — the "right" choice depends on which cost the application can actually tolerate.

---

**Q4. Are JWTs encrypted? What does "signed, not encrypted" actually mean?**

**A:** **Problem:** this is a genuinely common and dangerous misconception — assuming a JWT's payload is hidden from anyone who intercepts it. **Solution:** a standard JWT's payload is base64-encoded, not encrypted — anyone can decode and read it (paste one into jwt.io to see this directly). The signature only proves the token wasn't tampered with since it was issued; it does not hide the contents. **Result:** never put secret data (passwords, sensitive PII) directly in a JWT payload — treat it as visible, tamper-evident, not confidential.

---

**Q5. httpOnly cookies vs localStorage for storing a token — which is safer, and why?**

**A:** **Problem:** localStorage is directly readable by any JavaScript running on the page — including malicious JavaScript injected via an unrelated XSS vulnerability elsewhere in the app. **Solution:** an httpOnly cookie is inaccessible to JavaScript entirely — the browser attaches it automatically, but `document.cookie` can't read it, so an XSS payload can't exfiltrate it directly. **Result:** httpOnly cookies are the stronger default for storing auth tokens against XSS specifically — the real tradeoff then shifts to defending against CSRF, which cookie-based auth is newly exposed to and localStorage-based auth isn't.

---

**Q6. What is CSRF, and why does it matter even with cookies marked Secure?**

**A:** **Problem:** `Secure` on a cookie only means "only sent over HTTPS" — it says nothing about *which site* triggered the request that carries it. **Solution:** Cross-Site Request Forgery exploits the browser's automatic behavior of attaching cookies to any request to a domain, even one triggered by a malicious page the user merely has open in another tab — the request looks legitimate to the server because the valid session cookie rides along regardless of origin. **Result:** CSRF tokens (a value the attacker's page can't know or forge) and `SameSite` cookie attributes are the actual defenses — "Secure" alone defends transport, not request origin, and conflating the two leaves a real gap.

---

**Q7. Explain the OAuth 2.0 authorization code flow at a conceptual level.**

**A:** **Problem:** letting a third-party app authenticate a user without ever handing that app the user's actual password to the identity provider. **Solution:** the user is redirected to the identity provider (Google, GitHub) to authenticate directly with it; on success, the provider redirects back with a short-lived authorization *code* (not a token yet); the app's own backend then exchanges that code — server-to-server, using a client secret — for an actual access token. **Result:** the access token never touches the browser or any client-side JavaScript during the exchange itself, which is exactly why this flow is the production-correct one, over the now-discouraged implicit flow that returned tokens directly in the browser redirect.

---

**Q8. OAuth vs OpenID Connect — what's the actual difference?**

**A:** **Problem:** these names get used interchangeably, but they solve different problems. **Solution:** OAuth 2.0 is fundamentally an *authorization* protocol — it grants an app permission to access a resource on a user's behalf (e.g. read their calendar), without necessarily proving who the user is in a standardized way. OpenID Connect (OIDC) is a thin identity layer built on top of OAuth 2.0 that adds a standardized ID token specifically for *authentication* — proving who the user is. **Result:** "Sign in with Google" is really OIDC (identity) riding on OAuth's mechanics (authorization) — using bare OAuth alone for login, without OIDC's ID token, was a common and real source of security bugs in early "social login" implementations.

---

**Q9. Why is revoking a JWT before its natural expiry a genuinely hard problem?**

**A:** **Problem:** a JWT is self-contained and stateless by design — the server verifies it using only the signature and the token's own claims, with no database lookup. **Solution:** there's no built-in mechanism to "un-issue" one early; workarounds all reintroduce some server-side state — a blocklist of revoked token IDs (checked on every request, which partially defeats statelessness), very short-lived access tokens paired with a separately revocable refresh token, or a version/timestamp claim checked against a per-user "valid since" value in the database. **Result:** this is why short access-token lifetimes plus a revocable refresh token is the standard production pattern — it bounds the damage window of an unrevocable stolen token rather than solving revocation directly.

---

**Q10. What does multi-factor authentication actually add, security-wise?**

**A:** **Problem:** a password alone is "something you know" — and something you know can be phished, reused across a breached site, or guessed. **Solution:** MFA requires a second, independent factor — typically "something you have" (a time-based code from an authenticator app, a hardware key) — so a compromised password alone is no longer sufficient to authenticate. **Result:** this is why MFA meaningfully raises the bar even against a fully leaked password database — the attacker still needs to separately compromise a different category of proof, not just the same one twice.

---

## Official Resources

- [OWASP Authentication Cheat Sheet](https://cheatsheetseries.owasp.org/cheatsheets/Authentication_Cheat_Sheet.html)
- [jwt.io](https://jwt.io/) — decode and inspect JWTs directly
- [OAuth 2.0 (oauth.net)](https://oauth.net/2/)

## Try It (2 Minutes)

Paste this into a Node REPL (`npm install jsonwebtoken` first) and inspect what a JWT actually contains:

```javascript
const jwt = require('jsonwebtoken');

const token = jwt.sign({ userId: 42, role: 'user' }, 'a-secret-key', { expiresIn: '1h' });
console.log(token); // three base64 segments, separated by dots

// Decode WITHOUT verifying -- anyone can do this, no secret needed
console.log(jwt.decode(token));
// { userId: 42, role: 'user', iat: ..., exp: ... }  <- fully readable
```

Notice the payload is readable without the secret at all — that's the "signed, not encrypted" distinction from Q4 above, made concrete. Now try `jwt.verify(token, 'wrong-secret')` and watch it throw — that's what the signature actually protects.
