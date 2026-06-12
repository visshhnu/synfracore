# Network Security — Interview Questions

**What is the difference between IDS and IPS?**
IDS (Intrusion Detection System) passively monitors traffic and generates alerts — it detects and notifies but doesn't block. It sits out-of-band (traffic mirror), so no false-positive blocking risk. IPS (Intrusion Prevention System) sits inline — all traffic passes through it, and it can block malicious traffic in real time. The risk: false positives block legitimate traffic. In production, tune IDS first to understand the false positive rate, then move to IPS mode with confidence. Host-based (HIDS/HIPS) monitors a single system; network-based (NIDS/NIPS) monitors network traffic.

**Explain the TLS handshake process.**
TLS 1.3 (simplified): Client sends supported cipher suites and key_share. Server responds with chosen cipher, its certificate (containing public key), and its key_share. Client verifies the certificate chain against trusted CAs, both derive the session key from the key exchanges (ECDHE), and encrypted data transfer begins. The key innovation of TLS 1.3: forward secrecy via ECDHE (even if the private key is compromised later, past sessions can't be decrypted) and the handshake is only 1 round-trip (vs 2 for TLS 1.2).

**What is network segmentation and why is it important?**
Network segmentation divides a network into zones with controlled communication between them — typically: internet → DMZ → internal → database tier. If an attacker compromises a web server in the DMZ, they cannot directly reach the database without also breaching the internal firewall. Microsegmentation takes this further, applying policies at the individual workload level (not just network zones) — common in Kubernetes with NetworkPolicies and in cloud environments with security groups per service. Without segmentation, a single breach can give lateral movement access to everything.

**What is DNS over HTTPS and why does it matter for security?**
Traditional DNS queries are plaintext — your ISP, network admin, or anyone on-path can see every domain you resolve. DNS over HTTPS (DoH) encrypts DNS queries inside HTTPS, making them indistinguishable from normal web traffic. Privacy benefit: DNS queries can't be monitored or censored. Security benefit: prevents DNS hijacking and MITM attacks. Trade-off: harder for enterprise security teams to monitor DNS (used for detecting malware C2 communication and data exfiltration via DNS tunneling). Enterprises often disable DoH to maintain DNS visibility for security monitoring.

**How does a firewall differ from a WAF?**
A traditional firewall operates at Layer 3-4 (network/transport) — it filters based on IP addresses, ports, and protocols. It can block 192.168.0.0/24 from reaching port 3306 but can't inspect HTTP content. A WAF (Web Application Firewall) operates at Layer 7 (application) — it understands HTTP/HTTPS and can detect SQLi patterns in query parameters, XSS in request bodies, CSRF tokens, rate limiting per user. WAFs protect web applications; traditional firewalls protect network perimeters. In production: use both — firewall at network edge, WAF (AWS WAF, Cloudflare, ModSecurity) in front of web applications.
