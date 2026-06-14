# Security Fundamentals — Cheatsheet

```bash
# ── TRIVY (VULNERABILITY SCANNING) ───────────────────────
trivy image nginx:latest --severity HIGH,CRITICAL
trivy image --format json --output scan.json nginx:latest
trivy fs .                          # Scan filesystem
trivy config ./terraform/           # Scan IaC
trivy k8s --report summary cluster  # Scan K8s cluster

# ── GITLEAKS (SECRET DETECTION) ──────────────────────────
gitleaks detect --source . --verbose           # Scan working dir
gitleaks detect --source . --log-opts="--all"  # Scan all history
gitleaks protect --staged                       # Pre-commit hook

# ── OPENSSL (TLS/CERTIFICATES) ────────────────────────────
# Generate self-signed cert
openssl req -x509 -nodes -days 365 -newkey rsa:2048   -keyout server.key -out server.crt   -subj "/C=IN/ST=KA/L=Bangalore/O=Company/CN=localhost"

# Inspect a certificate
openssl x509 -in cert.pem -text -noout
echo | openssl s_client -connect host:443 2>/dev/null | openssl x509 -noout -dates

# Verify cert chain
openssl verify -CAfile ca.crt server.crt

# ── COMMON PORTS ──────────────────────────────────────────
# 22 SSH | 25 SMTP | 53 DNS | 80 HTTP | 443 HTTPS
# 3306 MySQL | 5432 PostgreSQL | 6379 Redis | 27017 MongoDB
# 3389 RDP | 5900 VNC | 389 LDAP | 636 LDAPS | 8080 HTTP-Alt

# ── PERMISSIONS ───────────────────────────────────────────
chmod 755 file    # rwxr-xr-x (owner all, others read+exec)
chmod 644 file    # rw-r--r-- (owner read+write, others read)
chmod 600 file    # rw------- (owner only - for SSH keys)
chmod 400 file    # r-------- (read-only - for private keys)
chown user:group file
find / -perm /4000 2>/dev/null  # Find SUID files (privilege escalation risk)

# ── FIREWALL ──────────────────────────────────────────────
ufw status verbose
ufw allow 443/tcp
ufw deny 23/tcp         # Block Telnet
ufw delete allow 80/tcp

iptables -L -n -v       # List rules
iptables -A INPUT -p tcp --dport 22 -s 10.0.0.0/8 -j ACCEPT
iptables -A INPUT -j DROP

# ── PASSWORD HASHING ──────────────────────────────────────
python3 -c "import hashlib; print(hashlib.sha256(b'password').hexdigest())"
openssl passwd -6 "mypassword"   # SHA-512 (for /etc/shadow)

# ── ENCRYPTION ────────────────────────────────────────────
# AES-256 encrypt file
openssl enc -aes-256-cbc -salt -in file.txt -out file.enc -k "passphrase"
openssl enc -d -aes-256-cbc -in file.enc -out file.txt -k "passphrase"

# GPG encrypt
gpg --encrypt --recipient user@example.com file.txt
gpg --decrypt file.txt.gpg
```
