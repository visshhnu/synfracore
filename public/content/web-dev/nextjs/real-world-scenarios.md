# Next.js — Real World Scenarios

A note on framing: all three scenarios below are illustrative/composite — common, well-documented patterns from real Next.js usage industry-wide, not one specific traceable company's incident.

---

## Scenario 1 (illustrative/composite): The rendering strategy that quietly cost real server budget for months

**The pattern:** A team, uncertain early on which rendering strategy was "safe," defaults nearly every page in their application to per-request rendering — the reasoning being that always-fresh content can never be technically wrong. As the app and its traffic grow, server costs and average response times both climb, and the team spends real effort investigating infrastructure scaling before someone actually audits which pages need per-request freshness at all. The answer: a small minority. Most of the app's pages — a marketing site, a blog, a documentation section — barely change and had been needlessly rendered fresh on every single visit for months.

**Why this is a genuinely easy trap, not an obvious mistake:** "always fresh" feels like the conservative, safe default, and nothing about the app being technically correct signals that a cheaper strategy was available — there's no error, just quietly worse performance and higher cost than necessary. Without deliberately auditing rendering strategy per page, this can persist indefinitely, since the app works the entire time, just less efficiently than it could.

**What actually prevents this:**
- **Treat rendering-strategy choice as a deliberate, page-by-page decision from the start**, not a single app-wide default applied out of caution — this platform's Advanced tab frames this explicitly as "the real skill" of working with the framework.
- **Periodically audit rendering strategy against actual data-freshness requirements**, especially as an app grows past its original scope, rather than assuming an early decision is still correct.
- **Measure server cost and response time as explicit, tracked metrics**, so a gradually worsening trend is visible before it becomes a dramatic, hard-to-ignore problem.

---

## Scenario 2 (illustrative/composite): The hydration mismatch that only appeared in production, weeks after shipping

**The pattern:** A component renders a value that depends on `Date.now()` directly during render, and it works fine in local development — the mismatch is subtle enough that it doesn't trigger visibly during a quick local check. Weeks after shipping, an intermittent hydration-mismatch warning starts showing up in production error monitoring, correlated with slower page loads (where more real time passes between the server render and the client's hydration, making the timing-dependent mismatch more likely to actually manifest visibly).

**Why this is an easy, non-obvious bug to ship:** the underlying cause (a time-dependent value computed during shared render logic) is a genuine, common pattern that "looks fine" in code review and often "looks fine" in fast local testing too — the bug's visibility depends on the actual gap between server and client render timing, which is small and inconsistent locally but can be meaningfully larger under real production network/load conditions.

**What actually addresses this:**
- **Never compute a value that can legitimately differ between server and client directly during render** — confine `Date.now()`, `Math.random()`, and any browser-only global access to code that only runs after mount (an effect), as covered in this platform's Troubleshooting tab.
- **Don't treat "works fine in a quick local check" as sufficient verification for anything involving server/client render timing** — this class of bug is specifically more likely to surface under real production timing conditions than fast local ones.
- **Take hydration-mismatch warnings in production monitoring seriously even when intermittent**, rather than dismissing them as noise — intermittency is often a symptom of exactly this kind of timing-dependent bug, not evidence it's harmless.

---

## Scenario 3 (illustrative/composite): The team caught off guard migrating an old Pages-Router codebase, having only ever learned the newer paradigm

**The pattern:** A developer who learned Next.js entirely through recent tutorials — all using the newer App Router paradigm — joins a team maintaining a multi-year-old production codebase still built on the original Pages Router. Early contributions repeatedly apply App-Router-era patterns and conventions to a Pages-Router codebase, causing confusing errors that don't match anything in the (newer) documentation they'd been referencing, and real time is lost before the team realizes the mismatch and provides paradigm-specific context.

**Why this is a common, easy-to-hit gap, not a knowledge failure:** most current tutorials, courses, and search results default to teaching whichever paradigm is currently favored — reasonably, since that's what a brand-new project should use — but this means a learner can become genuinely proficient in one paradigm while remaining unaware the other exists at all, until they encounter it directly in a real, older codebase. The confusion isn't a sign of weak fundamentals; it's a predictable consequence of how the framework's real history intersects with how it's typically taught.

**What actually addresses this:**
- **Explicitly learn that both paradigms exist and roughly what changed between them**, even when only actively working in one — this platform's own curriculum deliberately teaches this history directly (see the Overview and Roadmap tabs) rather than teaching one paradigm as if it were the only one that ever existed.
- **When joining an unfamiliar Next.js codebase, identify which router paradigm it uses before writing new code**, rather than assuming current tutorial conventions apply — a quick check of the project structure usually answers this immediately.
- **Treat "which paradigm is this codebase using" as a legitimate, standard onboarding question** on any real Next.js team, not something a new contributor should be expected to intuit unassisted.
