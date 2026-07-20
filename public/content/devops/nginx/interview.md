# nginx Interview Q&A

**Q: How does nginx handle concurrency differently from a traditional process-per-connection or thread-per-connection server (like older Apache configurations)?**
nginx uses an event-driven, asynchronous architecture — a small, fixed number of worker processes (typically one per CPU core) each handle many thousands of concurrent connections using non-blocking I/O and an event loop, rather than spawning a new process or thread per connection. This is why nginx uses dramatically less memory under high concurrent-connection load than a process/thread-per-connection model — a worker isn't blocked waiting on one slow client while it could be servicing others; the `worker_connections` directive sets the practical ceiling per worker.

**Q: What is the difference between `proxy_pass`, `fastcgi_pass`, and just serving files directly with `root`?**
`root`/`try_files` serves static files directly from disk — no backend process involved, the fastest path for anything that doesn't need to run code. `proxy_pass` forwards the request to another HTTP server (a Node.js app, another nginx, any HTTP backend) and relays the response back — nginx acts as a reverse proxy. `fastcgi_pass` speaks the FastCGI protocol specifically, most commonly to PHP-FPM — used instead of `proxy_pass` because PHP-FPM doesn't speak plain HTTP, it speaks FastCGI. Mixing these up (e.g. trying `proxy_pass` to a PHP-FPM socket) simply doesn't work — the protocols aren't compatible.

**Q: Why would you put static file serving directly in nginx instead of routing everything through the backend application?**
Static assets (images, CSS, JS, fonts) never need application logic to serve — having nginx serve them via `root`/`try_files` directly from disk is dramatically faster and cheaper than round-tripping through an application server that would just read the same file and return it. This is one of the most common, highest-impact nginx optimizations in a typical web app: `location /static/ { root /var/www/app; }` bypassing the backend entirely for anything under `/static/`, while `location /` still proxies to the actual application for real requests.

**Q: A `location ~* \.(jpg|png)$` regex block and a `location /images/` prefix block both technically match a request to `/images/photo.jpg`. Which one actually handles it, and why?**
The regex block wins, even though the prefix block might be defined earlier in the file. nginx's real matching order: an exact match (`=`) first if one exists; then it finds the longest matching prefix location — but rather than using that immediately, it checks all regex (`~`/`~*`) locations in the order they appear in the config, and the first regex match wins over the prefix match, UNLESS the prefix location used the `^~` modifier, which short-circuits regex checking entirely. This ordering is a genuinely common source of "why is my request going to the wrong block" confusion.

**Q: What actually happens if you don't set `proxy_set_header Host $host;` in a reverse-proxy config?**
The backend application receives whatever `Host` value nginx itself would send by default — not the actual `Host` header the client sent. Anything backend-side that depends on the real requested hostname (multi-tenant routing by domain, generating absolute URLs, `Host`-based logic) breaks or produces wrong results, often confusingly rather than with a clear error. Setting `proxy_set_header Host $host;` explicitly forwards the original request's Host header through unchanged.

**Q: Why does `gzip on;` alone often not actually compress most of a site's assets?**
nginx's default `gzip_types` is `text/html` only — enabling `gzip on;` without also specifying `gzip_types` for CSS, JavaScript, JSON, SVG, etc. means only HTML responses get compressed, while everything else (often the bulk of page weight) is served uncompressed. This is a very common misconfiguration precisely because `gzip on;` looks like it should be sufficient on its own.

**Q: What's the difference between `nginx -s reload` and `systemctl restart nginx`, and why does the distinction matter in production?**
A reload (`nginx -s reload` or `systemctl reload nginx`) starts new worker processes with the updated config while letting existing workers finish handling their current connections before exiting — zero downtime, in-flight requests aren't dropped. A full restart stops nginx entirely and starts it again — a real, if usually brief, gap where nginx isn't listening at all. Always run `nginx -t` to validate config syntax before either, but especially before a reload in an automated deploy pipeline, since a config error there should fail the pipeline rather than partially apply.

**Q: How would you rate-limit requests to an API endpoint in nginx?**
```nginx
http {
    limit_req_zone $binary_remote_addr zone=api_limit:10m rate=10r/s;

    server {
        location /api/ {
            limit_req zone=api_limit burst=20 nodelay;
            proxy_pass http://backend;
        }
    }
}
```
`limit_req_zone` defines a shared-memory zone tracking request rate per key (here, per client IP via `$binary_remote_addr`) at a steady-state rate; `limit_req` applies that zone to a specific location, with `burst` allowing a short spike above the steady rate before requests start getting rejected (`nodelay` serves burst requests immediately rather than queuing/delaying them up to the burst limit).

**Q: A site works fine over HTTP but the HTTPS version shows a certificate error. What are the most likely causes, in order of how common they actually are?**
(1) Certificate doesn't match the requested domain (wrong `server_name`, or a cert issued for a different domain/without the right SAN entries) — most common. (2) Certificate has actually expired — check with `openssl x509 -in cert.pem -noout -enddate`, and if using Certbot, confirm the renewal cron/systemd timer is actually running, not just configured. (3) Incomplete certificate chain — `ssl_certificate` needs the *fullchain* (cert + intermediate CA certs), not just the leaf certificate alone, or some clients will fail verification even though browsers with cached intermediate certs might not show an error. (4) `listen 443 ssl` block simply doesn't exist or isn't matching the right `server_name` for that domain at all.
