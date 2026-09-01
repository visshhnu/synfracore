# REST API Design

> **Design APIs that behave predictably, before you write a single line of server code**

**Category:** Backend — API Design Principles
**Learning Path:** What → Why → Learning Modules → Production Example → Interview Prep

**Before you start:** having built at least one basic API — this academy's own Express technology covers exactly that — makes this course far more concrete, since you'll have something real to map every principle onto. This is **not** another "how to write server code" course: it's a design/principles course. Every idea here applies regardless of language or framework — Node, Python, Go, Java, whatever eventually implements it. If you haven't built anything yet, Express first, then come back; the principles will click faster with a real API to point them at.

---

## What is REST API Design?

Think of HTTP methods and URLs as a shared vocabulary between systems, the same way traffic signals are a shared vocabulary between drivers. A driver who has never met another driver still knows red means stop and green means go — not because they coordinated in advance, but because both follow the same convention. REST works the same way: a client that has never talked to a particular API before can still guess, correctly, that `GET /users/42` fetches user 42 and `DELETE /users/42` removes it — because both sides agree on what GET and DELETE *mean*, independent of what the API actually does internally.

**REST** (REpresentational State Transfer) is an architectural style, not a protocol or a formally specified standard the way GraphQL or SOAP are. There's no REST governing body and no REST compliance test — it's a set of conventions and constraints, originally described by Roy Fielding in his 2000 doctoral dissertation, built entirely on top of HTTP as it already existed. The core idea: a URL identifies a **resource** — a noun, like `/users/42` or `/orders` — and the HTTP method expresses the **action** — a verb, like GET (read), POST (create), PUT/PATCH (update), DELETE (remove). Keep nouns in the URL and verbs in the method, and an API's shape starts telling you what it does before you've read a line of documentation.

```conceptgrid
{
  "boxes": [
    { "title": "GET /users/42", "description": "Read — fetch a resource. Safe, no side effects, idempotent", "color": "blue" },
    { "title": "POST /users", "description": "Create — add a new resource. Not idempotent (calling it twice creates two)", "color": "green" },
    { "title": "PUT /users/42", "description": "Replace — full update of a resource. Idempotent", "color": "amber" },
    { "title": "PATCH /users/42", "description": "Modify — partial update of a resource. Not guaranteed idempotent", "color": "purple" },
    { "title": "DELETE /users/42", "description": "Remove — delete a resource. Idempotent (deleting twice = still deleted)", "color": "red" }
  ]
}
```

## Why REST API Design?

Without shared conventions, every API is a bespoke puzzle a consumer has to learn from scratch — one API uses `/getUser?id=42`, another uses `/user/fetch/42`, a third returns `200 OK` for a failed request with the real error buried in the JSON body. None of that is technically "wrong" in the sense of breaking HTTP, but every inconsistency is something a client developer now has to read documentation (or, worse, guess) to work around. That's slow, error-prone, and doesn't scale past a handful of integrations.

REST's conventions, followed consistently, make an API's behavior **predictable from its shape alone**. A developer who's used one well-designed REST API can walk into another and correctly guess most of its behavior on sight — same verbs, same status code ranges, same general URL patterns. That predictability is the actual value, not "REST is more efficient" or "REST is required by some spec" — it isn't, and alternatives (GraphQL for flexible client-driven queries, gRPC for high-performance internal service-to-service calls) genuinely fit some problems better. But for public and general-purpose APIs specifically, REST remains the dominant real-world style precisely because so many developers already share its vocabulary.

---

## Learning Modules

### Module 01 — Resources, URLs & HTTP Methods
*Nouns in URLs, verbs in methods — the foundation everything else builds on*

**Topics covered:**

- Resources as nouns, not verbs (`/users` not `/getUsers`) — 🟢 Beginner
- The five core HTTP methods and their semantics — 🟢 Beginner
- Nesting resources (`/users/42/orders`) — 🟡 Intermediate
- Request/response body shape (JSON) and headers — 🟢 Beginner

### Module 02 — Status Codes & Response Design
*What each status code range actually promises the client*

A status code is a contract, not decoration — a client's retry logic, error handling, and caching behavior all key off it. Getting the range right (2xx succeeded, 4xx the client's request was wrong, 5xx the server failed) is the single highest-leverage design decision in the whole API, because it's the one thing every client depends on being correct without reading your documentation first.

```flow
{
  "layout": "flow",
  "steps": [
    { "label": "2xx", "sublabel": "Success — request worked", "color": "green" },
    { "label": "3xx", "sublabel": "Redirection — go elsewhere", "color": "blue" },
    { "label": "4xx", "sublabel": "Client error — your request was wrong", "color": "amber" },
    { "label": "5xx", "sublabel": "Server error — we failed, not you", "color": "red" }
  ]
}
```

**Topics covered:**

- 2xx success codes (200/201/204 and the difference) — 🟢 Beginner
- 4xx client error codes (400/401/403/404/409/422) — 🟡 Intermediate
- 5xx server error codes and when they're appropriate — 🟡 Intermediate
- Consistent error response body design — 🔴 Advanced

