# Platform Engineering vs SRE vs DevOps — PYQ (Previously Asked / Practice Questions)

**Framing note:** This topic doesn't have a proctored public certification with a leaked-question archive — it's a discipline, not a single tool. What follows is built from this guide's own Overview/Intermediate/Advanced/Troubleshooting material, framed as practice questions grounded in real, documented content from this guide.

---

### 1. (Domain: Core Definitions) A candidate says "DevOps, SRE, and Platform Engineering are basically the same thing with different names." What's the strongest, most precise correction?

**Answer:** They're related but distinct: DevOps is a culture and set of practices anyone can participate in, not a job title; SRE is Google's specific operationalization of that culture using measurable engineering discipline (SLOs, error budgets, structured on-call, blameless postmortems); Platform Engineering is the practice of building the internal platform (the golden path) that makes good DevOps/SRE practices the easy default for application developers. They're different lenses on the same underlying goal — reducing friction between writing code and running it reliably — not synonyms or competing job descriptions.

---

### 2. (Domain: IDP) What specifically does a Backstage-based Internal Developer Platform give a developer that a well-written internal wiki documenting "how to deploy a new service" doesn't?

**Answer:** Automation, not just documentation — a Backstage template doesn't just tell a developer the steps to create a new service, it actually performs them (creating the repo, wiring the CI/CD pipeline, setting up the Kubernetes namespace, registering in the catalog). A wiki reduces the *learning curve* for the manual steps; a golden-path template removes the manual steps entirely. This guide's own example (2 weeks to 2 days onboarding time) reflects the difference between documented manual process and actual automation.

---

### 3. (Domain: Metrics) Why does this guide insist that platform teams should be measured by "the productivity of the teams they serve," rather than their own feature-ship velocity?

**Answer:** Because a platform team can be genuinely busy shipping impressive internal tooling that developers don't actually need or adopt — high internal output with zero corresponding impact on the teams it's meant to serve. Measuring the platform team's own velocity as success criteria rewards exactly this failure mode; measuring developer-facing outcomes (onboarding time, DORA metrics, platform adoption %, developer NPS) forces the roadmap to stay anchored in real value delivered, not just work completed.

---

### 4. (Domain: Backstage Scorecards) How do Scorecards change golden-path adoption from something assessed periodically to something monitored continuously?

**Answer:** A Scorecard defines automated, per-service checks (has an on-call rotation, uses the current standard pipeline template, has an SLO defined) that run continuously against the catalog, rather than requiring a manual survey or audit to determine adoption status. This converts "we think adoption is roughly X%" into a live, queryable, per-service dashboard — identifying specifically which services are lagging and on which specific check, not just an aggregate estimate.

---

### 5. (Domain: Self-Service Provisioning) In a Crossplane-based self-service setup, what's the actual division of responsibility between the developer-facing `PostgresDatabase` resource and the platform-team-owned `Composition`?

**Answer:** The developer-facing resource (`PostgresDatabase`) is a deliberately small, safe, opinionated subset of options — the developer specifies size and environment, nothing more. The `Composition`, owned and versioned by the platform team, encodes all the actual cloud-provider complexity: security defaults, tagging/compliance requirements, and the real underlying resource type (an AWS RDS instance, for instance). This division is what lets a developer safely self-provision infrastructure without needing to understand or correctly configure the full complexity a raw Terraform apply would otherwise require of them directly.

---

### 6. (Domain: Anti-Patterns) What's the specific difference between the "low golden-path adoption" failure pattern and the "platform-as-ivory-tower" anti-pattern — aren't they both just adoption problems?

**Answer:** No — they're structurally different. Low adoption means the golden path exists but teams voluntarily avoid it (usually because it's genuinely harder than the status quo it's meant to replace). Ivory-tower is the opposite surface symptom: adoption numbers look *healthy*, often because usage is mandated, but the platform team is organizationally isolated from the teams it serves — no embedded feedback loop, no shared exposure to the pain its own tooling causes. One is a voluntary-avoidance problem; the other is compliance without genuine buy-in, visible only in softer signals like developer satisfaction rather than adoption percentage.

---

### 7. (Domain: Funding Models) Why is a hybrid funding model (core mandatory + centrally funded, optional capabilities chargeback) the most common pattern at real scale, rather than either extreme?

**Answer:** Fully centralized funding removes friction to adoption but also removes any price signal indicating which capabilities are actually valuable versus merely available — nothing constrains scope creep. Fully chargeback-based funding creates a genuine cost signal but can reintroduce the same provisioning friction a self-service platform was built to eliminate, if the billing/approval process itself becomes a bottleneck. A hybrid model mirrors the platform-of-platforms structure itself — mandatory foundational capabilities centrally funded (removing friction where it matters most), optional/premium capabilities priced (preserving a genuine value signal where usage is genuinely elective).

---

### 8. (Domain: DORA Regression) A new golden-path pipeline launches and deployment frequency drops afterward. Is this evidence the golden path itself is a bad idea?

**Answer:** Not necessarily — it's evidence something specific added to the new pipeline (an overly rigid approval gate, excessive process) is adding time without a proportional Change Failure Rate improvement, and needs to be identified and reviewed. A well-designed golden path should improve or hold DORA metrics steady, not regress them; a regression is a direct, urgent signal to review what got added to the standard pipeline specifically, not a signal to abandon standardization as a concept.

---

### 9. (Domain: Team Topologies) How does the "platform team enables stream-aligned teams" framing from Team Topologies apply to the platform-of-platforms structure at larger scale?

**Answer:** It applies recursively — at larger scale, the core platform team enables domain-specific platform teams (data, ML, mobile), who in turn enable the actual application/stream-aligned teams. Each layer's job is reducing cognitive load for the layer it directly serves, using shared primitives from the layer above rather than reimplementing foundational capabilities independently — the same "enabling" relationship repeated at each level of the platform-of-platforms hierarchy, not a fundamentally different structure at scale.

---

### 10. (Domain: Build vs. Buy) What's the deciding factor this guide names for choosing to buy an IDP portal (rather than self-host Backstage) versus building/maintaining it in-house?

**Answer:** Whether the org's genuine differentiated value lies in the portal software itself or in the golden paths and Compositions built on top of it — for most organizations, the actual competitive/organizational value is in the latter (the org-specific automation and standards), which is the argument for buying or using a managed portal layer and investing engineering time specifically in the parts that are genuinely org-specific, rather than in maintaining generic portal infrastructure that provides no differentiated value regardless of how well-maintained it is.
