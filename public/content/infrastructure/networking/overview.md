# Networking for DevOps — Complete Foundation

Every DevOps engineer must understand how data flows through networks. Without this knowledge, you cannot debug connectivity issues, design secure cloud architectures, or understand how containers communicate.

## The OSI Model in Practice

```svg
<svg viewBox="0 0 720 320" xmlns="http://www.w3.org/2000/svg" style="max-width:100%;font-family:Inter,sans-serif">
  <!-- Layers -->
  <!-- L7 -->
  <rect x="10" y="10" width="450" height="38" rx="8" fill="#1E3A5F" stroke="#3B82F6" stroke-width="1.5"/>
  <text x="22" y="33" font-size="13" fill="#93C5FD" font-weight="800">7  Application</text>
  <text x="200" y="33" font-size="11" fill="#60A5FA">HTTP, HTTPS, DNS, SSH, SMTP, FTP</text>

  <!-- L6 -->
  <rect x="10" y="56" width="450" height="38" rx="8" fill="#1E3A5F" stroke="#3B82F6" stroke-width="1"/>
  <text x="22" y="79" font-size="13" fill="#93C5FD" font-weight="700">6  Presentation</text>
  <text x="200" y="79" font-size="11" fill="#60A5FA">TLS/SSL encryption, data encoding</text>

  <!-- L5 -->
  <rect x="10" y="102" width="450" height="38" rx="8" fill="#1E3A5F" stroke="#3B82F6" stroke-width="1"/>
  <text x="22" y="125" font-size="13" fill="#93C5FD" font-weight="700">5  Session</text>
  <text x="200" y="125" font-size="11" fill="#60A5FA">Connection management, WebSockets</text>

  <!-- L4 - highlighted -->
  <rect x="10" y="148" width="450" height="38" rx="8" fill="#064E3B" stroke="#10B981" stroke-width="2"/>
  <text x="22" y="171" font-size="13" fill="#34D399" font-weight="800">4  Transport ⭐</text>
  <text x="200" y="171" font-size="11" fill="#6EE7B7">TCP (reliable), UDP (fast)  |  PORTS live here</text>

  <!-- L3 - highlighted -->
  <rect x="10" y="194" width="450" height="38" rx="8" fill="#064E3B" stroke="#10B981" stroke-width="2"/>
  <text x="22" y="217" font-size="13" fill="#34D399" font-weight="800">3  Network ⭐</text>
  <text x="200" y="217" font-size="11" fill="#6EE7B7">IP Addresses, Routing, ICMP (ping)</text>

  <!-- L2 -->
  <rect x="10" y="240" width="450" height="38" rx="8" fill="#2D1B69" stroke="#7C3AED" stroke-width="1.5"/>
  <text x="22" y="263" font-size="13" fill="#C4B5FD" font-weight="700">2  Data Link</text>
  <text x="200" y="263" font-size="11" fill="#A78BFA">MAC Addresses, Ethernet, Wi-Fi frames</text>

  <!-- L1 -->
  <rect x="10" y="286" width="450" height="24" rx="8" fill="#1F2937" stroke="#6B7280" stroke-width="1"/>
  <text x="22" y="302" font-size="11" fill="#9CA3AF" font-weight="600">1  Physical</text>
  <text x="200" y="302" font-size="11" fill="#6B7280">Cables, fiber, radio signals</text>

  <!-- Right panel: What DevOps cares about -->
  <rect x="480" y="10" width="230" height="300" rx="12" fill="#0F172A" stroke="#F59E0B" stroke-width="1.5"/>
  <text x="595" y="36" font-size="12" fill="#FCD34D" text-anchor="middle" font-weight="800">DevOps Focus Areas</text>

  <rect x="496" y="48" width="198" height="36" rx="7" fill="#78350F" stroke="#D97706" stroke-width="1"/>
  <text x="595" y="64" font-size="10" fill="#FDE68A" text-anchor="middle" font-weight="700">Firewall Rules (L4)</text>
  <text x="595" y="78" font-size="9" fill="#FCD34D" text-anchor="middle">iptables, Security Groups, NACLs</text>

  <rect x="496" y="92" width="198" height="36" rx="7" fill="#1E3A5F" stroke="#3B82F6" stroke-width="1"/>
  <text x="595" y="108" font-size="10" fill="#93C5FD" text-anchor="middle" font-weight="700">Load Balancing (L4/L7)</text>
  <text x="595" y="122" font-size="9" fill="#60A5FA" text-anchor="middle">NLB (L4), ALB (L7), Nginx</text>

  <rect x="496" y="136" width="198" height="36" rx="7" fill="#064E3B" stroke="#10B981" stroke-width="1"/>
  <text x="595" y="152" font-size="10" fill="#6EE7B7" text-anchor="middle" font-weight="700">DNS (L7)</text>
  <text x="595" y="166" font-size="9" fill="#34D399" text-anchor="middle">Route53, CoreDNS, nslookup</text>

  <rect x="496" y="180" width="198" height="36" rx="7" fill="#2D1B69" stroke="#7C3AED" stroke-width="1"/>
  <text x="595" y="196" font-size="10" fill="#C4B5FD" text-anchor="middle" font-weight="700">TLS/HTTPS (L6)</text>
  <text x="595" y="210" font-size="9" fill="#A78BFA" text-anchor="middle">Certificates, cert-manager, ACM</text>

  <rect x="496" y="224" width="198" height="36" rx="7" fill="#7F1D1D" stroke="#EF4444" stroke-width="1"/>
  <text x="595" y="240" font-size="10" fill="#FCA5A5" text-anchor="middle" font-weight="700">VPN / Tunneling</text>
  <text x="595" y="254" font-size="9" fill="#F87171" text-anchor="middle">WireGuard, OpenVPN, SSH tunnels</text>

  <rect x="496" y="268" width="198" height="36" rx="7" fill="#1C1917" stroke="#78716C" stroke-width="1"/>
  <text x="595" y="284" font-size="10" fill="#D6D3D1" text-anchor="middle" font-weight="700">Packet Capture</text>
  <text x="595" y="298" font-size="9" fill="#A8A29E" text-anchor="middle">tcpdump, Wireshark</text>
</svg>
```

