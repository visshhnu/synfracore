# Full-Stack Integration & Deployment — Real World Scenarios

A note on framing: all three scenarios below are illustrative/composite — common, well-documented patterns from real full-stack deployment work industry-wide, not one specific traceable company's incident.

---

## Scenario 1 (illustrative/composite): The app that worked perfectly until the exact moment it went live

**The pattern:** A team finishes a full-stack app, tests it thoroughly in local development for weeks — every feature works, auth works, the database connection is solid. They deploy the frontend and backend to two separate platforms for the first time and immediately every single feature that requires login breaks, with no obvious error message visible to end users, just a generic "something went wrong" the frontend shows for any failed request. Investigation eventually reveals the backend's `JWT_SECRET` environment variable — set correctly in the local `.env` file used throughout development — was never actually set on the production deployment platform; the backend was signing and verifying tokens against `undefined` the entire time, which happened to still "work" internally (an undefined secret signs *something*) but broke as soon as a second backend instance or a redeploy meant the in-memory undefined value changed.

**Why this is a genuinely easy trap, not an obvious mistake:** a local `.env` file feels like "the configuration" throughout development because it's the only configuration that's ever existed for the project — there's no natural moment during local-only development where the distinction between "configuration that exists" and "configuration that's actually been set on the platform that will run this in production" becomes visible. The bug is invisible for the entire development period and only manifests at the one moment — first deployment — that development itself never actually tested.

**What actually prevents this:**
- **Treat "set on the local machine" and "set on the deployment platform" as two entirely separate, both-required steps**, never assuming one implies the other, for every environment variable a project has.
- **Verify every required environment variable directly on the deployment platform after every deploy that could affect them**, rather than trusting that a previous successful deploy means nothing has changed.
- **Test the actual deployed app's full auth flow immediately after first deployment**, specifically, rather than only checking that the homepage loads — a deploy that "looks successful" (builds, serves a page) can still be completely broken for any feature that depends on configuration the build step doesn't need.

---

## Scenario 2 (illustrative/composite): The CORS error that took hours to diagnose because the error pointed at the symptom, not the cause

**The pattern:** After a routine deployment, a team gets a report that "the app is broken" — no orders are loading, and the frontend just shows a spinner that never resolves, or a generic error. The browser console does show a CORS error, but the engineer investigating initially dismisses it as a red herring, reasoning "we didn't change anything about CORS" — the actual change in that deployment was switching the backend from one hosting platform to another, which happened to also change the backend's URL. Hours of investigating the frontend's data-fetching code, the backend's database queries, and the auth middleware turn up nothing, before someone finally reads the CORS error message itself carefully and notices it's complaining about an origin that doesn't match the *old* backend's CORS allowlist — because the allowlist was never updated to include whatever the frontend's current origin actually is, and the platform migration had nothing to do with it directly; it just happened to coincide with the frontend's origin also changing in the same deployment window.

**Why this is a genuinely easy trap, not an obvious mistake:** a CORS error message names the symptom (a blocked cross-origin response) precisely, but doesn't point backward at *why* the allowlist is wrong — that requires the engineer to independently reconstruct what changed about either origin recently, which is easy to overlook when the deployment's stated purpose was unrelated (a platform migration, not a CORS change). The error is technically completely accurate and specific; the diagnostic difficulty is entirely in connecting it to an unrelated-seeming recent change.

**What actually prevents this:**
- **Treat any deployment that changes either frontend or backend's URL/origin as requiring an explicit CORS allowlist review**, even when the deployment's primary purpose was something else entirely — origin changes are easy to make as a side effect of an unrelated change.
- **When a CORS error appears, check what actually changed about either origin recently as the first hypothesis**, rather than treating the error as unrelated to a recent unrelated-sounding deployment.
- **Keep the CORS allowlist driven by an environment variable reviewed as part of every deployment's checklist**, rather than a value set once and assumed permanent.

---

## Scenario 3 (illustrative/composite): AI-generated auth middleware accepted without review, shipping a real vulnerability

**The pattern:** Under deadline pressure, a developer asks an AI coding assistant to "add authentication middleware to protect these routes," receives working-looking code, confirms it runs without errors, and ships it without reading it closely — the routes now return 401 for requests without a token, which looks like correct behavior in casual testing. Weeks later, a security review (or a curious user) discovers the middleware verifies that a token exists and is well-formed, but never actually checks the token's signature against the server's secret — meaning any string shaped like a JWT, including a trivially self-forged one, passes the check. The vulnerability had been live in production the entire time, silently, because "the routes return 401 without a token" and "the routes are actually secure" look identical in casual manual testing but are completely different guarantees.

**Why this is an easy, non-obvious trap specifically with AI-assisted code:** AI-generated code that runs without errors and produces plausible-looking behavior in a quick manual check creates a strong, false signal of correctness — especially for security logic, where the *absence* of a check (signature verification) doesn't produce any visible symptom at all in normal testing; only real cryptographic analysis or a deliberate forged-token test would reveal it. The same failure mode is possible with human-written code, but the speed and plausibility of AI-generated code makes it easier to accept without the scrutiny that security-sensitive logic specifically needs.

**What actually prevents this:**
- **Treat any AI-generated code touching authentication, authorization, or user input as requiring line-by-line human review before merging, without exception** — this is exactly the category this course's Fundamentals module flags as needing human judgment, not a general suspicion of AI-generated code everywhere.
- **Test security-sensitive code against the failure case, not just the success case** — specifically, test what happens with a deliberately invalid or forged token, not just confirm that a valid flow and a missing-token flow behave as expected.
- **Require a second reviewer, human, specifically for any change to an auth flow** — the same discipline a team would (or should) already apply to human-written auth code, applied consistently regardless of whether an assistant helped write the first draft.
