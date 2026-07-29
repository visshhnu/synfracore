# Networking for DevOps — PYQ (Previously Asked / Practice Questions)

**Framing note:** CompTIA Network+, Cisco CCNA, AWS ANS-C01, and Azure AZ-700 are all proctored, confidential exams — no public past-paper archive exists. What follows is built from the **current exam domains** these certifications actually test (Network+ N10-009 and CCNA 200-301 domain weights are listed in this course's own certification material), framed as practice questions rather than invented "leaked" content.

---

### 1. (CCNA domain: IP Connectivity, 25% — largest single domain) You need to split `192.168.1.0/24` into subnets: one for 50 hosts, one for 25 hosts, one for 10 hosts. Using VLSM, what are the resulting subnets?

**Answer:** Allocate from largest to smallest to avoid fragmentation waste: 50 hosts needs a `/26` (64 addresses, 62 usable) → `192.168.1.0/26`. 25 hosts needs a `/27` (32 addresses, 30 usable) → `192.168.1.64/27`. 10 hosts needs a `/28` (16 addresses, 14 usable) → `192.168.1.96/28`. This is exactly the VLSM example already in this course's own certification material — the key skill being tested is allocating largest-requirement-first so smaller subnets can fit into the remaining address space without gaps or overlap.

---

### 2. (Network+ domain: Networking Concepts) A network engineer says "we're seeing a lot of TIME_WAIT connections on this server." Is this necessarily a problem, and what would make it one?

**Answer:** Not necessarily — TIME_WAIT is a normal part of TCP connection teardown (the connection stays in that state for 2×MSL after close specifically to handle any delayed duplicate packets), and a high-traffic server legitimately churns through many short-lived connections. It becomes a real problem when TIME_WAIT sockets accumulate faster than they're recycled, eventually exhausting available ephemeral ports — at which point new outbound connections start failing. The fix, when it is a genuine problem, involves kernel tuning (`net.ipv4.tcp_tw_reuse`, reduced `tcp_fin_timeout`) covered in this course's Intermediate material — but the first step is confirming it's actually causing port exhaustion, not just observing a number that looks high in isolation.

---

### 3. (CCNA domain: Network Access) What's the difference between a Layer 2 switch flooding a frame and a hub broadcasting, and why does this distinction matter for a network engineer troubleshooting unexpected traffic visibility?

**Answer:** A switch normally forwards frames only to the specific port associated with the destination MAC address in its MAC address table — flooding only happens when the destination MAC is unknown (not yet learned) or for broadcast/multicast traffic, and it's a fallback behavior, not the switch's normal operating mode. A hub has no MAC address table at all and broadcasts every frame to every port unconditionally, as its only mode of operation. This distinction matters practically because a switch's normal behavior is why passively sniffing your own network interface doesn't show other devices' unicast traffic (see this course's own material on why simple packet capture doesn't reveal others' traffic on modern switched networks) — that's specifically switch behavior, and would be entirely different (and much less secure) on hub-based infrastructure.

---

### 4. (AWS ANS-C01 domain: Hybrid Networking) A company wants to connect their on-premises data center to an AWS VPC with consistent, predictable low latency for a database replication workload. Should they use a VPN or Direct Connect, and why?

**Answer:** Direct Connect — it's a dedicated physical network connection to AWS, bypassing the public internet entirely, which gives more consistent latency and bandwidth than a VPN (which tunnels over the public internet and inherits its variability). A VPN is faster and cheaper to set up and is the right choice when the workload can tolerate some latency variability or when the traffic volume doesn't justify Direct Connect's higher cost and longer provisioning lead time — but for latency-sensitive, consistent-throughput workloads like database replication, Direct Connect's dedicated connection is the specific reason it exists as a separate product from VPN.

---

### 5. (Network+ / CCNA shared domain: Network Troubleshooting) A `curl -v` to an HTTPS endpoint hangs and eventually times out, with no TLS handshake output at all — not even a connection attempt. What layer is the problem most likely at, and what's the next diagnostic command?

**Answer:** If there's no TLS handshake output whatsoever (not even a failed attempt), the problem is likely below the TLS layer entirely — most likely the TCP connection itself isn't being established, which points to either DNS resolving to the wrong address, a routing issue, or a firewall silently dropping the packets rather than actively rejecting them (a rejected connection fails fast; a silently dropped one hangs until timeout, which matches the described symptom). Next diagnostic step: `nc -zv <host> 443` or `telnet <host> 443` to isolate whether this is purely a TCP-level connectivity problem, independent of TLS or HTTP entirely — confirming the layer before assuming the fix.

