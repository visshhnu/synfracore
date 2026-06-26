# eBPF & Cilium

> **Linux kernel programmability — next-gen networking, observability, security**

**Category:** Networking  
**Learning Path:** What → Why → Architecture → Setup → Real Examples → Production → Interview Prep

---

## What is eBPF & Cilium?

eBPF (extended Berkeley Packet Filter) allows running sandboxed programs inside the Linux kernel without modifying kernel source code or inserting modules. For DevOps: observe everything at kernel level with zero application changes. See every network connection, syscall, file access — even in encrypted traffic. 2-3x better performance than iptables-based networking. Cilium replaced kube-proxy in Google's GKE. Mentioning eBPF in interviews signals you follow modern infrastructure trends.

## Why eBPF & Cilium?

Cilium is the most popular eBPF-based CNI for Kubernetes. It replaces both kube-proxy (better performance) and standard Network Policies (adds L7/HTTP-aware policies). Hubble provides real-time network flow visibility — see which pods talk to which, with what HTTP paths. Used by Google (GKE Dataplane V2), AWS, and most major managed K8s platforms.

---

## Learning Modules

### Module 01 — What is eBPF?
*Kernel-level programmability — zero instrumentation*

eBPF (extended Berkeley Packet Filter) allows running sandboxed programs inside the Linux kernel without modifying kernel source code or inserting modules. For DevOps: observe everything at kernel level with zero application changes. See every network connection, syscall, file access — even in encrypted traffic. 2-3x better performance than iptables-based networking. Cilium replaced kube-proxy in Google's GKE. Mentioning eBPF in interviews signals you follow modern infrastructure trends.

**Topics covered:**

- eBPF — run code in Linux kernel safely — 🟢 Beginner
- Why DevOps cares — observe without code changes — 🟢 Beginner
- eBPF vs sidecar proxies — performance — 🟡 Intermediate
- Tools built on eBPF — 🟢 Beginner

```bash
# Why eBPF matters for DevOps:

# TRADITIONAL monitoring:
# - Add agent to application code
# - Deploy sidecar proxy (Envoy/Istio)
# - Each adds overhead, latency, complexity

# eBPF monitoring:
# - Attach probe to Linux kernel
# - See ALL processes, ALL network traffic
# - Zero code changes, near-zero overhead
# - Works with encrypted traffic (sees before encryption)

# Performance comparison:
# iptables (kube-proxy):  O(n) rule lookup — slow with 10,000+ services
# eBPF (Cilium):          O(1) hash lookup — same speed regardless of scale
# Result: 2-3x better network throughput with Cilium vs kube-proxy

# Tools built on eBPF:
# Cilium    — K8s CNI: networking + security + observability
# Tetragon  — Runtime security: see every syscall
# Pixie     — Auto-instrumentation: latency/errors with zero code changes
# Falco     — Runtime security (eBPF driver)
# Hubble    — Network observability (part of Cilium)
```

### Module 02 — Cilium — eBPF-powered CNI
*Replace kube-proxy, Network Policy, Hubble*

Cilium is the most popular eBPF-based CNI for Kubernetes. It replaces both kube-proxy (better performance) and standard Network Policies (adds L7/HTTP-aware policies). Hubble provides real-time network flow visibility — see which pods talk to which, with what HTTP paths. Used by Google (GKE Dataplane V2), AWS, and most major managed K8s platforms.

**Topics covered:**

- Cilium replaces kube-proxy — 🟡 Intermediate
- CiliumNetworkPolicy — L7 aware — 🔴 Advanced
- Hubble — network observability UI — 🟡 Intermediate
- Cilium Cluster Mesh — multi-cluster — 🔴 Advanced
- Install Cilium on AKS/EKS/GKE — 🟡 Intermediate

```bash
# Install Cilium (replaces kube-proxy)
helm repo add cilium https://helm.cilium.io/
helm install cilium cilium/cilium \\
  --namespace kube-system \\
  --set kubeProxyReplacement=true \\
  --set hubble.relay.enabled=true \\
  --set hubble.ui.enabled=true

# Verify Cilium status
cilium status
kubectl get pods -n kube-system | grep cilium

# CiliumNetworkPolicy — L7 aware (standard K8s NP is only L3/L4)
apiVersion: cilium.io/v2
kind: CiliumNetworkPolicy
metadata:
  name: payment-api-policy
  namespace: production
spec:
  endpointSelector:
    matchLabels:
      app: payment-api
  ingress:
  - fromEndpoints:
    - matchLabels:
        app: orders-service
    toPorts:
    - ports:
      - port: "8080"
        protocol: TCP
      rules:
        http:
        - method: POST     # L7: only allow POST /api/payment
          path: /api/payment

# Hubble — real-time network observability
hubble observe --namespace production
hubble observe --verdict DROPPED    # See blocked traffic
hubble observe --http-path /api/payment

# Cluster Mesh — pod-to-pod across clusters
ciliumclustermesh enable
ciliumclustermesh connect \\
  --context prod-cluster-1 \\
  --destination-context prod-cluster-2
```

---

## Production Example

```bash
# eBPF — Interview Talking Points

# WHAT TO SAY when asked about eBPF:
# "eBPF is the most significant Linux kernel advancement in decades.
# It allows attaching sandboxed programs to kernel events — network
# packets, syscalls, file operations — without modifying the kernel.
#
# For DevOps, the key benefits are:
# 1. Observability without code changes — see any process, any network
#    traffic, even encrypted, at the kernel level
# 2. Performance — Cilium with eBPF is 2-3x faster than iptables
#    because it uses hash tables instead of linear rule chains
# 3. Security — Tetragon can detect and block a cryptominer the
#    moment it makes a suspicious syscall, before any damage
#
# In production I use Cilium as the CNI because:
# - Network policies are L7-aware (can filter by HTTP path)
# - Hubble gives real-time network flow visibility
# - Replaces kube-proxy with better performance at scale
# - Cilium Cluster Mesh connects pods across clusters natively"

# TOOLS SUMMARY:
# Cilium:    CNI + network security + observability (most used)
# Tetragon:  Runtime security at syscall level
# Pixie:     Auto-instrumentation — metrics/traces with zero code change
# Hubble:    Cilium's network observability UI and CLI
# Falco:     Runtime security (eBPF mode is newer, more performant)
```

---

## Interview Prep

!!! tip "PSR Formula"
    Answer every question: **Problem → Solution → Result**. 45-90 seconds max.

### Common Interview Questions

??? question "What is eBPF & Cilium and why would you use it in production?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How does eBPF & Cilium work internally? Explain the architecture."
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "What are the main components of eBPF & Cilium?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How do you handle failures in eBPF & Cilium?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "What is your production experience with eBPF & Cilium?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How do you monitor and observe eBPF & Cilium in production?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "What are the security considerations for eBPF & Cilium?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "How does eBPF & Cilium compare to alternatives?"
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "Explain What is eBPF? in eBPF & Cilium."
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

??? question "Explain Cilium — eBPF-powered CNI in eBPF & Cilium."
    *Add your answer here based on your real experience.*
    
    **Framework:** State the problem it solves → explain your solution → describe the result.

---

## Official Resources

- [eBPF.io — Official Site](https://ebpf.io/)
- [Cilium Documentation](https://docs.cilium.io/)
- [Hubble Network Observability](https://docs.cilium.io/en/stable/gettingstarted/hubble/)

---

*Part of [LearnwithVishnu](https://learnwithvishnu.pages.dev) — Basics → Production → Architect*