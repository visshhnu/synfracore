# eBPF & Cilium — PYQ (Previously Asked / Practice Questions)

**Framing note:** eBPF and Cilium (via CNCF) don't administer a proctored public certification with a leaked-question archive. What follows is built from this guide's own Overview/Intermediate/Advanced/Troubleshooting material, framed as practice questions grounded in real, documented eBPF/Cilium behavior.

---

### 1. (Domain: eBPF Fundamentals) What specifically does the eBPF verifier reject, and why is this what makes eBPF "safe" to run in the kernel?

**Answer:** The verifier statically analyzes every possible execution path of a program before allowing it to load, rejecting anything it can't prove terminates and stays within memory bounds — an unbounded `while(true)` loop is rejected outright, and every memory access must be checked against a known valid range. This is a static proof requirement enforced entirely before execution, not a runtime safety net — which is the concrete mechanism behind "eBPF cannot crash the kernel," distinct from a runtime system that catches problems as they happen.

---

### 2. (Domain: Cilium Networking) A standard Kubernetes NetworkPolicy can allow or deny traffic on port 8080. What can a `CiliumNetworkPolicy` do that a standard NetworkPolicy structurally cannot?

**Answer:** L7/HTTP-aware policy — a `CiliumNetworkPolicy` can distinguish `GET /api/v1/status` from `POST /api/v1/charge` on the same port, allowing one and denying the other. A standard Kubernetes NetworkPolicy operates at L3/L4 only and has no concept of HTTP method or path — it can only allow or deny the port entirely, with no visibility into what's actually being requested over that connection.

---

### 3. (Domain: Hubble) The Hubble CLI (`hubble observe`) shows flows correctly when queried directly against a node, but the Hubble UI shows nothing. What's the most likely cause?

**Answer:** `hubble-relay` not being enabled or not running — the UI depends specifically on `hubble-relay` aggregating flow data from every node's local Hubble instance, while `hubble observe` at the CLI can query a single node's local collection directly without needing relay. Both `hubble.relay.enabled=true` and per-node Hubble collection are two separate flags, both required for the UI to show anything — CLI working but UI empty specifically confirms the problem is relay/UI wiring, not flow collection itself.

---

### 4. (Domain: Tetragon) How does Tetragon's enforcement model differ fundamentally from Falco's, and why does that difference matter for response time?

**Answer:** Falco is detection-only — it observes suspicious kernel-level behavior and generates an alert after the fact, requiring a separate response action. Tetragon can actively enforce policy at the kernel level (e.g., `Sigkill` on a matched syscall pattern), terminating the process in-kernel before the malicious action's effects propagate. This is meaningfully faster than a userspace tool observing a log line, evaluating it, and then taking action — enforcement happens before, not after.

---

### 5. (Domain: CO-RE) What problem does CO-RE (Compile Once – Run Everywhere) solve, and what kernel-side component makes it possible?

**Answer:** Early eBPF programs had to be compiled separately per kernel version, since kernel data structure layouts can differ across versions — a real operational problem for a fleet of nodes potentially running different kernel versions. BTF (BPF Type Format), kernel-embedded type metadata, lets a single CO-RE-compiled program resolve struct offsets correctly at load time for whatever kernel it's actually running on, rather than needing a kernel-version-matched build pipeline.

---

### 6. (Domain: XDP) Why is XDP capable of "line-rate" packet filtering in a way standard TC-hooked eBPF (Cilium's normal networking path) isn't?

**Answer:** XDP hooks at the network driver level, before packets enter the kernel's network stack at all — TC-hooked eBPF operates after packets have already entered that stack. Skipping kernel network-stack processing entirely for packets XDP decides to drop or redirect is what makes it faster specifically for high-volume filtering (like DDoS mitigation), at the cost of XDP programs being more constrained in what they can do, since they run before the kernel has assembled most of the context a TC-hooked program has available.

---

### 7. (Domain: Encryption) When would a team choose IPSec over WireGuard for Cilium's transparent encryption, given WireGuard's generally lower overhead?

**Answer:** When a specific compliance framework mandates IPSec by name, rather than accepting any encryption protocol that provides equivalent security properties. This is a case where the "better" technical choice (WireGuard, generally simpler key rotation and lower CPU overhead) is genuinely conditional on an external requirement — a team without that specific compliance constraint would typically default to WireGuard.

---

### 8. (Domain: Egress Gateway) A partner's firewall needs to allowlist traffic from a small, predictable set of IPs. Why is Cilium's Egress Gateway a better fit than allowlisting the cluster's node IP range?

**Answer:** Allowlisting the entire node IP range is both broader than necessary (any pod on any node could technically originate matching traffic) and fragile (the node IP range can change as the cluster scales). Egress Gateway routes traffic matching a specific policy through designated gateway nodes, presenting one consistent, predictable source IP regardless of which node the originating pod actually runs on — giving the partner a genuinely small, stable allowlist rather than the cluster's full, potentially-changing node range.

---

### 9. (Domain: bpftrace) Why is `bpftrace` described as a debugging tool rather than a production monitoring system, in contrast to Cilium/Hubble?

**Answer:** `bpftrace` one-liners are written and run interactively for a specific, one-off investigative question ("which process is opening this file right now") — it's not deployed as a continuously-running part of the cluster the way Cilium/Hubble/Tetragon are. It's the right tool for live, ad hoc investigation during an incident, not for ongoing, always-on observability — using it as a substitute for deployed monitoring would mean re-running manual queries constantly rather than having continuous visibility.

---

### 10. (Domain: Pixie) What gap does Pixie fill that Hubble's network-level observability doesn't cover?

**Answer:** Hubble shows *that* traffic flowed between two pods and whether it was allowed — network-level visibility. Pixie uses eBPF uprobes to auto-instrument application-level behavior (HTTP requests, gRPC calls, SQL queries) with zero code changes, showing the actual application-level content of that traffic — the HTTP path, response code, or SQL query text — which Hubble's network-layer view doesn't capture. They're complementary layers, not competing tools for the same job.
