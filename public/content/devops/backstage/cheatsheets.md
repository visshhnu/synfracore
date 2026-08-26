# Backstage Quick Reference Cheatsheet

## Minimal Component Entity

```yaml
apiVersion: backstage.io/v1alpha1
kind: Component
metadata:
  name: my-service
  description: What this service does
spec:
  type: service
  lifecycle: production
  owner: team-name
  system: parent-system
  providesApis: [my-api]
  dependsOn: [resource:my-db]
```

## Entity Kinds

```
Component | API | Resource | System | Domain | Group | User
```

## Lifecycle Values

```
experimental   production   deprecated
```

## Discovery Config (app-config.yaml)

```yaml
catalog:
  providers:
    github:
      myOrg:
        organization: 'my-org'
        catalogPath: '/catalog-info.yaml'
        schedule:
          frequency: { minutes: 30 }
```

## Software Template Skeleton

```yaml
apiVersion: scaffolder.backstage.io/v1beta3
kind: Template
metadata:
  name: new-service
spec:
  parameters:
    - properties:
        name: { type: string }
        owner: { type: string }
  steps:
    - id: fetch
      action: fetch:template
      input: { url: ./skeleton }
    - id: publish
      action: publish:github
    - id: register
      action: catalog:register
```

## TechDocs Annotation

```yaml
metadata:
  annotations:
    backstage.io/techdocs-ref: dir:.
```

## New Backend System Initialization

```typescript
import { createBackend } from '@backstage/backend-defaults';
const backend = createBackend();
backend.add(import('@backstage/plugin-catalog-backend/alpha'));
backend.add(import('@backstage/plugin-scaffolder-backend/alpha'));
backend.start();
```

## Plugin Types Quick Match

```
Frontend plugin — pages, entity cards, sidebar items (React)
Backend plugin  — API endpoints, catalog processors, scheduled jobs
```

## Scaffolder Action Chain

```
fetch:template  →  publish:github  →  catalog:register
```
