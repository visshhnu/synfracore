# Authentication & Authorization — Setup

## Installing the core packages

```bash
mkdir auth-demo && cd auth-demo
npm init -y
npm install express bcrypt jsonwebtoken cookie-parser dotenv
```

- `bcrypt` — password hashing (argon2 via the `argon2` package is a strong alternative, `(needs verification — recheck current recommended default between bcrypt/argon2 against current source, since this shifts)`)
- `jsonwebtoken` — signing and verifying JWTs
- `cookie-parser` — reading cookies off incoming requests (needed for session-ID or httpOnly-cookie-based token storage)
- `dotenv` — loading secrets from `.env` in local development

## Environment variables — secrets never hardcoded

Following this academy's own Express conventions, never hardcode a signing secret, session secret, or database credential directly in source. Create `.env` (and make sure it's in `.gitignore` — a committed secret is a compromised secret the moment it's pushed):

```bash
# .env
JWT_SECRET=replace-with-a-long-random-string
SESSION_SECRET=replace-with-a-different-long-random-string
```

```javascript
// server.js
require('dotenv').config();
const jwt = require('jsonwebtoken');

const token = jwt.sign({ userId: 1 }, process.env.JWT_SECRET, { expiresIn: '15m' });
```

A leaked `JWT_SECRET` is a serious incident, not a minor one — anyone who obtains it can forge a valid token for *any* user, including an admin, without ever compromising a password. Treat it with the same care as a database credential.

## A practical, honest note on hand-rolling auth

Everything in this technology — password hashing, session mechanics, JWT signing, OAuth flow shape — is real, production-accurate mechanics, and worth understanding deeply. In practice, most real production applications do **not** hand-roll all of it from scratch. Battle-tested libraries and hosted providers exist specifically because auth is easy to get subtly, dangerously wrong:

- **Passport.js** — a widely-used Express middleware library with pluggable "strategies" for different auth methods (local username/password, Google OAuth, GitHub OAuth, and dozens more), handling much of the boilerplate this course builds by hand.
- **Auth0** — a hosted identity platform that handles sign-in, MFA, and social login as a managed service.
- **Clerk** — this platform's own actual auth provider (SynfraCore itself uses Clerk in production) — another hosted option handling sessions, sign-in UI, and user management.

The reason this course still teaches the underlying mechanics rather than starting with one of these is that using any of them well — configuring token lifetimes sensibly, understanding what a library's default session behavior actually does, debugging when something goes wrong — requires understanding what's happening underneath. Choosing a library or hosted provider should be an informed choice made with that understanding, not a cargo-culted default because "that's what the tutorial used."

## Next Steps

Move to **Fundamentals** to build password hashing, sessions, and a first JWT-protected route from scratch.
