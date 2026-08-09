# Platform Engineering vs SRE vs DevOps — Portfolio Projects

Unlike a single-tool guide, these projects are about building real golden-path artifacts and being able to defend organizational-design decisions — the actual work of platform engineering, not just tool usage.

---

## Project 1: A Real Golden-Path Service Template

**Level:** Beginner | **Time:** 1-2 days | **GitHub:** `platform-golden-path-template`

**What you build:** A Backstage software template that scaffolds a new service end-to-end — repo, CI pipeline config, and catalog registration — matching Overview's own "developer fills a form" example.

### Template structure
```yaml
# template.yaml
apiVersion: scaffolder.backstage.io/v1beta3
kind: Template
metadata: { name: new-microservice, title: "New Microservice" }
spec:
  parameters:
    - properties:
        serviceName: { type: string, title: "Service Name" }
        owner: { type: string, title: "Owning Team" }
  steps:
    - id: fetch-base
      action: fetch:template
      input: { url: ./skeleton, values: { serviceName: "${{ parameters.serviceName }}" } }
    - id: publish
      action: publish:github
      input: { repoUrl: "github.com?repo=${{ parameters.serviceName }}" }
    - id: register
      action: catalog:register
      input: { catalogInfoPath: /catalog-info.yaml }
```

### Interview points
- Being able to walk through exactly what the template automates — repo creation, CI config, catalog registration — versus what a developer would otherwise do manually, is the concrete version of this guide's own "2 weeks to 2 days" onboarding-time example
- Explaining the golden path's value specifically in terms of *removing choice*, not adding features — a developer filling out a form with 3 fields versus making a dozen independent infrastructure decisions correctly
- The template itself becomes the thing a platform team maintains and improves over time — being able to describe what "iterating on the golden path" looks like concretely (adding a new skeleton option, updating the CI template it generates)

### Steps
1. Build a real Backstage template with at least 3 real automation steps (not just a copy-paste skeleton)
2. Use it to scaffold a genuinely new service end-to-end
3. Time the process and compare it to how long the same setup would take manually
4. Register the resulting service in the catalog and confirm it's discoverable
5. Document the before/after onboarding-time comparison in the README, following this guide's own DORA/adoption-metric framing

---

## Project 2: A Backstage Scorecard Measuring Real Golden-Path Adoption

**Level:** Intermediate | **Time:** 2 days | **GitHub:** `platform-scorecard-adoption`

**What you build:** A set of Scorecard checks that programmatically determine whether a service is actually following the golden path, applied against multiple real (or realistic sample) services.

### Scorecard checks
```yaml
checks:
  - id: has-oncall-rotation
    description: "Service has a PagerDuty rotation registered"
  - id: uses-golden-path-pipeline
    description: "CI pipeline matches the current standard template version"
  - id: has-slo-defined
    description: "At least one SLO is defined in the catalog"
```

### Interview points
- Explaining why this is qualitatively different from a manual adoption survey — a Scorecard check runs automatically and continuously, catching drift the moment it happens rather than at the next quarterly review
- Connecting this directly to Troubleshooting's "golden path exists but adoption stays low" scenario — a Scorecard is the concrete measurement tool that turns "we think adoption is low" into "here are exactly the 4 services failing the pipeline-version check, and why"
- Being able to propose what action a failing Scorecard result should trigger (a Slack notification to the owning team, a dashboard visible platform-wide) as a real operational decision, not just the check's existence

### Steps
1. Define at least 3 real Scorecard checks reflecting this guide's own golden-path components
2. Apply them against multiple sample services with deliberately varied compliance levels
3. Build a simple dashboard or report summarizing per-service and aggregate compliance
4. Identify which specific services are failing which specific checks, and propose a concrete remediation path for one
5. Document the full scorecard design and findings in the README

---

## Project 3: A Platform-of-Platforms Organizational Design Proposal

**Level:** Advanced | **Time:** 3-4 days | **GitHub:** `platform-of-platforms-proposal` (a design document repo, not primarily code)

**What you build:** A written organizational-design proposal for scaling a single platform team into a platform-of-platforms structure, including funding model recommendation and anti-pattern mitigation — the kind of document a staff/principal engineer would actually produce.

### Proposal structure (as a real document, not just an outline)
```
1. Current-state assessment (hypothetical or real org)
2. Proposed core-platform vs. domain-platform team boundaries
3. Funding model recommendation (centrally funded / chargeback / hybrid)
   with explicit tradeoff reasoning
4. Ivory-tower anti-pattern mitigation plan (embedding, on-call rotation)
5. Migration plan — how existing teams transition without a
   DORA-metric regression (Troubleshooting's own failure mode)
6. Success metrics and a 6-month review checkpoint
```

### Interview points
- This is the single most senior-level artifact this guide points toward — being able to produce (or at minimum, credibly discuss) a document like this is what distinguishes a platform engineer from a staff/principal-level platform architect
- Explicitly addressing the ivory-tower anti-pattern in the proposal (not just the technical architecture) demonstrates the organizational maturity this guide's Advanced section specifically calls out as distinct from adoption-metric failures
- Being able to defend the funding-model recommendation against the two alternatives, using this guide's own tradeoff framing, rather than asserting one is simply "best"

### Steps
1. Pick a real or realistic hypothetical org (document your assumptions about scale — number of teams, current platform-team size)
2. Write the core-vs-domain platform boundary proposal, grounded in Team Topologies' framing this guide uses throughout
3. Write the funding-model section with explicit tradeoff reasoning, not just a recommendation
4. Write the ivory-tower mitigation plan as concretely as the golden-path-adoption fix in Troubleshooting
5. Have someone else (a peer, a mentor, or a mock interviewer) read and challenge the proposal, and document what held up and what didn't in the README

---

## Portfolio Checklist
- [ ] All artifacts are real and usable, not just described — the template actually scaffolds, the Scorecard actually runs, the proposal is a real document someone could act on
- [ ] Can walk through Project 1's before/after onboarding-time comparison with real numbers in an interview
- [ ] Project 2's scorecard results point at specific, real remediation actions, not just abstract compliance percentages
- [ ] Project 3 has been read and challenged by at least one other person, with their pushback documented
