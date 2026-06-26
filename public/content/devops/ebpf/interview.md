# eBPF Interview Q&A

**Q: What is eBPF and why is it important for DevOps?**
Extended Berkeley Packet Filter: runs sandboxed programs in kernel space without kernel changes. Used for: performance observability (Cilium, Pixie), network policy enforcement, security monitoring (Falco), distributed tracing without sidecars. Replaces sidecar proxies in some scenarios.

**Q: Cilium vs Istio?**
Cilium uses eBPF for networking and observability — no sidecar proxies needed. Lower overhead, higher performance. Istio uses Envoy sidecars — more features (retries, circuit breaking, traffic shifting), higher resource cost. Cilium is replacing Istio in performance-critical environments.

**Q: How does eBPF help with security?**
Falco uses eBPF to detect runtime anomalies: unexpected syscalls, privilege escalation, suspicious file access. Real-time detection in kernel without modifying application code.