### Module 03 — Versioning, Pagination & Idempotency
*Designing an API that can change without breaking the clients already using it*

**Topics covered:**

- Idempotency and why it matters for retries — 🟡 Intermediate
- Pagination strategies (offset vs. cursor) — 🟡 Intermediate
- URL-path vs. header-based versioning — 🔴 Advanced
- Backward-compatible vs. breaking changes — 🔴 Advanced

---

## Production Example

```bash
# Design Audit Runbook — "our API's status codes are inconsistent and clients keep
# building fragile if/else logic around response BODY content instead of status codes"

# Step 1: Inventory every endpoint's actual status code behavior
# Pull real responses, not just the documented ones -- documentation drifts
curl -i -X POST https://api.example.com/v1/orders -d '{"item_id": "bad-id"}'
# Found: returns 200 OK with {"error": "item not found"} in the body.
# This is the core problem -- clients can't distinguish success from failure
# without parsing the body, defeating the entire point of status codes.

# Step 2: Classify every endpoint's failure modes against the correct range
# - Validation failure (bad item_id format)        -> should be 422
# - Referenced resource doesn't exist (item_id)     -> should be 404 (on the sub-resource)
# - Auth token missing/invalid                      -> should be 401
# - Auth token valid but insufficient permissions    -> should be 403
# - Duplicate order submitted twice (idempotency key collision) -> should be 409

# Step 3: Fix the response layer, not each individual handler ad-hoc
# Introduce one shared error-response shape used by every endpoint:
# { "error": { "code": "ITEM_NOT_FOUND", "message": "...", "field": "item_id" } }
# paired with the correct status code -- consistency is the actual fix,
# not picking "the right" status code for one endpoint in isolation

# Step 4: Version the fix rather than silently changing existing behavior
# Clients depending on the old (wrong) 200-always behavior would break silently
# -- ship the fix under /v2/, keep /v1/ running unchanged until deprecation

# Step 5: Verify against real client expectations, not just spec compliance
curl -i -X POST https://api.example.com/v2/orders -d '{"item_id": "bad-id"}'
# HTTP/1.1 422 Unprocessable Entity
# {"error": {"code": "INVALID_ITEM_ID", "message": "item_id must be a valid SKU"}}
```

## Interview Prep

**PSR Formula:** Answer every question: **Problem → Solution → Result**. 45-90 seconds max.

### Common Interview Questions

**Q1. What makes an API "RESTful," concretely — not just "it uses JSON over HTTP"?**

**A:** **Problem:** "JSON over HTTP" is commonly (and incorrectly) used as a synonym for REST, which obscures what's actually being evaluated in a design review. **Solution:** RESTful means resources are addressed as nouns in URLs, HTTP methods express the action, status codes accurately reflect outcome, and (in the fuller sense Fielding described) responses are stateless and cacheable. **Result:** an API can serve JSON over HTTP and still not be RESTful — e.g. an API using only POST for every operation, with actions encoded in the body (`{"action": "delete"}`) — the format is JSON/HTTP, but the design isn't following REST's conventions at all.

---

**Q2. PUT vs. PATCH — what's the actual difference and why does it matter?**

**A:** **Problem:** the two are frequently used interchangeably in practice, which causes real bugs. **Solution:** PUT means "replace this resource entirely with what I'm sending" — any field not included is treated as cleared/defaulted. PATCH means "apply this partial change" — only the included fields change. **Result:** using PUT for what should be a partial update can silently wipe fields the client didn't intend to touch; this is a genuinely common, concrete production bug, not a pedantic distinction.

---

**Q3. Why does idempotency matter for API design, specifically around retries?**

**A:** **Problem:** networks fail — a client can send a request, lose the response to a timeout, and have no way to know if the server actually processed it. **Solution:** if the operation is idempotent (GET, PUT, DELETE — calling it N times has the same effect as calling it once), the client can safely retry. If it isn't (a bare POST creating a new order), a naive retry risks a duplicate. **Result:** this is why POST endpoints for financial/critical operations often require an explicit idempotency key, so a retried request with the same key is recognized and deduplicated server-side rather than creating a second charge.

---

**Q4. Explain the main HTTP status code ranges and the distinction within 2xx (200 vs 201 vs 204).**

**A:** **Problem:** status codes are how a client detects success/failure programmatically, so getting the range wrong breaks that detection. **Solution:** 2xx = success, 3xx = redirect elsewhere, 4xx = the client's request was wrong, 5xx = the server failed. Within 2xx: 200 is a generic success with a body, 201 specifically means "created" (used after POST, typically with a `Location` header pointing at the new resource), 204 means success with no body to return (common after DELETE). **Result:** picking 201 over 200 after a create isn't cosmetic — clients and tooling (some auto-follow `Location`) rely on the distinction.

---

