# REST API Design — Real World Scenarios

A note on framing: all three scenarios below are illustrative/composite — common, well-documented patterns from real-world API design industry-wide, not one specific traceable company's incident.

---

## Scenario 1 (illustrative/composite): The retry that double-charged a customer

**The pattern:** A checkout flow calls `POST /payments` to process a card charge. On a slow network, the client's request succeeds server-side, but the response is lost to a timeout before the client receives it. The client's retry logic — reasonably, from its own point of view — assumes the request failed and resubmits the exact same `POST /payments` call. The server has no way to recognize this as "the same logical payment attempt," so it processes a second, genuinely duplicate charge. The customer is billed twice for one order, and the team only discovers the pattern after a spike in support tickets, not from any error or alert.

**Why this is a trap:** POST is not idempotent by design, and a naive retry-on-timeout strategy — a completely standard, reasonable-looking client pattern — is exactly what exposes that gap. Nothing about the request or the server looks broken in isolation; the bug only exists in the interaction between "client retries on timeout" and "server treats every POST as a brand-new operation."

**What actually prevents this:** Require an `Idempotency-Key` on every non-idempotent create operation involving money or other high-stakes side effects, generated once per logical attempt by the client and reused across retries of that same attempt. The server stores the outcome keyed by that value and returns the original result on a repeated key instead of reprocessing. This has to be a deliberate design decision for every such endpoint at build time — retrofitting it after a double-charge incident is far more painful, since it usually requires reconciling already-duplicated data as well as fixing the endpoint.

---

## Scenario 2 (illustrative/composite): The unversioned field rename that broke every existing integration overnight

**The pattern:** A team notices a poorly-named field (`fname`) in a widely-used API response and, wanting to clean it up, renames it to `first_name` in what feels like a small, obviously-beneficial fix — shipped directly to the existing live endpoint, no version bump, no advance notice. Within hours, every client reading the old `fname` field starts failing — some with visible errors, others more insidiously, silently treating a missing field as `undefined`/`null` and propagating bad data downstream without any error at all. The team spends the following day fielding integration-partner escalations rather than reviewing the fix that actually caused them.

**Why this is a trap:** The change looked purely cosmetic to the team making it — a better field name is objectively an improvement in isolation. But "better" and "backward-compatible" are unrelated properties, and the team evaluated the change only against the first, not the second. A field rename is unambiguously a breaking change regardless of how small or clearly-improved it looks.

**What actually prevents this:** Every response-shape change gets explicitly classified as safe (additive) or breaking (removal/rename/retype) before merging — not as a judgment call made casually in review, but as a required step. Breaking changes ship under a new version, with the old version continuing to run unchanged until a communicated deprecation date, giving every known consumer time to migrate deliberately instead of discovering the break in production.

---

## Scenario 3 (illustrative/composite): The API that always returned 200, making failure invisible to automation

**The pattern:** An internal API is built quickly under deadline pressure, and every endpoint is wired to return `200 OK` regardless of outcome — success or failure — with the actual result communicated only via a `{"success": true/false, "message": "..."}` field in the body. This works fine as long as every calling client is written by someone who reads the API's specific documentation carefully. Months later, a new team builds automated monitoring that treats any non-2xx response as a failure signal — standard, reasonable tooling behavior. Because every response is `200`, the monitoring reports 100% uptime and success throughout an extended period where the API was actually failing on a meaningful fraction of requests, and the failures go undetected until a downstream data-quality issue is traced back to them independently.

**Why this is a trap:** The always-200 pattern doesn't look broken to any individual developer manually testing the API and reading response bodies carefully — it only breaks silently at the automation layer, specifically because generic tooling (monitoring, retry logic, alerting) is built to trust status codes as the primary success/failure signal, exactly as HTTP conventions promise it can. The gap between "works for a human reading the docs" and "works for automation that doesn't read a specific API's custom body-shape convention" is where this failure mode hides.

**What actually prevents this:** Return genuine status codes reflecting actual outcome for every endpoint, from the start — this isn't optional polish, it's the mechanism generic tooling across an entire organization depends on working correctly. Where a body-level `success`/`error` field exists for additional detail, it should be a supplement to a correct status code, never a substitute for one.
