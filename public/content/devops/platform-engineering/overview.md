# Platform Engineering vs SRE vs DevOps

> **Three roles clarified — what each does, how they differ, interview answers**

**Category:** Site Reliability Engineering  
**Learning Path:** What → Why → Learning Modules → Production Example → Interview Prep

---

## What is Platform Engineering vs SRE vs DevOps?

These three terms are often confused but have distinct meanings. DevOps is a culture — break silos between Dev and Ops, automate everything, developers own their deployments. SRE is Google's implementation of DevOps — uses software engineering to solve operations problems, defines SLOs, manages error budgets. Platform Engineering builds the internal platform that developers use — the golden path, the paved road. Interviewers test this distinction at senior levels.

## Why Platform Engineering vs SRE vs DevOps?

An Internal Developer Platform (IDP) is what the Platform Engineering team builds. It gives application developers a self-service portal to deploy applications, spin up databases, create pipelines — without knowing Kubernetes or Terraform internals. Backstage (from Spotify, now CNCF) is the most popular IDP portal. The golden path is the opinionated, well-supported way to do something — new service scaffold, standard Helm chart, standard pipeline template.

---

## Learning Modules

### Module 01 — DevOps vs SRE vs Platform Engineering
*Definitions and real differences*

These three terms are often confused but have distinct meanings. DevOps is a culture — break silos between Dev and Ops, automate everything, developers own their deployments. SRE is Google's implementation of DevOps — uses software engineering to solve operations problems, defines SLOs, manages error budgets. Platform Engineering builds the internal platform that developers use — the golden path, the paved road. Interviewers test this distinction at senior levels.

**Topics covered:**

- DevOps — culture and philosophy — 🟢 Beginner
- SRE — Google implementation of DevOps — 🟢 Beginner
- Platform Engineering — internal developer platform — 🟡 Intermediate
- Which role are you interviewing for? — 🟡 Intermediate
- Salary and career progression — 🟢 Beginner

```bash
# DevOps (culture + practices):
# - Break silos between Dev and Ops
# - Developers own their deployments
# - Automate everything
# - Fast feedback loops
# - CI/CD, IaC, monitoring are the tools
# Anyone can be "doing DevOps" — it is a culture, not a job

# SRE (Google implementation of DevOps):
# - Software engineers solving operations problems
# - Defines SLOs, measures SLIs, manages error budgets
# - On-call rotation with escalation procedures
# - Toil reduction — automate repetitive ops work
# - Postmortem culture — blameless RCA
# Job title: Site Reliability Engineer

# Platform Engineering:
# - Builds the Internal Developer Platform (IDP)
# - Goal: developer self-service
# - "Golden path" — opinionated, supported, paved road
# - Tools: Backstage (portal), Crossplane, Terraform modules
# - Reduces cognitive load on application developers
# - Team Topologies: Platform team enables Stream-aligned teams
# Job title: Platform Engineer / Staff Engineer

# INTERVIEW ANSWER:
# "DevOps is the culture we all work in.
# SRE is how we operationalise reliability — SLOs, error budgets,
# on-call practices.
# Platform Engineering is the work of building internal tools
# and golden paths so developers can deploy without needing
# to understand Kubernetes internals.
# In my current role I do all three: I maintain SLOs (SRE),
# I build shared Terraform modules and CI templates (Platform),
# and I work closely with developers to remove friction (DevOps)."
```

### Module 02 — Internal Developer Platform
*Backstage, golden paths, self-service*

An Internal Developer Platform (IDP) is what the Platform Engineering team builds. It gives application developers a self-service portal to deploy applications, spin up databases, create pipelines — without knowing Kubernetes or Terraform internals. Backstage (from Spotify, now CNCF) is the most popular IDP portal. The golden path is the opinionated, well-supported way to do something — new service scaffold, standard Helm chart, standard pipeline template.

**Topics covered:**

- What is an Internal Developer Platform (IDP) — 🟡 Intermediate
- Backstage — CNCF developer portal — 🟡 Intermediate
- Golden path — opinionated, supported route — 🟡 Intermediate
- Self-service deployment without K8s knowledge — 🔴 Advanced
- Platform team metrics — 🟡 Intermediate

