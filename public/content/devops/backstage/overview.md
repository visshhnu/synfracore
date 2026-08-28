# Backstage

> **The open platform for building developer portals**

**Category:** Monitoring & Observability
**Learning Path:** What → Why → Learning Modules → Production Example → Interview Prep

---

**Before you start:** basic familiarity with what CI/CD and a service/microservice are is assumed. No prior developer-portal experience is needed.

## What is Backstage?

Backstage (originally built at Spotify, donated to the CNCF) is an open-source framework for building an **Internal Developer Portal (IDP)** — a single, unified web UI where an organization's engineers can discover every service that exists, see who owns what, scaffold new projects from approved templates, and find documentation, all in one place instead of scattered across wikis, spreadsheets, and tribal knowledge.

```conceptgrid
{
  "boxes": [
    { "title": "Software Catalog", "description": "Structured source of truth — every service, its owner, its relationships", "color": "blue" },
    { "title": "Software Templates", "description": "Self-service scaffolding — new projects generated from the golden path", "color": "purple" },
    { "title": "TechDocs", "description": "Docs-as-code — Markdown in the repo, rendered in the same portal", "color": "green" },
    { "title": "Plugins", "description": "Extends the portal — CI/CD status, cost visibility, custom internal tools", "color": "amber" }
  ]
}
```

## Why Backstage?

As an organization grows past a handful of services, a real, recurring problem emerges: nobody has a reliable answer to "what services exist, who owns this one, and how do I create a new one that follows our actual standards?" — the knowledge exists, but it's scattered across Slack threads, outdated wiki pages, and the memory of whoever's been there longest. Backstage's Software Catalog gives this a single, structured, queryable source of truth, and its Software Templates let new projects be scaffolded consistently from a "golden path" instead of every team reinventing project setup from scratch.

---

## Learning Modules

### Module 01 — The Software Catalog
*Entities, ownership, and relationships*

The Software Catalog is Backstage's core — a structured model of every Component (a service, a library), API, Resource (a database, a queue), System, and Domain in an organization, each with a defined owner. Entities aren't just a flat list — they have real relationships (this Component provides that API, this System groups these Components together).

**Topics covered:**

- Entity kinds (Component, API, Resource, System, Domain) — 🟢 Beginner
- catalog-info.yaml — declaring an entity — 🟢 Beginner
- Entity relationships and ownership — 🟡 Intermediate

```yaml
# catalog-info.yaml -- lives in a service's own repository,
# declaring it as a catalog entity
apiVersion: backstage.io/v1alpha1
kind: Component
metadata:
  name: payment-service
  description: Handles payment processing and refunds
spec:
  type: service
  lifecycle: production
  owner: team-payments
  system: checkout
  providesApis:
    - payment-api
```

### Module 02 — Software Templates (Scaffolder)
*Golden-path self-service*

Software Templates let a developer generate a brand-new project (a new microservice, a new frontend app) through a guided form in the Backstage UI, pre-configured with an organization's actual standards — the right CI/CD pipeline config, the right linting setup, the right base Dockerfile — rather than a developer starting from either a blank slate or copy-pasting an existing service and hoping they remembered to update everything.

**Topics covered:**

- Template structure (template.yaml) — 🟡 Intermediate
- Template parameters and input forms — 🟡 Intermediate
- Scaffolder actions (fetch, publish, register) — 🔴 Advanced

```yaml
# template.yaml -- a Software Template's definition
apiVersion: scaffolder.backstage.io/v1beta3
kind: Template
metadata:
  name: new-microservice
  title: New Microservice
spec:
  parameters:
    - title: Service Details
      properties:
        name: { type: string, title: Service Name }
        owner: { type: string, title: Owning Team }
  steps:
    - id: fetch
      action: fetch:template
      input: { url: ./skeleton, values: { name: '${{ parameters.name }}' } }
    - id: publish
      action: publish:github
      input: { repoUrl: 'github.com?repo=${{ parameters.name }}' }
```

### Module 03 — TechDocs & Plugins
*Documentation as code, and extending Backstage*

TechDocs brings documentation into the same portal as everything else — written as Markdown in a service's own repository (docs-as-code, versioned alongside the code it documents), built via MkDocs, and rendered directly in Backstage rather than living in a separate, easily-outdated wiki. Backstage's plugin architecture is what lets the portal extend beyond the catalog/scaffolder/docs core — a CI/CD status plugin, a cost-visibility plugin, a custom internal tool's UI, all surfaced in one consistent portal.

