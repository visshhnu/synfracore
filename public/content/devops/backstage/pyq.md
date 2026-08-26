# Backstage — PYQ (Practice Questions)

**Framing note:** Backstage doesn't have a formal, proctored vendor certification exam with a public leaked-question archive. What follows is built from this guide's own Overview/Fundamentals/Intermediate/Advanced material, framed as practice questions grounded in real, documented Backstage behavior.

---

### 1. (Domain: Catalog Model) Why does the Software Catalog model relationships between entities (a Component belongs to a System, provides an API) rather than just maintaining a flat list of services?

**Answer:** A flat list can answer "what services exist" but not "what does this depend on" or "what larger system is this part of" — questions that matter for real organizational understanding and impact analysis. Modeling genuine relationships between entity kinds (Component, API, Resource, System, Domain) is what lets the catalog answer meaningfully richer, more useful questions than a simple inventory list could.

---

### 2. (Domain: Catalog Data Ownership) Why does catalog-info.yaml live in a service's own repository rather than a centrally-maintained separate database?

**Answer:** Keeping it alongside the code means catalog metadata evolves in the same pull requests as the code changes it describes, maintained by the people who actually know the current, accurate answer (the owning team) — far more likely to stay current than a separately-maintained system nobody's specifically reminded to update when something about the service changes.

---

### 3. (Domain: Software Templates) What problem do Software Templates solve that documentation-only "golden path" guidance doesn't fully address?

**Answer:** Documentation describing a golden path still requires a developer to read it carefully and execute every step correctly manually — genuinely easy to get a detail wrong. Software Templates make following the golden path the PATH OF LEAST RESISTANCE (a guided form, automated scaffolding) — genuinely easier than doing it manually, which is what actually drives real adoption of a standard more reliably than documentation alone.

---

### 4. (Domain: TechDocs) Why does TechDocs' docs-as-code approach (Markdown in the service's own repo) tend to stay more current than a traditional separate wiki?

**Answer:** Because documentation changes happen in the same pull requests as the code changes they describe, reviewed the same way code is reviewed — a developer changing behavior is far more likely to also update docs sitting right there in the same PR than to remember a completely separate wiki system exists and needs a separate update.

---

### 5. (Domain: Security/Permissions) What's the default access-control posture of an unconfigured Backstage instance, and why does this matter?

**Answer:** Fully open by default — every authenticated user can view every catalog entity and run every Software Template, including potentially infrastructure-provisioning ones. This matters because it's a real gap for organizations with genuine access-control requirements, not a safe default to leave in place — the permission framework requires deliberate configuration to scope real policies.

---

### 6. (Domain: Discovery) Why is catalog discovery (automated repo scanning) preferred over manual registration for an organization with many services?

**Answer:** Manual registration doesn't scale past a handful of services, and more importantly doesn't automatically stay current — a manually-registered catalog can silently drift as new services are added or old ones removed without anyone remembering to update the catalog. Scheduled discovery automatically finds and updates entities from actual repository content on an ongoing basis.

---

### 7. (Domain: Plugins) Why do most substantial Backstage plugins pair a frontend AND backend component, rather than being purely frontend?

**Answer:** A frontend plugin can only display/interact with data reachable client-side. Anything requiring server-side credentials (an API token for a third-party system), data aggregation, or scheduled background work needs a backend component — a plugin showing live CI/CD status, for example, needs a backend piece to actually fetch that status using appropriate credentials, which a purely frontend plugin structurally can't do securely on its own.

---

### 8. (Domain: Catalog Quality) A catalog shows 100% of services registered, but many entries have a placeholder or missing owner field. Is this catalog actually providing full value?

**Answer:** No — registration coverage alone doesn't mean the catalog is answering its core question ("who owns this") for every entry. A catalog can technically show complete registration while still failing at its central purpose for exactly the entries where ownership is unclear — registration completeness and DATA QUALITY (meaningful, accurate field values) are two separate things worth tracking separately.

---

### 9. (Domain: Golden Paths) Why is "golden path" described as the DEFAULT well-supported way to do something, not the ONLY way?

**Answer:** A golden path is deliberately not a hard mandate — teams with genuine, specific reasons can deviate from it. The point is making the DEFAULT path genuinely easy and correct (via Software Templates), so most teams follow it naturally because it's the path of least resistance, not because deviation is forbidden — this distinction matters for how golden paths are actually positioned and adopted within an organization.

---

### 10. (Domain: Framework vs. Product) Why is Backstage described as "a framework for building a portal" rather than an immediately-usable portal out of the box?

**Answer:** A default installation with zero configuration is deliberately minimal — genuine value comes from an organization configuring the catalog for their actual services, adopting or building plugins relevant to their own tooling ecosystem, and creating Software Templates reflecting their actual golden paths. This is fundamentally different from an immediately-usable SaaS product, which is both Backstage's real strength (genuine fit to an organization's specific needs) and a real, deliberate adoption cost, unlike simply signing up for a hosted service.
