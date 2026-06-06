# Network Security

Network security protects your infrastructure from unauthorized access, misuse, and attacks. For cloud and DevOps engineers, network security is foundational — every misconfigured security group, open port, or unencrypted connection is a potential breach.

## Defense in Depth — Network Layers

```
Internet
    │
[DDoS Protection]         AWS Shield, Cloudflare
    │
[WAF]                     AWS WAF, Cloudflare WAF
    │
[Load Balancer]           ALB/NLB — TLS termination
    │
[Firewall / Security Group]  Perimeter defense
    │
[DMZ / Public Subnet]     Bastion, NAT Gateway
    │
[Private Subnet]          Application servers
    │
[Database Subnet]         RDS, ElastiCache
    │
[Encryption at Rest]      KMS, EBS encryption
```

## Firewalls and Security Groups

```bash
# iptables — Linux stateful firewall
# Default-deny policy
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT ACCEPT

# Allow established connections
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

# Allow specific services
iptables -A INPUT -p tcp --dport 22 -s 10.0.0.0/8 -j ACCEPT  # SSH from internal only
iptables -A INPUT -p tcp --dport 80 -j ACCEPT
iptables -A INPUT -p tcp --dport 443 -j ACCEPT

# Block known bad actors
iptables -A INPUT -s 1.2.3.4 -j DROP
iptables -A INPUT -m recent --name badactors --rcheck --seconds 3600 -j DROP

# Rate limiting — protect against brute force
iptables -A INPUT -p tcp --dport 22 -m state --state NEW \
  -m recent --set --name SSH
iptables -A INPUT -p tcp --dport 22 -m state --state NEW \
  -m recent --update --seconds 60 --hitcount 4 --name SSH -j DROP

# Save rules
iptables-save > /etc/iptables/rules.v4
```

```bash
# AWS Security Groups — stateful, allow-only
# NEVER open 0.0.0.0/0 for SSH/RDP in production

# Web server security group
aws ec2 create-security-group \
  --group-name web-sg \
  --description "Web server" \
  --vpc-id vpc-xxx

# HTTP/HTTPS from anywhere
aws ec2 authorize-security-group-ingress \
  --group-id sg-xxx \
  --ip-permissions \
  '[{"IpProtocol":"tcp","FromPort":80,"ToPort":80,"IpRanges":[{"CidrIp":"0.0.0.0/0"}]},
    {"IpProtocol":"tcp","FromPort":443,"ToPort":443,"IpRanges":[{"CidrIp":"0.0.0.0/0"}]}]'

# SSH from bastion only (NOT from internet)
aws ec2 authorize-security-group-ingress \
  --group-id sg-xxx \
  --protocol tcp --port 22 \
  --source-group sg-bastion-id   # Allow from bastion SG only

# Database security group — only allow from app tier
aws ec2 authorize-security-group-ingress \
  --group-id sg-db \
  --protocol tcp --port 5432 \
  --source-group sg-app          # Only app servers can reach DB
```

## VPN and Secure Connectivity

```bash
# WireGuard — modern, fast VPN
# Server setup
sudo apt install wireguard

# Generate server keys
wg genkey | tee /etc/wireguard/server_private.key | \
  wg pubkey > /etc/wireguard/server_public.key

cat /etc/wireguard/wg0.conf << 'EOF'
[Interface]
Address = 10.8.0.1/24
ListenPort = 51820
PrivateKey = <SERVER_PRIVATE_KEY>
PostUp = iptables -A FORWARD -i wg0 -j ACCEPT; iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
PostDown = iptables -D FORWARD -i wg0 -j ACCEPT; iptables -t nat -D POSTROUTING -o eth0 -j MASQUERADE

[Peer]                           # Client 1
PublicKey = <CLIENT1_PUBLIC_KEY>
AllowedIPs = 10.8.0.2/32

[Peer]                           # Client 2
PublicKey = <CLIENT2_PUBLIC_KEY>
AllowedIPs = 10.8.0.3/32
EOF

sudo systemctl enable --now wg-quick@wg0

# AWS Site-to-Site VPN
aws ec2 create-vpn-gateway \
  --type ipsec.1 \
  --tag-specifications 'ResourceType=vpn-gateway,Tags=[{Key=Name,Value=prod-vpn-gw}]'

aws ec2 create-customer-gateway \
  --type ipsec.1 \
  --bgp-asn 65000 \
  --public-ip <ONPREM_IP>
```

## TLS/SSL Configuration

```bash
# Generate CSR for certificate
openssl req -newkey rsa:4096 \
  -keyout private.key \
  -out request.csr \
  -subj "/C=US/ST=CA/L=SanJose/O=MyCompany/CN=api.myapp.com"

# Self-signed cert (dev only!)
openssl req -x509 -newkey rsa:4096 \
  -keyout key.pem -out cert.pem \
  -days 365 -nodes \
  -subj "/CN=localhost"

# Check certificate
openssl x509 -in cert.pem -noout -text
openssl s_client -connect api.example.com:443 -showcerts

# Let's Encrypt with certbot
sudo apt install certbot
sudo certbot certonly --standalone -d api.example.com
sudo certbot renew --dry-run

# Nginx TLS hardening
cat /etc/nginx/snippets/ssl-params.conf << 'EOF'
ssl_protocols TLSv1.2 TLSv1.3;
ssl_prefer_server_ciphers on;
ssl_ciphers ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES128-GCM-SHA256;
ssl_session_timeout 1d;
ssl_session_cache shared:SSL:50m;
ssl_stapling on;
ssl_stapling_verify on;
add_header Strict-Transport-Security "max-age=63072000" always;
add_header X-Frame-Options SAMEORIGIN;
add_header X-Content-Type-Options nosniff;
EOF
```

