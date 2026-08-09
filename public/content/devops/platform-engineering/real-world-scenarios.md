# Platform Engineering vs SRE vs DevOps — Real World Scenarios

A note on framing: all three scenarios below are illustrative/composite — common, well-documented patterns from real platform engineering initiatives industry-wide, not one specific traceable company's incident.

---

## Scenario 1 (illustrative/composite): The golden path that was technically mandatory and practically ignored

**The pattern:** A platform team ships a polished golden-path template — a new Backstage-scaffolded service comes with CI/CD, monitoring, and RBAC all pre-wired. Leadership mandates its use for all new services. A year later, adoption metrics look healthy on paper (most new services technically originate from the template), but a closer audit reveals a large fraction of teams scaffold a new service from the template once, then immediately strip out or bypass most of its pre-wired components — keeping only the parts that were faster than doing it manually, discarding the rest.

**Why this is a genuinely easy trap, not an obvious failure:** the adoption metric the platform team was tracking (percentage of new services created via the template) looked like unambiguous success, since it was technically true. The metric simply didn't capture *how much of the template's actual value* teams were retaining after initial scaffolding — a service technically "created via the golden path" that immediately strips out the monitoring and RBAC wiring has captured almost none of the golden path's real intended benefit, while still counting fully in the adoption number.

**What actually prevents this:**
- **Track retained golden-path components over time, not just initial scaffolding origin** — this guide's own Scorecard pattern (checking `uses-golden-path-pipeline`, `has-slo-defined` on an ongoing, per-service basis) is specifically designed to catch exactly this kind of adoption-then-abandonment pattern that a one-time "created from template" metric misses entirely.
- **Talk directly to teams stripping out template components**, treating this the same way this guide's own Troubleshooting material recommends for low-adoption scenarios — the reason is almost always concrete (a genuine capability gap, unnecessary friction) rather than resistance for its own sake.
- **Distinguish "technically compliant" from "actually valuable" as explicitly separate success criteria** when reporting platform initiative results — a mandate that produces the former without the latter isn't the success it appears to be on a surface-level adoption dashboard.

---

## Scenario 2 (illustrative/composite): The platform team that became the ivory tower without anyone deciding it should

**The pattern:** A platform team starts embedded closely with application teams, genuinely responsive to feedback. As the org grows and the platform team's own workload increases, they gradually move to a more centralized, ticket-driven interaction model out of necessity — simply to manage their own increasing volume of requests. Over roughly a year, without any single deliberate decision to become less collaborative, the platform team ends up organizationally isolated: high mandated adoption of their tooling, but genuinely no ongoing feedback loop, and increasingly perceived by application teams as an obstacle to route around rather than a partner.

**Why this drift is easy to miss while it's happening:** each individual step (moving to a ticket queue to manage growing request volume, reducing ad hoc sync meetings to protect focus time) was a locally reasonable response to real growing pains — nothing about any single decision looked like "becoming an ivory tower." The ivory-tower state emerged as a cumulative side effect of many individually sensible scaling decisions, not from any one clearly identifiable mistake.

**What actually addresses this:**
- **Deliberately preserve embedded feedback mechanisms even as the platform team scales**, per this guide's own recommended fix — rotating platform engineers through stints on application teams, or ensuring the platform team shares genuine on-call exposure to the consequences of its own tooling decisions.
- **Monitor developer satisfaction (NPS or equivalent) as a leading indicator, separate from adoption percentage** — this guide's own framing is specifically that ivory-tower drift shows up in softer satisfaction signals well before it would show up in adoption numbers, which can remain high (or even increase, if usage is mandated) throughout the entire drift.
- **Treat organizational structure decisions (ticket queues replacing direct collaboration, reduced sync cadence) as requiring explicit tradeoff review**, not just as natural, unexamined responses to growing request volume — the same rigor this guide recommends applying to any platform-team decision with downstream developer-experience consequences.

---

## Scenario 3 (illustrative/composite): The Backstage catalog that quietly became fiction

**The pattern:** An organization rolls out Backstage with genuine initial enthusiasm — every existing service gets a `catalog-info.yaml`, ownership is accurately recorded, documentation links work. A year later, during an incident, an engineer consults the catalog to find the on-call owner for an affected service, pages the listed team, and discovers that team was reorganized eight months prior and no longer owns that service — the catalog entry was never updated, and nobody had noticed until this specific, time-critical moment revealed the staleness.

**Why catalog drift is a common, near-inevitable failure without structural enforcement:** keeping `catalog-info.yaml` current after the initial rollout depends entirely on individual teams remembering to update it whenever ownership, documentation, or dependencies change — and updating catalog metadata is reliably nobody's top priority day to day, compared to the actual work of shipping features. The catalog looked accurate and complete at launch precisely because rollout was a deliberate, one-time, all-hands effort; nothing about ongoing operations replicates that same deliberate attention.

**What actually addresses this:**
- **Enforce catalog freshness structurally, not through manual diligence** — a CI check failing a build if `catalog-info.yaml` references a nonexistent owner or broken documentation path, exactly as this guide's own Troubleshooting material recommends, converts "hopefully someone remembers to update this" into an automatically-enforced invariant.
- **Fold catalog registration into the golden-path service-creation template itself**, so it's generated correctly from the start as part of the automated scaffolding process, rather than added manually after the fact by a team that may or may not remember to do so.
- **Treat a catalog-staleness incident (like the one in this scenario) as a structural finding requiring a systemic fix**, not an isolated data-entry mistake to correct and move past — the specific instance discovered during an incident is very likely one of many similarly stale entries elsewhere in the catalog, not an outlier.
