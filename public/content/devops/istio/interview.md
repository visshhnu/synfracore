# Istio Interview Q&A

**Q: What is a service mesh and why Istio?**
Service mesh handles service-to-service communication: mTLS encryption, traffic management, observability. Istio uses sidecar proxy (Envoy) injected into each pod — transparent to application code. Benefits: zero-trust security, circuit breaking, canary releases, distributed tracing without code changes.

**Q: Istio vs Linkerd?**
Istio: feature-rich, complex, higher resource overhead. Uses Envoy sidecar. Linkerd: lightweight, simpler, lower resource. Own proxy written in Rust. Linkerd better for smaller clusters; Istio for enterprise feature requirements.

**Q: What is a VirtualService?**
Istio CRD that defines traffic routing rules. Can split traffic by weight (canary: 90% stable, 10% new), route by header, inject faults for chaos testing, set timeouts and retries.

## Quick Reference — Istio

### Key Points for Revision

- Review the overview section for core architecture and fundamentals
- Practice commands/configurations from the cheatsheet section
- Use interview Q&A for active recall before exams or interviews
- Cross-reference with related tools in the devops academy

### Related Topics

Explore these connected topics to build complete understanding:
- Overview and Architecture
- Fundamentals and Core Concepts
- Advanced Patterns and Production Usage
- Interview Preparation Q&A
- Quick Reference Cheatsheet

### Practice Approach

1. Read the overview to understand *what* and *why*
2. Work through fundamentals for *how*
3. Attempt hands-on labs or configurations
4. Test yourself with interview questions
5. Keep cheatsheet accessible for quick reference during work

### Further Learning

Connect this topic to the broader devops ecosystem. 
Each tool in this academy is designed to work with others —
understanding the integration points is what separates intermediate from senior practitioners.

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

---

*This section is part of the SynfraCore learning platform. Use the sidebar to navigate to Overview, Fundamentals, Advanced, and Cheatsheet sections for comprehensive coverage of this topic.*
