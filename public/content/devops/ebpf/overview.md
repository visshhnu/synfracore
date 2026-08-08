# eBPF & Cilium

> **Linux kernel programmability — next-gen networking, observability, security**

**Category:** Networking  
**Learning Path:** What → Why → Learning Modules → Production Example → Interview Prep

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
    **Problem:** traditional observability and networking need either application code changes (agents/SDKs) or a sidecar proxy (Envoy/Istio) in front of every workload — both add latency, deployment complexity, and a per-service integration cost. **Solution:** eBPF runs sandboxed programs directly inside the Linux kernel, attached to network/syscall/file events, so tools built on it (Cilium for networking, Hubble for observability) see everything — every connection, every syscall, even pre-encryption traffic — with zero application changes. **Result:** Cilium as CNI replaces both kube-proxy and sidecar-based service mesh networking with kernel-level enforcement, at roughly 2-3x the throughput of iptables-based kube-proxy, because eBPF uses O(1) hash-table lookups instead of iptables' O(n) linear rule chains.

??? question "How does eBPF & Cilium work internally? Explain the architecture."
    **Problem:** "runs in the kernel" sounds risky, and without knowing the safety mechanism it's hard to explain why this doesn't crash the machine the way a bad kernel module would. **Solution:** an eBPF program is verified by the kernel's own verifier before being allowed to load — it's checked for termination (no unbounded loops), memory safety, and restricted to a fixed instruction set — then JIT-compiled to run at near-native speed attached to a specific hook point (a network interface, a syscall, a kprobe); Cilium ships eBPF programs that hook into the network datapath, replacing the iptables rules kube-proxy would otherwise install. **Result:** the verifier is what makes eBPF safe to run in production kernels at all — a program that fails verification simply doesn't load, rather than crashing anything, which is why cloud providers (GKE Dataplane V2, EKS, AKS) trust it as their default CNI datapath.

