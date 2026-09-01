# Authentication & Authorization Troubleshooting Guide

## Issue 1: Users get unexpectedly logged out

**Symptom:** Users report being logged out randomly, mid-session, with no action that should have caused it.

**Root Cause:** Either the access token's expiry is shorter than the frontend assumes (and the refresh flow isn't actually working), or the session store lost the session record (a restart, an eviction policy, a full flush during deploy).

**Debug steps:**
```bash
# Check whether refresh is actually being called and succeeding
grep "POST /refresh" /var/log/app/access.log | tail -50

# Check the session store directly, if session-based
redis-cli -h $SESSION_STORE_HOST PING
redis-cli -h $SESSION_STORE_HOST KEYS "sess:*" | wc -l
# A count that drops to near-zero at a specific timestamp points at a
# store restart/flush, not gradual expiry

# Check actual configured token/session lifetime against what's assumed
grep -r "expiresIn\|maxAge" src/auth/
```

**Fix patterns:**
- If refresh isn't firing: confirm the frontend actually calls `/refresh` before the access token expires, not only after a 401 is already returned (a 401-triggered retry can still work, but silently failing retry logic looks identical to "logged out" from the user's side)
- If the session store dropped: check its persistence configuration (Redis `maxmemory-policy`, whether it's backed by disk) and whether a deploy step is unintentionally recreating rather than reusing it
- Add logging specifically distinguishing "token expired" from "token invalid" from "session not found" — these look identical to the user but have different fixes

---

## Issue 2: JWT verification fails after deployment, worked fine before

**Symptom:** Every request suddenly returns 401 immediately after a deploy, even for freshly issued tokens.

**Root Cause:** The signing secret differs between the instance that issued the token and the instance verifying it — a common cause during a rolling deploy where an environment variable changed mid-rollout, or where different instances are reading from different secrets sources.

**Debug steps:**
```bash
# Compare the secret's hash across every running instance -- never log
# the raw secret itself
echo $JWT_SECRET | sha256sum

# Confirm all instances are actually reading from the same source
# (a shared secrets manager, not a per-instance .env file that could drift)
```

**Fix patterns:**
- Store the signing secret in a single shared secrets manager, not per-instance environment files that can silently diverge
- During a secret rotation, support verifying against both the old and new secret for a transition window, rather than an instant cutover that invalidates every outstanding token at once
- Add a startup-time log (a hash of the secret, never the raw value) so a mismatch across instances is visible immediately, not discovered via a wave of user-facing 401s

---

## Issue 3: CORS + cookie issues in a cross-origin auth setup

**Symptom:** Login succeeds (200 response), but the session cookie never actually gets sent on the next request — the user appears logged out immediately.

**Root Cause:** A cross-origin setup (frontend on one domain, API on another) requires explicit configuration on both the cookie and the CORS policy for cookies to actually be included in cross-origin requests; the default behavior is to not send them.

**Debug steps:**
```javascript
// Check the actual response headers on the login request in devtools --
// is Set-Cookie present at all? Is the browser rejecting it?

// Common missing pieces:
app.use(cors({
  origin: 'https://frontend.example.com', // NOT '*' -- wildcard breaks credentialed requests
  credentials: true // required for the browser to send/receive cookies cross-origin
}));

res.cookie('sessionId', id, {
  sameSite: 'none', // 'strict'/'lax' block cross-site sending entirely
  secure: true       // 'none' REQUIRES secure -- browsers reject it otherwise
});
```

```javascript
// Frontend fetch/axios call must also opt in explicitly
fetch('https://api.example.com/profile', { credentials: 'include' });
```

**Fix patterns:**
- `Access-Control-Allow-Origin` cannot be `*` when credentials are involved — it must be an explicit origin
- `SameSite=None` requires `Secure` — the browser silently drops the cookie otherwise, with no error surfaced to the frontend
- The client request itself must explicitly opt into sending credentials (`credentials: 'include'`) — omitting this is a common, silent cause

---

## Issue 4: A password-comparison timing attack (non-constant-time comparison)

**Symptom:** Not user-visible directly — this is a security review finding, not a runtime error, and that's exactly what makes it dangerous.

**Root Cause:** Comparing a submitted secret against a stored value with a naive `===` or basic string comparison returns as soon as it hits the first mismatched character, which can create a measurable timing difference an attacker can exploit to recover the secret one character at a time.

**Debug steps:**
```javascript
// AUDIT for direct string comparison of secrets anywhere in the codebase
grep -rn "=== *req\.\(body\|headers\)" src/ | grep -i "token\|secret\|password"
```

**Fix patterns:**
```javascript
// WRONG -- vulnerable to timing analysis
if (submittedToken === storedToken) { /* ... */ }

// RIGHT -- constant-time comparison
const crypto = require('crypto');
function safeCompare(a, b) {
  const bufA = Buffer.from(a);
  const bufB = Buffer.from(b);
  if (bufA.length !== bufB.length) return false; // still leaks length, generally acceptable
  return crypto.timingSafeEqual(bufA, bufB);
}

// For actual PASSWORDS, this is already handled correctly by bcrypt.compare --
// never compare a raw password or hash with === in the first place
await bcrypt.compare(submittedPassword, storedHash);
```

**Prevention:** any code path comparing a secret value directly (API keys, CSRF tokens, webhook signatures) — not just passwords — should use a constant-time comparison; bcrypt's own `compare` already handles this correctly for hashed passwords specifically.

---

## Issue 5: A JWT stored in localStorage gets exfiltrated via an unrelated XSS bug

**Symptom:** Users report unauthorized actions on their accounts; investigation finds valid tokens being used from IPs/devices the user never used.

**Root Cause:** The auth token was stored in localStorage, and a completely unrelated XSS vulnerability elsewhere in the application (a comment field that didn't sanitize input, a third-party widget with a bug) allowed an attacker's script to run on the page and read `localStorage.getItem('token')` directly.

**Debug steps:**
```bash
# Confirm where tokens are stored client-side
grep -rn "localStorage.setItem.*token" src/frontend/

# Audit for the actual XSS entry point -- unsanitized rendering of
# user-supplied content is the most common source
grep -rn "dangerouslySetInnerHTML\|v-html\|innerHTML" src/frontend/
```

**Fix patterns:**
- Migrate token storage to an httpOnly cookie so it's unreadable by JavaScript regardless of any XSS elsewhere in the app — this closes the vector at the storage layer rather than relying on eliminating every possible XSS bug across the entire codebase
- Fix the actual XSS vulnerability itself (sanitize/escape user-supplied content before rendering) — moving storage doesn't excuse leaving the underlying XSS bug unfixed, since XSS has other consequences beyond token theft
- Add a Content-Security-Policy header restricting script sources as a defense-in-depth layer, independent of the storage fix

---

## Prevention Tips

- Always regenerate the session ID on login — prevents session fixation with near-zero cost
- Default to httpOnly cookies for token storage unless there's a specific, deliberate reason not to, and pair with SameSite + CSRF-token mitigation
- Never compare secrets with plain `===` — constant-time comparison for anything security-sensitive
- Store signing secrets in one shared source, never per-instance files that can drift during a rollout
- Treat every `dangerouslySetInnerHTML`/`innerHTML` usage as a genuine XSS review point, not just a rendering convenience
- Set `credentials: true` + explicit origin (never `*`) on CORS when cookies are involved in a cross-origin setup
