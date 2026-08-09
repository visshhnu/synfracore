# eBPF & Cilium — Troubleshooting

## Cilium agent pods `CrashLoopBackOff` after enabling kube-proxy replacement

**Symptom:** after installing Cilium with `kubeProxyReplacement=true` on a cluster that previously ran standard kube-proxy, the `cilium` agent pods crash-loop instead of starting cleanly.

**Root cause:** the most common cause is that kube-proxy's own iptables rules were never removed before Cilium took over — the two systems both trying to manage the same Service routing rules conflict. A second common cause is a kernel version too old for the specific eBPF features kube-proxy replacement requires (full replacement needs a reasonably modern kernel; older nodes may only support partial functionality).

**Fix:** confirm kube-proxy is actually removed (not just scaled down) before or immediately after Cilium installs with replacement enabled — Cilium's own docs provide a migration script for exactly this handoff, and skipping it is the single most common cause of this failure. Check the specific crash reason before assuming it's the iptables conflict, since a kernel-version incompatibility produces a similar-looking crash but needs a different fix (upgrading the node, not touching kube-proxy):

```bash
kubectl logs -n kube-system -l k8s-app=cilium --previous   # shows the actual crash reason
cilium status                                               # reports kube-proxy-replacement mode and health
uname -r                                                     # confirm kernel version on the affected node
```

## `CiliumNetworkPolicy` unexpectedly blocks traffic that was working before

**Symptom:** applying a new `CiliumNetworkPolicy` for one service causes traffic to a *different*, previously-unrestricted service to start failing.

**Root cause:** Kubernetes NetworkPolicy semantics (which Cilium implements, plus its L7 extensions) are default-allow until *any* policy selects a given pod — the moment even one `CiliumNetworkPolicy` has an `endpointSelector` matching a pod, that pod becomes default-deny for the traffic direction(s) covered, and anything not explicitly allowed by some policy is now blocked. Teams that expect policies to be purely additive are frequently surprised the first time a new policy accidentally makes an unrelated-looking pod default-deny.

**Fix:** `hubble observe --verdict DROPPED` shows exactly which flows are being denied and why, in real time — this is the fastest way to distinguish "policy is working as intended, traffic really should be blocked" from "policy accidentally selected the wrong pods." Confirm the new policy's `endpointSelector` labels aren't broader than intended (a loosely-specified label selector matching more pods than the one actually being secured is the usual root cause):

```bash
hubble observe --verdict DROPPED --namespace production
```

```yaml
# A selector this broad affects every pod with app label starting similarly —
# check for accidental over-matching before assuming the policy is correct
endpointSelector:
  matchLabels:
    app: payment-api   # confirm this doesn't also match payment-api-worker, payment-api-consumer, etc.
```

## Hubble UI shows no flow data at all

**Symptom:** the Hubble UI loads but shows an empty or perpetually-loading flow view, even though traffic is clearly moving through the cluster.

**Root cause:** Hubble's UI depends on `hubble-relay` being deployed and healthy — it aggregates flow data from every node's local Hubble instance. If Cilium was installed without `--set hubble.relay.enabled=true` (or it was enabled later without a full upgrade), the UI has nothing to query even though per-node flow collection itself may be working fine.

**Fix:** confirm `hubble-relay` is actually running, and that the per-node Hubble collection is enabled — these are two separate flags and both are needed for the UI to show anything:

```bash
kubectl get pods -n kube-system -l k8s-app=hubble-relay
cilium status --verbose | grep -i hubble   # confirms whether Hubble itself is enabled per-node

# If missing, enable both and upgrade in place rather than reinstalling:
helm upgrade cilium cilium/cilium -n kube-system \
  --reuse-values \
  --set hubble.relay.enabled=true \
  --set hubble.ui.enabled=true
```

The `hubble observe` CLI querying a single node directly can still work even when the UI/relay setup is broken — if `hubble observe` shows flows but the UI doesn't, that specifically confirms the problem is relay/UI wiring, not flow collection itself.

