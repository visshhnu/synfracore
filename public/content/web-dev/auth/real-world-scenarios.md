# Authentication & Authorization — Real World Scenarios

A note on framing: all three scenarios below are illustrative/composite — common, well-documented patterns from real production auth incidents industry-wide, not one specific traceable company's incident.

---

## Scenario 1 (illustrative/composite): A JWT stored in localStorage, stolen through an unrelated XSS bug

**The pattern:** A team builds a JWT-based API and stores the access token in localStorage on the frontend — a common, convenient choice, and one that works correctly for months with no reported issue. Separately, a completely unrelated feature (a user-profile "bio" field, rendered without sanitizing HTML) ships with a stored XSS vulnerability. An attacker discovers the bio-field XSS bug and uses it — not to deface anything visibly — but to inject a script that quietly reads `localStorage.getItem('token')` on any page view and sends it to an external endpoint. Weeks pass before unauthorized account activity is noticed and traced back to stolen tokens, at which point it's unclear how many tokens were harvested during the exposure window.

**Why this is a genuine trap, not an obvious mistake:** the two vulnerable pieces — token storage location and the bio-field sanitization gap — were built by different people, reviewed separately, and neither looked dangerous in isolation. The token-storage choice looked fine because "we don't have any known XSS," and the bio-field gap looked like a minor rendering bug, not a security issue, because nobody connected it to auth at review time. The actual risk only exists at the intersection of the two decisions, which is exactly the kind of gap a single-feature code review doesn't catch.

**What actually prevents this:**
- **Default to httpOnly cookies for token storage**, so the storage layer itself is immune to this entire class of theft regardless of whether an XSS bug exists anywhere else in the app, now or in the future
- **Treat every unsanitized rendering of user-supplied content as a security review item**, not just a cosmetic/rendering concern — the actual damage from an XSS bug is rarely about defacement
- **Add a Content-Security-Policy** restricting where scripts can load from and what they can do, as a second, independent layer that doesn't rely on the app being XSS-free everywhere, forever

---

## Scenario 2 (illustrative/composite): A password-reset flow with a predictable, non-expiring token enabling account takeover

**The pattern:** A "forgot password" feature is built under a real deadline, generating a reset token as a simple incrementing value or a short, low-entropy random string, with no expiry set on it — it seemed like a reasonable simplification at the time, and the feature works fine in every manual test. Later, an attacker who wants to take over a specific known account (an email address they've already identified as a target) discovers the reset link pattern is guessable — either the token space is small enough to brute-force, or old reset links from months earlier are still valid because nothing expires them. The attacker requests a reset for the target's account and successfully guesses or reuses a valid reset token to set a new password, locking the real user out.

**Why this is an easy trap, not an obvious mistake:** the feature "works" in every functional test — a reset link gets emailed, clicking it does let you set a new password — so it passes normal QA cleanly. The vulnerability is entirely in properties that don't show up in a functional test at all: entropy of the token, and whether it expires. Neither absence produces an error anywhere; the flow just silently accepts more than it should.

**What actually prevents this:**
- **Generate reset tokens with a cryptographically secure random source and sufficient length** (not a counter, not a short guessable string) — the same category of rigor as a session ID or signing secret, since a reset token functionally grants the same access
- **Set a short expiry on every reset token** (commonly measured in minutes, not days) and invalidate it immediately after first use, regardless of whether the reset actually completed
- **Explicitly test the security properties, not just the happy path**, as part of shipping the feature — "does this token expire," "how many possible values does it have" are questions a functional QA pass doesn't naturally ask

---

## Scenario 3 (illustrative/composite): A JWT signing secret accidentally committed to a public repository

**The pattern:** A developer, debugging a local JWT verification issue, temporarily hardcodes the signing secret directly into a config file to rule out an environment-variable-loading problem, intending to revert it before committing. The revert is missed in a larger commit, and the secret ships to a public (or later-made-public) repository. Months later, the exposure is discovered — either by an automated secret-scanning tool or, worse, because unusual admin-level activity is traced back to forged tokens. Because the secret was never rotated in the intervening months, every token ever signed with it — and every token an attacker chooses to forge going forward — remains valid until it's finally rotated.

**Why this is an easy, high-consequence trap:** a signing secret is just a string in a config file from the codebase's own perspective — nothing about committing it looks different from committing any other config value, and the immediate consequence (nothing breaks, the app keeps working) gives zero signal that anything is wrong. The actual damage is entirely latent until someone with the secret chooses to exploit it, which can be long after the initial exposure, making the true exposure window far larger than "time until the commit was made public."

**What actually prevents this:**
- **Automated secret-scanning on every commit/PR**, catching high-entropy strings and known secret patterns before they merge, not relying on developer discipline alone to catch a rushed debugging shortcut
- **Treat a compromised signing secret as a full incident requiring immediate rotation**, not a quiet fix — because a forged token is functionally indistinguishable from a real one, there's no way to audit which specific tokens (if any) were actually forged using the exposed secret
- **Never hardcode a secret "temporarily" for local debugging** — use a local-only `.env` file (already `.gitignore`d) even for a quick test, so there's no window where the secret sits in a file that could be accidentally staged and committed
