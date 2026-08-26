# Backstage Interview Questions

**Q: What's the Software Catalog, and why does it matter beyond just listing services?**
A: The Software Catalog is Backstage's structured model of every Component, API, Resource, System, and Domain in an organization, each with a defined owner and real relationships between entities (a Component provides an API, belongs to a System). It matters because it answers questions a flat service list can't — who owns this, what does it depend on, what larger system is it part of — giving a genuine, queryable source of truth instead of scattered tribal knowledge.

**Q: Where does catalog-info.yaml live, and why does that placement matter?**
A: It lives in the service's own repository, not a separate centrally-maintained database. This matters because catalog metadata evolves alongside the code it describes, in the same pull requests, maintained by the people who actually know the current accurate answer — far more likely to stay current than a separate system nobody's specifically reminded to update.

**Q: What's a Software Template, and what problem does it solve?**
A: A Software Template lets a developer scaffold a new project through a guided UI form, pre-configured with an organization's actual standards (CI/CD config, linting, base Dockerfile). It solves the "golden path" problem — instead of documentation someone might not follow correctly, the Scaffolder makes following the standard the path of least resistance, genuinely easier than doing it manually and getting some detail wrong.

**Q: What's TechDocs, and how does it differ from a traditional wiki?**
A: TechDocs renders documentation written as Markdown living in a service's own repository (built via MkDocs), directly within the Backstage portal alongside that service's catalog entry. Unlike a separate wiki, docs changed in the same PRs as the code they describe are far more likely to actually stay current — addressing the classic "wiki page is years out of date" problem structurally, not just through better discipline.

**Q: What's the difference between a frontend and backend Backstage plugin?**
A: A frontend plugin is a React module adding UI — pages, cards on entity views, sidebar items. A backend plugin adds server-side capability — new API endpoints, custom catalog processors, scheduled jobs. Most substantial plugins pair both — a frontend showing CI status backed by a backend plugin that actually fetches it from the CI system's API with proper credentials.

**Q: Is Backstage secure/access-controlled by default?**
A: No — an unconfigured Backstage instance is fully open by default, meaning every authenticated user can view every catalog entity and run every Software Template. The permission framework lets an organization define real policies (restricting infrastructure-provisioning templates, scoping entity visibility), but this requires deliberate configuration — it's a real gap to address, not a safe default to leave in place for an organization with genuine access-control needs.

**Q: What's catalog discovery, and why does it matter for organizations with many services?**
A: Discovery is automated scanning (a configured catalog processor) for catalog-info.yaml files across an org's repos, registering/updating entities on a schedule without manual per-service action. It matters at scale because manually registering dozens or hundreds of services doesn't scale, and more importantly doesn't automatically stay current as services are added or removed the way scheduled discovery does.

**Q: Why is Backstage described as "a framework for building a portal" rather than a portal itself?**
A: A default installation with zero configuration is deliberately minimal — real value comes from an organization configuring the catalog for their actual services, adopting/building plugins relevant to their own tooling, and creating templates reflecting their actual golden paths. It's closer to a platform an organization builds their specific portal on top of than an immediately-usable SaaS product, which is both its real strength (genuine fit to actual needs) and a real adoption cost.

**Q: What's a genuine risk to a Backstage catalog's long-term value, beyond initial setup?**
A: Data going stale — a catalog-info.yaml never updated after a team reorg, or services missing entries entirely, undermines the "single source of truth" premise the catalog exists to provide. Catalog data quality is an ongoing process (discovery, updating alongside code changes, explicitly surfacing unowned/stale entities), not a one-time onboarding task that's done once and stays accurate on its own.

**Q: How would you roll out Backstage to an organization with 100+ existing services and no prior catalog?**
A: Configure catalog discovery rather than manual registration. Roll out a minimal required schema (name, type, lifecycle, owner) across every service first to establish baseline ownership visibility quickly, rather than blocking on fully-detailed entries. Explicitly flag genuinely unowned services rather than defaulting to a placeholder. Only after baseline coverage, incrementally enrich entries with API relationships, System groupings, and TechDocs, introducing Software Templates as a separate later phase once the catalog has real adoption.

## Skills Employers Value

```
CATALOG DATA QUALITY: driving genuine, current ownership coverage
  across an organization's services, not just initial registration
GOLDEN PATH DESIGN: building Software Templates that actually get
  adopted because they're genuinely easier than the manual alternative
PLUGIN DEVELOPMENT: building custom frontend/backend plugins
  integrating an org's own internal tools into the portal
PERMISSION FRAMEWORK CONFIGURATION: scoping real access control
  rather than leaving a Backstage instance fully open by default
SALARY: Internal Developer Platform / platform engineering expertise
  is a growing, valued specialization within DevOps roles
  `(needs verification -- recheck current salary bands against
  current industry survey data before citing a specific figure)`
```
