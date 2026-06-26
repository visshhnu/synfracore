# Networking Interview Q&A

**Q: TCP vs UDP?**
TCP: reliable, ordered, connection-oriented (3-way handshake), slower. UDP: unreliable, unordered, connectionless, faster. TCP for: HTTP, SSH, databases. UDP for: DNS, video streaming, gaming.

**Q: How does DNS resolution work?**
Browser → OS cache → Recursive resolver (ISP) → Root nameserver (knows .com TLD) → TLD nameserver → Authoritative nameserver → Returns IP.

**Q: What is a subnet and CIDR?**
Subnet: subdivision of IP network. CIDR: Classless Inter-Domain Routing notation. 10.0.0.0/24 = 256 addresses (10.0.0.0–10.0.0.255). /16 = 65,536 addresses. /32 = single host.

**Q: OSI model layers?**
7-Application, 6-Presentation, 5-Session, 4-Transport (TCP/UDP), 3-Network (IP), 2-Data Link (Ethernet), 1-Physical. Remember: "All People Seem To Need Data Processing."
