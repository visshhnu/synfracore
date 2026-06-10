# Nginx — Web Server, Reverse Proxy & Load Balancer

Nginx (pronounced "engine-x") is the most widely deployed web server in the world. It powers over 34% of all websites and is the default reverse proxy in Kubernetes ingress, Docker environments, and cloud architectures.

## What Nginx Does

```
Internet → Nginx → Application Servers
            │
            ├── Reverse proxy (forward requests to backend)
            ├── Load balancer (distribute across multiple backends)
            ├── SSL/TLS termination (handle HTTPS, pass HTTP internally)
            ├── Static file serving (images, CSS, JS — extremely fast)
            ├── Rate limiting (protect APIs from abuse)
            ├── Caching (cache backend responses)
            └── HTTP/2 and gRPC support
```

## Installation

```bash
# Ubuntu/Debian
sudo apt install nginx
sudo systemctl enable --now nginx

# Check status and version
sudo systemctl status nginx
nginx -v          # nginx/1.24.0
nginx -t          # Test config syntax

# Key file locations
# /etc/nginx/nginx.conf          Main config
# /etc/nginx/sites-available/    Virtual host configs
# /etc/nginx/sites-enabled/      Symlinks to active configs
# /var/log/nginx/access.log      Access log
# /var/log/nginx/error.log       Error log
# /var/www/html                  Default web root
```

## Core Configuration Concepts

```nginx
# nginx.conf structure
events {
    worker_connections 1024;   # Max connections per worker
}

http {
    # Global settings apply to all servers
    gzip on;
    gzip_types text/plain application/json application/javascript text/css;

    # Include all virtual host configs
    include /etc/nginx/sites-enabled/*;
}
```

## Virtual Hosts (Server Blocks)

```nginx
# /etc/nginx/sites-available/myapp.conf

server {
    listen 80;
    listen [::]:80;
    server_name myapp.com www.myapp.com;

    # Redirect all HTTP to HTTPS
    return 301 https://$host$request_uri;
}

server {
    listen 443 ssl http2;
    listen [::]:443 ssl http2;
    server_name myapp.com www.myapp.com;

    # SSL certificates
    ssl_certificate     /etc/letsencrypt/live/myapp.com/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/myapp.com/privkey.pem;

    # SSL hardening
    ssl_protocols TLSv1.2 TLSv1.3;
    ssl_ciphers ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES128-GCM-SHA256;
    ssl_prefer_server_ciphers off;
    ssl_session_cache shared:SSL:10m;
    ssl_session_timeout 1d;

    # Security headers
    add_header Strict-Transport-Security "max-age=63072000" always;
    add_header X-Frame-Options DENY;
    add_header X-Content-Type-Options nosniff;
    add_header Referrer-Policy no-referrer-when-downgrade;

    # Logging
    access_log /var/log/nginx/myapp_access.log;
    error_log  /var/log/nginx/myapp_error.log;

    # Serve static files directly (fast!)
    location /static/ {
        root /var/www/myapp;
        expires 1y;
        add_header Cache-Control "public, immutable";
    }

    # Proxy to Node.js/Python/whatever backend
    location / {
        proxy_pass         http://127.0.0.1:3000;
        proxy_http_version 1.1;
        proxy_set_header   Upgrade $http_upgrade;
        proxy_set_header   Connection 'upgrade';
        proxy_set_header   Host $host;
        proxy_set_header   X-Real-IP $remote_addr;
        proxy_set_header   X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header   X-Forwarded-Proto $scheme;
        proxy_cache_bypass $http_upgrade;
        proxy_read_timeout 60s;
        proxy_connect_timeout 10s;
    }
}
```

## Load Balancing

```nginx
http {
    # Define upstream group
    upstream api_backend {
        # Load balancing algorithms:
        # (default = round-robin)
        # least_conn;          # Least connections
        # ip_hash;             # Sticky sessions by client IP
        # hash $request_uri;   # Hash-based (consistent)

        server 10.0.0.1:3000 weight=3;   # Gets 3x traffic
        server 10.0.0.2:3000 weight=1;
        server 10.0.0.3:3000 backup;     # Only used when others fail

        # Health checks
        keepalive 32;                     # Persistent connections
    }

    upstream api_backend_ha {
        least_conn;
        server 10.0.1.1:8080 max_fails=3 fail_timeout=30s;
        server 10.0.1.2:8080 max_fails=3 fail_timeout=30s;
        server 10.0.1.3:8080 max_fails=3 fail_timeout=30s;
    }

    server {
        location /api/ {
            proxy_pass http://api_backend;
        }
    }
}
```

## Rate Limiting

```nginx
http {
    # Define rate limit zones
    # $binary_remote_addr = client IP (4 bytes, efficient)
    # zone=api:10m = 10MB shared memory zone named "api"
    # rate=10r/s = max 10 requests per second per IP
    limit_req_zone $binary_remote_addr zone=api:10m rate=10r/s;
    limit_req_zone $binary_remote_addr zone=login:10m rate=2r/m;

    server {
        # Apply rate limit to API
        location /api/ {
            limit_req zone=api burst=20 nodelay;
            # burst=20: allow burst of 20 requests
            # nodelay: serve burst immediately, don't queue
            proxy_pass http://api_backend;
        }

        # Stricter limit for login endpoint
        location /auth/login {
            limit_req zone=login burst=5 nodelay;
            limit_req_status 429;
            proxy_pass http://api_backend;
        }
    }
}
```

