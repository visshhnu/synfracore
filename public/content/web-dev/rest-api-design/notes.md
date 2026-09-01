# REST API Design — Revision Notes

Consolidated from Overview, Intermediate, Advanced, and Troubleshooting — condensed for quick review, not a substitute for reading those tabs in full the first time through.

## Resources & Methods

REST is an architectural style built on HTTP conventions, not a formal spec — a URL identifies a resource (noun), the HTTP method expresses the action (verb). `/getUsers` is the classic beginner mistake; `GET /users` is correct. GET/PUT/DELETE are idempotent; POST generally isn't; PATCH isn't guaranteed to be.

## Status Codes

2xx success, 3xx redirect, 4xx client error, 5xx server error — this range distinction is what client retry logic keys off (auto-retry 5xx, never auto-retry 4xx identically). Within the ranges that come up constantly: 201 (created) vs. 200 (generic success) vs. 204 (success, no body); 401 (not authenticated) vs. 403 (authenticated, not permitted); 409 (conflicts with current state) vs. 422 (semantically invalid input); 429 (rate limited, pair with `Retry-After`).

## PUT vs. PATCH

PUT replaces the whole resource — omitted fields are cleared. PATCH applies a partial change — omitted fields stay as they were. Using PUT for a partial update silently wipes untouched fields; this is the most common real bug from confusing the two.

## Idempotency

Idempotent = calling once has the same effect as calling many times. Matters because networks fail — a client that loses a response to a timeout needs to know if retrying is safe. Idempotent methods (GET/PUT/DELETE) can always be retried safely; non-idempotent POST creates need an explicit `Idempotency-Key` to make retries safe (prevents duplicate orders/charges).

## Pagination

Offset (`?page=3&limit=20`) is simple but degrades on large/mutating datasets (slow at high offsets, can skip/duplicate rows on concurrent writes). Cursor (`?cursor=...`) avoids both at the cost of not supporting "jump to page N." Prefer cursor for large or actively-changing datasets.

## Versioning & Compatibility

URL-path versioning (`/v1/`, `/v2/`) is the common real-world default — visible, cacheable, easy to test. Header-based versioning keeps URLs stable but is less discoverable. Safe changes: adding an optional field/endpoint. Breaking changes: removing/renaming/retyping a field, or changing an existing status code's meaning for an existing scenario. Always audit "would an existing client break?" before shipping without a version bump.

## Error Design

One consistent error envelope across the whole API (`{ "error": { "code", "message", "field" } }`), enforced at the middleware level, paired with the correct status code. Client code should branch on `code`, never on `message` text.

## HATEOAS

The "purist" REST ideal — responses include links describing available next actions. Rarely fully implemented in real-world APIs; know the term, don't treat its absence as a flaw.

## Versioning Note

Unusually for this academy, REST's core conventions are **more durable than most** technologies covered here — they're grounded in HTTP semantics (status codes, methods), which have changed very slowly over more than two decades and are safe to treat as durable fact throughout this course. That said, some specifics are genuinely worth re-checking over time and are tagged accordingly where they appear: specific companies' published API design guidelines (Microsoft's, Google's), exact OpenAPI spec version details, and emerging alternative patterns (newer takes on versioning or hypermedia) `(needs verification — recheck against current source)`. The HTTP method/status-code foundation itself is not in that category.
