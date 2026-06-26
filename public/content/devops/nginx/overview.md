# Nginx — Web Server, Reverse Proxy & Load Balancer

## What is Nginx?

Nginx (pronounced "engine-x") is a high-performance web server, reverse proxy, and load balancer. It serves as the entry point to most production web architectures.

**Key capabilities:**
- Web server: serve static files (HTML, CSS, JS, images)
- Reverse proxy: forward requests to backend services (Node, Python, Java)
- Load balancer: distribute traffic across multiple backends
- SSL/TLS termination: handle HTTPS, pass HTTP to backend
- API gateway: rate limiting, caching, authentication
- Ingress controller: Nginx is the most popular K8s ingress controller

---

## Installation

```bash
# Ubuntu/Debian
sudo apt update && sudo apt install nginx -y

# RHEL/CentOS/Rocky
sudo dnf install nginx -y

# Start + enable
sudo systemctl start nginx
sudo systemctl enable nginx

# Verify
nginx -v
curl http://localhost    # should return Nginx welcome page
```

---

## Core Configuration

### Config Structure
```
/etc/nginx/
├── nginx.conf              # main config (worker processes, events, http block)
├── conf.d/                 # drop-in site configs
│   └── myapp.conf
├── sites-available/        # Ubuntu/Debian: available configs
├── sites-enabled/          # Ubuntu/Debian: symlinks to active configs
├── snippets/               # reusable config snippets
└── ssl/                    # SSL certificates
```

### Main Config (`nginx.conf`)
```nginx
worker_processes auto;         # one worker per CPU core
error_log /var/log/nginx/error.log warn;
pid /run/nginx.pid;

events {
    worker_connections 1024;   # max connections per worker
    use epoll;                 # Linux efficient I/O
}

http {
    include mime.types;
    default_type application/octet-stream;
    
    # Logging format
    log_format main '$remote_addr - $remote_user [$time_local] '
                    '"$request" $status $body_bytes_sent '
                    '"$http_referer" "$http_user_agent"';
    
    access_log /var/log/nginx/access.log main;
    
    sendfile on;
    keepalive_timeout 65;
    gzip on;
    
    include /etc/nginx/conf.d/*.conf;
}
```

### Reverse Proxy Config
```nginx
# /etc/nginx/conf.d/myapp.conf

upstream backend {
    server 127.0.0.1:3000;    # Node.js app
    server 127.0.0.1:3001;    # second instance
    keepalive 32;              # connection pooling
}

server {
    listen 80;
    server_name app.example.com;
    
    # Redirect HTTP to HTTPS
    return 301 https://$server_name$request_uri;
}

server {
    listen 443 ssl http2;
    server_name app.example.com;
    
    # SSL
    ssl_certificate /etc/ssl/certs/app.example.com.crt;
    ssl_certificate_key /etc/ssl/private/app.example.com.key;
    ssl_protocols TLSv1.2 TLSv1.3;
    ssl_ciphers ECDHE-RSA-AES256-GCM-SHA384:ECDHE-RSA-AES128-GCM-SHA256;
    ssl_prefer_server_ciphers on;
    
    # Security headers
    add_header X-Frame-Options DENY;
    add_header X-Content-Type-Options nosniff;
    add_header Strict-Transport-Security "max-age=31536000" always;
    
    # Proxy to backend
    location / {
        proxy_pass http://backend;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_connect_timeout 5s;
        proxy_send_timeout 60s;
        proxy_read_timeout 60s;
    }
    
    # Static files — serve directly, faster than proxy
    location /static/ {
        root /var/www/app;
        expires 30d;
        add_header Cache-Control "public, immutable";
    }
    
    # Health check endpoint — no logging
    location /health {
        proxy_pass http://backend;
        access_log off;
    }
}
```

---

## Load Balancing Methods

```nginx
upstream backend {
    # Round robin (default) — requests distributed equally
    server 10.0.0.1:3000;
    server 10.0.0.2:3000;
    server 10.0.0.3:3000;
}

upstream backend_weighted {
    # Weighted — server 1 gets 3x traffic
    server 10.0.0.1:3000 weight=3;
    server 10.0.0.2:3000 weight=1;
}

upstream backend_ip_hash {
    # IP hash — same client always goes to same server (session stickiness)
    ip_hash;
    server 10.0.0.1:3000;
    server 10.0.0.2:3000;
}

upstream backend_least_conn {
    # Least connections — route to server with fewest active connections
    least_conn;
    server 10.0.0.1:3000;
    server 10.0.0.2:3000;
}
```

---

## Rate Limiting

```nginx
http {
    # Define zone: 10MB storage, 10 requests/second per IP
    limit_req_zone $binary_remote_addr zone=api:10m rate=10r/s;
    
    server {
        location /api/ {
            limit_req zone=api burst=20 nodelay;
            limit_req_status 429;
            proxy_pass http://backend;
        }
    }
}
```

---

## Nginx Commands

```bash
nginx -t                           # test config syntax
nginx -T                           # print full resolved config
nginx -s reload                    # reload config (zero downtime)
nginx -s stop                      # stop immediately
systemctl reload nginx             # same as -s reload via systemd

# Logs
tail -f /var/log/nginx/access.log
tail -f /var/log/nginx/error.log
# Filter by status code
awk '$9 == 500' /var/log/nginx/access.log
```
