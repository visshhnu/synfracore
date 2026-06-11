# Computer Networks — GATE & Interview Complete Guide

Computer Networks is 8-10 marks in GATE and heavily tested in backend/infrastructure interviews. Master the OSI model, protocols, and routing.

## OSI vs TCP/IP Model

```
OSI (7 layers)          TCP/IP (4 layers)    Protocols
────────────────────────────────────────────────────────
7. Application     ┐
6. Presentation    ├── Application          HTTP, FTP, DNS, SMTP, SSH
5. Session         ┘
4. Transport       ──── Transport            TCP, UDP
3. Network         ──── Internet             IP, ICMP, ARP, RIP, OSPF, BGP
2. Data Link       ┐
1. Physical        ┴── Network Access        Ethernet, Wi-Fi, MAC

Data Unit (PDU) at each layer:
  Application: Message
  Transport:   Segment (TCP) / Datagram (UDP)
  Network:     Packet
  Data Link:   Frame
  Physical:    Bits
```

## IP Addressing & Subnetting

```
IPv4: 32 bits, dotted decimal notation (192.168.1.1)
IPv6: 128 bits, hex notation (2001:0db8:85a3::8a2e:0370:7334)

Classes (classful, mostly historical):
  Class A: 0.0.0.0   – 127.255.255.255  /8   (large orgs)
  Class B: 128.0.0.0 – 191.255.255.255  /16  (medium)
  Class C: 192.0.0.0 – 223.255.255.255  /24  (small)
  Class D: 224.0.0.0 – 239.255.255.255  Multicast
  Class E: 240.0.0.0 – 255.255.255.255  Reserved

Private (RFC 1918) — not routable on internet:
  10.0.0.0/8        (10.x.x.x)
  172.16.0.0/12     (172.16.x.x – 172.31.x.x)
  192.168.0.0/16    (192.168.x.x)

Subnetting (GATE loves this):
  /24 = 255.255.255.0 = 256 addresses (254 hosts)
  /25 = 255.255.255.128 = 128 addresses (126 hosts)
  /26 = 255.255.255.192 = 64 addresses (62 hosts)
  /27 = 255.255.255.224 = 32 addresses (30 hosts)
  
  Hosts = 2^(host bits) - 2  (subtract network + broadcast)
  
Example: Divide 192.168.1.0/24 into 4 equal subnets
  Need 4 subnets → borrow 2 bits → /26
  Subnet 0: 192.168.1.0/26    (0-63)
  Subnet 1: 192.168.1.64/26   (64-127)
  Subnet 2: 192.168.1.128/26  (128-191)
  Subnet 3: 192.168.1.192/26  (192-255)
```

## TCP — Deep Dive

```
TCP is:
  Connection-oriented: Establish before data transfer
  Reliable: Guaranteed delivery, in-order
  Flow controlled: Receiver controls sender speed
  Congestion controlled: Backs off on network congestion

3-way Handshake:
  Client  →  SYN(seq=x)            →  Server
  Client  ←  SYN-ACK(seq=y,ack=x+1) ←  Server
  Client  →  ACK(ack=y+1)           →  Server
  [Connection established — data can flow]

4-way Termination:
  Client  →  FIN  →  Server
  Client  ←  ACK  ←  Server
  Client  ←  FIN  ←  Server
  Client  →  ACK  →  Server
  Client waits 2MSL before closing (TIME_WAIT state)

TCP Header key fields:
  Source Port, Dest Port (16-bit each)
  Sequence Number (32-bit): byte position of first byte
  Acknowledgment Number (32-bit): next expected byte
  Flags: SYN, ACK, FIN, RST, PSH, URG
  Window Size: flow control — how much receiver can accept

Sliding Window Protocol:
  Window size W = how many segments in flight without ACK
  Throughput = W × MSS / RTT

TCP Congestion Control (3 phases):
  Slow Start: cwnd doubles each RTT (exponential)
  Congestion Avoidance: cwnd += 1 each RTT (linear)
  Fast Recovery: After 3 duplicate ACKs (not timeout)

  On timeout: cwnd = 1 MSS, restart slow start
  On 3 dup ACKs: cwnd = ssthresh = cwnd/2, fast recovery
```

