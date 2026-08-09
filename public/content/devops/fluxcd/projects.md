# FluxCD — Portfolio Projects

Build these 3 projects to prove FluxCD mastery. Each includes code, architecture, and interview talking points.

---

## Project 1: Bootstrap and First GitOps Deployment

**Level:** Beginner | **Time:** 1 day | **GitHub:** `fluxcd-first-gitops-deploy`

**What you build:** A bootstrapped cluster with a real application deployed entirely through the Git → cluster reconciliation loop, with no manual `kubectl apply`.

### Repository structure
```
gitops-fleet/
  clusters/production/
    flux-system/           # Created automatically by flux bootstrap
    apps/
      test-app/
        deployment.yaml
        service.yaml
        kustomization.yaml
```

### Kustomization CRD
```yaml
apiVersion: kustomize.toolkit.fluxcd.io/v1
kind: Kustomization
metadata: { name: test-app, namespace: flux-system }
spec:
  interval: 1m
  path: "./clusters/production/apps/test-app"
  prune: true
  sourceRef: { kind: GitRepository, name: gitops-fleet }
```

### Interview points
- The entire deployment happens by committing to Git, not by running `kubectl apply` directly — the cluster's actual state is a downstream effect of Git, not something modified out-of-band
- `prune: true` — Flux removes resources from the cluster that were removed from Git, keeping cluster state a genuine mirror of the repo, not just additive
- Explaining the reconciliation loop concretely: source-controller polls Git on `interval`, kustomize-controller applies what it finds, and `flux get kustomizations` shows the current sync status

### Steps
1. Bootstrap Flux onto a local or cloud cluster
2. Add a real application manifest under the bootstrapped repo's path
3. Confirm it deploys automatically within the configured interval, without manual `kubectl apply`
4. Delete a resource directly with `kubectl delete` and confirm Flux restores it on the next reconciliation — demonstrating Git as the actual source of truth
5. Document the full reconciliation loop, with real `flux get` output, in the README

---

## Project 2: Image Automation Pipeline

**Level:** Intermediate | **Time:** 2-3 days | **GitHub:** `fluxcd-image-automation`

**What you build:** A full image-automation pipeline where Flux detects a new container image tag pushed to a registry and automatically commits the updated tag back to Git.

### Image automation CRDs
```yaml
apiVersion: image.toolkit.fluxcd.io/v1beta2
kind: ImageRepository
metadata: { name: my-app }
spec:
  image: myregistry/my-app
  interval: 5m
---
apiVersion: image.toolkit.fluxcd.io/v1beta2
kind: ImagePolicy
metadata: { name: my-app }
spec:
  imageRepositoryRef: { name: my-app }
  policy: { semver: { range: ">=1.0.0" } }
---
apiVersion: image.toolkit.fluxcd.io/v1beta1
kind: ImageUpdateAutomation
metadata: { name: my-app-auto }
spec:
  sourceRef: { kind: GitRepository, name: gitops-fleet }
  git:
    commit:
      author: { email: fluxbot@example.com, name: fluxbot }
  update: { path: "./clusters/production/apps/my-app", strategy: Setters }
```

### Interview points
- This is the specific mechanism that closes the loop between CI (which builds and pushes a new image) and CD (which deploys it) without a CI system needing direct cluster credentials — CI's job ends at pushing an image tag; Flux's image-automation controller does the rest
- `ImagePolicy`'s semver range is what prevents auto-deploying an unintended major-version bump — a real, deliberate safety constraint, not an afterthought
- Explaining that Flux commits *back to Git* (not directly to the cluster) for the tag update is the detail that makes this still genuinely GitOps — the audit trail lives in Git history, not just in cluster state

### Steps
1. Set up a container registry and push at least two tagged versions of a test image
2. Configure `ImageRepository` and `ImagePolicy` with a semver constraint
3. Configure `ImageUpdateAutomation` and confirm a new matching image tag triggers a real Git commit
4. Push a new image tag and observe the full loop: registry → detection → Git commit → reconciliation → deployment
5. Document the Git commit history showing Flux's own automated commits in the README

---

## Project 3: Multi-Tenant GitOps With Prometheus Observability

**Level:** Advanced | **Time:** 3-4 days | **GitHub:** `fluxcd-multi-tenant-observability`

**What you build:** A multi-tenant Flux setup with separate teams' Kustomizations isolated from each other, plus Prometheus metrics on reconciliation health.

### Multi-tenant sharding pattern
```yaml
apiVersion: kustomize.toolkit.fluxcd.io/v1
kind: Kustomization
metadata: { name: team-a-apps, namespace: flux-system }
spec:
  interval: 1m
  path: "./tenants/team-a"
  prune: true
  sourceRef: { kind: GitRepository, name: gitops-fleet }
  serviceAccountName: team-a-reconciler   # Scoped RBAC per tenant
```

### Prometheus ServiceMonitor for Flux controllers
```yaml
apiVersion: monitoring.coreos.com/v1
kind: ServiceMonitor
metadata: { name: flux-system }
spec:
  selector: { matchLabels: { app: source-controller } }
  endpoints: [{ port: http-prom }]
```

### Interview points
- `serviceAccountName` scoping per-tenant Kustomization is the concrete RBAC mechanism that prevents Team A's Git commits from being able to affect Team B's namespace — multi-tenancy enforced at the reconciliation layer, not just by convention
- Explaining Flux's own DR story: since Git is the source of truth, restoring a lost cluster is "bootstrap Flux against the same Git repo again," not restoring from a separate backup system
- Reconciliation-failure metrics (a Kustomization stuck in a failed state) as an actual production alerting signal, not something only noticed by manually checking `flux get`

### Steps
1. Set up at least two tenant directories with separate service accounts and RBAC scoping
2. Confirm Team A's reconciler genuinely cannot apply changes to Team B's namespace (test this directly, don't just assume the RBAC is correct)
3. Deploy Prometheus and scrape Flux controller metrics
4. Build one alert rule on reconciliation failure (a Kustomization stuck in a non-ready state for longer than its interval)
5. Document, in the README, how you'd actually recover this cluster from scratch using only the Git repo — and if possible, test it against a fresh cluster

---

## Portfolio Checklist
- [ ] All repos public on GitHub with clear READMEs
- [ ] README includes the bootstrap command used and how to reproduce the setup
- [ ] Can explain the pull-based GitOps reconciliation loop end-to-end without notes in an interview
- [ ] Project 2's Git commit history shows Flux's own automated commits, not just manual ones
- [ ] Project 3's multi-tenancy RBAC isolation is demonstrated with a real cross-tenant access attempt, not just described