**Topics covered:**

- TechDocs — docs-as-code with MkDocs — 🟡 Intermediate
- Plugin architecture (frontend/backend plugins) — 🔴 Advanced
- The Backstage plugin ecosystem — 🟡 Intermediate

---

## Production Example

```bash
# Production Runbook -- "we have 80 microservices and nobody can
# reliably answer 'who owns this one' -- we need to onboard them
# into a Backstage catalog"

# Step 1: Start with a MINIMAL catalog-info.yaml per service --
# just enough to establish ownership, not a full detailed spec
# on day one
cat > catalog-info.yaml << 'EOF'
apiVersion: backstage.io/v1alpha1
kind: Component
metadata:
  name: legacy-order-service
spec:
  type: service
  lifecycle: production
  owner: team-orders
EOF

# Step 2: Use catalog DISCOVERY (a catalog processor scanning an
# org's repos for catalog-info.yaml files) rather than manually
# registering all 80 services one at a time in the UI
# -- configured in app-config.yaml's catalog.providers section

# Step 3: Once ownership is established across all services,
# THEN incrementally enrich entries -- add providesApis, add
# TechDocs, add System groupings -- as a follow-up, not blocking
# the initial rollout on having every field perfectly filled in

# Step 4: For a handful of services where NOBODY can confidently
# say who owns them anymore, flag this explicitly as its own
# finding -- an "unowned service" in the catalog is itself
# valuable information, not something to silently default to a
# placeholder owner just to fill the field

# INTERVIEW POINT:
# "Getting a baseline of who-owns-what across every service was
# more valuable on day one than any single service having a
# perfectly detailed catalog entry -- breadth of basic ownership
# data beat depth on a handful of showcase entries."
```

---

## Interview Prep

**PSR Formula:** Answer every question: **Problem → Solution → Result**. 45-90 seconds max.

### Common Interview Questions

**Q1. What is Backstage and why would you use it in production?**

**A:** **Problem:** as an organization grows past a handful of services, nobody has a reliable, structured answer to "what services exist, who owns this one, and how do I create a new one following our actual standards" — that knowledge scatters across wikis, Slack, and tribal memory. **Solution:** Backstage provides a Software Catalog as a single structured source of truth for every service and its owner, Software Templates for consistent self-service project scaffolding, and TechDocs bringing documentation into the same portal, all extensible via plugins. **Result:** engineers get one place to discover services, find ownership, and create new projects consistently — reducing the cognitive overhead of navigating a growing, increasingly fragmented service landscape.

---

**Q2. How does Backstage work internally? Explain the architecture.**

**A:** **Problem:** understanding what actually powers the catalog and templates matters for both extending Backstage and diagnosing issues. **Solution:** Backstage is a Node.js application split into a frontend (a React app) and a backend, with the Software Catalog backed by its own database, populated by catalog PROCESSORS that read `catalog-info.yaml` files (from configured locations — GitHub orgs, specific repos) and build the entity graph, including relationships between entities. Plugins extend both frontend (new UI pages/cards) and backend (new APIs/processors) independently. **Result:** the catalog isn't a static list — it's continuously reconciled by processors reading source-of-truth YAML files in actual repositories, meaning the catalog reflects what's declared in code, not a separately-maintained database someone has to remember to update by hand.

---

**Q3. What are the main components of Backstage?**

**A:** **Problem:** "Backstage" names several genuinely distinct capabilities worth separating. **Solution:** the Software Catalog (the entity model and ownership data), the Scaffolder/Software Templates (self-service project creation), TechDocs (docs-as-code rendering), Search (indexing across the catalog and docs), and the plugin system (the extension mechanism tying everything together and enabling further customization). **Result:** knowing this separation is what makes adopting Backstage incrementally practical — a team can start with just the catalog for ownership visibility, and add Templates/TechDocs/custom plugins later, rather than needing to adopt everything simultaneously.

---

**Q4. How do you handle catalog data quality issues — stale or missing ownership data?**

**A:** **Problem:** a catalog is only as valuable as its data is accurate — a `catalog-info.yaml` that's never updated after a team reorg, or a service missing an entry entirely, undermines the whole "single source of truth" premise. **Solution:** use catalog discovery (automated scanning for `catalog-info.yaml` files across an org's repos) rather than requiring fully manual registration, treat catalog entries as living alongside the code they describe (updated in the same PR as an ownership change, not a separate out-of-band process), and explicitly surface unowned/stale entities rather than letting them silently persist unnoticed. **Result:** catalog data quality is an ongoing process, not a one-time onboarding task — the biggest real risk to Backstage's value isn't the tooling, it's the catalog silently drifting out of sync with reality if nothing keeps it current.

