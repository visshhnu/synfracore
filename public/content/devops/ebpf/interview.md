# eBPF Interview Q&A

**Q: What is eBPF and why is it important for DevOps?**
Extended Berkeley Packet Filter: runs sandboxed programs in kernel space without kernel changes. Used for: performance observability (Cilium, Pixie), network policy enforcement, security monitoring (Falco), distributed tracing without sidecars. Replaces sidecar proxies in some scenarios.

**Q: Cilium vs Istio?**
Cilium uses eBPF for networking and observability — no sidecar proxies needed. Lower overhead, higher performance. Istio uses Envoy sidecars — more features (retries, circuit breaking, traffic shifting), higher resource cost. Cilium is replacing Istio in performance-critical environments.

**Q: How does eBPF help with security?**
Falco uses eBPF to detect runtime anomalies: unexpected syscalls, privilege escalation, suspicious file access. Real-time detection in kernel without modifying application code.

## Quick Reference — Ebpf

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

**Q: How is eBPF different from kernel modules?**
Kernel modules run with full kernel privileges — a bug crashes the entire system. eBPF programs are verified by the kernel verifier before loading: checks for infinite loops, memory bounds, type safety. eBPF is sandboxed — cannot crash the kernel or access arbitrary memory. Much safer to deploy in production.

**Q: What is XDP in eBPF?**
eXpress Data Path — eBPF hook at the network driver level, before the kernel network stack. Can process packets at line rate: drop DDoS packets before they reach the TCP stack, perform load balancing, implement firewall rules. Cilium uses XDP for high-performance Kubernetes network policies.

**Q: Name three production use cases for eBPF.**
1. Cilium: Kubernetes CNI using eBPF for network policy, load balancing, encryption — replaces iptables
2. Falco: runtime security monitoring — detects syscall anomalies (privilege escalation, container escape)
3. Pixie: auto-instrumented observability — captures application requests without code changes or sidecars

**Q: What is bpftrace?**
High-level tracing language for eBPF. Write one-liners to trace kernel functions, syscalls, user-space applications. Example: `bpftrace -e 'kprobe:sys_read { printf("%s read %d bytes
", comm, arg2); }'` — prints process name and bytes for every read syscall. Useful for production performance investigation.

---

*This section is part of the SynfraCore learning platform. Use the sidebar to navigate to Overview, Fundamentals, Advanced, and Cheatsheet sections for comprehensive coverage of this topic.*
