# Docker — Real World Scenarios

A note on framing: all three scenarios below are illustrative/composite — common, well-documented patterns from production Docker usage industry-wide, not one specific traceable company's incident.

---

## Scenario 1 (illustrative/composite): The Dockerfile reorder that quietly broke build caching for months

**The pattern:** A team's CI pipeline builds a Docker image on every commit, and build times gradually creep upward over several months without anyone investigating why — it's assumed to be normal growth as the codebase and dependency list expand. An unrelated Dockerfile cleanup, done for readability rather than performance, moves the dependency-installation instruction to after the application code copy. Build times immediately jump further, finally prompting investigation — which reveals the cache-invalidation problem had actually been present in a milder form since the original Dockerfile was first written, with the readability cleanup simply making an existing problem worse.

**Why this is a genuinely easy trap, not an obvious mistake:** a Dockerfile that builds successfully every time gives no signal about whether it's using cache efficiently — there's no error or warning when cache is invalidated unnecessarily, just a slower build. Gradually worsening CI build times are easy to attribute to legitimate causes (more dependencies, more code) rather than a specific, fixable instruction-ordering issue, especially when nobody is actively comparing build times against what efficient caching should achieve.

**What actually prevents this:**
- **Order Dockerfile instructions from least to most frequently changing as a hard rule reviewed in every Dockerfile change**, not just a best practice mentioned once during onboarding — dependency installation before application code copy, consistently.
- **Track build time as an explicit CI metric over time**, so a regression (even a gradual one) is visible as a trend rather than only noticed when it becomes dramatically worse.
- **Treat any Dockerfile "cleanup" or refactor as requiring an explicit check of cache-efficiency impact**, since a change made for one reason (readability) can have an unintended, unrelated consequence (cache invalidation) that isn't obvious from the diff alone.

---

## Scenario 2 (illustrative/composite): The non-root user that broke volume writes in a way that looked like an application bug

**The pattern:** A team adopts non-root containers across their fleet as a security hardening initiative — a genuinely good practice. Shortly after, a specific service starts failing intermittently with permission-denied errors when writing to its host-mounted data directory. The team spends real time investigating the application code itself, assuming a logic bug, before discovering the actual cause: the container's non-root user's UID doesn't match the host directory's file ownership, which had been implicitly working before only because the container ran as root (UID 0, which bypasses standard file permission checks).

**Why this is an easy, non-obvious side effect of a good security change:** the non-root hardening change was correct and deliberate, but its interaction with a specific host-mounted volume's ownership wasn't something the security review anticipated — root's implicit bypass of file permissions had been silently masking a latent UID mismatch the entire time. The failure only surfaced once the masking (running as root) was removed, making it look like a new bug introduced by the security change rather than a pre-existing ownership mismatch finally becoming visible.

**What actually addresses this:**
- **Explicitly align container UID with host-mounted volume ownership as part of any non-root migration**, rather than assuming the change is purely additive security with no other interaction — this is specifically where non-root hardening and host-mounted volumes need coordinated attention.
- **Test non-root migrations against every real volume-mount scenario the service actually uses**, not just confirm the container starts successfully — a container that starts fine can still fail specifically on the write path that only exercises under real production conditions.
- **Document the UID a container runs as, and require host-side directory ownership to be set up in coordination with it**, treating this as a genuine cross-cutting concern between the Dockerfile and the deployment/infrastructure configuration, not something owned entirely by one side.

---

## Scenario 3 (illustrative/composite): The disk-space incident traced to accumulated build cache, not application data

**The pattern:** A CI runner host repeatedly runs out of disk space during peak build hours, causing build failures that look, at first glance, unrelated to any specific recent change. The team initially suspects a memory or log-volume leak in one of the applications being built. Investigation eventually reveals the actual cause: months of accumulated Docker build cache and dangling images from CI builds, never cleaned up, had gradually consumed the majority of available disk space — a slow, silent accumulation entirely disconnected from any single build or application.

**Why this is a common, easy-to-misdiagnose failure:** the symptom (disk space full, builds failing) doesn't point directly at its cause the way an application error message often would — "disk full" could plausibly be caused by many things, and Docker's build cache and dangling images accumulate invisibly in the background with no natural point where someone would notice unless specifically checking `docker system df`. The eventual failure looks sudden even though the underlying accumulation was gradual and entirely predictable in hindsight.

**What actually addresses this:**
- **Schedule regular, automated `docker system prune` (with appropriate scope for images/volumes/build cache) on CI runner hosts**, rather than relying on manual intervention only after a failure occurs — this converts a recurring incident into a routine, invisible maintenance task.
- **Monitor disk usage on CI runner hosts as an explicit, proactive metric**, alerting well before capacity is actually exhausted, rather than discovering the problem only when builds start failing.
- **Treat "disk full" failures as having Docker's own cache/image accumulation as a first-checked, not last-resorted-to, hypothesis** on any Docker-based CI infrastructure — this is common enough that it's worth being the default first check, not something arrived at only after exhausting other theories.
