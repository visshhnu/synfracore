# REST API Design Troubleshooting Guide

This is a design-principles technology, so "troubleshooting" here means design-review issues you catch while auditing an API — not runtime errors from a specific server.

## Issue 1: An endpoint returns 200 for a failed operation

**Symptom:** A client can't reliably detect failure from the status code alone — every response is `200 OK`, with the real outcome (success or error) only distinguishable by parsing the response body.

**Root Cause:** The developer defaulted to 200 for every response rather than deliberately choosing a status code per outcome — often because handling multiple status codes felt like extra work compared to always returning 200 and putting `{"success": false, "error": "..."}` in the body.

**Debug steps (what to check/ask when auditing):**
- Send a request designed to fail (invalid input, missing auth, a resource that doesn't exist) and check the actual status code returned, not just the body content.
- Ask: does any client-side code currently branch on `response.body.success` instead of `response.status`? That's a strong signal this pattern already exists and client code has adapted around it.
- Check whether this is consistent across every endpoint, or only some — inconsistency compounds the problem.

**Fix patterns:**
- Map every failure mode to its correct status code range (4xx for client-caused, 5xx for server-caused) and return it genuinely, not just in the body.
- Introduce a shared error-response middleware/helper so every endpoint uses the same status-code-plus-error-shape pattern, rather than fixing handlers one at a time.
- Version the fix (ship under a new API version) rather than silently changing existing endpoints' behavior — clients depending on the old always-200 behavior will break if the fix changes status codes underneath them without warning.

---

## Issue 2: Inconsistent pluralization/casing across endpoints

**Symptom:** Some endpoints use `/user` (singular), others `/users` (plural); some fields are `snake_case`, others `camelCase`, within the same API.

**Root Cause:** Different endpoints were written by different people, or at different times, without an enforced naming convention documented and reviewed against.

**Debug steps:**
- List every endpoint's URL pattern and every response body's field-naming style side by side — inconsistency is usually obvious once laid out together, even though it's easy to miss endpoint-by-endpoint.
- Check whether any shared style guide or linter enforces naming conventions at all, or whether it's purely convention-by-memory.

**Fix patterns:**
- Standardize on plural nouns for collection endpoints (`/users`, not `/user`) and one casing convention for all fields — document it explicitly, not just informally.
- Fix incrementally under a new version rather than renaming existing live endpoints out from under current clients.
- Add a lint/review checklist item for new endpoints specifically checking naming consistency against the existing API, not just internal consistency of the new endpoint alone.

---

## Issue 3: A non-idempotent DELETE causes double-charging on retry

**Symptom:** A client's automatic retry logic (after a timeout) causes a "cancel and refund" or "delete and de-provision" operation to run twice, sometimes causing a duplicate refund or a second, unintended side-effect.

**Root Cause:** DELETE is supposed to be idempotent, but the actual implementation has a side effect that isn't idempotent — e.g. "delete this subscription" also triggers a refund action, and the refund fires again on a retried DELETE against an already-deleted resource, rather than the endpoint recognizing "already deleted" and no-op'ing the side effect.

**Debug steps:**
- Call the DELETE endpoint twice in a row against the same resource and check: does the second call produce the same observable result as if it never ran (idempotent), or does it re-trigger the side effect?
- Trace exactly what the DELETE handler does beyond removing the row/record — any external side effect (refund, webhook, notification) is where non-idempotency usually hides.

**Fix patterns:**
- Make the side effect itself idempotent — check "has this refund already been issued for this resource" before issuing it again, not just "does this resource still exist."
- Return 204 (or 200) on a DELETE against an already-deleted resource rather than 404 — this is itself part of correct idempotent design, and treating "already gone" as an error can mask retry-safety bugs.
- For side effects that genuinely can't be made idempotent easily, apply the same idempotency-key pattern used for non-idempotent POSTs.

---

## Issue 4: Missing pagination silently returns an unbounded response

**Symptom:** An endpoint that returns "all X" works fine in development and early production, then gradually gets slower and eventually times out or crashes the client as the underlying dataset grows — with no code change having caused it.

**Root Cause:** The endpoint was designed to return every matching row with no pagination at all, because the dataset was small when it was built — the design never accounted for growth.

**Debug steps:**
- For every "list" endpoint, ask: what happens when this dataset has 100,000 rows instead of 100? Is there anything in the design that bounds response size?
- Check response time trends over time for list endpoints specifically — a slow, gradual degradation with no corresponding code change is a strong signal of exactly this issue.

**Fix patterns:**
- Add pagination with a sane default and maximum `limit` (never allow an unbounded `limit` value from the client either).
- For a dataset already in this state, ship pagination as an additive, backward-compatible change where possible (a new optional `?page=`/`?cursor=` parameter with the old unbounded behavior preserved only under an explicit legacy flag, deprecated on a timeline) rather than breaking existing clients outright.

---

## Issue 5: A breaking change shipped without versioning

**Symptom:** An existing, live API endpoint's response shape changes (a field renamed or removed), and every client depending on the old shape breaks simultaneously, with no warning.

**Root Cause:** The team treated the change as "just a fix" or "an improvement" without auditing it against existing clients' actual usage first — no version bump, no deprecation window, no advance notice.

**Debug steps:**
- Before any response-shape change ships, ask explicitly: would an existing client, written against the current shape, break from this change? If yes, it's breaking, full stop — regardless of how small it feels.
- Check whether the change was reviewed against the safe-vs-breaking distinction (adding fields = safe, removing/renaming/retyping = breaking) before merging.

**Fix patterns:**
- Ship the breaking change under a new API version, keeping the old version running unchanged until a documented deprecation date.
- If a breaking change absolutely must ship without a version bump (rare, and worth resisting), communicate it to every known consumer well in advance with a concrete migration guide — never silently.

---

## Prevention Tips

- Treat every response status code as a contract clients rely on programmatically — never default to 200 to avoid "dealing with" error codes.
- Enforce naming/casing conventions with an explicit style guide reviewed on every new endpoint, not left to individual developer memory.
- Audit every write endpoint for idempotency explicitly, especially anything with a side effect beyond the primary database write.
- Never ship an unbounded "list all" endpoint — pagination should be part of the initial design, not retrofitted after it becomes a production incident.
- Before any response-shape change, explicitly classify it as safe or breaking, and version accordingly — don't rely on the change "feeling small" as a substitute for that classification.
