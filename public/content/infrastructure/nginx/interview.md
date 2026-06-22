# Nginx Interview Questions

## Core Concepts

**Q: What is Nginx? How does it differ from Apache?**

Nginx is a high-performance web server, reverse proxy, and load balancer. Originally designed to solve the C10K problem — handling 10,000+ concurrent connections efficiently.

**Architecture difference:**
- **Apache**: Process/thread per connection (MPM prefork/worker) — high memory per connection
- **Nginx**: Event-driven, non-blocking I/O with small number of worker processes — serves thousands of connections with low memory

**Nginx uses:**
- Static file serving (HTML, CSS, JS, images)
- Reverse proxy (forward requests to backend apps)
- Load balancer (upstream groups)
- SSL/TLS termination
- HTTP/2 and HTTP/3
- Rate limiting and access control
- API gateway

---

**Q: Core Nginx configuration — explain the structure.**

```nginx
# /etc/nginx/nginx.conf

user nginx;
worker_processes auto;        # Match CPU cores
error_log /var/log/nginx/error.log warn;
pid /run/nginx.pid;

events {
    worker_connections 1024;  # Max connections per worker
    use epoll;                # Linux event mechanism (default on Linux)
    multi_accept on;          # Accept multiple connections at once
}

http {
    include mime.types;
    default_type application/octet-stream;
    
    # Logging
    log_format main '$remote_addr - $request_time $status $body_bytes_sent';
    access_log /var/log/nginx/access.log main;
    
    # Performance
    sendfile on;              # Kernel-level file serving
    tcp_nopush on;            # Send headers+file in one packet
    keepalive_timeout 65;     # Connection keep-alive
    gzip on;                  # Compress responses
    gzip_types text/plain text/css application/json application/javascript;

    # Upstream (load balancing)
    upstream backend {
        least_conn;           # Least connections algorithm
        server app1:8080 weight=3;
        server app2:8080 weight=1;
        server app3:8080 backup;  # Only if others fail
        keepalive 32;         # Keep connections to upstream alive
    }

    server {
        listen 80;
        server_name synfracore.com www.synfracore.com;
        return 301 https://$host$request_uri;  # Redirect to HTTPS
    }

    server {
        listen 443 ssl http2;
        server_name synfracore.com;

        ssl_certificate     /etc/ssl/certs/synfracore.crt;
        ssl_certificate_key /etc/ssl/private/synfracore.key;
        ssl_protocols TLSv1.2 TLSv1.3;
        ssl_ciphers ECDHE-RSA-AES128-GCM-SHA256:ECDHE-RSA-AES256-GCM-SHA384;
        ssl_session_cache shared:SSL:10m;

        # Security headers
        add_header X-Frame-Options DENY;
        add_header X-Content-Type-Options nosniff;
        add_header Strict-Transport-Security "max-age=31536000; includeSubDomains";
        add_header Content-Security-Policy "default-src 'self'";

        # Rate limiting zone: 10MB zone, 10 requests/second per IP
        limit_req_zone $binary_remote_addr zone=api:10m rate=10r/s;

        location /api/ {
            limit_req zone=api burst=20 nodelay;  # Allow burst of 20
            
            proxy_pass http://backend;
            proxy_set_header Host $host;
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header X-Forwarded-Proto $scheme;
            
            proxy_connect_timeout 10s;
            proxy_read_timeout 60s;
            proxy_buffering on;
        }

        location /static/ {
            root /var/www;
            expires 30d;          # Cache static files
            add_header Cache-Control "public, immutable";
            
            # Enable gzip for static files
            gzip_static on;
        }

        location /health {
            access_log off;       # Don't log health checks
            return 200 "OK
";
        }
    }
}
```

---

**Q: Nginx as ingress controller in Kubernetes.**

```yaml
# Install nginx ingress controller
helm upgrade --install nginx-ingress ingress-nginx/ingress-nginx   --set controller.replicaCount=2   --set controller.service.type=LoadBalancer

# Ingress resource
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: my-ingress
  annotations:
    nginx.ingress.kubernetes.io/rewrite-target: /
    nginx.ingress.kubernetes.io/rate-limit: "100"
    nginx.ingress.kubernetes.io/ssl-redirect: "true"
    nginx.ingress.kubernetes.io/proxy-read-timeout: "60"
    cert-manager.io/cluster-issuer: "letsencrypt-prod"
spec:
  ingressClassName: nginx
  tls:
  - hosts: [api.synfracore.com]
    secretName: synfracore-tls
  rules:
  - host: api.synfracore.com
    http:
      paths:
      - path: /api
        pathType: Prefix
        backend:
          service:
            name: api-service
            port:
              number: 8080
      - path: /
        pathType: Prefix
        backend:
          service:
            name: frontend-service
            port:
              number: 3000
```

---

**Q: Common Nginx performance tuning and debugging.**

```bash
# Test config before reload
nginx -t

# Reload without downtime
nginx -s reload

# Check error logs
tail -f /var/log/nginx/error.log

# Check which config nginx uses
nginx -V 2>&1 | grep "configure arguments"

# Performance tuning checklist:
# worker_processes auto; (match CPUs)
# worker_connections 4096; (increase for high traffic)
# keepalive_timeout 65;
# gzip on; (reduce bandwidth 60-80%)
# sendfile on; tcp_nopush on; (efficient file serving)
# upstream keepalive 32; (reuse connections to backend)
# proxy_cache (cache backend responses)

# Common error: 502 Bad Gateway → backend is down or unreachable
# 503 Service Unavailable → all upstreams failed/at capacity
# 504 Gateway Timeout → backend too slow (increase proxy_read_timeout)
```

## Revision Notes
```
NGINX: Event-driven (not process-per-connection like Apache). Low memory, high concurrency.
Uses: static files, reverse proxy, SSL termination, load balancer, rate limiting

CONFIG STRUCTURE: events{} + http{ upstream{} server{ location{} } }
UPSTREAM: backend pool with algorithms (least_conn, ip_hash, round_robin)
location: match URL paths → proxy_pass or static files

SSL: ssl_certificate + ssl_certificate_key | TLSv1.2/1.3 only | ECDHE ciphers
SECURITY HEADERS: X-Frame-Options, X-Content-Type-Options, HSTS, CSP

RATE LIMITING: limit_req_zone + limit_req (per IP, burst allowed)
PROXY HEADERS: X-Real-IP, X-Forwarded-For, X-Forwarded-Proto (backend sees real IP)
CACHING: proxy_cache for backend | expires + Cache-Control for static

K8S INGRESS: nginx-ingress controller + Ingress resource
Annotations: rate-limit, ssl-redirect, rewrite-target, timeouts
cert-manager auto-provisions TLS certificates

DEBUG:
nginx -t (test config) | nginx -s reload (zero-downtime reload)
502 = backend down | 503 = all upstreams failed | 504 = backend too slow
```
