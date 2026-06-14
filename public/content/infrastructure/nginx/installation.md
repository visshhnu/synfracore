# Nginx — Installation Guide

## Install Nginx

### Ubuntu / Debian
```bash
sudo apt update
sudo apt install nginx -y
sudo systemctl enable --now nginx
sudo systemctl status nginx

# Verify
curl http://localhost
# Returns nginx welcome page HTML
```

### Amazon Linux / RHEL / CentOS
```bash
sudo yum install nginx -y    # Amazon Linux 2
# or
sudo dnf install nginx -y    # Amazon Linux 2023 / RHEL 9

sudo systemctl enable --now nginx
curl http://localhost
```

### macOS (Development Only)
```bash
brew install nginx
nginx                        # Start nginx
# Access at http://localhost:8080
nginx -s stop                # Stop
```

### Docker (Fastest for Testing)
```bash
docker run -d --name nginx -p 8080:80 nginx:alpine
curl http://localhost:8080

# With custom config
docker run -d --name nginx \
  -p 8080:80 \
  -v $(pwd)/nginx.conf:/etc/nginx/nginx.conf:ro \
  -v $(pwd)/html:/usr/share/nginx/html:ro \
  nginx:alpine
```

## Key Files and Directories

```bash
/etc/nginx/nginx.conf          # Main config file
/etc/nginx/conf.d/             # Virtual host configs (include *.conf)
/etc/nginx/sites-available/    # Ubuntu: available sites
/etc/nginx/sites-enabled/      # Ubuntu: enabled sites (symlinks)
/var/log/nginx/access.log      # Access logs
/var/log/nginx/error.log       # Error logs
/usr/share/nginx/html/         # Default web root
/var/run/nginx.pid             # PID file
```

## Your First Virtual Host

```bash
# Create a simple site
sudo mkdir -p /var/www/mysite
echo "<h1>My Site</h1>" | sudo tee /var/www/mysite/index.html

# Create server block config
sudo tee /etc/nginx/conf.d/mysite.conf << 'EOF'
server {
    listen 80;
    server_name mysite.local;
    root /var/www/mysite;
    index index.html;

    location / {
        try_files $uri $uri/ =404;
    }
}
EOF

# Test config syntax
sudo nginx -t
# nginx: configuration file /etc/nginx/nginx.conf test is successful

# Reload (no downtime)
sudo systemctl reload nginx

# Test
curl -H "Host: mysite.local" http://localhost
# Returns: <h1>My Site</h1>
```

## Essential Commands

```bash
sudo nginx -t                    # Test config (always before reload)
sudo systemctl reload nginx      # Reload config (zero downtime)
sudo systemctl restart nginx     # Full restart (brief downtime)
sudo nginx -s reload             # Alternative reload
sudo tail -f /var/log/nginx/access.log   # Watch live traffic
sudo tail -f /var/log/nginx/error.log    # Watch errors
```

## Firewall (Allow HTTP/HTTPS)

```bash
# Ubuntu with ufw
sudo ufw allow 'Nginx Full'    # HTTP + HTTPS
sudo ufw allow 'Nginx HTTP'    # HTTP only
sudo ufw status

# RHEL/CentOS with firewalld
sudo firewall-cmd --permanent --add-service=http
sudo firewall-cmd --permanent --add-service=https
sudo firewall-cmd --reload
```

## Next Steps

Nginx is serving traffic. Go to **Fundamentals** to learn reverse proxy, load balancing, and SSL/TLS configuration.
