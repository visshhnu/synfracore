# Network Security — Intermediate

## Intrusion Detection with Suricata

```yaml
# Suricata — high-performance IDS/IPS
# Install: apt install suricata

# /etc/suricata/suricata.yaml
vars:
  address-groups:
    HOME_NET: "[10.0.0.0/8,172.16.0.0/12,192.168.0.0/16]"
    EXTERNAL_NET: "!$HOME_NET"

outputs:
  - eve-log:
      enabled: yes
      filetype: regular
      filename: /var/log/suricata/eve.json
      types:
        - alert:
            payload: yes
            http: yes
            tls: yes

# Custom detection rules
# /etc/suricata/rules/local.rules
alert http $EXTERNAL_NET any -> $HOME_NET any (
    msg:"Suspicious User-Agent - Scanning Tool";
    flow:to_server,established;
    http.user_agent;
    content:"Nmap Scripting Engine";
    nocase;
    sid:1000001; rev:1;
)

alert dns any any -> any any (
    msg:"DNS Tunneling - High Query Rate";
    threshold:type both, track by_src, count 100, seconds 10;
    sid:1000002; rev:1;
)

# Run Suricata
suricata -c /etc/suricata/suricata.yaml -i eth0

# Analyze alerts with jq
cat /var/log/suricata/eve.json | jq 'select(.event_type=="alert") | {time, src_ip, dest_ip, alert}'
```

## VPN Configuration (WireGuard)

```bash
# WireGuard — modern VPN, fast and simple
# Server setup (Ubuntu)
apt install wireguard

# Generate server keys
wg genkey | tee server-private.key | wg pubkey > server-public.key
chmod 600 server-private.key

# /etc/wireguard/wg0.conf
[Interface]
Address = 10.10.0.1/24
ListenPort = 51820
PrivateKey = <server-private-key>
PostUp = iptables -A FORWARD -i wg0 -j ACCEPT; iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
PostDown = iptables -D FORWARD -i wg0 -j ACCEPT; iptables -t nat -D POSTROUTING -o eth0 -j MASQUERADE

[Peer]
# Client 1
PublicKey = <client1-public-key>
AllowedIPs = 10.10.0.2/32

# Client setup
wg genkey | tee client-private.key | wg pubkey > client-public.key

[Interface]
Address = 10.10.0.2/24
PrivateKey = <client-private-key>
DNS = 10.10.0.1

[Peer]
PublicKey = <server-public-key>
Endpoint = vpn.example.com:51820
AllowedIPs = 0.0.0.0/0   # Route ALL traffic through VPN
PersistentKeepalive = 25  # Keep NAT alive

# Start WireGuard
wg-quick up wg0
systemctl enable wg-quick@wg0
```

## Zero Trust with Cloudflare Access

```yaml
# Cloudflare Zero Trust — no VPN, identity-based access
# Every request authenticated and authorized

# Terraform: Cloudflare Access Application
resource "cloudflare_access_application" "internal-app" {
  zone_id          = var.zone_id
  name             = "Internal Dashboard"
  domain           = "dashboard.internal.example.com"
  session_duration = "4h"
  
  cors_headers {
    allowed_methods = ["GET", "POST"]
    allow_credentials = true
  }
}

resource "cloudflare_access_policy" "employees-only" {
  application_id = cloudflare_access_application.internal-app.id
  zone_id        = var.zone_id
  name           = "Employees Only"
  precedence     = 1
  decision       = "allow"

  include {
    email_domain = ["company.com"]
    okta {
      name            = "Okta"
      identity_provider_id = var.okta_idp_id
      groups          = ["engineering", "devops"]
    }
  }
  
  require {
    device_posture = [var.corporate_device_rule_id]  # Require managed device
  }
}
```
