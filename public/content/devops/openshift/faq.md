# OpenShift OCP 4.x — FAQ

## Is OpenShift just Kubernetes with a different name, or are there real technical differences?

Real technical differences, not just branding. OCP replaces Ingress with Routes (HAProxy-based, with three TLS termination modes), replaces PodSecurityPolicy with Security Context Constraints, ships a built-in image registry, and adds `oc`, a CLI that's a superset of `kubectl` with OCP-specific commands. It also bundles CI/CD, monitoring, a web console, and an OAuth server that vanilla Kubernetes leaves as separate installs.

## Why do I get "unable to validate against any security context constraint" and what shouldn't I do to fix it?

It means the pod's ServiceAccount hasn't been granted an SCC that permits whatever security context the pod is requesting. The fix is adding an appropriately scoped SCC to the ServiceAccount — commonly `anyuid` for a legacy app needing a fixed non-root UID. What you shouldn't do is default to the `privileged` SCC just because it resolves the error for almost any pod — it grants far broader privilege than most workloads actually need and should never be used in production.

## What's the practical difference between Route TLS modes: Edge, Passthrough, and Re-encrypt?

Edge terminates TLS at the router, with plain HTTP onward to the pod. Passthrough carries TLS all the way to the pod, meaning the router cannot inspect the traffic at all. Re-encrypt terminates TLS at the router, then re-encrypts with a new certificate on the way to the pod. Choose based on whether the router needs visibility into the traffic (Edge/Re-encrypt) or the pod itself must handle the original TLS session end-to-end (Passthrough).

## Why does OCP have an "Infrastructure" node type in addition to Control Plane and Worker?

Specifically to isolate platform components (Ingress, Registry, Monitoring) onto separately-licensed nodes, reducing the subscription cost that would otherwise apply if those components ran on standard Worker nodes. It's a licensing/cost-management distinction as much as a technical one.

## What actually happens when I apply a MachineConfig change?

The Machine Config Operator triggers a rolling drain and reboot of every node in the affected MachineConfigPool — this happens for any MachineConfig change, regardless of how minor the underlying config value seems, since it's an OS-level change that requires an actual node restart to take effect. Treat every MachineConfig change as carrying this operational impact and schedule it accordingly, rather than assuming a small config value means a small operational footprint.

## Should I use Automatic or Manual approval strategy for an Operator Subscription?

Manual for any Operator that other workloads directly depend on (via its CRDs or API) — an Operator upgrade can introduce breaking changes, and Manual gives you control over exactly when that upgrade is applied, letting you review release notes first. Automatic is reasonable for Operators with no dependents, where staying current automatically carries little risk. The deciding factor isn't convenience preference — it's whether something else in the cluster depends on this Operator's current behavior.

## What's the difference between CVO and MCO?

CVO (Cluster Version Operator) manages upgrades to OpenShift itself — the platform version. MCO (Machine Config Operator) manages OS-level configuration on the underlying nodes via MachineConfig objects — kernel arguments, systemd units. CVO answers "what version of OCP is this," MCO answers "what's configured at the OS level on each node."

## Why does `oc new-project` create both a Namespace and a Project?

Project is an OCP-specific abstraction on top of the underlying Kubernetes Namespace, layering on OCP-specific metadata and access controls. `oc new-project` creates both together so the result is immediately usable with OCP's own tooling and permission model, not just as a bare namespace missing OCP-specific capabilities.

## Is `oc set image` enough to confirm a deployment succeeded?

No — it only submits the change and returns as soon as it's accepted, before the rollout has actually completed. `oc rollout status` is what blocks and reports the real, live progress of the rollout — always check it rather than assuming success from `oc set image` returning without error.