---

**Q5. What is your production experience with Backstage?**

**A:** This is a genuinely personal question — answer with a real incident using the Problem → Solution → Result structure: onboarding a large number of services into the catalog, building or customizing a Software Template for a team's actual golden path, or diagnosing why a catalog entity wasn't showing expected relationships. Interviewers are listening for whether you've actually operated Backstage against a real, messy organization's real services, not just run the demo app locally once.

---

**Q6. How do you monitor and keep a Backstage deployment healthy in production?**

**A:** **Problem:** Backstage becomes a real piece of developer-facing infrastructure — if the catalog processing pipeline stalls, or the backend becomes unavailable, developers lose a tool they've come to rely on for day-to-day discovery and scaffolding. **Solution:** monitor catalog processing health specifically (are entities actually being refreshed from source repos, or is processing stuck/erroring), standard application health/uptime monitoring for the backend/frontend, and periodically audit catalog COMPLETENESS (what percentage of known services actually have a catalog entry) as its own tracked metric, not just infrastructure uptime. **Result:** catalog processing health is a genuinely distinct monitoring concern from basic uptime — a Backstage instance can be "up" while its catalog data is silently stale because processing quietly stopped working for a subset of sources.

---

**Q7. What are the security considerations for a Backstage deployment?**

**A:** **Problem:** Backstage aggregates sensitive organizational information (service ownership, infrastructure details, potentially secrets referenced by plugins) into one portal, and its Scaffolder can create real resources (repos, cloud infrastructure) on a user's behalf. **Solution:** Backstage's permission framework should be configured to scope who can view/edit specific catalog entities and who can run specific Software Templates (not every developer needs permission to scaffold infrastructure-provisioning templates); plugin credentials/tokens (for GitHub, cloud providers, etc.) need the same secrets-management discipline as any other application credential; and authentication (SSO integration) should be properly configured rather than left on a default/permissive setup. **Result:** because Backstage aggregates so much organizational context and can trigger real actions, its own access control deserves the same rigor as any other system that can create infrastructure or expose sensitive ownership/architecture information.

---

**Q8. How does Backstage compare to alternatives?**

**A:** This usually means a specific comparison. Backstage vs. building a custom internal portal from scratch: Backstage provides the catalog model, plugin architecture, and a large existing plugin ecosystem out of the box, avoiding reinventing genuinely hard problems (entity relationships, a templating engine) — at the cost of learning Backstage's own conventions and operating a real application (it's not a SaaS you just sign up for). Backstage vs. a simpler service catalog tool: dedicated, narrower catalog-only tools can be simpler to adopt for JUST ownership tracking, but lack Backstage's extensibility (Software Templates, TechDocs, the plugin ecosystem) for teams wanting a genuine unified developer portal rather than a single-purpose catalog. State the specific tool being compared and the actual tradeoff, rather than reciting a generic list.

---

**Q9. Why is Backstage described as a "framework for building a portal" rather than a portal itself, out of the box?**

**A:** A default Backstage installation with zero configuration or plugins is deliberately minimal — the real value comes from an organization configuring the catalog for their actual services, building or adopting plugins genuinely relevant to their own tooling ecosystem, and creating Software Templates reflecting their actual golden paths. This is fundamentally different from a SaaS product usable immediately with no customization — Backstage is closer to a platform an organization builds their specific developer portal ON TOP OF, which is both its real strength (genuine fit to an organization's actual needs) and a real adoption cost (it requires deliberate investment, not just installation).

---

**Q10. Walk through how you'd roll out Backstage to an organization with 100+ existing microservices and no prior catalog.**

**A:** Start with catalog discovery configured to automatically scan repos for `catalog-info.yaml` files rather than manual per-service registration. Roll out a MINIMAL required schema first (just name, type, lifecycle, owner) across every service to establish baseline ownership visibility quickly, rather than blocking on every service having a fully-detailed entry. Explicitly flag services where ownership genuinely can't be determined, rather than defaulting to a placeholder. Only after baseline ownership coverage is achieved, incrementally enrich entries with API relationships, System groupings, and TechDocs — and introduce Software Templates for new-service creation as a separate, later phase once the catalog itself has real adoption and trust.
