# Backstage Fundamentals — The Entity Model

**Analogy** — Backstage's catalog works like a well-maintained company org chart combined with a building directory, not just a flat list of names. It's not enough to know a service exists — you need to know who owns it, what it depends on, what larger system it belongs to, and what APIs it exposes to other services, the same way a useful org chart shows reporting relationships, not just a list of every employee's name.

## Entity Kinds

```
Component  — a piece of software: a service, a library, a website
API        — an interface a Component exposes (REST, GraphQL, gRPC, etc.)
Resource   — infrastructure a Component depends on: a database, a
             queue, an S3 bucket
System     — a logical grouping of related Components/APIs/Resources
             that together deliver some capability
Domain     — a higher-level grouping of related Systems
Group      — a team or organizational unit (an owner)
User       — an individual person
```

These aren't arbitrary categories — each kind has a defined purpose in the model, and the relationships BETWEEN them (a Component belongs to a System, a Component is owned by a Group, a Component provides an API) are what make the catalog genuinely useful for answering real questions ("what does team-payments own," "what depends on this API") rather than just being a flat, unstructured list.

## catalog-info.yaml — declaring an entity

```yaml
apiVersion: backstage.io/v1alpha1
kind: Component
metadata:
  name: payment-service
  description: Handles payment processing and refunds
  annotations:
    github.com/project-slug: myorg/payment-service
spec:
  type: service
  lifecycle: production
  owner: team-payments
  system: checkout
  providesApis:
    - payment-api
  dependsOn:
    - resource:payments-db
```

This file lives in the SERVICE's OWN repository — not in a separate, centrally-maintained database someone has to remember to update. This is a deliberate design choice: catalog metadata evolves alongside the code it describes, in the same pull requests, by the people who actually know the current, accurate answer (the team that owns the service), rather than depending on someone else maintaining a separate system in sync.

## Required Fields, and What Happens Without Them

```
Minimum viable Component entry:
  apiVersion, kind, metadata.name, spec.type, spec.lifecycle, spec.owner

Missing spec.owner specifically -- Backstage will still register
the entity, but "who owns this" (the question the catalog most
needs to answer) goes unanswered for that entry, undermining the
catalog's core value for that specific service
```

Backstage doesn't strictly enforce every field being meaningfully filled — a minimal entry with just enough to register still works — but a catalog full of entries missing genuinely important fields (especially owner) provides much less real value than the tooling itself might suggest is "working."

## Lifecycle Values

```
experimental  — early-stage, not yet production, may change/be removed
production    — actively used in production
deprecated    — still exists, being phased out, shouldn't be built upon
```

Lifecycle isn't just documentation — it's a real signal for anyone considering depending on a Component: building a new integration against a `deprecated` API is a decision worth making deliberately and knowingly, not accidentally because the catalog didn't clearly flag it.

## Catalog Discovery vs. Manual Registration

```bash
# Manual: register one entity's location explicitly
# (via the Backstage UI's "Register Existing Component" flow)

# Discovery: a catalog PROCESSOR configured to scan a whole
# GitHub org (or specific repos matching a pattern) for
# catalog-info.yaml files automatically, registering/updating
# entities without per-service manual action
```

Configuring discovery looks like this:

```yaml
# app-config.yaml -- discovery configuration
catalog:
  providers:
    github:
      myOrg:
        organization: 'my-org'
        catalogPath: '/catalog-info.yaml'
        schedule:
          frequency: { minutes: 30 }
```

For an organization with many services, discovery is the practical approach — manually registering dozens or hundreds of services one at a time doesn't scale, and more importantly, doesn't automatically stay current as new services are added or old ones removed the way scheduled discovery does.

## Try It (2 Minutes)

Using the entity kinds section above:

1. A Component's catalog-info.yaml lists `providesApis: [payment-api]`. What ENTITY KIND is `payment-api` itself, as a separate catalog entry?
2. Why does catalog-info.yaml live in the service's own repository rather than a centrally-maintained separate database?
3. What's the practical risk of a catalog with many entries that technically register successfully but are missing a meaningful `owner` field?

You should land on: an API entity — Components PROVIDE APIs, but the API itself is its own distinct entity kind with its own catalog entry; keeping it in the service's own repo means it evolves in the same PRs as the code it describes, maintained by the people who actually know the current accurate answer, rather than depending on a separate system staying in sync; the catalog technically "works" (entities register) while failing at its core purpose — answering "who owns this" — for exactly the entries where that question matters most.
