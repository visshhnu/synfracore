# Authentication & Authorization — Prerequisites

## What You Need Before Starting

### 1. Basic Express (required)

Routes (`app.get`, `app.post`), the middleware pipeline (`(req, res, next)`), and how `req`/`res` carry data through a request. Every code example in this technology — session middleware, JWT verification, route protection — is written as Express middleware, so if the middleware chain and `next()` contract aren't already comfortable, this platform's own **Express.js** technology is the right place to start first.

### 2. Basic understanding of HTTP cookies/headers (recommended, not required)

Knowing that a cookie is a small piece of data the browser stores and automatically re-sends to the same domain, and that headers like `Authorization` carry data explicitly attached per request, helps the sessions-vs-tokens material land faster. This isn't assumed in depth — the Fundamentals tab explains cookies from first principles before relying on them.

### 3. What you do *not* need yet

- **Prior security background** — this course explains hashing, signing, and the relevant attack patterns (CSRF, session fixation, XSS-driven token theft) from scratch, not assuming a security or cryptography background.
- **A specific auth library's API** — Passport.js, Auth0, or Clerk-style provider APIs aren't required upfront; this course teaches the underlying mechanics first (Installation covers where a real production app would typically reach for one of these instead of hand-rolling it).
- **OAuth/OIDC provider account setup** — the OAuth module covers the flow conceptually; you don't need a live Google/GitHub OAuth app configured to follow along.

### Quick self-check

Can you explain, without looking it up, what happens if a piece of Express middleware never calls `next()` and never sends a response? (The request hangs forever — Express is waiting indefinitely for one of those two things to happen.) If that's unclear, spend time with this platform's Express.js Fundamentals tab first — the auth middleware in this course builds directly on that contract.
