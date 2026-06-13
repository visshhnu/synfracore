# Computer Networks — Interview Questions

**What happens when you type google.com in a browser?**
1. DNS resolution: check cache → recursive resolver → root NS → .com NS → google.com NS → returns IP
2. TCP connection: 3-way handshake (SYN, SYN-ACK, ACK) to google's IP port 443
3. TLS handshake: exchange certificates, negotiate cipher, generate session key
4. HTTP GET /: browser sends request with headers (Host, Accept, Cookie, etc.)
5. Server processes: load balancer → web server → application → database
6. Response: HTTP 200 with HTML, browser parses, additional requests for CSS/JS/images
7. Render: DOM construction, CSSOM, layout, paint

**What is the difference between TCP and UDP?**
TCP: Connection-oriented (3-way handshake), reliable (acknowledgments + retransmission), ordered (sequence numbers), flow control, congestion control. 20-byte header. Use for: HTTP, SSH, databases — anything requiring reliability. UDP: Connectionless, unreliable (no retransmission), unordered, no flow control. 8-byte header, lower latency. Use for: DNS (single request/response), video streaming (better to skip frames than delay), gaming, VoIP.

**How does HTTPS work?**
HTTPS = HTTP over TLS. The TLS handshake: client sends supported cipher suites and a random value. Server sends its certificate (containing public key, signed by CA) and a random value. Client verifies certificate chain (follows CA chain to trusted root). Both derive a session key using ECDHE (Elliptic Curve Diffie-Hellman Ephemeral) — neither party transmits the key, both compute it independently from exchanged values. All data is then encrypted with symmetric AES-256-GCM using this session key. TLS 1.3 completes this in 1 round trip (TLS 1.2 needed 2).

**What is a subnet and how does CIDR work?**
A subnet divides a network into smaller segments. CIDR (Classless Inter-Domain Routing) notation: `192.168.1.0/24` — the /24 means first 24 bits are the network prefix, remaining 8 bits are host addresses. /24 = 256 addresses (254 usable). The subnet mask `255.255.255.0` ANDed with any IP determines if it's in the same network. Subnetting provides: security isolation (traffic stays local), reduced broadcast domain (less network noise), efficient IP address usage. Cloud VPCs use CIDR blocks (10.0.0.0/16 = 65,536 addresses).
