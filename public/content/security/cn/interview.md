# Computer Networks — Interview Questions

**Q: Explain the OSI model and why it matters.**
A: The OSI model is a 7-layer conceptual framework for network communication. Each layer has specific responsibilities and communicates with adjacent layers via standardized interfaces. It matters because: troubleshooting becomes systematic (if Layer 1 is fine but Layer 3 fails, check routing); protocol designers know exactly what their protocol must do; vendors can build interoperable products. Real protocols don't exactly map to OSI (TCP/IP uses 4 layers) but OSI remains the universal reference framework.

**Q: Difference between TCP and UDP with examples.**
A: TCP: connection-oriented, guarantees delivery via ACKs, retransmits lost packets, delivers in order, has congestion control. Use: HTTP/HTTPS (web), FTP (file transfer), SMTP (email) — where data integrity is required. UDP: connectionless, no delivery guarantee, no ordering, faster, lower overhead. Use: DNS (small queries, retries handled at application), video streaming, online gaming, VoIP — where speed matters more than perfect delivery. QUIC (HTTP/3) runs over UDP but implements reliability at the application layer.

**Q: How does DNS work? Walk through resolving google.com.**
A: 1) Browser checks its DNS cache. 2) OS checks /etc/hosts and its DNS resolver cache. 3) Query goes to local DNS resolver (configured via DHCP, typically ISP or 8.8.8.8). 4) Resolver checks its cache; if not found, queries a Root nameserver. 5) Root refers resolver to .com TLD nameserver. 6) .com TLD nameserver refers to Google's authoritative nameserver. 7) Authoritative nameserver returns A record (IP: 142.250.x.x). 8) Resolver caches result (per TTL) and returns to client. This is recursive resolution — the resolver does the work on behalf of the client.

**Q: What is subnetting and why is it used?**
A: Subnetting divides a large IP network into smaller sub-networks. Reasons: reduce broadcast domain size (broadcasts stay within subnet), improve security (segment departments), efficient IP space usage, hierarchical routing (routers summarize subnets). Example: 192.168.1.0/24 (254 hosts) split into four /26 (62 hosts each) for HR, IT, Finance, Management — traffic between departments must pass through router (firewall policies applied).

**Q: Explain the TCP handshake and why it's needed.**
A: 3-Way Handshake: Client sends SYN (picks initial sequence number x). Server responds SYN-ACK (acknowledges x+1, sends its sequence y). Client sends ACK (acknowledges y+1). Now both sides know each other's sequence numbers, connection is established. Purpose: synchronize sequence numbers (needed for ordered delivery), verify both sides can send and receive, agree on connection parameters (window size). Without it, retransmission and ordering mechanisms can't function correctly.

**Q: What happens when you type a URL in a browser?**
A: 1) DNS resolution (resolve hostname to IP). 2) TCP 3-way handshake with server IP on port 443. 3) TLS handshake (exchange certificates, negotiate cipher, derive session key). 4) HTTP GET request sent over encrypted connection. 5) Server processes request, returns HTTP response (200 OK + HTML). 6) Browser parses HTML, discovers resources (CSS, JS, images). 7) Additional DNS + TCP + HTTP requests for each resource (HTTP/2 multiplexes on one connection). 8) Browser renders DOM, applies CSS, executes JavaScript. 9) Page displayed.

**Q: Difference between a hub, switch, and router.**
A: Hub (Layer 1): receives signal, broadcasts to all ports — all devices share bandwidth, no intelligence. Switch (Layer 2): learns MAC addresses, forwards frames only to destination port — each device gets full bandwidth, forms separate collision domains (same broadcast domain). Router (Layer 3): routes packets between networks using IP addresses — connects different subnets/networks, creates separate broadcast domains, implements NAT and firewall policies. Modern networks: switches within a subnet, routers between subnets.

**Q: What is VLAN and when would you use it?**
A: VLAN (Virtual LAN) logically segments a physical switch into multiple isolated broadcast domains. Use cases: isolate Finance from IT (security), group users by department not physical location, reduce broadcast traffic. Implementation: assign switch ports to VLANs; trunk ports (802.1Q) carry multiple VLANs between switches/routers using VLAN tags. Inter-VLAN routing requires a Layer 3 device (router or Layer 3 switch). VLANs provide security through isolation but are not a replacement for firewalls.

**Q: Explain BGP and why the internet needs it.**
A: The internet is composed of thousands of Autonomous Systems (AS) — networks controlled by one organization (ISPs, large companies). BGP is the protocol that exchanges routing information between AS. Unlike interior protocols (OSPF, EIGRP) which optimize for performance, BGP makes routing decisions based on policy (business relationships, cost, preference). AS-PATH prevents routing loops. BGP is intentionally slow to converge to prevent route flapping. Every network operator uses BGP to advertise their prefixes and learn others' prefixes.

**Q: What is DHCP and how does it work?**
A: DHCP (Dynamic Host Configuration Protocol) automatically assigns IP addresses to devices. Process (DORA): Discover (client broadcasts), Offer (server responds with available IP), Request (client requests offered IP), Acknowledge (server confirms lease). DHCP provides IP address, subnet mask, default gateway, DNS servers, and lease duration. Without DHCP, administrators must manually configure every device. DHCP relay agents forward requests across subnets to a central DHCP server.

