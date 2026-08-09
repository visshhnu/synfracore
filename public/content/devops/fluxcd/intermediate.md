# FluxCD — Intermediate

## Notifications — Alert and Provider CRDs

Reconciliation failures are only useful if someone actually sees them — Flux's `Provider` and `Alert` CRDs wire reconciliation events (success, failure, specific event types) to external systems, the same role `notification-controller` plays in the overall architecture, configured declaratively rather than through a UI:

```yaml
apiVersion: notification.toolkit.fluxcd.io/v1beta3
kind: Provider
metadata:
  name: slack-platform-alerts
  namespace: flux-system
spec:
  type: slack
  channel: platform-alerts
  secretRef:
    name: slack-webhook-url
---
apiVersion: notification.toolkit.fluxcd.io/v1beta3
kind: Alert
metadata:
  name: production-kustomizations
  namespace: flux-system
spec:
  providerRef:
    name: slack-platform-alerts
  eventSeverity: error            # only alert on failures, not every successful sync
  eventSources:
    - kind: Kustomization
      name: '*'
      namespace: production
```

Scoping `eventSources` to a specific namespace and `eventSeverity: error` (rather than every reconciliation event, success included) is what keeps this useful rather than noisy — alerting on every successful sync in a cluster reconciling every few minutes produces channel noise nobody reads, which defeats the purpose.

## Post-Build Variable Substitution

Hardcoding environment-specific values (a replica count, an image tag, a domain name) directly into manifests defeats the point of using the same base manifests across dev/staging/production. Flux's `postBuild.substitute` (or `substituteFrom` for larger variable sets) injects values into a `Kustomization`'s output after Kustomize itself has run:

```yaml
apiVersion: kustomize.toolkit.fluxcd.io/v1
kind: Kustomization
metadata:
  name: production-apps
spec:
  postBuild:
    substitute:
      replica_count: "5"
      environment_name: "production"
    substituteFrom:
      - kind: ConfigMap
        name: production-vars
```

```yaml
# In the actual manifest being applied:
spec:
  replicas: ${replica_count}    # substituted at apply time from the Kustomization above
```

This keeps the base manifests genuinely identical across environments — only the `Kustomization` resource (and the ConfigMap it references) differs per environment, which is a meaningfully cleaner separation than maintaining parallel manifest trees per environment.

## Image Automation — the Full Pipeline

Overview covered the concept; the full mechanism chains three CRDs together: `ImageRepository` watches a container registry for new tags, `ImagePolicy` selects which tag actually qualifies (by semver range, regex, or alphabetical ordering), and `ImageUpdateAutomation` commits the selected tag back to Git — closing the loop so a new image build results in an automatic, auditable Git commit rather than a manual YAML edit:

```yaml
apiVersion: image.toolkit.fluxcd.io/v1beta2
kind: ImageRepository
metadata: { name: payment-service }
spec:
  image: registry.company.com/payment-service
  interval: 5m
---
apiVersion: image.toolkit.fluxcd.io/v1beta2
kind: ImagePolicy
metadata: { name: payment-service }
spec:
  imageRepositoryRef: { name: payment-service }
  policy:
    semver: { range: ">=1.0.0 <2.0.0" }   # only accept 1.x tags, never an accidental 2.x
---
apiVersion: image.toolkit.fluxcd.io/v1beta1
kind: ImageUpdateAutomation
metadata: { name: payment-service }
spec:
  sourceRef: { kind: GitRepository, name: gitops-repo }
  git:
    commit:
      author: { email: flux@company.com, name: "Flux Bot" }
  update:
    path: ./clusters/production
    strategy: Setters
```

The `semver` range constraint on `ImagePolicy` is what prevents a runaway auto-deploy — without it, image automation would happily deploy any new tag pushed to the registry, including an accidental major-version bump that was never meant to reach production automatically.

## `dependsOn` — Ordering Kustomizations

A `Kustomization` deploying an application that needs a CRD or namespace from another `Kustomization` to exist first needs explicit ordering — Flux doesn't infer dependencies from manifest content:

```yaml
apiVersion: kustomize.toolkit.fluxcd.io/v1
kind: Kustomization
metadata: { name: app-deployment }
spec:
  dependsOn:
    - name: infra-baseline   # won't reconcile until infra-baseline succeeds first
  sourceRef: { kind: GitRepository, name: gitops-repo }
  path: ./apps/payment-service
```

Without `dependsOn`, both Kustomizations reconcile independently and roughly in parallel — fine when there's no real ordering requirement, but a silent source of intermittent failures when one genuinely depends on resources the other creates.
