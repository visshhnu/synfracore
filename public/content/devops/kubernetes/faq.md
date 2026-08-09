# Kubernetes — FAQ

## Do I need to know Docker before learning Kubernetes?

Yes, and this guide is explicit about it — Kubernetes assumes you already understand images, containers, Dockerfiles, and basic `docker run`/`docker compose` workflows. Kubernetes is fundamentally about orchestrating containers across many machines; without a solid grasp of what a container actually is first, the orchestration concepts have nothing to build on. Do the Docker guide through at least Intermediate first if containers are new to you.

## Why does Kubernetes use "Pods" instead of just scheduling containers directly?

A Pod guarantees co-location — everything inside it always runs on the same machine, sharing a network address. Even though most Pods contain exactly one container, this abstraction is what Kubernetes actually schedules and manages as a single unit, and it provides the flexibility for genuinely multi-container Pods (a helper/sidecar process needing to sit right next to the main app) without needing an entirely different scheduling model for that less common case.

## What's actually different between Kubernetes and just running Docker Compose on a bigger machine?

Docker Compose coordinates multiple containers on one machine with no automatic recovery if that machine fails — a bigger machine doesn't change that single point of failure, it just raises how much load that one point of failure can handle before it fails. Kubernetes coordinates containers across many machines with automatic recovery built in, meaning a single machine dying becomes a non-event the cluster handles automatically, rather than a full outage.

## Why does `kubectl describe pod` matter more than just checking `kubectl get pods` when something's wrong?

`kubectl get pods` shows status (Running, Pending, CrashLoopBackOff) but not *why* — `kubectl describe pod` includes an Events section showing the actual scheduling or runtime reason (insufficient resources, an unsatisfied node selector, a failed health check, an image pull error). Relying on status alone means guessing at the cause; the Events section usually states it directly.

## My Service and Deployment both look correctly configured, but traffic isn't reaching the Pods. What am I missing?

Check whether the Service's `selector` labels actually match the Pods' current labels — this is a common, easy-to-miss mismatch, especially after any label change to the Deployment that isn't mirrored in the Service. `kubectl get endpoints <service-name>` directly shows whether the Service has any matched Pods at all; an empty list confirms this exact failure mode immediately.

## Why did my RBAC configuration work in one cluster/environment but fail with Forbidden errors in another, with identical manifests deployed?

RBAC grants often depend on more than just what's in your own application's manifests — a pre-existing, broader Role/ClusterRoleBinding in one cluster (common in less strictly configured staging environments) can incidentally cover a permission your service needs, while a more tightly-scoped production cluster has no equivalent grant. The fix is defining every RBAC requirement explicitly within your own deployed manifests, rather than relying on any cluster's pre-existing, possibly inconsistent broader grants.

## Is "add more Nodes" always the right response when Pods are stuck Pending?

Not necessarily — `Pending` can also result from unsatisfied scheduling constraints (a `nodeSelector` or affinity rule no available Node satisfies) or taints without matching tolerations, neither of which is fixed by adding more capacity if the new Nodes have the same gap. Always check `kubectl describe pod`'s Events section first to confirm the actual cause before assuming resource exhaustion and provisioning unnecessary additional capacity.

## What's the difference between what the Kubelet does and what the Scheduler does?

The Scheduler makes a one-time placement decision when a Pod is created — which Node it should run on. The Kubelet is a per-node agent that then actually starts and manages the containers for Pods assigned to its node, and continuously reports that node's and its Pods' status back to the control plane. The Scheduler decides where; the Kubelet does the actual running, on an ongoing basis, on that specific node.
