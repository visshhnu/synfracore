# Node.js — Real World Scenarios

A note on framing: all three scenarios below are illustrative/composite — common, well-documented patterns from production Node.js usage industry-wide, not one specific traceable company's incident.

---

## Scenario 1 (illustrative/composite): The synchronous report-generation endpoint that froze the entire API under load

**The pattern:** A team adds a `/report` endpoint that builds a large JSON summary object from in-memory data and returns it with `res.json(report)`. It works perfectly in development and in early production, since traffic is low and the report object is small. As the product grows, both the report's size and overall request volume increase gradually — and eventually, under a moderate traffic spike, *every* endpoint on the service (not just `/report`) starts timing out simultaneously. The on-call engineer initially suspects a database or infrastructure problem, since the failing endpoints share no obvious code path with `/report`.

**Why this is a genuinely easy trap, not an obvious mistake:** `res.json()` internally calls `JSON.stringify()` synchronously — a completely ordinary, unremarkable-looking line of code that gives no visible warning it's doing anything expensive. As the report object grew over months, the `JSON.stringify()` call's duration grew with it, entirely gradually, with no single deploy that looks like "the cause." Because Node has exactly one JS thread, that growing synchronous operation increasingly blocked every other concurrent request — but the symptom (unrelated endpoints failing together) doesn't obviously point back to one specific slow endpoint's serialization step unless someone already knows to look for a blocked event loop specifically.

**What actually prevents this:**
- **Treat any synchronous operation whose cost scales with data size as a real, monitored risk** — `JSON.stringify`/`parse` on a growing object, a synchronous crypto operation, a computational loop — not just "it's fine, it's simple code."
- **Monitor event-loop lag directly in production** (`perf_hooks.monitorEventLoopDelay`), so a gradually worsening blocking problem is visible as a trend well before it causes a full outage under a traffic spike.
- **Move genuinely expensive synchronous work off the main thread** (`worker_threads`) or restructure to avoid rebuilding/re-serializing the same large object on every request — cache the serialized result and only rebuild it when the underlying data actually changes.

---

## Scenario 2 (illustrative/composite): The unbounded cache that looked like a slow, mysterious infrastructure problem

**The pattern:** A service adds an in-memory cache (a plain `Map`) to avoid recomputing an expensive lookup on every request — a reasonable, common optimization. It works well for weeks. Then, roughly once every one to two weeks, the process starts throwing out-of-memory errors and needs a manual restart, with no obvious trigger — no unusual traffic spike, no recent deploy at the time of each crash. The team spends real time investigating infrastructure-level causes (container memory limits, a suspected orchestration issue) before someone actually graphs heap usage over the process's full uptime and notices a slow, steady upward climb that resets to zero only on each restart.

**Why this is an easy, non-obvious failure to trace:** the cache was genuinely working correctly — every cached value was accurate, nothing was functionally broken from a user's perspective, and the service behaved perfectly normally for most of its uptime. The failure mode (gradual memory growth over roughly a week or two, not minutes) is far outside the window of any typical local testing or a short QA cycle, so nothing about the cache's behavior looked wrong until it had been running long enough in production for the leak to actually accumulate to a crash point.

**What actually addresses this:**
- **Bound every in-memory cache from the moment it's introduced** — an LRU eviction policy and/or a TTL, decided deliberately at design time, not added reactively after the first production crash.
- **Graph heap usage over real production timeframes (days, not minutes)** as a standing practice for any long-running Node service — a rising floor on an otherwise-normal sawtooth pattern is the specific, recognizable signature to watch for.
- **Treat "the process needs periodic manual restarts" as itself a symptom worth investigating**, not something to route around with a scheduled restart cron job — a recurring restart requirement is very often masking exactly this kind of slow leak rather than being an unrelated, acceptable operational quirk.

---

## Scenario 3 (illustrative/composite): The fire-and-forget background task that silently stopped running after an unrelated Node upgrade

**The pattern:** A service kicks off a non-critical background task (sending an analytics event, for instance) inside a request handler without awaiting it — a deliberate choice, since the request shouldn't wait on it. This works without incident for a long time. After a routine Node version upgrade, the team notices analytics events have quietly stopped arriving for a subset of requests, with no error visibly surfaced anywhere in the application's own logs — the discovery only happens because a downstream analytics dashboard shows a drop, not because the service reported anything.

**Why this is an easy trap tied specifically to Node version behavior:** the underlying bug — an unhandled Promise rejection inside a fire-and-forget async call — existed the entire time, but older Node versions only logged a warning for an unhandled rejection rather than acting on it further. The version upgrade changed this to the newer, stricter default behavior, which can terminate the process on certain unhandled rejections rather than merely warning — meaning the exact same latent bug produced a much more disruptive symptom purely as a side effect of an unrelated upgrade, not because the application code itself changed.

**What actually addresses this:**
- **Treat every fire-and-forget `async` call as requiring an explicit `.catch()`**, as a hard rule, rather than "it's non-critical, no need to handle errors carefully" — a fire-and-forget call still needs its errors caught somewhere, even if the caller genuinely doesn't need to wait on the result.
- **Register `process.on("unhandledRejection", ...)` as a logged safety net in every Node service**, so this class of bug is at minimum visible in logs immediately, rather than discovered indirectly through a downstream symptom.
- **Review Node's release notes for behavioral changes (not just new features) before any version upgrade**, specifically around process lifecycle and error handling — a Node upgrade can change what an existing, unnoticed bug actually *does* without the application's own code changing at all.
