# Express.js — Real World Scenarios

A note on framing: all three scenarios below are illustrative/composite — common, well-documented patterns from production Express usage industry-wide, not one specific traceable company's incident.

---

## Scenario 1 (illustrative/composite): The unhandled async rejection that crashed the whole process, not just one request

**The pattern:** A team's Express API has run reliably for months, with route handlers written as `async` functions calling out to a third-party service. One day, that third-party service starts intermittently timing out under load. Instead of individual requests failing gracefully with a `504` or `502`, the entire Node process crashes and restarts — taking down every in-flight request across every user, not just the ones hitting the slow third-party call. The team initially suspects a memory leak or an infrastructure issue, since the crash pattern looks unrelated to any specific code change.

**Why this is a genuinely easy trap, not an obvious mistake:** the route handlers looked completely correct under normal conditions — `await someExternalCall()` followed by `res.json(result)` runs and returns fine every single time the external call succeeds. The gap only appears when that call actually rejects, and it had simply never rejected in production before that specific incident — meaning the missing `try/catch` was latent, invisible, and untested for months, not a bug anyone would have caught by reading the happy-path code.

**What actually prevents this:**
- **Treat every `await` inside a route handler as something that can reject, unconditionally**, the same way any I/O call in another language would be treated as fallible — wrap it in `try/catch` and forward to `next(err)`, or use a reusable async-wrapper utility applied to every async route as a project-wide standard, not a case-by-case judgment call.
- **Add a process-level safety net (`process.on('unhandledRejection', ...)`) as a last line of defense**, logging and alerting on it — not as a substitute for fixing individual handlers, but as a way to at least surface the problem loudly instead of a silent crash.
- **Load-test or fault-inject against third-party dependencies deliberately** (simulate the external service timing out) before it happens for real, specifically because a rejection path that's never been exercised in testing is a rejection path nobody actually knows behaves correctly.

---

## Scenario 2 (illustrative/composite): The middleware registered in the wrong order that silently let unauthenticated requests through

**The pattern:** A team adds a new set of admin-only routes to an existing Express app, intending to protect them with an existing `requireAuth` middleware. The new routes are added quickly, mounted directly on `app` before the line that applies `requireAuth` to the `/admin` prefix elsewhere in the file — a plausible, easy copy-paste-adjacent mistake in a file that's grown large. The app works completely correctly in every manual test the team runs, because everyone testing it happens to already be signed in. The gap is only discovered weeks later, when server logs show admin routes being hit by requests carrying no authorization header at all.

**Why this is an easy, non-obvious side effect of otherwise correct code:** nothing about the broken configuration produces an error, a warning, or even unusual behavior for an authenticated user — the bug is entirely invisible to anyone testing while already signed in, which describes almost everyone on the team during normal development. The failure mode only manifests for the specific case (an unauthenticated request) that internal testing naturally never exercises.

**What actually addresses this:**
- **Register all cross-cutting middleware (auth, logging, security headers) at the very top of the file, in one clearly-visible block**, rather than scattered near whatever routes happen to need them — makes ordering mistakes visually obvious in a diff rather than buried in a growing routes section.
- **Write an explicit automated test that asserts a 401 for every protected route when no auth header is present**, not just a happy-path test confirming authenticated access works — the whole point is testing the failure case a developer would never manually trigger by accident.
- **Treat any addition of new protected routes as requiring an explicit, deliberate check that the relevant middleware is registered before them**, as a standing review item, not an assumption based on "the auth middleware already exists somewhere in this file."

---

## Scenario 3 (illustrative/composite): The missing `express.json()` that made every POST silently receive an empty body for weeks

**The pattern:** A new service is stood up with routes for creating and updating resources, all via `POST`/`PUT`. Manual testing during development uses a form that happens to submit as `multipart/form-data`, which works fine without `express.json()`. Weeks later, a different client (a mobile app team) integrates against the same API sending proper JSON bodies — and every single request they send is processed as if the body were empty, silently creating malformed records instead of failing outright, because the route handlers didn't validate that expected fields were actually present.

**Why this is a common, easy-to-misdiagnose failure:** the bug doesn't manifest as an error at all — the request succeeds, returns a `2xx` status, and creates *something*, just with missing or default field values instead of the data the client actually sent. That symptom looks like a data-mapping bug or a client-side serialization issue far more than it looks like a missing middleware registration, sending investigation in the wrong direction initially.

**What actually addresses this:**
- **Register `express.json()` (and `express.urlencoded()` if form submissions are also expected) globally, at the very top of the app, as a default for any new Express project**, rather than adding it reactively only once a specific client's requests start failing.
- **Validate request bodies with a schema (rejecting with a clear `400`, not silently proceeding with missing fields)**, so a body-parsing gap fails loudly and immediately instead of quietly creating malformed data that surfaces as a confusing downstream bug later.
- **Test the API's own routes with a real JSON client (not just the form that happened to be convenient during initial development)** before considering an endpoint done — the client used during a route's own development is not a reliable proxy for every client that will eventually call it in production.
