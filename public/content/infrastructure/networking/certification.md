# Networking Certification Guide

## Certification Path

```
Entry                  Intermediate              Advanced
CompTIA Network+  →    Cisco CCNA        →        CCNP / CCIE
(vendor neutral)       (Cisco focused)            (expert level)
                       CompTIA CySA+              Juniper JNCIP
                       AWS Networking Spec.       AZ-700
```

| Cert | Provider | Cost | Format | Passing |
|------|----------|------|--------|---------|
| **CompTIA Network+** | CompTIA | $358 | MCQ + performance, 90 min | 720/900 |
| **Cisco CCNA (200-301)** | Cisco | $330 | MCQ + sim, 120 min | 825/1000 |
| **Cisco CCNP Enterprise** | Cisco | $400/exam | MCQ + lab | 750/1000 |
| **AWS ANS-C01** | AWS | $300 | MCQ, 170 min | 750/1000 |
| **AZ-700** | Microsoft | $165 | MCQ, 120 min | 700/1000 |

---

## CCNA (200-301) Exam Domains

| Domain | Weight |
|--------|--------|
| Network Fundamentals | 20% |
| Network Access | 20% |
| IP Connectivity | 25% |
| IP Services | 10% |
| Security Fundamentals | 15% |
| Automation and Programmability | 10% |

---

## Critical Topics — Must Know

```
SUBNETTING (must be instant):
  /24 → 256 hosts (254 usable) | /25 → 128 | /26 → 64 | /27 → 32 | /28 → 16
  Formula: hosts = 2^(32-prefix) - 2
  
  VLSM example:
  192.168.1.0/24 → split into:
    Subnet A (50 hosts): /26 (64 addresses) → 192.168.1.0/26
    Subnet B (25 hosts): /27 (32 addresses) → 192.168.1.64/27
    Subnet C (10 hosts): /28 (16 addresses) → 192.168.1.96/28

OSI MODEL (all 7 layers + protocols):
  7 Application: HTTP, HTTPS, FTP, SMTP, DNS, DHCP, SNMP
  6 Presentation: TLS/SSL, encryption, compression
  5 Session: NetBIOS, RPC, session management
  4 Transport: TCP (reliable) / UDP (fast) — segments/datagrams
  3 Network: IP, ICMP, ARP — packets, routing
  2 Data Link: Ethernet, Wi-Fi (802.11), MAC addresses — frames
  1 Physical: cables, signals, bits

ROUTING PROTOCOLS:
  Static: manual routes (small networks, default route)
  RIP: distance vector, max 15 hops, slow convergence (legacy)
  OSPF: link-state, fast convergence, uses cost (bandwidth)
          Areas (area 0 = backbone), LSA flooding, SPF algorithm
  EIGRP: Cisco proprietary, hybrid (distance vector + link state)
  BGP: path vector, used between ISPs and cloud providers (internet routing)

SWITCHING:
  STP (Spanning Tree Protocol): prevents layer-2 loops
  RSTP: faster convergence version of STP
  VLANs: logical network segmentation (802.1Q tagging)
  EtherChannel / LACP: aggregate multiple links (bandwidth + redundancy)
  Port security: restrict MAC addresses per port (limit, sticky)

IP SERVICES:
  NAT/PAT: private → public IP translation
  DHCP: dynamic IP assignment (DORA: Discover-Offer-Request-Ack)
  DNS: name resolution (A, AAAA, MX, CNAME, PTR, NS records)
  NTP: network time synchronisation (stratum levels 0-15)
  SNMP: network monitoring (v3 with authentication recommended)
  QoS: priority queuing for voice/video traffic
```

---

## Cisco IOS Quick Reference

```bash
# Basic config
enable
configure terminal
hostname Router1
interface GigabitEthernet0/0
  ip address 192.168.1.1 255.255.255.0
  no shutdown
end
copy running-config startup-config

# Routing
show ip route
ip route 0.0.0.0 0.0.0.0 192.168.1.254    # Default route
router ospf 1
  network 192.168.1.0 0.0.0.255 area 0

# VLANs
vlan 10
  name Sales
interface FastEthernet0/1
  switchport mode access
  switchport access vlan 10
interface GigabitEthernet0/0.10
  encapsulation dot1Q 10
  ip address 192.168.10.1 255.255.255.0

# Troubleshoot
show interfaces
show ip interface brief
ping 8.8.8.8
traceroute 8.8.8.8
show running-config | section interface
debug ip routing
```

---

## Study Resources

- **Jeremy's IT Lab** (youtube.com/@JeremysITLab) — best free CCNA resource, very thorough
- **Professor Messer** — free Network+ videos
- **Cisco NetAcad** (netacad.com) — free Cisco learning path
- **Packet Tracer** — free Cisco network simulator (get via NetAcad)
- **GNS3** — full Cisco/Juniper emulator (advanced)

## Revision Notes
```
SUBNETTING: practice until instant. /24=256, /25=128, /26=64, /27=32, /28=16
OSI: All People Seem To Need Data Processing (7→1)
  Or: Please Do Not Throw Sausage Pizza Away (1→7)

ROUTING: Static | RIP(legacy) | OSPF(link-state, cost) | BGP(internet)
SWITCHING: STP prevents loops | VLANs segment | EtherChannel bundles

CCNA: 200-301 | MCQ + simulations | 120 min | 825/1000 passing
  Focus: subnetting (25%), OSPF config, VLANs, troubleshooting

AWS ANS-C01: VPC deep dive, Direct Connect, Transit Gateway, Route 53
AZ-700: Azure VNet, VPN Gateway, ExpressRoute, Azure Firewall, Front Door
```
