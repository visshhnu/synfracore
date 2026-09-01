# Authentication & Authorization Quick Reference

## Password hashing

```javascript
const bcrypt = require('bcrypt');

// Hash (signup)
const hash = await bcrypt.hash(plainPassword, 10); // 10 = cost factor

// Verify (login)
const ok = await bcrypt.compare(plainPassword, storedHash);

// NEVER: storing plaintext, or comparing with === against a stored hash
```

## JWT sign / verify

```javascript
const jwt = require('jsonwebtoken');

// Sign
const token = jwt.sign(
  { userId: user.id, role: user.role },
  process.env.JWT_SECRET,
  { expiresIn: '15m' }
);

// Verify
try {
  const decoded = jwt.verify(token, process.env.JWT_SECRET);
} catch (err) {
  // err.name === 'TokenExpiredError' | 'JsonWebTokenError'
}

// Decode WITHOUT verifying (readable by anyone -- not a security check)
jwt.decode(token);
```

## Express auth middleware

```javascript
function requireAuth(req, res, next) {
  const token = req.headers.authorization?.split(' ')[1];
  if (!token) return res.status(401).json({ error: 'no token' });
  try {
    req.user = jwt.verify(token, process.env.JWT_SECRET);
    next();
  } catch {
    res.status(401).json({ error: 'invalid or expired token' });
  }
}

function requireRole(role) {
  return (req, res, next) =>
    req.user.role === role
      ? next()
      : res.status(403).json({ error: 'forbidden' });
}

app.get('/admin', requireAuth, requireRole('admin'), handler);
```

## Session setup

```javascript
const session = require('express-session');

app.use(session({
  secret: process.env.SESSION_SECRET,
  resave: false,
  saveUninitialized: false,
  cookie: { httpOnly: true, secure: true, sameSite: 'strict', maxAge: 3600000 }
}));

// Regenerate on login (prevents session fixation)
req.session.regenerate((err) => { req.session.userId = user.id; });

// Destroy on logout
req.session.destroy();
```

## Session vs JWT — quick comparison

| | Session | JWT |
|---|---|---|
| State lives | Server (session store) | Client (self-contained) |
| Revocation | Instant (delete record) | Hard before expiry |
| Per-request cost | Store lookup | None (signature check only) |
| Scaling | Needs shared store (Redis) | Naturally stateless |
| Payload visible to client | No | Yes (base64, not encrypted) |

## Status code contract

| Code | Meaning |
|---|---|
| 401 Unauthorized | Identity unknown/unverified — missing, invalid, or expired token/session |
| 403 Forbidden | Identity known — just not permitted to do this |

## Storage tradeoff

| | localStorage | httpOnly cookie |
|---|---|---|
| Readable by JS (XSS risk) | Yes | No |
| Auto-attached (CSRF risk) | No | Yes |
| Needs CSRF mitigation | No | Yes (SameSite + token) |