## UDP
```
UDP is:
  Connectionless: No handshake
  Unreliable: No delivery guarantee, no ordering
  No flow/congestion control

UDP Header: Source Port, Dest Port, Length, Checksum (only 8 bytes!)

When to use UDP:
  → DNS (fast, one query-response, retry if needed)
  → Video streaming (prefer slightly lossy to delayed)
  → Online gaming (low latency critical)
  → VoIP (real-time, latency > reliability)
  → DHCP (broadcast-based)
  → QUIC protocol (builds reliability on top of UDP)
```

## DNS — Domain Name System

```
Hierarchy:
  Root servers → TLD (.com, .in) → Authoritative → Local DNS cache

Resolution (recursive):
  Browser → OS cache → Resolver → Root → TLD → Authoritative

Record types:
  A:      hostname → IPv4 address
  AAAA:   hostname → IPv6 address
  CNAME:  alias → canonical name
  MX:     mail server for domain
  NS:     nameservers for domain
  TXT:    arbitrary text (SPF, DKIM, verification)
  PTR:    reverse DNS (IP → hostname)

TTL: Time To Live — how long to cache the record
Low TTL = frequent lookups but faster updates (deployment)
High TTL = less traffic but slow propagation

DNSSEC: DNS with cryptographic signatures, prevents spoofing
```

## HTTP & HTTPS

```
HTTP methods:
  GET:    Retrieve (safe, idempotent)
  POST:   Create (not idempotent)
  PUT:    Full update/create (idempotent)
  PATCH:  Partial update
  DELETE: Remove (idempotent)
  HEAD:   GET but body not returned
  OPTIONS: What methods are supported?

HTTP status codes:
  2xx Success: 200 OK, 201 Created, 204 No Content
  3xx Redirect: 301 Permanent, 302 Temporary, 304 Not Modified
  4xx Client Error: 400 Bad Request, 401 Unauthorized, 403 Forbidden, 404 Not Found, 429 Too Many Requests
  5xx Server Error: 500 Internal, 502 Bad Gateway, 503 Unavailable, 504 Gateway Timeout

HTTP/1.1 vs HTTP/2 vs HTTP/3:
  HTTP/1.1: TCP connection per request (or connection reuse), head-of-line blocking
  HTTP/2:   Multiplexing (multiple requests on one TCP), server push, header compression
  HTTP/3:   QUIC (UDP-based), eliminates TCP head-of-line blocking, faster handshake

HTTPS = HTTP + TLS
TLS Handshake:
  1. Client Hello: supported cipher suites, random number
  2. Server Hello: chosen cipher, certificate
  3. Client verifies certificate against CA
  4. Key exchange (ECDHE): derive session key
  5. Encrypted data transfer
```

## Routing Protocols

```
Distance Vector (RIP):
  Each router shares its routing table with neighbours
  Bellman-Ford algorithm
  Count-to-infinity problem
  Max 15 hops (16 = unreachable)
  Slow convergence

Link State (OSPF):
  Each router knows full network topology
  Dijkstra's algorithm for shortest path
  Fast convergence, scales better
  Used within Autonomous Systems (AS)

Path Vector (BGP):
  Between Autonomous Systems (inter-domain routing)
  Internet backbone protocol
  Routes carry full AS path (prevents loops)
  Policy-based routing (not just shortest path)

Routing table lookup:
  Longest prefix match → most specific route wins
  192.168.1.0/24 vs 192.168.0.0/16 → /24 wins for 192.168.1.5
```

## GATE Quick Reference

```
Questions GATE definitely asks:

1. Subnetting: Given network + requirements, find subnet addresses
2. Sliding window: Calculate throughput, which protocol
3. TCP sequence numbers: Given trace, find ACK values
4. Dijkstra's/Bellman-Ford: Shortest path in routing
5. Congestion control: Trace cwnd after events
6. OSI layer: Which protocol at which layer

Common trap questions:
  → Checksum in UDP is optional in IPv4, mandatory in IPv6
  → ARP is Data Link layer, IP is Network layer
  → DNS uses UDP for queries (≤512 bytes), TCP for zone transfers
  → SMTP sends mail, POP3/IMAP retrieves mail
  → FTP uses 2 connections: port 21 (control), 20 (data)

Time to live (IP): Decremented at each router, packet dropped when 0
  Prevents infinite routing loops
  traceroute uses TTL=1,2,3... to find each hop
```
