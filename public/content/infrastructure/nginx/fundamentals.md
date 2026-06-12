# Nginx — Fundamentals

## Configuration Structure

```nginx
# /etc/nginx/nginx.conf
user nginx;
worker_processes auto;          # Match CPU cores
error_log /var/log/nginx/error.log warn;
pid /var/run/nginx.pid;

events {
    worker_connections 1024;    # Max connections per worker
    use epoll;                  # Linux event model
    multi_accept on;
}

http {
    include /etc/nginx/mime.types;
    default_type application/octet-stream;

    # Logging format
    log_format main '$remote_addr - $remote_user [$time_local] '
                    '"$request" $status $body_bytes_sent '
                    '"$http_referer" "$http_user_agent" '
                    'rt=$request_time uct=$upstream_connect_time';

    access_log /var/log/nginx/access.log main;

    sendfile on;
    tcp_nopush on;
    keepalive_timeout 65;
    gzip on;
    gzip_types text/plain application/json application/javascript text/css;

    include /etc/nginx/conf.d/*.conf;    # Site configs
}
```

## Reverse Proxy

```nginx
# /etc/nginx/conf.d/app.conf
upstream app_backend {
    least_conn;                 # Load balancing method
    server 127.0.0.1:3000;
    server 127.0.0.1:3001;
    server 127.0.0.1:3002;
    keepalive 32;               # Keep connections to upstream
}

server {
    listen 80;
    server_name app.example.com;
    return 301 https://$host$request_uri;   # Redirect HTTP → HTTPS
}

server {
    listen 443 ssl http2;
    server_name app.example.com;

    ssl_certificate     /etc/ssl/certs/app.crt;
    ssl_certificate_key /etc/ssl/private/app.key;
    ssl_protocols       TLSv1.2 TLSv1.3;
    ssl_ciphers         HIGH:!aNULL:!MD5;
    ssl_session_cache   shared:SSL:10m;

    # Security headers
    add_header X-Frame-Options DENY;
    add_header X-Content-Type-Options nosniff;
    add_header Strict-Transport-Security "max-age=31536000" always;
    add_header Content-Security-Policy "default-src 'self'";

    location / {
        proxy_pass http://app_backend;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_cache_bypass $http_upgrade;
        proxy_connect_timeout 10s;
        proxy_send_timeout 60s;
        proxy_read_timeout 60s;
    }

    # Static files — serve directly (bypass backend)
    location /static/ {
        alias /var/www/app/static/;
        expires 1y;
        add_header Cache-Control "public, immutable";
        access_log off;
    }

    # Health check endpoint
    location /health {
        access_log off;
        proxy_pass http://app_backend;
    }
}
```

## Static Site Hosting

```nginx
server {
    listen 80;
    server_name static.example.com;
    root /var/www/html;
    index index.html;

    # SPA routing — send all requests to index.html
    location / {
        try_files $uri $uri/ /index.html;
    }

    # API proxy
    location /api/ {
        proxy_pass http://api-backend:8080/;
    }

    # Gzip for static assets
    gzip_static on;              # Serve pre-compressed .gz files if present

    # Cache control by file type
    location ~* \.(jpg|jpeg|png|gif|ico|svg|woff2)$ {
        expires 1y;
        add_header Cache-Control "public, immutable";
    }
    location ~* \.(css|js)$ {
        expires 1M;
        add_header Cache-Control "public";
    }
}
```

## Rate Limiting

```nginx
http {
    # Define rate limit zones
    limit_req_zone $binary_remote_addr zone=api:10m rate=10r/s;
    limit_req_zone $binary_remote_addr zone=login:10m rate=5r/m;

    server {
        location /api/ {
            limit_req zone=api burst=20 nodelay;
            limit_req_status 429;
            proxy_pass http://backend;
        }

        location /api/auth/login {
            limit_req zone=login burst=3 nodelay;
            proxy_pass http://backend;
        }
    }
}
```

## Key CLI Commands

```bash
# Test configuration before reloading
nginx -t
nginx -T                         # Test + dump full config

# Reload (zero-downtime)
nginx -s reload
systemctl reload nginx

# Restart (brief downtime)
systemctl restart nginx

# View logs
tail -f /var/log/nginx/access.log
tail -f /var/log/nginx/error.log

# Parse access logs for analytics
awk '{print $9}' /var/log/nginx/access.log | sort | uniq -c | sort -rn
# HTTP status code distribution

awk '{print $7}' /var/log/nginx/access.log | sort | uniq -c | sort -rn | head -20
# Top 20 requested URLs

awk '{print $1}' /var/log/nginx/access.log | sort | uniq -c | sort -rn | head -10
# Top 10 client IPs
```
