# Nginx — Cheatsheet

## Essential Commands

```bash
nginx -t                    # Test configuration
nginx -T                    # Test + dump full config
nginx -s reload             # Reload (zero-downtime)
nginx -s stop               # Fast stop
nginx -s quit               # Graceful stop
systemctl reload nginx      # Preferred reload method

# Logs
tail -f /var/log/nginx/access.log
tail -f /var/log/nginx/error.log

# Status (if stub_status enabled)
curl http://localhost/nginx_status

# Performance analysis
awk '{print $9}' /var/log/nginx/access.log | sort | uniq -c | sort -rn
# HTTP status codes breakdown

awk '{print $7}' /var/log/nginx/access.log | sort | uniq -c | sort -rn | head -20
# Top 20 URLs by request count
```

## Configuration Patterns

```nginx
# ── REVERSE PROXY ─────────────────────────────────────────
location / {
    proxy_pass         http://backend:3000;
    proxy_http_version 1.1;
    proxy_set_header   Host              $host;
    proxy_set_header   X-Real-IP         $remote_addr;
    proxy_set_header   X-Forwarded-For   $proxy_add_x_forwarded_for;
    proxy_set_header   X-Forwarded-Proto $scheme;
    proxy_set_header   Upgrade           $http_upgrade;
    proxy_set_header   Connection        "upgrade";   # For WebSocket
    proxy_read_timeout 60s;
    proxy_connect_timeout 10s;
}

# ── LOAD BALANCING ────────────────────────────────────────
upstream app {
    least_conn;
    server app1:3000 weight=3;
    server app2:3000 weight=1;
    server app3:3000 backup;      # Only used when others are down
    keepalive 32;                  # Keep connections to upstream
}

# ── STATIC FILES ──────────────────────────────────────────
location /static/ {
    root /var/www;                 # Serves /var/www/static/
    expires 1y;
    add_header Cache-Control "public, immutable";
    gzip_static on;                # Serve .gz if available
    access_log off;
}

# ── SSL ───────────────────────────────────────────────────
server {
    listen 443 ssl http2;
    ssl_certificate     /etc/ssl/certs/cert.pem;
    ssl_certificate_key /etc/ssl/private/key.pem;
    ssl_protocols       TLSv1.2 TLSv1.3;
    ssl_ciphers         HIGH:!aNULL:!MD5:!3DES;
    ssl_session_cache   shared:SSL:10m;
    ssl_session_timeout 1d;
}

# ── RATE LIMITING ─────────────────────────────────────────
# In http block:
limit_req_zone $binary_remote_addr zone=api:10m rate=10r/s;
limit_req_zone $binary_remote_addr zone=login:10m rate=5r/m;

# In server/location:
location /api/ {
    limit_req zone=api burst=20 nodelay;
    limit_req_status 429;
}

# ── SECURITY HEADERS ─────────────────────────────────────
add_header X-Frame-Options "DENY" always;
add_header X-Content-Type-Options "nosniff" always;
add_header Referrer-Policy "strict-origin-when-cross-origin" always;
add_header Strict-Transport-Security "max-age=31536000; includeSubDomains" always;
add_header Content-Security-Policy "default-src 'self'" always;

# ── REDIRECTS ─────────────────────────────────────────────
return 301 https://$host$request_uri;   # HTTP → HTTPS
return 301 $scheme://www.$host$request_uri;  # non-www → www
rewrite ^/old-path(.*)$ /new-path$1 permanent;

# ── GZIP ─────────────────────────────────────────────────
gzip on;
gzip_comp_level 6;
gzip_min_length 1000;
gzip_types text/plain text/css application/json application/javascript text/xml application/xml;
```