## eBPF program fails to load with a verifier or "operation not permitted" error

**Symptom:** a Cilium agent, Tetragon, or other eBPF-based tool logs a failure attempting to load its eBPF program, and refuses to start.

**Root cause:** two common causes. First, the kernel version is too old to support the specific eBPF features the program needs — eBPF's capability set has grown significantly across kernel versions, and a program compiled/designed for a newer kernel's feature set will fail the verifier or fail to load on an older one. Second, the BPF filesystem isn't mounted where the tool expects it (`/sys/fs/bpf`), which is required for pinning maps and programs so they survive the managing process restarting.

**Fix:** check the specific error first — a verifier rejection (specific bytecode-level complaint) points at a kernel-feature gap, while a filesystem-related error points at the BPF mount:

```bash
mount | grep bpf                          # confirm /sys/fs/bpf is mounted
uname -r                                   # compare against the tool's documented minimum kernel version
dmesg | grep -i bpf                        # kernel-level BPF errors often surface here, not just in the app's own log
```

Running eBPF-based tools inside containers additionally requires the container to have the right privileges (`CAP_BPF`/`CAP_SYS_ADMIN` depending on kernel version, or full `privileged: true` on older kernels lacking the finer-grained `CAP_BPF`) — a pod running without these capabilities fails to load any eBPF program regardless of kernel support.

## Cilium Cluster Mesh shows clusters connected but pod-to-pod traffic fails

**Symptom:** `cilium clustermesh status` reports both clusters as connected, but a pod in one cluster genuinely cannot reach a pod in the other.

**Root cause:** Cluster Mesh connectivity status reflects whether the control-plane connection (etcd sync between clusters) is healthy — it doesn't by itself guarantee the actual data-plane path is open. The most common real cause of this specific symptom is a network-level block between clusters (firewall rules, security groups) on the ports Cilium's data plane actually uses for inter-cluster pod traffic, separate from the control-plane connection's own port.

**Fix:** verify data-plane connectivity directly rather than trusting only the control-plane status:

```bash
cilium clustermesh status --verbose      # control-plane connection status
hubble observe --to-identity <remote-cluster-identity>   # checks whether cross-cluster flows are actually happening
```

Confirm the firewall/security-group rules between the two clusters' node networks allow the specific ports Cilium's inter-cluster data plane uses (VXLAN/Geneve overlay traffic, typically), not just the API-server-adjacent ports the control-plane sync uses — these are commonly opened separately and it's easy to open one and forget the other.

## Nodes running Cilium show unexpectedly high memory usage, or connection tracking failures under load

**Symptom:** node memory usage climbs steadily under sustained high-connection-count traffic, and new connections start failing with `Fragmentation needed` or similar errors, once volume is high enough.

**Root cause:** Cilium's eBPF connection-tracking (conntrack) map has a fixed size, and once it's full, new connection entries can't be created — this looks like a networking failure but is actually a capacity-tuning problem specific to very high connection-count workloads (a service handling extremely high connection churn, not just high throughput).

**Fix:** check the conntrack map's current utilization against its configured size, and increase the size if genuinely near capacity for the workload's real connection volume:

```bash
cilium bpf ct list global | wc -l    # rough current entry count
cilium status --verbose | grep -i "conntrack\|map"
```

```yaml
# Helm values — raise conntrack table size for genuinely high-connection-count clusters
bpf:
  ctTcpMax: 524288    # raised from the default for a workload with very high connection churn
```

Raising this should be based on confirmed utilization near the limit, not applied preemptively — an oversized conntrack table consumes more memory per node for no benefit on workloads that were never near the default limit in the first place.

---

## Official Resources

- [Cilium Troubleshooting Guide](https://docs.cilium.io/en/stable/operations/troubleshooting/)
- [eBPF.io — Official Site](https://ebpf.io/)
- [Hubble Documentation](https://docs.cilium.io/en/stable/gettingstarted/hubble/)

---
