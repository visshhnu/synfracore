# Networking — Interview Questions

**What happens when you type google.com in a browser?**
DNS resolves google.com to an IP address (checking local cache → OS cache → DNS resolver → root nameserver → .com TLD → google.com authoritative nameserver). TCP 3-way handshake (SYN→SYN-ACK→ACK) establishes connection to port 443. TLS handshake negotiates encryption (certificate exchange, key agreement, symmetric key established). HTTP GET request sent, server responds with HTML. Browser parses HTML, fires additional requests for CSS/JS/images. DOM constructed, page rendered.

**What is the difference between TCP and UDP?**
TCP: connection-oriented, reliable delivery, ordered packets, error correction, flow control, congestion control — used for HTTP, SSH, databases. UDP: connectionless, no reliability guarantee, no ordering, faster and lower overhead — used for DNS queries, video streaming, VoIP, gaming. Rule: use TCP when data must arrive correctly; UDP when speed matters more than perfection.

**Explain subnetting with an example.**
A /24 network (e.g., 192.168.1.0/24) has 256 addresses (254 usable). The subnet mask 255.255.255.0 means the first 24 bits identify the network, last 8 bits identify hosts. To subnet into 4 networks: use /26 (255.255.255.192), giving 4 subnets of 64 addresses each (62 usable). 192.168.1.0/26, 192.168.1.64/26, 192.168.1.128/26, 192.168.1.192/26.

**What is NAT and why is it used?**
NAT (Network Address Translation) translates private IP addresses (10.x, 172.16.x, 192.168.x) to a public IP when traffic leaves a network. Solves IPv4 exhaustion — thousands of devices share one public IP. A NAT table maps (private IP:port) → (public IP:port). Types: SNAT (Source NAT, for outbound), DNAT (Destination NAT, for inbound port forwarding). Cloud providers use NAT Gateways for private subnet outbound access.

**What is the OSI model and which layer does a switch vs router operate at?**
OSI has 7 layers: Physical (cables/signals), Data Link (MAC addresses/frames), Network (IP/routing), Transport (TCP/UDP/ports), Session, Presentation, Application. A switch operates at Layer 2 (Data Link) — forwards frames based on MAC addresses within a network segment. A router operates at Layer 3 (Network) — routes packets between different networks using IP addresses.

**How does DNS work and what are the record types?**
DNS is a distributed hierarchical database. Query flow: client → recursive resolver → root nameserver → TLD nameserver → authoritative nameserver → returns IP. Record types: A (domain → IPv4), AAAA (domain → IPv6), CNAME (alias → canonical domain), MX (mail server), TXT (arbitrary text, used for SPF/DKIM/verification), NS (nameservers for a domain), SOA (zone authority info).
