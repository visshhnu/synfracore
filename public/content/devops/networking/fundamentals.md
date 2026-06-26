# Networking

Networking › Fundamentals
📡**Networking**
BeginnerEngineerProductionArchitectTCP/UDP, DNS, HTTP/HTTPS, load balancers, Kubernetes networking
[OSI & TCP/UDP](#sec-osi)[DNS](#sec-dns)[HTTP/TLS](#sec-http)[Load Balancers](#sec-loadbalancer)[Troubleshoot](#sec-troubleshoot)[Interview Q&A](#sec-interview)


## 📡 OSI Model & TCP vs UDP›


#### The 7 Layers — know them for interviews

| Layer | Name | What it does | Examples |
|---|---|---|---|
| 7 | Application | User-facing protocols | HTTP, DNS, SMTP, gRPC |
| 6 | Presentation | Encryption, encoding | TLS/SSL |
| 4 | Transport | End-to-end communication | TCP, UDP, ports |
| 3 | Network | Routing between networks | IP, ICMP, routing |
| 2 | Data Link | Node-to-node transfer | Ethernet, MAC |
| 1 | Physical | Raw bits over medium | Cables, Wi-Fi signals |


TCP vs UDP + connection states + ss commandsCopy

```

```


## 🌐 DNS — Domain Name System›


DNS records, resolution flow, Kubernetes DNS, debuggingCopy

```

```


## 🔒 HTTP/HTTPS & TLS›


#### HTTP status codes — know these cold

| Code | Meaning | DevOps context |
|---|---|---|
| 200 | OK | Health check passing |
| 301/302 | Redirect | HTTP→HTTPS redirect |
| 401 | Unauthorized | Missing or invalid token |
| 403 | Forbidden | Valid token, no permission |
| 429 | Too Many Requests | Rate limiting triggered |
| 502 | Bad Gateway | Upstream returned garbage |
| 503 | Service Unavailable | No healthy backends |
| 504 | Gateway Timeout | Upstream too slow |


HTTP/2, TLS handshake, curl debuggingCopy

```

```


## ⚖️ Load Balancers›


L4 vs L7, K8s service types, nginx configCopy

```

```


## 🔍 Troubleshooting›


Connectivity, K8s network, tcpdump, firewall, TLSCopy

```

```


## 🎯 Interview Questions›


All
Architect
Engineer
Production


NETWORKING · ENGINEER
Explain the difference between TCP and UDP. When would you use each?
TCP (Transmission Control Protocol) is connection-oriented and reliable. Before sending data, it establishes a connection via 3-way handshake. Every packet is acknowledged. If a packet is lost, TCP retransmits it. Packets arrive in order. Slower due to this overhead. Use TCP for: HTTP/HTTPS (web), SSH (terminal), database connections, any application where data correctness matters more than speed. UDP (User Datagram Protocol) is connectionless and fast. No handshake, no acknowledgment, no ordering guarantee. Packets can arrive out of order or be lost — the application handles this. Much lower latency. Use UDP for: DN