**Q5. 401 vs 403 — what's the actual difference?**

**A:** **Problem:** both are "you can't do that," commonly conflated. **Solution:** 401 Unauthorized actually means *unauthenticated* — no valid credentials were presented at all. 403 Forbidden means the credentials are valid, but the authenticated identity doesn't have permission for this specific action. **Result:** returning 401 when a logged-in user tries to access another user's private data (instead of 403) leaks information about whether authentication itself is the problem — a subtle but real API-design/security detail.

---

**Q6. How would you design pagination for an endpoint returning potentially millions of rows?**

**A:** **Problem:** returning everything at once is both a performance problem for the server and an unbounded-growth problem for the client. **Solution:** offset-based pagination (`?page=3&limit=20`) is simple but degrades on large datasets (the database still has to scan/skip prior rows) and can skip/duplicate items if rows are inserted mid-pagination; cursor-based pagination (`?cursor=abc123`) uses a stable pointer into the dataset, avoiding both problems, at the cost of not supporting "jump to page 50" directly. **Result:** for a large, frequently-mutating dataset, cursor-based pagination is the more robust default; offset is fine for small, stable, or admin-only datasets.

---

**Q7. How should an API handle versioning, and what's the tradeoff between URL-path and header-based versioning?**

**A:** **Problem:** an API will eventually need a breaking change, and existing clients can't be forced to update instantly. **Solution:** URL-path versioning (`/v1/users`, `/v2/users`) is simple, visible, and cacheable by URL, but "pollutes" the URL and can tempt teams into treating every change as a new major version. Header-based versioning (`Accept: application/vnd.api+json;version=2`) keeps URLs stable but is less discoverable and harder to test with a browser or a simple `curl`. **Result:** URL-path versioning is the more common real-world default specifically because of its visibility and simplicity for consumers, even though header-based is arguably more "correct" REST.

---

**Q8. What does 409 Conflict actually indicate, and give a concrete example.**

**A:** **Problem:** teams sometimes reach for 400 for anything that isn't a clean success, losing useful distinctions. **Solution:** 409 specifically means the request is valid, but conflicts with the current state of the resource — e.g. trying to create a user with an email that already exists, or two concurrent updates to the same resource with optimistic-locking version mismatch. **Result:** returning 409 (not 400) for this case lets a client's retry logic distinguish "my request itself was malformed" from "my request was fine, but the world changed underneath it" — genuinely different recovery strategies.

---

**Q9. REST vs. GraphQL — what's the actual tradeoff, not just "GraphQL is newer"?**

**A:** **Problem:** framed as a strict upgrade, this misses real tradeoffs in both directions. **Solution:** REST's fixed resource shapes are simple to cache (by URL) and reason about, but can lead to over-fetching (getting fields you don't need) or under-fetching (needing several requests to assemble one view). GraphQL lets the client specify exactly what fields it needs in one request, avoiding both, but at the cost of harder HTTP-level caching and a more complex server implementation. **Result:** REST tends to fit public, general-purpose APIs well; GraphQL tends to fit client-driven apps with complex, varying data needs (e.g. a mobile app assembling one screen from many resource types) better.

---

**Q10. How would you design a consistent error response shape across an entire API?**

**A:** **Problem:** without a deliberate standard, different endpoints (often written by different people over time) return errors in different shapes, forcing every client integration to write bespoke error-parsing per endpoint. **Solution:** define one error envelope used everywhere — e.g. `{ "error": { "code": "STRING_CODE", "message": "human-readable", "field": "optional, for validation errors" } }` — paired with the correct status code, and enforce it at the framework/middleware level rather than per-handler. **Result:** a client can write one generic error handler for the entire API instead of one per endpoint, and the machine-readable `code` (not just `message`, which might change wording) is what client code should actually branch on.

---

## Official Resources

- [Fielding's Dissertation, Chapter 5 — Representational State Transfer (REST)](https://ics.uci.edu/~fielding/pubs/dissertation/rest_arch_style.htm) — the original source
- [MDN — HTTP](https://developer.mozilla.org/en-US/docs/Web/HTTP) — methods, status codes, headers, authoritative reference
- [Microsoft REST API Guidelines](https://github.com/microsoft/api-guidelines) *(needs verification — recheck against current source; guideline documents like this evolve)*
- [Google API Improvement Proposals (AIPs)](https://google.aip.dev/) *(needs verification — recheck against current source)*

## Try It (2 Minutes)

For each scenario, write out the URL, HTTP method, and expected success status code — no server needed, just design it on paper:

1. A client wants to fetch page 2 of a list of blog posts, 10 per page.
2. A client wants to permanently remove a specific comment (id `991`) from a post (id `42`).
3. A client submits a new signup form; the email is already taken.

(Answers: 1 — `GET /posts?page=2&limit=10`, 200. 2 — `DELETE /posts/42/comments/991`, 204. 3 — `POST /users`, 409 Conflict, not 400 — the request was well-formed, it just conflicts with existing state.)
