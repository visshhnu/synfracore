# eBPF & Cilium — Portfolio Projects

Build these 3 projects to prove eBPF/Cilium mastery. Each includes code, architecture, and interview talking points.

---

## Project 1: L7-Aware Network Policy With Hubble Observability

**Level:** Beginner | **Time:** 1 day | **GitHub:** `cilium-l7-policy-hubble`

**What you build:** A multi-service cluster with a `CiliumNetworkPolicy` enforcing HTTP-path-aware access control (not just port-level), verified live via Hubble.

### L7 policy
```yaml
apiVersion: cilium.io/v2
kind: CiliumNetworkPolicy
metadata: { name: api-l7-policy }
spec:
  endpointSelector: { matchLabels: { app: payment-api } }
  ingress:
    - fromEndpoints: [{ matchLabels: { app: checkout-service } }]
      toPorts:
        - ports: [{ port: "8080", protocol: TCP }]
          rules:
            http:
              - method: "GET"
                path: "/api/v1/status"
              - method: "POST"
                path: "/api/v1/charge"
```

### Interview points
- This is the concrete "adds L7/HTTP-aware policies" advantage over standard Kubernetes NetworkPolicy referenced in Overview — a standard NetworkPolicy could only allow/deny port 8080 entirely, not distinguish `GET /status` from `POST /charge`
- `hubble observe --verdict DROPPED` as the live debugging tool for confirming a policy is doing exactly what's intended, not more or less
- Explaining why this doesn't require any application-level changes — the enforcement happens at the eBPF datapath, transparent to the application itself

### Steps
1. Deploy two services where one should only reach specific HTTP paths on the other
2. Write and apply the L7 `CiliumNetworkPolicy` above
3. Confirm allowed paths succeed and disallowed paths are dropped, using `hubble observe` to watch it live
4. Deliberately broaden the `endpointSelector` and observe the unintended traffic now succeeding — then narrow it back and document the mistake
5. Document the Hubble flow output (allowed vs. dropped) as evidence in the README

---

## Project 2: Tetragon Runtime Enforcement Policy

**Level:** Intermediate | **Time:** 2 days | **GitHub:** `tetragon-runtime-enforcement`

**What you build:** A Tetragon `TracingPolicy` that actively blocks a specific suspicious syscall pattern in real time, demonstrating enforcement (not just detection).

### Enforcement policy
```yaml
apiVersion: cilium.io/v1alpha1
kind: TracingPolicy
metadata: { name: block-suspicious-connect }
spec:
  kprobes:
    - call: "__x64_sys_connect"
      syscall: true
      args: [{ index: 0, type: "int" }]
      selectors:
        - matchArgs:
            - { index: 0, operator: "Equal", values: ["1"] }
          matchActions: [{ action: Sigkill }]
```

### Interview points
- The core distinguishing claim to be able to defend concretely: Tetragon's `Sigkill` action happens in-kernel, before the malicious action's effects propagate — meaningfully faster than a userspace tool (like Falco) that observes a log line and reacts after the fact
- Being able to demonstrate this live — trigger the blocked behavior and show the process actually gets killed, not just that an alert fires — is the difference between describing enforcement and proving it
- Explaining the real operational risk of enforcement policies (a too-broad match killing a legitimate process) and why staging a policy in detection-only mode first is a real, recommended practice

### Steps
1. Install Tetragon alongside Cilium
2. Write a `TracingPolicy` targeting a specific, safely-reproducible syscall pattern
3. Trigger the matched behavior and confirm the process is actually terminated, not just logged
4. Document the exact before/after — command run, expected vs. actual process outcome
5. Discuss in the README when you'd stage this policy in detection-only mode before enabling enforcement in production

---

## Project 3: WireGuard Transparent Encryption With Egress Gateway

**Level:** Advanced | **Time:** 3-4 days | **GitHub:** `cilium-encryption-egress-gateway`

**What you build:** A cluster with node-to-node WireGuard encryption enabled and an Egress Gateway presenting a consistent source IP for traffic to an external allowlisted service.

### Enable WireGuard encryption
```bash
helm upgrade cilium cilium/cilium -n kube-system --reuse-values \
  --set encryption.enabled=true \
  --set encryption.type=wireguard
```

### Egress Gateway policy
```yaml
apiVersion: cilium.io/v2
kind: CiliumEgressGatewayPolicy
metadata: { name: partner-api-egress }
spec:
  selectors: [{ podSelector: { matchLabels: { app: payment-api } } }]
  destinationCIDRs: ["203.0.113.0/24"]
  egressGateway:
    nodeSelector: { matchLabels: { egress-gateway: "true" } }
    egressIP: "198.51.100.10"
```

### Interview points
- WireGuard vs. IPSec — being able to explain the tradeoff (generally lower operational overhead and simpler key rotation with WireGuard, unless a specific compliance framework mandates IPSec by name) rather than treating it as an arbitrary choice
- Egress Gateway's concrete production value: solving "a partner's firewall needs a small, predictable allowlist" without either allowlisting the entire cluster's node IP range or building a separate NAT gateway outside Kubernetes
- Confirming encryption is actually happening (not just configured) — via a packet capture on the wire, not just trusting the Helm flag was applied correctly

### Steps
1. Enable WireGuard transparent encryption via Helm
2. Verify with a packet capture between two nodes that inter-node traffic is genuinely encrypted, not just configured to be
3. Set up an Egress Gateway policy routing a specific pod's egress through a designated gateway node
4. Confirm the consistent source IP from the external destination's perspective (a simple test listener works for this)
5. Document both verifications (encryption confirmed on the wire, consistent egress IP confirmed externally) in the README — configuration alone isn't sufficient evidence

---

## Portfolio Checklist
- [ ] All repos public on GitHub with clear READMEs
- [ ] README includes the full Cilium/Tetragon policy YAML and how to reproduce the setup
- [ ] Can explain why eBPF enforcement happens in-kernel, before effects propagate, without notes in an interview
- [ ] Project 1's Hubble flow evidence (allowed vs. dropped) is documented, not just described
- [ ] Project 3 includes actual verification evidence (packet capture, external IP check), not just the Helm/policy configuration