**Q: Differences between IPv4 and IPv6?**
A: IPv4: 32-bit (4 billion addresses), uses ARP, has NAT, supports broadcast, variable header length. IPv6: 128-bit (340 undecillion addresses), NDP replaces ARP, no NAT needed, no broadcast (multicast instead), fixed 40-byte header (faster), built-in IPSec, stateless autoconfiguration (SLAAC). Transition mechanisms: dual-stack, 6to4 tunneling, NAT64. IPv6 adoption is approximately 40% of global internet traffic.

**Q: What is ARP and how does ARP poisoning work?**
A: ARP (Address Resolution Protocol) resolves IP addresses to MAC addresses for Ethernet communication. A device broadcasts "Who has IP X?" and the owner replies with its MAC. Results are cached in the ARP table. ARP poisoning: attacker sends fake ARP replies, associating their MAC with a victim's IP. This redirects traffic through the attacker (man-in-the-middle attack). Defense: Dynamic ARP Inspection on managed switches validates ARP packets against DHCP snooping binding table.

**Q: Explain HTTP/1.1 vs HTTP/2 vs HTTP/3 differences.**
A: HTTP/1.1: text protocol, one request per TCP connection (or persistent with pipelining but head-of-line blocking), no compression of headers. HTTP/2: binary protocol, multiplexing (multiple requests per connection, no HoL blocking at HTTP layer), header compression (HPACK), server push. Still uses TCP (HoL blocking at TCP layer). HTTP/3: runs over QUIC (UDP-based), eliminates TCP HoL blocking, 0-RTT connection establishment, built-in TLS 1.3. Major performance improvement especially on lossy networks (mobile).

**Q: What is NAT and why is it used?**
A: Network Address Translation translates private IP addresses to a public IP address (and back) at the network boundary. Used because IPv4 addresses are scarce -- millions of devices share a single public IP using PAT (Port Address Translation). A router maintains a NAT table mapping internal (IP:port) to external (public_IP:port). Limitation: breaks end-to-end connectivity (makes it hard to host servers behind NAT), complicates VoIP and peer-to-peer applications. IPv6 eliminates the need for NAT by providing enough addresses for every device.

**Q: What is a firewall and what types exist?**
A: Firewalls control network traffic based on rules. Types: Packet Filter (stateless) -- examines individual packets (src/dest IP, port, protocol), fast but no context. Stateful Inspection -- tracks connection state, more accurate (allows established connections). Application Layer (WAF) -- inspects HTTP content, blocks SQL injection, XSS. Next-Generation Firewall (NGFW) -- combines stateful + application awareness + IDS/IPS + user identity. Zone-based: divides network into zones (internal, DMZ, external) with policies between zones.

**Q: Explain the difference between symmetric and asymmetric encryption in networks.**
A: Symmetric: same key for encrypt/decrypt (AES-256, ChaCha20). Fast, suitable for bulk data. Problem: how to securely share the key? Asymmetric: key pair (public key encrypts, private key decrypts). RSA, ECDSA. Slow but solves key distribution. Networks use both: TLS uses asymmetric cryptography (ECDHE) to securely exchange a symmetric session key, then symmetric encryption (AES) for the actual data. This gives the security of asymmetric with the speed of symmetric.

**Q: What is Quality of Service (QoS) and why is it important?**
A: QoS is a set of techniques to prioritize network traffic so critical applications get guaranteed bandwidth, low latency, and low jitter. Without QoS, all traffic competes equally -- a large file download can degrade a VoIP call. Implementation: DSCP marks packets with priority (voice=EF, business=AF, best-effort=BE); queuing algorithms (LLQ, WFQ) serve high-priority queues first; traffic shaping smooths bursts; policing drops/marks excess traffic. Critical for: VoIP (needs < 150ms latency, < 30ms jitter), video conferencing, real-time trading systems.

**Q: What is MPLS and where is it used?**
A: MPLS (Multiprotocol Label Switching) adds short labels to packets at network entry and forwards by label (not IP lookup) at each hop. Used by ISPs and large enterprises for: traffic engineering (route flows around congestion), VPN services (MPLS L3VPN connects enterprise branch offices), QoS enforcement per labeled path, and reduced forwarding latency. Label Edge Routers (LER) add/remove labels at edges; Label Switch Routers (LSR) forward by label in the core. MPLS paths (LSPs) are pre-configured, enabling predictable, policy-driven routing unlike hop-by-hop IP routing.

**Q: Explain the concept of network segmentation and zero trust.**
A: Network segmentation divides the network into isolated zones to limit lateral movement after a breach. Traditional: perimeter firewall (trust everything inside). Microsegmentation: enforce policies between every workload (east-west traffic). Zero Trust: assume breach, verify every request regardless of source (no implicit trust based on network location). Implement: multi-factor authentication, least-privilege access, continuous verification, device health checks, encrypted communication everywhere. Tools: software-defined perimeter, identity-aware proxies, network policy enforcement (Kubernetes NetworkPolicies, Calico).

**Q: What is the role of ICMP in networking?**
A: ICMP (Internet Control Message Protocol) is a network-layer protocol for diagnostic and error messages. It does not carry application data. Key uses: ping (ICMP Echo Request/Reply) tests reachability; traceroute uses ICMP Time Exceeded messages from each router to map the path; Path MTU Discovery uses ICMP Fragmentation Needed to find the maximum packet size; error reporting (Destination Unreachable, Time Exceeded, Redirect). ICMP is often filtered at firewalls to prevent reconnaissance, but blocking all ICMP breaks PMTUD and useful diagnostics.
