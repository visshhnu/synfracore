# eBPF & Cilium — Revision Notes

Condensed reference for quick review. Consolidated from this guide's Overview, Intermediate, Advanced, and Troubleshooting material.

---

## Core Concept

```
eBPF — sandboxed programs run INSIDE the Linux kernel, without kernel
  source modification or loadable kernel modules
Verifier — statically analyzes every program BEFORE allowing load —
  rejects anything it can't prove terminates + stays in-bounds
  (unbounded loops = REJECTED outright; must be provably bounded)
Zero application code changes for observability — kernel-level probe,
  not app instrumentation or sidecar
Performance: O(1) hash lookup (eBPF/Cilium) vs O(n) rule lookup
  (iptables/kube-proxy) — 2-3x better throughput claim
```

## Cilium as CNI

```
Replaces BOTH kube-proxy (performance) AND standard NetworkPolicy
  (adds L7/HTTP-aware policy — a standard NetworkPolicy can only do
  port-level allow/deny, NOT distinguish GET /status from POST /charge)
Hubble — real-time flow observability (CLI: hubble observe,
  UI: needs hubble.relay.enabled=true AND hubble.ui.enabled=true —
  TWO SEPARATE flags, both required for the UI specifically)
```

## Tool Landscape (what runs on eBPF)

```
Cilium    — CNI: networking + security + observability
Tetragon  — Runtime security, ACTIVE ENFORCEMENT (Sigkill in-kernel,
            before effects propagate) — not just detection like Falco
Hubble     — Network flow observability (part of Cilium)
bpftrace   — Ad hoc kernel tracing, DEBUGGING tool (one-liners,
            interactive), NOT a production monitoring system
XDP        — Line-rate packet filtering BEFORE kernel network stack
            (earlier hook than TC — faster, more constrained)
Pixie      — Auto-instrumented APPLICATION-level observability
            (HTTP/gRPC/SQL) via uprobes — different layer than Hubble
```

## CO-RE (Compile Once – Run Everywhere)

```
Solves: kernel struct layouts differ across versions -> used to need
  separate compile per kernel version
BTF (BPF Type Format) — kernel-embedded type metadata, read at LOAD
  TIME by CO-RE-compiled programs to resolve struct offsets correctly
Check support: ls /sys/kernel/btf/vmlinux
Why it matters: one set of binaries across a HETEROGENEOUS fleet,
  not a kernel-version-matched build pipeline
```

## Encryption — WireGuard vs IPSec

```
WireGuard — generally lower overhead, simpler key rotation (default
  preference unless compliance mandates otherwise)
IPSec     — alternative, sometimes required BY NAME for specific
  compliance frameworks
```

## Egress Gateway

```
Problem solved: external partner needs traffic from a small,
  predictable IP set — not the dynamic pod IPs a cluster naturally has
Without it: allowlist the ENTIRE node IP range (too broad) OR build a
  separate NAT gateway outside K8s
CiliumEgressGatewayPolicy — routes matching egress through a
  designated gateway node, presenting one consistent egressIP
```

## Troubleshooting Quick Reference

```
Unexpected policy DROP -> hubble observe --verdict DROPPED
  (check endpointSelector isn't broader than intended)
Hubble UI empty -> confirm hubble.relay.enabled=true AND per-node
  hubble collection BOTH set (two separate flags)
Cross-cluster connectivity issue -> hubble observe --to-identity
```

## Terminology Cross-Reference

```
eBPF/Cilium term       | Traditional equivalent
--------------------------|--------------------------------
CiliumNetworkPolicy         | Kubernetes NetworkPolicy (superset)
kube-proxy replacement        | iptables-based service routing
Tetragon enforcement            | Falco (detection-only) + manual response
XDP                              | (no direct equivalent — earlier hook)
```
