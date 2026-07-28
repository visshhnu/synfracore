# Istio Interview Q&A

**Q: What is a service mesh and why Istio?**
Service mesh handles service-to-service communication: mTLS encryption, traffic management, observability. Istio uses sidecar proxy (Envoy) injected into each pod — transparent to application code. Benefits: zero-trust security, circuit breaking, canary releases, distributed tracing without code changes.

**Q: Istio vs Linkerd?**
Istio: feature-rich, complex, higher resource overhead. Uses Envoy sidecar. Linkerd: lightweight, simpler, lower resource. Own proxy written in Rust. Linkerd better for smaller clusters; Istio for enterprise feature requirements.

**Q: What is a VirtualService?**
Istio CRD that defines traffic routing rules. Can split traffic by weight (canary: 90% stable, 10% new), route by header, inject faults for chaos testing, set timeouts and retries.

**Q: How does mTLS work in Istio?**
Each sidecar (Envoy) automatically gets a SPIFFE/X.509 certificate from Istiod (the control plane). When service A calls service B, both sidecars negotiate mTLS — mutual authentication with certificates. Application code sees plain HTTP; TLS happens transparently at the sidecar layer. PeerAuthentication CRD sets the mTLS mode (STRICT, PERMISSIVE, DISABLE).

**Q: What is a DestinationRule in Istio?**
Defines policies for traffic to a service: load balancing algorithm, connection pool settings, outlier detection (circuit breaking), TLS settings. Works alongside VirtualService: VirtualService defines routing rules, DestinationRule defines traffic policies after routing decision.

**Q: How do you troubleshoot a service not communicating in Istio?**
1. Check sidecar injection: `kubectl get pod -l app=myapp -o yaml | grep istio-proxy`
2. Check PeerAuthentication: STRICT mode blocks non-mTLS traffic
3. Check AuthorizationPolicy: may be blocking the path
4. Use `istioctl analyze` for configuration issues
5. Enable access logs: `kubectl logs <pod> -c istio-proxy`
6. Use Kiali for visual traffic graph

**Q: What is Istio's impact on latency?**
Sidecar adds 1-5ms per hop typically. For most services, this is acceptable. For ultra-low-latency use cases, consider eBPF-based alternatives (Cilium) which avoid the sidecar overhead. Istio's latency is mostly constant — it doesn't scale linearly with payload size.
