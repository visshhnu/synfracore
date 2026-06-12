# Nginx — Advanced

## Lua Scripting with OpenResty

```lua
-- OpenResty (Nginx + LuaJIT) for advanced request handling
-- Install: openresty package or use openresty Docker image

-- Dynamic rate limiting per user (from JWT claims)
-- nginx.conf:
-- lua_shared_dict rate_limits 10m;

local ratelimit = require "resty.limit.count"
local lim = ratelimit.new("rate_limits", 100, 60)  -- 100 req/min

local key = ngx.var.http_authorization
local delay, err = lim:incoming(key, true)

if not delay then
    if err == "rejected" then
        ngx.status = 429
        ngx.say('{"error": "rate_limit_exceeded"}')
        ngx.exit(ngx.HTTP_TOO_MANY_REQUESTS)
    end
end

-- JWT validation in Nginx (before routing to upstream)
local jwt = require "resty.jwt"
local token = ngx.var.cookie_jwt or ngx.req.get_headers()["Authorization"]:match("Bearer (.+)")
local verified = jwt:verify("my-secret", token)

if not verified.verified then
    ngx.status = 401
    ngx.exit(ngx.HTTP_UNAUTHORIZED)
end

ngx.var.user_id = verified.payload.sub
```

## Performance Tuning

```nginx
# /etc/nginx/nginx.conf — full production config
user nginx;
worker_processes auto;                    # Match CPU cores
worker_rlimit_nofile 65535;               # Max open files per worker

events {
    worker_connections 4096;              # Per worker
    use epoll;                            # Linux I/O multiplexing
    multi_accept on;                      # Accept all pending connections
    accept_mutex off;                     # Better for high traffic
}

http {
    # Sendfile — OS handles file transfer (bypass userspace)
    sendfile on;
    tcp_nopush on;                        # Batch TCP packets
    tcp_nodelay on;                       # Disable Nagle for real-time

    # Timeouts — critical for connection management
    keepalive_timeout 65;
    client_header_timeout 10;
    client_body_timeout 10;
    send_timeout 30;
    reset_timedout_connection on;

    # Buffer sizes
    client_body_buffer_size 16k;
    client_max_body_size 100m;
    client_header_buffer_size 1k;
    large_client_header_buffers 4 8k;

    # Open file cache — reduces filesystem syscalls
    open_file_cache max=10000 inactive=20s;
    open_file_cache_valid 30s;
    open_file_cache_min_uses 2;
    open_file_cache_errors on;

    # Gzip
    gzip on;
    gzip_vary on;
    gzip_proxied any;
    gzip_comp_level 6;
    gzip_min_length 1024;
    gzip_types text/plain text/css application/json application/javascript
               text/xml application/xml application/xml+rss text/javascript
               image/svg+xml;
}
```

## Nginx Unit (Modern App Server)

```json
// Nginx Unit — dynamic, API-driven config without reload
// Runs Python, Node.js, PHP, Java, Go directly
// POST config changes to API at runtime — zero reload

// Start with: unitd
// Config API at: http://localhost:8080

// Deploy a Python app
curl -X PUT http://localhost:8080/config \
  -H "Content-Type: application/json" \
  -d '{
    "listeners": {
      "*:8000": {"pass": "applications/myapp"}
    },
    "applications": {
      "myapp": {
        "type": "python 3.12",
        "path": "/opt/myapp",
        "module": "wsgi",
        "callable": "app",
        "processes": {"spare": 2, "max": 10},
        "limits": {"timeout": 30}
      }
    }
  }'

// Hot deploy — update without downtime
curl -X PUT http://localhost:8080/config/applications/myapp/module \
  -d '"wsgi_v2"'  // Switch to new module instantly
```
