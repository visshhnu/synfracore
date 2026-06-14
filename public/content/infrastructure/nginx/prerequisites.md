# Nginx — Prerequisites

## What to Know Before Starting Nginx

Nginx is a web server and reverse proxy. It's often one of the first tools DevOps engineers configure.

## Required

### 1. Basic Linux
Nginx is almost always configured on Linux. You need:
```bash
sudo systemctl start/stop/reload nginx   # Service management
sudo nano /etc/nginx/nginx.conf          # Edit config files
sudo nginx -t                            # Test config syntax
tail -f /var/log/nginx/error.log        # Read logs
```

### 2. Basic Networking — Most Important Prerequisite
Nginx is fundamentally a networking tool. You MUST understand:
- **Ports** — HTTP uses port 80, HTTPS uses port 443, apps often use 3000/8080
- **IP addresses** — what `127.0.0.1` (localhost) and `0.0.0.0` mean
- **DNS** — how `mysite.com` resolves to an IP address
- **HTTP request/response** — what a browser sends and what a server returns
- **Reverse proxy concept** — nginx on port 80 forwards requests to app on port 3000

If you run `curl http://localhost:3000` and get a response, but `curl http://localhost:80` fails — Nginx is the missing piece in the middle.

### 3. What You're Serving
Nginx serves or proxies something. Know what that something is:
- A static website (HTML/CSS/JS files in a folder)
- A backend API (Node.js on port 3000, Python Flask on port 5000)
- A Kubernetes service you want to expose

## Nice to Have

### SSL/TLS Basics
Modern Nginx almost always handles HTTPS. Understanding what SSL certificates are and how HTTPS works helps when you get to the TLS configuration sections.

### Docker
Many Nginx deployments run in Docker containers. Basic Docker knowledge helps.

## What You Do NOT Need

- ❌ Apache knowledge (Nginx is different, prior Apache experience helps but isn't required)
- ❌ Programming experience
- ❌ Advanced networking
- ❌ Cloud knowledge (though you'll eventually run Nginx on cloud servers)

## Learning Order

```
Linux basics (essential)
      ↓
Basic networking concepts
      ↓
Nginx Installation
      ↓
Nginx Fundamentals (static files, basic config)
      ↓
Intermediate (reverse proxy, load balancing)
      ↓
Advanced (SSL/TLS, caching, rate limiting, high availability)
```

## Time Estimate

- Serve a static website: 1 day
- Reverse proxy to your app: 2-3 days
- Production HTTPS with load balancing: 1 week