## Network Monitoring and IDS

```bash
# Fail2ban — auto-ban brute force attackers
sudo apt install fail2ban

cat /etc/fail2ban/jail.local << 'EOF'
[DEFAULT]
bantime  = 3600       # Ban for 1 hour
findtime = 600        # In a 10 minute window
maxretry = 3          # After 3 failures

[sshd]
enabled = true
port    = ssh
logpath = %(sshd_log)s

[nginx-http-auth]
enabled = true
filter  = nginx-http-auth
logpath = /var/log/nginx/error.log

[nginx-limit-req]
enabled  = true
filter   = nginx-limit-req
logpath  = /var/log/nginx/error.log
maxretry = 10
EOF

systemctl restart fail2ban
fail2ban-client status         # Check status
fail2ban-client status sshd    # SSH jail status
fail2ban-client set sshd unbanip 1.2.3.4  # Unban IP

# Snort IDS — network intrusion detection
apt install snort
snort -c /etc/snort/snort.conf -i eth0 -A alert_fast

# Zeek (formerly Bro) — network analysis
zeek -i eth0 local
cat /usr/local/zeek/logs/current/conn.log    # Connection log
cat /usr/local/zeek/logs/current/http.log    # HTTP log
cat /usr/local/zeek/logs/current/dns.log     # DNS log
```

## Network Segmentation — Zero Trust

```yaml
# Kubernetes NetworkPolicy — microsegmentation
# Default deny all in production namespace
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: default-deny-all
  namespace: production
spec:
  podSelector: {}
  policyTypes:
  - Ingress
  - Egress

---
# Allow frontend to backend only on port 8080
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: allow-frontend-to-backend
  namespace: production
spec:
  podSelector:
    matchLabels:
      app: backend
  policyTypes:
  - Ingress
  ingress:
  - from:
    - podSelector:
        matchLabels:
          app: frontend
    ports:
    - protocol: TCP
      port: 8080

---
# Allow backend egress to database and external HTTPS only
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: backend-egress
  namespace: production
spec:
  podSelector:
    matchLabels:
      app: backend
  policyTypes:
  - Egress
  egress:
  - to:
    - podSelector:
        matchLabels:
          app: database
    ports:
    - port: 5432
  - to:             # Allow HTTPS to internet (for external APIs)
    - ipBlock:
        cidr: 0.0.0.0/0
        except:
        - 10.0.0.0/8
    ports:
    - port: 443
```

## Common Attack Vectors and Defenses

```
Attack: Port Scanning
Defense: Block common scanner ports, use port knocking,
         rate limit connections, alert on sequential scanning

Attack: DDoS (Volumetric)
Defense: Cloudflare/AWS Shield, anycast routing,
         auto-scaling, CDN caching, rate limiting

Attack: Man-in-the-Middle
Defense: TLS 1.3 everywhere, HSTS headers, certificate pinning,
         mutual TLS (mTLS) for service-to-service

Attack: SQL Injection via network
Defense: WAF rules, parameterized queries, DB firewall,
         database in private subnet (no direct internet access)

Attack: Lateral Movement
Defense: Network segmentation, micro-segmentation (K8s NetworkPolicy),
         zero trust (no implicit trust within network),
         privileged access workstations (PAW)

Attack: Data Exfiltration
Defense: Egress filtering, DLP (Data Loss Prevention),
         monitor large outbound transfers, CASB for cloud

Attack: Credential Theft / Pass-the-Hash
Defense: MFA everywhere, privileged identity management,
         just-in-time access, regular credential rotation
```

## Interview Questions

**What is the difference between a firewall and an IDS/IPS?**
A firewall is a preventive control — it blocks or allows traffic based on predefined rules (IP, port, protocol, state). It decides what traffic can enter or leave. An IDS (Intrusion Detection System) is a detective control — it monitors traffic and alerts on suspicious patterns but doesn't block. An IPS (Intrusion Prevention System) is both — it monitors AND actively blocks malicious traffic inline. Modern NGFWs (Next-Gen Firewalls) combine all three with deep packet inspection, application awareness, and threat intelligence.

**Explain the concept of defense in depth for network security.**
Defense in depth means layering multiple security controls so that if one fails, others remain. For cloud networks: internet traffic hits DDoS protection (AWS Shield) first, then WAF filters malicious HTTP, then load balancers terminate TLS, then security groups filter by port/protocol, then application-level authentication validates identity, then authorization checks permissions, then the database sits in a private subnet with its own security group, and finally all data is encrypted at rest. An attacker must bypass every layer — making successful attacks exponentially harder.
