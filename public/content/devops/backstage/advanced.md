# Backstage Advanced — Permissions, Custom Plugins & Scaling

## The Permission Framework

```typescript
// Simplified conceptual illustration -- real permission policies
// are TypeScript, evaluated by the backend permission framework
export const scaffolderTemplatePermission = createPermission({
  name: 'scaffolder.template.use',
  attributes: { action: 'use' },
});

// A policy might restrict which templates a user can run based
// on their team membership, or restrict certain infrastructure-
// provisioning templates to a specific, smaller group
```

By default, a Backstage instance with no permission policy configured is fully open — every authenticated user can view every catalog entity and run every Software Template. The permission framework lets an organization define real policies: perhaps only a platform team can run a template that provisions cloud infrastructure, or certain sensitive catalog entities are only visible to specific groups. This matters genuinely — an unconfigured, fully-open Backstage instance in an organization with real access-control requirements is a real gap, not a safe default to leave in place indefinitely.

## Custom Plugin Development

```
A frontend plugin is a React application module, registered into
Backstage's plugin system, that can:
  - Add new routes/pages
  - Add cards/tabs to existing entity pages
  - Add sidebar navigation items

A backend plugin registers into Backstage's backend, exposing:
  - New REST API endpoints
  - Custom catalog PROCESSORS (extending how entities are
    discovered/enriched beyond the built-in providers)
  - Scheduled/background tasks
```

Backstage's plugin architecture is deliberately designed for genuine extensibility — an organization's internal tools (a custom deployment dashboard, a cost-visibility system, an internal feature-flag management UI) can be surfaced as first-class Backstage plugins, appearing alongside the built-in catalog/scaffolder/docs experience rather than living as separate, disconnected internal tools developers have to remember exist and separately navigate to.

## The New Backend System

```typescript
// Modern Backstage backend initialization (the "new backend system")
import { createBackend } from '@backstage/backend-defaults';

const backend = createBackend();
backend.add(import('@backstage/plugin-catalog-backend/alpha'));
backend.add(import('@backstage/plugin-scaffolder-backend/alpha'));
backend.start();
```

Backstage's backend architecture evolved toward a more modular system where backend plugins are composed via explicit `backend.add()` registration rather than the older, more monolithic backend setup — this modularity is what makes selectively enabling/disabling backend capabilities, and building custom backend plugins that integrate cleanly, meaningfully more straightforward than in earlier Backstage versions.

## Multi-Tenancy and RBAC Patterns

```
Common enterprise pattern: different Groups (teams) see a
CUSTOMIZED view -- their own owned entities prominently, with
appropriate visibility/edit permissions scoped to what they
actually own, while still being able to DISCOVER other teams'
services (read access) for cross-team integration purposes.
```

A common real design tension: fully open visibility (everyone sees everything) supports the catalog's core discovery value ("what services exist, who owns them") but may expose more detail than appropriate for genuinely sensitive systems; fully locked-down visibility (each team only sees their own) undermines the cross-team discovery value that's much of Backstage's point in the first place. Most real deployments land somewhere in between — broad read visibility for discovery, with write/administrative permissions scoped more tightly per team.

## Scaling Considerations

```
Catalog processing -- entity refresh happens on a SCHEDULE
  (configurable frequency), not instantaneously on every source
  change -- a large catalog (thousands of entities) has real
  processing-time considerations for how quickly changes propagate

Database -- Backstage's catalog persists to a real database
  (PostgreSQL is the standard production choice) -- catalog size
  and processing frequency both factor into real capacity planning
  at organizational scale
```

At genuine enterprise scale (thousands of services across a large organization), catalog processing frequency becomes a real, tunable tradeoff — more frequent refresh means catalog data reflects reality faster, at the cost of more processing load; less frequent refresh reduces load at the cost of the catalog potentially lagging behind recent changes for longer.

## Backstage vs. Building a Custom Internal Portal

```
Building custom: full control, but genuinely hard problems
  (a real entity-relationship model, a templating/scaffolding
  engine, a plugin architecture) get reinvented from scratch

Adopting Backstage: a mature, CNCF-graduated foundation with
  a large existing plugin ecosystem -- but requires learning
  Backstage's own conventions, and it's a real application to
  operate (database, backend, frontend), not a SaaS sign-up
```

This is a genuine build-vs-adopt tradeoff, not a clear-cut answer either direction — an organization with very unusual, deeply specific portal requirements might have real reasons to build custom; most organizations benefit from Backstage's existing solved problems (the catalog model, the plugin ecosystem, ongoing community development) outweighing the cost of learning its conventions.

## Try It (2 Minutes)

Using the permission framework section above:

1. By default, with no permission policy configured, can any authenticated Backstage user run any Software Template, including one that provisions real cloud infrastructure?
2. Why might an organization want broad READ visibility across the catalog even while restricting WRITE/administrative actions per team?
3. What's the tradeoff of increasing catalog processing frequency at large scale?

You should land on: yes — an unconfigured Backstage instance is fully open by default, which is a real gap worth addressing deliberately for organizations with genuine access-control requirements, not a safe default to leave indefinitely; broad read visibility supports the catalog's core cross-team discovery value ("what services exist, who owns them") which is much of Backstage's point, while restricting write/administrative actions protects against unintended or unauthorized changes to entities/templates a team doesn't own; more frequent processing means catalog data reflects reality faster but at the cost of more processing load — a real tunable tradeoff, not a free improvement in either direction.
