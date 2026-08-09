# Istio / Service Mesh — FAQ

## Does Istio require any changes to my application code?

No — that's the core value proposition of the sidecar model. The Envoy sidecar injected alongside every pod handles mTLS, retries, circuit breaking, and telemetry entirely at the network layer, transparently. Your application keeps making normal network calls exactly as before; it never needs to know a mesh exists underneath it at all.

## Why would I choose Istio over Linkerd, given Istio's higher operational complexity?

When you actually need Istio's richer feature set — advanced traffic-shaping (fine-grained weighted routing, fault injection, mirroring), multi-cluster mesh federation, or deep integration with a broader Envoy-based ecosystem. Linkerd is deliberately simpler and lighter (a Rust-based proxy, lower per-pod resource overhead), which is the better fit if your actual needs are mostly mTLS and basic observability without heavy investment in advanced traffic-management features. Choosing Istio without needing its fuller feature set means paying its full operational complexity for capabilities you won't use.

## What's the real difference between STRICT and PERMISSIVE mTLS mode?

STRICT rejects any non-mTLS traffic outright — only mesh-authenticated mTLS traffic is accepted. PERMISSIVE accepts both plaintext and mTLS simultaneously, which is why it's the correct first step in any production migration: it lets you confirm every service actually has a sidecar and mTLS is genuinely flowing before cutting off plaintext entirely with STRICT and risking breaking a service that was missed.

## I labeled my namespace for sidecar injection — why do my existing pods still not have a sidecar?

Namespace labeling (`istio-injection=enabled`) only affects pods created *after* the label is applied — injection happens via an admission webhook at pod-creation time, not as a retroactive background process. Existing pods need to be recreated, typically via `kubectl rollout restart`, to actually receive the sidecar.

## What's the difference between a DestinationRule and a VirtualService?

`DestinationRule` defines what subsets exist within a service, grouping pods by label (e.g., `version: v1` vs `version: v2`) into named subsets. `VirtualService` defines the actual routing logic — how traffic gets split across those subsets. They're complementary and both required together: `DestinationRule` answers "what groups exist," `VirtualService` answers "how traffic reaches them."

## How does Istio's circuit breaker work without any application-level retry code?

`outlierDetection`, configured on a `DestinationRule`, monitors real response codes from each backend at the mesh layer. Once a backend returns enough consecutive errors (e.g., `consecutive5xxErrors: 3`), it's automatically ejected from the load-balancing pool for a configured `baseEjectionTime` — entirely inside the Envoy sidecar's configuration, with zero application code involved.

## What does a SPIFFE identity actually give me that a pod's IP address doesn't?

A cryptographically verifiable answer to "which service is this, really." A pod's IP can change as it's rescheduled and offers no proof of identity at all — it's just a network address. A SPIFFE identity is issued automatically by Istio's built-in Certificate Authority and is what makes zero-trust policy actually meaningful, since access decisions can be based on verified identity rather than a spoofable address.

## `istioctl proxy-status` vs `istioctl analyze` — when do I use each?

`proxy-status` checks whether every Envoy sidecar in the mesh is currently in sync with `istiod`'s latest configuration — the tool for diagnosing a specific proxy running stale config. `analyze` scans your actual configuration objects (VirtualServices, DestinationRules, PeerAuthentications) for common misconfigurations and conflicts before they cause a runtime problem. Use proxy-status for sync-health issues, analyze for configuration-correctness issues.

## Does the control plane being briefly unavailable break existing mesh traffic?

No — the data plane (the fleet of Envoy sidecars actually enforcing policy) keeps functioning on whatever configuration it last received, even if `istiod` (the control plane) is briefly down. What you lose during a control-plane outage is the ability to distribute new configuration updates, not existing traffic enforcement — this separation between control and data plane is a deliberate architectural choice, not an accident.
