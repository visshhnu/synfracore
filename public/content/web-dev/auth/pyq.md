# Authentication & Authorization — PYQ (Previously Asked / Practice Questions)

**Framing note:** there is no public past-paper archive for "authentication and authorization" as a narrow, standalone examined topic — it isn't its own certification the way, say, a cloud platform exam is (see the Certification tab). What follows is built from this guide's own Overview/Intermediate/Advanced/Troubleshooting material, framed as practice questions grounded in real, documented security behavior rather than invented "leaked" content.

---

### 1. (Domain: Core Concepts) Why is conflating authentication and authorization a genuinely dangerous mistake, not just an imprecise use of terms?

**Answer:** A system that only checks authentication and assumes "logged in" implies "permitted to do this" has no actual authorization layer at all — any authenticated user, regardless of intended permissions, can act as any other, including performing admin-only actions, purely by being logged in at all. The two checks answer different questions (who is this vs. what can they do) and both need to be enforced explicitly and separately; treating one as implying the other is a real, documented vulnerability class, not a theoretical concern.

---

### 2. (Domain: Password Storage) Why does this guide treat bcrypt's slowness as a deliberate feature rather than a performance defect?

**Answer:** A fast hash function lets an attacker who steals a database of hashes attempt enormous numbers of guesses per second. bcrypt (and argon2) are deliberately computationally expensive per hash operation, which makes brute-forcing a stolen hash database impractical at scale even though it remains mathematically possible — the same property that adds a small, acceptable delay to a legitimate login makes mass password-cracking economically infeasible for an attacker.

---

### 3. (Domain: JWT Structure) A JWT's payload can be fully read by pasting it into a decoder with no secret required. Does this mean the JWT is broken or insecure?

**Answer:** No — this is expected, correct behavior. JWTs are signed, not encrypted; the signature proves the token wasn't tampered with and was issued by whoever holds the signing secret, but makes no claim about confidentiality. The actual mistake would be putting secret data directly in the payload and assuming it's hidden — the token format itself is working exactly as designed.

---

### 4. (Domain: Sessions vs Tokens) A team needs to be able to instantly revoke a specific user's access the moment a security incident is detected. Which mechanism — plain sessions or plain stateless JWTs — supports this more directly, and why?

**Answer:** Sessions — because the identity state lives server-side, revocation is just deleting that one record from the session store, taking effect on the very next request. A stateless JWT remains valid by design until its signature-checked expiry, since the server verifies it without a lookup; achieving comparable instant revocation with JWTs requires deliberately reintroducing server-side state (a blocklist or a per-user valid-since check), which a plain stateless JWT design doesn't have out of the box.

---

### 5. (Domain: Token Storage) Why is storing an auth token in localStorage considered a real security risk specifically in the presence of an unrelated XSS bug elsewhere in the app?

**Answer:** localStorage is directly readable by any JavaScript executing on the page, and an XSS vulnerability anywhere in the app — not necessarily in auth-related code — allows an attacker's injected script to run on that page too. That script can read localStorage directly and exfiltrate the token, regardless of how unrelated the original XSS bug was to authentication logic. httpOnly cookies close this specific vector because `document.cookie` doesn't expose them to JavaScript at all.

---

### 6. (Domain: CSRF) A cookie is marked both `Secure` and holds a valid session. Is this cookie protected against CSRF?

**Answer:** Not by those flags alone. `Secure` only restricts the cookie to HTTPS transport — it says nothing about which site initiated the request that carries the cookie. CSRF specifically exploits the browser's automatic cookie attachment regardless of request origin; `SameSite=Strict/Lax` and an explicit CSRF token are the actual mitigations, not `Secure` on its own.

---

### 7. (Domain: OAuth) Why does the authorization code flow require a server-to-server exchange step instead of returning the access token directly in the browser redirect?

**Answer:** Keeping the token exchange server-to-server means the actual access token is only obtainable by presenting a client secret the browser never has access to — the browser only ever sees a short-lived, single-use authorization code, which is useless without that secret. Returning a token directly via browser redirect (the deprecated implicit flow) exposed it to browser history, referrer leakage, and interception risk with no equivalent secret-possession requirement.

---

### 8. (Domain: OAuth/OIDC) An application uses bare OAuth 2.0 to determine "the user is signed in" purely because it successfully obtained an access token from a provider. What's the specific risk with this approach, and what protocol addresses it?

**Answer:** OAuth 2.0 is fundamentally an authorization protocol — successfully obtaining an access token proves the app was granted some scoped permission, not necessarily that the token was issued specifically for this app's sign-in intent, and provides no standardized identity assertion. OpenID Connect (OIDC), layered on top of OAuth, addresses this directly with a signed ID token that includes an audience claim and is specifically designed to assert identity, closing the gap that using bare OAuth for login historically left open.

---

### 9. (Domain: Attack Patterns) A user logs into an application, and the session ID used post-login is identical to the one assigned before they ever authenticated. What named attack does this expose the application to, and what's the fix?

**Answer:** Session fixation — an attacker who can get a victim to use a known, attacker-chosen session ID (e.g. via a crafted link) before the victim logs in can then simply wait, since the same session ID becomes authenticated once the victim logs in. The fix is regenerating the session ID at the moment of successful authentication, discarding whatever session ID existed pre-login.

---

### 10. (Domain: Authorization Patterns) A permissions model starts as a small set of roles (`admin`, `user`) but requirements evolve to "editors can delete posts but not ban users, and moderators can ban users but not delete posts." Why does a purely role-based model start to strain here, and what's the alternative?

**Answer:** A clean role-based hierarchy assumes permissions nest in a single linear order (each higher role can do everything a lower one can, plus more) — "editor can delete but not ban, moderator can ban but not delete" doesn't fit that shape, since neither role is strictly a superset of the other. A permission-based model — granular, named capabilities (`posts:delete`, `users:ban`) assigned directly, with roles reduced to convenient bundles of permissions — handles this directly without forcing an artificial linear ranking that doesn't match the actual business rule.
