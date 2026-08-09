# Helm + Kustomize — FAQ

## Should I always use Helm, or is Kustomize sometimes the better choice?

It depends on the actual use case, not a universal preference. Helm's templating and release-tracking are most valuable for reusable, parameterized packages meant to be distributed and configured differently by different consumers (a chart others will install with their own values). Kustomize is a more natural fit when a team owns its own base manifests and just needs environment-specific overlay patches (dev/staging/prod variations) without needing a templating language or Helm's release-versioning overhead — it's built directly into `kubectl` for exactly this simpler case.

## Does `helm rollback` undo everything a deployment did, including database migrations?

No, and this is a real, common gap — `helm rollback` reverts the Kubernetes-managed resources (Deployments, ConfigMaps, Services) to their previous state, but has no awareness of external side effects a release's hooks may have triggered, like a database migration. A migration needs its own explicit rollback plan, separate from the Helm release rollback; assuming `helm rollback` handles this automatically is a real risk for any chart with migration hooks.

## Why did my `values.yaml` change seem to have no effect after I redeployed?

Check whether the value is also being set via `--set` on the command line (often the case in CI/CD pipelines injecting a build-specific value like an image tag) — `--set` takes precedence over values from a `-f`/`values.yaml` file. `helm get values <release>` shows the actual, effective values a running release was deployed with, cutting through any uncertainty about which source is actually taking effect.

## Is `helm install --dry-run` sufficient to confirm a chart upgrade is safe before applying it in production?

It confirms the rendered manifests are syntactically valid and will be accepted by the Kubernetes API — it doesn't simulate operational consequences like a StatefulSet field change forcing pod recreation, or other behavioral effects of the actual change. For anything touching stateful workloads or genuinely risky changes, `helm diff` (showing the actual field-by-field difference against the running release) provides more useful information than `--dry-run` alone.

## Why does this guide emphasize using `_helpers.tpl` instead of just writing the same labels directly in every template file?

Because duplicating the same block (like standard Kubernetes labels) across every template file in a chart means any future change requires editing every file individually, risking inconsistency if one gets missed. `_helpers.tpl` centralizes the definition once, referenced from every template — a single change then propagates consistently everywhere it's used, which matters more as a chart grows to include many template files.

## Is it ever acceptable to put a plaintext secret in `values.yaml` for a quick internal chart?

Generally not recommended even for internal use, since `values.yaml` committed to a repository persists the plaintext value in Git history indefinitely — a real exposure risk even in a private repo, especially once more people gain repository access over time than were originally intended to see the secret. Use a secrets-management integration (Sealed Secrets, SOPS, external-secrets) even for internal charts, rather than treating "it's just internal" as sufficient justification to skip proper secrets handling.

## What's the actual benefit of `helm upgrade --install` over separately scripting "install if new, upgrade if existing"?

It removes the need for a CI/CD pipeline to maintain its own branching logic checking release existence before deciding which command to run — `helm upgrade --install` is idempotent with respect to whether the release already exists, installing or upgrading as appropriate in a single command. This simplifies pipeline logic meaningfully, especially across many charts/services where writing that existence-check logic repeatedly would be real, avoidable duplication.

## If a `helm install` fails partway through, is it safe to just run `helm install` again?

Not directly — a partially-failed install can leave the release in a failed state with some resources already created, and simply retrying the same install command often fails again due to that leftover partial state. Use `helm rollback` (if reverting to a known-good previous state is possible) or `helm uninstall` to clean up the failed release explicitly first, before attempting a fresh install.