---

### 6. (AZ-700 domain: Azure Load Balancing) An application needs SSL termination, path-based routing (`/api` vs `/static` to different backend pools), and Web Application Firewall capability. Which Azure load balancing service fits, and why wouldn't Azure Load Balancer (the basic L4 service) work here?

**Answer:** Azure Application Gateway — it operates at L7 specifically to provide path-based routing and SSL termination, and includes an integrated WAF option. Azure Load Balancer (the basic, confusingly-similarly-named service) operates at L4 only — it routes based on IP and port with no visibility into HTTP content at all, so it structurally cannot do path-based routing or WAF filtering, regardless of configuration. This is exactly the L4-vs-L7 distinction covered in this course's own material: an L4 tool can't be configured into doing L7-level routing, because it never inspects the traffic at that level in the first place.

---

### 7. (CCNA domain: Security Fundamentals, 15%) What's the difference between a stateful firewall and a stateless one (like a basic NACL), and why does a stateless firewall need explicit rules for both directions of traffic?

**Answer:** A stateful firewall (most host-based firewalls, most Security Groups) tracks the state of a connection — once it allows an outbound request, it automatically permits the corresponding inbound response without a separate explicit rule. A stateless filter (like an AWS NACL) evaluates every packet independently with no memory of prior traffic, meaning an explicit inbound *and* a separate explicit outbound rule are both needed to allow a single request/response exchange to complete — a common real mistake is configuring only the inbound allow rule on a stateless NACL and being confused when responses never get back to the client, because the corresponding outbound rule was never added.

---

### 8. (Network+ domain: Network Implementations) A company is deploying a service that needs session persistence (a user's requests should keep hitting the same backend server) without using cookies, since the client is a non-browser API consumer that won't handle cookies. What load balancing algorithm fits, and what's its known weakness?

**Answer:** IP Hash — it deterministically routes based on a hash of the client's source IP, giving the same client the same backend without needing any cookie mechanism. Its known weakness: clients behind a shared NAT (a large corporate network, a mobile carrier's NAT) all present the same source IP, meaning IP Hash can route many distinct real users to the same single backend, causing uneven load distribution that isn't visible from the load balancer's perspective at all — it's doing exactly what it's designed to do, but the assumption "one IP = one client" breaks down in that specific scenario.

---

### 9. (CCNA domain: Automation and Programmability, 10% — smallest but still tested) Why does a `NetworkPolicy` in Kubernetes get described as declarative, and what does that actually mean for how it takes effect compared to a manually-run `iptables` command?

**Answer:** A NetworkPolicy is a declared desired state (a YAML manifest describing which traffic should be allowed) that Kubernetes' networking layer (via the CNI plugin — Calico, Cilium, etc.) continuously reconciles against, rather than a one-time imperative command executed once. This means if a node reboots, a pod reschedules, or the underlying `iptables`/eBPF rules get cleared for any reason, the CNI plugin re-applies the declared policy automatically — a manually-run `iptables` command has no such persistence or self-healing property; it's a one-time action that simply reflects the current state at the moment it ran, with nothing to reapply it if the underlying state changes.

---

### 10. (Network+ / CCNA shared domain: Wireless & general networking overlap with security) Why does this course's own security-adjacent material treat "the network is internal, so it's trusted" as an outdated assumption, and what specific networking control replaces that assumption in a Zero Trust model?

**Answer:** The "internal = trusted" assumption breaks down the moment any single internal device is compromised (a phished laptop, a vulnerable IoT device on the same flat network) — at that point, the compromised device is "internal" by definition and every other internal system trusts it under the old model's own logic. The networking-level control that replaces this assumption is micro-segmentation — Kubernetes NetworkPolicies, per-workload firewall rules, or a service mesh's mTLS enforcement between services — treating every internal connection as needing explicit authorization, rather than treating "originates from inside the network" as sufficient trust on its own. This is the same principle covered in this course's own Kubernetes zero-trust NetworkPolicy material, applied at the broader network-architecture level rather than just within a single cluster.
