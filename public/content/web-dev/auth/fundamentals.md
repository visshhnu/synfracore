# Authentication & Authorization — Fundamentals

## Password hashing — why plaintext and encryption are both wrong

Storing a password as plaintext means anyone with database access — an attacker after a breach, a careless insider — has every user's actual password directly. Encrypting it is better but still wrong for this purpose: encryption is designed to be reversible with the right key, and if an attacker compromises the server, they very likely have access to that key too (it has to live somewhere the server can reach it).

**Hashing** is the correct tool because it's deliberately one-way — there is no key that turns a hash back into the original password. bcrypt and argon2 are the real, correct answers here specifically because they're also deliberately *slow* — an attacker who steals a database of hashes can't brute-force millions of guesses per second the way they could against a fast hash like plain SHA-256.

```javascript
const bcrypt = require('bcrypt');

// Hashing at signup -- the "10" is the cost factor (work factor).
// Higher = slower = more resistant to brute force, at the cost of
// slower legitimate logins too. 10-12 is a common real-world default.
async function hashPassword(plainPassword) {
  return bcrypt.hash(plainPassword, 10);
}

// Verifying at login -- never compare hashes with === or store the
// plaintext to compare against; bcrypt.compare re-hashes with the same
// salt embedded in the stored hash and compares safely.
async function verifyPassword(plainPassword, storedHash) {
  return bcrypt.compare(plainPassword, storedHash);
}
```

## Sessions and cookies — server-side identity state

A session is a record the server keeps (in memory for a toy example, Redis or a database in production) mapping an opaque session ID to "this is user 42, logged in at this time." The client only ever holds that opaque ID, delivered via a cookie the browser automatically re-attaches to every request to the same domain.

```javascript
const session = require('express-session');

app.use(session({
  secret: process.env.SESSION_SECRET,
  resave: false,
  saveUninitialized: false,
  cookie: { httpOnly: true, secure: true, maxAge: 1000 * 60 * 60 } // 1 hour
}));

app.post('/login', async (req, res) => {
  const user = await findUserByEmail(req.body.email);
  if (user && await verifyPassword(req.body.password, user.passwordHash)) {
    req.session.userId = user.id; // server now "remembers" this browser
    return res.json({ ok: true });
  }
  res.status(401).json({ error: 'invalid credentials' });
});
```

Revoking a session is trivial — delete that one record server-side (`req.session.destroy()`), and the cookie the client still holds is now useless, since the server no longer recognizes it.

## JWTs — structure, and "signed, not encrypted"

A JWT is three base64 segments joined by dots: `header.payload.signature`. The **header** names the signing algorithm; the **payload** carries claims (arbitrary data — a user ID, a role, an expiry); the **signature** is computed from the header and payload using a secret key, and lets a verifier confirm the token wasn't tampered with since issuance.

**This is a genuinely common misconception worth stating directly: a standard JWT's payload is not encrypted — it's just base64-encoded, which is trivially reversible by anyone, not a security mechanism at all.** Paste any JWT into jwt.io and its payload decodes instantly, no secret required. The signature proves *integrity* (nothing was changed) and *authenticity* (it was issued by whoever holds the secret) — it says nothing about *confidentiality*. Never put a password, a credit card number, or anything genuinely secret directly into a JWT payload.

```javascript
const jwt = require('jsonwebtoken');

// Issuing a token at login
const token = jwt.sign(
  { userId: user.id, role: user.role },
  process.env.JWT_SECRET,
  { expiresIn: '15m' }
);

// Verifying a token on a protected route
try {
  const decoded = jwt.verify(token, process.env.JWT_SECRET);
  console.log(decoded.userId, decoded.role); // trusted, since signature checked out
} catch (err) {
  // TokenExpiredError, JsonWebTokenError -- treat both as "not authenticated"
}
```

```conceptgrid
{
  "boxes": [
    { "title": "Header", "description": "Algorithm used to sign (e.g. HS256). Base64-encoded, not secret.", "color": "slate" },
    { "title": "Payload", "description": "Claims -- userId, role, expiry. Base64-encoded and FULLY READABLE by anyone, not encrypted.", "color": "amber" },
    { "title": "Signature", "description": "Computed from header+payload+secret. Proves it wasn't tampered with. This is the ONLY part that actually requires the secret.", "color": "green" }
  ]
}
```

## Middleware-based route protection in Express

Auth checks belong in middleware, not duplicated inside every route handler — this is exactly the cross-cutting-concern pattern this academy's Express material already establishes for logging and validation.

```javascript
function requireAuth(req, res, next) {
  const authHeader = req.headers.authorization; // "Bearer <token>"
  const token = authHeader && authHeader.split(' ')[1];
  if (!token) return res.status(401).json({ error: 'no token provided' });

  try {
    req.user = jwt.verify(token, process.env.JWT_SECRET);
    next(); // identity confirmed -- pass control forward
  } catch (err) {
    return res.status(401).json({ error: 'invalid or expired token' });
  }
}

app.get('/profile', requireAuth, (req, res) => {
  res.json({ userId: req.user.userId }); // req.user set by the middleware above
});
```

Note the same `next()` contract from this academy's Express Fundamentals — `requireAuth` either calls `next()` (identity confirmed, continue) or sends a response itself (401), never both, never neither.

## Basic role-based authorization

Authentication middleware answers "who is this." A separate, second middleware answers "is this identity allowed to do *this specific thing*" — the two checks stay distinct on purpose.

```javascript
function requireRole(role) {
  return (req, res, next) => {
    if (req.user.role !== role) {
      return res.status(403).json({ error: 'forbidden' }); // 403, not 401 --
      // the user IS authenticated; they're just not permitted here
    }
    next();
  };
}

app.delete('/admin/users/:id', requireAuth, requireRole('admin'), (req, res) => {
  // only reached if BOTH: token is valid AND role === 'admin'
});
```

**401 vs 403 is a real, meaningful distinction, not interchangeable:** 401 means "I don't know who you are" (missing/invalid token); 403 means "I know exactly who you are, and the answer is no."

## Try It (2 Minutes)

```javascript
// Run this in a Node REPL after `npm install bcrypt`
const bcrypt = require('bcrypt');

(async () => {
  const hash = await bcrypt.hash('correct-horse-battery-staple', 10);
  console.log(hash); // different every time -- bcrypt salts automatically

  console.log(await bcrypt.compare('correct-horse-battery-staple', hash)); // true
  console.log(await bcrypt.compare('wrong-password', hash));               // false
})();
```

Run it twice with the same password and notice the hash is different each time (bcrypt generates a random salt per call) — yet `compare` still correctly returns `true` both times. That's the salt embedded in the stored hash doing its job.
