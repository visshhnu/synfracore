# Computer Networks Cheatsheet

## OSI Layers Quick Reference
```
7 Application:  HTTP, HTTPS, FTP, SSH, DNS, SMTP, SNMP
6 Presentation: SSL/TLS, JPEG, MPEG, ASCII, encryption
5 Session:      NetBIOS, RPC, session management
4 Transport:    TCP, UDP, SCTP | Segments | Ports
3 Network:      IP, ICMP, OSPF, BGP | Packets | Routers
2 Data Link:    Ethernet, Wi-Fi, ARP | Frames | Switches
1 Physical:     Cables, hubs, bits, signals
```

## Subnet Cheatsheet
```
/8  = 255.0.0.0       16M hosts
/16 = 255.255.0.0     65534 hosts
/24 = 255.255.255.0   254 hosts
/25 = 255.255.255.128 126 hosts
/26 = 255.255.255.192 62 hosts
/27 = 255.255.255.224 30 hosts
/28 = 255.255.255.240 14 hosts
/30 = 255.255.255.252 2 hosts (point-to-point)

Usable = 2^(32-prefix) - 2
```

## Common Protocols & Ports
```
21    FTP (control)    20  FTP (data)
22    SSH             23  Telnet
25    SMTP           110  POP3
53    DNS            143  IMAP
67/68 DHCP           80  HTTP
443   HTTPS         389  LDAP
636   LDAPS         636  LDAPS
3389  RDP          1433  MSSQL
3306  MySQL        5432  PostgreSQL
27017 MongoDB      6379  Redis
```

## TCP Flags
```
SYN  — Synchronize (initiate connection)
ACK  — Acknowledgment
FIN  — Finish (terminate connection)
RST  — Reset (abort connection)
PSH  — Push (flush buffer immediately)
URG  — Urgent data

3-way handshake: SYN → SYN-ACK → ACK
4-way close: FIN → ACK → FIN → ACK
```

## Routing Protocols Comparison
```
Protocol  Type           Metric     Convergence  Scale
RIP       Distance-vec   Hop count  Slow         Small
EIGRP     Hybrid         BW+Delay   Very fast    Medium
OSPF      Link-state     Cost(BW)   Fast         Large
BGP       Path-vector    Policy     Slow         Internet
IS-IS     Link-state     Cost       Fast         ISP/DC
```

## Network Commands
```bash
# Connectivity
ping 8.8.8.8
traceroute 8.8.8.8
mtr 8.8.8.8         # combined ping+traceroute

# DNS
nslookup google.com
dig google.com A
dig @8.8.8.8 google.com

# Ports/connections
ss -tuln            # listening ports
netstat -tulnp      # same (older)
nmap -sV target     # port scan

# Routing
ip route show
ip route get 8.8.8.8

# Interface
ip addr show
ip link show
ifconfig

# Packet capture
tcpdump -i eth0 host 8.8.8.8
tcpdump -i eth0 port 80 -w out.pcap
```

## IP Special Addresses
```
127.0.0.1    Loopback
0.0.0.0      Default route / unspecified
255.255.255.255  Limited broadcast
169.254.x.x  APIPA (link-local, no DHCP)
::1          IPv6 loopback
fe80::/10    IPv6 link-local
```
