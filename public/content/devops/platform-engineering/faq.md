# Platform Engineering vs SRE vs DevOps — FAQ

## Is Platform Engineering just a rebrand of DevOps or SRE with a new job title?

No, though the confusion is understandable given how often the terms get used loosely. DevOps is a culture and practice set anyone can participate in; SRE is Google's specific operationalization of reliability engineering with concrete tooling (SLOs, error budgets); Platform Engineering is specifically about building the internal platform — the golden path — that makes good DevOps/SRE practices the default, easy path for application developers. They're distinct, composable disciplines, not sequential rebrands of the same underlying job.

## Do I need to use Backstage specifically to "do" Platform Engineering, or is it just one popular tool?

Backstage is the most widely-adopted IDP portal and this guide's primary reference point, but Platform Engineering as a discipline isn't defined by any single tool — the underlying practices (golden paths, self-service provisioning, measuring adoption) can be implemented with other tooling. Backstage's popularity makes it the practical default to learn hands-on, not a strict requirement to be "doing" platform engineering correctly.

## Why does this guide insist platform teams should be measured by developer productivity rather than their own shipped features?

Because output and outcome are genuinely different things for an internal-facing team — a platform team can ship a lot of technically impressive tooling that developers don't actually need or adopt, producing real engineering effort with zero corresponding impact. Anchoring success metrics in developer-facing outcomes (onboarding time, DORA metrics, adoption percentage, developer satisfaction) keeps the roadmap honest about whether the work is actually helping the teams it's meant to serve.

## Is "golden path" the same thing as "the only way to deploy something"?

No — golden path specifically means the opinionated, well-supported route, not the only technically possible one. Teams can generally still deviate from it for a genuine reason, but doing so usually means losing the support and pre-wired capabilities (monitoring, security defaults, CI/CD) the golden path provides by default. It's meant to be the path of least resistance, not a hard mandate enforced by removing all alternatives.

## Why would a platform team choose a chargeback funding model if it risks reintroducing the friction self-service was supposed to remove?

Because a purely centrally-funded model removes any price signal indicating which capabilities are actually worth their operating cost — without some cost visibility, there's no organic pressure limiting scope creep or identifying underused capabilities. Chargeback (or more commonly, a hybrid model) trades some friction for a genuine value signal — the specific design challenge is keeping that friction minimal enough that it doesn't undermine the self-service benefit entirely.

## Is having high golden-path adoption numbers proof that a platform initiative is succeeding?

Not on its own — this guide specifically names the "ivory tower" anti-pattern as a case where adoption can look healthy (often because it's mandated) while the platform team is organizationally isolated and developer satisfaction is actually declining. Adoption percentage and developer satisfaction/NPS need to be tracked as separate, complementary signals — high adoption with declining satisfaction is a real, distinct warning sign, not a contradiction to dismiss.

## Why does a Backstage catalog go stale even after a successful, thorough initial rollout?

Because keeping `catalog-info.yaml` accurate depends on individual teams remembering to update it whenever ownership or documentation changes — and that's reliably nobody's top daily priority compared to actual feature work. A catalog that looked complete and accurate at launch (a deliberate, one-time, all-hands effort) will drift the moment that manual discipline lapses, which it reliably does without a structural enforcement mechanism like a CI check on catalog validity.

## Does a DORA metric regression after a new golden-path pipeline launches mean the platform initiative failed?

Not automatically — it's a strong, urgent signal to review specifically what was added to the new pipeline (an overly rigid approval gate, excessive process steps) rather than evidence that standardization itself was the wrong approach. A well-designed golden path should hold or improve DORA metrics, not regress them; the fix is usually identifying and removing the specific process addition causing the slowdown, not abandoning the standardized pipeline concept entirely.
