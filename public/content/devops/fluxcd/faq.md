# FluxCD — FAQ

## Do I need to know ArgoCD to learn FluxCD?

No — while this guide frequently compares the two (they're the two dominant GitOps tools), FluxCD's concepts stand on their own. Prior ArgoCD exposure helps mainly for contrast (understanding what FluxCD deliberately does differently, like having no UI), not as a prerequisite for understanding Flux's own CRD-driven model.

## Why does Flux have no UI at all — isn't that a real usability downside compared to ArgoCD?

It's a deliberate design choice, not an oversight — Flux is built for teams who want pure CLI/CRD-driven GitOps with nothing extra to maintain, and this guide frames it as the preference of platform teams specifically avoiding an additional web UI to secure, update, and operate. Whether that's a downside depends on your team's preferences — `flux get`/`flux check`/`kubectl describe` provide the same visibility a UI would, just via CLI rather than a dashboard.

## Why does my Kustomization show as reconciling successfully, but nothing actually changed in the cluster?

Check the `--path` the Kustomization points to — a successful reconciliation against an empty or unintended directory will report success (nothing was wrong with the reconciliation itself) while genuinely applying nothing, since there's nothing valid at that path to apply. This is a common early configuration mistake, not a Flux malfunction.

## Does Flux's image automation deploy directly to the cluster, or does it go through Git first?

Through Git first, always — this is what keeps the whole system GitOps-compliant. `ImageUpdateAutomation` commits the new image tag to your Git repository; the existing `Kustomization`/`HelmRelease` reconciliation loop then picks up that commit and applies it to the cluster, the same as any other Git change. Flux never bypasses Git to apply an image update directly.

## Is multi-tenancy in Flux just a convention, or is it actually enforced?

It's genuinely enforced by Kubernetes RBAC, when set up correctly — each tenant's `Kustomization` uses a scoped `ServiceAccount` with RBAC permissions limited to that tenant's own namespace/resources. This isn't a soft convention that trusts tenants to behave; a misconfigured or malicious manifest from one tenant genuinely cannot affect another tenant's resources if the RBAC scoping is correctly applied — though this should be actively tested, not just assumed correct because nothing has gone wrong yet.

## What happens if the Git repository Flux is watching becomes temporarily unreachable?

Flux's `source-controller` will report the `GitRepository` source as failing to fetch, and downstream `Kustomization`s will stop receiving new changes to reconcile — but existing, already-applied cluster state doesn't get torn down or reverted just because the source is temporarily unreachable. Once connectivity is restored, reconciliation resumes automatically from wherever Git currently stands.

## Is "Git as disaster recovery" a complete DR strategy for a cluster running Flux?

Only for what Flux actually manages declaratively — the configuration and deployed application manifests. Genuinely stateful components (a database's real data, a persistent queue's actual contents) were never in Flux's scope and need a separate, explicit backup/restore strategy. Treating "GitOps makes DR easy" as covering everything, including stateful data, is a real and common gap worth catching before an actual incident forces the discovery.

## Why would I need Flagger if Flux already reconciles Deployments automatically?

Flux's core reconciliation applies a full update to match Git — useful and reliable, but all-at-once, with no gradual rollout or automated rollback based on real production metrics. Flagger adds progressive delivery on top of that: gradually shifting traffic to a new version while monitoring error rate/latency, and automatically rolling back if those metrics degrade. It's a genuinely different capability layered on top of Flux's core reconciliation, not a replacement for it.
