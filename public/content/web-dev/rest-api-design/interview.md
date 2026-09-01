# REST API Design — Interview Questions

**Q: What does "RESTful" actually mean, and what's a common misuse of the term?**

A common misuse is treating "RESTful" as synonymous with "returns JSON over HTTP" — that's not sufficient. RESTful means resources are modeled as nouns in URLs, HTTP methods carry the action, status codes accurately reflect the outcome, and (in the fuller original sense) interactions are stateless. An API can return JSON over HTTP and still not be RESTful — for example, one that uses only POST for every operation with the action encoded in the request body (`{"action": "delete_user", "id": 42}`) is using JSON/HTTP but ignoring REST's actual conventions.

**Q: PUT vs. PATCH — what's the difference, and why does mixing them up cause real bugs?**

PUT replaces a resource entirely — any field not included in the request body is treated as absent, not "unchanged." PATCH applies a partial update — only the included fields change. Using PUT where PATCH was intended can silently wipe fields the client never meant to touch, which is a genuine, concrete production bug, not a pedantic distinction.

**Q: What is idempotency, and why does it matter specifically for handling retries?**

An operation is idempotent if calling it once produces the same end state as calling it many times. GET, PUT, and DELETE are idempotent; POST generally isn't. This matters because networks fail — if a client sends a request and the response is lost to a timeout, it can't know whether the server actually processed it. If the operation is idempotent, retrying is always safe. If it isn't (a bare POST creating an order), a naive retry risks creating a duplicate — which is why non-idempotent create operations for critical actions (payments, orders) commonly use an explicit idempotency key so a retried request is recognized and deduplicated rather than double-processed.

**Q: Explain the main HTTP status code ranges.**

2xx means the request succeeded. 3xx means further action is needed, usually an automatic redirect. 4xx means the client's request itself was wrong — bad input, missing auth, requesting something that doesn't exist. 5xx means the server failed to fulfill an otherwise-valid request. This distinction matters practically: client retry logic typically retries 5xx automatically (transient server failure) but never retries 4xx identically (the request needs to actually change first).

**Q: What's the difference between 200, 201, and 204?**

All three are success codes, but they communicate different outcomes. 200 is a generic success with a response body. 201 specifically means a resource was created — typically returned after a POST, often paired with a `Location` header pointing at the new resource's URL. 204 means success with no body to return — commonly used after a DELETE, where there's nothing meaningful left to send back.

**Q: 401 vs. 403 vs. 404 vs. 409 vs. 422 — what does each actually indicate?**

401 Unauthorized means no valid credentials were presented at all — the client isn't authenticated. 403 Forbidden means credentials are valid, but this identity lacks permission for the specific action — different from 401 in that re-authenticating won't fix it. 404 Not Found means the requested resource doesn't exist at this URL. 409 Conflict means the request is well-formed but conflicts with the resource's current state — e.g. creating a user with an email that's already taken. 422 Unprocessable Entity means the request was syntactically valid but semantically invalid — e.g. a malformed email format that fails validation rules. Each implies a different client-side recovery action, which is exactly why the distinction is worth getting right rather than defaulting to 400 for anything that isn't a clean success.

**Q: What does 429 mean, and what header should accompany it?**

429 Too Many Requests indicates the client has been rate-limited. It should be accompanied by a `Retry-After` header telling the client exactly how long to wait before retrying — without it, a client is left guessing and may retry immediately, making an already-throttled situation worse rather than better. Related headers like `X-RateLimit-Remaining` and `X-RateLimit-Reset` are common but not standardized the same way `Retry-After` is.

**Q: 500 vs. 503 — what's the actual difference?**

500 Internal Server Error is a generic catch-all for "the server hit an unexpected error while processing this request" — usually a bug or unhandled exception. 503 Service Unavailable specifically means the server is temporarily unable to handle the request (overloaded, down for maintenance, a dependency is unreachable) and is often paired with `Retry-After` to signal the outage is expected to be temporary. The distinction matters for monitoring and client retry logic: 503 implies "try again shortly," 500 implies something is actually broken and needs a fix.

**Q: REST vs. GraphQL — what's the real tradeoff, not just "GraphQL is newer"?**

REST's fixed resource shapes are simple to cache (by URL, via standard HTTP caching) and straightforward to reason about, but can lead to over-fetching (getting fields the client doesn't need) or under-fetching (needing multiple round-trips to assemble one view). GraphQL lets a client specify exactly the fields it needs in a single request, avoiding both problems, at the cost of much harder HTTP-level caching and a more complex server implementation. REST tends to fit public, general-purpose APIs well; GraphQL tends to fit client-driven applications with complex, varying data needs — a mobile app assembling one screen from many different resource types in one request, for instance.

**Q: What's the tradeoff between URL-path versioning and header-based versioning?**

URL-path versioning (`/v1/users`, `/v2/users`) is simple, visible at a glance, and trivially cacheable by URL — but it "pollutes" every URL and can tempt teams into bumping major versions for changes that could have stayed additive. Header-based versioning (`Accept: application/vnd.api+json;version=2`) keeps URLs stable and is arguably more aligned with pure REST principles, but is less discoverable and harder to test casually with a browser or plain `curl`. URL-path versioning is the more common real-world default specifically because of its visibility to consumers.
