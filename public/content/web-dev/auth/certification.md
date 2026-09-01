# Authentication & Authorization — Certification Guide

## An honest note on certification for this specific topic

There isn't a single dominant, widely-recognized certification narrowly scoped to "authentication and authorization" the way there is for, say, a specific cloud platform or database. This topic is typically covered as part of a broader security certification rather than as its own standalone credential:

| Cert / Training | Provider | Scope relevant here | Notes |
|---|---|---|---|
| **CompTIA Security+** | CompTIA | Covers authentication factors, access control models (RBAC, etc.) as part of a broad security curriculum | Mentioned elsewhere on this platform's security-adjacent material; not auth-specific |
| **OWASP-adjacent training/workshops** | Various (often community/vendor-run) | Directly covers authentication/session-management vulnerabilities via the OWASP Top 10 and Cheat Series | No single official "OWASP certification" body-of-record — treat specific course offerings as third-party, not an OWASP-issued credential |
| **Provider-specific identity certs** (e.g. Auth0/Okta professional certifications) | Vendor-specific | Covers a *specific* platform's implementation, not the underlying concepts broadly | Useful if targeting a role built specifically around that vendor's product |

`(needs verification — recheck current certification offerings, pricing, and exact scope directly against each provider's site before treating any of the above as current; this space shifts as vendors add/retire credentials)`

For most engineering roles, demonstrated project depth (see the Projects tab) and the ability to reason clearly through the tradeoffs in this course's Interview Prep material carry more real signal than any single certificate for this particular topic.

---

## Core Topics (Reference)

```javascript
// Password hashing
const bcrypt = require('bcrypt');
const hash = await bcrypt.hash(plainPassword, 10);
const matches = await bcrypt.compare(plainPassword, hash);

// JWT sign / verify
const jwt = require('jsonwebtoken');
const token = jwt.sign({ userId, role }, process.env.JWT_SECRET, { expiresIn: '15m' });
const decoded = jwt.verify(token, process.env.JWT_SECRET); // throws on invalid/expired

// Session middleware
app.use(session({
  secret: process.env.SESSION_SECRET,
  cookie: { httpOnly: true, secure: true, sameSite: 'strict' }
}));

// Route protection
function requireAuth(req, res, next) {
  const token = req.headers.authorization?.split(' ')[1];
  if (!token) return res.status(401).end();
  try { req.user = jwt.verify(token, process.env.JWT_SECRET); next(); }
  catch { res.status(401).end(); }
}

// Role check
function requireRole(role) {
  return (req, res, next) =>
    req.user.role === role ? next() : res.status(403).end();
}
```

```
SESSION vs JWT
Sessions:  server-side state | trivial revocation | needs a shared store | lookup per request
JWT:       client-side state | hard to revoke early | no store needed | no lookup per request

401 = who ARE you (auth failed)     403 = I know who you are, NOT allowed (authz failed)
httpOnly cookie: safe from XSS, exposed to CSRF
localStorage:    exposed to XSS,   safe from CSRF
```
