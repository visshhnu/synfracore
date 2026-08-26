# Backstage — FAQ

## Is Backstage a SaaS product I can just sign up for?

No — Backstage is an open-source framework you deploy and operate yourself (a real Node.js application with a frontend, backend, and database), not a hosted product with a signup flow. Some vendors offer managed/hosted Backstage-based commercial products, but core Backstage itself requires an organization to actually run it.

## Does adopting Backstage require migrating every service's documentation into it immediately?

No — Backstage can be adopted incrementally. A common practical path starts with just the Software Catalog for ownership visibility, adding TechDocs and Software Templates as later, separate phases rather than requiring a full simultaneous migration of everything on day one.

## Who's supposed to own and maintain a service's catalog-info.yaml file?

The team that owns the service itself — this is a deliberate design choice, since catalog-info.yaml lives in the service's own repository and is meant to evolve in the same pull requests as code changes, maintained by the people who actually know the current, accurate answer about that service.

## If a service has no catalog-info.yaml, does it just not appear in Backstage at all?

Correct — Backstage's catalog only knows about entities that have been registered (manually, or via discovery finding an actual catalog-info.yaml file). There's no automatic detection of "services that exist somewhere but were never declared to the catalog" — a genuinely unregistered service is simply invisible to Backstage until someone adds an entry for it.

## Is a Backstage instance secure by default, or does it require deliberate configuration?

It requires deliberate configuration — an unconfigured Backstage instance is fully open by default, meaning every authenticated user can view every catalog entity and run every Software Template, including ones that might provision real infrastructure. The permission framework exists specifically to let an organization define real access-control policies, but doing so is an active configuration step, not automatic.

## Can Backstage integrate with tools an organization already uses (CI/CD, monitoring, cost tracking)?

Yes — this is a core part of Backstage's value proposition via its plugin ecosystem. A large existing set of open-source plugins integrate common tools (GitHub Actions, Jenkins, Kubernetes, various monitoring/cost tools), and organizations can also build custom plugins for genuinely internal, bespoke tooling that has no existing off-the-shelf plugin.

## Does a Software Template guarantee the resulting project actually follows an organization's standards?

It significantly increases the likelihood, but isn't an absolute guarantee — a Template scaffolds the initial project structure correctly, but nothing prevents someone from later modifying the scaffolded project away from the standard afterward. Templates address the "starting point" problem well; ongoing adherence to standards is a separate, continuing concern templates alone don't fully solve.

## Why would an organization build a custom Backstage plugin instead of just using an existing internal tool as-is?

The value isn't necessarily replacing the existing internal tool's own functionality — it's surfacing that tool's relevant information directly within the unified Backstage portal, alongside everything else a developer already goes to Backstage for, rather than requiring developers to separately remember that tool exists and navigate to it independently.
