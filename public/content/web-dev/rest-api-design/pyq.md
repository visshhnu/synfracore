# REST API Design — PYQ (Previously Asked / Practice Questions)

**Framing note:** There's no public past-paper archive for a design-principles topic like this — unlike a proctored certification with a known question bank, REST API design is typically assessed through live design discussions and portfolio review, not a fixed exam. What follows is built from this course's own Overview/Intermediate/Advanced/Troubleshooting material, framed as design-judgment practice questions favoring real reasoning over rote recall.

---

### 1. (Domain: Resource Modeling) A junior developer proposes `POST /users/42/activate` to activate a user account. Is this good REST design? What's the alternative?

**Answer:** It's a defensible pragmatic choice, but it's action-oriented (a verb in the URL) rather than resource-oriented, which is the more common critique. A more resource-modeled alternative treats "activation status" as a field of the user resource and uses `PATCH /users/42` with `{"status": "active"}`, or models activation as its own sub-resource (`PUT /users/42/activation`). In practice, `/activate`-style action endpoints are common and acceptable for genuinely action-like operations (sending an email, triggering a process) that don't map cleanly onto a CRUD verb — the key judgment is recognizing when an operation is truly action-like versus when it's actually just a state update on an existing resource.

### 2. (Domain: Status Codes) An API returns `400 Bad Request` when a client tries to create a user with an email that's already registered. Is this the right status code?

**Answer:** No — 400 implies the request itself was malformed (bad syntax, missing required fields). An email that's already registered is a request that's perfectly well-formed but conflicts with existing server state, which is exactly what 409 Conflict is for. Using 400 here loses a distinction a client's error-handling logic could otherwise use — 409 tells the client "your request was fine, but try a different email," while 400 suggests something structurally wrong with the request itself.

### 3. (Domain: Idempotency) Why is a bare `POST /payments` considered risky for retry-safety, and how would you fix the design?

**Answer:** POST isn't idempotent — if a client sends the request, the network times out before the response arrives, and the client retries, there's no way for the server to know the retry is "the same request" rather than a new one, risking a duplicate payment. The fix is an idempotency key: the client generates a unique key per logical payment attempt and sends it in an `Idempotency-Key` header; the server stores the result keyed by that value and returns the original result on any retry with the same key, rather than processing it again.

### 4. (Domain: Versioning) A team wants to rename a field in an API response from `full_name` to `name`. Does this require a new API version? Why or why not?

**Answer:** Yes — renaming (or removing) a field is a breaking change, because any existing client reading `full_name` will find it missing and break, with no fallback. This is true even though the change feels small. The correct approach is to add `name` as a new field alongside `full_name` (safe, additive) if backward compatibility must be preserved under the current version, or ship the rename under a new version with a documented deprecation timeline for the old field.

### 5. (Domain: Pagination) A social-media-style activity feed endpoint currently uses `?page=N&limit=20` and users report seeing duplicate or skipped posts when scrolling. What's the likely design flaw?

**Answer:** Offset-based pagination on a dataset that's actively being written to — new posts inserted while a user is paginating shift every subsequent page's offset, causing already-seen posts to reappear or unseen posts to be skipped entirely. Cursor-based pagination (keyed off a stable pointer like the last-seen post's ID/timestamp, not a numeric offset) avoids this because it doesn't depend on the dataset's absolute position remaining stable between requests.

### 6. (Domain: Authentication/Authorization) A client sends a valid, currently-active auth token but tries to access another user's private data. What status code should the API return, and why not the other plausible option?

**Answer:** 403 Forbidden — the credentials are valid (the client *is* authenticated), but this specific identity isn't permitted to access this specific resource. 401 Unauthorized would be wrong here because it specifically implies missing/invalid credentials, which isn't the case; returning 401 for a permissions failure would incorrectly suggest re-authenticating would fix the problem, when it wouldn't.

### 7. (Domain: Rate Limiting) Design the response an API should return when a client exceeds its rate limit, including the one header that's most important to include and why.

**Answer:** `429 Too Many Requests`, with a `Retry-After` header specifying how many seconds to wait before retrying. This is the most important header because it directly tells a well-behaved client's retry logic when to try again — without it, a client retries on its own arbitrary schedule, potentially immediately, making an already-overloaded situation worse instead of helping it recover.

### 8. (Domain: Error Design) Two endpoints in the same API return errors in different shapes — one as `{"error": "message"}`, another as `{"errors": [{"msg": "...", "field": "..."}]}`. What's the actual cost of this inconsistency, beyond it "looking messy"?

**Answer:** A client integrating with the API can't write one generic error handler — it has to special-case the error-parsing logic per endpoint, which is real, ongoing integration cost, not just a cosmetic issue. The fix is defining one error envelope shape used by every endpoint (enforced at a shared middleware layer, not left to individual handlers), so client-side error handling is written once and works everywhere in the API.

### 9. (Domain: HATEOAS) Explain what HATEOAS means and give an honest assessment of how often it's actually used in real production APIs.

**Answer:** HATEOAS (Hypermedia As The Engine Of Application State) means a response should include links describing available next actions, so a client discovers what it can do dynamically rather than hardcoding URL patterns from documentation in advance — part of Fielding's original REST description. Honestly, it's widely considered the "purist" ideal and is rarely fully implemented in real-world production APIs — most clients are built against fixed, documented URL patterns rather than following links dynamically. Knowing the term and recognizing a `links`/`_links` field is useful; its absence in an otherwise well-designed API isn't itself a red flag.

### 10. (Domain: REST vs. Alternatives) A team is designing a new internal API purely for service-to-service communication where performance is critical. Would you default to REST, and what would make you reconsider?

**Answer:** Not necessarily — REST's JSON-over-HTTP-1.1 default carries real per-request overhead (text serialization, connection setup) that matters more for high-throughput internal service-to-service calls than for a general-purpose public API. gRPC (binary protocol, HTTP/2, strongly-typed contracts) is frequently a better fit specifically for internal, performance-sensitive service-to-service communication. The judgment isn't "REST vs. gRPC as a universal ranking" — it's recognizing that REST's actual strengths (human-readability, wide client compatibility, easy debugging with `curl`) matter less in an internal, performance-critical context than they do for a public-facing API.
