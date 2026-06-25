# Computer Networks — Intermediate

## Routing Protocols

### Interior Gateway Protocols (IGP) — Within an AS

**RIP (Routing Information Protocol)**
- Distance-vector protocol
- Metric: hop count (max 15)
- Updates every 30 seconds
- Slow convergence, suitable for small networks

**OSPF (Open Shortest Path First)**
- Link-state protocol
- Metric: cost (based on bandwidth)
- Dijkstra's algorithm for shortest path
- Fast convergence, scalable (hierarchical areas)
- Area 0 = backbone area (required)

**EIGRP (Enhanced IGRP — Cisco proprietary)**
- Hybrid protocol (distance-vector + link-state features)
- Metric: bandwidth + delay (composite)
- Very fast convergence (DUAL algorithm)
- Feasible successor = backup route

### BGP (Border Gateway Protocol) — Between AS
- Path-vector protocol
- Used by ISPs for internet routing
- Policy-based routing decisions
- Attributes: AS-PATH, LOCAL-PREF, MED, NEXT-HOP

## TCP Deep Dive

### 3-Way Handshake
```
Client → Server: SYN (seq=x)
Server → Client: SYN-ACK (seq=y, ack=x+1)
Client → Server: ACK (ack=y+1)
Connection established!
```

### TCP Congestion Control
- **Slow Start**: begin with small window, double each RTT
- **Congestion Avoidance**: linear increase after threshold
- **Fast Retransmit**: retransmit on 3 duplicate ACKs
- **Fast Recovery**: halve window, continue from threshold

### TCP vs TLS
```
TCP: reliable transport layer
TLS: runs over TCP, provides:
  - Authentication (certificates)
  - Encryption (symmetric AES after handshake)
  - Integrity (MAC/HMAC)
HTTPS = HTTP over TLS over TCP
```

## Switching

### VLANs
```
VLAN 10: HR Department  (192.168.10.0/24)
VLAN 20: IT Department  (192.168.20.0/24)
VLAN 30: Finance        (192.168.30.0/24)

Benefits:
- Logical segmentation of broadcast domains
- Security isolation between departments
- Trunk ports carry multiple VLANs (802.1Q tagging)
```

### Spanning Tree Protocol (STP)
- Prevents loops in switched networks
- Elects Root Bridge (lowest Bridge ID)
- Blocks redundant paths (puts in Blocking state)
- RSTP: faster convergence version

## Network Address Translation (NAT)

```
Private → Public translation by router

Types:
- Static NAT: 1 private → 1 public (servers)
- Dynamic NAT: pool of public IPs
- PAT/NAT Overload: many private → 1 public (most common, uses ports)

Example PAT:
192.168.1.10:5001 → 203.0.113.1:1025
192.168.1.20:5002 → 203.0.113.1:1026
```

## IPv6

```
128-bit address: 2001:0db8:85a3:0000:0000:8a2e:0370:7334
Abbreviated: 2001:db8:85a3::8a2e:370:7334

Types:
Unicast, Multicast, Anycast (no broadcast)
Link-local: fe80::/10
Loopback: ::1

No ARP — replaced by NDP (Neighbor Discovery Protocol)
```

## Wireless Networks

### IEEE 802.11 Standards
| Standard | Frequency | Max Speed |
|----------|-----------|-----------|
| 802.11b | 2.4 GHz | 11 Mbps |
| 802.11g | 2.4 GHz | 54 Mbps |
| 802.11n | 2.4/5 GHz | 600 Mbps |
| 802.11ac | 5 GHz | 3.5 Gbps |
| 802.11ax (Wi-Fi 6) | 2.4/5/6 GHz | 9.6 Gbps |

### Wi-Fi Security
- WEP: broken, don't use
- WPA: improved but vulnerable
- WPA2: AES-CCMP, widely used
- WPA3: latest, SAE handshake, better security
