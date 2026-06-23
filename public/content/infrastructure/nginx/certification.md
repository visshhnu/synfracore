# NGINX Certification Guide

## Certifications Available

| Cert | Provider | Format | Focus |
|------|----------|--------|-------|
| **NCP-N** | F5/NGINX | Multiple choice + lab | NGINX Core |
| **NCP-K8s** | F5/NGINX | Multiple choice + lab | NGINX on Kubernetes |

NGINX knowledge also tested in: **CKA/CKAD** (Ingress controllers), **AWS SAA** (ALB comparison).

---

## Core Configuration Patterns

```nginx
# /etc/nginx/nginx.conf — main config structure
user nginx;
worker_processes auto;          # = number of CPU cores
error_log /var/log/nginx/error.log warn;
pid /run/nginx.pid;

events {
    worker_connections 1024;    # Max connections per worker
    use epoll;                  # Linux kernel event model (best for Linux)
    multi_accept on;
}

http {
    include       /etc/nginx/mime.types;
    default_type  application/octet-stream;

    log_format main '$remote_addr - $remote_user [$time_local] "$request" '
                    '$status $body_bytes_sent "$http_referer" '
                    '"$http_user_agent"';
    access_log /var/log/nginx/access.log main;

    sendfile on;
    tcp_nopush on;
    keepalive_timeout 65;
    gzip on;

    include /etc/nginx/conf.d/*.conf;
}
```

```nginx
# Virtual host — static site
server {
    listen 80;
    listen 443 ssl http2;
    server_name example.com www.example.com;

    ssl_certificate /etc/letsencrypt/live/example.com/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/example.com/privkey.pem;
    ssl_protocols TLSv1.2 TLSv1.3;
    ssl_ciphers HIGH:!aNULL:!MD5;

    root /var/www/html;
    index index.html;

    location / {
        try_files $uri $uri/ =404;
    }

    # Redirect HTTP to HTTPS
    if ($scheme != "https") {
        return 301 https://$host$request_uri;
    }
}

# Reverse proxy to backend
server {
    listen 80;
    server_name api.example.com;

    location / {
        proxy_pass http://backend:8080;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_connect_timeout 30s;
        proxy_read_timeout 60s;
    }
}

# Load balancing
upstream backend {
    least_conn;                     # Algorithm: least connections
    # Round robin is default (no directive)
    # ip_hash: session persistence
    keepalive 32;                   # Persistent connections to backends

    server backend1:8080 weight=3;
    server backend2:8080 weight=1;
    server backend3:8080 backup;    # Only used when others are down
    server backend4:8080 down;      # Temporarily unavailable
}
```

---

## Rate Limiting & Security

```nginx
http {
    # Define rate limit zone (10MB zone, 10 requests/second per IP)
    limit_req_zone $binary_remote_addr zone=api:10m rate=10r/s;
    limit_conn_zone $binary_remote_addr zone=conn:10m;

    server {
        location /api/ {
            limit_req zone=api burst=20 nodelay;  # Allow burst of 20
            limit_conn conn 10;                   # Max 10 connections per IP
            limit_req_status 429;                 # Return 429 Too Many Requests
        }

        # Geo-based access control
        location /admin/ {
            allow 10.0.0.0/8;
            allow 192.168.1.0/24;
            deny all;
        }

        # Hide server version
        server_tokens off;

        # Security headers
        add_header X-Frame-Options SAMEORIGIN;
        add_header X-Content-Type-Options nosniff;
        add_header X-XSS-Protection "1; mode=block";
        add_header Strict-Transport-Security "max-age=31536000" always;
    }
}
```

---

## NGINX as Kubernetes Ingress

```yaml
# Annotations control NGINX behavior per Ingress
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  annotations:
    nginx.ingress.kubernetes.io/rewrite-target: /
    nginx.ingress.kubernetes.io/rate-limit: "100"
    nginx.ingress.kubernetes.io/ssl-redirect: "true"
    nginx.ingress.kubernetes.io/proxy-read-timeout: "60"
spec:
  ingressClassName: nginx
  tls:
    - hosts: [api.example.com]
      secretName: tls-secret
  rules:
    - host: api.example.com
      http:
        paths:
          - path: /
            pathType: Prefix
            backend:
              service: {name: api-svc, port: {number: 80}}
```

## Revision Notes
```
NGINX CONTEXTS: main → events → http → server → location
  Directives inherit downward, can be overridden at lower level

LOCATION MATCHING (priority order):
  = exact | ^~ prefix (stops search) | ~ regex (case sensitive)
  ~* regex (case insensitive) | / prefix (default)

UPSTREAM (load balancing):
  round-robin (default) | least_conn | ip_hash | random | hash
  server weight, backup, down flags

RATE LIMITING:
  limit_req_zone: define zone in http block
  limit_req zone=name burst=N nodelay: apply in server/location

PROXY HEADERS: always set X-Real-IP + X-Forwarded-For + Host
SSL: TLSv1.2+, strong ciphers, HSTS header

NGINX INGRESS: most popular K8s ingress controller
  Configure via annotations | ingressClassName: nginx
```