```bash
# Platform Engineering goal:
# BEFORE: Developer needs to know K8s, Terraform, Jenkins,
#         Grafana, Harbor — cognitive overload
# AFTER:  Developer fills a form → platform provisions everything

# Backstage — self-service developer portal
# Install Backstage
npx @backstage/create-app@latest

# Backstage provides:
# Software Catalog  — list of all services, owners, docs
# TechDocs          — documentation from markdown in repo
# Templates         — "create new service" scaffolding
# Plugins           — Kubernetes, GitHub, PagerDuty, SonarQube

# Example: Backstage template for new microservice
# Developer fills form: service name, team, language
# Backstage:
# 1. Creates GitHub repo from template
# 2. Sets up CI/CD pipeline (GitHub Actions/Jenkins)
# 3. Creates Kubernetes namespace with RBAC
# 4. Creates ArgoCD Application for GitOps
# 5. Creates Grafana dashboard
# 6. Registers service in catalog
# Developer has running service in 10 minutes, zero platform knowledge

# Platform team metrics:
# DORA metrics:
# - Deployment Frequency: how often teams deploy
# - Lead Time for Changes: commit → production time
# - Change Failure Rate: % deployments causing incidents
# - Time to Restore Service: MTTR for incidents
# Platform adoption: % of teams using golden path
# Developer satisfaction: quarterly survey score
```

---

## Production Example

```bash
# Platform Engineering — Senior Interview Questions

# Q: "How do you measure the success of a Platform team?"
# ANSWER:
# "Platform teams are measured by the productivity of the teams
# they serve, not their own output.
# Key metrics I track:
# 1. DORA metrics — deployment frequency, lead time, failure rate
# 2. Onboarding time — how long for a new service to reach production
#    (target: under 1 day with golden path)
# 3. Platform adoption — % of teams using standard templates
# 4. Developer Net Promoter Score — quarterly survey
# 5. Toil reduction — hours saved per week across all teams
#
# At a large telecom organisation: reduced new service onboarding from 2 weeks to
# 2 days by creating a Backstage template that scaffolds repo,
# pipeline, K8s namespace, ArgoCD app and Grafana dashboard."

# Q: "What is toil and how do you reduce it?"
# Toil = manual, repetitive, automatable ops work that scales with traffic
# Examples: manually restarting pods, rotating certs, resizing disks
# Toil reduction = automate it, so it happens zero times per incident
# SRE target: < 50% of time on toil, > 50% on engineering work

# Q: "Team Topologies — how do you apply it?"
# Stream-aligned teams: own a product end-to-end (app + deploy + ops)
# Platform team: provides self-service capabilities
# Enabling team: helps stream-aligned teams adopt new tech
# Complicated subsystem team: specialised complex components (ML, Security)
# Interaction modes: X-as-a-Service, Collaboration, Facilitating
```

---

## Interview Prep

**PSR Formula:** Answer every question: **Problem → Solution → Result**. 45-90 seconds max.

### Common Interview Questions

**Q1. What's the actual difference between DevOps, SRE, and Platform Engineering — and why do interviewers test this distinction at senior levels?**

**A:** **Problem:** all three terms get used interchangeably in job postings and casual conversation, but conflating them signals a shallow understanding at a senior level, where the distinction has real organizational consequences. **Solution:** DevOps is a culture and set of practices — breaking silos between Dev and Ops, developers owning their own deployments, automating everything — not a job title anyone can single-handedly "do"; SRE is Google's specific operationalization of that culture, using software engineering discipline (SLOs, SLIs, error budgets, blameless postmortems) to make reliability measurable rather than aspirational; Platform Engineering is the practice of building the internal platform — the golden path — that makes good DevOps/SRE practices the easy default for application developers, rather than something every team reinvents. **Result:** a candidate who can articulate all three precisely, and explain how they compose rather than compete, is demonstrating the systems-level thinking senior platform/SRE roles actually require — exactly why this distinction gets tested specifically at senior levels, not junior ones.

---

**Q2. How do DevOps, SRE, and Platform Engineering actually relate to each other in a real org — are they the same team wearing different hats, or genuinely separate functions?**

