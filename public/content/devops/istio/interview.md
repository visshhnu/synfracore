# Istio Interview Q&A

**Q: What is a service mesh and why Istio?**
Service mesh handles service-to-service communication: mTLS encryption, traffic management, observability. Istio uses sidecar proxy (Envoy) injected into each pod — transparent to application code. Benefits: zero-trust security, circuit breaking, canary releases, distributed tracing without code changes.

**Q: Istio vs Linkerd?**
Istio: feature-rich, complex, higher resource overhead. Uses Envoy sidecar. Linkerd: lightweight, simpler, lower resource. Own proxy written in Rust. Linkerd better for smaller clusters; Istio for enterprise feature requirements.

**Q: What is a VirtualService?**
Istio CRD that defines traffic routing rules. Can split traffic by weight (canary: 90% stable, 10% new), route by header, inject faults for chaos testing, set timeouts and retries.
