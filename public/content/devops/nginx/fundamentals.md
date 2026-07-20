# nginx — Fundamentals

## The Config File Structure: Contexts and Inheritance

nginx configuration is organized into nested **contexts** (blocks), and settings inherit downward — a directive set in a parent context applies to every child context unless that child explicitly overrides it:

```
main context (top level -- worker processes, user, global settings)
└── http { }           # HTTP-wide settings (logging, gzip, MIME types)
    └── server { }      # one virtual host -- matched by listen port + server_name
        └── location { }  # one URL path pattern within that server
```
```nginx
http {
    gzip on;                        # applies to every server block below, unless overridden

    server {
        listen 80;
        server_name example.com;

        location /api/ {
            gzip off;                # overrides the http-level setting, for THIS location only
        }
    }
}
```
Understanding this inheritance is what makes a large, multi-site nginx config actually predictable rather than a mystery — a directive's effective value for any given request is determined by walking from `http` down through `server` to the matching `location`, with the most specific context winning.

## `location` Block Matching — Order and Modifiers Matter

nginx doesn't just match `location` blocks top-to-bottom — the modifier prefix changes matching behavior entirely:

```nginx
location = /exact-path    { }   # exact match only, highest priority when it matches
location ^~ /static/      { }   # prefix match, but STOPS regex matching if this prefix matches
location ~ \.php$         { }   # case-sensitive regex match
location ~* \.(jpg|png)$  { }   # case-INsensitive regex match
location /                { }   # plain prefix match, lowest priority (matches almost everything)
```
nginx's actual matching order: exact match (`=`) first if one exists; then the longest matching prefix, but if that prefix used `^~`, regex checks are skipped entirely and it wins immediately; otherwise, regex locations (`~`/`~*`) are checked in the order they appear in the config, first match wins; if nothing else matched, the longest plain prefix match is used. This is a genuinely common source of "why is this request going to the wrong location block" confusion — a plain `location /images/` can lose to a `location ~* \.(jpg|png)$` regex block even though the prefix block appears first in the file, because regex blocks are checked before falling back to the longest-prefix rule.

## Reverse Proxy Basics — What `proxy_pass` Actually Does and Doesn't Do

```nginx
location /api/ {
    proxy_pass http://127.0.0.1:3000/;
    proxy_set_header Host $host;
    proxy_set_header X-Real-IP $remote_addr;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_set_header X-Forwarded-Proto $scheme;
}
```
Without the `proxy_set_header` lines, the backend application sees every request as coming from nginx's own IP with the `Host` header nginx itself would send — not the real client's IP or the original requested host. This breaks anything backend-side that depends on knowing the real client (rate limiting by IP, geolocation, logging, `Host`-based routing) — these four headers are close to mandatory for any real reverse-proxy setup, not optional extras.

**A subtle, easy-to-miss detail**: `proxy_pass http://127.0.0.1:3000/;` (trailing slash) replaces the matched `location` prefix in the forwarded URL; `proxy_pass http://127.0.0.1:3000;` (no trailing slash) appends the full original URI instead. For `location /api/` with a request to `/api/users`, the first form forwards `/users` to the backend, the second forwards `/api/users` — genuinely different behavior from one trailing character, and a common source of "why is the backend getting the wrong path" bugs.

## TLS/SSL — the Minimum That's Actually Current

```nginx
server {
    listen 443 ssl;
    http2 on;                                    # nginx 1.25.1+: standalone directive, not a listen parameter
    server_name example.com;

    ssl_certificate     /etc/letsencrypt/live/example.com/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/example.com/privkey.pem;
    ssl_protocols TLSv1.2 TLSv1.3;                # do not include TLSv1.0/1.1 -- both deprecated, insecure
    ssl_ciphers HIGH:!aNULL:!MD5;
    ssl_prefer_server_ciphers on;
}
```
Certbot (Let's Encrypt's ACME client) is the common way to actually obtain and auto-renew a real certificate: `certbot --nginx -d example.com` handles both certificate issuance and the nginx config changes to use it, plus sets up automatic renewal — worth knowing this exists rather than assuming certificates are always manually managed.

## Logging — Know What You're Actually Recording

```nginx
log_format main '$remote_addr - $remote_user [$time_local] "$request" '
                 '$status $body_bytes_sent "$http_referer" '
                 '"$http_user_agent"';

access_log /var/log/nginx/access.log main;
error_log /var/log/nginx/error.log warn;
```
`$status` is the response status code sent to the client — filtering for it is the standard way to find errors after the fact: `awk '$9 == 500' /var/log/nginx/access.log` (field position depends on the exact `log_format` used — count fields carefully against your own format string, not this example's, since a differently-ordered `log_format` shifts the field number). `error_log ... warn` sets the minimum severity actually written — `debug` is far more verbose (and requires nginx to be compiled with `--with-debug`), `error`/`crit` are progressively quieter.

## Testing and Reloading — Never Skip the Test Step

```bash
sudo nginx -t              # test config syntax WITHOUT applying it -- always run this before reloading
sudo systemctl reload nginx    # apply config changes with zero downtime (graceful worker restart)
sudo systemctl restart nginx   # full restart -- brief downtime, only needed for binary upgrades or some module changes
```
`nginx -t` catching a syntax error *before* a reload is the difference between a clean config change and taking the server down on a typo — reload/restart will refuse to apply a config with an actual syntax error, but it's still worth confirming with `-t` first as a matter of habit, especially in any scripted/CI deploy path where a bad config should fail the pipeline rather than partially apply.
