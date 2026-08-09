# ArgoCD — FAQ

## Does ArgoCD replace my CI pipeline entirely, or does it work alongside one?

Alongside — ArgoCD specifically handles the CD (continuous deployment) side, pulling from Git and reconciling the cluster to match. Your CI pipeline (Jenkins, GitHub Actions, GitLab CI) still handles building, testing, and pushing images/manifests to Git — ArgoCD picks up from there. The key architectural shift is that CI no longer needs direct cluster credentials to deploy; it just needs to update Git, and ArgoCD (running inside the cluster) handles the actual apply.

## Why does ArgoCD sometimes not automatically fix a manual change I made directly to the cluster?

Check whether `selfHeal` is enabled on that Application — without it, ArgoCD detects the drift and marks the Application `OutOfSync`, surfacing it for a human to review, but doesn't automatically revert it. `selfHeal: true` is what makes ArgoCD automatically revert drift back to match Git; many teams deliberately leave it off in production specifically so an emergency manual fix isn't silently undone before it's also properly committed to Git.

## If I delete a resource's manifest from my Git repo, does ArgoCD delete it from the cluster automatically?

Not by default — ArgoCD's standard behavior only adds and updates resources to match Git; it doesn't infer that a resource's absence from Git means it should be deleted, since deletion is more destructive and risky than adding or updating. You need `prune: true` set explicitly for "removed from Git" to actually mean "deleted from the cluster" — without it, a deleted manifest leaves the corresponding resource orphaned in the cluster, still running but no longer tracked.

## What's the actual difference between an Application showing "Synced" and showing "Healthy"?

They're two genuinely separate signals. Synced means the live cluster state matches exactly what's declared in Git. Healthy means the resource is actually functioning correctly (a Deployment's pods passing readiness checks, for instance). A resource can be Synced but not Healthy — the Git-declared configuration might itself have a problem (a bad image tag, insufficient resources) that causes the correctly-deployed resource to still fail. Always check both, not just Sync Status alone.

## Why would a shared ArgoCD instance need `AppProject` at all — can't RBAC alone handle multi-team access control?

`AppProject` is specifically what scopes which Git repos, clusters, and namespaces a given team's Applications are allowed to reference — this is a genuinely different concern from general RBAC (who can log into ArgoCD and what UI actions they can perform). Without `AppProject` scoping, a team with permission to create Applications at all could potentially point an Application at any repo or namespace, including another team's — `AppProject` is the mechanism that actually contains that risk in a genuinely shared, multi-tenant ArgoCD instance.

## Is manual sync policy less "GitOps" than automated sync?

Not really — both are legitimate GitOps patterns; the difference is purely about how quickly a Git change takes effect in the cluster. Automated sync applies changes as soon as they're detected, closer to continuous deployment; manual sync requires an explicit human click before applying, adding a deliberate review checkpoint. Neither violates GitOps principles (Git remains the source of truth either way) — it's a genuine tradeoff between deployment velocity and an extra safety gate, and different environments commonly choose differently.

## Why is rolling back under ArgoCD as simple as `git revert`, when a traditional pipeline rollback often isn't?

Because ArgoCD continuously reconciles the cluster to match whatever Git currently shows — reverting the bad commit means Git now reflects the previous, known-good state, and ArgoCD picks that up and re-applies it automatically. A traditional pipeline rollback requires finding and re-running an old pipeline job, with no guarantee it still executes correctly against however the cluster's actual state has since diverged — GitOps rollback is simpler specifically because the reconciliation loop, not a one-time pipeline run, is what's actually applying the change.

## Does ArgoCD require every resource to be re-applied on every sync, even ones that haven't changed?

By default, standard sync can touch every resource in an Application on each sync operation. `ApplyOutOfSyncOnly` (a SyncOption) restricts this to only resources that are actually out of sync with Git, skipping already-correct ones — useful for large Applications with many resources, where re-applying everything unnecessarily on every sync adds real overhead without any benefit for resources that were already correct.
