# Networking for DevOps — Complete Foundation

Every DevOps engineer must understand how data flows through networks. Without this knowledge, you cannot debug connectivity issues, design secure cloud architectures, or understand how containers communicate.

## The OSI Model in Practice

```flow
{
  "title": "OSI Layers (Transport and Network are what DevOps touches most)",
  "layout": "stack",
  "steps": [
    { "label": "7 — Application", "sublabel": "HTTP, HTTPS, DNS, SSH, SMTP, FTP", "color": "blue" },
    { "label": "6 — Presentation", "sublabel": "TLS/SSL encryption, data encoding", "color": "blue" },
    { "label": "5 — Session", "sublabel": "Connection management, WebSockets", "color": "blue" },
    { "label": "4 — Transport ⭐", "sublabel": "TCP (reliable), UDP (fast) — PORTS live here", "color": "green" },
    { "label": "3 — Network ⭐", "sublabel": "IP Addresses, Routing, ICMP (ping)", "color": "green" },
    { "label": "2 — Data Link", "sublabel": "MAC Addresses, Ethernet, Wi-Fi frames", "color": "purple" },
    { "label": "1 — Physical", "sublabel": "Cables, fiber, radio signals", "color": "slate" }
  ]
}
```

**Where DevOps actually spends time in this stack:**

```conceptgrid
{
  "boxes": [
    { "title": "Firewall Rules (L4)", "description": "iptables, Security Groups, NACLs", "color": "amber" },
    { "title": "Load Balancing (L4/L7)", "description": "NLB (L4), ALB (L7), Nginx", "color": "blue" },
    { "title": "DNS (L7)", "description": "Route53, CoreDNS, nslookup", "color": "green" },
    { "title": "TLS/HTTPS (L6)", "description": "Certificates, cert-manager, ACM", "color": "purple" },
    { "title": "VPN / Tunneling", "description": "WireGuard, OpenVPN, SSH tunnels", "color": "red" },
    { "title": "Packet Capture", "description": "tcpdump, Wireshark", "color": "slate" }
  ]
}
```

## TCP vs UDP — Choose the Right Protocol

TCP's 3-way handshake trades a small setup cost for reliability — every step is acknowledged before data flows:

```flow
{
  "title": "TCP — Reliable (HTTP · HTTPS · SSH · Databases · Email)",
  "layout": "flow",
  "steps": [
    { "label": "SYN", "sublabel": "Client → Server", "color": "green" },
    { "label": "SYN-ACK", "sublabel": "Server → Client", "color": "blue" },
    { "label": "ACK", "sublabel": "Connected!", "color": "purple" }
  ]
}
```

UDP skips the handshake entirely — packets just go, and if one is lost, nothing notices or retries:

```flow
{
  "title": "UDP — Fast (DNS · Video streaming · Gaming · VoIP)",
  "layout": "flow",
  "steps": [
    { "label": "Packet 1", "sublabel": "delivered", "color": "amber" },
    { "label": "Packet 2", "sublabel": "delivered", "color": "amber" },
    { "label": "Packet 3", "sublabel": "LOST — no retry", "color": "red" },
    { "label": "Packet 4", "sublabel": "delivered", "color": "amber" }
  ]
}
```

## IP Addressing and CIDR

```
IP Address: 192.168.1.100
             ↑         ↑
         Network    Host part
            part

CIDR /24 means first 24 bits are the network:
  192.168.1.0/24  =  192.168.1.0  to  192.168.1.255
                     (256 addresses, 254 usable hosts)

Cloud subnet sizing:
  /28 = 16  addresses (11 usable after AWS reserves 5)
  /24 = 256 addresses (251 usable)
  /16 = 65,536 addresses (entire VPC)
```

:::tip Quick Reference
`ping` → tests L3 connectivity
`traceroute` → shows the path packets take
`curl -v` → tests L7 HTTP connectivity
`netstat -tlnp` → shows which ports are listening
`ss -tlnp` → modern replacement for netstat
:::

## Port Numbers to Know

| Port | Protocol | Used for |
|---|---|---|
| 22 | SSH | Secure remote login |
| 80 | HTTP | Web traffic (unencrypted) |
| 443 | HTTPS | Web traffic (encrypted) |
| 3306 | MySQL | Database connections |
| 5432 | PostgreSQL | Database connections |
| 6379 | Redis | Cache connections |
| 6443 | Kubernetes API | kubectl commands |
| 2379 | etcd | Kubernetes cluster state |
| 53 | DNS | Name resolution (UDP+TCP) |
| 123 | NTP | Time synchronization (UDP) |
