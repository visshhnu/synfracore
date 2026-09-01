# Authentication & Authorization — Intermediate

## Refresh tokens — why access tokens should be short-lived

A JWT can't easily be revoked before it expires (covered in depth in Advanced), so the practical mitigation is keeping the damage window small: **access tokens** are issued short-lived (minutes, not days), while a separate, longer-lived **refresh token** is used only to obtain a new access token when the old one expires — without forcing the user to log in again.

```javascript
function issueTokens(user) {
  const accessToken = jwt.sign(
    { userId: user.id, role: user.role },
    process.env.JWT_SECRET,
    { expiresIn: '15m' } // short-lived -- a stolen access token is only useful briefly
  );
  const refreshToken = jwt.sign(
    { userId: user.id, tokenVersion: user.tokenVersion },
    process.env.REFRESH_SECRET, // deliberately a DIFFERENT secret from access tokens
    { expiresIn: '7d' }
  );
  return { accessToken, refreshToken };
}

app.post('/refresh', (req, res) => {
  const { refreshToken } = req.cookies; // stored httpOnly, see below
  try {
    const decoded = jwt.verify(refreshToken, process.env.REFRESH_SECRET);
    // Check decoded.tokenVersion against the CURRENT stored value for
    // this user -- this is what makes the refresh token actually
    // revocable: bump tokenVersion in the DB and every existing
    // refresh token for that user instantly fails this check
    const user = getUserById(decoded.userId);
    if (user.tokenVersion !== decoded.tokenVersion) {
      return res.status(401).json({ error: 'refresh token revoked' });
    }
    const { accessToken } = issueTokens(user);
    res.json({ accessToken });
  } catch {
    res.status(401).json({ error: 'invalid refresh token' });
  }
});
```

```flow
{
  "layout": "flow",
  "steps": [
    { "label": "Access token expires", "sublabel": "After ~15 minutes", "color": "amber" },
    { "label": "Client sends refresh token", "sublabel": "To /refresh, not the protected route", "color": "blue" },
    { "label": "Server checks tokenVersion", "sublabel": "Against current DB value -- this is the revocation hook", "color": "purple" },
    { "label": "New access token issued", "sublabel": "User never re-enters credentials", "color": "green" }
  ]
}
```

The `tokenVersion` check is the important piece — it's what turns an otherwise-unrevocable JWT-based refresh flow into something that *can* actually be revoked: bump the stored version (on logout, on a suspected compromise) and every outstanding refresh token for that user fails on its next use, even though the token itself is still "validly signed."

## Storing tokens client-side: httpOnly cookies vs localStorage

This is a genuinely important, easy-to-get-wrong security tradeoff, and it's worth covering carefully rather than picking a default without understanding why.

**localStorage** is plain JavaScript-accessible storage — `localStorage.getItem('token')` works from any script running on the page. That includes an attacker's script, if the app has *any* XSS vulnerability anywhere on the page — a stored token in localStorage is directly exfiltratable the moment any unrelated part of the app has an XSS bug, even one unrelated to auth code itself.

**httpOnly cookies** are inaccessible to JavaScript by design — `document.cookie` simply doesn't include them. The browser attaches them to requests automatically; a malicious script running via XSS cannot read the token's value at all, even if it can execute arbitrary JavaScript on the page.

```conceptgrid
{
  "boxes": [
    { "title": "localStorage", "description": "Readable by any JS on the page. XSS anywhere in the app = token theft. Immune to CSRF (not auto-attached).", "color": "amber" },
    { "title": "httpOnly Cookie", "description": "Invisible to JS entirely -- XSS can't read it directly. Auto-attached by the browser, which opens up CSRF exposure instead.", "color": "green" }
  ]
}
```

The honest tradeoff: httpOnly cookies close off the XSS-token-theft vector, but reopen a *different* one — CSRF — because the browser now attaches the cookie automatically to requests the user didn't knowingly initiate. Neither option is a free win; the difference is which specific attack you're defending against, and CSRF (below) has well-understood, effective mitigations, which is why httpOnly cookies are generally the stronger default recommendation.

## CSRF — why it matters even with a "secure" cookie setup

**Cross-Site Request Forgery** exploits exactly the automatic-attachment behavior that makes cookies convenient. If a user is logged into `bank.example.com` (session cookie set) and, in another tab, visits a malicious page that silently submits a form to `bank.example.com/transfer`, the browser attaches the valid session cookie to that request automatically — the malicious page never needed to know or steal the cookie's value at all.

Marking a cookie `Secure` only means "sent over HTTPS" — it says nothing about *which site initiated* the request. That's a genuinely common point of confusion: `Secure` protects transport, not origin.

```javascript
// Real CSRF mitigations -- stacked, not either/or
app.use(cookieParser());
app.use((req, res, next) => {
  res.cookie('sessionId', sessionId, {
    httpOnly: true,
    secure: true,
    sameSite: 'strict' // browser withholds this cookie on cross-site requests
  });
  next();
});

// Explicit CSRF token as defense in depth -- a value the attacker's
// page has no way to know or forge, checked on state-changing requests
const csrfToken = generateRandomToken();
app.post('/transfer', (req, res) => {
  if (req.body.csrfToken !== req.session.csrfToken) {
    return res.status(403).json({ error: 'CSRF token mismatch' });
  }
  // proceed with the transfer
});
```

`SameSite=Strict`/`Lax` on the cookie itself closes off most CSRF by default in modern browsers, but an explicit CSRF token remains a real, common defense-in-depth layer, especially for state-changing requests (`POST`/`PUT`/`DELETE`).

## Role-based vs permission-based authorization

**Role-based** (RBAC) grants access by named role — `admin`, `editor`, `viewer`. Simple to reason about, but coarse: adding one narrow new capability often means creating a whole new role, or overloading an existing one.

**Permission-based** authorization grants access by named, granular capability — `posts:delete`, `users:invite` — and roles become just a convenient bundle of permissions, rather than the thing checked directly.

```javascript
// Role-based -- simple, coarse
function requireRole(role) {
  return (req, res, next) =>
    req.user.role === role ? next() : res.status(403).json({ error: 'forbidden' });
}

// Permission-based -- more granular, scales better as requirements grow
const ROLE_PERMISSIONS = {
  admin: ['posts:delete', 'users:invite', 'users:ban'],
  editor: ['posts:delete'],
  viewer: []
};

function requirePermission(permission) {
  return (req, res, next) => {
    const userPermissions = ROLE_PERMISSIONS[req.user.role] || [];
    if (!userPermissions.includes(permission)) {
      return res.status(403).json({ error: 'forbidden' });
    }
    next();
  };
}

app.delete('/posts/:id', requireAuth, requirePermission('posts:delete'), (req, res) => {
  // an editor OR an admin can reach this -- checked by capability, not identity of role
});
```

Permission-based authorization is the pattern that scales when a real application's access rules stop being a clean hierarchy — e.g. "editors can delete posts but not ban users" doesn't fit a single linear role ladder cleanly, but maps directly onto explicit permission grants.
