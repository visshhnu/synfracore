# Network Security — Advanced

## DDoS Protection Architecture

```
DDoS mitigation layers:
  
  1. Anycast + Scrubbing Center (Cloudflare, Akamai)
     ↓ Absorbs volumetric attacks (100Gbps+)
  
  2. BGP Blackholing (ISP level)
     ↓ Route malicious traffic to null
  
  3. Rate Limiting (WAF/CDN edge)
     ↓ Per-IP limits, geo-blocking, JS challenges
  
  4. Application layer (your servers)
     ↓ Token bucket rate limiting, CAPTCHA, 429 responses
```

```nginx
# Nginx rate limiting + connection limits
limit_req_zone $binary_remote_addr zone=req:10m rate=10r/s;
limit_conn_zone $binary_remote_addr zone=conn:10m;

server {
    limit_conn conn 20;                    # Max 20 concurrent connections per IP
    limit_req zone=req burst=30 nodelay;   # 10/s with burst of 30
    limit_req_status 429;
    
    # Mitigate Slowloris attacks
    client_body_timeout 10s;
    client_header_timeout 10s;
    keepalive_timeout 15s;
    send_timeout 10s;
    
    # Block common attack strings
    if ($http_user_agent ~* (curl|wget|python-requests|nikto|sqlmap)) {
        return 403;
    }
}
```

## Network Security Cheatsheet

```bash
# ── NMAP ──────────────────────────────────────────────────
nmap -sn 192.168.1.0/24              # Host discovery (ping sweep)
nmap -sV -sC target                   # Service versions + default scripts
nmap -p- --min-rate=5000 target      # Fast full port scan
nmap -A target                        # Aggressive: OS, version, scripts, traceroute
nmap -sU target                       # UDP scan
nmap --script vuln target             # Vulnerability scripts
nmap -oN out.txt -oX out.xml target   # Output to files

# ── NETWORK ANALYSIS ──────────────────────────────────────
wireshark                              # GUI packet capture
tcpdump -i eth0 -w cap.pcap           # Capture to file
tcpdump -i any port 443 -A            # Print payload
tshark -r cap.pcap -T fields -e ip.src -e ip.dst -e tcp.port  # Extract fields
netstat -tlnp                         # Listening ports
ss -tlnp                              # Modern alternative
lsof -i :80                           # Process using port 80

# ── FIREWALL ──────────────────────────────────────────────
iptables -L -n -v --line-numbers       # List all rules
iptables -A INPUT -p tcp --dport 22 -s 10.0.0.0/8 -j ACCEPT
iptables -A INPUT -j DROP             # Default deny
iptables-save > /etc/iptables/rules.v4
ufw enable && ufw allow 443/tcp && ufw status verbose

# ── SSL/TLS TESTING ───────────────────────────────────────
sslyze target.com:443                  # TLS analysis
testssl.sh target.com                  # Comprehensive SSL test
openssl s_client -connect t:443 -tls1_3  # Test TLS 1.3 support
nmap --script ssl-enum-ciphers -p 443 target  # List ciphers

# ── DNS SECURITY ──────────────────────────────────────────
dig +dnssec target.com                 # DNSSEC validation
dig @8.8.8.8 target.com               # Specific resolver
dig -x 1.2.3.4                        # Reverse DNS
nslookup -type=TXT target.com         # SPF/DKIM records
whois target.com                       # Domain registration
```
