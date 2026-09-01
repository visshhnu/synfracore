# Authentication & Authorization — Portfolio Projects

## Project 1: Email/Password Auth System with Hashed Passwords and Sessions

**Level:** Beginner | **Time:** 4-6 hours | **GitHub repo name:** `session-auth-express`

**What you build:** a small Express API with signup, login, logout, and a protected `/profile` route, using bcrypt-hashed passwords and server-side sessions (not JWTs) — the goal is internalizing session mechanics before token mechanics.

```javascript
const express = require('express');
const bcrypt = require('bcrypt');
const session = require('express-session');
const app = express();

app.use(express.json());
app.use(session({
  secret: process.env.SESSION_SECRET,
  resave: false,
  saveUninitialized: false,
  cookie: { httpOnly: true, maxAge: 1000 * 60 * 60 }
}));

const users = new Map(); // { email -> { id, email, passwordHash } }

app.post('/signup', async (req, res) => {
  const { email, password } = req.body;
  if (users.has(email)) return res.status(409).json({ error: 'already exists' });
  const passwordHash = await bcrypt.hash(password, 10);
  users.set(email, { id: users.size + 1, email, passwordHash });
  res.status(201).json({ ok: true });
});

app.post('/login', async (req, res) => {
  const { email, password } = req.body;
  const user = users.get(email);
  if (!user || !(await bcrypt.compare(password, user.passwordHash))) {
    return res.status(401).json({ error: 'invalid credentials' });
  }
  req.session.regenerate((err) => { // prevent session fixation
    if (err) return res.status(500).end();
    req.session.userId = user.id;
    res.json({ ok: true });
  });
});

function requireAuth(req, res, next) {
  if (!req.session.userId) return res.status(401).json({ error: 'not logged in' });
  next();
}

app.get('/profile', requireAuth, (req, res) => res.json({ userId: req.session.userId }));
app.post('/logout', requireAuth, (req, res) => req.session.destroy(() => res.json({ ok: true })));

app.listen(3000);
```

**What this demonstrates:** correct hashing, session regeneration on login (fixation prevention), and a clean 401 contract for the protected route.

---

## Project 2: JWT-Based API Auth with Refresh Tokens

**Level:** Intermediate | **Time:** 8-10 hours | **GitHub repo name:** `jwt-refresh-api`

**What you build:** a stateless JWT API — short-lived access tokens, httpOnly-cookie-stored refresh tokens with a `tokenVersion` revocation hook, and a working `/refresh` endpoint.

```javascript
function issueTokens(user) {
  const accessToken = jwt.sign(
    { userId: user.id, role: user.role },
    process.env.JWT_SECRET, { expiresIn: '15m' }
  );
  const refreshToken = jwt.sign(
    { userId: user.id, tokenVersion: user.tokenVersion },
    process.env.REFRESH_SECRET, { expiresIn: '7d' }
  );
  return { accessToken, refreshToken };
}

app.post('/login', async (req, res) => {
  const user = await authenticate(req.body.email, req.body.password);
  if (!user) return res.status(401).json({ error: 'invalid credentials' });
  const { accessToken, refreshToken } = issueTokens(user);
  res.cookie('refreshToken', refreshToken, { httpOnly: true, secure: true, sameSite: 'strict' });
  res.json({ accessToken });
});

app.post('/logout', (req, res) => {
  bumpTokenVersion(req.user.userId); // invalidates every outstanding refresh token
  res.clearCookie('refreshToken');
  res.json({ ok: true });
});
```

**What this demonstrates:** the short-access/long-refresh split, revocation via `tokenVersion` (the actual mechanism that makes an otherwise-stateless JWT flow revocable), and httpOnly cookie storage for the more sensitive, longer-lived token.

---

## Project 3: Role-Based Authorization for a Multi-Tenant-Style App

**Level:** Advanced | **Time:** 10-14 hours | **GitHub repo name:** `multi-tenant-rbac`

**What you build:** an API where users belong to one or more organizations, each with a per-organization role — modeling the real-world case where "admin" in one tenant means nothing in another.

```javascript
// membership: { userId, orgId, role: 'owner' | 'editor' | 'viewer' }

function requireOrgRole(minRole) {
  const ROLE_RANK = { viewer: 0, editor: 1, owner: 2 };
  return async (req, res, next) => {
    const { orgId } = req.params;
    const membership = await getMembership(req.user.userId, orgId);
    if (!membership) return res.status(403).json({ error: 'not a member of this org' });
    if (ROLE_RANK[membership.role] < ROLE_RANK[minRole]) {
      return res.status(403).json({ error: 'insufficient role' });
    }
    req.membership = membership;
    next();
  };
}

app.delete('/orgs/:orgId/members/:userId', requireAuth, requireOrgRole('owner'), (req, res) => {
  // only an owner OF THIS SPECIFIC org reaches here -- not a global admin flag
});
```

**What this demonstrates:** authorization scoped per-resource (per-organization), not just per-user globally — the realistic shape most production multi-tenant systems actually need, versus a single flat `role` field on the user record.
