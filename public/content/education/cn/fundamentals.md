# Computer Networks — Fundamentals

## OSI and TCP/IP Models

```
OSI (7 layers):                TCP/IP (4 layers):
7. Application                 Application (HTTP, DNS, SMTP)
6. Presentation                Transport (TCP, UDP)
5. Session                     Internet (IP, ICMP)
4. Transport                   Network Access (Ethernet, Wi-Fi)
3. Network
2. Data Link
1. Physical

Protocols at each layer:
  Application:  HTTP, HTTPS, FTP, SMTP, DNS, DHCP, SSH
  Transport:    TCP (reliable), UDP (fast)
  Network:      IP, ICMP (ping), ARP, OSPF, BGP
  Data Link:    Ethernet, MAC addresses, PPP
```

## TCP Three-Way Handshake

```
Client                  Server
  |                        |
  |──── SYN (seq=x) ──────►|   (Client says: I want to connect, my seq is x)
  |                        |
  |◄─── SYN-ACK (seq=y, ack=x+1) ──|  (Server: OK, my seq is y, I got x)
  |                        |
  |──── ACK (ack=y+1) ────►|   (Client: Got it, expecting y+1 next)
  |                        |
  |═══ Data transfer ══════|
  
Connection termination (4-way):
  FIN → ACK → FIN → ACK
  TIME_WAIT state: 2×MSL (typically 60-120 seconds) after close
```

## DNS Resolution

```
Query: www.google.com

1. Check /etc/hosts and local cache
2. Ask recursive resolver (8.8.8.8 or ISP)
3. Resolver asks root nameserver (.) → returns .com NS
4. Resolver asks .com TLD nameserver → returns google.com NS
5. Resolver asks google.com NS → returns 142.250.80.46
6. Resolver caches result (TTL) and returns to client

Record types:
  A:     domain → IPv4
  AAAA:  domain → IPv6
  CNAME: alias → canonical name (can't use at apex)
  MX:    mail servers (with priority)
  TXT:   arbitrary text (SPF, DKIM, verification)
  NS:    authoritative nameservers
  SOA:   zone settings (serial, refresh, retry)
```

## HTTP/HTTPS

```
HTTP/1.1: Keep-alive, pipelining, text headers
HTTP/2:   Binary framing, multiplexing, header compression, server push
HTTP/3:   QUIC (UDP-based), eliminates head-of-line blocking

Status codes:
  1xx: Informational (100 Continue)
  2xx: Success (200 OK, 201 Created, 204 No Content)
  3xx: Redirect (301 Permanent, 302 Temporary, 304 Not Modified)
  4xx: Client error (400 Bad Request, 401 Unauthorized, 403 Forbidden, 404 Not Found, 429 Rate Limited)
  5xx: Server error (500 Internal Error, 502 Bad Gateway, 503 Service Unavailable)

HTTPS: HTTP + TLS
  TLS handshake: asymmetric crypto to exchange symmetric session key
  Data: symmetric encryption (AES-256-GCM)
  Certificate: proves server identity (signed by trusted CA)
```
