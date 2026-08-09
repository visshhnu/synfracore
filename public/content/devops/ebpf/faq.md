# eBPF & Cilium — FAQ

## Do I need to write eBPF programs myself to use Cilium?

No — Cilium, Tetragon, and Hubble are pre-built tools that run on eBPF internally; you interact with them via Helm and `kubectl`/CLI, not by authoring kernel programs yourself. Writing raw eBPF programs is a genuinely different, lower-level skill covered only at the edges of this guide's Advanced material (verifier internals, CO-RE) — not required for effective day-to-day Cilium usage.

## Why does eBPF need a "verifier" at all — isn't sandboxing enough?

The verifier *is* the sandboxing mechanism, specifically for kernel-level code — it statically proves a program terminates and stays within valid memory bounds before ever allowing it to load and run. Without this static proof requirement, a buggy or malicious eBPF program could genuinely crash or hang the kernel, since it runs with kernel-level access. The verifier is what makes it safe to run arbitrary, third-party-authored programs inside the kernel at all.

## Is Cilium strictly better than kube-proxy, or is there a real tradeoff?

Cilium's eBPF-based approach genuinely outperforms kube-proxy's iptables-based routing at scale (O(1) hash lookup vs. O(n) rule lookup), and adds capabilities kube-proxy never had (L7-aware policy, Hubble observability). The real tradeoff is operational complexity and kernel-version requirements — Cilium requires a sufficiently modern kernel and represents a genuinely more complex system to understand and troubleshoot than the simpler, more mature iptables-based model. For most modern managed Kubernetes environments, the performance and capability gains outweigh that complexity, which is why Cilium has been adopted as the default CNI in several major managed platforms.

## Why does my Hubble UI show nothing even though Cilium itself reports healthy?

This is a specific, well-documented gap: `hubble.relay.enabled=true` and per-node Hubble flow collection are two separate settings, both required for the UI to show anything — Cilium's own health has nothing to do with whether these two Hubble-specific flags are both correctly set. Check `hubble observe` at the CLI directly against a node first; if that works but the UI doesn't, the problem is specifically relay/UI wiring.

## Is Tetragon a replacement for Falco, or do they serve different purposes?

They overlap significantly in what they can detect, but differ fundamentally in response capability — Falco is detection-only, generating alerts after observing suspicious behavior; Tetragon can actively enforce policy in-kernel (killing a process, blocking a syscall) before the malicious action's effects propagate. Some teams use Tetragon specifically for its enforcement capability where Falco would only alert; others may already have Falco deeply integrated and add Tetragon selectively for enforcement-critical cases rather than a wholesale replacement.

## Does enabling Cilium's transparent encryption slow down my cluster's network noticeably?

There's a real, measurable overhead — encryption isn't free — but WireGuard specifically (Cilium's generally-preferred option) has comparatively low CPU overhead relative to alternatives like IPSec. Whether the overhead is "noticeable" depends on your workload's actual network intensity; for most workloads it's a reasonable tradeoff for meeting a real encryption-in-transit requirement, but it's worth benchmarking against your specific traffic patterns rather than assuming it's negligible by default.

## What's the difference between `bpftrace` and deploying Cilium/Tetragon/Hubble permanently?

`bpftrace` is an interactive, one-off investigation tool — you write and run a specific one-liner to answer a specific question during active debugging, and it's not meant to run continuously as deployed infrastructure. Cilium, Tetragon, and Hubble are deployed once and run continuously as part of the cluster, providing always-on observability/enforcement rather than requiring someone to manually run a query whenever a question arises.

## Why would I need Egress Gateway if my cluster already has a NAT gateway at the cloud-provider level?

A cloud-provider NAT gateway typically presents a consistent IP for an entire VPC/subnet's egress traffic, not per-workload — if you need a *specific pod or service* (not the whole cluster's egress) to present a distinct, predictable IP for a partner's allowlist, a cloud-level NAT gateway alone doesn't provide that granularity. Egress Gateway solves this at the per-policy, per-workload level natively within Cilium, which a cluster-wide NAT gateway configuration typically can't replicate without significant additional cloud-side networking work.
