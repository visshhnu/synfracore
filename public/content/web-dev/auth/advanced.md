# Authentication & Authorization — Advanced

## OAuth 2.0 flows, in depth

### Authorization code flow — the real production-correct one

```flow
{
  "layout": "flow",
  "steps": [
    { "label": "User clicks \"Sign in with Google\"", "sublabel": "Redirected to Google's auth page", "color": "slate" },
    { "label": "User authenticates directly with Google", "sublabel": "App never sees the Google password", "color": "blue" },
    { "label": "Google redirects back with a CODE", "sublabel": "Short-lived, single-use, not a token yet", "color": "purple" },
    { "label": "App's BACKEND exchanges code for token", "sublabel": "Server-to-server, using a client secret", "color": "amber" },
    { "label": "Access token stays server-side", "sublabel": "Never exposed to the browser during exchange", "color": "green" }
  ]
}
```

The defining property: the actual access token is obtained via a **server-to-server** exchange (the app's backend calling Google's token endpoint directly, presenting a client secret only the backend knows), not via the browser redirect itself. The browser only ever sees the short-lived, single-use authorization code — which is useless on its own without the client secret to exchange it.

```javascript
// Simplified authorization code exchange (conceptual -- exact endpoint
// shapes are provider-specific; treat exact request/response fields as
// (needs verification -- recheck against current provider documentation)
app.get('/auth/google/callback', async (req, res) => {
  const { code } = req.query;
  const response = await fetch('https://oauth2.googleapis.com/token', {
    method: 'POST',
    headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
    body: new URLSearchParams({
      code,
      client_id: process.env.GOOGLE_CLIENT_ID,
      client_secret: process.env.GOOGLE_CLIENT_SECRET, // never exposed to the browser
      redirect_uri: process.env.GOOGLE_REDIRECT_URI,
      grant_type: 'authorization_code'
    })
  });
  const { access_token, id_token } = await response.json();
  // id_token (OIDC) proves identity -- see below
});
```

### Why the implicit flow is now discouraged

The (now-deprecated) implicit flow returned the access token directly in the browser's redirect URL fragment — no backend exchange step at all. This meant the token passed through the browser history, could leak via a referrer header, and required no possession of a client secret to receive — any script that could intercept the redirect got a usable token. The authorization code flow (with PKCE for public clients like mobile/SPA apps that can't safely hold a client secret) closes this gap by keeping the actual token exchange server-side or cryptographically bound to the specific request. `(needs verification — recheck current OAuth working-group guidance, since implicit-flow deprecation specifics have continued to evolve)`

## OpenID Connect vs OAuth — the genuinely common confusion

**OAuth 2.0** is an *authorization* protocol — it grants a scoped permission ("this app may read this user's calendar") without a standardized way to prove *who* the user actually is. It was never designed as a login/identity protocol, even though it got used as one informally for years, sometimes insecurely — treating "the app successfully got an access token from Google" as proof of identity is a real, documented historical vulnerability class, because an access token alone doesn't guarantee it was issued for *this* app or *this* specific sign-in intent.

**OpenID Connect (OIDC)** is a thin identity layer built directly on top of OAuth 2.0 that adds a standardized **ID token** — a signed JWT specifically asserting who the user is, including an audience claim (which app it was issued for) that closes the gap above. "Sign in with Google/GitHub" done correctly today is OIDC, not bare OAuth.

```conceptgrid
{
  "boxes": [
    { "title": "OAuth 2.0", "description": "Authorization -- grants scoped access to a resource on the user's behalf. Not inherently an identity protocol.", "color": "blue" },
    { "title": "OpenID Connect", "description": "Identity/authentication, layered on top of OAuth. Adds a signed ID token specifically proving who the user is.", "color": "green" }
  ]
}
```

## Token revocation strategies — a real hard problem

A stateless JWT is, by design, valid until it expires — there's no built-in "un-issue this specific token" operation, since the server verifies it purely by signature and claims, without a database lookup. Real strategies all trade some of that statelessness back for revocability:

- **Short-lived access tokens + revocable refresh tokens** (covered in Intermediate) — bounds the damage window without a lookup on every request; revocation happens at refresh time, not immediately.
- **A blocklist of revoked token IDs (`jti` claim)**, checked on every request — restores true immediate revocation, but reintroduces the server-side lookup a stateless design was trying to avoid, and the blocklist itself needs cleanup once tokens naturally expire.
- **A per-user "valid since" timestamp**, checked against the token's issued-at claim — cheaper than a per-token blocklist (one value per user, not one per token), but only supports "revoke everything issued before now," not revoking one specific token while leaving others valid.

There is no free option here — every real revocation strategy for JWTs reintroduces some server-side state and lookup cost; the honest engineering question is how much of each a given application can tolerate, not which option avoids the tradeoff entirely.

## Multi-factor authentication — concepts

MFA requires a second, independent factor beyond "something you know" (a password):

- **Something you have** — a time-based one-time code (TOTP) from an authenticator app, a hardware security key (WebAuthn/FIDO2)
- **Something you are** — biometrics (fingerprint, face) — typically verified locally on-device, not transmitted as raw biometric data to the server

The security value is specifically about **independence** — a leaked password database compromises the "something you know" factor entirely, but doesn't compromise a physically separate authenticator device or hardware key at all. MFA meaningfully raises the bar precisely because an attacker now needs to separately compromise a genuinely different category of proof, not just guess harder at the same one.

## Session fixation and other real named attack patterns

**Session fixation:** an attacker tricks a victim into using a session ID the attacker already knows (e.g. via a crafted link with the session ID pre-set), then waits for the victim to log in under that session ID — the attacker's pre-known session ID is now authenticated. **The fix:** always regenerate the session ID upon successful login, never reuse whatever session ID existed pre-authentication.

```javascript
app.post('/login', async (req, res) => {
  const user = await authenticateUser(req.body);
  if (user) {
    req.session.regenerate((err) => { // discard any pre-login session ID
      if (err) return res.status(500).end();
      req.session.userId = user.id;
      res.json({ ok: true });
    });
  }
});
```

**Session hijacking:** an attacker obtains a valid session ID directly (via XSS, network sniffing on an unencrypted connection, or a leaked log) and uses it as-is. Mitigated by `httpOnly` + `Secure` cookies, HTTPS everywhere, and short session lifetimes — not by anything about the session ID's format itself.

**Timing attacks on credential comparison:** comparing a submitted value against a stored secret with a naive `===`/string comparison can leak information through response-time differences, since most comparison implementations return as soon as they hit the first mismatched character — an attacker measuring response times can, in principle, recover a secret one character at a time. This is why constant-time comparison (`crypto.timingSafeEqual` in Node, or letting bcrypt's own `compare` handle it) matters for anything comparing secrets directly — covered concretely in Troubleshooting.