??? question "What are the main components of eBPF & Cilium?"
    **Problem:** "eBPF" and "Cilium" get used interchangeably, but eBPF is a kernel technology and Cilium is one (widely-used) product built on it, among several. **Solution:** eBPF itself is the kernel mechanism; Cilium is the CNI that uses it for Kubernetes networking, Network Policy enforcement (including L7/HTTP-aware `CiliumNetworkPolicy`, which standard K8s NetworkPolicy can't do), and replacing kube-proxy; Hubble is Cilium's own real-time network-flow observability layer (which pod talked to which, over what HTTP path); Tetragon and Falco are separate eBPF-based runtime-security tools (syscall-level threat detection); Pixie is eBPF-based auto-instrumentation for app metrics/traces with zero code changes. **Result:** in a real Kubernetes stack these are often layered — Cilium for the CNI/network-policy layer, Hubble for its observability, Tetragon alongside it for runtime security — not competing choices but complementary pieces of the same eBPF ecosystem.

??? question "How do you handle failures in eBPF & Cilium?"
    **Problem:** because Cilium replaces kube-proxy entirely, a Cilium problem is a cluster-wide networking problem, not an isolated one. **Solution:** `cilium status` is the first command — it reports per-node agent health and whether kube-proxy replacement is actually active; `kubectl get pods -n kube-system | grep cilium` confirms the agent pods themselves are running; for a specific connectivity problem, `hubble observe --verdict DROPPED` shows exactly which flows Cilium's policy engine is blocking and why, which is far faster than reasoning about NetworkPolicy YAML in the abstract. **Result:** most real Cilium incidents are either an agent not running on a specific node (caught by the `kube-system` pod check) or a policy unintentionally too restrictive (caught directly by `hubble observe --verdict DROPPED`, which shows the actual denied traffic rather than requiring it to be inferred from policy text).

??? question "What is your production experience with eBPF & Cilium?"
    This is a genuinely personal question — answer with a real incident using the Problem → Solution → Result structure: what broke (a `CiliumNetworkPolicy` blocking legitimate traffic after a service rename, a kube-proxy-replacement upgrade that needed careful node-by-node rollout, a Cluster Mesh connectivity issue between two regions), your actual diagnostic sequence, and what the root cause turned out to be. Interviewers are listening for whether you have real operational experience, not textbook recall.

??? question "How do you monitor and observe eBPF & Cilium in production?"
    **Problem:** because Cilium operates below the application layer, standard app-level monitoring (APM, request logs) can't see a networking problem Cilium itself is causing — a dropped packet never reaches the application to be logged. **Solution:** Hubble is the purpose-built answer — `hubble observe` streams real-time flow data (allowed and dropped) directly from the eBPF datapath, and the Hubble UI visualizes which pods talk to which, with HTTP-path-level detail for L7-aware policies; `cilium status` and per-node agent metrics catch datapath-level health separately from flow-level visibility. **Result:** "is traffic being blocked, and by which policy" is answered directly by Hubble in a way no application-level tool can, because Hubble sees the decision at the exact point it's made, before the packet is dropped or forwarded.

??? question "What are the security considerations for eBPF & Cilium?"
    **Problem:** eBPF programs run in kernel space, so a poorly-audited eBPF tool is a more privileged attack surface than a typical userspace agent — and Cilium's L7-aware policies are only as good as how precisely they're written. **Solution:** rely on the kernel's own verifier as the first safety gate (it rejects unsafe programs before they load, not after); write `CiliumNetworkPolicy` with explicit `toPorts`/`rules.http` scoping (method + path, as in the payment-API example above) rather than broad L3/L4-only rules, since the whole point of choosing Cilium over standard NetworkPolicy is that L7 precision; use Tetragon alongside Cilium specifically for runtime threat detection (catching a compromised process at the syscall level) rather than assuming network policy alone covers workload security. **Result:** the security value of this stack comes from defense at two different layers — Cilium for network-level least-privilege, Tetragon for runtime/syscall-level detection — treating either alone as sufficient leaves the other gap open.

??? question "How does eBPF & Cilium compare to alternatives?"
    **Problem:** "eBPF-based networking" competes with both traditional iptables-based CNIs and sidecar-proxy service meshes, and the tradeoffs are different against each. **Solution:** vs. iptables-based CNIs (Calico in its non-eBPF mode, Flannel) — Cilium wins decisively on performance at scale (O(1) vs O(n) rule evaluation) and gains L7-aware policy that iptables fundamentally cannot express; vs. a sidecar mesh like Istio — Cilium/Hubble can provide comparable L7 visibility and mTLS-adjacent security without injecting a proxy container into every pod, at the cost of being newer and having a smaller operator ecosystem than Istio's. **Result:** the practical decision is usually "iptables-based CNI" vs. "eBPF-based CNI" for the networking layer first (Cilium wins on performance and policy expressiveness at any real scale), with the sidecar-mesh question as a separate, layered decision on top.

??? question "What actually makes it safe to run untrusted-looking code inside the Linux kernel?"
    **Problem:** kernel modules have historically been the highest-risk way to extend Linux — a bug can crash or compromise the entire machine, which is exactly the reputation eBPF has to overcome to be trusted in production. **Solution:** every eBPF program passes through the kernel's verifier before it's allowed to load — checked for guaranteed termination (loops must be bounded), memory-safe access patterns, and restricted to a constrained instruction set that the verifier can fully analyze; programs that don't pass simply fail to load, with no partial or unsafe execution possible. **Result:** this verification step is the entire reason eBPF programs can run in kernel space in production at hyperscaler scale (GKE, EKS, AKS all default to it) without the blast-radius risk a traditional kernel module carries.

??? question "Beyond replacing kube-proxy, what does Cilium's L7-aware policy and Hubble actually add that a standard CNI doesn't?"
    **Problem:** standard Kubernetes NetworkPolicy only understands IP addresses and ports (L3/L4) — it can allow or deny "orders-service can talk to payment-api on port 8080," but can't express "orders-service can only POST to /api/payment," which is often the actual security requirement. **Solution:** `CiliumNetworkPolicy` extends the same policy model with `rules.http` — method and path-level rules enforced at the eBPF datapath, not in a sidecar — and Hubble makes those decisions observable in real time (`hubble observe --http-path /api/payment` shows exactly what's happening at that granularity), which a standard CNI's policy engine has no equivalent for. **Result:** this is the concrete answer to "why not just use the built-in CNI" — L7-aware policy plus flow-level observability is functionality standard NetworkPolicy structurally cannot provide, not just a performance improvement on the same feature set.

---

## Official Resources

- [eBPF.io — Official Site](https://ebpf.io/)
- [Cilium Documentation](https://docs.cilium.io/)
- [Hubble Network Observability](https://docs.cilium.io/en/stable/gettingstarted/hubble/)

---

