# eBPF & Cilium — Intermediate

## Tetragon — Runtime Security Enforcement, Not Just Detection

Falco (covered in Overview's tools summary) alerts on suspicious kernel-level behavior; Tetragon goes further — it can actively **enforce** policy at the kernel level, killing a process or blocking a syscall the moment it violates policy, not just logging it after the fact:

```yaml
apiVersion: cilium.io/v1alpha1
kind: TracingPolicy
metadata: { name: block-reverse-shell }
spec:
  kprobes:
  - call: "__x64_sys_connect"
    syscall: true
    args:
    - index: 0
      type: "int"
    selectors:
    - matchArgs:
      - index: 0
        operator: "Equal"
        values: ["1"]        # simplified — real policies match on destination/process context
      matchActions:
      - action: Sigkill      # actively terminate the process, not just alert
```

The enforcement action (`Sigkill`, or blocking the syscall outright) happens in-kernel, before the malicious action's effects propagate — a meaningfully faster response than a userspace security tool that observes a log line, evaluates it, and *then* takes action, which by definition happens after the fact.

## `bpftrace` — Ad Hoc Kernel Tracing for Live Investigation

For a one-off production investigation — "which process is opening this specific file," "what's causing these syscall failures" — `bpftrace` provides a high-level scripting language for eBPF, letting an engineer write a targeted trace without building or deploying a purpose-built tool:

```bash
# Trace every TCP connection attempt in real time, printing process name and destination
bpftrace -e 'kprobe:tcp_connect { printf("%s -> %s\n", comm, ntop(args->daddr)); }'

# Count syscalls by process name over a fixed window — useful for spotting
# an unexpectedly syscall-heavy process during a performance investigation
bpftrace -e 'tracepoint:raw_syscalls:sys_enter { @[comm] = count(); }'

# Trace file opens by a specific process name — useful for "what is this
# process actually touching on disk" during an incident
bpftrace -e 'tracepoint:syscalls:sys_enter_openat /comm == "suspicious_proc"/ { printf("%s\n", str(args->filename)); }'
```

`bpftrace` is explicitly a debugging/investigation tool, not a production monitoring system — its one-liners are written and run interactively for a specific question, in contrast to Cilium/Hubble/Tetragon, which run continuously as a deployed part of the cluster.

## XDP — Line-Rate Packet Filtering Before the Kernel Network Stack

Cilium's standard eBPF hooks (TC, covered implicitly via CiliumNetworkPolicy in Overview) operate after packets have already entered the kernel's network stack. **XDP** (eXpress Data Path) hooks even earlier — at the network driver level, before the kernel stack processes the packet at all — which is what makes it capable of dropping malicious or unwanted traffic at genuinely line-rate speed:

```bash
# Cilium can be configured to use XDP for specific high-performance
# scenarios — most commonly DDoS mitigation, where dropping unwanted
# packets before they reach the kernel network stack at all matters most
# (configured via Cilium Helm values, not a standalone XDP program in
# typical Cilium usage)
helm upgrade cilium cilium/cilium -n kube-system --reuse-values \
  --set loadBalancer.acceleration=native   # enables XDP-accelerated load balancing
```

The practical distinction worth internalizing: TC-hooked eBPF (standard Cilium networking) is fast; XDP is faster specifically because it skips kernel network-stack processing entirely for packets it decides to drop or redirect — the tradeoff is XDP programs are more constrained in what they can do, since they run before the kernel has assembled most of the context a TC-hooked program has available.

## Pixie — Auto-Instrumented Application Observability

Distinct from Cilium/Hubble's network-level observability, Pixie uses eBPF uprobes to auto-instrument *application-level* behavior — HTTP requests, gRPC calls, SQL queries — with zero code changes and no sidecar, by attaching to the relevant library functions directly in the running process:

```bash
# After installing the Pixie agent on the cluster (via px deploy)
px run px/http_data -- -start_time="-5m"       # HTTP request data, last 5 minutes
px run px/service_stat_graph                    # auto-generated service dependency graph
```

This fills a different gap than Hubble — Hubble shows *that* traffic flowed between two pods and whether it was allowed; Pixie shows the actual application-level content of that traffic (the HTTP path, the response code, the SQL query text) without requiring APM instrumentation libraries in the application itself, which is the same "observability without code changes" value proposition eBPF brings to networking, applied to application-layer visibility instead.
