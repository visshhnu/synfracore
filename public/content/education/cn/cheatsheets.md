# Computer Networks — Cheatsheet

```
# ── PROTOCOLS AND PORTS ──────────────────────────────────
HTTP   80     TCP    Web traffic
HTTPS  443    TCP    Encrypted web
SSH    22     TCP    Secure shell
FTP    21     TCP    File transfer (control)
SMTP   25     TCP    Email sending
DNS    53     TCP+UDP Domain resolution
DHCP   67/68  UDP    IP address assignment
NTP    123    UDP    Time synchronization
RDP    3389   TCP    Remote desktop

# ── SUBNETTING QUICK REFERENCE ────────────────────────────
/32 = 1 IP (single host)
/30 = 4 IPs, 2 usable
/29 = 8 IPs, 6 usable
/28 = 16 IPs, 14 usable
/27 = 32 IPs, 30 usable
/26 = 64 IPs, 62 usable
/25 = 128 IPs, 126 usable
/24 = 256 IPs, 254 usable ← most common
/23 = 512 IPs
/22 = 1024 IPs
/16 = 65,536 IPs
/8  = 16.7M IPs

Private ranges:
  10.0.0.0/8         (Class A)
  172.16.0.0/12      (Class B)
  192.168.0.0/16     (Class C)

# ── OSI LAYER QUICK REFERENCE ────────────────────────────
L7 Application:  HTTP, DNS, SMTP (your app)
L4 Transport:    TCP/UDP, ports
L3 Network:      IP addresses, routing
L2 Data Link:    MAC addresses, switches
L1 Physical:     Cables, signals

# ── HTTP STATUS CODE GROUPS ──────────────────────────────
200 OK            201 Created        204 No Content
301 Moved Perm    302 Found          304 Not Modified
400 Bad Request   401 Unauthorized   403 Forbidden
404 Not Found     409 Conflict       429 Rate Limited
500 Server Error  502 Bad Gateway    503 Unavailable
504 Gateway Timeout

# ── TCP FLAGS ─────────────────────────────────────────────
SYN: Synchronize (start connection)
ACK: Acknowledge
FIN: Finish (end connection)
RST: Reset (abort connection)
PSH: Push (deliver immediately to app)
URG: Urgent data

# ── TOOLS ─────────────────────────────────────────────────
ping host           # ICMP echo test
traceroute host     # Path discovery
dig domain          # DNS query
netstat -tlnp       # Listening ports
ss -tnp             # Socket statistics
tcpdump -i eth0     # Packet capture
curl -v url         # HTTP request debug
```
