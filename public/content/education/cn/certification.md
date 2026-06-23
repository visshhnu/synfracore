# Computer Networks Certification Guide

## Certifications Available

| Cert | Provider | Cost | Format |
|------|----------|------|--------|
| **CompTIA Network+** | CompTIA | $358 | MCQ + performance |
| **Cisco CCNA (200-301)** | Cisco | $330 | MCQ + simulation |
| **GATE CS** | IIT/IISc | Rs.1,800 | MCQ + NAT, 3 hrs |
| **NPTEL Computer Networks MOOC** | NPTEL | Free | Proctored exam |

---

## Core Topics

```
OSI MODEL (7 layers, must know all):
  Layer 7 Application:  HTTP, HTTPS, FTP, SMTP, DNS, DHCP, SSH, Telnet
  Layer 6 Presentation: TLS/SSL, encryption, encoding, compression
  Layer 5 Session:      NetBIOS, RPC, session establishment/teardown
  Layer 4 Transport:    TCP (reliable) | UDP (fast) — ports and segments
  Layer 3 Network:      IP, ICMP, ARP, routing — packets and addresses
  Layer 2 Data Link:    Ethernet (802.3), Wi-Fi (802.11) — frames and MAC
  Layer 1 Physical:     cables, fiber, radio waves — raw bits

TCP vs UDP:
  TCP: connection-oriented, reliable (ack+retransmit), ordered, congestion control
  UDP: connectionless, no reliability, low overhead — DNS, VoIP, gaming, streaming

TCP HANDSHAKES:
  Connect: SYN -> SYN-ACK -> ACK (3-way)
  Close:   FIN -> ACK  then  FIN -> ACK (4-way)

IP ADDRESSING:
  Private ranges: 10.0.0.0/8 | 172.16.0.0/12 | 192.168.0.0/16
  Loopback: 127.0.0.1 | Broadcast: 255.255.255.255
  Subnetting: /24=254 usable | /25=126 | /26=62 | /27=30 | /28=14
  Formula: usable = 2^(32-prefix) - 2

ROUTING PROTOCOLS:
  Static:  manually configured, small networks
  RIP:     distance vector, max 15 hops, slow convergence (legacy)
  OSPF:    link-state, Dijkstra algorithm, fast convergence, uses cost
  BGP:     path vector, used between ISPs and cloud providers (internet backbone)

APPLICATION LAYER PROTOCOLS:
  HTTP/1.1: text-based, keep-alive, pipelining
  HTTP/2:   multiplexing, header compression, binary framing
  HTTP/3:   QUIC (UDP-based), 0-RTT handshake
  DNS:      A (IPv4) | AAAA (IPv6) | MX (mail) | CNAME (alias) | NS | PTR | TXT
  DHCP:     DORA — Discover -> Offer -> Request -> Acknowledge
  SMTP/IMAP/POP3: email send and retrieve

HTTP STATUS CODES:
  200 OK | 201 Created | 204 No Content | 301 Moved | 302 Found
  400 Bad Request | 401 Unauthorized | 403 Forbidden | 404 Not Found
  429 Too Many Requests | 500 Internal Server Error | 503 Service Unavailable

NETWORK SECURITY:
  TLS: asymmetric handshake -> symmetric session key -> encrypted data
  Firewall: packet filter (stateless) | stateful | NGFW (application-aware)
  VPN: encrypt traffic in tunnel (IPSec, OpenVPN, WireGuard)
  NAT: translate private IP to public IP (overload / PAT most common)
```

---

## Study Resources

- **Kurose & Ross Computer Networks** — standard university textbook
- **GFG Computer Networks** (geeksforgeeks.org/computer-network) — free, exam notes
- **Jeremy's IT Lab** (YouTube) — best free CCNA preparation
- **Professor Messer** (professormesser.com) — free Network+ prep

## Revision Notes
```
OSI: All People Seem To Need Data Processing (7 to 1)
TCP: reliable, ordered, connection-oriented | UDP: fast, no guarantee
3-WAY HANDSHAKE: SYN -> SYN-ACK -> ACK
SUBNETTING: /24=254 | /25=126 | /26=62 | /27=30 | /28=14

DNS: A/AAAA/MX/CNAME/NS/PTR/TXT — know each record type
DHCP DORA: Discover -> Offer -> Request -> Acknowledge
HTTP: stateless | methods GET/POST/PUT/PATCH/DELETE | status 2xx/3xx/4xx/5xx

GATE TOPICS: subnetting, TCP/IP stack, routing algorithms (Dijkstra, Bellman-Ford)
  sliding window, congestion control, IP addressing, DNS resolution steps
```
