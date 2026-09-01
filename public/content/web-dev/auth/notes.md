# Authentication & Authorization — Revision Notes

Condensed from Overview, Intermediate, Advanced, and Troubleshooting — organized by topic for fast pre-interview review.

## Core distinction

- **Authentication** = who you are (identity verification). **Authorization** = what you can do (permission check). Sequential, separate — never conflate.
- 401 = authentication failed. 403 = authenticated, but not authorized for this action.

## Password storage

- Never plaintext, never reversible encryption — always a one-way hash (bcrypt/argon2).
- Deliberately slow by design — resists mass brute-forcing of a stolen hash database.
- Never compare secrets with plain `===` — use a constant-time comparison (or let the library, like bcrypt's `compare`, handle it) to avoid timing attacks.

## Sessions vs JWTs

- Sessions: server-side state, opaque client-side ID, trivially revocable, needs a shared store.
- JWTs: client-side state, self-contained, stateless verification, hard to revoke before expiry.
- Neither is universally "better" — pick based on whether instant revocation or stateless scaling matters more.

## JWT structure

- `header.payload.signature`, all base64, dot-separated.
- **Signed, not encrypted** — payload is fully readable by anyone holding the token. Signature proves integrity/authenticity only, not confidentiality. Never put secrets in a JWT payload.

## Refresh tokens

- Access tokens short-lived (minutes) to bound damage from a stolen token; refresh tokens longer-lived and used only to mint new access tokens.
- Revocability is restored via a `tokenVersion`/blocklist check at refresh time, not by the JWT format itself.

## Token storage — httpOnly cookie vs localStorage

- localStorage: readable by any page JS → vulnerable to XSS-driven theft anywhere in the app.
- httpOnly cookie: invisible to JS → immune to that specific theft vector, but auto-attached by the browser → exposed to CSRF instead.
- Generally: httpOnly cookie + SameSite + CSRF token is the stronger combined default.

## CSRF

- Exploits automatic cookie attachment on cross-site requests, not a leaked cookie value.
- `Secure` flag protects transport (HTTPS) only — does nothing against CSRF specifically.
- Mitigate with `SameSite=Strict/Lax` plus an explicit CSRF token for state-changing requests.

## Authorization patterns

- Role-based (RBAC): simple, coarse — a role is a fixed bundle.
- Permission-based: granular capabilities (`posts:delete`), roles become a bundle of permissions — scales better as rules stop fitting a clean hierarchy.

## OAuth / OIDC

- OAuth 2.0 = authorization (scoped access grant). Not inherently an identity protocol.
- OpenID Connect = identity layer on top of OAuth, adds a signed ID token specifically for authentication.
- Authorization code flow = production-correct (server-to-server token exchange). Implicit flow = discouraged (token exposed via browser redirect).

## Revocation problem

- Stateless JWTs have no built-in "un-issue" mechanism.
- Real strategies (short-lived tokens + refresh, blocklists, per-user valid-since timestamp) all reintroduce some server-side state — there is no free option.

## Named attack patterns

- **Session fixation:** attacker pre-sets a known session ID, victim logs in under it. Fix: regenerate session ID on login.
- **Session hijacking:** attacker steals a valid session ID directly (XSS, unencrypted transport). Fix: httpOnly + Secure cookies, HTTPS everywhere.
- **Timing attack on credential comparison:** naive string comparison leaks info via response-time differences. Fix: constant-time comparison.

## MFA

- Adds a second, *independent* factor (something you have/are) beyond password (something you know).
- Security value comes from independence — a leaked password alone doesn't compromise the second factor.

---

## Versioning Note

Durable, stable across time: the authentication-vs-authorization distinction, why hashing (not encryption) is correct for passwords, JWT's `header.payload.signature` structure and "signed not encrypted" model, OAuth's fundamental authorization-code-flow shape, and the httpOnly-cookie-vs-localStorage security tradeoff — these are security-fundamentals-level facts, not implementation trivia.

`(needs verification — recheck against current source)` for anything more specific: exact OAuth provider dashboard/consent-screen flows, specific library API surfaces (`jsonwebtoken`, `express-session` option names/defaults), and exact currently-recommended token lifetimes — these shift with library versions and evolving provider UIs in a way the underlying concepts don't.
