# Platform Engineering vs SRE vs DevOps — Intermediate

Overview established what each of the three terms means and how they compose. Intermediate goes one level deeper into how a real Platform Engineering initiative is actually run day to day — the "platform as a product" mindset, the concrete mechanics of self-service infrastructure provisioning, and how platform teams measure and mature their own golden path over time.

## Platform as a Product, Not a Project

The single mindset shift that separates a platform team that gets genuine adoption from one that ships tooling nobody uses (the failure mode this guide's own Troubleshooting section covers in depth): treat the internal platform itself as a product, with the org's own engineers as its customers — not as an internal IT project that ships once and is considered "done."

This has concrete operational consequences, not just a philosophical reframe:

- **A product roadmap, not a project plan.** The platform team maintains a backlog driven by customer (developer) feedback, prioritized the same way an external-facing product team would prioritize feature requests — not a fixed scope delivered once and then handed off to maintenance mode.
- **Onboarding and documentation as a first-class deliverable.** A self-service capability nobody knows how to use, or that has stale docs, might as well not exist — the product mindset treats discoverability and documentation quality as part of the actual feature, not an afterthought.
- **A named internal "product owner"** for the platform, accountable for adoption and satisfaction metrics the same way a product manager would be accountable for external product metrics — this is what makes "platform teams are measured by the productivity of teams they serve" (Overview's framing) an enforceable practice rather than an aspiration.

## Backstage Scorecards — Making the Golden Path Measurable Per-Service

Overview covered Backstage's Software Catalog and Templates at a conceptual level. In practice, a mature platform team uses Backstage's **Scorecards** (via the TechDocs/Soundcheck-style plugin ecosystem) to make "is this service actually following the golden path" a concrete, per-service, automatically-computed answer rather than a subjective assessment:

```yaml
# Example scorecard check definitions — evaluated automatically
# per service in the catalog, not manually audited
checks:
  - id: has-oncall-rotation
    description: "Service has a PagerDuty rotation registered"
  - id: has-slo-defined
    description: "Service has at least one SLO defined in the catalog"
  - id: uses-golden-path-pipeline
    description: "Service's CI/CD pipeline matches the current standard template version"
  - id: dependency-freshness
    description: "No dependency is more than 2 major versions behind current"
```

The direct value: this converts "which teams are actually on the golden path" from a periodic manual survey into a live, queryable dashboard — the same DORA/adoption metrics Overview describes tracking in aggregate can be attributed per-service, making it possible to identify specifically which services are lagging and why, rather than only knowing the aggregate adoption percentage.

## Self-Service Infrastructure Provisioning — Crossplane in Practice

Overview mentioned Crossplane by name as a provisioning tool the IDP calls; concretely, Crossplane lets a platform team define infrastructure as a Kubernetes-native Custom Resource that a developer can request without touching Terraform or a cloud console directly:

```yaml
# The developer-facing abstraction — deliberately simple,
# hiding the actual cloud/Terraform complexity underneath
apiVersion: platform.company.com/v1alpha1
kind: PostgresDatabase
metadata: { name: payments-db }
spec:
  size: medium
  environment: production
```

```yaml
# What the platform team defines once, behind the scenes —
# a Crossplane Composition mapping the simple developer-facing
# request above to the real underlying cloud resources
apiVersion: apiextensions.crossplane.io/v1
kind: Composition
metadata: { name: postgres-database-aws }
spec:
  resources:
  - name: rds-instance
    base:
      apiVersion: rds.aws.upbound.io/v1beta1
      kind: Instance
      spec: { forProvider: { engine: postgres, instanceClass: db.t3.medium } }
```

This is the concrete mechanism behind "developer fills a form, platform provisions everything" from Overview's Backstage example — the developer-facing request is a small, safe, opinionated subset of options; the Composition (owned and versioned by the platform team) encodes all the actual cloud-provider complexity, security defaults, and tagging/compliance requirements a raw Terraform apply would otherwise leave to the requesting developer to get right themselves.

## Service Maturity Models

A mature platform initiative typically defines an explicit **maturity model** — a staged set of criteria a service progresses through, rather than a binary "on the golden path or not":

```
Level 0 — Unmanaged: no catalog entry, no standard pipeline, ad hoc infra
Level 1 — Cataloged: registered in Backstage, ownership known
Level 2 — Standardized: uses golden-path pipeline and Helm chart
Level 3 — Observable: SLOs defined, dashboards wired, on-call rotation registered
Level 4 — Optimized: passes all scorecard checks, dependency-current, DR-tested
```

This does two concrete things a simple binary adoption metric can't: it gives a team a legible, incremental path forward rather than an all-or-nothing migration, and it lets the platform team prioritize investment toward services that are stuck at a specific level rather than treating "not fully on the golden path yet" as one undifferentiated bucket.

## Internal Platform SLAs

Just as an external product commits to uptime/support-response SLAs for its customers, a mature platform team commits to internal SLAs for the capabilities it provides — provisioning-request turnaround time, platform-API/portal uptime, and support-ticket response time:

```
Example internal platform SLA commitments:
- New service scaffold via golden path: < 1 business day
- Database provisioning request: < 4 hours
- Backstage portal uptime: 99.9%
- P1 platform-blocking issue response: < 30 minutes
```

This matters for the same reason Overview's "platform teams are measured by the productivity of teams they serve" framing matters — without a stated SLA, a slow or unreliable platform capability just looks like normal friction to the teams depending on it; with an explicit SLA, missed commitments become a visible, trackable signal the platform team is accountable to, exactly like any other internal service-provider relationship.
