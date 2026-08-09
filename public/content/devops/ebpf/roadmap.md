# eBPF & Cilium Learning Roadmap

**Goal**: From zero eBPF exposure to production-grade Cilium networking, observability, and security

## Learning Phases

### Phase 1: eBPF Fundamentals (2-3 days)

- What eBPF is and why it's kernel-safe (the verifier, at a conceptual level)
- Why DevOps cares — zero-instrumentation observability
- eBPF vs. sidecar proxies — the performance argument
- The tool landscape: Cilium, Tetragon, Hubble, Falco, bpftrace, Pixie

### Phase 2: Cilium Networking (3-4 days)

- Cilium as CNI — replacing kube-proxy
- `CiliumNetworkPolicy` — L3/L4 and L7/HTTP-aware policies
- Hubble flow observability — CLI and UI

### Phase 3: Runtime Security and Investigation (3-4 days)

- Tetragon — active enforcement vs. Falco's detection-only model
- `bpftrace` — ad hoc kernel tracing for live investigation
- XDP — line-rate packet filtering
- Pixie — auto-instrumented application observability

### Phase 4: Advanced Kernel and Networking Internals (1-2 weeks)

- Verifier internals — what actually gets rejected and why
- CO-RE (Compile Once – Run Everywhere) and BTF
- Transparent encryption — WireGuard vs. IPSec tradeoffs
- Egress Gateway for consistent outbound IPs

### Phase 5: Troubleshooting and Interview Readiness (ongoing)

- Diagnosing policy-drop mysteries with `hubble observe --verdict DROPPED`
- Cross-cluster connectivity debugging
- Practice explaining the eBPF-vs-sidecar performance argument concretely — a near-certain interview topic given how frequently eBPF comes up as a "modern infrastructure" signal

## Job Roles This Enables

- Platform Engineer (networking-focused)
- Site Reliability Engineer
- Security Engineer (runtime security, via Tetragon/Falco)
- Kubernetes/Cloud-Native Infrastructure Engineer

## Target Certifications

`(needs verification — recheck against current source for CNCF's current Cilium-relevant certification offerings, if any)`

## How to Use This Roadmap

1. Work through phases in order — Phase 3's Tetragon/bpftrace/XDP material assumes Phase 2's Cilium/Hubble fundamentals are already solid, and Phase 4's verifier/CO-RE internals are meaningfully easier once Phase 1-3's practical tool usage is familiar
2. This technology doesn't have a separate Labs tab — the Fundamentals/Intermediate/Advanced code blocks and a real cluster (kind works, per the Installation section's local setup) are the hands-on material
3. Build the portfolio projects in `projects.md` after Phase 3 — demonstrating both networking policy and runtime security enforcement shows the breadth eBPF tooling actually covers
4. Use `cilium connectivity test` liberally during learning, not just after installation — it's a genuinely useful tool for confirming a policy change did what you intended
5. Treat Phase 4 as valuable even if you'll never write raw eBPF programs yourself — understanding the verifier and CO-RE is what separates "I've used Cilium" from genuinely understanding why the tooling works the way it does, which interviewers specifically probe for at senior levels

## Prerequisites

See `prerequisites.md` in this section for what you should know before starting.

## Revision Notes
```
Total time: 3-5 weeks (part-time)
eBPF/Cilium has a real conceptual depth beyond most CNI/networking
tools — budget extra time for Phase 4 specifically if the goal is
interview-level depth, not just operational competence with Cilium's
day-to-day CLI/Helm interface
```
