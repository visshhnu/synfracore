# Network Security Certification Guide

## Top Certifications

| Cert | Provider | Level | Cost | Format |
|------|----------|-------|------|--------|
| **CompTIA Security+** | CompTIA | Entry | $392 | MCQ + performance, 90 min |
| **CCNA Security / CyberOps** | Cisco | Intermediate | $330 | MCQ |
| **CCNP Security** | Cisco | Advanced | $400 | Multiple exams |
| **CEH** | EC-Council | Intermediate | $1,200 | MCQ, 4 hrs |
| **CISSP** | ISC² | Advanced | $749 | 250 Q, 6 hrs |
| **CompTIA Network+** | CompTIA | Entry | $358 | MCQ + performance |

---

## CompTIA Security+ (SY0-701) — Exam Domains

| Domain | Weight |
|--------|--------|
| General Security Concepts | 12% |
| Threats, Vulnerabilities & Mitigations | 22% |
| Security Architecture | 18% |
| Security Operations | 28% |
| Security Program Management & Oversight | 20% |

**Format:** Max 90 questions, 90 minutes, 750/900 passing score.

---

## Must-Know Concepts

```
NETWORK ATTACK TYPES:
  MITM (Man-in-the-Middle): intercept communications
    Defenses: TLS/HTTPS, certificate pinning, MFA
  
  DDoS: volumetric (UDP flood), protocol (SYN flood), application (HTTP flood)
    Defenses: CDN, rate limiting, scrubbing centers (Cloudflare, Akamai)
  
  ARP Poisoning: associate attacker MAC with victim IP
    Defenses: Dynamic ARP Inspection (DAI), static ARP entries
  
  DNS Spoofing: corrupt DNS cache with false records
    Defenses: DNSSEC, DNS over HTTPS (DoH), DNS over TLS (DoT)
  
  VLAN Hopping: switch spoofing or double tagging
    Defenses: disable trunking on access ports, native VLAN != data VLAN

NETWORK SECURITY CONTROLS:
  Firewall types:
    Packet filtering: layer 3/4, stateless, based on IP/port rules
    Stateful: tracks connections, allows established sessions
    NGFW (Next-Gen): application-aware, IPS, URL filtering, SSL inspection
  
  IDS vs IPS:
    IDS: Intrusion Detection (alerts only, passive — out of band)
    IPS: Intrusion Prevention (blocks inline, active — in path)
  
  Network segmentation:
    VLANs: logical isolation at layer 2
    DMZ: semi-trusted zone between internet and internal (web servers)
    Zero trust: never trust, always verify (no implicit trust by network location)
  
  VPN types:
    Site-to-site: connect two networks (IPSec)
    Client-to-site: remote workers (OpenVPN, WireGuard, SSL VPN)
    Split tunneling: only corporate traffic over VPN
```

---

## Firewall & Network Commands

```bash
# Linux iptables
iptables -A INPUT -p tcp --dport 443 -j ACCEPT
iptables -A INPUT -s 10.0.0.0/8 -j DROP
iptables -L -n -v --line-numbers
iptables-save > /etc/iptables/rules.v4

# nftables (modern replacement)
nft add rule inet filter input tcp dport 443 accept
nft list ruleset

# Firewall analysis
nmap -sA target    # ACK scan — detect firewall rules
nmap -f target     # Fragment packets — evade basic firewalls
tcpdump -i eth0 'port 80 or port 443'   # Capture traffic
wireshark          # GUI traffic analysis

# Network security checks
ss -tlnp           # Open TCP listening ports
netstat -an        # All connections
arp -a             # ARP table (spot poisoning)
```

---

## Study Path

```
Entry → Security+:
  Professor Messer free videos (professormesser.com) → Jason Dion Udemy course
  Practice: CompTIA CertMaster, ExamCompass

Intermediate → CCNA CyberOps:
  Cisco NetAcad free learning path
  Focus: SOC operations, security monitoring, incident response

Advanced → CISSP:
  Minimum 5 years experience required
  Domains: Security & Risk, Asset Security, Security Arch, Network Security,
           IAM, Security Assessment, Security Ops, SDLC
  Study: (ISC)² official guide + Sunflower summary + 1000s of practice questions
```

## Revision Notes
```
Security+ SY0-701: entry level, broad coverage, good first cert
  Passing: 750/900 | 90 min | MCQ + performance

ATTACK TYPES TO MEMORISE:
  MITM → certificate pinning + TLS
  DDoS → CDN + rate limiting + scrubbing
  ARP → DAI (Dynamic ARP Inspection)
  DNS → DNSSEC + DoH/DoT
  VLAN hopping → disable auto-trunking, set native VLAN

FIREWALLS: packet filter (stateless) < stateful < NGFW (app-aware)
IDS (detect, passive) vs IPS (prevent, inline)
DMZ: web servers between two firewalls (internet → DMZ → internal)
Zero Trust: verify every request regardless of network location
```
