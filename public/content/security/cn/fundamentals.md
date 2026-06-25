# Computer Networks (CN) — Fundamentals

## What is a Computer Network?
A computer network is a collection of interconnected devices (computers, servers, routers, switches) that can communicate and share resources. Networks enable file sharing, internet access, email, video calls, and cloud computing.

## Network Types

| Type | Range | Example |
|------|-------|---------|
| PAN | < 10 meters | Bluetooth devices |
| LAN | Building/campus | Office network |
| MAN | City-wide | ISP city network |
| WAN | Global | Internet |

## OSI Model — 7 Layers

```
Layer 7: Application   — HTTP, FTP, SMTP, DNS
Layer 6: Presentation  — Encryption, compression, encoding
Layer 5: Session       — Connection establishment, sync
Layer 4: Transport     — TCP, UDP, port numbers, error control
Layer 3: Network       — IP addresses, routing (Routers)
Layer 2: Data Link     — MAC addresses, frames (Switches)
Layer 1: Physical      — Bits, cables, signals (Hubs)
```

Mnemonic: **A**ll **P**eople **S**eem **T**o **N**eed **D**ata **P**rocessing

## TCP/IP Model — 4 Layers

```
Application  (HTTP, DNS, SMTP, FTP)
Transport    (TCP, UDP)
Internet     (IP, ICMP, ARP)
Network Access (Ethernet, Wi-Fi)
```

## IP Addressing

### IPv4
```
32-bit address: 192.168.1.100
Classes:
A: 1.0.0.0  – 126.255.255.255 (Large orgs)
B: 128.0.0.0 – 191.255.255.255 (Medium orgs)
C: 192.0.0.0 – 223.255.255.255 (Small orgs)

Private IP ranges:
10.0.0.0/8       Class A private
172.16.0.0/12    Class B private
192.168.0.0/16   Class C private
```

### Subnetting
```
IP: 192.168.1.0/24
Subnet Mask: 255.255.255.0
Total hosts: 2^8 = 256
Usable hosts: 254 (network + broadcast excluded)
Network: 192.168.1.0
Broadcast: 192.168.1.255
```

## TCP vs UDP

| Feature | TCP | UDP |
|---------|-----|-----|
| Connection | Connection-oriented | Connectionless |
| Reliability | Guaranteed delivery | Best effort |
| Order | In-order | No guarantee |
| Speed | Slower (overhead) | Faster |
| Use cases | HTTP, FTP, Email | DNS, Video, Gaming |

## Common Port Numbers
```
21   FTP
22   SSH
23   Telnet
25   SMTP
53   DNS
80   HTTP
110  POP3
143  IMAP
443  HTTPS
3306 MySQL
5432 PostgreSQL
```

## DNS — Domain Name System
```
User types: www.google.com
DNS Resolution:
1. Check browser cache
2. Check OS cache (/etc/hosts)
3. Query local DNS resolver (ISP)
4. Recursive query: Root → TLD (.com) → Authoritative
5. Returns IP address
6. Cache result (TTL)
```

## Getting Started
- Understand OSI layers deeply — most exam questions reference them
- Practice subnetting — CIDR notation, usable hosts calculation
- Know TCP 3-way handshake: SYN → SYN-ACK → ACK
- Learn common protocols and their port numbers
