# Helm + Kustomize — PYQ (Previously Asked / Practice Questions)

**Framing note:** Helm (via CNCF) doesn't administer a proctored public certification with a leaked-question archive. What follows is built from this guide's own Overview/Intermediate/Advanced/Troubleshooting material, framed as practice questions grounded in real, documented Helm/Kustomize behavior.

---

### 1. (Domain: Core Concepts) What's the actual difference between a Chart and a Release, and why does this distinction matter?

**Answer:** A Chart is a package — a reusable, versioned template of Kubernetes YAML. A Release is a specific, running instance of that Chart, deployed with a specific set of values. The same Chart can be installed multiple times as separate Releases (a staging release and a production release, each with different `values.yaml` overrides), each independently tracked, upgraded, and rolled back — the distinction matters because "the chart" and "a specific deployment of the chart" are genuinely different things Helm manages separately.

---

### 2. (Domain: Release Management) What does Helm actually track that plain `kubectl apply` of the same rendered YAML wouldn't, and why does this matter for rollback?

**Answer:** Helm tracks a full release history — every previous version of a release's rendered manifests and values, stored in the cluster (as Secrets or ConfigMaps depending on the configured storage backend). This is what makes `helm rollback` possible as a first-class, reliable operation — reverting to exactly the previous release's known-good state — versus `kubectl apply`, which has no built-in history and would require manually reapplying a previously-saved YAML file with no guarantee it matches what was actually running.

---

### 3. (Domain: Templates) Why does this guide recommend `_helpers.tpl` for defining named templates rather than duplicating the same label block across every template file in a chart?

**Answer:** A duplicated label block (like standard `app.kubernetes.io/*` labels) repeated across every template file means any future change to that pattern requires editing every single file individually — a real maintenance burden and a source of inconsistency if one file gets updated and another is missed. `_helpers.tpl` centralizes the definition once, referenced from every template via `{{ include "chart.labels" . }}`, so a single change propagates consistently everywhere it's used.

---

### 4. (Domain: Helm vs Kustomize) A team has their own Kubernetes manifests (not distributed to anyone else) and just needs different configuration for dev/staging/prod. Would Helm or Kustomize be the more natural fit, and why?

**Answer:** Kustomize is generally the more natural fit for this specific case — it's built for patch-based overlays on plain YAML you already own, with no templating language or release-tracking overhead, and it's built into `kubectl` directly (`kubectl apply -k`). Helm's templating and release-management capabilities are more valuable when packaging something reusable and parameterized for distribution to others (or for genuinely complex, conditional templating logic) — for a single team's own environment-specific config variation, that overhead isn't necessarily justified.

---

### 5. (Domain: Values Precedence) A chart is installed with both a `-f custom-values.yaml` file and a `--set image.tag=v2` flag, and both set a value for the same key. Which one wins, and why does this matter operationally?

**Answer:** `--set` takes the highest precedence and wins over values provided via `-f`. This matters operationally because a CI/CD pipeline commonly uses `--set` to inject a dynamic, per-deploy value (like an image tag from the current build) on top of a more static `values.yaml`/`-f` file — understanding this precedence order is what makes that pattern reliable, and getting it backwards (assuming `-f` overrides `--set`) would cause confusing, hard-to-debug configuration mismatches.

---

### 6. (Domain: Troubleshooting) A `helm install` fails partway through, leaving some Kubernetes resources created and others not. What's the correct recovery approach, and why shouldn't you just retry the install directly?

**Answer:** Retrying `helm install` directly on a partially-failed release will likely fail again, since Helm sees a release already exists in a failed state and some resources may already exist in the cluster, conflicting with what a fresh install attempts to create. The correct approach is `helm rollback` (if a previous good state exists) or `helm uninstall` to clean up the failed release entirely before attempting a fresh install — addressing the partial state explicitly rather than blindly retrying against it.

---

### 7. (Domain: Debugging Templates) Before running `helm install`, how can you inspect exactly what Kubernetes YAML a chart will actually generate, without applying anything to the cluster?

**Answer:** `helm template` renders the chart's templates with the given values and outputs the resulting YAML directly, without installing anything — this is the direct way to inspect and debug what a chart actually produces, catching templating errors or unexpected output before committing to a real install. This is distinct from `helm install --dry-run`, which also validates against the actual cluster API but similarly makes no real changes.

---

### 8. (Domain: Secrets) Why shouldn't sensitive values (database passwords, API keys) be placed directly in a chart's `values.yaml`, even in a private repository?

**Answer:** `values.yaml` committed to a chart's repository persists the plaintext secret in Git history, visible to anyone with repository access — a real, avoidable exposure risk. Production-appropriate patterns use a secrets-management integration (Sealed Secrets, SOPS, or an external-secrets operator pulling from a dedicated secrets store) so sensitive values are encrypted at rest in version control or injected at deploy time from a secure external source, rather than living in plaintext in the same repository as the rest of the chart configuration.

---

### 9. (Domain: CI/CD Integration) Why is `helm upgrade --install` commonly used in CI/CD pipelines instead of separately handling "is this a first install or an upgrade" logic?

**Answer:** `helm upgrade --install` is idempotent with respect to release existence — it installs the release if it doesn't already exist, or upgrades it if it does, in a single command. This removes the need for a pipeline to maintain separate branching logic checking whether a release already exists before deciding which command to run, simplifying CI/CD pipeline logic for what would otherwise be two distinct code paths converging on the same practical outcome.

---

### 10. (Domain: Production Patterns) What does `helm diff` add on top of what `helm upgrade --dry-run` already provides, and why does this matter for a production deployment?

**Answer:** `helm diff` (a plugin, not built into core Helm) shows the actual, specific field-by-field difference between the currently-deployed release and what a proposed upgrade would produce — closer to Terraform's `plan` output than `--dry-run`'s validation-focused output. For a production deployment, seeing precisely what will change (not just confirming the new manifests are valid) is what lets a team catch an unintended change before it's applied, the same review discipline this guide's other IaC-adjacent tools (Terraform) apply to infrastructure changes generally.
