# Istio / Service Mesh — PYQ (Previously Asked / Practice Questions)

**Framing note:** Istio (via CNCF) doesn't administer a proctored public certification with a leaked-question archive. What follows is built from this guide's own Overview/Fundamentals/Intermediate/Advanced/Troubleshooting material, framed as practice questions grounded in real, documented Istio behavior.

---

### 1. (Domain: Core Concept) Explain, using this guide's own airport-customs analogy, why a service mesh requires zero application code changes to add mTLS and retries.

**Answer:** Every pod gets its own Envoy sidecar proxy — like a customs checkpoint at every doorway rather than trusting each room to check IDs itself. The application code only ever talks to its own local sidecar, which handles mTLS, retries, and tracing transparently at the network layer, entirely outside the application's own process. The application never needs to know a mesh exists at all — it's still just making normal network calls, with the sidecar doing the actual mTLS handshake, retry logic, and telemetry capture underneath.

---

### 2. (Domain: mTLS) What's the practical difference between STRICT and PERMISSIVE mTLS mode, and why does this guide recommend PERMISSIVE first during a migration?

**Answer:** STRICT mode rejects any non-mTLS traffic outright — only mTLS-encrypted, mesh-authenticated traffic is accepted. PERMISSIVE mode accepts both plaintext and mTLS simultaneously, which is why it's the safe first step during migration: it lets a team confirm sidecar injection is complete and mTLS is actually flowing correctly before cutting off plaintext traffic entirely with STRICT, avoiding breaking any service that hasn't yet received its sidecar.

---

### 3. (Domain: Sidecar Injection) A namespace is labeled `istio-injection=enabled`, but existing pods in that namespace still show no sidecar. What's missing?

**Answer:** Labeling a namespace only affects pods created *after* the label is applied — it doesn't retroactively inject sidecars into already-running pods. Existing pods need to be recreated (via `kubectl rollout restart` or equivalent) to actually receive the sidecar injection, since injection happens at pod creation time via an admission webhook, not as a background process applied to already-running pods.

---

### 4. (Domain: Traffic Management) What's the specific division of responsibility between a `DestinationRule` and a `VirtualService` in implementing a canary rollout?

**Answer:** `DestinationRule` defines what subsets exist within a service — grouping pods by a label (like `version: v1` vs `version: v2`) into named subsets. `VirtualService` defines the actual routing logic — how traffic is split across those subsets (a 90/10 weighted split, for instance). They're complementary: `DestinationRule` answers "what groups exist," `VirtualService` answers "how traffic gets routed to them" — both are required together for a working canary configuration.

---

### 5. (Domain: Resilience) How does Istio's `outlierDetection` circuit breaker work, and why does this require zero application-level retry/circuit-breaker code?

**Answer:** `outlierDetection` configured on a `DestinationRule` (e.g., `consecutive5xxErrors: 3`) monitors real response codes from each backend instance at the mesh layer — once a backend returns enough consecutive errors, it's automatically ejected from the load-balancing pool for a configured `baseEjectionTime`, with zero involvement from the application code itself. The circuit-breaking logic lives entirely in the Envoy sidecar's configuration, not in any application-level retry or failure-handling code.

---

### 6. (Domain: Diagnostics) What's the difference between `istioctl proxy-status` and `istioctl analyze`, and when would you use each?

**Answer:** `istioctl proxy-status` shows whether every Envoy sidecar in the mesh is currently in sync with `istiod`'s latest configuration — useful for diagnosing a specific proxy that seems to be running stale config. `istioctl analyze` scans the actual Istio configuration objects (VirtualServices, DestinationRules, PeerAuthentications) for common misconfigurations and conflicts, catching issues before they cause a runtime problem — proxy-status checks sync health; analyze checks configuration correctness.

---

### 7. (Domain: Identity) What is a SPIFFE identity, and why does this matter more than just relying on a pod's IP address for identifying a service?

**Answer:** SPIFFE is a standardized, verifiable identity format ("who is this service," cryptographically backed by Istio's built-in CA) issued automatically to every pod in the mesh. Unlike an IP address — which can change as pods are rescheduled, and provides no cryptographic proof of identity — a SPIFFE identity gives a genuine, verifiable answer to "which service is this, really," which is what actually makes zero-trust security meaningful, since policy can be based on cryptographically-verified identity rather than a spoofable network address.

---

### 8. (Domain: Troubleshooting) After enabling STRICT mTLS on a namespace, one specific service starts failing to receive any traffic while others work fine. What's the most likely cause?

**Answer:** That specific service is very likely missing its Envoy sidecar — a service without the sidecar can't participate in mTLS at all, and STRICT mode rejects its plaintext traffic outright rather than falling back to allowing it through. Checking whether that specific pod actually has the `istio-proxy` container present (`kubectl get pod ... -o jsonpath='{.spec.containers[*].name}'`) is the direct way to confirm this as the cause, distinct from other services that already have their sidecars correctly injected.

---

### 9. (Domain: Istio vs Linkerd) When might a team choose Linkerd over Istio, given Istio's richer feature set?

**Answer:** When the operational complexity of Istio's fuller feature set isn't justified by the team's actual needs — Linkerd is deliberately simpler and lighter (a Rust-based proxy with lower resource overhead per pod), trading some of Istio's advanced traffic-management and multi-cluster capabilities for meaningfully lower operational burden. A team needing primarily mTLS and basic observability, without heavy investment in advanced traffic-shaping features, may find Linkerd's simplicity a better fit than paying Istio's full operational complexity for capabilities they won't use.

---

### 10. (Domain: Control Plane vs Data Plane) What's the architectural distinction between Istio's control plane and data plane, and why does this separation matter operationally?

**Answer:** The data plane is the fleet of Envoy sidecars actually intercepting and enforcing policy on real traffic, distributed across every pod in the mesh. The control plane (`istiod`) is the centralized component that computes configuration and distributes it to every sidecar, without itself sitting in the request path. This separation matters because the data plane keeps functioning (enforcing whatever configuration it last received) even if the control plane is briefly unavailable — a control plane outage doesn't immediately break existing mesh traffic, though it does mean configuration updates can't be distributed until it recovers.
