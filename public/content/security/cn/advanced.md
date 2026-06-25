# Computer Networks — Advanced

## Software-Defined Networking (SDN)

### Architecture
```
Application Plane
      │ (Northbound API — REST)
Control Plane (SDN Controller: OpenDaylight, ONOS, Ryu)
      │ (Southbound API — OpenFlow)
Data Plane (Switches, Routers — just forwarding)
```

SDN separates control logic from forwarding hardware. Controller has global network view; programs flow tables in switches. Enables: automated provisioning, traffic engineering, microsegmentation.

### OpenFlow
Protocol between controller and switches. Controller pushes flow rules: match (5-tuple) → action (forward, drop, modify, send to controller).

## Network Function Virtualization (NFV)
Run network functions (firewall, load balancer, IDS) as software on commodity servers instead of dedicated appliances. Benefits: elasticity, cost reduction, faster deployment. Used by telcos for 5G core network functions.

## Multiprotocol Label Switching (MPLS)
```
IP packet enters MPLS domain → Label added (push)
Routers forward by label (not IP) → Label Switch Routers (LSR)
Exit node removes label (pop) → delivers IP packet
Label Switched Path (LSP): predetermined path

Benefits:
- Fast forwarding (label lookup vs. IP lookup)
- Traffic engineering (route traffic around congestion)
- VPN support (MPLS L3VPN, MPLS L2VPN)
- QoS enforcement per path
```

## Quality of Service (QoS)

### DiffServ (Differentiated Services)
```
DSCP field in IP header (6 bits) marks packet priority
Classes:
EF (Expedited Forwarding): voice, video — low latency
AF (Assured Forwarding): business traffic
BE (Best Effort): default internet traffic

Queuing mechanisms:
FIFO: first in, first out (no priority)
PQ: priority queuing (high-priority served first)
WFQ: weighted fair queuing (proportional bandwidth)
CBWFQ: class-based weighted fair queuing
LLQ: low-latency queuing (PQ + CBWFQ for voice)
```

## BGP Deep Dive

### BGP Attributes (for Traffic Engineering)
```
AS-PATH: list of AS numbers route traversed
  → prefer shorter AS-PATH
  → use AS-PATH prepending to make path look longer (traffic control)

LOCAL-PREF: preference within AS for outbound traffic
  → higher LOCAL-PREF preferred
  → used for primary/backup link selection

MED (Multi-Exit Discriminator): hint to neighboring AS for inbound traffic
  → lower MED preferred

NEXT-HOP: IP address to reach next AS
  → must be reachable!
```

### BGP Communities
Tag routes with community values for policy actions at other routers.
```
Standard: AA:NN format (AS number : community value)
Well-known: 
  NO_EXPORT (65535:65281): don't advertise to eBGP peers
  NO_ADVERTISE (65535:65282): don't advertise to any peer
  Internet (0): send to all
```

## Network Security Protocols

### IPSec
```
Two modes:
Transport: encrypts payload only (host-to-host)
Tunnel: encrypts entire IP packet (VPN gateway-to-gateway)

Protocols:
AH (Authentication Header): integrity + authentication, no encryption
ESP (Encapsulating Security Payload): encryption + integrity

Key exchange: IKE (Internet Key Exchange)
  Phase 1: establish secure channel (ISAKMP SA)
  Phase 2: negotiate IPSec SA (AES, SHA)
```

### TLS 1.3 Handshake
```
Client → Server: ClientHello (supported ciphers, key share)
Server → Client: ServerHello + Certificate + Finished
Client → Server: Finished
[Application data — encrypted with session key]

1-RTT handshake (vs 2-RTT in TLS 1.2)
0-RTT resumption for known servers
Only ECDHE for key exchange (no RSA key exchange)
```

## Advanced Troubleshooting

```bash
# Packet capture
tcpdump -i eth0 -w capture.pcap 'port 443'
wireshark capture.pcap  # analyze

# Routing diagnostics
traceroute 8.8.8.8         # path to destination
mtr 8.8.8.8               # continuous traceroute
ip route get 8.8.8.8      # which route used

# BGP diagnostics (FRRouting/Quagga)
show bgp summary
show bgp neighbors
show ip bgp 0.0.0.0/0

# Interface stats
ip -s link show eth0
netstat -s | grep retransmit  # TCP retransmits
ss -tunapl                    # socket stats
```
