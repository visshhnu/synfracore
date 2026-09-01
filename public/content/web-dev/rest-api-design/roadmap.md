# REST API Design — Learning Roadmap

## Estimated Time to Job-Ready

**2-3 weeks** of consistent learning (1-2 hours/day), assuming you've already built at least one basic API (this academy's Express technology is ideal prior context) — this is a principles course, not a tooling course, so the time is spent internalizing design judgment, not learning new syntax.

## Phase 1: Resource Modeling & HTTP Methods (Week 1, Day 1-3)

- Nouns-in-URLs, verbs-in-methods — practice converting a few "wrong" verb-in-URL endpoints (`/getUser`, `/deleteUser?id=1`) into correct resource-based ones
- The five core methods (GET/POST/PUT/PATCH/DELETE) and their exact semantics
- Nesting resources correctly (`/users/42/orders`) and recognizing when nesting has gone too deep
- Request/response body conventions — consistent JSON field naming, ISO 8601 dates

**Checkpoint:** given a list of 5 badly-designed endpoints (verb-in-URL, wrong method for the action), can you redesign all 5 correctly without hesitating on any of them?

## Phase 2: Status Codes & Error Design (Week 1, Day 4-7)

- The 2xx/3xx/4xx/5xx ranges and what each promises a client
- The specific codes that come up constantly: 200 vs 201 vs 204, 400 vs 401 vs 403 vs 404, 409, 422, 429, 500 vs 503
- Designing one consistent error response shape for an entire API
- Practice: audit a real (or sample) API's responses and flag every status-code misuse

**Checkpoint:** can you explain, without looking it up, the difference between 401 and 403, and between 400 and 422 — and give a correct example scenario for each?

## Phase 3: Idempotency, Pagination & Query Design (Week 2)

- Idempotency: which methods are/aren't, and why it's the deciding factor for safe client-side retries
- Idempotency keys for non-idempotent operations that need retry-safety (POST for payments/orders)
- Offset vs. cursor pagination — implement both conceptually and know when each fits
- Filtering/sorting query-parameter conventions, kept consistent across an entire API
- HATEOAS — know what it means and why it's rarely fully implemented, without treating its absence as a flaw

**Checkpoint:** design pagination for two different scenarios — a small admin-only settings list, and a high-volume, constantly-updated activity feed — and justify choosing offset for one and cursor for the other.

## Phase 4: Versioning, Compatibility & Production Design (Week 3)

- URL-path vs. header-based versioning and the real tradeoff between them
- Safe (additive) vs. breaking changes — the discipline of auditing every response-shape change against "would an existing client break?"
- Rate limiting design — 429, `Retry-After`, and communicating limit state to clients
- Authentication/authorization at the design level (401 vs 403, where credentials travel) — pointing forward to this academy's Authentication technology for implementation depth
- Review this course's Interview Prep material and practice explaining PUT vs. PATCH and idempotency out loud, not just recognizing the right answer when reading it

**Checkpoint:** given an existing, live endpoint, can you design one additive (safe) change and one genuinely breaking change to it, and correctly identify which requires a new API version?

## Common Pitfalls Specific to REST API Design

- **Treating "returns JSON over HTTP" as synonymous with "RESTful"** — it isn't; the conventions (nouns/verbs, correct status codes) are what actually make an API RESTful, not the data format alone
- **Using PUT for partial updates** — a genuinely common, concrete bug (silently wiping fields not included in the request)
- **Ignoring idempotency until a retry-caused duplicate happens in production** — design for safe retries from the start on any create/charge operation
- **Returning 200 for everything, with the real error buried in the response body** — this defeats the entire purpose of status codes and forces every client to parse bodies just to detect failure

## Getting Job-Ready with REST API Design Specifically

1. **Portfolio:** don't just build an API — include a short written design rationale (why this URL structure, why this pagination strategy) alongside the code; this is exactly what distinguishes "built an API" from "designed an API" in a portfolio review
2. **Practice auditing, not just building:** take a genuinely poorly-designed sample API (plenty of public examples exist) and write up every design flaw you'd fix and why — this is closer to what a senior review actually looks like than building from scratch
3. **Interview prep:** PUT vs. PATCH, idempotency, and the specific status codes (401/403/409/422/429) come up constantly precisely because they separate real design judgment from tutorial-level familiarity
