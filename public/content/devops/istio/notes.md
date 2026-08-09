# Istio / Service Mesh — Revision Notes

Condensed reference for quick review. Consolidated from this guide's Overview, Fundamentals, Intermediate, Advanced, and Troubleshooting material.

---

## Core Concept — the Sidecar Model

```
mTLS (mutual TLS) — BOTH sides authenticate each other (unlike regular
  TLS, where only the server proves identity)
WITHOUT a service mesh: every team implements mTLS/retries/circuit
  breakers/tracing INDEPENDENTLY in their own application code
WITH a service mesh: all of this moves into a SIDECAR PROXY (Envoy)
  injected alongside every pod — ZERO application code changes
Istio = most feature-rich, most COMPLEX to operate. Linkerd = simpler,
  lighter (Rust-based proxy)
```

## Identity and mTLS

```
Every pod gets a SPIFFE identity (standardized "who is this service"
  format) — issued automatically by Istio's built-in Certificate Authority
STRICT mode  — non-mTLS traffic REJECTED outright
PERMISSIVE mode — accepts BOTH plaintext and mTLS (default while
  migrating, so existing services don't break during rollout)
Real production rollout order: PERMISSIVE first (confirm sidecar
  injection complete, mTLS actually flowing) -> THEN switch to STRICT
```

## Sidecar Injection — Not Automatic Without This

```
kubectl label namespace production istio-injection=enabled
IMPORTANT: this ONLY affects pods created AFTER labeling — existing
  pods need kubectl rollout restart to actually receive the sidecar
```

## Traffic Management

```
DestinationRule — defines WHAT subsets exist (e.g., stable/canary by
  version label)
VirtualService    — defines HOW traffic is routed to those subsets
                     (weighted split, e.g., 90/10 canary)
Zero application code changes required for canary/A-B/blue-green —
  entirely mesh configuration
```

## Resilience — Circuit Breaking

```
outlierDetection:
  consecutive5xxErrors: 3
  baseEjectionTime: 60s
-> a backend returning 5xx repeatedly gets EJECTED from the load-
   balancing pool automatically, zero application code involved
```

## Key Diagnostic Commands

```
istioctl proxy-status         — confirm ALL proxies in sync with istiod
istioctl analyze                — catches common misconfigurations
                                   BEFORE they cause an outage
istioctl proxy-config listeners <pod> — asks the Envoy sidecar DIRECTLY
                                   what it's actually configured to do
```

## Terminology Cross-Reference

```
Istio term          | Cilium/eBPF equivalent
------------------------|--------------------------------
Sidecar proxy (Envoy)     | eBPF datapath (kernel-level, no sidecar)
PeerAuthentication          | CiliumNetworkPolicy (L7-aware)
Control plane (istiod)        | Cilium Operator + agent
Ambient mesh (ongoing)          | (closer architecturally to eBPF's
                                  no-sidecar model) `(needs verification
                                  — recheck current ambient mesh status)`
```