## TCP vs UDP — Choose the Right Protocol

```svg
<svg viewBox="0 0 720 200" xmlns="http://www.w3.org/2000/svg" style="max-width:100%;font-family:Inter,sans-serif">
  <!-- TCP -->
  <rect x="10" y="10" width="340" height="180" rx="12" fill="#0F172A" stroke="#3B82F6" stroke-width="2"/>
  <text x="180" y="36" font-size="14" fill="#60A5FA" text-anchor="middle" font-weight="800">TCP — Reliable</text>

  <!-- 3-way handshake diagram -->
  <text x="80"  y="62" font-size="10" fill="#9CA3AF" text-anchor="middle">Client</text>
  <text x="280" y="62" font-size="10" fill="#9CA3AF" text-anchor="middle">Server</text>
  <line x1="80" y1="68" x2="80"  y2="170" stroke="#374151" stroke-width="1"/>
  <line x1="280" y1="68" x2="280" y2="170" stroke="#374151" stroke-width="1"/>

  <line x1="80" y1="80" x2="280" y2="100" stroke="#34D399" stroke-width="1.5" marker-end="url(#g)"/>
  <text x="180" y="86" font-size="9" fill="#34D399" text-anchor="middle">SYN</text>
  <line x1="280" y1="110" x2="80" y2="130" stroke="#60A5FA" stroke-width="1.5" marker-end="url(#b)"/>
  <text x="180" y="116" font-size="9" fill="#60A5FA" text-anchor="middle">SYN-ACK</text>
  <line x1="80" y1="140" x2="280" y2="158" stroke="#A78BFA" stroke-width="1.5" marker-end="url(#p)"/>
  <text x="180" y="146" font-size="9" fill="#A78BFA" text-anchor="middle">ACK → Connected!</text>

  <defs>
    <marker id="g" markerWidth="6" markerHeight="5" refX="6" refY="2.5" orient="auto"><polygon points="0 0,6 2.5,0 5" fill="#34D399"/></marker>
    <marker id="b" markerWidth="6" markerHeight="5" refX="6" refY="2.5" orient="auto"><polygon points="0 0,6 2.5,0 5" fill="#60A5FA"/></marker>
    <marker id="p" markerWidth="6" markerHeight="5" refX="6" refY="2.5" orient="auto"><polygon points="0 0,6 2.5,0 5" fill="#A78BFA"/></marker>
  </defs>

  <!-- TCP use cases -->
  <text x="180" y="172" font-size="9" fill="#6B7280" text-anchor="middle">HTTP · HTTPS · SSH · Databases · Email</text>

  <!-- UDP -->
  <rect x="370" y="10" width="340" height="180" rx="12" fill="#0F172A" stroke="#F59E0B" stroke-width="2"/>
  <text x="540" y="36" font-size="14" fill="#FCD34D" text-anchor="middle" font-weight="800">UDP — Fast</text>

  <text x="460" y="62" font-size="10" fill="#9CA3AF" text-anchor="middle">Sender</text>
  <text x="640" y="62" font-size="10" fill="#9CA3AF" text-anchor="middle">Receiver</text>
  <line x1="460" y1="68" x2="460" y2="170" stroke="#374151" stroke-width="1"/>
  <line x1="640" y1="68" x2="640" y2="170" stroke="#374151" stroke-width="1"/>

  <line x1="460" y1="80"  x2="640" y2="90"  stroke="#FCD34D" stroke-width="1.5" marker-end="url(#y)"/>
  <text x="550" y="83"  font-size="9" fill="#FCD34D" text-anchor="middle">Data packet 1 →</text>
  <line x1="460" y1="100" x2="640" y2="110" stroke="#FCD34D" stroke-width="1.5" marker-end="url(#y)"/>
  <text x="550" y="103" font-size="9" fill="#FCD34D" text-anchor="middle">Data packet 2 →</text>
  <line x1="460" y1="120" x2="580" y2="130" stroke="#EF4444" stroke-width="1.5" stroke-dasharray="4,2"/>
  <text x="540" y="123" font-size="9" fill="#EF4444" text-anchor="middle">packet 3 → LOST</text>
  <line x1="460" y1="140" x2="640" y2="150" stroke="#FCD34D" stroke-width="1.5" marker-end="url(#y)"/>
  <text x="550" y="143" font-size="9" fill="#FCD34D" text-anchor="middle">Data packet 4 →</text>
  <text x="550" y="165" font-size="9" fill="#F97316" text-anchor="middle">No ACK, no retry — just speed!</text>

  <text x="540" y="178" font-size="9" fill="#6B7280" text-anchor="middle">DNS · Video streaming · Gaming · VoIP</text>
  <defs><marker id="y" markerWidth="6" markerHeight="5" refX="6" refY="2.5" orient="auto"><polygon points="0 0,6 2.5,0 5" fill="#FCD34D"/></marker></defs>
</svg>
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
