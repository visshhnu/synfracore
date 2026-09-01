# Authentication & Authorization — Learning Roadmap

## Estimated Time to Job-Ready

**3-5 weeks** of consistent learning (2-3 hours/day), assuming this academy's Express technology is already comfortable — the auth material here is entirely middleware-based and builds directly on that foundation rather than re-teaching routing or the middleware contract.

## Phase 1: Core Mechanics (Week 1)

- Password hashing with bcrypt — why plaintext/reversible-encryption storage is never acceptable
- Sessions: what a session store actually holds, and how a cookie carries just the opaque ID
- JWT structure: header.payload.signature, and the "signed, not encrypted" distinction
- Build a minimal Express app with email/password signup, login, and a session-protected route

**Checkpoint:** can you explain, without looking it up, why bcrypt is deliberately slow, and why that's a feature rather than a performance problem? (A slow hash function makes brute-forcing a stolen hash database computationally expensive per guess — the same property that makes legitimate logins slightly slower makes mass password-cracking impractical at scale.)

## Phase 2: Token-Based Auth in Practice (Week 2)

- Implement JWT issuing and verification as Express middleware
- Refresh tokens: why access tokens should be short-lived, and how a refresh flow avoids forcing re-login
- httpOnly cookies vs localStorage for token storage — the real XSS/CSRF tradeoff, not just a default pick
- CSRF: what it actually exploits, and the SameSite + CSRF-token mitigations

**Checkpoint:** if a JWT's payload is fully readable by anyone without the secret, what does the signature actually protect against, and what does it not protect against? (Protects against tampering/forgery — nothing about confidentiality of the payload's contents.)

## Phase 3: Authorization Patterns & OAuth (Week 3)

- Role-based vs permission-based authorization — build both, notice where role-based starts to strain
- OAuth 2.0 authorization code flow, conceptually and in a simplified implementation
- OpenID Connect vs OAuth — the identity-vs-authorization distinction
- Implement a small role-protected admin route (401 vs 403 handled correctly)

**Checkpoint:** can you explain why a genuinely admin-only route returning 403 (not 401) to a logged-in non-admin user is the correct behavior, not a bug?

## Phase 4: Security Depth & Interview Readiness (Week 4-5)

- Token revocation strategies and why stateless JWTs make this genuinely hard
- Session fixation, session hijacking, and timing attacks on credential comparison
- Multi-factor authentication concepts and why independence-of-factor is the actual security property
- Review this course's Interview Q&A and Real-World Scenarios material, and practice explaining the sessions-vs-JWT tradeoff out loud, not just recognizing it when reading

## Common Pitfalls Specific to This Topic (Not Generic Study Advice)

- **Assuming "signed" means "encrypted"** — this single misconception is behind a large share of real JWT-related data-exposure incidents; never put secret data directly in a JWT payload
- **Picking localStorage for token storage by default** — without weighing that it's directly readable by any XSS payload anywhere in the app, not just auth-related code
- **Treating authorization as "if logged in, allow"** — authentication and authorization are separate checks; skipping the second one is a real, common vulnerability class, not a theoretical one
- **Reaching for the implicit OAuth flow from an old tutorial** — the authorization code flow (with PKCE for public clients) is the current production-correct pattern

## Getting Your First Role Involving Real Auth Work

1. **Portfolio:** a project demonstrating the *actual* mechanics — hashed passwords (not plaintext, ever, even in a demo), a working refresh-token flow, role-based route protection — not just "login works," which alone signals nothing about depth
2. **Resume:** be specific — "implemented JWT-based auth with short-lived access tokens and revocable refresh tokens" is far stronger than "added authentication"
3. **Know the tradeoffs, not just one implementation:** sessions vs JWTs, httpOnly cookies vs localStorage, role- vs permission-based authorization — interviewers probe the reasoning, not just whether the code runs
4. **Interview prep:** the authentication-vs-authorization distinction, why hashing not encryption, and the OAuth authorization code flow come up constantly precisely because they distinguish real understanding from having copy-pasted a login tutorial
