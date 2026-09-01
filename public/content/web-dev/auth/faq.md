# Authentication & Authorization — FAQ

## Are JWTs encrypted?

No, and this is a genuinely important misconception to correct directly — a standard JWT's payload is base64-encoded, not encrypted, and is fully readable by anyone holding the token, no secret required (paste one into jwt.io to see this directly). The signature proves the token wasn't tampered with and was issued by whoever holds the signing secret — it says nothing about confidentiality. Never put secret data (a password, sensitive PII) directly in a JWT payload assuming it's hidden.

## Is storing a token in localStorage fine if my site uses HTTPS?

No — this conflates two different, unrelated protections. HTTPS protects data *in transit*, between the browser and the server, from network-level interception. It does nothing to protect data already sitting in localStorage from being read by JavaScript running on the page itself — which is exactly what an XSS vulnerability lets an attacker do, entirely independent of whether the connection was encrypted. HTTPS and XSS-resistant token storage are two separate defenses against two separate threats.

## If I use httpOnly cookies, do I still need to worry about CSRF?

Yes — httpOnly closes off one specific vector (JavaScript reading the token via XSS) but doesn't address CSRF at all, since CSRF doesn't require reading the cookie's value in the first place — it just relies on the browser attaching it automatically to a request the user didn't knowingly initiate. `SameSite=Strict/Lax` on the cookie plus an explicit CSRF token for state-changing requests are the actual CSRF mitigations, needed regardless of the XSS-focused httpOnly protection.

## Why can't I just delete/blocklist a JWT the way I'd destroy a session?

Because a plain JWT is verified purely by its signature and claims, without any server-side lookup — that's the entire point of a stateless token. There's no built-in record anywhere to delete. Real revocation for JWTs requires deliberately reintroducing some server-side state — a blocklist of revoked token IDs, or a per-user "valid since" value checked against the token's issue time — which trades away some of the statelessness that made JWTs attractive in the first place. This is a genuine, unavoidable tradeoff, not a solvable gap in the format.

## Is OAuth the same thing as "Sign in with Google"?

Not exactly — this is a common, understandable conflation. OAuth 2.0 by itself is an authorization protocol, granting scoped access to a resource, without a standardized way to prove identity. "Sign in with Google" done correctly today layers OpenID Connect (OIDC) on top of OAuth specifically to add a signed identity assertion (an ID token). Using bare OAuth for login, without OIDC's identity layer, was a real historical source of subtle authentication bugs.

## Do I need a password reset feature to expire its tokens quickly if it's already random?

Yes — randomness (entropy) and expiry are two separate properties, and both matter independently. A sufficiently random token that never expires is still a standing, permanently valid credential sitting in an old email somewhere, which is a real risk over a long enough time horizon (an old email account compromise, an email search turning up a years-old reset link). A short expiry bounds the exposure window regardless of how strong the randomness is.

## Is role-based authorization always simpler and therefore always the right default?

It's simpler to reason about initially, but it strains once real rules stop fitting a clean linear hierarchy — "this role can do A and B, but not C, while a different role can do C but not A" doesn't fit a single ranked role ladder. Permission-based authorization (granular, named capabilities, with roles as convenient bundles) handles that shape directly. Starting role-based for a genuinely simple app is reasonable; the FAQ-worthy mistake is assuming role-based will keep scaling cleanly as requirements grow more specific, without revisiting the model.

## Does multi-factor authentication mean my password security matters less?

No — MFA is a second, independent layer, not a replacement for the first. A weak or reused password is still a real risk even with MFA enabled (an attacker who obtains it still has to separately defeat the second factor, which is real friction, but a strong first factor still meaningfully reduces how often that second layer gets tested at all). Treat password hashing/strength and MFA as complementary, not substitutable.