**A:** **Problem:** org charts vary wildly across companies, and without a mental model for how these three *should* relate, it's easy to either conflate them into one job or treat them as entirely unconnected disciplines. **Solution:** DevOps is the umbrella culture everyone in engineering operates within, not a team; SRE is often (though not always) a dedicated team applying that culture with specific reliability tooling and on-call ownership; Platform Engineering, per Team Topologies' framing, is a *platform team* that exists specifically to enable *stream-aligned teams* (the teams shipping product features) with self-service capabilities, reducing the cognitive load those teams would otherwise carry. **Result:** in many real orgs a single senior engineer genuinely does all three at once — maintaining SLOs (SRE), building shared Terraform modules and CI templates (Platform), and working closely with developers to remove friction (DevOps) — the three aren't competing job descriptions, they're different lenses on the same underlying goal.

---

**Q3. What are the core practices or building blocks of each — DevOps, SRE, and Platform Engineering?**

**A:** **Problem:** without naming the concrete practices underneath each label, "DevOps," "SRE," and "Platform Engineering" stay abstract buzzwords instead of things you can actually point to doing. **Solution:** DevOps' concrete practices are CI/CD, Infrastructure as Code, and monitoring, aimed at fast feedback loops; SRE's are SLO/SLI definition, error-budget policy, structured on-call rotations, and toil reduction (with a stated target of under 50% of time spent on toil); Platform Engineering's are building and maintaining an Internal Developer Platform — a self-service portal (Backstage being the most common), golden-path templates, and the underlying provisioning tooling (Crossplane, shared Terraform modules) the IDP calls. **Result:** each set of practices is checkable and demonstrable in an interview — naming CI/CD tools isn't the same as naming an SLO target, and neither is the same as describing a Backstage template — which is what separates a candidate who's absorbed the buzzwords from one who's actually done the work.

---

**Q4. How does incident response differ across a DevOps culture, an SRE team's on-call practice, and a Platform Engineering team's self-service tooling?**

**A:** **Problem:** "who gets paged and what do they do" looks different depending on which of the three lenses is operating, and conflating them leads to unclear ownership during a real incident. **Solution:** under a pure DevOps culture, the team that owns a service owns its incidents end-to-end, with no separate on-call function; SRE formalizes this with defined on-call rotations, escalation procedures, and — critically — blameless postmortem culture, treating an incident as a systems failure to learn from rather than an individual's fault; Platform Engineering's contribution is upstream of the incident itself — a well-built golden path (standard Helm charts, standard pipeline templates, pre-wired Grafana dashboards) reduces the number of incidents caused by inconsistent, ad hoc infrastructure choices in the first place. **Result:** a mature org layers all three — DevOps ownership culture, SRE's structured on-call/postmortem discipline, and Platform Engineering's incident-prevention-by-default tooling — rather than picking just one, since they address different points in the incident lifecycle: before, during, and the cultural response after.

---

**Q5. What is your personal experience working across DevOps, SRE, and Platform Engineering responsibilities?**

**A:** This is a genuinely personal question — answer with real, specific examples across the three, the way this guide's own scripted interview answer models: an SLO you personally maintained (SRE), a shared Terraform module or CI template you built for other teams to use (Platform), and a concrete case of working directly with developers to remove a friction point (DevOps). Interviewers are listening for whether you have real, dated, specific examples of each — not a recitation of the definitions from the previous questions.

---

**Q6. How do you measure whether a Platform Engineering initiative or SRE practice is actually succeeding?**

**A:** **Problem:** without concrete metrics, "our platform team is doing great work" is just an assertion, and a platform/SRE team that can't demonstrate impact is an easy target when budgets tighten. **Solution:** for Platform Engineering — DORA metrics (deployment frequency, lead time for changes, change failure rate, time to restore service), onboarding time for a new service to reach production (this guide's own example: reduced from 2 weeks to 2 days via a Backstage template), platform adoption rate (% of teams using the golden path rather than going around it), and developer Net Promoter Score from a quarterly survey; for SRE specifically — SLO attainment against the defined error budget, and toil-reduction hours saved per week. **Result:** the key discipline is that platform teams are measured by the productivity of the teams they serve, not their own output — a platform team building impressive internal tooling that developers don't actually adopt (low platform-adoption %) is failing by this standard even if the tooling itself is technically excellent.

---

**Q7. Who owns security and governance when responsibilities are split across DevOps, SRE, and Platform Engineering — is it any one team's job?**

