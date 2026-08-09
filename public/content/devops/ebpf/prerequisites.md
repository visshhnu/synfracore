# eBPF & Cilium — Prerequisites

## What to Know Before Starting eBPF & Cilium

eBPF operates at the Linux kernel level — this is genuinely lower-level than most DevOps tooling, and while Cilium (the Kubernetes-facing layer most engineers actually interact with) doesn't require writing eBPF programs yourself, understanding what's happening underneath meaningfully deepens the material.

## Required (Must Have)

### 1. Kubernetes Networking Fundamentals
- What a CNI (Container Network Interface) is and does
- What kube-proxy does by default, and what "replacing kube-proxy" means
- Basic Kubernetes NetworkPolicy concepts
```bash
kubectl get pods, kubectl get networkpolicy
kubectl exec, kubectl logs
```
Cilium's value proposition (Module 01) is framed entirely against kube-proxy and standard NetworkPolicies — without that baseline, the comparison doesn't land.

### 2. Basic Linux Systems Concepts
- What a syscall is, at a conceptual level (a process asking the kernel to do something)
- What a kernel module traditionally required, and why eBPF's "no kernel modification" property is significant
- Basic process/networking concepts (what a TCP connection is)

### 3. Comfort With `kubectl` and Helm
Cilium is installed and managed via Helm, and most day-to-day interaction (checking Hubble flows, applying `CiliumNetworkPolicy`) happens through `kubectl`.

## Nice to Have (Speeds Up Learning)

### Prior iptables/Networking Exposure
Understanding why traditional iptables-based networking has O(n) rule-lookup scaling problems (referenced directly in Overview's performance comparison) makes eBPF's O(1) hash-lookup advantage a concrete, felt improvement rather than an abstract claim.

### Basic C Familiarity (Optional, for Advanced Only)
Advanced's verifier-internals and CO-RE material references C-like eBPF program structure — not required to use Cilium day to day, but useful for the deepest Advanced material specifically.

### Security/Observability Tool Background
If you've used Falco, understanding its detection-only model makes Tetragon's active-enforcement capability (Intermediate) a clear, contrasted upgrade rather than a new concept from scratch.

## What You Do NOT Need

- The ability to write eBPF programs yourself — Cilium, Tetragon, and Hubble are pre-built tools running on eBPF; you consume them via Helm/kubectl, not by authoring kernel programs
- Kernel development experience
- Prior Cilium or CNI-swapping experience

## Time Estimate

If you have the prerequisites above:
- Fundamentals: 1-2 days
- Intermediate + Advanced: 5-7 days
- Job-ready (comfortable with Cilium networking, Hubble observability, and Tetragon's enforcement model): 2-3 weeks

## Start Here

Go to the **Installation** section to install Cilium onto a cluster, then proceed to **Fundamentals**.
