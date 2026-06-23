# Computer Networks Interview Questions

## Core Concepts

**Q: OSI vs TCP/IP model.**

**OSI (7 layers)**: Application → Presentation → Session → Transport → Network → Data Link → Physical

**TCP/IP (4 layers)**: Application → Transport → Internet → Network Access

| OSI | TCP/IP | Protocols |
|---|---|---|
| Application (7) | Application | HTTP, HTTPS, DNS, SMTP, FTP, SSH |
| Presentation (6) | Application | SSL/TLS, compression |
| Session (5) | Application | NetBIOS, RPC |
| Transport (4) | Transport | TCP, UDP |
| Network (3) | Internet | IP, ICMP, ARP |
| Data Link (2) | Network Access | Ethernet, WiFi (802.11), MAC |
| Physical (1) | Network Access | Cables, signals |

---

**Q: TCP vs UDP — when to use each.**

**TCP** (Transmission Control Protocol):
- Connection-oriented (3-way handshake: SYN → SYN-ACK → ACK)
- Reliable: acknowledgements, retransmission, in-order delivery
- Flow control, congestion control
- Use for: HTTP/HTTPS, email, file transfer, databases, SSH

**UDP** (User Datagram Protocol):
- Connectionless, no handshake
- Unreliable: fire-and-forget, no retransmission, no ordering
- Low overhead, low latency
- Use for: DNS, video streaming, gaming, VoIP, DHCP, live broadcasts

---

**Q: HTTP — methods, status codes, versions.**

**Methods:**
- GET: retrieve resource (idempotent, cacheable)
- POST: create resource (not idempotent)
- PUT: replace resource (idempotent)
- PATCH: partial update
- DELETE: remove resource
- HEAD: like GET but headers only
- OPTIONS: describe communication options (used for CORS preflight)

**Status codes:**
- 1xx: Informational (100 Continue)
- 2xx: Success (200 OK, 201 Created, 204 No Content)
- 3xx: Redirect (301 Permanent, 302 Temporary, 304 Not Modified)
- 4xx: Client error (400 Bad Request, 401 Unauthorized, 403 Forbidden, 404 Not Found, 429 Too Many Requests)
- 5xx: Server error (500 Internal Server Error, 502 Bad Gateway, 503 Service Unavailable, 504 Gateway Timeout)

**HTTP versions:**
- HTTP/1.1: persistent connections, pipelining (head-of-line blocking)
- HTTP/2: multiplexing (multiple requests/responses in parallel), header compression, server push
- HTTP/3: based on QUIC (UDP), eliminates TCP head-of-line blocking

---

**Q: DNS — how it works.**

```
1. Browser cache → OS cache check
2. Recursive resolver (ISP or 8.8.8.8)
3. Root nameservers (13 globally)
4. TLD nameservers (.com, .org, .in)
5. Authoritative nameservers (returns final IP)
6. Response cached per TTL

Record types:
A:      domain → IPv4 address
AAAA:   domain → IPv6 address
CNAME:  domain → another domain (alias)
MX:     mail server for domain
NS:     nameserver for domain
TXT:    verification, SPF, DKIM records
SOA:    start of authority (primary NS, serial)
PTR:    reverse DNS (IP → domain)
```

---

**Q: Subnetting and CIDR.**

```
IP address: 32-bit (IPv4). Written as 4 octets: 192.168.1.0
Subnet mask: identifies network vs host portion
CIDR notation: 192.168.1.0/24 → /24 = 24 bits for network, 8 for hosts

/24: 256 addresses (254 usable) — small office network
/16: 65,536 addresses — large enterprise
/8:  16,777,216 addresses — huge network

Private ranges (not routable on internet):
10.0.0.0/8      (10.x.x.x)
172.16.0.0/12   (172.16.x.x - 172.31.x.x)
192.168.0.0/16  (192.168.x.x)

Subnetting example: Split 192.168.1.0/24 into 4 subnets
  /26: 192.168.1.0/26   (0-63)
       192.168.1.64/26  (64-127)
       192.168.1.128/26 (128-191)
       192.168.1.192/26 (192-255)
```

## Revision Notes
```
OSI 7 LAYERS: App→Presentation→Session→Transport→Network→DataLink→Physical
TCP/IP 4 LAYERS: Application→Transport→Internet→Network Access

TCP: reliable, ordered, connection-oriented (SYN-SYN/ACK-ACK)
UDP: unreliable, fast, connectionless. DNS, video, gaming, VoIP

HTTP METHODS: GET(read) POST(create) PUT(replace) PATCH(update) DELETE
STATUS: 2xx=OK, 3xx=redirect, 4xx=client error, 5xx=server error
HTTP/2: multiplexing. HTTP/3: QUIC (UDP-based, no TCP HOL blocking)

DNS: Browser→Resolver→Root→TLD→Authoritative nameserver
Records: A(IPv4), AAAA(IPv6), CNAME(alias), MX(mail), NS(nameserver), TXT(SPF/DKIM)

SUBNETTING: /24=256 addrs | /16=65536 | /8=16M
Private: 10.x, 172.16-31.x, 192.168.x
CIDR: /prefix bits = network bits. Hosts = 2^(32-prefix) - 2
```
