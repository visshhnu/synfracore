# Backstage Key Notes

## Entity Kinds Quick Reference

| Kind | Represents |
|---|---|
| Component | A service, library, or website |
| API | An interface a Component exposes (REST/GraphQL/gRPC) |
| Resource | Infrastructure a Component depends on (DB, queue, bucket) |
| System | A logical grouping of related Components/APIs/Resources |
| Domain | A higher-level grouping of related Systems |
| Group | A team or organizational unit (owner) |
| User | An individual person |

## Minimal catalog-info.yaml

```yaml
apiVersion: backstage.io/v1alpha1
kind: Component
metadata:
  name: my-service
spec:
  type: service
  lifecycle: production
  owner: team-name
```

## Lifecycle Values

```
experimental  — early-stage, may change/be removed
production    — actively used in production
deprecated    — being phased out, don't build new dependencies on it
```

## Core Capabilities

| Capability | What It Does |
|---|---|
| Software Catalog | Structured entity model + ownership source of truth |
| Software Templates (Scaffolder) | Self-service project creation from golden-path templates |
| TechDocs | Docs-as-code (Markdown + MkDocs) rendered in-portal |
| Search | Unified search across catalog + docs + indexed plugin sources |
| Permission Framework | Access control for entities and template execution |

## Discovery vs. Manual Registration

```
Manual registration  — one entity at a time via the UI, doesn't
                        scale past a handful of services
Discovery             — a scheduled catalog processor scans repos
                        for catalog-info.yaml automatically
```

## Scaffolder Action Chain (typical)

```
fetch:template   — pull skeleton, substitute parameter values
publish:github    — create the actual repository
catalog:register  — auto-register the new project as a catalog entity
```

## Plugin Types

```
Frontend plugin — React module: pages, entity cards, sidebar items
Backend plugin  — server-side: API endpoints, catalog processors,
                   scheduled jobs
```
Most substantial plugins pair both.

## Default Security Posture

```
UNCONFIGURED Backstage = fully open by default -- every
authenticated user can view every entity and run every template.
The permission framework must be DELIBERATELY configured for
real access control.
```

## Key Gotcha: Catalog Data Quality

```
The catalog is only as valuable as its data is current. A
catalog-info.yaml never updated after a reorg, or a service with
no entry at all, silently undermines the "single source of truth"
premise -- ongoing process, not a one-time onboarding task.
```