**A:** **Problem:** when infrastructure ownership is deliberately distributed across a DevOps culture, an SRE team, and a Platform Engineering team, "whose job is security" can become a genuine gap if nobody assumes it's specifically theirs. **Solution:** in practice, security becomes a shared responsibility enforced structurally rather than owned by one team — Platform Engineering builds security into the golden path by default (a standard Helm chart or pipeline template that already has scanning, RBAC, and secrets management wired in, so an application team gets secure defaults without needing security expertise), SRE's error-budget and SLO discipline extends naturally to security-relevant reliability signals, and DevOps culture's "developers own their deployments" principle means the team closest to the code is also closest to catching a security issue early. **Result:** the strongest answer names the specific mechanism (security embedded in the golden path, not a separate gate) rather than asserting "security is everyone's responsibility" as an unsupported platitude — Platform Engineering is usually best positioned to make secure-by-default actually happen at scale, since they control what "golden path" even means.

---

**Q8. How does the Platform Engineering model compare to alternative ways of organizing infrastructure and ops work?**

**A:** **Problem:** Platform Engineering isn't the only way to organize this work, and understanding the alternatives is what makes the case for it (or against it) concrete rather than trend-following. **Solution:** vs. a traditional, centralized Ops/Infrastructure team that provisions on request (a ticket-driven model) — Platform Engineering's self-service portal removes the ticket queue entirely, at the cost of upfront investment in building that self-service tooling; vs. "pure DevOps" with no dedicated platform team at all, where every application team manages its own Kubernetes/Terraform/CI setup independently — Platform Engineering trades some team autonomy for consistency and reduced cognitive load, per Team Topologies' framing of a platform team existing specifically to enable stream-aligned teams; vs. SRE absorbing platform-building responsibilities itself — this works at smaller scale but tends to split SRE's focus between reliability engineering and internal tooling as the org grows. **Result:** the deciding factor is usually organizational scale — a platform team's upfront tooling investment only pays off once there are enough application teams that a ticket-driven or fully-autonomous model starts producing real inconsistency or bottleneck cost.

---

**Q9. Walk through a concrete example of how the same goal — say, reducing deployment failures — would be approached differently under a DevOps mindset, an SRE practice, and a Platform Engineering initiative.**

**A:** **Problem:** these three terms can feel interchangeable until applied to one specific, shared goal, at which point their actual differences become concrete rather than definitional. **Solution:** under a DevOps mindset, the team ships fast feedback via CI/CD and automated testing so failures are caught before deploy, with the team that wrote the code also owning the fix; under an SRE practice, the same goal is approached by defining a Change Failure Rate SLI, setting a target, and treating breaches of it as a signal to slow risky deploys until the error budget recovers; under a Platform Engineering initiative, the goal is approached upstream — building a standard, pre-tested pipeline template into the golden path so every team automatically inherits the safety checks, rather than each team implementing its own deploy-safety practices at varying quality. **Result:** this is the concrete version of "I do all three in my current role" — DevOps is the daily practice, SRE is the measurement and governance layer, Platform Engineering is what makes the safe practice the path of least resistance for every team, not just the disciplined ones.

---

**Q10. What is an Internal Developer Platform, and how does something like Backstage change a developer's day-to-day experience?**

**A:** **Problem:** without an IDP, an application developer who wants to ship a new service needs working knowledge of Kubernetes, Terraform, CI/CD tooling, and observability setup just to get something running — cognitive load that has nothing to do with the actual feature they're building. **Solution:** an Internal Developer Platform is the self-service layer the Platform Engineering team builds specifically to remove that requirement — Backstage (originally Spotify's, now a CNCF project) is the most widely adopted IDP portal, providing a Software Catalog (every service and its owner, in one place), TechDocs (documentation generated from markdown already in the repo), Templates (scaffolding for "create a new service"), and Plugins connecting to Kubernetes/GitHub/PagerDuty/SonarQube and similar tools. **Result:** this guide's own example is the concrete before/after — a developer filling out a template form gets a new GitHub repo, a CI/CD pipeline, a Kubernetes namespace with RBAC, an ArgoCD Application for GitOps, and a Grafana dashboard, all provisioned automatically, landing on a running service in about 10 minutes with zero platform-internals knowledge required — versus days or weeks of manual setup without the IDP.

---

## Official Resources

- [Backstage — Internal Developer Portal](https://backstage.io/docs/)
- [Platform Engineering Community](https://platformengineering.org/)
- [Team Topologies](https://teamtopologies.com/key-concepts)

---