## Caching

```nginx
http {
    # Define cache zone
    proxy_cache_path /var/cache/nginx 
        levels=1:2 
        keys_zone=api_cache:10m 
        max_size=1g 
        inactive=60m 
        use_temp_path=off;

    server {
        location /api/public/ {
            proxy_cache api_cache;
            proxy_cache_valid 200 5m;       # Cache 200 responses for 5 min
            proxy_cache_valid 404 1m;       # Cache 404s for 1 min
            proxy_cache_use_stale error timeout updating;
            proxy_cache_background_update on;
            proxy_cache_lock on;

            # Cache key includes URI and query string
            proxy_cache_key "$scheme$request_method$host$request_uri";

            add_header X-Cache-Status $upstream_cache_status;
            proxy_pass http://api_backend;
        }
    }
}
```

## Nginx as Kubernetes Ingress

```yaml
# ingress-nginx controller handles all K8s Ingress resources
# Install via Helm:
# helm install ingress-nginx ingress-nginx/ingress-nginx

apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: myapp-ingress
  annotations:
    # Rate limiting
    nginx.ingress.kubernetes.io/limit-rps: "10"
    # Redirect HTTP to HTTPS
    nginx.ingress.kubernetes.io/ssl-redirect: "true"
    # Custom timeout
    nginx.ingress.kubernetes.io/proxy-read-timeout: "60"
    # Enable CORS
    nginx.ingress.kubernetes.io/enable-cors: "true"
    nginx.ingress.kubernetes.io/cors-allow-origin: "https://myapp.com"
    # Basic auth
    nginx.ingress.kubernetes.io/auth-type: basic
    nginx.ingress.kubernetes.io/auth-secret: basic-auth
spec:
  ingressClassName: nginx
  tls:
  - hosts:
    - api.myapp.com
    secretName: myapp-tls
  rules:
  - host: api.myapp.com
    http:
      paths:
      - path: /v1/
        pathType: Prefix
        backend:
          service:
            name: api-service
            port:
              number: 80
      - path: /auth/
        pathType: Prefix
        backend:
          service:
            name: auth-service
            port:
              number: 80
```

## Performance Tuning

```nginx
# nginx.conf - production tuning
worker_processes auto;          # One worker per CPU core
worker_rlimit_nofile 65535;     # Max open files per worker

events {
    worker_connections 65535;   # Max connections per worker
    use epoll;                  # Linux event model (fastest)
    multi_accept on;            # Accept multiple connections at once
}

http {
    # Disable nginx version in error pages (security)
    server_tokens off;

    # Sendfile — kernel handles file transfer (much faster for static files)
    sendfile on;
    tcp_nopush on;
    tcp_nodelay on;

    # Timeouts
    keepalive_timeout 65;
    keepalive_requests 1000;
    client_header_timeout 10s;
    client_body_timeout 10s;
    send_timeout 10s;

    # Buffer sizes
    client_body_buffer_size 128k;
    client_max_body_size 50m;   # Max upload size
    proxy_buffer_size 4k;
    proxy_buffers 8 4k;

    # Gzip compression
    gzip on;
    gzip_vary on;
    gzip_proxied any;
    gzip_comp_level 6;          # 1-9, 6 is good balance
    gzip_min_length 256;
    gzip_types
        text/plain text/css text/xml text/javascript
        application/json application/javascript application/xml
        image/svg+xml;
}
```

## Useful Commands

```bash
# Test config syntax (always before reload!)
sudo nginx -t

# Reload without dropping connections
sudo nginx -s reload

# Full restart
sudo systemctl restart nginx

# View access log in real-time
sudo tail -f /var/log/nginx/access.log

# View error log
sudo tail -f /var/log/nginx/error.log

# Check which config files are loaded
sudo nginx -T | head -50

# Enable a site
sudo ln -s /etc/nginx/sites-available/myapp.conf /etc/nginx/sites-enabled/
sudo nginx -t && sudo nginx -s reload

# Disable a site
sudo rm /etc/nginx/sites-enabled/myapp.conf
sudo nginx -s reload
```

## Interview Questions

**What is the difference between a reverse proxy and a load balancer?**
A reverse proxy sits in front of one or more servers and forwards client requests to them, hiding the backend from clients. A load balancer distributes incoming requests across multiple backend servers for scalability and high availability. Nginx does both — as a reverse proxy it handles SSL termination, caching, and header manipulation; as a load balancer it distributes traffic using algorithms like round-robin, least_conn, or ip_hash. In practice, the distinction is blurry because every production load balancer is also a reverse proxy.

**What is the difference between `proxy_pass http://backend/` and `proxy_pass http://backend`?**
The trailing slash matters. With `location /api/` and `proxy_pass http://backend/`, nginx strips `/api/` from the URI — `/api/users` becomes `/users` on the backend. Without the slash, `proxy_pass http://backend`, nginx passes the full URI — `/api/users` remains `/api/users`. Most APIs want the trailing slash version to strip the path prefix.
