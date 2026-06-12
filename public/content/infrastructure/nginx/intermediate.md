# Nginx — Intermediate

## Advanced Proxy Configuration

```nginx
# Upstream with health checks and connection limits
upstream api_backend {
    # Load balancing method
    least_conn;

    # Servers with health check parameters
    server app1:3000 max_fails=3 fail_timeout=30s weight=2;
    server app2:3000 max_fails=3 fail_timeout=30s weight=2;
    server app3:3000 max_fails=3 fail_timeout=30s backup;  # Only used if others fail

    # Connection pooling to upstream
    keepalive 32;           # Keep 32 idle connections
    keepalive_timeout 65s;
    keepalive_requests 100;
}

server {
    listen 443 ssl http2;

    # Cache frequently accessed responses
    location /api/public/ {
        proxy_cache api_cache;
        proxy_cache_valid 200 5m;           # Cache 200 responses for 5 min
        proxy_cache_valid 404 1m;
        proxy_cache_use_stale error timeout; # Serve stale if upstream is down
        proxy_cache_lock on;                 # Only one request fills cache (no stampede)
        add_header X-Cache-Status $upstream_cache_status;

        proxy_pass http://api_backend;
        proxy_http_version 1.1;
        proxy_set_header Connection "";      # Required for keepalive
    }

    # WebSocket support
    location /ws {
        proxy_pass http://api_backend;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection "upgrade";
        proxy_read_timeout 86400s;           # Keep WebSocket alive for 24h
        proxy_send_timeout 86400s;
    }

    # Streaming/SSE (Server-Sent Events)
    location /api/stream {
        proxy_pass http://api_backend;
        proxy_buffering off;                 # Disable buffering for streaming
        proxy_cache off;
        proxy_set_header X-Accel-Buffering no;
        keepalive_timeout 0;
    }
}

# Cache zone definition (in http block)
proxy_cache_path /var/cache/nginx levels=1:2 keys_zone=api_cache:10m
                 max_size=1g inactive=60m use_temp_path=off;
```

## SSL/TLS Hardening

```nginx
# /etc/nginx/snippets/ssl-params.conf — reusable SSL config
ssl_protocols TLSv1.2 TLSv1.3;
ssl_ciphers ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-CHACHA20-POLY1305:ECDHE-RSA-CHACHA20-POLY1305:DHE-RSA-AES128-GCM-SHA256;
ssl_prefer_server_ciphers off;    # TLS 1.3 client chooses (better)
ssl_session_cache shared:SSL:10m;
ssl_session_timeout 1d;
ssl_session_tickets off;          # Forward secrecy
ssl_stapling on;                  # OCSP stapling (faster cert validation)
ssl_stapling_verify on;
resolver 8.8.8.8 8.8.4.4 valid=300s;
resolver_timeout 5s;

# HSTS (tells browsers HTTPS only for 1 year)
add_header Strict-Transport-Security "max-age=31536000; includeSubDomains; preload" always;

# Include in server block:
# include snippets/ssl-params.conf;
```

## Nginx as API Gateway

```nginx
# Route /api/v1/users → user-service
# Route /api/v1/orders → order-service
# Authentication at gateway level

http {
    # Auth endpoint (reused by multiple locations)
    # auth_request_set extracts JWT claims for downstream use
    server {
        location / {
            # Validate JWT with auth service
            auth_request /auth/validate;
            auth_request_set $user_id $upstream_http_x_user_id;

            # Pass validated user info downstream
            proxy_set_header X-User-ID $user_id;
            proxy_pass http://backend;
        }

        # Internal auth endpoint (not accessible externally)
        location = /auth/validate {
            internal;
            proxy_pass http://auth-service/validate;
            proxy_pass_request_body off;
            proxy_set_header Content-Length "";
            proxy_set_header X-Original-URI $request_uri;
        }
    }
}
```
