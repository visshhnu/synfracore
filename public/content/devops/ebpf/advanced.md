# eBPF & Cilium — Advanced

## eBPF Verifier Internals — What Actually Gets Rejected

The verifier (referenced throughout Overview/Interview Prep as "the thing that makes eBPF safe") works by statically analyzing every possible execution path of a program before allowing it to load — rejecting anything it can't prove terminates and stays within memory bounds. Concretely, this means: loops must be provably bounded (unbounded `while(true)` constructs are rejected outright, which is why eBPF programs use bounded loop constructs or the newer bounded-loop support with explicit iteration limits rather than arbitrary loops), every memory access must be checked against a known valid range before the verifier will allow it, and the total number of instructions and possible execution paths is capped — a sufficiently complex program can be rejected purely for being too large for the verifier to exhaustively analyze, even if it's logically correct.

```c
/* Conceptual example of what the verifier rejects vs. allows —
   illustrative C reduced from real eBPF C, not directly compilable */

/* REJECTED — unbounded loop, verifier cannot prove termination */
while (packet_has_more_data(pkt)) {
    process_next_field(pkt);
}

/* ALLOWED — explicitly bounded, verifier can prove max iterations */
#pragma unroll
for (int i = 0; i < MAX_FIELDS; i++) {
    if (!packet_has_more_data(pkt)) break;
    process_next_field(pkt);
}
```

This is the concrete mechanism behind "eBPF cannot crash the kernel" — it's not a runtime safety net catching problems as they happen, it's a static proof requirement enforced entirely before the program is ever allowed to execute.

## CO-RE — Compile Once, Run Everywhere

Early eBPF programs had to be compiled separately per target kernel version, since kernel data structure layouts can differ across versions — a real deployment problem for a tool meant to run across a fleet of nodes potentially running different kernel versions. **CO-RE** (Compile Once – Run Everywhere) solves this using BTF (BPF Type Format) metadata embedded in the kernel, letting a single compiled eBPF program adapt its memory-layout assumptions at load time to whatever kernel it's actually running on:

```bash
# Confirm a kernel has BTF support — required for CO-RE to function
ls /sys/kernel/btf/vmlinux
# Presence of this file means the kernel exposes its own type information,
# which CO-RE-compiled programs read at load time to resolve struct
# offsets correctly for that specific kernel, instead of needing a
# separately-compiled binary per kernel version
```

This is why modern Cilium/Tetragon/Falco deployments (all CO-RE-compiled) can ship one set of eBPF binaries across a heterogeneous fleet of nodes running different kernel versions, rather than needing a kernel-version-matched build pipeline — a genuinely significant operational simplification for exactly the "many nodes, not all identical" reality of a real production Kubernetes fleet.

## Cilium Transparent Encryption — WireGuard vs. IPSec

For inter-node traffic that needs encryption in transit (a real compliance requirement in many environments), Cilium supports transparent encryption at the eBPF datapath level — meaning pod-to-pod traffic across nodes gets encrypted without any application-level TLS configuration, and without a sidecar proxy doing the encryption:

```yaml
# WireGuard — generally the lower-overhead, simpler-to-operate option
# for node-to-node encryption
helm upgrade cilium cilium/cilium -n kube-system --reuse-values \
  --set encryption.enabled=true \
  --set encryption.type=wireguard
```

```yaml
# IPSec — the alternative, sometimes required for specific compliance
# frameworks that mandate IPSec specifically rather than accepting
# any encryption protocol
helm upgrade cilium cilium/cilium -n kube-system --reuse-values \
  --set encryption.enabled=true \
  --set encryption.type=ipsec
```

WireGuard is generally the simpler operational choice (simpler key rotation, lower CPU overhead) unless a specific compliance requirement mandates IPSec by name — this is a case where the "better" choice technically is genuinely conditional on an external requirement, not a universal recommendation.

## Egress Gateway — Consistent Source IPs for Cluster Egress

A common real production requirement: an external system (a partner API, a legacy firewall-restricted service) needs traffic from the cluster to originate from a small, predictable set of IP addresses — not the potentially-changing pod IPs a dynamic Kubernetes cluster naturally produces. Cilium's Egress Gateway routes egress traffic matching a policy through designated gateway nodes, presenting a consistent source IP regardless of which node the originating pod actually runs on:

```yaml
apiVersion: cilium.io/v2
kind: CiliumEgressGatewayPolicy
metadata: { name: partner-api-egress }
spec:
  selectors:
  - podSelector: { matchLabels: { app: payment-api } }
  destinationCIDRs: ["203.0.113.0/24"]   # the partner's IP range
  egressGateway:
    nodeSelector: { matchLabels: { egress-gateway: "true" } }
    egressIP: "198.51.100.10"             # the consistent source IP presented externally
```

Without this, allowlisting cluster traffic on a partner's firewall would require either allowlisting the cluster's entire (potentially large, changing) node IP range, or building a separate NAT gateway outside Kubernetes specifically to solve this — Egress Gateway solves it natively at the eBPF datapath layer instead.
