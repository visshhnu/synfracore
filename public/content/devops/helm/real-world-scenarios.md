# Helm + Kustomize — Real World Scenarios

A note on framing: all three scenarios below are illustrative/composite — common, well-documented patterns from production Helm usage industry-wide, not one specific traceable company's incident.

---

## Scenario 1 (illustrative/composite): The rollback that didn't actually roll back the database migration

**The pattern:** A production deployment introduces a bug, and the team responds quickly with `helm rollback` to the previous release — the Kubernetes resources (Deployments, ConfigMaps, Services) revert correctly to their prior configuration, and the application's pods come back to the previous version. However, the release being rolled back had included a database schema migration as part of its deployment process (run via a Helm hook), and that migration's changes remain applied to the database — the rolled-back application code now runs against a database schema it doesn't expect, causing a new, different set of errors than the original bug.

**Why this is a genuinely easy trap, not an oversight in the rollback process itself:** `helm rollback` does exactly what it's designed to do — revert the Kubernetes-managed resources to their previous state. Database migrations, especially schema changes, are fundamentally different: they're typically one-directional, stateful changes to an external system Helm doesn't track or manage as part of its release history. The mental model "rollback undoes the deployment" is true for the Kubernetes-native resources but doesn't extend to side effects (like a migration) the deployment process triggered but that live outside what Helm actually tracks.

**What actually prevents this:**
- **Treat any database migration as requiring an explicit, separate rollback plan**, distinct from the Helm release rollback — a migration's `down` script (if the migration tooling supports one) needs to be run deliberately, not assumed to happen automatically as part of `helm rollback`.
- **Design migrations to be backward-compatible with the previous application version whenever feasible** — a migration that adds a new, optional column is generally safer than one that removes or renames an existing one the previous code version still expects, specifically because it tolerates a rollback without requiring a corresponding migration reversal.
- **Document, for every chart with migration hooks, exactly what `helm rollback` does and doesn't cover** — making explicit, in the chart's own documentation, that Kubernetes resource rollback and any external side effects (migrations, external API calls triggered by hooks) are separate concerns requiring separate handling.

---

## Scenario 2 (illustrative/composite): The `--set` override that silently won a fight nobody knew was happening

**The pattern:** A team's CI/CD pipeline uses `--set image.tag=${BUILD_TAG}` to inject the current build's image tag on every deploy, layered on top of a `values.yaml` file also maintained by the team for general chart configuration. During an unrelated cleanup, someone updates `values.yaml` to also explicitly set `image.tag` to a specific, intentional default value — not realizing the CI pipeline's `--set` flag would always override it anyway. The `values.yaml` change appears to have no effect in practice (deploys still use the CI-injected build tag), causing real confusion during a later investigation into why a "fixed" default tag wasn't actually being used.

**Why this precedence behavior is easy to overlook:** both `values.yaml` and `--set` are legitimate, commonly-used ways to configure a Helm release, and without deliberately internalizing Helm's specific precedence order (`--set` wins over `-f`/`values.yaml`), it's reasonable to assume the more recently or more deliberately edited source (the `values.yaml` file someone just updated) would take effect. The actual precedence rule is a specific, memorizable fact about Helm's behavior, not something intuitive from general configuration-management experience with other tools.

**What actually addresses this:**
- **Document Helm's actual precedence order explicitly wherever a team's charts use both `--set` and `-f`/`values.yaml` together** — this guide's own reference material (`--set` has highest precedence) is exactly the fact that would have prevented this confusion, if it had been front-of-mind for whoever made the `values.yaml` change.
- **Minimize the number of values set via both mechanisms simultaneously** — if `image.tag` is always going to be CI-injected via `--set`, consider not also setting a default for it in `values.yaml` at all, removing the possibility of the two sources appearing to conflict.
- **Use `helm get values <release>` to inspect the actual, effective values a running release was deployed with**, cutting through any uncertainty about which source actually took effect, rather than reasoning about it from the configuration files alone.

---

## Scenario 3 (illustrative/composite): The chart upgrade that looked clean in `--dry-run` but broke a stateful workload

**The pattern:** A team runs `helm upgrade --dry-run` before a production change, confirms the output shows no errors, and proceeds with the real upgrade. The upgrade succeeds without error, but shortly after, a StatefulSet-backed database component becomes unavailable — the chart update had changed a field on the StatefulSet's Pod template that Kubernetes doesn't support updating in-place for StatefulSets, forcing Kubernetes to delete and recreate the pods, which briefly took the database offline in a way the team hadn't anticipated or planned a maintenance window around.

**Why `--dry-run` passing gave false confidence here:** `--dry-run` validates that the rendered manifests are syntactically valid and can be submitted to the Kubernetes API without error — it doesn't simulate or warn about downstream *behavioral* consequences of applying those manifests, like a StatefulSet field change forcing pod recreation. The distinction between "this YAML is valid and will be accepted" and "here's what will actually happen operationally when applied" is a real gap `--dry-run` doesn't close, similar in spirit to Terraform's plan output actually showing a forced-replacement action explicitly, which `helm --dry-run` doesn't have an equivalent for by default.

**What actually addresses this:**
- **Use `helm diff` (or an equivalent tool) rather than relying on `--dry-run` alone for changes to stateful workloads specifically** — `helm diff` shows the actual field-by-field difference against the currently-running release, which is closer to surfacing "this field change may force pod recreation" than dry-run's validation-only output.
- **Treat any change touching a StatefulSet's Pod template as requiring explicit research into whether Kubernetes will accept it in-place or force replacement**, since this is a genuinely well-documented Kubernetes-level constraint independent of Helm — the same rigor this guide's Terraform material recommends for checking whether a resource attribute change forces replacement.
- **Schedule a maintenance window for any stateful workload upgrade with genuine uncertainty about in-place vs. forced-recreation behavior**, rather than assuming a clean `--dry-run` result means zero operational risk — the tooling's validation passing and the change being operationally safe are two different claims.
