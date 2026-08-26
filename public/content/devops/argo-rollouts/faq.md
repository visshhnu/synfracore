# Argo Rollouts — FAQ

## Do I need to replace all my Deployments with Rollouts?

No — only the ones where you actually want progressive delivery (canary/blue-green with analysis gates). A `Rollout` is a drop-in replacement for `Deployment`'s spec structure, so migrating is low-friction where you want it, but there's no requirement to convert every workload; a stateless internal tool with low blast-radius risk may not need the added complexity at all.

## Does Argo Rollouts require ArgoCD to work?

No — they're separate, independently useful tools. Argo Rollouts works on its own, triggered by any change to a Rollout's pod template (a new image tag applied via `kubectl`, a CI/CD pipeline, or any other mechanism). ArgoCD adds GitOps on top — Git as the source of truth, with ArgoCD syncing changes automatically — but Argo Rollouts' canary/blue-green mechanics function independently of whether ArgoCD is in the picture.

## Does Argo Rollouts require a service mesh like Istio?

No. Nginx Ingress, AWS ALB, Traefik, and other ingress controllers support weighted traffic splitting without a full service mesh. A service mesh (Istio, or an SMI-compliant mesh) provides more granular control — header-based routing, fault injection — but isn't a hard requirement for basic canary traffic shifting to work.

## What happens to in-flight requests when an automatic rollback triggers?

Existing established connections aren't forcibly terminated by Argo Rollouts itself — traffic weight for the canary is set back to 0, so new requests stop being routed to canary pods, and canary pods are scaled down according to normal Kubernetes pod termination (respecting `terminationGracePeriodSeconds` and any configured `preStop` hooks). Requests already in-flight to a canary pod at the moment of rollback follow the same graceful-shutdown behavior any pod termination would.

## Can I skip straight to 100% without going through canary steps?

Yes — `kubectl argo rollouts promote <name> --full` skips all remaining steps and analysis, going straight to 100%. This is a manual override for when a team is confident enough to bypass the remaining gradual steps; it forfeits whatever protection the skipped analysis steps would have provided, so it's a deliberate risk tradeoff, not a routine action.

## Why did my canary's `setWeight: 10` not actually send 10% of traffic to the new version?

Most likely: no traffic provider is configured (Istio, ALB, NGINX canary annotations, etc.). Without one, Argo Rollouts can still scale the canary/stable ReplicaSets according to the step schedule, but actual request routing falls back to basic Kubernetes Service load-balancing across whatever pods currently exist — an approximation, not the precise enforced percentage a configured traffic provider gives you.

## Is Argo Rollouts only for Kubernetes, or does it work elsewhere?

Kubernetes-only — it's a Kubernetes controller managing a custom resource (`Rollout`) and relies on Kubernetes-native mechanisms (ReplicaSets, Services) plus Kubernetes-ecosystem traffic providers (Istio, ALB Ingress Controller, etc.) for its traffic-shifting integrations.

## What's the difference between Argo Rollouts' Experiment and just running a canary with analysis?

An `Experiment` runs a temporary, separate set of baseline and canary pods specifically to compare metrics against each other over a defined duration, without ever touching the live Rollout's actual production traffic split. A canary's own analysis steps evaluate the real, in-progress rollout that IS currently receiving a percentage of live traffic. Use `Experiment` when you want controlled, isolated comparison before any real traffic exposure; use canary analysis when you're evaluating the actual live rollout as it happens.
