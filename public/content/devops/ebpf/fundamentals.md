# eBPF

Containers & K8s › eBPF
⚡**eBPF**
BeginnerEngineerArchitectLinux kernel programmability — Cilium, Hubble, Falco, network policy, observability
[What is eBPF](#sec-what)[Cilium](#sec-cilium)[Hubble & Falco](#sec-observability-ebpf)[Q&A](#sec-interview)


## ⚡ What is eBPF?›


#### What is eBPF?

eBPF (extended Berkeley Packet Filter) is a Linux kernel technology that lets you **run sandboxed programs inside the kernel at runtime** — without modifying kernel source code or loading kernel modules. eBPF programs are verified by the kernel for safety (cannot crash the system, cannot loop infinitely), JIT-compiled to native machine code, and attached to specific kernel hooks that fire when events occur.


Before eBPF: observing or changing kernel behaviour required writing kernel modules — complex C code that could crash the system, required kernel recompiles, and needed server reboots to load. eBPF eliminates all of this. Programs load at runtime in milliseconds with no reboot.


#### What makes eBPF important for Kubernetes
| Capability | Without eBPF | With eBPF |
|---|---|---|
| Network policy enforcement | iptables rules — O(n) traversal, explodes at thousands of services | eBPF hash maps — O(1) lookup, handles 100K+ services |
| Runtime security monitoring | Userspace agent polling — high overhead, misses events | eBPF kernel probes — instant, near-zero overhead |
| Distributed tracing | Instrument every app with SDK — code changes required | eBPF uprobes — trace any app with zero code changes |
| Load balancing | kube-proxy iptables — one rule per endpoint | Cilium eBPF — replaces kube-proxy entirely |


#### eBPF hook points — where programs attach
| Hook point | What it observes | Used for |
|---|---|---|
| kprobe/tracepoint | System calls, kernel function calls | Security: detect privilege escalation, file access |
| TC (Traffic Control) | Network packets at ingress/egress | Network policy, load balancing |
| XDP (Express Data Path) | Packets before kernel networking stack | Ultra-fast packet filtering, DDoS mitigation |
| Uprobe | User-space function calls (libc, application code) | Zero-instrumentation app tracing |


## ⚡ eBPF in Production DevOps›


#### Three areas where eBPF changes everything

**Networking:** Cilium replaces kube-proxy. At 500+ services, the performance difference is measurable. The eBPF-based packet routing is O(1) where iptables is O(n).


**Security:** Tetragon watches kernel-level behaviour and can enforce policy — not just alert but actively block and kill processes. A container trying to read /etc/passwd, spawn a reverse shell, or connect to an unexpected IP gets terminated instantly.


**Observability:** Pixie and Hubble give you service-level metrics, network flows, and CPU profiles without modifying application code or adding sidecars.


Cilium, Tetragon, Pixie, Hubble — practical usageCopy

```

```


## 🛠️ eBPF Tools Reference›


BCC tools + bpftrace + interview answerCopy

```

```


## 🔐 Cilium — eBPF for Kubernetes Networking›

#### Cilium — the most important eBPF tool for Kubernetes
Cilium is a Kubernetes CNI (Container Network Interface) plugin that uses eBPF instead of iptables for networking and security. Used by AWS EKS, GKE, and many production clusters.

| Feature | What it does |
|---|---|
| Network Policy | L3/L4/L7 network policies enforced by eBPF — faster than iptables and supports HTTP-level rules |
| Service Load Balancing | Replaces kube-proxy entirely — eBPF maps for O(1) service lookup vs iptables O(n) rules |
| Hubble | Real-time network observability — see every packet flow between pods with zero app changes |
| ClusterMesh | Multi-cluster connectivity — transparent networking between Kubernetes clusters |
| Transparent Encryption | WireGuard or IPSec encryption between nodes — no sidecar needed |

```
# Install Cilium (replaces kube-proxy)
helm repo add cilium https://helm.cilium.io
helm install cilium cilium/cilium   --namespace kube-system   --set kubeProxyReplacement=strict   --set hubble.relay.enabled=true   --set hubble.ui.enabled=true

# Check Cilium status
cilium status

# Hubble CLI — observe network flows in real time
hubble observe --namespace production
hubble observe --pod payment-api --protocol http

# Example: DNS requests from payment-api pod
hubble observe --pod payment-api --verdict FORWARDED --type L7
```

#### L7 network policy with Cilium (iptables cannot do this)
```
apiVersion: cilium.io/v2
kind: CiliumNetworkPolicy
metadata:
name: payment-api-policy
spec:
endpointSelector:
matchLabels:
app: payment-api
ingress:
- fromEndpoints:
- matchLabels:
app: order-service
toPorts:
- ports:
- port: "8080"
protocol: TCP
rules:
http:
- method: POST
path: /api/v1/payment    # only allow POST to this path
# GET requests from order-service are DENIED
```


## 👁️ Hubble, Falco and eBPF Observability›

#### eBPF for observability — zero instrumentation tracing
| Tool | What it does |
|---|---|
| Pixie (New Relic) | Auto-instruments K8s apps — HTTP, gRPC, SQL traces with zero code changes. Uses eBPF uprobes. |
| Hubble (Cilium) | Network-level observability — see all traffic flows, DNS queries, dropped packets. |
| Falco | Security monitoring — detect abnormal system calls (shell spawned in container, file write in /etc). |
| bpftrace | Ad-hoc kernel tracing — write one-liners to trace any kernel event for debugging. |
| Tetragon (Cilium) | Security enforcement — kill a process immediately if it violates policy using eBPF. |

```
# Falco — detect shell spawned inside container (possible attack)
# Default rule alerts when a shell process starts in a container
kubectl logs -n falco falco-xyz | grep Warning

# bpftrace — trace all TCP connections in real time
bpftrace -e 'kprobe:tcp_connect { printf("%s -> %s\n", comm, ntop(args->daddr)); }'

# Pixie — auto-trace HTTP requests without code changes
# After installing Pixie agent on K8s:
px run px/http_data -- -start_time="-5m"  # last 5 minutes of HTTP traffic
```


## 🎯 Interview Questions›


All
Architect
Engineer
Production


eBPF · ARCHITECT
What is eBPF and why is it considered a paradigm shift for observability and security?
eBPF (Extended Berkeley Packet Filter) is a technology that lets you run sandboxed programs inside the Linux kernel safely. Before eBPF, to observe what processes do at kernel level you needed kernel modules (crash risk) or userspace tools like strace (40-50% overhead). eBPF programs are verified by the kernel before execution — no infinite loops, no invalid memory access — so they are safe in production. The paradigm shift: observability witho
