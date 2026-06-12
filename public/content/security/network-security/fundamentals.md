# Network Security — Fundamentals

## Firewalls and Defense in Depth

```
Defense in depth: Multiple security layers — attacker must breach all

Perimeter firewall → DMZ → Internal firewall → Segmented VLANs → Host firewall
         ↓               ↓              ↓                ↓              ↓
     Block known      Web servers   App servers      Databases     iptables/ufw
     bad IPs/ports    only here     no internet      no internet   on each host
```

## IDS vs IPS

```
IDS (Intrusion Detection System): Monitors and ALERTS only
  - Passive — copies traffic (out of band)
  - No false-positive blocking risk
  - Examples: Snort (NIDS), OSSEC (HIDS)

IPS (Intrusion Prevention System): Monitors and BLOCKS
  - Inline — traffic passes through it
  - Can block zero-day threats automatically
  - Risk: false positives can block legitimate traffic
  - Examples: Suricata, Snort in inline mode

NIDS (Network): Monitors network traffic (taps or span port)
HIDS (Host):    Monitors individual host (file integrity, logs, syscalls)
```

## TLS/SSL Deep Dive

```
TLS handshake (TLS 1.3 — simplified):
  1. Client Hello: Supported ciphersuites, random, key_share
  2. Server Hello: Chosen ciphersuite, certificate, key_share
  3. Client: Verify certificate chain → derive session key
  4. Data encrypted with symmetric key (AES-256-GCM)

Common TLS issues:
  Expired certificate:  Check with: echo | openssl s_client -connect domain:443 2>/dev/null | openssl x509 -noout -dates
  Weak ciphers:         Test with: nmap --script ssl-enum-ciphers -p 443 domain.com
  Self-signed cert:     Only valid for internal services with custom CA
  Certificate pinning:  Mobile apps pin the expected cert — MITM resistant

Certificate inspection
openssl s_client -connect synfracore.com:443 </dev/null 2>/dev/null | openssl x509 -text -noout | grep -A2 "Subject:\|Issuer:\|Not After"
```

## Network Scanning (Defensive)

```bash
# Nmap — network discovery and port scanning
# (Always get permission before scanning!)

# Scan single host
nmap -sV -sC 192.168.1.1

# Scan subnet for live hosts
nmap -sn 192.168.1.0/24

# Service version detection + default scripts
nmap -sV -sC -O target.host

# Scan specific ports
nmap -p 22,80,443,3306,5432 192.168.1.0/24

# Full port scan + version + scripts
nmap -p- -sV -sC --min-rate=1000 target.host -oN scan.txt

# Nmap output types
# -oN: Normal (human readable)
# -oX: XML (for tools)
# -oG: Grepable
# -oA: All formats

# Check for open ports on your own server
ss -tlnp
netstat -tlnp
```

## VPN Concepts

```
Site-to-Site VPN: Connect two networks (e.g., office to AWS VPC)
  Protocols: IPSec (industry standard), OpenVPN, WireGuard

Client VPN: Individual user connects to network
  Protocols: OpenVPN, WireGuard, IKEv2/IPSec, L2TP

WireGuard vs OpenVPN:
  WireGuard:  Newer, faster, simpler (4000 lines vs 100,000)
              Better mobile performance, kernel-level
  OpenVPN:    Mature, widely supported, more config options

Zero Trust Network Access (ZTNA):
  Traditional VPN: Trust everything inside the network
  ZTNA: Verify every request regardless of network location
  Tools: Cloudflare Access, Tailscale, HashiCorp Boundary
```

## DNS Security

```bash
# DNS over HTTPS (DoH) — encrypt DNS queries
# DNS over TLS (DoT) — port 853

# Check for DNS leaks
curl https://check.torproject.org/api/ip
host myip.opendns.com resolver1.opendns.com

# DNSSEC validation
dig +dnssec synfracore.com
dig DS synfracore.com @8.8.8.8  # Delegation Signer record

# Block malicious domains at DNS level
# Pi-hole, NextDNS, Cloudflare Gateway

# Common DNS attacks:
# DNS Spoofing/Cache Poisoning: Inject false DNS records
# DNS Amplification DDoS: Use DNS servers to amplify traffic
# DNS Tunneling: Exfiltrate data via DNS queries
# Typosquatting: synfracore.com vs synfarcore.com (transposed letters)

# Detect DNS tunneling (high query rate to same domain)
tcpdump -i eth0 port 53 -w dns.pcap
tshark -r dns.pcap -T fields -e dns.qry.name | sort | uniq -c | sort -rn | head
```
